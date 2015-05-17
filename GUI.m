hfig = figure('Name','Sinus-Plot-Maschine','NumberTitle','off',...
              'Position',[100 100 1024 640],...
              'ToolBar','none','MenuBar','none');
         
hStart = uicontrol('String','Start','style','Pushbutton',...
                   'Position',[780 50 100 30]);
               
hStop = uicontrol('String','Stop','style','Pushbutton',...
                   'Position',[900 50 100 30]);

hAnimation = uipanel('Visible','on','BackgroundColor','w',...
                     'Units','pixels','Position',[450 200 550 400]);
                 
hSinus = uipanel('Visible','on','Units','pixels',...
                 'Position',[30 50 350 550]);
             
hSinus1 = subplot(4,1,1,'Parent',hSinus);
grid on
set(hSinus1,'Visible','on','Units','pixels','Position',[25 440 180 80]);
hSinus2 = subplot(4,1,2,'Parent',hSinus);
grid on
set(hSinus2,'Visible','on','Units','pixels','Position',[25 330 180 80])
hSinus3 = subplot(4,1,3,'Parent',hSinus);
grid on
set(hSinus3,'Visible','on','Units','pixels','Position',[25 220 180 80])
hSinus4 = subplot(4,1,4,'Parent',hSinus);
grid on
set(hSinus4,'Visible','on','Units','pixels','Position',[25 110 180 80])

% subplot(1,2,2)
% hplot = scatter([], []);
% xlim([0 10]);
% ylim([0 10]);
% set(gca,'Units','pixels',...
%     'Box','on','buttondownfcn', @addpoint);
% guidata(hfig, struct('plot', hplot));
% 
% subplot(1,2,1)
% set(gca,'Units','pixels','Position',[30 500 300 100]);
% t = timer('Period', 0.01, 'TimerFcn', @plot_sinus, 'ExecutionMode', 'FixedRate');
% start(t);
% uiwait(hfig);
% stop(t);
% delete(t);

% subplot(1,2,1)
% x = 0:0.01:2*pi;
% xlim([0 6]);
% ylim([-1 1]);
% hplot2 = plot(x,sin(x),x,0.*x);
% axis tight;
% set(gca,'Units','pixels','Position',[30 200 200 100]);  

