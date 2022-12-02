function [P,s,t,PL,sL,tL]=rSTLfromTuring(pCount,npCount,npRcount,gridSize)
 pCount=10;
 npCount=5;
 npRcount=5;
 gridSize = 32;



patternSize = gridSize;


PatternParameters.CA = 0.2;
PatternParameters.CB = 20;
PatternParameters.dt = 0.01;
PatternParameters.T = 60;

NPparameters(1) = PatternParameters;
NPparameters(1).CA = 1.44;
NPparameters(1).CB = 5.27;

NPparameters(2) = PatternParameters;
NPparameters(2).CA = 1;
NPparameters(2).CB = 3;


NPparameters(3) = PatternParameters;
NPparameters(3).CA = 0.1;
NPparameters(3).CB = 1;

NPparameters(4) = PatternParameters;
NPparameters(4).CA = 0.08;
NPparameters(4).CB = 19.3;


NPparameters(4) = PatternParameters;
NPparameters(4).CA = 3;
NPparameters(4).CB = 29;

Rparam = PatternParameters;

t=0:PatternParameters.dt:PatternParameters.T;

P=zeros(pCount+npCount+npRcount,patternSize*patternSize,length(t));

tic
for i=1:pCount
    
    [A At] = TuringSimulation(patternSize, PatternParameters, false);
    
    L=length(At(1,1,:));
    if L<length(t)
        last=At(:,:,end);
        for ii=(L+1):length(t)
            At(:,:,ii)=last;
        end
    end

    
    cellCount=0;
    for j=1:patternSize
        for k=1:patternSize
            cellCount=cellCount+1;
            P(i,cellCount,:)=At(j,k,:);
        end
    end
end
toc

tic
for i=1:npCount
    
    r=randi([1,length(NPparameters)]);
    [A At] = TuringSimulation(patternSize, NPparameters(r), false);
    
    L=length(At(1,1,:));
    if L<length(t)
        last=At(:,:,end);
        for ii=(L+1):length(t)
            At(:,:,ii)=last;
        end
    end
    
    cellCount=0;
    for j=1:patternSize
        for k=1:patternSize
            cellCount=cellCount+1;
            P(i+pCount,cellCount,:)=At(j,k,:);
        end
    end
        
end
toc

tic
count = 0;
uniCount = 0;

rp = 0.4;
for i=1:npRcount
    while(1)
        Rparam.CA = rand()*30;
        Rparam.CB = rand()*30;
        if (Rparam.CA > PatternParameters.CA*(1-rp) && Rparam.CA < PatternParameters.CA*(1+rp) ...
                && Rparam.CB > PatternParameters.CB*(1-rp) && Rparam.CB <  PatternParameters.CB*(1+rp))
            Rparam.CA = rand()*30;
            Rparam.CB = rand()*30;
        else
            break;
        end
    end
    
    [A At] = TuringSimulation(patternSize, Rparam, false);
    
    L=length(At(1,1,:));
    if L<length(t)
        last=At(:,:,end);
        for ii=(L+1):length(t)
            At(:,:,ii)=last;
        end
    end
    
    cellCount=0;
    for j=1:patternSize
        for k=1:patternSize
            cellCount=cellCount+1;
            P(i+pCount+npCount,cellCount,:)=At(j,k,:);
        end
    end
    
end
toc

s=[ones(1,pCount) -ones(1,npCount+npRcount)];




r=size(P,1);
c=size(P,2);
d=size(P,3);
Pt=reshape(P,r*c,1,d);
PL=Pt(:,:,1);
for i=2:99
    PL(:,:,i)=Pt(:,:,i*floor(d/100));
end
PL(:,:,100)=Pt(:,:,end);
sL=repmat(s,1,c);
tL=t(1);
for i=2:99
    tL(i)=t(i*floor(d/100));
end
tL(100)=t(end);



end

























