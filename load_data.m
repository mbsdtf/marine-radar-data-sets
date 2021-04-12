%% % % % % % % % % % % % % % % % % % % % % % % % % %
%% load and display the data sets recorded by a civil marine radar system, which are used in paper
%% "Adaptive clustering based marine radar sea clutter normalization" by Yong Xu, Tao Jia, Dong Cao, Pengyu Guo, Yue Ma and Hongtao Yan.
%% % % % % % % % % % % % % % % % % % % % % % % % % %
clc;
clear all;
close all;

fid1 = fopen('./data1.dat','r'); % ./data1.dat  ./data2.dat
data_N = zeros(3300,3120); %data matrix
kk = 0;                    %row number
Frame = 0;                 %frame num
height = 0;                %image height

while ~feof(fid1)
    Header=fread(fid1,5,'uint16');  %read header
    linep=fread(fid1,3120,'uint8'); %read data
    
    if length(linep) == 3120
        kk=kk+1;                    %row number
        data_N(kk,:) = linep;       %original data
    end
    
    if(Header(3)==1 ) % azimuth reference: azimuth = 0
        height = kk;
        kk = 0;  % reset for next scanning cycle
        if(height>1600)
            Frame = Frame+1
           %% display image
            figure(10)
            imagesc(data_N(1:height,:));
            colormap(jet);
            xlabel({['Frame  ',num2str(Frame)]})
            pause(1);
            
            for i=1:height
              %% to do!!!
                figure(1)
                plot(data_N(i,:));
                grid on;
                pause(0.0001);
%                 pause();
            end
        end
    end
end

