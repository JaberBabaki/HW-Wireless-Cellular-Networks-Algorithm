function [ gamma ] = FuncSINR( pathGainVector,randomPower,NOISE )
for i=1:6
    t=0;
    for j=1:6
        if (i~=j)
             t=t+pathGainVector(j)*randomPower(j);
        end
    end
    t=t+NOISE;
    gamma(i)=(randomPower(i)*pathGainVector(i))/(t);
end
end

