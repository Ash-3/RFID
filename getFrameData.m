% Function to extract out data from the frame
% Assumes data length is extracted and accurate

function [frame_data, frame_end_index] = getFrameData(bin_data, data_start_index, zero_width, fdata_len)

if(fdata_len ~= 0)
    frame_data = zeros(fdata_len,1);
    for i=1:fdata_len
        [frame_data(i), data_start_index] = getNextBit(bin_data, data_start_index, zero_width);
    end
else
    frame_data = 0;
end
frame_end_index = data_start_index;
        
        