function [y] = physConv_CC(x,h,dTau)
    y = zeros(length(x) + length(h) - 1,1);
    validHResponses = zeros(0,2);
    
    for it = 1:length(y)
        
        % Here we just make the val 0 or x depending on if
        % we surpass the length of x
        if (it > length(x))
            val = 0;
        else
            val = x(it);    
        end
        % Here we add the value and iteration of the 
        % reponse for the new input
        validHResponses(end + 1,1) = val;
        validHResponses(end,2) = 1;
        
        result = 0;
        popFirst = 0;
        [c,r] = size(validHResponses);
        for n = 1:c
            resp = validHResponses(n,:);
            % Add x(t) * h(t - n*dTau)
            result = result + resp(1) * h(resp(2));
            
            % Delay the response
            validHResponses(n,2) = resp(2) + 1;
            if (resp(2) + 1 > length(h))
                % Remove responses that are not valid
                popFirst = 1;
            end
        end
        if (popFirst == 1)
           validHResponses(1,:) = [];
        end
        y(it) = result*dTau;
    end
end
