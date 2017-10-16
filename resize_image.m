%����ͼƬ������"images\"�£���Ҫ����淶������"image-convert\"��
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