clc;
close all;
clear all;

NOISE=1e-10;
OPCConstant=10e-4;
powerInitiate=rand(1,6)*1e-10;
GAMA=0.7;
 
%gHatEU=ones(1,6)*GAMA;
%distnceVector=FuncPosition();%create system model and calculate 
%pathGainVector=FuncPathGain(distnceVector);%calculate pathgaine


output=FuncCompaireAlg(powerInitiate,NOISE,OPCConstant);
FuncFigureCompair(output);

%DTPC=FuncDTPC(pathGainVector,gHatEU,OPCConstant,NOISE );
%disp(DTPC{2}(DTPC{3},:));
%FuncFigure(DTPC);

