function [s1, s2, s3] = split_stream(x) %x is bit-stream
    lx = (length(x));
    len = ceil(lx/3); %for odd number of bit-stream length
    s1 = x(1:len);
    s2 = x(len + 1: len * 2);
    s3 = x(2 * len + 1 : end);
    % have to return this two values
end