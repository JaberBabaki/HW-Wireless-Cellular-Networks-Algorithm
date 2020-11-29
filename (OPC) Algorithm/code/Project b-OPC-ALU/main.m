clc;
close all;
clear all;

NOISE=10e-10;
OPCConstant=0.05;
IterNumber=1000;
powerInitiate=zeros(IterNumber,9);
powerInitiate(1,:)=rand(1,9)*1e-4;
Bs1POSITION=[250,250];
Bs2POSITION=[750,250];

positionVector=FuncPosition();%create system model and calculate distance;

for time = 1:20000  
    positionVector{2}(3,1) = complex(700 - (20*time/1000),250); 
    distnceVector=FuncDistance(positionVector{1},positionVector{2},Bs1POSITION,Bs2POSITION);
    pathGainVector=FuncPathGain(distnceVector);
    if(time >= 10000)
        g5=pathGainVector(7,1);
        g6=pathGainVector(7,2);
        g7=pathGainVector(7,3);
        g8=pathGainVector(7,4);
        pathGainVector(7,1)=pathGainVector(7,5);
        pathGainVector(7,2)=pathGainVector(7,6);
        pathGainVector(7,3)=pathGainVector(7,7);
        pathGainVector(7,4)=pathGainVector(7,8);
        pathGainVector(7,5)=g5;
        pathGainVector(7,6)=g6;
        pathGainVector(7,7)=g7;
        pathGainVector(7,8)=g7; 
    end
    OPC=FuncOPC(pathGainVector,powerInitiate(1,:),NOISE,OPCConstant);
    powerInitiate(time,:) = OPC{1};
    SIR(time,:) = OPC{2};
end
FuncFigure(powerInitiate,SIR);

