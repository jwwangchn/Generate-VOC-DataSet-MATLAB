function image_name_convert(srcImagePath, VOCImagePath)
% ====================================================================
% 将图像文件重命名为 000xxx 的格式(6个数字)(jwwangchn@outlook.com)
% image_name_convert(path)
% ====================================================================
% 输入参数
%   [1] srcImagePath(string) 为源图片存储路径
%   [2] srcImagePath(string) 为 VOC 图片存储路径

    imgs = dir([srcImagePath, '\', '*.jpg']);

    for i = 1:length(imgs)
        imgPath = [srcImagePath, '\', imgs(i).name];
        img = imread(imgPath);
        imgPathTrans = [VOCImagePath, '\',num2str(i,'%06d'), '.jpg'];
        imwrite(img,imgPathTrans);
    end

end