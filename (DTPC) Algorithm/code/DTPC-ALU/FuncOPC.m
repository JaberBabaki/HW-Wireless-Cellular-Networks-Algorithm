function [ out ] = FuncOPC( pathGainVector,powerInitiate,gHatEU,NOISE,OPCConstant )
   G(1,:)=FuncSINR(pathGainVector,powerInitiate(1,:),NOISE);
   IterNum=500;
   outage=0;
   ThroughputOPC=0;
   for T = 2:IterNum
        for i = 1 : 6
            powerInitiate(T,i) = (OPCConstant*G(T-1,i))/powerInitiate(T-1,i);
        end
        G(T,:)=FuncSINR(pathGainVector,powerInitiate(T,:),NOISE);
        if(abs(powerInitiate(T,:) - powerInitiate(T-1,:))<=0.0001)
            break
        end
   end
   for i=1:6
       if (abs(G(T,i)-gHatEU(i))>0.001)
           outage=outage+1;
           %ThroughputOPC = ThroughputOPC+(log(1+G(T,i)));
       end
       ThroughputOPC = ThroughputOPC+(log(1+G(T,i)));
   end
   out{1}=outage;
   out{2}=ThroughputOPC;
end

