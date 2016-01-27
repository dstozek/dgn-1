%Import a guitar sample
[x, Fs, bits] = wavread('sample_soft.wav');
in = x(1:8.5*Fs, 1); %Get a few seconds (8.5 in this case) of a single track

averages = runAvg(in, 2^12); %Measure the volume of the signal

%The compressor should amplify weak signals and attenuate strong ones
amp = 1.0;
th = 0.085;
out = in;
out(averages <= th) = out(averages <= th) * amp; %weak
out(averages > th) = out(averages > th) .* (amp./(1 + (averages(averages > th) - th)/th)); %strong

%Plot everything
close all;
plot(in), hold on %input
plot(out, 'r') %output
plot(averages, 'g') %signal power
plot([1, length(in)], [th, th], 'k') %threshold value
hold off;

legend('Input', 'Output', 'Power', 'Threshold');

%Play the sound for comparison
sound(in, Fs);
sound(out, Fs);
