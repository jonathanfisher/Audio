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


def plot_simple_spectrum(time, samples):
    sample_time = np.median(np.diff(time))

    plt.subplot(2, 1, 1)
    plt.plot(time, samples)
    plt.xlabel('Time (s)')
    plt.ylabel('Sample (V)')
    plt.xlim([0, 0.050])
    plt.title('Samples vs. Time (First 50ms)')

    samples_fft = scipy.fftpack.rfft(samples) * 2 / len(samples)
    freq = scipy.fftpack.rfftfreq(len(samples_fft), d=sample_time)

    plt.subplot(2, 1, 2)
    plt.plot(freq, np.abs(samples_fft))
    plt.xlim([20, 20*1000])
    plt.xscale('log')
    plt.xlabel('Frequency (Hz)')
    plt.ylabel('Magnitude')
    plt.title('Audio Spectrum')
    plt.show()


def plot_basic_db_spectrum(time, samples):
    sample_time = np.median(np.diff(time))

    samples_fft = scipy.fftpack.rfft(samples) * 2 / len(samples)
    f = scipy.fftpack.rfftfreq(len(samples_fft), d=sample_time)

    plt.plot(f, 20 * np.log10(np.abs(samples_fft)))
    plt.xscale('log')
    plt.grid(True, axis='both')
    plt.xlabel('Frequency [Hz]')
    plt.ylabel('Spectrum [dBV]')
    plt.title('Spectrum [dbV] vs Frequency [Hz]')
    plt.show()


def plot_db_spectrum_hanning(time, samples):
    sample_time = np.median(np.diff(time))
    factor = np.sqrt(8/3)

    samples_fft = factor * scipy.fftpack.rfft(samples * np.hanning(len(samples))) * 2 / len(samples)
    f = scipy.fftpack.rfftfreq(len(samples_fft), d=sample_time)

    samples_fft_dbv = 20 * np.log10(np.abs(samples_fft))

    print('Max: {} dBV'.format(max(samples_fft_dbv)))

    plt.plot(f, samples_fft_dbv)
    plt.xscale('log')
    plt.ylim([-250, 20])
    plt.xlim([20, 20*1000])
    plt.grid(True, axis='both')
    plt.xlabel('Frequency [Hz]')
    plt.ylabel('Spectrum [dBV]')
    plt.title('Spectrum [dbV] vs Frequency [Hz]')
    plt.show()


def calculate_thdn(freq, spectrum_fft, fundamental=1000, fundamental_skirt=50):
    # We only wish to calculate THDN from 20-20KHz.
    freq_mask = np.ma.masked_outside(freq, 20, 20000)
    freq_valid = freq_mask.compressed()
    spectrum_fft_valid = spectrum_fft[~freq_mask.mask]

    whole_rms = np.sqrt(2 * np.sum(np.abs(spectrum_fft_valid) ** 2))
    print('RMS: {}'.format(whole_rms))

    # Mask out the fundamental frequency +/- a skirt
    freq_noise_and_harmonics_mask = np.ma.masked_inside(freq_valid, fundamental - fundamental_skirt,
                                                        fundamental + fundamental_skirt)
    fft_nh = spectrum_fft_valid[~freq_noise_and_harmonics_mask.mask]
    masked_rms = np.sqrt(2 * np.sum(np.abs(fft_nh) ** 2))
    print('Masked RMS: {}'.format(masked_rms))

    thdn_unscaled = masked_rms / whole_rms
    print('THDN (Unscaled): {}'.format(thdn_unscaled))
    print('THDN (%): {:02f}'.format(thdn_unscaled * 100))
    print('THDN (dB): {}'.format(20 * np.log10(thdn_unscaled)))



def analyze(time, samples, noise_time=None, noise_samples=None):
    sample_time = time[1] - time[0]

    windowing_func = np.hanning(len(samples))
    energy_weight_factor = np.sqrt(8/3)
    modified_samples = windowing_func * samples

    modified_noise = None
    if noise_samples is not None:
        modified_noise = windowing_func * noise_samples

    samples_fft = scipy.fftpack.rfft(modified_samples) * 2 / len(modified_samples)
    f = scipy.fftpack.rfftfreq(len(samples_fft), d=sample_time)

    noise_fft, noise_f = None, None
    if modified_noise is not None:
        noise_fft = scipy.fftpack.fft(modified_noise) * 2 / len(modified_noise)
        noise_f = scipy.fftpack.fftfreq(len(noise_time), d=(noise_time[1] - noise_time[0]))

    spectrum_db = 20 * np.log10(np.abs(samples_fft * energy_weight_factor))
    noise_spectrum_db = None
    if noise_fft is not None:
        noise_spectrum_db = 20 * np.log10(np.abs(noise_fft))

    m = max(spectrum_db)
    print('Max: {:.02f} dB'.format(m))

    plt.title('FFT of 1KHz FS Sine Wave')
    plt.xlabel('Frequency (Hz)')
    plt.ylabel('dBV')
    plt.grid(b=True, which='both')
    plt.plot(f, spectrum_db, label='1KHz FS Sine Wave')
    if noise_fft is not None:
        plt.plot(noise_f, noise_spectrum_db, color='gray', zorder=0, label='Noise')

    plt.xscale('log')
    plt.xlim([20, 20000])
    plt.legend()
    plt.show()

    calculate_thdn(f, samples_fft * energy_weight_factor)


def main(signal_file, noise=None):
    time, samples = load_data(signal_file)

    noise_time, noise_samples = None, None
    if noise is not None:
        noise_time, noise_samples = load_data(noise)

    analyze(time, samples, noise_time=noise_time, noise_samples=noise_samples)
    # plot_simple_spectrum(time, samples)
    # plot_basic_db_spectrum(time, samples)
    # plot_db_spectrum_hanning(time, samples)


def reference_analysis():
    sample_rate_hz = 192 * 1000
    duration_s = 1
    n_samples = sample_rate_hz * duration_s
    amplitude_V = 6
    freq_hz = 1 * 1000
    t = np.linspace(0, duration_s, num=n_samples)
    s = amplitude_V * np.sin(2 * np.pi * freq_hz * t)

    # Plot the initial signal
    plt.subplot(2, 1, 1)
    plt.plot(t, s)
    plt.xlim([0, 0.050])
    plt.xlabel('Time (s)')
    plt.ylabel('Volts')

    s_fft = scipy.fftpack.rfft(s) * 2 / len(s)
    f_fft = scipy.fftpack.rfftfreq(len(s_fft), d=1/sample_rate_hz)
    print('Maximum abs: {}'.format(max(np.abs(s_fft))))

    # Plot the FFT
    plt.subplot(2, 1, 2)
    plt.plot(f_fft, np.abs(s_fft))
    plt.xlabel('Frequency (Hz)')
    plt.ylabel('Abs(FFT)')
    plt.xlim([500, 1500])

    plt.show()


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('Error: must specify input CSV with timestamps and voltage measurements.')
        sys.exit(1)

    noise_file = None
    if len(sys.argv) == 3:
        noise_file = sys.argv[2]

    main(signal_file=sys.argv[1], noise=noise_file)
    # reference_analysis()
