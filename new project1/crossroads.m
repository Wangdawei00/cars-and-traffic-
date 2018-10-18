classdef crossroads<handle
    properties
        boun
        Lane_wid
    end
    methods
        function cr=crossroads(bound,Lane_wid)
            cr.boun=bound;
            cr.Lane_wid=Lane_wid;
        end
    end
    methods
        function draw(obj)
            crossroads.Line([0,obj.boun/2-obj.Lane_wid],[obj.boun/2-obj.Lane_wid obj.boun/2-obj.Lane_wid]);
            crossroads.Line([0,obj.boun/2-obj.Lane_wid],[obj.boun/2+obj.Lane_wid obj.boun/2+obj.Lane_wid]);
            crossroads.Line([obj.boun/2+obj.Lane_wid,obj.boun],[obj.boun/2+obj.Lane_wid obj.boun/2+obj.Lane_wid]);
            crossroads.Line([obj.boun/2+obj.Lane_wid,obj.boun],[obj.boun/2-obj.Lane_wid obj.boun/2-obj.Lane_wid]);
            crossroads.Line([obj.boun/2-obj.Lane_wid,obj.boun/2-obj.Lane_wid],[0 obj.boun/2-obj.Lane_wid]);
            crossroads.Line([obj.boun/2-obj.Lane_wid,obj.boun/2-obj.Lane_wid],[obj.boun/2+obj.Lane_wid obj.boun]);
            crossroads.Line([obj.boun/2+obj.Lane_wid,obj.boun/2+obj.Lane_wid],[0 obj.boun/2-obj.Lane_wid]);
            crossroads.Line([obj.boun/2+obj.Lane_wid,obj.boun/2+obj.Lane_wid],[obj.boun/2+obj.Lane_wid obj.boun]);
            %Dotted lines that seperate the opposite lanes comes below
            crossroads.Dot_Line([obj.boun/2 obj.boun/2],[0 obj.boun/2-obj.Lane_wid]);
            crossroads.Dot_Line([0 obj.boun/2-obj.Lane_wid],[obj.boun/2 obj.boun/2]);
            crossroads.Dot_Line([obj.boun obj.boun/2+obj.Lane_wid],[obj.boun/2 obj.boun/2]);
            crossroads.Dot_Line([obj.boun/2 obj.boun/2],[obj.Lane_wid+obj.boun/2 obj.boun]);
        end
    end
    methods (Static)
        function Line(x ,y)
            plot(x ,y,'k','LineWidth',2);
            hold on;
        end
        function Dot_Line(x,y)
            plot(x ,y,'--k','LineWidth',2);
            hold on;
        end
    end
end