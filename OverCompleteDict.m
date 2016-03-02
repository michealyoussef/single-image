P = 3; %%%%%%% patch size
D = [];
k = 1;
I = imread('s50_01.jpg');
B=blockproc(I, [P P], @(x) mean(x.data(:)));
figure,imshow(B,[]);
[N M] = size(B);
%% initialize overcomplete dictionary
A = zeros(k, N*M);
counter_for_patches = 1;
%%% outer for loop over all patches with j, h for central pixels; index of loop _patch_indx
A(counter, :) = reshape(B(_patch_indx), P*P, 1);
j = uint8(N/2); %% P/2
h = uint8(M/2); %% P/2

for i = 1 : k

            D(i,1) = B(j-1,h-1);
            D(i,2) = B(j,h-1);
            D(i,3) = B(j-1,h);
            D(i,4) = B(j+1,h+1);
            D(i,5) = B(j,h+1);
            D(i,6) = B(j+1,h-1);
            D(i,7) = B(j,h-1);
            D(i,8) = B(j+1,h);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ipsay(j, h) = D*A ; %%% equation [9] in paper

counter = counter + 1;
%%% end outer for loop %%%%%%%%%%%%
figure,imshow(D,[]);
