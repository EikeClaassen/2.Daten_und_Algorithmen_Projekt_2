classdef SourceOfSound < handle
    %SOURCEOFWAVE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Position = [0 0];
        RadiiMatrix;
        SpeedOfSound;
        WaveVector;
        Amplitude;
        AmplitudesMatrix;
        Frequency;
        AngularFrequency;
        Phase = 0;
        Damping = 0;
        Function;
        PartOfCosinusArgument;
        t;
    end
    
    
    methods
        function obj = SourceOfSound
            [X,Y] = meshgrid(-8*pi:pi/10:8*pi);
            obj.RadiiMatrix = sqrt((X-obj.Position(1)).^2 + (Y-obj.Position(2)).^2);
            obj.setSpeedOfSound('air');
            obj.setAmplitude(1);
            obj.setFrequency(1);
            obj.Function = obj.AmplitudesMatrix.*cos(2*pi*obj.AngularFrequency*8-obj.WaveVector.*obj.RadiiMatrix+obj.Phase);
        end
        
        
        function setPosition(obj, position)
            obj.Position = position;
            [X,Y] = meshgrid(-8*pi:pi/10:8*pi);
            obj.RadiiMatrix = sqrt((X-obj.Position(1)).^2 + (Y-obj.Position(2)).^2);
        end
        
        
        function setSpeedOfSound(obj, medium)
            switch medium
                case 'air'
                    obj.SpeedOfSound = 343;
                case 'water'
                    obj.SpeedOfSound = 1484;
            end
            obj.WaveVector = obj.AngularFrequency/obj.SpeedOfSound;
        end
        
        
        function setAmplitude(obj, amplitude)
            obj.Amplitude = amplitude;
            obj.AmplitudesMatrix = obj.Amplitude./sqrt(obj.RadiiMatrix);
        end
        
        
        function setFrequency(obj, frequency)
            obj.Frequency = frequency;
            obj.AngularFrequency = 2*pi*obj.Frequency;
            obj.WaveVector = obj.AngularFrequency/obj.SpeedOfSound;
        end
        
        
        function setPhase(obj, phase)
            obj.Phase = phase;
        end
        
        function colorMap = getColorMap(obj, t)
            colorMap = obj.AmplitudesMatrix.*cos(2*pi*obj.AngularFrequency*t-obj.RadiiMatrix+obj.Phase);
            x = colorMap(4,6)
        end
    end
    
end

