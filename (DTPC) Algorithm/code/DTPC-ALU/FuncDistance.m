function [ dis ] = FuncDistance( userJoinBs1,Bs1POSITION)
    A=complex(Bs1POSITION(1),Bs1POSITION(2));
    for s=1:6
            temp=userJoinBs1(s,1)-A;
            dis(s)=abs(temp);
    end
end

