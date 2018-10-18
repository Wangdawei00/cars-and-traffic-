classdef Light<handle
    properties
        r % radius
%         dir%the directionof the light, a string
        col % char representing color
        pos % the coordinate of the center of the circle
    end
    methods %constructor
        function light=Light(r,col,pos)
            light.r=r;
            light.col=col;
            light.pos=pos;
%             light.dir=dir;
        end
    end
    methods
        function ini_draw(lig)
            rectangle('Position',[lig.pos(1)-lig.r lig.pos(2)-lig.r 2*lig.r ...
                2*lig.r],'Curvature',[1 1],'FaceColor',lig.col);hold on;
        end
        function col=color(lig)
            col=lig.col;
        end
        function setcolor(obj,col)
            obj.col=col;
            obj.ini_draw;
        end
%         function Red(lig)
%             lig.col='r';
%             lig.ini_draw();
%         end
%         function Gre(lig)
%             lig.col='g';
%             lig.ini_draw();
%         end
%         function Yel(lig)
%             lig.col='y';
%             lig.ini_draw();
%         end
    end
end