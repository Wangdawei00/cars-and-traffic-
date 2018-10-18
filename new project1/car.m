classdef car  < handle
    properties
        pos % the coodinate of the center point of the rectangle
        length
        width
        direction %with four possible values:'sn','ns','we''ew'
        plate
        move=1; % a boolean showing whether the car is moving or not.
        p %probability that the car doesn't stop at a red light
        vio=0;
        presence=0;
        presented=0;
        judge=0;        
    end
    methods
        function car=car(length,width,direction,plate,p)
            car.length=length;
            car.width=width;
            car.direction=direction;
            car.plate=plate;
            car.move=1;
            car.p=p;
        end
    end
    methods
        function draw(obj)% this function draws the rectangle representing the car
            hold on;
            if isequal(obj.direction,'ns')
                rectangle('Position',[obj.pos(1)-obj.width/2 ...
                    obj.pos(2)-obj.length/2 ...
                    obj.width obj.length]...
                    ,'FaceColor','m');
            elseif isequal(obj.direction,'sn')
                rectangle('Position',[obj.pos(1)-obj.width/2 ...
                    obj.pos(2)-obj.length/2 ...
                    obj.width obj.length]...
                    ,'FaceColor','b');
            elseif isequal(obj.direction,'ew')
                rectangle('Position',[obj.pos(1)-obj.length/2 ...
                    obj.pos(2)-obj.width/2 ...
                    obj.length obj.width]...
                    ,'FaceColor','g');
            else 
                rectangle('Position',[obj.pos(1)-obj.length/2 ...
                    obj.pos(2)-obj.width/2 ...
                    obj.length obj.width]...
                    ,'FaceColor','c');
            end
            hold on;
        end
        % end of drawing
        function plate=plt_inq(obj)
            plate=obj.plate;
        end
        function move=ismoving(obj)
            move=obj.move;
        end
        function setmove(obj)
            obj.move=1;
        end
        function setunmove(obj)
            obj.move=0;
        end
        function violation(obj)
            obj.vio=1;
        end
        function bool=checkvio(obj)
            bool=obj.vio;
        end
        function setpre(obj,bool)
            obj.presence=bool;
            obj.presented=1;
        end
        function pre=showpre(obj)
            pre=obj.presence;
        end
        function setpos(obj,pos)
            obj.pos=pos;
        end
        function pos=showpos(obj)
            pos=obj.pos;
        end
        function bool=jud(obj)
            bool=0;
            if obj.judge==0&&rand<obj.p
                bool=1;
                obj.vio=1;
            end
            obj.judge=1;
        end
    end
end
