function plot_sinus(handles,event)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
date = clock;
sec = date(6);
x = 0:0.1:sec;
xlim([0 100]);
ylim([-1 1]);
line(x,sin(x),x,'Color','k');
%axis tight;
hold on;

end

