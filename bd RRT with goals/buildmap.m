function map = buildmap()
res = 10;
map = occupancyMap3D(res);
L=5.2;
W=10.2;
H=2;

numObs = 4;

[xGround,yGround,zGround] = meshgrid(0:(1/res):L,0:(1/res):W,0:(1/res):H);
xyzGround = [xGround(:) yGround(:) zGround(:)];
occval = 0;
setOccupancy(map,xyzGround,occval)
dim = [L,W,H,res];

% First wall

for k=0:(1/res):H
    xvec = linspace(0,L-0.2,L*res+1)';
    yvec = 0.2*ones(1,length(xvec))';
    zvec = k*ones(1,length(xvec))';
    setOccupancy(map,[xvec yvec zvec],1)
end

% Back wall

for k=0:(1/res):H
    xvec = linspace(0,L-0.2,L*res+1)';
    yvec = 10.2*ones(1,length(xvec))';
    zvec = k*ones(1,length(xvec))';
    setOccupancy(map,[xvec yvec zvec],1)
end


% Left wall

for k=0:(1/(res)):H
    yvec = linspace(0.2,W,10*res+1)';
    xvec = zeros(1,length(yvec))';

    zvec = k*ones(1,length(yvec))';
    setOccupancy(map,[xvec yvec zvec],1)
end

% Right wall

for k=0:(1/res):H
    yvec = linspace(0.2,W,10*res+1)';
    xvec = 5*ones(1,length(yvec))';

    zvec = k*ones(1,length(yvec))';
    setOccupancy(map,[xvec yvec zvec],1)
end

% Hole in front wall

for k=0.75:(1/res):1.25
    xvec = linspace(2.25,2.75,res+1)';
    zvec = k*ones(1,length(xvec))';
    yvec = 0.2*ones(1,length(xvec))';
    setOccupancy(map,[xvec yvec zvec],0)
end

for i=1:numObs
    buildObs(map,dim,i);
end

% Missing holes in left and right wall
n = [1.6, 8.4, 8.9, 9.4, 9.9];
m = [0, 5];
for i=1:length(n)
    for j=1:length(m)
        zvec = linspace(0,H,H*res+1)';
        yvec = n(i)*ones(1,length(zvec))';
        xvec = m(j)*ones(1,length(zvec))';
        setOccupancy(map,[xvec yvec zvec],1)
    end
end

% Missing holes in obstacle walls

zpt = 1.3;
m = [2.2, 6.2];
for i=1:length(m)
    xvec = linspace(0,4,4*res+1)';
    zvec = zpt*ones(1,length(xvec))';
    yvec = m(i)*ones(1,length(xvec))';
    setOccupancy(map,[xvec yvec zvec],1)
end

m = [4.2, 8.2];
for i=1:length(m)
    xvec = linspace(1,5,4*res+1)';
    zvec = zpt*ones(1,length(xvec))';
    yvec = m(i)*ones(1,length(xvec))';
    setOccupancy(map,[xvec yvec zvec],1)
end


    function map = buildObs(map,dim,i)
        L = dim(1); W = dim(2); H = dim(3); res = dim(4);

        if (i==1)||(i==3)
            n = 0:(1/res):2;
            for j=1:length(n)
                ypt = 0.2+2*i;
                xvec = linspace(0,4,res*4+1)';
                yvec = ypt*ones(1,length(xvec))';
                zvec = n(j)*ones(1,length(xvec))';
                setOccupancy(map,[xvec yvec zvec],1)
            end
        else
            n = 0:(1/res):2;

            for j=1:length(n)
                ypt = 0.2+2*i;
                xvec = linspace(1,5,res*4+1)';
                yvec = ypt*ones(1,length(xvec))';
                zvec = n(j)*ones(1,length(xvec))';
                setOccupancy(map,[xvec yvec zvec],1)
            end


        end



    end




end