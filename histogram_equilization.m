% Zachary Rump

% for Octave
%pkg load image

% read image from file into matrix
img = imread('./test.tif');

% get rows, columns
[M,N] = size(img);

% Number of intensity levels L = 2^8
L=256;

% get histogram h(k) => h.Values
% k => intensity level => 0 .. 255 = L-1
% use imhist instead?
h = imhist(img, L); 

% compute cumulative histogram Q(k)
% q(k) = # of pixels with intensity <= k
for m = 1:L	% For each intensity level
	% q(i) is the sum of the first i elements of histogram
	q(m) = sum(h(1:m));
end

% compute probability density function (pdf) 
% pr(k) by normalizing q(k) 
pr = q / (M*N); 
    
% compute s(k) matrix.Subs
% s(k) gives what the new intensity should be
% given the input intensity k e.g. (0->1)
for m = 1:L
	s(m) = ((L-1)/(M*N))*(sum(pr(1:m)));
end
round(s);

% transform input image
uint8 img_equalized;

% write output image
imwrite(img_equalized, "output_equalized.jpg");







