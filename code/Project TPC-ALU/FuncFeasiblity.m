function [ Feasible ] = FuncFeasiblity(gHatEU,pathGainVector,NOISE,pMaxEU,pMinEU)
    A=zeros(10,10);
    U=zeros(10,1);
    P=zeros(10,1);
    I=eye(10,10);
    for i=1:10
        for j=1:10
            if (i==j)
                A(i,j)=0;
            else
                A(i,j)=(gHatEU(i))*(pathGainVector(j,i)/pathGainVector(i,i));
            end
        end
        U(i,1)=(gHatEU(i)*NOISE)/pathGainVector(i,i);
    end
    P=inv(I-A)*U;
    if(P>=pMinEU&P<=pMaxEU)
        Feasible='Feasible  ';
    else
        Feasible='InFeasible';
    end
end

