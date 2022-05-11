
function [Avgdiffbpm, averageDiff,stddev,minErr,maxErr] = calculateErrors(HRs,hbRate)

delay = 1;      %Delay from ground truth
averageDiff = [];
diffrenecebpm = [];
difference = [];
samplestartBand = 5; % The index of the synchronized value from the ground truth
for b = 1:length(HRs)
    
    temp = HRs(b) - hbRate(samplestartBand + delay);
    difference(end+1) = (abs(temp)/hbRate(samplestartBand + delay))*100;
    samplestartBand  = samplestartBand + 1;
    diffrenecebpm(end+1) = abs(temp);
    
    
    
end

Avgdiffbpm = mean(diffrenecebpm)
averageDiff(end+1) = mean(difference)
stddev = std(diffrenecebpm)
minErr = min(diffrenecebpm)
maxErr = max(diffrenecebpm)
end