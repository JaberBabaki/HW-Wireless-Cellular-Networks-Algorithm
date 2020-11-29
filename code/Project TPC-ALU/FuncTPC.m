function [ TPC ] = FuncTPC(pMaxEU,pathGainVector,NOISE,gHatEU )
ITERATION=1000;
randomPower = 1e-3*rand(1,10);
gamma(1,:)=FuncSINR(pathGainVector,randomPower,NOISE);
for j=2:ITERATION
    for i=1:10
        randomPower(j,i)=min(pMaxEU(i),randomPower((j-1),i)*(gHatEU(i)/gamma((j-1),i)));
    end
    gamma(j,:)=FuncSINR(pathGainVector,randomPower(j,:),NOISE);
    if (abs(randomPower(j,:)-randomPower(j-1,:))<=0.0001)
        break
    end
end
TPC{1}=randomPower;
TPC{2}=gamma;
TPC{3}=j;


end

