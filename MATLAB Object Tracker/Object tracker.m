%1
clc
clear all
close all

im = imread ('license plate2.jpg');
im2 = rgb2gray(im);
ime = edge (im2,'sobel');
ime = imdilate(ime, strel ('diamond', 1));
L = imfill (ime,'holes');
st1 = strel ('line', 15, 0);
st2 = strel ('line', 15, 90);
L = imopen (L, st1);
L = imopen (L, st2);

%2
[lab,n] = bwlabel(L);
dat = regionprops (lab,'All');
figure , imshow (L)
a=1;
for i=1:n
    b= dat(i);
    b1 = b.BoundingBox;
    b2 = b.Extent ;
    if b1(1,3) >= b1(1,4)*3 && b2 >= 0.5
        b3 = b.Area;
        b4 = b.Orientation;
        if b3 > a
            a = b3 ;
            out = b1;
            outzavie = b4;
        end
    end
end
imrect(gca,out);

%3
im2 = imcrop ( im ,out );
im2 = imrotate ( im2,0-outzavie );
im3 = im2bw ( im2 ) ;
im3 = imfill ( im3,'holes' ) ;
se = strel ('disk', 2);
im3 = imopen ( im3, se );
se = strel('line',5,0);
im3 = imclose(im3, se );

%4
lab2 = bwlabel(im3 );
dat2 = regionprops(lab2,'BoundingBox');
dat2 = dat2.BoundingBox ;
im2 = imcrop (im2, [ dat2(1,1)+5, dat2(1,2)+5, dat2(1,3)-10 , dat2(1,4)-10 ]);
im2 = ~im2;
im2 = bwareaopen(im2,50);

%5
[x,y]=size(im2);
s= sum(im2);
SA(:,:)=s(1,:,:);
plot(SA);
y1 = zeros(1,16);

%268
n=1;        
for i = 2:y
    if s(1,i)>=1 && s(1,i-1)==0
        y1(1,n)=i;
        n=n+1;
    end
    if s(1,i)==0 && s(1,i-1)>=1
        y1(1, n) =i;
        n= n+1;
    end
end

m1 = imcrop (im2, [y1(1,1), 0, y1(1,2)-y1(1,1)-1, x]);
m2 = imcrop (im2, [y1(1,3), 0, y1(1,4)-y1(1,3)-1, x]);
m3 = imcrop (im2, [y1(1,5), 0, y1(1,6)-y1(1,5)-1, x]);
m4 = imcrop (im2, [y1(1,7), 0, y1(1,8)-y1(1,7)-1, x]);
m5 = imcrop (im2, [y1(1,9), 0, y1(1,10)-y1(1,9)-1, x]);
m6 = imcrop (im2, [y1(1,11), 0, y1(1,12)-y1(1,11)-1, x]);
m7 = imcrop (im2, [y1(1,13), 0, y1(1,14)-y1(1,13)-1, x]);
m8 = imcrop (im2, [y1(1,15), 0, y1(1,16)-y1(1,15)-1, x]);

[x,y]= find(m1==1);
minx = min(x);
maxx = max(x);
%m1 = imcrop(im2,[y1(1,1), minx, y1(1,2)-y1(1,1)-1, maxx-minx]);
m1 = imcrop(im2, [y1(1,1), minx, y1(1,2)-y1(1,1)-1, maxx-minx]);

m1 = imresize(m1, [60 30]);

[x,y] = find(m2 == 1);
minx = min(x) ;
maxx = max(x) ;
m2 = imcrop (im2, [y1(1,3) , minx , y1(1,4)-y1(1,3)-1, maxx-minx ]);
m2 = imresize (m2, [60 30]);

[x,y] = find (m3 == 1);
minx = min(x) ;
maxx = max(x) ;
m3 = imcrop (im2 ,[ y1(1,5) , minx , y1(1,6)-y1(1,5)-1, maxx-minx ]);
m3 = imresize(m3, [60 30]) ;

[x,y] = find (m4==1);
minx = min(x);
maxx = max(x);
m4= imcrop (im2,[ y1(1,7), minx , y1(1,8)-y1(1,7)-1, maxx-minx ]);
m4 = imresize (m4, [60 30]);

%269
[x,y] = find (m5==1);
minx = min(x);
maxx = max(x);
m5 = imcrop (im2, [yl(1,9) , minx, y1(1,10)-y1(1,9)-1 , maxx-minx ]);
m5 = imresize (m5, [60 30]);

[x,y] = find (m6==1);
minx = min(x);
maxx = max(x);
m6 = imcrop (im2, [y1(1,11) , minx, y1(1,12)-y1(1, 11)-1 , maxx-minx ]);
m6 = imresize (m6, [60 30]);

