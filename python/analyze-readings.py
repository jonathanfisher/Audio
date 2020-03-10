import os
import csv
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

            for row in reader:
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


def analyze(time, samples, noise_time=None, noise_samples=None):
    sample_time = time[1] - time[0]

    windowingFunc = np.blackman(len(samples))
    modified_samples = windowingFunc * samples

    modified_noise = None
    if noise_samples is not None:
        modified_noise = windowingFunc * noise_samples

    samples_fft = scipy.fftpack.fft(modified_samples) / len(modified_samples)
    f = scipy.fftpack.fftfreq(len(time), d=sample_time)

    noise_fft, noise_f = None, None
    if modified_noise is not None:
        noise_fft = scipy.fftpack.fft(modified_noise) / len(modified_noise)
        noise_f = scipy.fftpack.fftfreq(len(noise_time), d=(noise_time[1] - noise_time[0]))

    logData = 20 * np.log10(np.abs(samples_fft))
    logNoise = None
    if noise_fft is not None:
        logNoise = 20 * np.log10(np.abs(noise_fft))

    m = max(logData)
    avg = np.mean(logData)
    std_dev = np.std(logData)
    noise_floor = avg + (3 * std_dev)
    print('stdDev: {}'.format(std_dev))
    print('Max: {}dB'.format(m))
    print('Noise Floor (median): {}'.format(avg))
    print('SNR (approx): {} dB'.format(m - noise_floor))

    cutoff = len(f) // 2

    plt.plot(f[:cutoff], logData[:cutoff], label='1KHz FS Sine Wave')
    if noise_fft is not None:
        plt.plot(noise_f[:cutoff], logNoise[:cutoff], color='gray', zorder=0, label='Noise')

    plt.xscale('log')
    plt.hlines(avg, 0, 20000, colors='r', linestyles=':', zorder=10)
    plt.hlines(noise_floor, 0, 20000, colors='gr', linestyles='-', zorder=10)
    plt.xlim([1, 20000])
    plt.legend()
    plt.show()


def main(input=None, noise=None):
    time, samples = load_data(input)

    noise_time, noise_samples = None, None
    if noise is not None:
        noise_time, noise_samples = load_data(noise)

    analyze(time, samples, noise_time=noise_time, noise_samples=noise_samples)


if __name__ == '__main__':
    main(input='right2.csv', noise='noise.csv')
