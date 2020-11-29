function [ OPC ] = FuncOPC(eta,pathGainVector,powerInitiate,NOISE )
    iteration=1;
    finished=0;
    while (iteration <=20000 && finished==0)
        for i=1:5
            interference(i)=sum(powerInitiate.*pathGainVector)-(powerInitiate(i)*pathGainVector(i));
            sinrVector(i)=(powerInitiate(i)*pathGainVector(i))/(interference(i)+NOISE);
            powerUpdateVector(i)=(eta*sinrVector(i))/powerInitiate(i);
            errorOPC(i)=abs(powerUpdateVector(i)-powerInitiate(i));
            sinrVectorOPC(iteration,i)= sinrVector(i);
            powerVectorOPC(iteration,i)=powerInitiate(i);     
            powerInitiate(i)=powerUpdateVector(i);
        end
        temp=errorOPC<(10^-6); 
        if sum(temp)==5
            finished=1;
        else
            iteration=iteration+1;
        end
    end
    OPC{1}=powerVectorOPC;
    OPC{2}=sinrVectorOPC;
    OPC{3}=iteration;
end