[x,y]= find (m7==1);
minx = min(x);
maxx = max(x);
m7 = imcrop ( im2, [y1(1,13) , minx, y1(1,14)-y1(1,13)-1, maxx-minx ]);
m7 = imresize (m7, [60 30]);

[x,y]= find (m8==1);
minx = min(x);
maxx = max(x);
m8 = imcrop ( im2, [y1(1,15) , minx , y1(1,16)-y1(1,15)-1 , max-minx ]);
m8 = imresize (m8, [60 30]);

%6
adadel = imread ( 'adade1.bmp');
adade1 = ~adade1;

adade2 = imread ( 'adade2.bmp');
adade2 = ~adade2;

adade3 = imread ( 'adade3.bmp');
adade3 = ~adade3;

adade4 = imread ( 'adade4.bmp');
adade4 = ~adade4;

adade5 = imread ( 'adade5.bmp');
adade5 = ~adade5;

adade6 = imread ( 'adade6.bmp');
adade6 = ~adade6;

adade7 = imread ( 'adade7.bmp');
adade7 = ~adade7;

adade8 = imread ( 'adade8.bmp');
adade8 = ~adade8;

adade9 = imread ( 'adade9.bmp');
adade9 = ~adade9;

%270

te = imread ( 'te.bmp');
te = ~te ;

lam = imread ( 'lam.bmp' );
lam = ~lam ;

jim = imread ('jim.bmp');
jim = ~jim ;

dal = imread ( 'dal.bmp' );
dal = ~dal ;

ta = imread ('ta.bmp' );
ta = ~ta;

%7
mach1 = zeros (1,14);
mach2 = zeros (1,14);
mach3 = zeros (1,14);
mach4 = zeros (1,14);
mach5 = zeros (1,14);
mach6 = zeros (1,14);
mach7 = zeros (1,14);
mach8 = zeros (1,14);

n= 1;
for x = 1:60
    for y =1:30
        if m1(x,y) == adade1(x,y)
           mach1(n) = mach1(n)+1;
        else
           mach1(n) = mach1(n)-1;
        end
        if m2(x,y) == adade1(x,y)
           mach2(n) = mach2(n)+1;
        else
           mach2(n) = mach2(n)-1;
        end
        if m4(x,y) == adade1(x,y)
           mach4(n) = mach4(n)+1;
        else
           mach4(n)=mach4(n)-1;
        end
        if m5(x,y) == adade1(x,y)
           mach5(n) = mach5(n)+1;
        else
           mach5(n) = mach5(n)-1;
        end

        if m6(x,y) == adade1(x,y)
           mach6(n) = mach6(n)+1;
        else
           mach6(n) = mach6(n)-1;
        end

        if m7(x,y) == adade1(x,y)
           mach7(n) = mach7(n)+1;
        else
           mach7(n) = mach7(n)-1;
        end
        
        if m8(x,y) == adade1(x,y)
           mach8(n) = mach8(n)+1;
        else
           mach8(n) = mach8(n)-1;
        end
    end
end


% n=2

n= 2;
for x = 1:60
    for y =1:30
        if m1(x,y) == adade2(x,y)
           mach1(n) = mach1(n)+1;
        else
           mach1(n) = mach1(n)-1;
        end
        if m2(x,y) == adade2(x,y)
           mach2(n) = mach2(n)+1;
        else
           mach2(n) = mach2(n)-1;
        end
        if m4(x,y) == adade2(x,y)
           mach4(n) = mach4(n)+1;
        else
           mach4(n) = mach4(n)-1;
        end
        if m5(x,y) == adade2(x,y)
           mach5(n) = mach5(n)+1;
        else
           mach5(n) = mach5(n)-1;
        end

        if m6(x,y) == adade2(x,y)
           mach6(n) = mach6(n)+1;
        else
           mach6(n) = mach6(n)-1;
        end

        if m7(x,y) == adade2(x,y)
           mach7(n) = mach7(n)+1;
        else
           mach7(n) = mach7(n)-1;
        end
        
        if m8(x,y) == adade2(x,y)
           mach8(n) = mach8(n)+1;
        else
           mach8(n) = mach8(n)-1;
        end
    end
end

% n=3
n= 3;
for x = 1:60
    for y =1:30
        if m1(x,y) == adade3(x,y)
           mach1(n) = mach1(n)+1;
        else
           mach1(n) = mach1(n)-1;
        end
        if m2(x,y) == adade3(x,y)
           mach2(n) = mach2(n)+1;
        else
           mach2(n) = mach2(n)-1;
        end
        if m4(x,y) == adade3(x,y)
           mach4(n) = mach4(n)+1;
        else
           mach4(n) = mach4(n)-1;
        end
        if m5(x,y) == adade3(x,y)
           mach5(n) = mach5(n)+1;
        else
           mach5(n) = mach5(n)-1;
        end

        if m6(x,y) == adade3(x,y)
           mach6(n) = mach6(n)+1;
        else
           mach6(n) = mach6(n)-1;
        end

        if m7(x,y) == adade3(x,y)
           mach7(n) = mach7(n)+1;
        else
           mach7(n) = mach7(n)-1;
        end
        
        if m8(x,y) == adade3(x,y)
           mach8(n) = mach8(n)+1;
        else
           mach8(n) = mach8(n)-1;
        end
    end
