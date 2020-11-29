function [ output ] = FuncCompaireAlg(powerInitiate,NOISE,OPCConstant)
    umber=100;
    c=0;
    for gamaHat=0.01:0.01:0.2
        c=c+1;  
        for i=1:umber
            gHatEU=ones(1,6)*gamaHat;
            distnceVector=FuncPosition();%create system model and calculate distance;
            pathGainVector=FuncPathGain(distnceVector);%calculate pathgaine
            T = FuncTPC(pathGainVector,NOISE,gHatEU);
            TPC(c,i)=T{1};
            TPCT(c,i)=T{2};
            O= FuncOPC(pathGainVector,powerInitiate,gHatEU,NOISE,OPCConstant );
            OPC(c,i)=O{1};
            OPCT(c,i)=O{2};
            D = FuncDTPCO( pathGainVector,gHatEU,OPCConstant,NOISE );
            DTPC(c,i)=D{1};
            DTPCT(c,i)=D{2};
            
        end
        TPCTHR(c)=sum(TPCT(c,:))/umber ;
        OPCTHR(c)=sum(OPCT(c,:))/umber ;
        DTPCTHR(c)=sum(DTPCT(c,:))/umber ;
        disp(gamaHat);
        TPCR(c)=sum(TPC(c,:))/umber ;
        OPCR(c) = sum(OPC(c,:))/umber ;
        DTPCR(c) = sum(DTPC(c,:))/umber;
    end
    output{1}=TPCTHR;
    output{2}=OPCTHR;
    output{3}=DTPCTHR;
end

