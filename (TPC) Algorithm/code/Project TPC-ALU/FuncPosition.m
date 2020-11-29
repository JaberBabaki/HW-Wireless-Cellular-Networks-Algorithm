function [ distnceVector ] = FuncPosition()
    clear all;
    BsCOVRAGE=500;%base station coverage area
    Bs1POSITION=[250,250];
    Bs2POSITION=[750,250];

    userJoinBs1=ones(5,1);
    userJoinBs2=ones(5,1);

    for n=1:5
        x=rand(1)*BsCOVRAGE;
        y=rand(1)*BsCOVRAGE;
        if(x==Bs1POSITION(1)&&y==Bs1POSITION(2))
            x=x+1;
            y=y+1;
        end
        userJoinBs1(n,1)=complex(x,y);

        x2=rand(1)*BsCOVRAGE+BsCOVRAGE;  
        y2=rand(1)*BsCOVRAGE;
        if(x2==Bs2POSITION(2)&&y2==Bs2POSITION(2))
            x2=x2+1;
            y2=y2+1;
        end
        userJoinBs2(n,1)=complex(x2,y2);
    end
    distnceVector=FuncDistance(userJoinBs1,userJoinBs2,Bs1POSITION,Bs2POSITION);
end

