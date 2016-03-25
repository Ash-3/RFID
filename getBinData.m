% Function to generate the binary data from Analog samples

function [bin_data, data_length] = getBinData(anaFname)

data = textread(anaFname,'%f');
data_length = length (data);
min_value = min(data);
max_value = max(data);
threshold =  (min_value+max_value)/2;
bin_data = zeros (data_length,1);


for i =1:data_length
    
    if (data(i,1) < threshold)
        bin_data(i) = 0;
    else 
        bin_data(i) = 1 ;
    end
end