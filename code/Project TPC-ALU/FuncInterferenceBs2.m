function [ Intercell ] = FuncInterferenceBs2( pathGainVector,NOISE )
    randomPower = 1e-3*rand(1,10);
    for i=1:5
        temp_intercell=0;
        for j=6:10
            temp_intercell=temp_intercell+pathGainVector(i,j)*randomPower(j);
        end
        Intercell(i)=temp_intercell+NOISE;
    end
end

