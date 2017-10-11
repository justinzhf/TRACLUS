function s_map=gen_segment_map(s_data)
%½«s_data×ª»»Îªmap
%input: s_data N X 1 struct array;struct('id',xxx,'segs',[x1,y1,x2,y2;....])
%output: Map(key=id,value=segs)
[s_h,~]=size(s_data);
keys=cell(1,s_h);
values=cell(1,s_h);
for i=1:s_h
    keys(1,i)=s_data(i).id;
    for j=1:i-1
        if strcmp(s_data(i).id,s_data(j).id)==1
            display(i);
            display(j);
            display(s_data(i).id);
        end
    end
    values(1,i)={s_data(i).segs};
end
s_map=containers.Map(keys,values);

