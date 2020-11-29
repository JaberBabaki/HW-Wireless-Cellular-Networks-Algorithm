clc;
close all;
clear all;

NOISE=1e-10;
OPCConstant=100;
powerInitiate=rand(1,5)*10e-12;

distnceVector=FuncPosition();%create system model and calculate distance;
pathGainVector=FuncPathGain(distnceVector);%calculate pathgaine
%disp(pathGainVector);

OPC=FuncOPC(OPCConstant,pathGainVector,powerInitiate,NOISE);
FuncFigure(OPC);
