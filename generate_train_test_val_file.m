function generate_train_test_val_file(xmlfilepath, txtsavepath, trainval_percent, train_percent)
% ====================================================================
% ���������ɵ�xml������VOC2007���ݼ��е� trainval.txt;train.txt;test.txt��val.txt(jwwangchn@outlook.com)
% generate_train_test_val_file(xmlfilepath, txtsavepath, trainval_percent, train_percent)
% ====================================================================
% �������
%   [1] xmlfilepath(string) Ϊ xml �ļ��洢·��
%   [2] txtsavepath(string) Ϊ txt �ļ��洢·��
%   [3] trainval_percent(float) Ϊ trainval ռ�������ݼ��İٷֱȣ�ʣ�²��־��� test ��ռ�ٷֱ�
%   [4] train_percent(float) Ϊ train ռ trainval �İٷֱȣ�ʣ�²��־��� val ��ռ�ٷֱ�
% ���
%   [1] �Զ����� trainval.txt;train.txt;test.txt��val.txt �ļ�,���洢�� txtsavepath ��


% trainvalռ�����ݼ���50%��testռ�����ݼ���50%��trainռtrainval��50%��valռtrainval��50%��
% ������ռ�ٷֱȿɸ����Լ������ݼ��޸ģ�������ݼ��Ƚ��٣�test��val����һЩ
%%
%ע���޸������ĸ�ֵ
% trainval_percent=0.5;%trainvalռ�������ݼ��İٷֱȣ�ʣ�²��־���test��ռ�ٷֱ�
% train_percent=0.5;%trainռtrainval�İٷֱȣ�ʣ�²��־���val��ռ�ٷֱ�


%%
xmlfile=dir(xmlfilepath);
numOfxml=length(xmlfile)-2;%��ȥ . �� .. �ܵ����ݼ���С

%%
trainval=sort(randperm(numOfxml,floor(numOfxml*trainval_percent)));
test=sort(setdiff(1:numOfxml,trainval));


trainvalsize=length(trainval);%trainval�Ĵ�С
train=sort(trainval(randperm(trainvalsize,floor(trainvalsize*train_percent))));
val=sort(setdiff(trainval,train));


ftrainval=fopen([txtsavepath 'trainval.txt'],'w');
ftest=fopen([txtsavepath 'test.txt'],'w');
ftrain=fopen([txtsavepath 'train.txt'],'w');
fval=fopen([txtsavepath 'val.txt'],'w');


for i=1:numOfxml
    if ismember(i,trainval)
        fprintf(ftrainval,'%s\n',xmlfile(i+2).name(1:end-4));
        if ismember(i,train)
            fprintf(ftrain,'%s\n',xmlfile(i+2).name(1:end-4));
        else
            fprintf(fval,'%s\n',xmlfile(i+2).name(1:end-4));
        end
    else
        fprintf(ftest,'%s\n',xmlfile(i+2).name(1:end-4));
    end
end
fclose(ftrainval);
fclose(ftrain);
fclose(fval);
fclose(ftest);