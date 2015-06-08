classdef WaveGUI < handle
    %WAVEGUI Summary of this class goes here
    %   Detailed explanation goes here
    
    properties 
        Handles;
        Timer;
        Resolution;
        Speakers;
    end
    
    
    methods
        function obj = WaveGUI
            obj.Timer = timer('Period',0.06,...
                              'TimerFcn',@(handle,eventdata)obj.runAnimation,...
                              'ExecutionMode','FixedRate');
            obj.setResolution;
            obj.openGUI;  
        end
    end
        
    
    methods (Access = private)
        function openGUI(obj)
            
            hfig = figure('Name','Wave-Machine',...
                          'NumberTitle','off',... 
                          'Position',[100 100 1024 608],... 
                          'ToolBar','none',...
                          'MenuBar','none',...
                          'Resize','off',...
                          'CloseRequestFcn',@(handle,eventdata)obj.closeGUI); 
           
            hStart = uicontrol('String','Start',...
                               'Style','Pushbutton',...
                               'Enable','off',...
                               'Position',[20 70 100 30],...
                               'FontSize',10,...
                               'Callback',@(handle,eventdata)obj.startAnimation); 
 
            hStop = uicontrol('String','Freeze',...
                              'Style','Pushbutton',...
                              'Enable','off',...
                              'Position',[130 70 100 30],...
                              'FontSize',10,...
                              'Callback',@(handle,eventdata)obj.stopAnimation);
                                                   
            hMedium = uicontrol('Parent',hfig,...
                                'Style','Popupmenu',...
                                'Position',[20 20 100 35],...
                                'String',{'Air','Water','Steel'},...
                                'FontSize',10);
                            
            hQuality = uicontrol('Style','popupmenu',...
                                 'String',{'High','Low'},...
                                 'Position',[130 20 100 35],...
                                 'FontSize',10,...
                                 'Callback',@(handle,eventdata)obj.setQuality);
                             
            hSpeakerList = uicontrol('Style','Listbox',...
                                     'String',{},...
                                     'Position',[20 200 210 180],...
                                     'FontSize',10);
                                 
            hAdd = uicontrol('Style','Pushbutton',...
                             'String','Add',...
                             'Position',[20 115 100 30],...
                             'FontSize',10,...
                             'Callback',@(handle,eventdata)obj.addSpeaker);
            
            hRemove = uicontrol('Style','Pushbutton',...
                                'String','Remove',...
                                'Enable','off',...
                                'Position',[130 115 100 30],...
                                'FontSize',10,...
                                'Callback',@(handle,eventdata)obj.removeSpeaker);
                             
            hAnimationAxes = axes('Units','pixels',...
                                  'CLim',[-1 1],...
                                  'CLimMode','manual',...
                                  'Visible','off',...
                                  'Position',[160 -50 930 710],...
                                  'XTick',[],...
                                  'YTick',[],...
                                  'ClippingStyle','rectangle');
 
            hSetting = uipanel('Units','pixels',... 
                                'Position',[20 390 210 200],...
                                'Title','Settings',...
                                'FontSize',12);
                         
            hSettingFrequenzText = uicontrol('Parent',hSetting,...
                                            'Style','Text',...
                                            'String','Frequency',...
                                            'Position',[20 160 180 20]);
                         
            hSettingFrequenz = uicontrol('Parent',hSetting,...
                                        'Style','Slider',...
                                        'Position',[15 140 180 20],...
                                        'Enable','off',...
                                        'Min',0,'Max',0.4,...
                                        'SliderStep',[0.01 0.1],...
                                        'Value',0.2,...
                                        'Callback',@(handle,eventdata)obj.changeFrequency(1));
                                    
            hSettingAmplitudeText = uicontrol('Parent',hSetting,...
                                             'Style','Text',...
                                             'String','Amplitude',...
                                             'Position',[10 108 180 20]);
                                    
            hSettingAmplitude = uicontrol('Parent',hSetting,...
                                        'Style','Slider',...
                                        'Position',[10 93 170 20],...
                                        'Enable','off',...
                                        'Min',0,'Max',10,...
                                        'SliderStep',[0.01 0.1],...
                                        'Value',5,...
                                        'Callback',@(handle,eventdata)obj.changeAmplitude(1));
                                    
            hSettingPhaseText = uicontrol('Parent',hSetting,...
                                         'Style','Text',...
                                         'String','Phase',...
                                         'Position',[10 68 180 20]);
                                    
            hSettingPhase = uicontrol('Parent',hSetting,...
                                     'Style','Slider',...
                                      'Position',[10 53 170 20],...
                                      'Enable','off',...
                                      'Min',0,'Max',2*pi,...
                                      'SliderStep',[0.01 0.1],...
                                      'Value',0,...
                                      'Callback',@(handle,eventdata)obj.changePhase(1));
                                  
            hSettingDampingText = uicontrol('Parent',hSetting,...
                                           'Style','Text',...
                                           'String','Damping',...
                                           'Position',[10 28 180 20]);
                                  
            hSettingDamping = uicontrol('Parent',hSetting,...
                                       'Style','Slider',...
                                       'Position',[10 13 170 20],...
                                       'Enable','off',...
                                       'Min',0,'Max',1,...
                                       'SliderStep',[0.01 0.1],...
                                       'Value',0,...
                                       'Callback',@(handle,eventdata)obj.changeDamping(1));
                                   
            hImage = image('Parent',hAnimationAxes,...
                           'Visible','on',...
                           'XData',[-31.4 31.4],...
                           'YData',[-31.4 31.4],...
                           'CDataMapping','scaled',...
                           'CData',zeros(449),...
                           'ButtonDownFcn',@obj.setSourceOfSound);
            
            colormap gray;
                        
            obj.Handles = struct('hfig',hfig,...
                                 'hStart',hStart,...
                                 'hStop',hStop,...
                                 'hQuality',hQuality,...
                                 'hMedium',hMedium,...
                                 'hAdd',hAdd,...
                                 'hRemove',hRemove,...
                                 'hSpeakerList',hSpeakerList,...
                                 'hAnimationAxes',hAnimationAxes,...
                                 'hSetting',hSetting,...
                                 'hImage',hImage,...
                                 'hSettingFrequenzText',hSettingFrequenzText,...
                                 'hSettingFrequenz',hSettingFrequenz,...
                                 'hSettingAmplitudeText',hSettingAmplitudeText,...
                                 'hSettingAmplitude',hSettingAmplitude,...
                                 'hSettingPhaseText',hSettingPhaseText,...
                                 'hSettingPhase',hSettingPhase,...
                                 'hSettingDampingText',hSettingDampingText,...
                                 'hSettingDamping',hSettingDamping);
        end
        
        
        function closeGUI(obj)
            obj.stopAnimation;
            delete(obj.Timer);
            closereq;
        end
        
        function startAnimation(obj)
            if strcmp(obj.Timer.Running,'off')
            start(obj.Timer);
            end
            if strcmp(obj.Timer.Running,'on')
            obj.Handles.hStop.String = 'Freeze';
            end
        end
        
        function stopAnimation(obj)
            obj.Handles.hButtonGroup.Visible = 'off';
            stop(obj.Timer);
            obj.Handles.hStart.String = 'Resume';
            if strcmp(obj.Timer.Running,'off')
                obj.Handles.hStop.String = 'Stop';
                obj.Handles.hButtonGroup.Visible = 'on';
            end
