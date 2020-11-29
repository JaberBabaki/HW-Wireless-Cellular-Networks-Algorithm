function FuncFigure( powerInitiate,SIR )
    x = 1:20000;
    Power=powerInitiate(x,:);
    SINR=SIR(x,:);
    figure(1);
    plot(x,Power(x,2),'r',x,Power(x,7),'g',x,Power(x,8),'b');
    xlabel('iteration')
    ylabel('Power')
    title('Plot of Power')
    figure(2);
    plot(x,SINR(x,2),'r',x,SINR(x,7),'g',x,SINR(x,8),'b');
    xlabel('iteration')
    ylabel('SINR')
    title('Plot of SINR')  
end


