function GUIstart()

            hfig = figure('Name','Wellen-Maschine','NumberTitle','off',...
              'Position',[100 100 1024 640],...
              'ToolBar','none','MenuBar','none');
         
            hStart = uicontrol('String','Start','style','Pushbutton',...
                               'Position',[780 50 100 30]);

            hStop = uicontrol('String','Stop','style','Pushbutton',...
                               'Position',[900 50 100 30]);

            hAnimation = uipanel('Visible','on','BackgroundColor','w',...
                                 'Units','pixels','Position',[450 200 550 400]);

            hSinus = uipanel('Visible','on','Units','pixels',...
                             'Position',[30 50 400 550]);

            hSinus1Check = uicontrol('Parent',hSinus,'style','checkbox',...
                                     'Position',[360 470 20 20],...
                                     'Value',0,...
                                     'Callback',@(handles,event)hSinus1_plot);

            hSinus1FrequenzText = uicontrol('Parent',hSinus,'style','text',...
                                            'Position',[210 482.5 70 20],'String','Frequenz');

            hSinus1FrequenzEdit = uicontrol('Parent',hSinus,'style','edit',...
                                            'Position',[280 485 70 20],'Enable','on',...
                                            'Tooltipstring','type in a Frequenz in Hz',...
                                            'String','');

            hSinus1AmplitudeText = uicontrol('Parent',hSinus,'style','text',...
                                             'Position',[210 452.5 70 20],'String','Amplitude');

            hSinus1AmplitudeEdit = uicontrol('Parent',hSinus,'style','edit',...
                                         'Position',[280 455 70 20],'Enable','on',...
                                         'Tooltipstring','type in a Amplitude',...
                                         'String','');

            hSinus2Check = uicontrol('Parent',hSinus,'style','checkbox',...
                                     'Position',[360 360 20 20],...
                                     'Value',0,...
                                     'Callback',@(handles,event)hSinus2_plot);

            hSinus2FrequenzText = uicontrol('Parent',hSinus,'style','text',...
                                            'Position',[210 372.5 70 20],'String','Frequenz');

            hSinus2FrequenzEdit = uicontrol('Parent',hSinus,'style','edit',...
                                            'Position',[280 375 70 20],'Enable','on',...
                                            'Tooltipstring','type in a Frequenz in Hz',...
                                            'String','');

            hSinus2AmplitudeText = uicontrol('Parent',hSinus,'style','text',...
                                             'Position',[210 342.5 70 20],'String','Amplitude');

            hSinus2AmplitudeEdit = uicontrol('Parent',hSinus,'style','edit',...
                                         'Position',[280 345 70 20],'Enable','on',...
                                         'Tooltipstring','type in a Amplitude',...
                                         'String','');

            hSinus3Check = uicontrol('Parent',hSinus,'style','checkbox',...
                                     'Position',[360 250 20 20],...
                                     'Value',0,...
                                     'Callback',@(handles,event)hSinus3_plot);

            hSinus3FrequenzText = uicontrol('Parent',hSinus,'style','text',...
                                            'Position',[210 262.5 70 20],'String','Frequenz');

            hSinus3FrequenzEdit = uicontrol('Parent',hSinus,'style','edit',...
                                            'Position',[280 265 70 20],'Enable','on',...
                                            'Tooltipstring','type in a Frequenz in Hz',...
                                            'String','');

            hSinus3AmplitudeText = uicontrol('Parent',hSinus,'style','text',...
                                             'Position',[210 232.5 70 20],'String','Amplitude');

            hSinus3AmplitudeEdit = uicontrol('Parent',hSinus,'style','edit',...
                                         'Position',[280 235 70 20],'Enable','on',...
                                         'Tooltipstring','type in a Amplitude',...
                                         'String','');

            hSinus4Check = uicontrol('Parent',hSinus,'style','checkbox',...
                                     'Position',[360 140 20 20],...
                                     'Value',0,...
                                     'Callback',@(handles,event)hSinus4_plot);

            hSinus4FrequenzText = uicontrol('Parent',hSinus,'style','text',...
                                        'Position',[210 152.5 70 20],'String','Frequenz');

            hSinus4FrequenzEdit = uicontrol('Parent',hSinus,'style','edit',...
                                            'Position',[280 155 70 20],'Enable','on',...
                                            'Tooltipstring','type in a Frequenz in Hz',...
                                            'String','');

            hSinus4AmplitudeText = uicontrol('Parent',hSinus,'style','text',...
                                             'Position',[210 122.5 70 20],'String','Amplitude');

            hSinus4AmplitudeEdit = uicontrol('Parent',hSinus,'style','edit',...
                                         'Position',[280 125 70 20],'Enable','on',...
                                         'Tooltipstring','type in a Amplitude',...
                                         'String','');
                                     
%             handles = sturct('hfig',hfig,'hStart',hStart,'hStop',hStop,...
%                              'hAnimation',hAnimation,'hSinus',hSinus,...
%                              'hSinus1Check',hSinus1Check,'hSinus1FrequenzText',hSinus1FrequenzText,...
%                              'hSinus1FrequenzEdit',hSinus1FrequenzEdit,'hSinus1AmplitudeText',hSinus1AmplitudeText,...
%                              'hSinus1AmplitudeEdit',hSinus1AmplitudeEdit,'hSinus2Check',hSinus2Check,...
%                              'hSinus2FrequenzText',hSinus2FrequenzText,'hSinus2FrequenzEdit',hSinus2FrequenzEdit,...
%                              'hSinus2AmplitudeText',hSinus2AmplitudeText,'hSinus2AmplitudeEdit',hSinus2AmplitudeEdit,...
%                              'hSinus3Check',hSinus3Check,'hSinus3FrequenzText',hSinus3FrequenzText,...
%                              'hSinus3FrequenzEdit',hSinus3FrequenzEdit,'hSinus3AmplitudeText',hSinus3AmplitudeText,...
%                              'hSinus3AmplitudeEdit',hSinus3AmplitudeEdit,'hSinus4Check',hSinus4Check,...
%                              'hSinus4FrequenzText',hSinus4FrequenzText,'hSinus4FrequenzEdit',hSinus4FrequenzEdit,...
%                              'hSinus4AmplitudeText',hSinus4AmplitudeText,'hSinus4AmplitudeEdit',hSinus4AmplitudeEdit);

