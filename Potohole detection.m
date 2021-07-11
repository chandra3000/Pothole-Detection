
    start = 1;                  %Helper variable 
    white = 1;                  %Variable denoting white color
    img = snapshot(cam);        %Camera takes a snapshot
    I = rgb2gray(img);          %Color image is converted to grayscale
    threshold=120;              %Initialising threshold intensity
    [m,n]=size(I);              
    Ithresh=zeros(m,n);         %Initialising threshold image matrix
            
    for i=start:m                   %Converting grayscale image to binary image
        for j=start:n
            if (I(i,j)>threshold)
                Ithresh(i,j) = white;  
            else
                Ithresh(i,j) = 0;  
            end
        end
    end
    
    for i=start:m                       %Storing value of pixel depth containing laser
        for j=start:n
            if(Ithresh(i,j) == white)
                b = i;                  %Stores the index when first white pixel in encountered 
                break
            end
        end
    end
    
    d = 2;                              %Intial depth in pixels
    
    for i=start:m                       %Finds maximum depth in pixels
        for j=start:n
            if i == b
                continue
            else 
                if (Ithresh(i,j) == 1)
                    e = b-i;
                    if (e>d)
                        d = e;
                    end
                end
            end
        end
    end
    
    R = 25;                         %Resolution of camera    
    delta = d/R;                    
    depth = (delta*0.89)/0.64;         %Converting depth from pixels to centimeters
    if depth>3                         %Generates warning
        disp('Pothole detected!!! Danger Ahead');
        fs = 100e3;
        t = 0 : 1/fs : 1;
        y = sin(pi*220*t);
        sound(1000*y, fs);
    end
    display(depth);                     %Displays depth in centimeters
    display(d);                         %Displays depth in pixels
    imshow(Ithresh);                    %Shows binary image
    
           
        


