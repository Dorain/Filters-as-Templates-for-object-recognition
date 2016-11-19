filter = double(imread('filter.jpg'));
toy = double(imread('toy.png'));
filter_img = filter - mean(filter(:));
toy_img = toy - mean(toy(:));
conv_img = conv2(double(toy_img), double(filter_img), 'same');
% c_show = (conv_img - min(conv_img(:)))/(max(conv_img(:))-min(conv_img(:)));
f = figure;
imagesc(conv_img);
colormap(jet);
saveas(f,'4_1_a.jpg');
%% bounding box
[rows ,cols]=find(conv_img==max(max(conv_img)));
[h,w]=size(filter); 
x=cols-ones(size(cols))*ceil(w/2); 
y=rows-ones(size(rows))*ceil(h/2);
f = figure;
imshow(toy);
hold on;
axis on
for i = 1:length(rows)
    rectangle('position',[x(i,1),y(i,1),w,h],'edgecolor','b'); 
end
saveas(f,'4_1_b.jpg');
%% 4.2
% choose the micky on the upper-right corner
result = zeros(3,1);
for i = 1:3
    f = figure;
    imshow(toy);
    axis on;
    rect=imrect; 
    truebox=getPosition(rect);%x,y,w,h
    detectbox = [x(2),y(2),w,h];
    result(i) = metric(detectbox, truebox);
    saveas(f, strcat('4_2_',num2str(i),'.jpg'));
end
save('hw2_4_2.mat','result');
