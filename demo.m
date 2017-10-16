% ʹ�� image �е�ͼ��� imageLabler ��ע�������ɵı�ע�ļ����� VOC ��ʽ���ݼ�
%% �趨����·��
src_image_path = 'image';                   % Դͼ���ļ�·��
VOC_image_path = 'VOC-Data/JPEGImages';     % VOC���ݼ�ͼ���ļ�·��
xml_file_path = 'VOC-Data/Annotations';     % xml �ļ��洢·��
txt_save_path = 'VOC-Data/ImageSets/Main/'; % txt �ļ��洢·��

%%  ͼ���ļ�������
image_name_convert(src_image_path, VOC_image_path);  % �޸��ļ���

%% ���� table �ļ�
load('ImageLabeler_Car.mat')            % ����imageLabler�����ı�ע�ļ�(table)
matlab_to_xml(Car);              % ���� Annotations �ļ�

%% ���� txt �ļ�
trainval_percent = 0.5;     % Ϊ trainval ռ�������ݼ��İٷֱȣ�ʣ�²��־��� test ��ռ�ٷֱ�
train_percent = 0.5;        % Ϊ train ռ trainval �İٷֱȣ�ʣ�²��־��� val ��ռ�ٷֱ�
generate_train_test_val_file(xml_file_path, txt_save_path, trainval_percent, train_percent);    % ���� trainval.txt;train.txt;test.txt��val.txt
