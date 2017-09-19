% Zachary Rump

% read image from file into matrix
img = imread('./test.jpg');

% get rows, columns
[M,N] = size(img);

% Number of intensity levels L = 2^8
L=256;

% get histogram h(k) => h.Values
% k => intensity level => 0 .. 255 = L-1
% use imhist instead?
h = histogram(img, L); 

% compute cumulative histogram Q(k)
% q(k) = # of pixels with intensity <= k
for i = 0:(L-1)	% For each intensity level
	% q(i) is the sum of the first i elements of histogram
	q(i) = sum(h.Values(0:i));
end

% compute probability density function (pdf) 
% pr(k) by normalizing q(k) 
pr = q / (M*N); 

% compute s(k) matrix.
% s(k) gives what the new intensity should be
% given the input intensity k e.g. (0->1)
for i = 0:(L-1)
	s(i) = round((((L-1)/M*N)*(Sum(pr(0:i))));
end

% transform input image
for i = 1:M % rows
	for j = 1:N; % cols
		img_equalized(i,j) = s(img(i,j));
	end
end

% write output image
imwrite(img_equalized, "output_equalized.jpg");







