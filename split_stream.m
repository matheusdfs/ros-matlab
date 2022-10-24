function split_stream(x) %x is bit-stream
    lx = (length(x));
    half = ceil(lx/2); %for odd number of bit-stream length
    s1 = x(1:half);
    s2 = x(half + 1 : end);
    % have to return this two values
end