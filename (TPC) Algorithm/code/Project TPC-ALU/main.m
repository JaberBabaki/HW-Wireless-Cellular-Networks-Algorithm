clc;
close all;
clear all;

%Define const variable
NOISE=1e-10;
POWERMAX=1e-3;
USERS=10;
GAMA=0.05;

gHatEU=ones(1,USERS)*GAMA;%gamaHat Each User
pMaxEU = ones(1,USERS)*POWERMAX;%maximum power each user
pMinEU = zeros(1,USERS); %minimum power each user

distnceVector=FuncPosition();%create system model and calculate distance;
pathGainVector=FuncPathGain(distnceVector);%calculate pathgaine
Feasible=FuncFeasiblity(gHatEU,pathGainVector,NOISE,pMaxEU,pMinEU );%check fesibility system

%change distribution users and check agin feasibility
while(Feasible~='Feasible  ')
    distnceVector=FuncPosition();%FuncDistance(userJoinBs1,userJoinBs2,Bs1POSITION,Bs2POSITION);
    pathGainVector=FuncPathGain(distnceVector);
    Feasible=FuncFeasiblity(gHatEU,pathGainVector,NOISE,pMaxEU,pMinEU );
end

TPC=FuncTPC(pMaxEU,pathGainVector,NOISE,gHatEU);%Run TPC algoritm
FuncFigure(TPC);%show chart

InterferenceBs1=FuncInterferenceBs1(pathGainVector,NOISE);%calculate interferences on Bs1
InterferenceBs2=FuncInterferenceBs2(pathGainVector,NOISE);%calculate interferences on Bs2

disp(InterferenceBs1);%show interferences on Bs1
disp(InterferenceBs2);%show interferences on Bs2
