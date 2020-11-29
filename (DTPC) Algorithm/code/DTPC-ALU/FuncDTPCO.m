function [out] = FuncDTPCO(pathGainVector,GAMA,eta,NOISE)
    outage=0;
    iteratin=1000;
    powerInitiate=ones(1,6)*1e-5;
    sinr(1,:)=FuncSINR(pathGainVector,powerInitiate,NOISE);
    ThroughputDTPC=0;
    for j=2:iteratin
        for i=1:6
            powerInitiate(j,i)=max(eta*(sinr((j-1),i)/powerInitiate((j-1),i)),powerInitiate((j-1),i)*(GAMA(i)/sinr((j-1),i)));
        end
        sinr(j,:)=FuncSINR(pathGainVector,powerInitiate(j,:),NOISE );
        if(abs(powerInitiate(j,:) - powerInitiate(j-1,:))<=0.00001)
            break
        end
    end    
    for i=1:6
        if (abs(sinr(j,i)-GAMA(i))>0.001)
            outage=outage+1;
        end
        ThroughputDTPC = ThroughputDTPC+(log(1+sinr(j,i)));
    end
    out{1}=outage;
    out{2}=ThroughputDTPC;
end

