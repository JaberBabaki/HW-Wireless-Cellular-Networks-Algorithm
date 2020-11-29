function [ dis ] = FuncDistance( userJoinBs1,userJoinBs2,Bs1POSITION,Bs2POSITION )

    A=complex(Bs1POSITION(1),Bs1POSITION(2));
    B=complex(Bs2POSITION(1),Bs2POSITION(2));
    for s=1:5
        for m=1:5
            temp=userJoinBs1(s,1)- A;
            dis(s,m)=abs(temp);
        end
        for n=6:10
            temp=userJoinBs1(s,1)- B;
            dis(s,n)=abs(temp);
        end
    end

    for s=1:5
        for m=1:5
            temp=userJoinBs2(s,1)- A;
            dis((s+5),m)=abs(temp);
        end
        for n=6:10
            temp=userJoinBs2(s,1)- B;
            dis((s+5),n)=abs(temp);
        end
    end

end

