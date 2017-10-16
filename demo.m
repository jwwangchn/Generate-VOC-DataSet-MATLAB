% 使用 image 中的图像和 imageLabler 标注工具生成的标注文件生成 VOC 格式数据集
%% 设定各种路径
src_image_path = 'image';                   % 源图像文件路径
VOC_image_path = 'VOC-Data/JPEGImages';     % VOC数据集图像文件路径
xml_file_path = 'VOC-Data/Annotations';     % xml 文件存储路径
txt_save_path = 'VOC-Data/ImageSets/Main/'; % txt 文件存储路径

%%  图像文件重命名
image_name_convert(src_image_path, VOC_image_path);  % 修改文件名

%% 导入 table 文件
load('ImageLabeler_Car.mat')            % 导入imageLabler产生的标注文件(table)
matlab_to_xml(Car);              % 生成 Annotations 文件

%% 生成 txt 文件
trainval_percent = 0.5;     % 为 trainval 占整个数据集的百分比，剩下部分就是 test 所占百分比
train_percent = 0.5;        % 为 train 占 trainval 的百分比，剩下部分就是 val 所占百分比
generate_train_test_val_file(xml_file_path, txt_save_path, trainval_percent, train_percent);    % 生成 trainval.txt;train.txt;test.txt和val.txt
