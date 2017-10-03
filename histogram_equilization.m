% Zachary Rump

% Required for octave - can comment out for matlab
pkg load image

% read image from file into matrix
img = imread('in.tif');

% get rows, columns
[M,N] = size(img);

% Number of intensity levels L = 2^8
L=256;

% get histogram h(k) = n_k
% n_k => number of pixels with intensity level k, k=0 .. 255 
h = imhist(img, L); 

% compute probability density function (pdf) 
% pr(k) by normalizing h(k)
 for i = 1:L	% For each intensity level
	% q(i) is the sum of the first i elements of histogram
	pr = h/(M*N);
end

% compute s(k) matrix.
% s(k) gives what the new intensity should be
% given the input intensity k e.g. (0->1)
for i = 1:L
	s(i) = round( (L-1)*sum(pr(1:i)) );
end

for i = 1:M
  for j = 1:N
    img_equalized(i,j) = s( img(i,j)+1 );
  end
end

% Use octave's histeq for comparison (ground-truth)
J = histeq(double(img), L);
imwrite(J, 'out_control.tif');

% write output image
img_equalized = uint8(img_equalized);
imwrite(img_equalized, "out.tif");