%             hSinus1 = subplot(4,1,1,'Parent',hSinus);
%             grid on
%             set(hSinus1,'Visible','off','Units','pixels','Position',[25 440 180 80],'ylim',[-1 1],'xlim',[0 2*pi]);
%             if(isempty(hSinus1FrequenzEdit.String & hSinus1AmplitudeEdit.String))
%                 hSinus1Check.Enable = 'off';
%             else
%                 hSinus1Check.Enable = 'on';
%             end

            function hSinus1_plot(handles,event)
                if(hSinus1Check.Value==1)
                    hSinus1 = subplot(4,1,1,'Parent',hSinus);
                    y = str2double(hSinus1AmplitudeEdit.String);
                    x = str2double(hSinus1FrequenzEdit.String);
                    t = 0:0.01:2*pi;
                    line(t,y*sin(x.*t));
                    set(hSinus1,'Visible','on','Units','pixels','Position',[25 440 180 80],'xlim',[0 pi]);
                    grid on
                    axis tight
                else
                    hSinus1 = subplot(4,1,1,'Parent',hSinus);
                    hSinus1FrequenzEdit.String = '';
                    hSinus1AmplitudeEdit.String = '';
                    set(hSinus1,'Visible','off','Units','pixels','Position',[25 440 180 80],'ylim',[-1 1],'xlim',[0 2*pi]);
                end
            end


            hSinus2 = subplot(4,1,2,'Parent',hSinus);
            grid on
            set(hSinus2,'Visible','off','Units','pixels','Position',[25 330 180 80],'ylim',[-1 1],'xlim',[0 2*pi]);

            function hSinus2_plot(handles,event)
                if(hSinus2Check.Value==1)
                    hSinus2 = subplot(4,1,2,'Parent',hSinus);
                    y = str2double(hSinus2AmplitudeEdit.String);
                    x = str2double(hSinus2FrequenzEdit.String);
                    t = 0:0.01:2*pi;
                    line(t,y*sin(x.*t));
                    set(hSinus2,'Visible','on','Units','pixels','Position',[25 330 180 80],'xlim',[0 pi]);
                    grid on
                    axis tight
                else
                    hSinus2 = subplot(4,1,2,'Parent',hSinus);
                    hSinus2FrequenzEdit.String = '';
                    hSinus2AmplitudeEdit.String = '';
                    set(hSinus2,'Visible','off','Units','pixels','Position',[25 330 180 80],'ylim',[-1 1],'xlim',[0 2*pi]);
                end
            end
            
            hSinus3 = subplot(4,1,3,'Parent',hSinus);
            grid on
            set(hSinus3,'Visible','off','Units','pixels','Position',[25 220 180 80],'ylim',[-1 1])
            
            function hSinus3_plot(handles,event)
                if(hSinus3Check.Value==1)
                    hSinus3 = subplot(4,1,3,'Parent',hSinus);
                    y = str2double(hSinus3AmplitudeEdit.String);
                    x = str2double(hSinus3FrequenzEdit.String);
                    t = 0:0.01:2*pi;
                    line(t,y*sin(x.*t));
                    set(hSinus3,'Visible','on','Units','pixels','Position',[25 220 180 80],'xlim',[0 pi]);
                    grid on
                    axis tight
                else
                    hSinus3 = subplot(4,1,3,'Parent',hSinus);
                    hSinus3FrequenzEdit.String = '';
                    hSinus3AmplitudeEdit.String = '';
                    set(hSinus3,'Visible','off','Units','pixels','Position',[25 220 180 80],'ylim',[-1 1],'xlim',[0 2*pi]);
                end
            end


            hSinus4 = subplot(4,1,4,'Parent',hSinus);
            grid on
            set(hSinus4,'Visible','off','Units','pixels','Position',[25 110 180 80],'ylim',[-1 1])
            
            function hSinus4_plot(handles,event)
                if(hSinus4Check.Value==1)
                    hSinus4 = subplot(4,1,4,'Parent',hSinus);
                    y = str2double(hSinus4AmplitudeEdit.String);
                    x = str2double(hSinus4FrequenzEdit.String);
                    t = 0:0.01:2*pi;
                    line(t,y*sin(x.*t));
                    set(hSinus4,'Visible','on','Units','pixels','Position',[25 110 180 80],'xlim',[0 pi]);
                    grid on
                    axis tight
                else
                    hSinus4 = subplot(4,1,4,'Parent',hSinus);
                    hSinus4FrequenzEdit.String = '';
                    hSinus4AmplitudeEdit.String = '';
                    set(hSinus4,'Visible','off','Units','pixels','Position',[25 110 180 80],'ylim',[-1 1],'xlim',[0 2*pi]);
                end
            end


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
% 
% subplot(1,2,1)
% x = 0:0.01:2*pi;
% xlim([0 6]);
% ylim([-1 1]);
% hplot2 = plot(x,sin(x),x,0.*x);
% axis tight;
% set(gca,'Units','pixels','Position',[30 200 200 100]);
end