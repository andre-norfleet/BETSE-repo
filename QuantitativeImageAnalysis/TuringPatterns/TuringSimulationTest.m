

function A = TuringSimulationTest(systemSize, parameters, plotit)





    A = rand(systemSize)*16;
    B = rand(systemSize)*16;
    
    % testing:
    TRAJECTORY = load('/Users/ebru/Desktop/TuringDataSet/JavaOptimization/trajectory.txt');
    [r,c] = size(TRAJECTORY);
    for i=1:r
        M = TRAJECTORY(i,:);
        M = reshape(M, 2,1024);
        An{i} = reshape(M(1,:), systemSize, systemSize);
        Bn{i} = reshape(M(2,:), systemSize, systemSize);
    end
    A = An{1};
    B = Bn{1};
    
    
    
    dt = parameters.dt;
    T = parameters.T;
       
    kernel = zeros(3);
    kernel(1,2) = 1;
    kernel(2,1) = 1;
    kernel(2,3) = 1;
    kernel(3,2) = 1;
    kernel = kernel/4;
    kernel(2,2) = -1;
    
    if(plotit)
        figure;
        hold on;
    end
    counter = 1;
    maxA = 0;
    img = zeros(systemSize, systemSize, 3);
    for t=0:dt:T
        counter = counter + 1;
        
        % dA = parameters.CA*(conv2( [0 A(end, :) 0 ; A(:,end) A A(:,1) ; 0 A(1,:) 0], kernel, 'same'));
        dA = parameters.CA*(conv2( [0 A(1, :) 0 ; A(:,1) A A(:,end) ; 0 A(end,:) 0], kernel, 'same'));
        AB = A.*B;
        
        A = A + dt*(AB - A - 12 + dA(2:end-1,2:end-1));
        
        A( A < 0) = 0;
        
        % dB = parameters.CB*(conv2([0 B(end, :) 0 ; B(:,end) B B(:,1) ; 0 B(1,:) 0], kernel, 'same'));
        dB = parameters.CB*(conv2([0 B(1, :) 0 ; B(:,1) B B(:,end) ; 0 B(end,:) 0], kernel, 'same'));

        B = B + dt*(16 - AB + dB(2:end-1, 2:end-1));
        B(B < 0) = 0;
        
        
        % % % % % % % % % % 
        diA = abs(An{counter} - A);
        diB = abs(Bn{counter} - B);
        
        max(max(diA))

        max(max(diB))

        if(plotit && rem(counter, 50) == 0)
            img(:,:,1) = A/max(max(A));
            image(img);
            maxA = max( maxA, max(max(A)));
            drawnow;
                    
        end
        
    end
    
     
end








