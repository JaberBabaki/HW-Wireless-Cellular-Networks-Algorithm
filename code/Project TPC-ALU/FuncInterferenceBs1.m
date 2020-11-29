function [ Intercell ] = FuncInterferenceBs1( pathGainVector,NOISE )
    randomPower = 1e-3*rand(1,10);
    m=0;
    for i=6:10
        m=m+1;
        temp_intercell=0;
        for j=1:5
            temp_intercell=temp_intercell+pathGainVector(i,j)*randomPower(j);
        end
        Intercell(m)=temp_intercell+NOISE;
    end
end

