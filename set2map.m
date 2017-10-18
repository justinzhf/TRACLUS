function set2map(s_set)
[s_h,~]=size(s_set);
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
end