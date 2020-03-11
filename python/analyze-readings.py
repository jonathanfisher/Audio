import os
import csv
import sys
import numpy as np
import pickle
import scipy.fftpack
import scipy.signal
import matplotlib.pyplot as plt


def load_data(csv_filename):
    pckl_file = os.path.splitext(csv_filename)[0] + '.pckl'
    if os.path.exists(pckl_file):
        with open(pckl_file, 'rb') as f:
            time, samples = pickle.load(f)
    else:
        time, samples = [], []
        with open(csv_filename, 'r') as f:
            reader = csv.DictReader(f)
            print('Names: {}'.format(reader.fieldnames))

            for row in reader:
                v = 0
                if len(reader.fieldnames) == 2:
                    a, b = row
                    v = float(row[b])
                elif len(reader.fieldnames) == 3:
                    a, b, c = row
                    v = float(row[b]) - float(row[c])

                time.append(float(row[a]))
                samples.append(v)

        with open(pckl_file, 'wb') as f:
            pickle.dump([time, samples], f)
    return time, samples


def welch(time, samples):
    sample_time = time[1] - time[0]
    Fs = 1 / sample_time
    print('Sampling rate: {} Hz'.format(Fs))

    window_size = 4096
    f, Pxx_den = scipy.signal.welch(samples, Fs, nperseg=window_size, nfft=2 * window_size, scaling="density",
                                    detrend=False)

    plt.subplot(2, 1, 1)
    plt.plot(time, samples)
    plt.ylabel('Signal (V)')
    plt.xlabel('Time (s)')

    plt.subplot(2, 1, 2)
    plt.semilogy(f, Pxx_den)
    plt.xlim([0, 20000])
    plt.xlabel('frequency [Hz]')
    plt.ylabel('PSD [V**2/Hz]')
    plt.show()


def manual(time, samples):
    sampling_time = time[1] - time[0]

    samples_fft = scipy.fftpack.rfft(samples)
    freq = scipy.fftpack.rfftfreq(len(time), d=sampling_time)

    fig, ax = plt.subplots()
    # plt.plot(freq, np.abs(samples_fft) / len(samples_fft))
    ax.plot(freq, 10 * np.log10(np.abs(samples_fft) / len(samples_fft) / 6))
    plt.xscale('log')
    plt.grid(True, which='both')
    plt.show()


def a_weight(f):
    K_a = 1.258905
    F1 = 20.60
    F2 = 107.7
    F3 = 737.9
    F4 = 12194

    f_1 = (f / F1)
    f_2 = (f / F2)
    f_3 = (f / F3)
    f_4 = (f / F4)

    A = (f_1 ** 2) / (1 + (f_1 ** 2))
    B = f_2 / np.sqrt(1 + (f_2 ** 2))
    C = f_3 / np.sqrt(1 + (f_3 ** 2))
    D = 1 / (1 + (f_4 ** 2))

    return K_a * A * B * C * D


def apply_a_weighting(signal):
    f = np.linspace(20, 20000)
    s = a_weight(f)
    plt.plot(f, 20 * np.log10(s))
    plt.xscale('log')
    plt.grid(True, which='both')
    plt.show()
    print('Max: {}'.format(max(s)))


def analyze(time, samples, noise_time=None, noise_samples=None):
    sample_time = time[1] - time[0]

    windowingFunc = np.blackman(len(samples))
    modified_samples = windowingFunc * samples

    modified_noise = None
    if noise_samples is not None:
        modified_noise = windowingFunc * noise_samples

    samples_fft = scipy.fftpack.fft(modified_samples, n=2*len(modified_samples)) / len(modified_samples)
    f = scipy.fftpack.fftfreq(len(samples_fft), d=sample_time)

    noise_fft, noise_f = None, None
    if modified_noise is not None:
        noise_fft = scipy.fftpack.fft(modified_noise) / len(modified_noise)
        noise_f = scipy.fftpack.fftfreq(len(noise_time), d=(noise_time[1] - noise_time[0]))

    logData = 20 * np.log10(np.abs(samples_fft))
    logNoise = None
    if noise_fft is not None:
        logNoise = 20 * np.log10(np.abs(noise_fft))

    m = max(logData)
    print('Max: {:.02f} dB'.format(m))

    cutoff = len(f) // 2

    # Get only the positive portion of the frequency and FFT
    positive_freq_mask = np.ma.masked_outside(f, 20, 40000)
    positive_freq = positive_freq_mask.compressed()
    positive_samples = samples_fft[~positive_freq_mask.mask]

    weighted_samples = a_weight(positive_freq) * positive_samples

    plt.subplot(2, 1, 1)
    plt.plot(positive_freq, 20 * np.log10(np.abs(weighted_samples)))
    plt.xscale('log')
    plt.xlim([20, 20000])
    plt.grid(True, which='both')

    # Mask out the fundamental frequency, keeping everything else
    fundamental_mask = np.ma.masked_outside(positive_freq, 995, 1005)
    rms_except_fundamental = np.sqrt(np.sum(np.abs(weighted_samples[~fundamental_mask.mask]) ** 2))
    print('Masked RMS: {}'.format(rms_except_fundamental))

    total_rms = np.sqrt(np.sum(np.abs(weighted_samples) ** 2))
    print('Total RMS: {}'.format(total_rms))

    thdn = rms_except_fundamental / total_rms
    print('RMS percent: {}'.format(thdn * 100))
    print('RMS [db]: {}'.format(20*np.log10(1 - thdn)))

    plt.subplot(2, 1, 2)
    plt.title('FFT of 1KHz FS Sine Wave')
    plt.xlabel('Frequency (Hz)')
    plt.ylabel('dBV')
    plt.grid(b=True, which='both')
    plt.plot(f[:cutoff], logData[:cutoff], label='1KHz FS Sine Wave')
    if noise_fft is not None:
        plt.plot(noise_f[:cutoff], logNoise[:cutoff], color='gray', zorder=0, label='Noise')

    plt.xscale('log')
    plt.xlim([20, 20000])
    # plt.xlim([500, 1500])
    plt.legend()
    plt.show()


def main(signal_file, noise=None):
    time, samples = load_data(signal_file)

    noise_time, noise_samples = None, None
    if noise is not None:
        noise_time, noise_samples = load_data(noise)

    analyze(time, samples, noise_time=noise_time, noise_samples=noise_samples)


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('Error: must specify input CSV with timestamps and voltage measurements.')
        sys.exit(1)

    noise_file = None
    if len(sys.argv) == 3:
        noise_file = sys.argv[2]

    main(signal_file=sys.argv[1], noise=noise_file)
