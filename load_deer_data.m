function t=load_deer_data(data)
%input: data: NumX4的table，第1-4列含义分别为：年，名称，经度，纬度，年+名称唯一确定一条轨迹
%output: t:
%t为1xn的struct数组，每一行为一个struct，代表一条轨迹，struct.id=年+名称，i为字符类型，struct.cord=[x1,x2,x3...;y1,y2,y3...]
%最终结果存储在test/data/ASTS.mat文件中

[data_h,~]=size(data);
preId=data{1,1};
preIdIndex=1;
j=1;
for i=2:data_h
    id=data{i,1};
    if strcmp(id,preId)~=1
        t(j).id=preId;
        t(j).cord=data{preIdIndex:i-1,2:3}';
        j=j+1;
        preIdIndex=i;
        preId=id;
    end
end
end