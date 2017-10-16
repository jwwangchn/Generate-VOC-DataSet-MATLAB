function image_name_convert(srcImagePath, VOCImagePath)
% ====================================================================
% ��ͼ���ļ�������Ϊ 000xxx �ĸ�ʽ(6������)(jwwangchn@outlook.com)
% image_name_convert(path)
% ====================================================================
% �������
%   [1] srcImagePath(string) ΪԴͼƬ�洢·��
%   [2] srcImagePath(string) Ϊ VOC ͼƬ�洢·��

    imgs = dir([srcImagePath, '\', '*.jpg']);

    for i = 1:length(imgs)
        imgPath = [srcImagePath, '\', imgs(i).name];
        img = imread(imgPath);
        imgPathTrans = [VOCImagePath, '\',num2str(i,'%06d'), '.jpg'];
        imwrite(img,imgPathTrans);
    end

end