
%Taking an image and turning it into grayscale
A = imread('sampleIMAGE.jpg');
I = rgb2gray(A);
imwrite(I,'grayscale.png');
figure;
image(A);
figure;
image(I);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Generating the dct matrix
N =8;
C = zeros(N,N);
u = 100;
for k = 1:1:N
    for r = 1:1:N
        if k == 1
            u = sqrt(1/N);
        else
            u= sqrt(2/N);
        end
        C(k,r)= u * cos((pi/N)*(k-1)*((r-1)+0.5));
    end
end
C8 = C;
C8T = C8.';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Generating the DCTQ and taking r from user
DCTQ= [16 11 10 16 24 40 51 61 ; 
       12 12 14 19 26 58 60 55; 
       14 13 16 24 40 57 69 56; 
       14 17 22 29 51 87 80 62; 
       18 22 37 56 68 109 103 77; 
       24 35 55 64 81 194 113 92; 
       49 64 78 87 103 121 120 101; 
       72 92 95 98 121 100 103 99];
prompt = 'Enter the value of r: ';
r=input(prompt);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DCTimage=DCTtransforming(I,C8,C8T);
imwrite(DCTimage,'DCTimage.png');
figure;
image(DCTimage);
 
Quantizedimage=Quantizing(DCTimage,r,DCTQ);
imwrite(Quantizedimage,'Quantizedimage.png');
figure;
image(Quantizedimage);

Rescalededimage=Rescaling(Quantizedimage,r,DCTQ);
imwrite(Rescalededimage,'Rescaledimage.png');
figure;
image(Rescalededimage);

Restoredimage=Restoring(Rescalededimage,C8,C8T);
imwrite(Restoredimage,'Restoredimage.png');
figure;
image(Restoredimage);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


