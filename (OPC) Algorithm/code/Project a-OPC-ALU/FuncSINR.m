function [ gamma ] = FuncSINR( interference,pathGainVector,powerInitiate,NOISE )
    for i=1:5
        gamma(i)=(powerInitiate(i)*pathGainVector(i))/(interference(i)+NOISE);
    end
end

