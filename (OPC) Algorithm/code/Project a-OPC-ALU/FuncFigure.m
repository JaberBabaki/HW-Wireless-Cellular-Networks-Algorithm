function FuncFigure( OPC )
    Power=OPC{1};
    gamma=OPC{2};
    j=OPC{3};
    x=1:(j);
    figure(1)
    plot(x,Power),grid on;
    
    xlabel('Iteration')
    ylabel('Power')
    title('Plot of Power')
    figure(2)
    plot(x,gamma),grid on;
    xlabel('Iteration')
    ylabel('SINR')
    title('Plot of SINR')
    
end
  

