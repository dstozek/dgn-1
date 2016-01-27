function [avg] = runAvg(y, n)
avg = zeros(length(y), 1);
for i=10:1:length(y)
    avg(i) = ((n-1)*avg(i-1) + 1.3125*abs(y(i)))/(n);
end