function [temp_array,Peakindex,HRs,gap_array] = adaptiveGapAndHRestimation(temp_array,Peakindex,alpha)
q = 1;
gapsize = 0;
tempCC = 1;
removedValues = [];
HRs = [];
GSMIN = 10; % 150bpm is == to 12 samples - 200ms (6samples) == 6
GSMAX = 36; % 50 bpm is == to 36 samples - 200ms == 30
HRMIN = 40;
HRMAX = 200;
tempCounter = 0;
counting = 0;
saveintervalpeak = [];
Fs =30;
everySecond = 30;
pastFiveSeconds = 150;

% 5-55 sec
for i = 300:everySecond:1800
    tempCounter = tempCounter +1;
    
    if gapsize == 0
        for o = i-150:i
            if Peakindex(o) ~= 0
                counting = counting+1;
                saveintervalpeak(counting) = o;
            end
        end
        gapsize = ((((saveintervalpeak(counting)-saveintervalpeak(1)))/(counting-1)));
        gapsize = round(gapsize)
        
        %gapsize = 20;
        
    else
        
        gapsize = gapsize*(alpha) + (((60/HRs(tempCounter-1))*Fs)-6)*(1-alpha);
        %gapsize = (saveintervallpeak(counting)-saveintervallpeak(1))/(counting-1);
        gapsize = round(gapsize);
        
        if gapsize < GSMIN
            gapsize = GSMIN;
            
        elseif gapsize > GSMAX
            gapsize = GSMAX;
            
        end
    end
    
    %gapsize = 20;
    gap_array(tempCounter) = gapsize;
    
    
    
    
    % sliding window erase false peaks--------nya--------nya--------nya--------
    for k = i-pastFiveSeconds:i
        
        
        if Peakindex(k) ~= 0
            highestval = -1;
            currindex = k;
            for jjj = k:k+gapsize-6
                if temp_array(jjj) > temp_array(currindex) && Peakindex(jjj) ~= 0 % && maybe add a threshold like abs(temp_array(jjj) - temp_array(jj)) > TH
                    highestval = temp_array(jjj);
                    temp_array(currindex) = 0;
                    Peakindex(currindex) = 0;
                    currindex = jjj;
                    tempCC = tempCC+1;
                    
                elseif temp_array(jjj) < temp_array(k) && Peakindex(jjj) ~= 0
                    temp_array(jjj) = 0;
                    Peakindex(jjj) = 0;
                    
                end
                
            end
            
        end
    end
    % loop to calc Heartrate 5 sec interval then calc gapsize dependent HR
    counting = 0;
    for k = i-pastFiveSeconds:i
        if Peakindex(k) ~= 0
            counting = counting+1;
            saveintervallpeak(counting) = k;
        end
    end
    if counting > 1
        HR = (60*30)/((saveintervallpeak(counting)-saveintervallpeak(1))/(counting-1));
        if HR < HRMIN
            HR = HRMIN;
        elseif HR > HRMAX
            HR = HRMAX;
        end
        
    else % there are no detected peaks
        if tempCounter > 1 % use the past HR if available
            HR = HRs(tempCounter-1);
        else
            HR = 75;
        end
    end
    
    HRs(tempCounter) = HR;
    
   
end
end

