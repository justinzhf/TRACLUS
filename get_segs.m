function segs=get_segs(id,s_data)
[s_h,~]=size(s_data);
for i=1:s_h
    if strcmp(id,s_data(i).id)==1
        segs=s_data(i).segs;
    end
end
end