%Import a guitar sample
[x, Fs, bits] = wavread('sample2.wav');
in = x(1:8.5*Fs, 1); %Get a few moments of one channel

%The algorithm detects zero-crossings and outputs a square wave which
%changes polarity on each rising edge
averages = runAvg(in, 1024);
sign = ones(length(in), 1);
upLevel = 0;
for i=2:length(in)
    if(in(i-1) > 0.01 && in(i) < 0.01) %Falling edge
        upLevel = 1;
    else if (in(i-1) < -0.01 && in(i) > -0.01) %Rising edge
            if(upLevel==1) %Rising edge and zero-crossing
                sign(i) = sign(i-1)*-1; %Change polarity
                upLevel = 0;
                continue;
            end
            upLevel = 0;
        end
    end
    sign(i) = sign(i-1);
end

out = averages.*sign*2;
outFiltered = filter(lp2000(), out); %Filter out the rough edges

%Plot everything
close all;
plot(in), hold on,
plot(out, 'g'),
hold off;
legend('Input', 'Output');

%Play the sound for comparison
sound(outFiltered, Fs);
