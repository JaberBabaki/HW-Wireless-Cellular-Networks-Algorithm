function [ DTPC ] = FuncDTPC(pathGainVector,GAMA,eta,NOISE)
    iteratin=1000;
    MaxP=0.001;
    powerInitiate=ones(1,6)*1e-10;
    sinr(1,:)=FuncSINR(pathGainVector,powerInitiate,NOISE);
    for j=2:iteratin
        for i=1:6
            %powerInitiate(j,i)=max(eta*(sinr((j-1),i)/powerInitiate((j-1),i)),powerInitiate((j-1),i)*(GAMA(i)/sinr((j-1),i)));
            powerInitiate(j,i)=min(MaxP, max(eta*(sinr((j-1),i)/powerInitiate((j-1),i)),powerInitiate((j-1),i)*(GAMA(i)/sinr((j-1),i))));
        end
        sinr(j,:)=FuncSINR(pathGainVector,powerInitiate(j,:),NOISE );
        if(abs(powerInitiate(j,:) - powerInitiate(j-1,:))<=0.00001)
            break
        end
    end    
    DTPC{1}=powerInitiate;
    DTPC{2}=sinr;
    DTPC{3}=j;
end

