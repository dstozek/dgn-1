%This script generates the lookup tables used in the distortion effect. 
%The distortion effect is realized by approximating the nonlinear transfer
%function by a piecewise linear transfer function. To achieve this, the
%transfer function is sampled in 64 equidistant points. The value inbetween
%those points is then interpolated from the nearest sampling point and the
%slope of the transfer functions curve at that point.

%Define the expected transfer function
t2 = @(x, a, b, c, d, e) (-b.*exp(-x./a) + c) .* (1-d*exp(-x.^2/(2*e^2)));
gauss = @(x, d, e) (1-d*exp(-x.^2/(2*e^2)));

v = linspace(0, 1, 64); %We'll have 64 rows in our lookup tables
x = linspace(0, 1, 2^16);
u = t2(v, 0.2, 1, 1, 0.8, 0.2); %Calculate the value of the transfer function at the sampling points
%u = gauss(v, 0.8, 0.2); %Alternative transfer function

ud2 = [(diff(u) ./ diff(v)) 0]; %Calculate the slope at those sampling points for use when interpolating
ud3 = round(ud2*16)/16; %Decrease the resolution of the slope to 1/16 since that's the resolution at which it will be processed by the hardware anyway

%Output the lookup table for use in the hardware as a great big case
%statement
for i=1:length(v)
     disp(sprintf('when %d => table_y := %d; table_d := %d; -- t2(%f) = %f, slope = %f', i-1, floor(u(i)*(2^15)),ud3(i)*16, v(i), u(i), ud3(i)));
end;

%Plot the result of what will happen in the hardware
y = x;
for i=1:length(x)
    % find the nearest v value to x;
    index = find(v > x(i), 1) - 1;
    if (~isempty(index))
        %Interpolate
        dx = x(i) - v(index);
        du = ud3(index);
        dy = dx*du;
        y(i) = u(index)+dy;
    end;
end;

%Plot
close all;
plot(x, y, '.g'),  hold on, plot(v, u, 'x'), plot(v, v,'rx'), hold off;


%Feed a sample through the algorithm to hear the processed sound
[x, Fs, bits] = wavread('sample_hard.wav');
y = x;
for i=1:length(x)
    % find the nearest v value to x;
    s = sign(x(i));
    x(i) = abs(x(i))*3;
    index = find(v > x(i), 1) - 1;
    if (~isempty(index))
        %Interpolate
        dx = x(i) - v(index);
        du = ud3(index);
        dy = dx*du;
        y(i) = s*(u(index)+dy);
    end;
    x(i) = s*x(i);
end;
x = x/max(x);
y = y/max(y);
sound(x, Fs);
sound(y, Fs);
wavwrite([y y], Fs, 'distortion.wav');