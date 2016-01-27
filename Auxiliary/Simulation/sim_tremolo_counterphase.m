%A counterphase precedence-based tremolo effect as suggested by Jan Tangrind from Elektronik
%Tidningen. Creates a subtle illusion of a moving sound-source.

%Import a guitar sample
[x, Fs, bits] = wavread('sample_soft.wav');
in = x(1:10*Fs, 1); %Select a few seconds of one channel

%Create a triangular envelope to use for trembling
t = 1:length(in);
modulationAmplitude = 3; %3 miliseconds
modulationPeriod = 2; %2 seconds
delayLeft = round(((modulationAmplitude/1000) * Fs) * (1 + sin(2*3.14*t/(modulationPeriod*Fs))));
delayRight = round(((modulationAmplitude/1000) * Fs) * (1 - sin(2*3.14*t/(modulationPeriod*Fs))));

maxDelay = max(max(delayLeft), max(delayRight));

outLeft = zeros(length(in), 1);
outRight = zeros(length(in), 1);
for i=maxDelay+1:length(in)
    outLeft(i - maxDelay) = in(i - delayLeft(i-maxDelay));
    outRight(i - maxDelay) = in(i - delayRight(i-maxDelay));
end

%out = in.*envelope;

%Plot everything
close all;
plot(in), hold on, %input
plot(outLeft, 'r'), %output
%plot(delayLeft, 'r'), %output
plot(outRight, 'g'), %output
%plot(delayRight, 'g'), %output
%plot(envelope/10 + 0.1, 'g'), %envelope
hold off;

legend('Input', 'Left', 'Righ');

%Play the sound for comparison
sound([outLeft, outRight], Fs);
wavwrite([outLeft, outRight], Fs, ['tremolo_counterphase_delay_' sprintf('%f', modulationPeriod) 'period_' sprintf('%f', modulationAmplitude) 'amplitude.wav']);
