function [car1,car2] = vectores_caracteristicas(segmentos_enventanados, P, n)
    rcepstrum = real(ifft(log(abs(fft(segmentos_enventanados))))); %rceps(palabra_senal);
    caracteristicas1 = rcepstrum(2:n,:);

    n=n-1;
    B=[zeros(n,P) caracteristicas1 zeros(n,P)];
    D=ones(1,size(B,2)-2*P);
    D=[zeros(1,P) D zeros(1,P)];
    V = -P:P;
    A=repmat(V,n,1);
    caracteristicas2 = [];
    for i=1:size(B,2)-2*P
        dividendo=sum(A.*B(:,i:i+2*P), 2);
        divisor=sum((V.*D(i:i+2*P)).^2);
        caracteristicas2=[caracteristicas2 dividendo/divisor];
    end

    car1 = (caracteristicas1-mean(caracteristicas1)) ./ std(caracteristicas1);
    car2 = (caracteristicas2-mean(caracteristicas2)) ./ std(caracteristicas2);
end