end

% n=4

n= 4;
for x = 1:60
    for y =1:30
        if m1(x,y) == adade4(x,y)
           mach1(n) = mach1(n)+1;
        else
           mach1(n) = mach1(n)-1;
        end
        if m2(x,y) == adade4(x,y)
           mach2(n) = mach2(n)+1;
        else
           mach2(n) = mach2(n)-1;
        end
        if m4(x,y) == adade4(x,y)
           mach4(n) = mach4(n)+1;
        else
           mach4(n) = mach4(n)-1;
        end
        if m5(x,y) == adade4(x,y)
           mach5(n) = mach5(n)+1;
        else
           mach5(n) = mach5(n)-1;
        end

        if m6(x,y) == adade4(x,y)
           mach6(n) = mach6(n)+1;
        else
           mach6(n) = mach6(n)-1;
        end

        if m7(x,y) == adade4(x,y)
           mach7(n) = mach7(n)+1;
        else
           mach7(n) = mach7(n)-1;
        end
        
        if m8(x,y) == adade4(x,y)
           mach8(n) = mach8(n)+1;
        else
           mach8(n) = mach8(n)-1;
        end
    end
end

% n=5
n= 5;
for x = 1:60
    for y =1:30
        if m1(x,y) == adade5(x,y)
           mach1(n) = mach1(n)+1;
        else
           mach1(n) = mach1(n)-1;
        end
        if m2(x,y) == adade5(x,y)
           mach2(n) = mach2(n)+1;
        else
           mach2(n) = mach2(n)-1;
        end
        if m4(x,y) == adade5(x,y)
           mach4(n) = mach4(n)+1;
        else
           mach4(n) = mach4(n)-1;
        end
        if m5(x,y) == adade5(x,y)
           mach5(n) = mach5(n)+1;
        else
           mach5(n) = mach5(n)-1;
        end

        if m6(x,y) == adade5(x,y)
           mach6(n) = mach6(n)+1;
        else
           mach6(n) = mach6(n)-1;
        end

        if m7(x,y) == adade5(x,y)
           mach7(n) = mach7(n)+1;
        else
           mach7(n) = mach7(n)-1;
        end
        
        if m8(x,y) == adade5(x,y)
           mach8(n) = mach8(n)+1;
        else
           mach8(n) = mach8(n)-1;
        end
    end
end

% n=6
n= 6;
for x = 1:60
    for y =1:30
        if m1(x,y) == adade6(x,y)
           mach1(n) = mach1(n)+1;
        else
           mach1(n) = mach1(n)-1;
        end
        if m2(x,y) == adade6(x,y)
           mach2(n) = mach2(n)+1;
        else
           mach2(n) = mach2(n)-1;
        end
        if m4(x,y) == adade6(x,y)
           mach4(n) = mach4(n)+1;
        else
           mach4(n) = mach4(n)-1;
        end
        if m5(x,y) == adade6(x,y)
           mach5(n) = mach5(n)+1;
        else
           mach5(n) = mach5(n)-1;
        end

        if m6(x,y) == adade6(x,y)
           mach6(n) = mach6(n)+1;
        else
           mach6(n) = mach6(n)-1;
        end

        if m7(x,y) == adade6(x,y)
           mach7(n) = mach7(n)+1;
        else
           mach7(n) = mach7(n)-1;
        end
        
        if m8(x,y) == adade6(x,y)
           mach8(n) = mach8(n)+1;
        else
           mach8(n) = mach8(n)-1;
        end
    end
end

% n=7
n= 7;
for x = 1:60
    for y =1:30
        if m1(x,y) == adade7(x,y)
           mach1(n) = mach1(n)+1;
        else
           mach1(n) = mach1(n)-1;
        end
        if m2(x,y) == adade7(x,y)
           mach2(n) = mach2(n)+1;
        else
           mach2(n) = mach2(n)-1;
        end
        if m4(x,y) == adade7(x,y)
           mach4(n) = mach4(n)+1;
        else
           mach4(n) = mach4(n)-1;
        end
        if m5(x,y) == adade7(x,y)
           mach5(n) = mach5(n)+1;
        else
           mach5(n) = mach5(n)-1;
        end

        if m6(x,y) == adade7(x,y)
           mach6(n) = mach6(n)+1;
        else
           mach6(n) = mach6(n)-1;
        end

        if m7(x,y) == adade7(x,y)
           mach7(n) = mach7(n)+1;
        else
           mach7(n) = mach7(n)-1;
        end
        
        if m8(x,y) == adade7(x,y)
           mach8(n) = mach8(n)+1;
        else
           mach8(n) = mach8(n)-1;
        end
    end
