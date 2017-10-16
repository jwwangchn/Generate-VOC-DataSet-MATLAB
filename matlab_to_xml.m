function matlab_to_xml(mylabel)
% ====================================================================
% ��imageLabeler APP���ݸ�ʽ(table����)תΪVOC��ʽ��xml(jwwangchn@outlook.com)
% matlab_to_xml(mylabel)
% ====================================================================
% �������
%   [1] mylabel(table) Ϊ�����������ռ�ı�ע�ļ�
% ���
%   [1] �Զ�����xmlSaveFolder�ļ��洢��ÿ��ͼ��Ӧһ��
% ˵��
%   mylabel��ע����������command window����trainingImageLabeler��app�����ļ���ע����ע��󵼳���mylabel������Ȼ��ʹ�øú���
% Example
%   matlab_to_xml(mylabel)

%%
if nargin<1 || ~istable(mylabel)
    error('�������̫�ٻ������ʹ�������trainingImageLabel APP������table�������ݣ�')
    %     xmls_path = 'F:\imagesData\stopSignImages\*.xml';
end

%%
tableLabel = mylabel; %�������Լ��ı�ע�õ�table��������
variableNames = tableLabel.Properties.VariableNames; %cell����
numSamples = size(mylabel,1);
numVariables = size(variableNames,2);

%%
for i = 1:numSamples
    rowTable = tableLabel(i,:);
    imageFullPathName = rowTable.(variableNames{1});%cell
    path = char(imageFullPathName);
    [pathstr,name,ext] = fileparts(path);
    index =strfind(pathstr,'\');
    
    annotation.folder = pathstr(index(end)+1:end);
    annotation.filename = [name,ext];
    annotation.path = path;
    annotation.source.database = 'Unknow';
    image = imread(annotation.path);
    
    annotation.size.width = size(image,2);
    annotation.size.height = size(image,1);
    annotation.size.depth = size(image,3);
    annotation.segmented = 0;
    
    objectnum = 0;
    for j = 2:numVariables %����ÿ������
        ROI_matrix = rowTable.(variableNames{j});%cell
        ROI_matrix = ROI_matrix{:};
        numROIS = size(ROI_matrix,1);
        for ii = 1: numROIS % ����ÿ��ROI
            %             field = ['object',num2str(ii)];
            objectnum= objectnum+1;
            annotation.object(objectnum).name = variableNames{1,j};
            annotation.object(objectnum).pose = 'Unspecified';
            annotation.object(objectnum).truncated = 0;
            annotation.object(objectnum).difficult= 0;
            annotation.object(objectnum).bndbox.xmin = ROI_matrix(ii,1);
            annotation.object(objectnum).bndbox.ymin = ROI_matrix(ii,2);
            annotation.object(objectnum).bndbox.xmax = ROI_matrix(ii,1)+ROI_matrix(ii,3)-1;
            annotation.object(objectnum).bndbox.ymax = ROI_matrix(ii,2)+ROI_matrix(ii,4)-1;
        end
    end
    
    if ~exist('VOC-data/Annotations','file')
        mkdir VOC-data/Annotations
    end
    xml_write(['VOC-data/Annotations/',name,'.xml'],annotation);
    clear annotation;
end

