% Read the video clip
[fn pn] = uigetfile('*.mp4;','Select MP4 File');
complete = strcat(pn,fn);
a=VideoReader(complete);

% Initiate mydata and binary arrays with the number of frames in that clip
mydata = cell(1, a.NumberOfFrames);
binary = cell(1, a.NumberOfFrames);

%Edge detection of each frame
for k = 1:a.NumberOfFrames;  
    % Read the kth frame and store it
    mydata{k} = read(a, k); 
    
    %Converting to grayscale image
    I = rgb2gray(mydata{k});
    
    %Determine the edges of the object using the Laplacian of Gaussian method
    %Fill the inner body with true value
    %And store it into a two dimensional array
    [~, threshold] = edge(I, 'log');
    fudgeFactor = .5;
    BWs = edge(I,'log', threshold * fudgeFactor);
    se90 = strel('line', 3, 90);
    se0 = strel('line', 3, 0);
    BWsdil = imdilate(BWs, [se90 se0]);
    BWdfill = imfill(BWsdil, 'holes');
    BWnobord = imclearborder(BWdfill, 4);
    seD = strel('diamond',1);
    BWfinal = imerode(BWnobord,seD);
    BWfinal = imerode(BWfinal,seD);
    binary{k}=BWfinal;
end

% Applying boolean operation(OR) to each frame in the binary clip 
for i = 1:a.NumberOfFrames
    if(i==1)
        continue;
    else
        binary{i} = binary{i} | binary{i-1};
    end
end

% Trail of the object is shown
figure, imshow(binary{a.NumberOfFrames});
