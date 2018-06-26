% Read the video clip
[fn pn] = uigetfile('*.mp4;','Select MP4 File');
complete = strcat(pn,fn);
a=VideoReader(complete);

% Initiate mydata and binary arrays with the number of frames in that clip
mydata = cell(1, a.NumberOfFrames);
binary = cell(1, a.NumberOfFrames);