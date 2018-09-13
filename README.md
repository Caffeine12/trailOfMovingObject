# Image Processing : Detection of trail of a moving object #

Sometimes it is needed to find the trail of a moving object from a video clip. Like analysing satellite view. Detecting path of a car or something. In this project I have shown a way to detect trail of a moving object.

1. First a video clip has been taken as input in variable 'a'. Where a blue dot is on the move.
2. Then 'mydata' and 'binary' arrays with the number of frames in that clip have been initiated. 'mydata' will be holding the images in array for post processing the images. 'binary' array is the array to hold the binary images.
3. Then a loop has been initiated to read each and every frame and process one after another.
4. Firstly, the loop will read the kth frame and store this frame in mydata{k}. Then it'll convert the frame into GrayScale and store it in 'I'. Then it will determine the edges of the object using the Laplacian of Gaussian method and will store it into a two dimensional array.
5. Then the inner area covered by the edge will be filled with true value and will be stored into 'BWfinal' binary array. Then it will finally store this binary image into the kth index of the 'binary' array
6. Lastly, successive frames are being ORed(Boolean Operation) to get the trail of that moving dot.
7. Trail of the moving object is shown.


### Sample Input ###
<a href="https://www.youtube.com/watch?v=uItXdjRGHwM&list=PLCOd1cb1NaFAiinDHC0OQXDhtppMV9YFW" target="_blank"><img src="https://github.com/Caffeine12/trailOfMovingObject/blob/master/SampleInut.JPG"
alt="Sample Input" width="240" height="180" border="10" /></a>

### Sample Output ###
![Sobel Output](https://github.com/Caffeine12/trailOfMovingObject/blob/master/outputTrail.jpg "Sobel Output")
