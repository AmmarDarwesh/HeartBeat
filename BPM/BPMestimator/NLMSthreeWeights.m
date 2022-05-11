function filteredSignal = NLMSthreeWeights(filteredSignal,accCombined, mu)


%init variables

h(1) = 0;
h(2) = 0;
h(3) = 0;
h(4) = 0;
h(5) = 0;
h(6) = 0;
h(7) = 0;
h(8) = 0;
h(9) = 0;
h(10) = 0;
h(11) = 0;
h(12) = 0;
h(13) = 0;
h(14) = 0;
h(15) = 0;
h(16) = 0;
h(17) = 0;
h(18) = 0;
h(19) = 0;
h(20) = 0;
h(21) = 0;
h(22) = 0;
h(23) = 0;
h(24) = 0;
h(25) = 0;



for i = 25:length(accCombined)

    if(accCombined(i) > 0.1)
        % compute error
        filteredSignal(i) = filteredSignal(i) - ((h(1) * accCombined(i)) + (h(2) * accCombined(i-1)) + (h(3) * accCombined(i-2)) + (h(4) * accCombined(i-3)) + (h(5) * accCombined(i-4))...
            + (h(6) * accCombined(i-5)) + (h(7) * accCombined(i-6)) + (h(8) * accCombined(i-7)) + (h(9) * accCombined(i-8)) + (h(10) * accCombined(i-9)) + (h(11) * accCombined(i-10)) + (h(12) * accCombined(i-11))+ (h(13) * accCombined(i-12))...
            + (h(14) * accCombined(i-13)) + (h(15) * accCombined(i-14)) + (h(16) * accCombined(i-15)) + (h(17) * accCombined(i-16)) + (h(18) * accCombined(i-17)) + (h(19) * accCombined(i-18)) + (h(20) * accCombined(i-19))...
            + (h(21) * accCombined(i-20)) +  (h(22) * accCombined(i-21)) +  (h(23) * accCombined(i-22)) +  (h(24) * accCombined(i-23)) +  (h(25) * accCombined(i-24)));
        norm = (accCombined(i)^2 + accCombined(i-1)^2 + accCombined(i-2)^2 + accCombined(i-3)^2 + accCombined(i-4)^2 + accCombined(i-5)^2 + accCombined(i-6)^2....
            + accCombined(i-7)^2 + accCombined(i-8)^2 + accCombined(i-9)^2 + accCombined(i-10)^2 + accCombined(i-11)^2 + accCombined(i-12)^2 + accCombined(i-13)^2 + accCombined(i-14)^2 + accCombined(i-15)^2 + accCombined(i-16)^2....
            + accCombined(i-17)^2 + accCombined(i-18)^2 + accCombined(i-19)^2 + accCombined(i-20)^2 + accCombined(i-21)^2 + accCombined(i-22)^2 + accCombined(i-23)^2 + accCombined(i-23)^2 + accCombined(i-24)^2);
        % update weights
        h(1) = h(1) + ((mu * filteredSignal(i-1) * accCombined(i)) / norm);
        h(2) = h(2) + ((mu * filteredSignal(i-1) * accCombined(i-1)) / norm);
        h(3) = h(3) + ((mu * filteredSignal(i-1) * accCombined(i-2)) / norm);
        h(4) = h(4) + ((mu * filteredSignal(i-1) * accCombined(i-3)) / norm);
        h(5) = h(5) + ((mu * filteredSignal(i-1) * accCombined(i-4)) / norm);
        h(6) = h(6) + ((mu * filteredSignal(i-1) * accCombined(i-5)) / norm);
        h(7) = h(7) + ((mu * filteredSignal(i-1) * accCombined(i-6)) / norm);
        h(8) = h(8) + ((mu * filteredSignal(i-1) * accCombined(i-7)) / norm);
        h(9) = h(9) + ((mu * filteredSignal(i-1) * accCombined(i-8)) / norm);
        h(10) = h(10) + ((mu * filteredSignal(i-1) * accCombined(i-9)) / norm);
        h(11) = h(11) + ((mu * filteredSignal(i-1) * accCombined(i-10)) / norm);
        h(12) = h(12) + ((mu * filteredSignal(i-1) * accCombined(i-11)) / norm);
        h(13) = h(13) + ((mu * filteredSignal(i-1) * accCombined(i-12)) / norm);
        h(14) = h(14) + ((mu * filteredSignal(i-1) * accCombined(i-13)) / norm);
        h(15) = h(15) + ((mu * filteredSignal(i-1) * accCombined(i-14)) / norm);
        h(16) = h(16) + ((mu * filteredSignal(i-1) * accCombined(i-15)) / norm);
        h(17) = h(17) + ((mu * filteredSignal(i-1) * accCombined(i-16)) / norm);
        h(18) = h(18) + ((mu * filteredSignal(i-1) * accCombined(i-17)) / norm);
        h(19) = h(19) + ((mu * filteredSignal(i-1) * accCombined(i-18)) / norm);
        h(20) = h(20) + ((mu * filteredSignal(i-1) * accCombined(i-19)) / norm);
        h(21) = h(21) + ((mu * filteredSignal(i-1) * accCombined(i-20)) / norm);
        h(22) = h(22) + ((mu * filteredSignal(i-1) * accCombined(i-21)) / norm);
        h(23) = h(23) + ((mu * filteredSignal(i-1) * accCombined(i-22)) / norm);
        h(24) = h(24) + ((mu * filteredSignal(i-1) * accCombined(i-23)) / norm);
        h(25) = h(25) + ((mu * filteredSignal(i-1) * accCombined(i-24)) / norm);
    end
end

end