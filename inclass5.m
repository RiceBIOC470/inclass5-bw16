%AW: see comment below 0.8/1.

%Inclass assignment 5. 

% 1. (a) Write a function that reads in an image and displays it so that 1%
% of the pixels are black and 1% of the pixels are white. Hint: your
% function can call the stretchlim function, see the help for that function.

function output=adjust(img)
Im=imread(img);
aj=imadjust(Im,stretchlim(Im),[0.01 0.99]);
figure
output=imshow(aj)
end

%%
% (b) Write a second function where the fraction of pixels to display as
% black or white are equal and can be specified as a second input to this
% function. 

% AW: this doesn't work as expected. It decreases rather than 
%increases contrast with increasing y. 
% should be aj = imadjust(Im, stretchlim(Im, [x 1-x]));
% -0.2.
function output=adjust(img,y)
Im=imread(img);
aj=imadjust(Im,stretchlim(Im),[y 1-y]);
figure
output=imshow(aj)
end

%%
%(c) Redo part (b) but make the option to specify the fraction
% of black/white pixels optional with a default value of 1% if not
% specified. 

function output=adjust(x,y)
if nargin==2
    Im=imread(x);
    aj=imadjust(Im,stretchlim(Im),[y 1-y]);
    figure
    output=imshow(aj)
elseif nargin==1
    Im=imread(x);
    aj=imadjust(Im,stretchlim(Im),[0.01 0.99]);
    figure
    output=imshow(aj)
end
end

%%
%2. Write a function to take the reverse complement of a DNA sequence, that
%is, returns the complementary base pair for each base, read from end
%to beginning. (e.g. the reverse compliment of ATGC is GCAT). Do not use the
%builtin MATLAB function for this. 

function r_c=ReverseComplement(sequence);
reverse='';
l=length(sequence);
for ii=1:l
    if sequence(ii)=='A'
        reverse(ii)='T';
    elseif sequence(ii)=='T'
        reverse(ii)='A';
    elseif sequence(ii)=='G'
        reverse(ii)='C';
    elseif sequence(ii)=='C'
        reverse(ii)='G';
    end
end
r_c=flip(reverse);
end
