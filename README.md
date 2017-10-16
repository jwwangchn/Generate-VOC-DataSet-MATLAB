# Generate-VOC-DataSet-MATLAB

使用 MATLAB 自带 APP imageLabler 构造 VOC 格式数据集

1. 在 Command Windows 窗口中输入 imageLabler 即可打开 APP
2. 在 APP 中标注数据, 将标注结果导出到 Workspace, 导出格式选择 table
3. 将导出的 table 数据存储为 .mat 文件, 例如 `ImageLabeler_Car.mat`
4. 打开 `demo.m` 修改 VOC 数据集的生成路径和相关参数, 运行即可

## Reference
[1] [利用matlab将自己的数据制作为标准VOC数据集格式](http://blog.csdn.net/kunyxu/article/details/53709728)
[2] [VOC-xml标注文件制作及其交互使用(修改，预览，存储)的MATLAB实现](http://blog.csdn.net/cuixing001/article/details/77092627)