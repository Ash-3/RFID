% Function to extract frames
% Fetches the command code and decodes length of message
% Decodes the message as well

function [frame_data, frame_end_index] = getFrames(bin_data, data_start_index, zero_width)
    
    % Get command code
    [command_code, data_start_index] = getCommandCode(bin_data, data_start_index, zero_width);
    
    % Message length detection
    [fdata_len, fcommand_len] = decodeDataLen(command_code);
    
    % Message decode
    [frame_data, frame_end_index] = getFrameData(bin_data, data_start_index, zero_width, fdata_len);
    command_code = command_code';
    
    % Command + Message is returned
    frame_data = [command_code(1:fcommand_len) frame_data'];
end