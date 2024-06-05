clc
clear all

c0 = physconst('LightSpeed');
fc = 24e9;              % carrier frequency
lambda = c0/ fc;        % wavelength
N = 64;                 % number of subcarriers
cplen = N/4;
M = 16;                 % number of symbols
delta_f = 15e3 * 2^6;   % subcarrier spacing
T = 1 / delta_f;        % symbol duration
Tcp = T / 4;            % cyclic prefix duration
Ts = T + Tcp;           % total symbol duration
D = 0.1;                % he fraction of the sub-carrier distance the Doppler shift can maximally be
G = 0.25;               % cyclic prefix

qam = 4; % 4-QAM modulation

% Target parameters
target_pos = [100 70 140]; % target distance (m)
target_delay = range2time(target_pos, c0);
target_speed = [50 300 100]; % target velocity (m/s)
target_dop = speed2dop(2 * target_speed, lambda);

SNR_dB = -10;
SNR = 10.^(SNR_dB/10);

% Transmit data
data = randi([0 qam - 1], N, M);
TxData = qammod(data, qam, 'UnitAveragePower', true);
s_t = ofdmmod(TxData,N,cplen);

TxData_1 = reshape(s_t, [], 16);

% Received frequency-domain signal over the radar channel
RxData = zeros(size(TxData_1));
for kSubcarrier = 1:(N+cplen)
    for mSymbol = 1:M
        RxData(kSubcarrier, mSymbol) = sum(sqrt(SNR) * TxData_1(kSubcarrier, mSymbol)... 
            .* exp(-1j * 2 * pi * fc * target_delay)...
            .* exp(1j * 2 * pi * mSymbol *Ts .* target_dop)...
            .* exp(-1j * 2 * pi * kSubcarrier .* target_delay * delta_f) )...
            + sqrt(1/2)* (randn() +1j * randn());
    end
end
y_t = ofdmdemod(RxData,N,cplen);
RxData_1 = reshape(y_t, [], 16);

% Remove the information of transmit data
dividerArray = RxData_1 ./ TxData;    % Eq 4 F_{k, l} = F_{RX}/ F_{TX}
sigma_kl =  sqrt(1/2)* (randn() +1j * randn()) ./ (abs(dividerArray).^2);

%% Periodogram/FFT-based estimation
NPer = 16 * N;
normalizedPower = abs(ifft(dividerArray, NPer, 1));
normalizedPower_dB = 10 * log10(normalizedPower);
mean_normalizedPower = mean(normalizedPower, 2);
mean_normalizedPower = mean_normalizedPower / max(mean_normalizedPower);
mean_normalizedPower_dB = 10 * log10(mean_normalizedPower);
[~, E_rangeEstimation] = max(mean_normalizedPower_dB);
rangeIndex = 0:1:(NPer-1);
rangeIndex = rangeIndex * c0 / (2 * delta_f * NPer);
Est_distance = E_rangeEstimation * c0 / (2 * delta_f * NPer);
hold on;
plot(rangeIndex, mean_normalizedPower_dB);
grid on;
xlabel('Range [m]');
ylabel('Normalized Range Profile [dB]');
legend('MUSIC', 'periodogram')
hold off

