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
                             
            hAnimationAxes = axes('Parent',hAnimation);
 
            hSinus = uipanel('Visible','on',...
                             'Units','pixels',... 
                             'Position',[30 50 300 550]);
                        
            obj.Handles = struct('hfgi',hfig,...
                                 'hStart',hStart,...
                                 'hStop',hStop,...
                                 'hAnimation',hAnimation,...
                                 'hAnimationAxes',hAnimationAxes,...
                                 'hSinus',hSinus);
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

