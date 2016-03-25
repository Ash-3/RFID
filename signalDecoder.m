% Program to decode signal received during RFID communication. This follows
% Generation-2 UHF RFID v2.0.0 protocol standard
% Digital encode
%   Logic 0 - 0-0.3380V
%   Logic 1 - 0.3380-0.6752V

% Extract the binary data form the analog samples
bin_data = getBinData('signal');


% Extract frames
frame_end_index = 1;
frame_number = 1;
while(1)

    %Detect Frame after delimiter, data-0 and calibration
    [data_start_index, zero_width, max_limit_reached] = detectDataFrame (bin_data, frame_end_index);
    
    % Fail safe mechanism for file overflow
    if(max_limit_reached ~= 1)
        fprintf('Received frame %d:\n', frame_number);
        
        % Data Frame extract and decode
        [frame_data, frame_end_index] = getFrames(bin_data, data_start_index, zero_width);        
        disp(frame_data);
        frame_number = frame_number + 1;
    else
        break;
        
    end
end


