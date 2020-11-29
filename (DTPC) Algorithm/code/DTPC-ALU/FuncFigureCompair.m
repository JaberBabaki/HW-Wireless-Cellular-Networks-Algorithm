function FuncFigureCompair( output )
    TPCRate=output{1};
    OPCRate=output{2};
    DTPCRate=output{3};
    TSINR=0.01:0.01:0.2;
    y=1:20;
    figure(1)
    plot(TSINR,TPCRate(y),'r',TSINR,OPCRate(y),'g',TSINR,DTPCRate(y),'b'),grid on;
    xlabel('target SINR')
    ylabel('Outage Ratio')
    title('Plot of Outage Ratio')   
end


