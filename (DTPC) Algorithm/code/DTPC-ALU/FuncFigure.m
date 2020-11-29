function FuncFigure( DTPC )
    powerInitiate=DTPC{1};
    gamma=DTPC{2};
    j=DTPC{3};
    x=1:(j);
    figure(1)
    plot(x,powerInitiate),grid on;
    xlabel('iteration')
    ylabel('power')
    title('Plot of DTPC Power')
    figure(2)
    plot(x,gamma),grid on;
    xlabel('iteration')
    ylabel('SINR')
    title('Plot of DTPC SINR')    
end


