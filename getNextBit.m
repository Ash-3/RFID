% Function to extract the next bit in the data sequence
% Assumes that the data has been detected accurately

function [bit_val , new_start_index] = getNextBit(data_seq, start_index, zero_hlen)

    bit_detect_index = start_index;
    
    % Binary high time detection
    while(data_seq(bit_detect_index) == 1)
        bit_detect_index = bit_detect_index + 1;
    end
    bit_hlen = bit_detect_index - start_index;
    
    %Binary low time detection
    while(data_seq(bit_detect_index) == 0)
        bit_detect_index = bit_detect_index + 1;
    end
    new_start_index = bit_detect_index;
    
    % Thresholding range given for high time of signal
    
    %High time of Data-0 should ideally be same as decoded by data-0 bit
    %transmitted after delimiter. Allow threshold of 10%
    % High time of Data-1 is expected to be atleast 1.5X high time of
    % Data-0
    
    if(bit_hlen <= (zero_hlen*1.1) && bit_hlen >= (zero_hlen*0.9))
        bit_val = 0;
    elseif(bit_hlen > 1.5*zero_hlen)
        bit_val = 1;
    end
    return;
end