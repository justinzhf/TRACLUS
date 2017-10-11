function t=load_deer_data(data)
%input: data: NumX4��table����1-4�к���ֱ�Ϊ���꣬���ƣ����ȣ�γ�ȣ���+����Ψһȷ��һ���켣
%output: t:
%tΪ1xn��struct���飬ÿһ��Ϊһ��struct������һ���켣��struct.id=��+���ƣ�iΪ�ַ����ͣ�struct.cord=[x1,x2,x3...;y1,y2,y3...]
%���ս���洢��test/data/ASTS.mat�ļ���

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