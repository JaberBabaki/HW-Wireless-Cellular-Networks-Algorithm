function [ interference] = FuncInterference( powerInitiate,pathGainVector )
    for i=1:5
        interference(i)=sum(powerInitiate*pathGainVector)-(powerInitiate(i)*pathGainVector(i));
    end


end

