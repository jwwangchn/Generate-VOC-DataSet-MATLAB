%假设图片放置于"images\"下，需要将其规范命名到"image-convert\"下
imgs = dir(['3DSMax_Render_VOC\JPEGImages\','*.jpg']);
for i = 1:length(imgs)
    imgPath = ['3DSMax_Render_VOC\JPEGImages\',imgs(i).name];
    img = imread(imgPath);
    [width, high] = size(img);
    if(width == 480 && high == 640)
        continue;
    end
    I = imresize(img,[480,640]);
    imwrite(I,imgPath);
end