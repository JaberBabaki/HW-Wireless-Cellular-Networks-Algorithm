function [ gamma ] = FuncSINR( pathGainVector,randomPower,NOISE )
for i=1:10
    t=0;
    for j=1:10
        if (i~=j)
             t=t+pathGainVector(i,j)*randomPower(j);
        end
    end
    t=t+NOISE;
    gamma(i)=(randomPower(i)*pathGainVector(i,i))/(t);
end
end

