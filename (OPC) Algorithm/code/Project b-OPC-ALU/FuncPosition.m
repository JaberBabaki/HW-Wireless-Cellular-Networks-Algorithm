function [ distnceVector ] = FuncPosition()
    clear all;
    BsCOVRAGE=500;%base station coverage area
    Bs1POSITION=[250,250];
    Bs2POSITION=[750,250];

    userJoinBs1=ones(4,1);
    userJoinBs2=ones(5,1);
  
    userJoinBs1(1,1)=complex(50,250);
    userJoinBs1(2,1)=complex(150,250);
    userJoinBs1(3,1)=complex(400,250);
    userJoinBs1(4,1)=complex(450,250);
    
    userJoinBs2(1,1)=complex(550,250);
    userJoinBs2(2,1)=complex(600,250);
    userJoinBs2(3,1)=complex(700,250);
    userJoinBs2(4,1)=complex(850,250);
    userJoinBs2(5,1)=complex(950,250);
    
    distnceVector{1}=userJoinBs1;
    distnceVector{2}=userJoinBs2;
    %distnceVector=FuncDistance(userJoinBs1,userJoinBs2,Bs1POSITION,Bs2POSITION);
end

