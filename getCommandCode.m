% Function to calculate the command code according to the standard Preamble
% table

function [command_code, start_index] = getCommandCode(bin_data, data_start_index, zero_width)

% command_code can be a maximum of 8bits in length
command_code = zeros(8,1);

% Start extracting the bits for the command code:
cmd_bit_index =1;

% Get the 1st two command bits
while (cmd_bit_index <= 2)
    [command_code(cmd_bit_index), data_start_index] = getNextBit(bin_data, data_start_index, zero_width);
    cmd_bit_index = cmd_bit_index + 1;
end

% Either the length is fixed now or more of commands bits are required
if(command_code(1,1) == 1)
    while (cmd_bit_index <= 4)
        [command_code(cmd_bit_index), data_start_index] = getNextBit(bin_data, data_start_index, zero_width);
        cmd_bit_index = cmd_bit_index + 1;
    end
    if(command_code(2,1) == 1)
        while (cmd_bit_index <= 8)
            [command_code(cmd_bit_index), data_start_index] = getNextBit(bin_data, data_start_index, zero_width);
            cmd_bit_index = cmd_bit_index + 1;
        end
    end
end
start_index = data_start_index;
return;
    
    
    
    






