classdef WaveGUI < handle
    %UNTITLED7 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties 
        Handles;
        Timer;
        S1;
    end
    
    
    methods
        function obj = WaveGUI
            obj.Timer = timer('Period',0.5,...
                              'TimerFcn',@(h,d)obj.runAnimation,...
                              'ExecutionMode','FixedRate');
            obj.S1 = SourceOfSound();
        end
        
        
        function openGUI(obj) 
            hfig = figure('Name','Wellen-Maschine',...
                          'NumberTitle','off',... 
                          'Position',[100 100 1024 640],... 
                          'ToolBar','none',...
                          'MenuBar','none'); 
           
            hStart = uicontrol('String','Start',...
                               'Style','Pushbutton',... 
                               'Position',[780 50 100 30],...
                               'Callback',@(hObject,data)obj.startAnimation); 
 
            hStop = uicontrol('String','Stop',...
                              'Style','Pushbutton',... 
                              'Position',[900 50 100 30],...
                              'Callback',@(hObject,data)obj.stopAnimation); 
 
            hAnimation = uipanel('Visible','on',...
                                 'BackgroundColor','w',... 
                                 'Units','pixels',...
                                 'Position',[370 150 630 450]); 
                             
            hAnimationAxes = axes('Parent',hAnimation,...
                                  'Units','pixels',...
                                  'Position',[0 0 1000 600],...
                                  'XTick',[],'YTick',[]);
 
            hSinus = uipanel('Visible','on',...
                             'Units','pixels',... 
                             'Position',[30 50 300 550]);
                         
            hSinus1Frequenz = uicontrol('Parent',hSinus,...
                                        'Style','Slider',...
                                        'Position',[10 500 170 20]);
                                    
            hSinus1Amplitude = uicontrol('Parent',hSinus,...
                                        'Style','Slider',...
                                        'Position',[10 460 170 20]);
            
            hSinus2Frequenz = uicontrol('Parent',hSinus,...
                                        'Style','Slider',...
                                        'Position',[10 400 170 20]);
                                    
            hSinus2Amplitude = uicontrol('Parent',hSinus,...
                                        'Style','Slider',...
                                        'Position',[10 360 170 20]);
                                    
            hSinus3Frequenz = uicontrol('Parent',hSinus,...
                                        'Style','Slider',...
                                        'Position',[10 300 170 20]);
                                    
            hSinus3Amplitude = uicontrol('Parent',hSinus,...
                                        'Style','Slider',...
                                        'Position',[10 260 170 20]);
                                    
            hSinus4Frequenz = uicontrol('Parent',hSinus,...
                                        'Style','Slider',...
                                        'Position',[10 200 170 20]);
                                    
            hSinus4Amplitude = uicontrol('Parent',hSinus,...
                                        'Style','Slider',...
                                        'Position',[10 160 170 20]);
                                    
            hMediumText = uicontrol('Parent',hSinus,...
                                'Style','Text',...
                                'Position',[-15 100 100 25],...
                                'String','Medium:',...
                                'FontSize',14);
                            
            hMedium = uicontrol('Parent',hSinus,...
                                'Style','Popupmenu',...
                                'Position',[70 102.5 100 25],...
                                'String',{'Luft','Wasser','Stahl'},...
                                'FontSize',14);
                        
            obj.Handles = struct('hfgi',hfig,...
                                 'hStart',hStart,...
                                 'hStop',hStop,...
                                 'hAnimation',hAnimation,...
                                 'hAnimationAxes',hAnimationAxes,...
                                 'hSinus',hSinus,...
                                 'hMedium',hMedium,...
                                 'hMediumText',hMediumText,...
                                 'hSinus1Frequenz',hSinus1Frequenz,...
                                 'hSinus1Amplitude',hSinus1Amplitude,...
                                 'hSinus2Frequenz',hSinus2Frequenz,...
                                 'hSinus2Amplitude',hSinus2Amplitude,...
                                 'hSinus3Frequenz',hSinus3Frequenz,...
                                 'hSinus3Amplitude',hSinus3Amplitude,...
                                 'hSinus4Frequenz',hSinus4Frequenz,...
                                 'hSinus4Amplitude',hSinus4Amplitude);
        end
        
        
        function closeGUI(obj)
            obj.stopAnimation;
            delete(obj.Timer);
        end
        
        
        function startAnimation(obj)
            start(obj.Timer);
        end
        
        
        function stopAnimation(obj)
            stop(obj.Timer);
        end
        
        
        function runAnimation(obj)
            image('parent',obj.Handles.hAnimationAxes,'CData',obj.S1.Function,'CDataMapping','scaled');
        end
    end
    
end

