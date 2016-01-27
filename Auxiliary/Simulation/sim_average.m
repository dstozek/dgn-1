%Import a guitar sample
[x, Fs, bits] = wavread('both2.wav');
x = x(:, 1); %We'll be using only one channel
avg = runAvg(x, 1024); %Calculate the runnning average
rms = runRms(x, 1024); %Calculate the reference running RMS

averageDifference = norm( (avg-rms)/sqrt(length(x)) ) %Print the error

%Plot the input and the averages for comparison
plot(x, 'g'), hold on, plot(avg, 'r'), plot(rms, 'b'), hold off;

legend('Input', 'Running average', 'Reference RMS');