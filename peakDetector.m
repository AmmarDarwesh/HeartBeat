

function [filteredSignal,peaks,temp_array,temp_arrayfalse,Peakindex] = peakDetector(filteredSignal,peaks,temp_array,temp_arrayfalse ,Peakindex)

previous = -1;
previous_slope = -1;
slope = -1;
gap_size = 0;


for i = 150:150:1700
    
    for j = i:i+150
        
        if(previous==-1)
            previous = filteredSignal(j);
        end
        % calc for slope
        slope= filteredSignal(j)-previous;
        slopeplus1= filteredSignal(j+1)-filteredSignal(j);
        slopeplus2= filteredSignal(j+2)-filteredSignal(j+1);
        slopeplus3= filteredSignal(j+3)-filteredSignal(j+2);
        slopeplus4= filteredSignal(j+4)-filteredSignal(j+3);
        
        slopeminus1 = filteredSignal(j-1)-filteredSignal(j-2);
        slopeminus2 = filteredSignal(j-2)-filteredSignal(j-3);
        slopeminus3 = filteredSignal(j-3)-filteredSignal(j-4);
        slopeminus4 = filteredSignal(j-4)-filteredSignal(j-5);
        slopeminus5 = filteredSignal(j-5)-filteredSignal(j-6);
        slopeminus6 = filteredSignal(j-6)-filteredSignal(j-7);
        %slopeminus6 >0 &&
        %slopeminus5 >=0 % ||  slopeplus2 < 0 && slope < 0 && slopeplus1 < 0 && slopeminus2 >= 0 && slopeminus3 >=0 && slopeminus4 >=0
        
        % om slope positiv
        if(  slope < 0 &&  slopeplus3 < 0 && slopeminus1 >= 0 && slopeminus4 >=0 || ...
                slopeminus3 >=0 &&  slopeminus1 >=0 &&slopeminus2 >=0 && slope < 0 && slopeplus1 <0 && slopeplus2 <0 && slopeplus3 <0 && slopeplus4 <0 ...
                )
            
            peaks = peaks +1;
            temp_arrayfalse(j-1)= previous;
            temp_array(j-1)= previous;
            Peakindex(j-1)= j-1;
            
        end
        previous_slope = slope;
        previous = filteredSignal(j);
    end
    
end
peaks = peaks;
temp_array = temp_array;
temp_arrayfalse = temp_arrayfalse;
Peakindex = Peakindex;

end

