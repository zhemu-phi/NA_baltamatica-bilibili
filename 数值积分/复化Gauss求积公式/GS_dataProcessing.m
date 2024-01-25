% 对导入数据进行处理 
% 导入表格 从(4,3)取到(251,4) 长方形，勾选 忽略
format long;
jiedian = cell(1,20);%创建空的元胞数组
quanzhong = cell(1,20);
d = 3:1:21;
j = 0;
quanzhong{1} = main(1,1);
jiedian{1} = main(1,2);
for i=2:1:20
    j=j+d(i-1);
    quanzhong{i} = main(j+1:j+i,1);
    jiedian{i}= main(j+1:j+i,2);
end
save('gs.mat','jiedian','quanzhong');