%Import a guitar sample
[x, Fs, bits] = wavread('sample_soft.wav');
in = x(1:10*Fs, 1); %Select a few seconds of one channel

%Create a triangular envelope to use for trembling
envelope = repmat((triang(Fs/5)*1.2+0.4), 10*5, 1);

out = in.*envelope;

%Plot everything
close all;
plot(in), hold on, %input
plot(out, 'r'), %output
plot(envelope/10 + 0.1, 'g'), %envelope
hold off;

legend('Input', 'Output', 'Trembling');

%Play the sound for comparison
%sound(in, Fs);
sound(out, Fs);
wavwrite([out out], Fs, 'volume_tremolo.wav');
