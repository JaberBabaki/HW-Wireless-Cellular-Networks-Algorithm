function [ OPC ] = FuncOPC( pathGainVector,powerInitiate,NOISE,OPCConstant )
   G(1,:)=FuncSINR(pathGainVector,powerInitiate(1,:),NOISE);
   IterNum=1000;
   for T = 2:IterNum
        for i = 1 : 9
            powerInitiate(T,i) = (OPCConstant*G(T-1,i))/powerInitiate(T-1,i);
        end
        G(T,:)=FuncSINR(pathGainVector,powerInitiate(T,:),NOISE);
        if(abs(powerInitiate(T,:) - powerInitiate(T-1,:))<=0.0001)
            break
        end
   end
    OPC{1}=powerInitiate(T,i);
    OPC{2}=G(T,:);
end

