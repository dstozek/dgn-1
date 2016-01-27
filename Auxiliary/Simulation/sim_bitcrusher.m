%Import a guitar sample
[x, Fs, bits] = wavread('sample2.wav');
in = x(1:10*Fs, 1); %Select a few seconds of one channel
in = in/max(in);
%Scale everything to the 16 bit range to make it easier to think about bits
%in the hardware
in = in * 2^16;
averages = runAvg(in, 128);
volumeCutoff = 2.^ceil(log2(averages)); %Volume rounded up towards the nearest power of 2

%We discard all the bits below the volume level. This decreases the
%vertical resolution of the signal while not smothering weak sounds.
out_flavor1 = in - ( mod(abs(in), volumeCutoff) - volumeCutoff ) .* sign(in);
out_flavor1 = out_flavor1 / 2^16 * 2;


%The second flavor arbitraily moves around bits in the signal
in = in / 2^16;
out_flavor2 = uint16(abs(round(in*((2^16)-1))));

out_flavor2 =     bitget(out_flavor2, 14) * (2^14) + ... 
                  bitget(out_flavor2, 13) * (2^13) + ...
                  bitget(out_flavor2, 10) * (2^12) + ...
                  bitor(bitget(out_flavor2, 11), bitget(out_flavor2, 11)) * (2^11) + ...
                  bitor(bitget(out_flavor2, 9), bitget(out_flavor2, 7)) * (2^10) + ...
                  bitget(out_flavor2, 6) *(2^9) + ...
                  bitget(out_flavor2, 7) *(2^8) + ...
                  max(-sign(out_flavor2), 0) *(2^7) + ...
                  max(-sign(out_flavor2), 0) *(2^6) + ...
                  max(-sign(out_flavor2), 0) *(2^5) + ...
                  bitget(out_flavor2, 1) *(2^4) + ...
                  max(-sign(out_flavor2), 0)*(2^3) + ... 
                  bitget(out_flavor2, 3) *(2^2) + ...
                  max(-sign(out_flavor2), 0) *(2^1) + ...
                  bitget(out_flavor2, 1) * (2^0);

%Rescale back to reasonable amplitudes
out_flavor2 = double(out_flavor2)/(2^16).*sign(in);

out_flavor1_filtered = filter(lp2000(), out_flavor1);
out_flavor2_filtered = filter(lp2000(), out_flavor2);

close all;
plot(in), hold on,
plot(out_flavor1, 'r'),
plot(out_flavor2, 'k'),
hold off;

legend('Input', 'Flavor 1', 'Flavor 2');

%They sound better without a filter, don't they?
out_flavor1 = out_flavor1/max(out_flavor1);
out_flavor2 = out_flavor2/max(out_flavor2);

sound(out_flavor1, Fs, bits);
sound(out_flavor2, Fs, bits);
%sound(out_flavor1_filtered, Fs, bits);
%sound(out_flavor2_filtered, Fs, bits);

wavwrite([out_flavor1 out_flavor1], Fs, 'bitcrusher_flavor_1.wav');
wavwrite([out_flavor2 out_flavor2], Fs, 'bitcrusher_flavor_2.wav');
wavwrite([in in], Fs, 'bitcrusher_original.wav');