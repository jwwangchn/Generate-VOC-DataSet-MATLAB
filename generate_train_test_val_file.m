function generate_train_test_val_file(xmlfilepath, txtsavepath, trainval_percent, train_percent)
% ====================================================================
% 根据已生成的xml，制作VOC2007数据集中的 trainval.txt;train.txt;test.txt和val.txt(jwwangchn@outlook.com)
% generate_train_test_val_file(xmlfilepath, txtsavepath, trainval_percent, train_percent)
% ====================================================================
% 输入参数
%   [1] xmlfilepath(string) 为 xml 文件存储路径
%   [2] txtsavepath(string) 为 txt 文件存储路径
%   [3] trainval_percent(float) 为 trainval 占整个数据集的百分比，剩下部分就是 test 所占百分比
%   [4] train_percent(float) 为 train 占 trainval 的百分比，剩下部分就是 val 所占百分比
% 输出
%   [1] 自动生成 trainval.txt;train.txt;test.txt和val.txt 文件,并存储到 txtsavepath 中


% trainval占总数据集的50%，test占总数据集的50%；train占trainval的50%，val占trainval的50%；
% 上面所占百分比可根据自己的数据集修改，如果数据集比较少，test和val可少一些
%%
%注意修改下面四个值
% trainval_percent=0.5;%trainval占整个数据集的百分比，剩下部分就是test所占百分比
% train_percent=0.5;%train占trainval的百分比，剩下部分就是val所占百分比


%%
xmlfile=dir(xmlfilepath);
numOfxml=length(xmlfile)-2;%减去 . 和 .. 总的数据集大小

%%
trainval=sort(randperm(numOfxml,floor(numOfxml*trainval_percent)));
test=sort(setdiff(1:numOfxml,trainval));


trainvalsize=length(trainval);%trainval的大小
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