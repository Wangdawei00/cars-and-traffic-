function Main()
[sc ,nc, ec, wc,w,boun,car_len,car_wid , p, y, r,]=initialize();
% sc stands for south car number, and analogously for nc,wc,ec.
cr=crossroads(boun,w);
cr.draw;
sn=Light(w/5,'r',[boun/2+w boun/2-w]);% south to north the same for below
ns=Light(w/5,'r',[boun/2-w boun/2+w]);
we=Light(w/5,'g',[boun/2-w boun/2-w]);
ew=Light(w/5,'g',[boun/2+w boun/2+w]);
sn.ini_draw;
ns.ini_draw;
ew.ini_draw;
we.ini_draw;
carset_n=cell(nc,1);
carset_s=cell(sc,1);
carset_w=cell(wc,1);
carset_e=cell(ec,1);
for i=1:sc
    carset_s{i}=car(car_len,car_wid,'sn',plate2(),p);
end
for i=1:nc
    carset_n{i}=car(car_len,car_wid,'ns',plate2(),p);
end
for i=1:ec
    carset_e{i}=car(car_len,car_wid,'ew',plate2(),p);
end
for i=1:wc
    carset_w{i}=car(car_len,car_wid,'we',plate2(),p);
end
vio=0;
% the main loop
time=0;
while 1
    pause(1);
    clf;
    cr.draw;
    % the color change of the traffic lights
    switch mod(time,2*y+2*r)
        case 0
            sn.setcolor('r');
            ns.setcolor('r');
            we.setcolor('g');
            ew.setcolor('g');
        case r
            sn.setcolor('y');
            ns.setcolor('y');
            we.setcolor('y');
            ew.setcolor('y');
        case r+y
            sn.setcolor('g');
            ns.setcolor('g');
            we.setcolor('r');
            ew.setcolor('r');
        case 2*r+y
            sn.setcolor('y');
            ns.setcolor('y');
            we.setcolor('y');
            ew.setcolor('y');
        otherwise 
            sn.ini_draw;
            ns.ini_draw;
            we.ini_draw;
            ew.ini_draw;
    end
    %color change ends
    % decide whether to move or not
    for i=1:nc
        if carset_n{i}.showpre
            carset_n{i}.setmove;
            pos=carset_n{i}.showpos;
            if pos(2)-car_len/2-(boun/2+w)>=0&& ...
                pos(2)-car_len/2-(boun/2+w)<1
                if isequal(ns.color(),'g')
                    carset_n{i}.setmove;
                else 
                    if carset_n{i}.jud
                        carset_n{i}.setmove;
                        vio=1;
                    else 
                        carset_n{i}.setunmove;
                    end
                end
            elseif i>1&&carset_n{i-1}.ismoving==1
                carset_n{i}.setmove;
            elseif i>1&&carset_n{i-1}.ismoving==0
                pos2=carset_n{i-1}.showpos;
                if pos(2)-pos2(2)<=car_len+1.5
                    carset_n{i}.setunmove;
                end
            end
        end
    end
    for i=1:sc        
        if carset_s{i}.showpre
            carset_s{i}.setmove;
            pos=carset_s{i}.showpos;
            
            if boun/2-w-(pos(2)+car_len/2)>=0&& ...
              boun/2-w-(pos(2)+car_len/2)<1    
                if isequal(sn.color(),'g')
                    carset_s{i}.setmove;
                else 
                    if carset_s{i}.jud
                        carset_s{i}.setmove;
                        vio=1;
                    else 
                        carset_s{i}.setunmove;
                    end
                end
            elseif i>1&&carset_s{i-1}.ismoving==1
                carset_s{i}.setmove;
            elseif i>1&&carset_s{i-1}.ismoving==0                 
                pos2=carset_s{i-1}.showpos;
                if pos2(2)-pos(2)<=car_len+1.5
                    carset_s{i}.setunmove;
                end
            end
        end
    end
    for i=1:ec
        if carset_e{i}.showpre
            carset_e{i}.setmove;
            pos=carset_e{i}.showpos;
            if pos(1)-car_len/2-(boun/2+w)>=0&& ...
                pos(1)-car_len/2-(boun/2+w)<1
                if isequal(ew.color(),'g')
                    carset_e{i}.setmove;
                else 
                    if carset_e{i}.jud
                        carset_e{i}.setmove;
                        vio=1;
                    else 
                        carset_e{i}.setunmove;
                    end
                end
            elseif i>1&&carset_e{i-1}.ismoving==1
                carset_e{i}.setmove;
            elseif i>1&&carset_e{i-1}.ismoving==0
                pos2=carset_e{i-1}.showpos;
                if pos(1)-pos2(1)<=car_len+1.5
                    carset_e{i}.setunmove;
                end
            end
        end
    end
    for i=1:wc        
        if carset_w{i}.showpre
            carset_w{i}.setmove;
            pos=carset_w{i}.showpos;            
            if (boun/2-w)-(pos(1)+car_len/2)>=0 ...
                &&(boun/2-w)-(pos(1)+car_len/2)<1%<1&&(boun/2+w)-pos(1)-car_len/2>0
                if isequal(we.color(),'g')
                    carset_w{i}.setmove;
                else 
                    if carset_w{i}.jud
                        carset_w{i}.setmove;
                        vio=1;
                    else 
                        carset_w{i}.setunmove;
                    end
                end
            elseif i>1&&carset_w{i-1}.ismoving==1
                carset_w{i}.setmove;
            elseif i>1&&carset_w{i-1}.ismoving==0
                pos2=carset_w{i-1}.showpos;
                if pos2(1)-pos(1)<=car_len+1.5
                    carset_w{i}.setunmove;
                end
            end
        end
    end
    % movement decided
    % change of position
    for i=1:nc
        if carset_n{i}.showpre
            if carset_n{i}.ismoving
                pos=carset_n{i}.pos;
                carset_n{i}.setpos([pos(1) pos(2)-1]);
            end
        end
    end
    for i=1:sc
        if carset_s{i}.showpre
            if carset_s{i}.ismoving
                pos=carset_s{i}.pos;
                carset_s{i}.setpos([pos(1) pos(2)+1]);
            end
        end
    end
    for i=1:wc
        if carset_w{i}.showpre
            if carset_w{i}.ismoving
                pos=carset_w{i}.pos;
                carset_w{i}.setpos([pos(1)+1 pos(2)]);
            end
        end
    end
    for i=1:ec
        if carset_e{i}.showpre
            if carset_e{i}.ismoving
                pos=carset_e{i}.pos;
                carset_e{i}.setpos([pos(1)-1 pos(2)]);
            end
        end
    end
    % position changed
    % make new cars present
    presented=0;
    s=0;
    for i=1:nc
        if carset_n{i}.presented==1
            presented=1;
            break;
        end
    end
    if presented==0
        carset_n{1}.setpre(1);
        carset_n{1}.setpos([boun/2-w/2 boun-car_len/2]);
    end
    for i=1:nc
        if carset_n{i}.showpre==0&&s==0% if the car has been past 
            continue;
        elseif carset_n{i}.showpre
            s=1;
            continue;
        elseif carset_n{i}.showpre==0&&s==1
            pos=carset_n{i-1}.showpos;
            if abs(pos(2)-(boun-car_len/2))>=4/3*car_len&&rand<0.5
                carset_n{i}.setpre(1);
                carset_n{i}.setpos([boun/2-w/2 boun-car_len/2]);
            end
            break;
        end
    end
    presented=0;
    s=0;
    for i=1:sc
        if carset_s{i}.presented==1
            presented=1;
            break;
        end
    end
    if presented==0
        carset_s{1}.setpre(1);
        carset_s{1}.setpos([boun/2+w/2 car_len/2]);
    end
    for i=1:sc
        if carset_s{i}.showpre==0&&s==0% if the car has been past 
            continue;
        elseif carset_s{i}.showpre
            s=1;
            continue;
        elseif carset_s{i}.showpre==0&&s==1
            pos=carset_s{i-1}.showpos;
            if abs(pos(2)-car_len/2)>=4/3*car_len&&rand<0.5
                carset_s{i}.setpre(1);
                carset_s{i}.setpos([boun/2+w/2 car_len/2]);
            end
            break;
        end
    end
    presented=0;
    s=0;
    for i=1:wc
        if carset_w{i}.presented==1
            presented=1;
            break;
        end
    end
    if presented==0
        carset_w{1}.setpre(1);
        carset_w{1}.setpos([car_len/2 boun/2-w/2]);
    end
    for i=1:wc
        if carset_w{i}.showpre==0&&s==0% if the car has been past 
            continue;
        elseif carset_w{i}.showpre
            s=1;
            continue;
        elseif carset_w{i}.showpre==0&&s==1
            pos=carset_w{i-1}.showpos;
            if abs(pos(1)-car_len/2)>=4/3*car_len&&rand<0.5
                carset_w{i}.setpre(1);  
                carset_w{i}.setpos([car_len/2 boun/2-w/2]);
            end
            break;
        end
    end
    presented=0;
    s=0;
    for i=1:ec
        if carset_e{i}.presented==1
            presented=1;
            break;
        end
    end
    if presented==0
        carset_e{1}.setpre(1);
        carset_e{1}.setpos([boun-car_len/2 boun/2+w/2]);
    end
    for i=1:ec
        if carset_e{i}.showpre==0&&s==0% if the car has been past 
            continue;
        elseif carset_e{i}.showpre
            s=1;
            continue;
        elseif carset_e{i}.showpre==0&&s==1
            pos=carset_e{i-1}.showpos;
            if abs(pos(1)-(boun-car_len/2))>=4/3*car_len&&rand<0.5
                carset_e{i}.setpre(1); 
                carset_e{i}.setpos([boun-car_len/2 boun/2+w/2]);
            end
            break;
        end
    end
    % new car presence end 
    % old car disappear
    for i=1:nc
        pos=carset_n{i}.showpos();
        if carset_n{i}.showpre()&&pos(2)-car_len/2<0
            carset_n{i}.setpre(0);
        end
    end
    for i=1:sc
        pos=carset_s{i}.showpos();
        if carset_s{i}.showpre()&&pos(2)+car_len/2>boun
            carset_s{i}.setpre(0);
        end
    end
    for i=1:wc
        pos=carset_w{i}.showpos();
        if carset_w{i}.showpre()&&pos(1)+car_len/2>boun
            carset_w{i}.setpre(0);
        end
    end
    for i=1:ec
        pos=carset_e{i}.showpos();
        if carset_e{i}.showpre()&&pos(1)-car_len/2<0
            carset_e{i}.setpre(0);
        end
    end
    % old car deleted
    % draw cars
    for i=1:nc
        if carset_n{i}.showpre()
            carset_n{i}.draw;
        end
    end
    for i=1:sc
        if carset_s{i}.showpre()
            carset_s{i}.draw;
        end
    end
    for i=1:wc
        if carset_w{i}.showpre()
            carset_w{i}.draw;
        end
    end
    for i=1:ec
        if carset_e{i}.showpre()
            carset_e{i}.draw;
        end
    end
    % cars drawn
    % check for crash
    crash=0;
    for i=1:nc
        if carset_n{i}.showpre
            for j=1:ec
                if carset_e{j}.showpre
                    pos_n=carset_n{i}.showpos;
                    pos_e=carset_e{j}.showpos;
                    if pos_n(2)-car_len/2<pos_e(2)+car_wid/2&& ...
                            pos_n(2)+car_len/2>pos_e(2)-car_wid/2&& ...
                            pos_n(1)+car_wid/2>pos_e(1)-car_len/2&& ...
                            pos_n(1)-car_wid/2<pos_e(1)+car_len/2
                        crash=1;
                        car1=carset_n{i};
                        car2=carset_e{j};
                        break;
                    end
                end
            end
        end
    end
    for i=1:nc
        if carset_n{i}.showpre
            for j=1:wc
                if carset_w{j}.showpre
                    pos_n=carset_n{i}.showpos;
                    pos_w=carset_w{j}.showpos;
                    if pos_n(2)-car_len/2<pos_w(2)+car_wid/2&& ...
                            pos_n(2)+car_len/2>pos_w(2)-car_wid/2&& ...
                            pos_n(1)+car_wid/2>pos_w(1)-car_len/2&& ...
                            pos_n(1)-car_wid/2<pos_w(1)+car_len/2
                        crash=1;
                        car1=carset_n{i};
                        car2=carset_w{j};
                        break;
                    end
                end
            end
        end
    end
    for i=1:sc
        if carset_s{i}.showpre
            for j=1:ec
                if carset_e{j}.showpre
                    pos_s=carset_s{i}.showpos;
                    pos_e=carset_e{j}.showpos;
                    if pos_s(2)-car_len/2<pos_e(2)+car_wid/2&& ...
                            pos_s(2)+car_len/2>pos_e(2)-car_wid/2&& ...
                            pos_s(1)+car_wid/2>pos_e(1)-car_len/2&& ...
                            pos_s(1)-car_wid/2<pos_e(1)+car_len/2
                        crash=1;
                        car1=carset_s{i};
                        car2=carset_e{j};
                        break;
                    end
                end
            end
        end
    end
    for i=1:sc
        if carset_s{i}.showpre
            for j=1:wc
                if carset_w{j}.showpre
                    pos_s=carset_s{i}.showpos;
                    pos_w=carset_w{j}.showpos;
                    if pos_s(2)-car_len/2<pos_w(2)+car_wid/2&& ...
                            pos_s(2)+car_len/2>pos_w(2)-car_wid/2&& ...
                            pos_s(1)+car_wid/2>pos_w(1)-car_len/2&& ...
                            pos_s(1)-car_wid/2<pos_w(1)+car_len/2
                        crash=1;
                        car1=carset_s{i};
                        car2=carset_w{j};
                        break;
                    end
                end
            end
        end
    end
    if crash==1
        break;
    end
    % crash checked
    % check if the program has finished
    fin=1;
    for i=1:nc
        if carset_n{i}.showpre
            fin=0;
            break;    
        end
    end
    for i=1:sc
        if carset_s{i}.showpre
            fin=0;
            break;    
        end
    end
    for i=1:ec
        if carset_e{i}.showpre
            fin=0;
            break;    
        end
    end
    for i=1:wc
        if carset_w{i}.showpre
            fin=0;
            break;    
        end
    end
    if fin
        break;
    end
    % check done
    time=time+1;
end
% the main loop ends here
% display the car involved in an accident
if crash == 1
    disp('There is a crash, you lose!');
    disp('The crash involves these two cars:');
    disp(car1.plt_inq);
    disp(car2.plt_inq);
else
    disp('There is no crash. You win!')
end
%
% display any car violate traffic rules
if vio==0
    disp('There is no car violating traffic rules!');
else
    fprintf('The following cars have violated the traffic rules:\n');
    for i=1:nc
        if carset_n{i}.vio
            fprintf([carset_n{i}.plt_inq '\n']);
        end
    end
    for i=1:sc
        if carset_s{i}.vio
            fprintf([carset_s{i}.plt_inq '\n']);
        end
    end
    for i=1:ec
        if carset_e{i}.vio
            fprintf([carset_e{i}.plt_inq '\n']);
        end
    end
    for i=1:wc
        if carset_w{i}.vio
            fprintf([carset_w{i}.plt_inq '\n']);
        end
    end
end
end
