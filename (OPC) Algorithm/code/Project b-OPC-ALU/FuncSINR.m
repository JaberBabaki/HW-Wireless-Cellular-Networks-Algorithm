function [ gamma ] = FuncSINR( pathGainVector,randomPower,NOISE )
for i=1:9
    t=0;
    for j=1:9
        if (i~=j)
             t=t+pathGainVector(j,i)*randomPower(j);
        end
    end
    t=t+NOISE;
    gamma(i)=(randomPower(i)*pathGainVector(i,i))/(t);
end
end

