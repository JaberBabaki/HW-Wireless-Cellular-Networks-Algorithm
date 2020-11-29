function [ distnceVector ] = FuncPosition()
    clear all;
    BsCOVRAGE=500;%base station coverage area
    Bs1POSITION=[250,250];
    userJoinBs1=ones(6,1);
    for n=1:6
        x=rand(1)*BsCOVRAGE;
        y=rand(1)*BsCOVRAGE;
        if(x==Bs1POSITION(1)&&y==Bs1POSITION(2))
            x=x+1;
            y=y+1;
        end
        userJoinBs1(n,1)=complex(y,x);
    end
    distnceVector=FuncDistance(userJoinBs1,Bs1POSITION);
end

