# 465501
## Tests
Required test images are:
 - Figure 3.8
 - Figure 3.9
 - Figure 3.16
## Organization 
### sample_images 
These are the raw examples from the textbook / course website.
### inputs
These are the files used as inputs to the program.  
Had some trouble using the images from textbook with whatever imagemagick library versions I have so I used imagemagick to convert them first:
```
convert sample_images/sample.tif inputs/sample.tif
```
### outputs 
These are the output images from my histogram_equilization.m after processing.
### comparison_outputs
These are the images produced using the histeq` function from Octave's image package.  
I used these results as a sort of 'ground truth' to compare the results of my program. 
The documentation for this function reports: 
```
Note that the algorithm used for histogram equalization gives
results qualitatively comparable but numerically different from
MATLAB implementation.
```


