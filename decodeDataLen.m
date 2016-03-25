% Function to Decode the data len in the frame
% Decode logic based on Preamble Table

function [data_len, command_len] = decodeDataLen(command_code)

    data_len = 0;
    command_len = 0;
    if(command_code(1) == 0)
        if(command_code(2) == 0)
            disp('Command is QueryRep. Data Length will be decoded as 4');
            data_len = 4;
            command_len = 2;
        else
            disp('Command is ACK. Data Length will be decoded as 18');
            data_len = 18;
            command_len = 2;
        end
    elseif(command_code(2) == 0)
        if(command_code(3:4) == [0;0])
            disp('Command is Query. Data Length will be decoded as 22');
            data_len = 22;
            command_len = 4;
        elseif(command_code(3:4) == [0;1])
            disp('Command is QueryAdjust. Data Length will be decoded as 9');
            data_len = 9;
            command_len = 4;
        elseif(command_code(3:4) == [1;0])
            disp('Command is Select. Data Length will be decoded as 45 (>44)');
            data_len = 45;
            command_len = 4;
        elseif(command_code(3:4) == [1;1])
            disp('Command is Reserved. Data Length will be decoded as 0');
            data_len = 4;
            command_len = 4;
        end
    elseif(command_code(3) == 0)
        if(command_code(7:8) == [0;0])
            disp('Command is NAK. Data Length will be decoded as 8');
            data_len = 8;
            command_len = 8;
        elseif(command_code(7:8) == [0;1])
            disp('Command is Req_RN. Data Length will be decoded as 40');
            data_len = 40;
            command_len = 8;

        elseif(command_code(7:8) == [1;0])
            disp('Command is Read. Data Length will be decoded as 58 (>47)');
            data_len = 58;
            command_len = 8;

        elseif(command_code(7:8) == [1;1])
            disp('Command is Write. Data Length will be decoded as 59 (>58)');
            data_len = 59;
            command_len = 8;
        end
    end
    data_len = data_len - command_len;
    return;
end
            
            