end

% n=8
n= 8;
for x = 1:60
    for y =1:30
        if m1(x,y) == adade8(x,y)
           mach1(n) = mach1(n)+1;
        else
           mach1(n) = mach1(n)-1;
        end
        if m2(x,y) == adade8(x,y)
           mach2(n) = mach2(n)+1;
        else
           mach2(n) = mach2(n)-1;
        end
        if m4(x,y) == adade8(x,y)
           mach4(n) = mach4(n)+1;
        else
           mach4(n) = mach4(n)-1;
        end
        if m5(x,y) == adade8(x,y)
           mach5(n) = mach5(n)+1;
        else
           mach5(n) = mach5(n)-1;
        end

        if m6(x,y) == adade8(x,y)
           mach6(n) = mach6(n)+1;
        else
           mach6(n) = mach6(n)-1;
        end

        if m7(x,y) == adade8(x,y)
           mach7(n) = mach7(n)+1;
        else
           mach7(n) = mach7(n)-1;
        end
        
        if m8(x,y) == adade8(x,y)
           mach8(n) = mach8(n)+1;
        else
           mach8(n) = mach8(n)-1;
        end
    end
end

% n=9
n= 9;
for x = 1:60
    for y =1:30
        if m1(x,y) == adade9(x,y)
           mach1(n) = mach1(n)+1;
        else
           mach1(n) = mach1(n)-1;
        end
        if m2(x,y) == adade9(x,y)
           mach2(n) = mach2(n)+1;
        else
           mach2(n) = mach2(n)-1;
        end
        if m4(x,y) == adade9(x,y)
           mach4(n) = mach4(n)+1;
        else
           mach4(n) = mach4(n)-1;
        end
        if m5(x,y) == adade9(x,y)
           mach5(n) = mach5(n)+1;
        else
           mach5(n) = mach5(n)-1;
        end

        if m6(x,y) == adade9(x,y)
           mach6(n) = mach6(n)+1;
        else
           mach6(n) = mach6(n)-1;
        end

        if m7(x,y) == adade9(x,y)
           mach7(n) = mach7(n)+1;
        else
           mach7(n) = mach7(n)-1;
        end
        
        if m8(x,y) == adade9(x,y)
           mach8(n) = mach8(n)+1;
        else
           mach8(n) = mach8(n)-1;
        end
    end
end

% n=10
n= 10;
for x = 1:60
    for y =1:30
        if m3(x,y) == jim(x,y)
           mach3(n) = mach3(n)+1;
        else
           mach3(n) = mach3(n)-1;
        end
    end
end

% n=11
n= 11;
for x = 1:60
    for y =1:30
        if m3(x,y) == dal(x,y)
           mach3(n) = mach3(n)+1;
        else
           mach3(n) = mach3(n)-1;
        end
    end
end

% n=12
n= 12;
for x = 1:60
    for y =1:30
        if m3(x,y) == te(x,y)
           mach3(n) = mach3(n)+1;
        else
           mach3(n) = mach3(n)-1;
        end
    end
end

% n=13
n= 13;
for x = 1:60
    for y =1:30
        if m3(x,y) == ta(x,y)
           mach3(n) = mach3(n)+1;
        else
           mach3(n) = mach3(n)-1;
        end
    end
end

% n=14
n= 1;
for x = 1:60
    for y =1:30
        if m3(x,y) == lam(x,y)
           mach3(n) = mach3(n)+1;
        else
           mach3(n) = mach3(n)-1;
        end
    end
end

%8
a(1) = find (mach1 == max(mach1));
a(2) = find (mach2 == max(mach2));
a(3) = find (mach3 == max(mach3));
a(4) = find (mach4 == max(mach4));
a(5) = find (mach5 == max(mach5));
a(6) = find (mach6 == max(mach6));
a(7) = find (mach7 == max(mach7));
a(8) = find (mach8 == max(mach8));

%9      
for i=1:8
    if a(i)==10
       a(i)='ج';
    elseif a(i)==11
       a(i)='د';
    elseif a(i)==12
       a(i)='ت';
    elseif a(i)==13
        a(i)='ط';
    elseif a(i)==14
        a(i)='ل';
    else
        a(i)=num2str(a(i));
    end
end

%10
figure, imshow(im);
title(['license plate:',a(8),'',a(7),'-',a(6),'',a(5),'',...
    a(4),'',a(3),'',a(2),'',a(1)],...
    'FontName','Arabic Transparent','FontSize',14);