function [data_start_index, zero_width, max_limit_reached] = detectDataFrame (bin_data, index)

i=index;
max_data_len = size(bin_data, 1);
max_limit_reached = 0;
while (bin_data(i) ~= 0)
    
    i = i+1;
    if(i >= max_data_len)
        max_limit_reached = 1;
        data_start_index = i;
        zero_width = 0;
        return;
    end
end

while (bin_data(i) ~= 1)
    
    i= i+1;
    
end

zero_start_index = i;

while (bin_data(i) ~= 0)
    
    i = i+1;
end
zero_stop_index = i-1;

zero_width =(zero_stop_index - zero_start_index) +1;
pw_start = i;

while (bin_data(i) ~= 1)
    
    i = i+1;
end

pw_stop = i-1;

pulse_width = (pw_stop - pw_start) + 1;

while (bin_data(i) ~= 0)
    
    i = i+1;
end

data_start_index = i + pulse_width + 1;





