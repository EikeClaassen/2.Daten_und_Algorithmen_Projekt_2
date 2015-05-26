classdef SourceOfSound < handle
    %SOURCEOFWAVE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Position = [0 0];
        ZeroMatrix;
        RadiiMatrix;
        SpeedOfSound;
        WaveVector;
        Amplitude = 1;
        AmplitudesMatrix;
        Frequency;
        AngularFrequency;
        Phase = 0;
        Damping = 0;
    end
    
    
    methods
        function obj = SourceOfSound
            obj.ZeroMatrix = zeros(449);
            obj.setPosition([0 0]);
            obj.setSpeedOfSound('air');
            obj.setAmplitude(1);
            obj.setFrequency(0.1);
            obj.setPhase(0);
        end
        
        
        function setPosition(obj, position)
            obj.Position = position;
            [X,Y] = meshgrid(-10*pi:pi/28:10*pi);
            obj.RadiiMatrix = sqrt((X-obj.Position(1)).^2 + (Y-obj.Position(2)).^2);
            obj.setAmplitude(obj.Amplitude);
        end
        
        
        function setSpeedOfSound(obj, medium)
            switch medium
                case 'air'
                    obj.SpeedOfSound = 343;
                case 'water'
                    obj.SpeedOfSound = 1484;
                case'steel'
                    obj.SpeedOfSound = 5920;
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
            colorMap = obj.AmplitudesMatrix.*cos(obj.AngularFrequency*t-5*obj.RadiiMatrix+obj.Phase);
        end
    end
    
end

