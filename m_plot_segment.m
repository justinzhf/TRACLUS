function m_plot_segment(segment)
hold on;
[s_h,~]=size(segment);
for i=1:s_h
    plot([segment(i,1),segment(i,3)],[segment(i,2),segment(i,4)],'r');
end
end