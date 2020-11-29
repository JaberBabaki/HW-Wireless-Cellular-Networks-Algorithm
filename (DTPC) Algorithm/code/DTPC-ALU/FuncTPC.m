function [ out ] = FuncTPC(pathGainVector,NOISE,gHatEU )
    ITERATION=1000;
    randomPower = 1e-3*rand(1,6);
    gamma(1,:)=FuncSINR(pathGainVector,randomPower,NOISE);
    outage=0;
    ThroughputTPC=0;
    for j=2:ITERATION
        for i=1:6
              randomPower(j,i)=randomPower((j-1),i)*(gHatEU(i)/gamma((j-1),i));
        end
        gamma(j,:)=FuncSINR(pathGainVector,randomPower(j,:),NOISE);
        if (abs(randomPower(j,:)-randomPower(j-1,:))<=0.0001)
            break
        end
    end
    for i=1:6
        if (abs(gamma(j,i)-gHatEU(i))>0.001)
            outage=outage+1;
        end
        ThroughputTPC = log(1+(gamma(j,i)))+ThroughputTPC;
    end
    out{1}=outage;
    out{2}=ThroughputTPC;
end