%             set(obj.Handles.hImage,'CData',zeros(449));
        end
        
        function runAnimation(obj)
            obj.Handles.hImage.Visible = 'on';
            obj.Handles.hStop.Enable = 'on';
            sMap = zeros(561);
            for i = 1:length(obj.Speakers)
                sMap = sMap + obj.Speakers{i}.getColorMap(obj.Timer.TasksExecuted);
            end
            set(obj.Handles.hImage,'CData',sMap);
        end
        
        function addSpeaker(obj)
            obj.Speakers{length(obj.Speakers)+1} = SourceOfSound();
            obj.Speakers{length(obj.Speakers)}.setPosition([(rand(1)-0.5)*10*pi (rand(1)-0.5)*10*pi]);
            obj.Handles.hStart.Enable = 'on';
            obj.Handles.hRemove.Enable = 'on';
            obj.Handles.hSpeakerList.String = [obj.Handles.hSpeakerList.String; strcat('Speaker',num2str(length(obj.Speakers)))];
            if length(obj.Speakers)>=5
                warndlg('We recommend no more Speakers','Speaker-overflow');
            end
        end
        
        function removeSpeaker(obj)
            
        end
        
        function setSourceOfSound(obj,~,event)
            X = event.IntersectionPoint(1);
            Y = event.IntersectionPoint(2);
            speakerNr = obj.Handles.hSpeakerList.Value;
            obj.Speakers{speakerNr}.setPosition([X Y]);
        end
        
        function setLineplot(obj)
        
        end
        
        function setQuality(obj)
            stop(obj.Timer);
            quality = obj.Handles.hQuality.String(obj.Handles.hQuality.Value);
            if(strcmp(quality,'High'))
                obj.Timer.Period = 0.06;
            elseif(strcmp(quality,'Low'))
                obj.Timer.Period = 0.1;
            end
            start(obj.Timer);
        end
        
        function changeFrequency(obj, nr)
            switch nr
                case 1
                    frequenzy = obj.Handles.hSinus1Frequenz.Value;
                case 2
                    frequenzy = obj.Handles.hSinus2Frequenz.Value;
                case 3
                    frequenzy = obj.Handles.hSinus3Frequenz.Value;
            end
            obj.Speakers{nr}.setFrequency(frequenzy);
        end
        
        function changeAmplitude(obj, nr)
            switch nr
                case 1
                    amplitude = obj.Handles.hSinus1Amplitude.Value;
                case 2
                    amplitude = obj.Handles.hSinus2Amplitude.Value;
                case 3
                    amplitude = obj.Handles.hSinus3Amplitude.Value;
            end
            obj.Speakers{nr}.setAmplitude(amplitude);
        end
        
        function changePhase(obj, nr)
            switch nr
                case 1
                    phase = obj.Handles.hSinus1Phase.Value;
                case 2
                    phase = obj.Handles.hSinus2Phase.Value;
                case 3
                    phase = obj.Handles.hSinus3Phase.Value;
            end
            obj.Speakers{nr}.setPhase(phase);
        end
        
        function changeDamping(obj, nr)
            switch nr
                case 1
                    damping = obj.Handles.hSinus1Damping.Value;
                case 2
                    damping = obj.Handles.hSinus2Damping.Value;
                case 3
                    damping = obj.Handles.hSinus3Damping.Value;
            end
            obj.Speakers{nr}.setDamping(damping);
        end

        function selectSpeakerOrLineplot(obj, data)
            old = data.OldValue.String;
            new = data.NewValue.String;
        end
        
        function enable(obj)
            
        end
        
        function setResolution(obj)
        
        end
    end
end

