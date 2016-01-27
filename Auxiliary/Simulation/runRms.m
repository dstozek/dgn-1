function [ rms ] = runRms( ys, n )

rms = zeros(length(ys), 1);

for i=1:length(ys)
    rms(i) = norm(ys(max(1, i-n):i))/sqrt(min(i,n));
end


end

