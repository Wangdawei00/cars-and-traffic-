function [sc ,nc, ec, wc,w,boun,car_len,car_wid , p, y,r]=initialize()
    n=input('Please input the number of all the cars:');
    p=input('Please input the probability of a car not stopping at a red/yellow light:');
    y=input('Please input the time interval for a yellow light:');
    r=input('Please input the time interval for a red/green light:');
    w=input('Please input the width of a single lane: (the crossroad has two lanes) ');
    boun=input('Please input the length of the whole animation boundary:(the car moves forward 1 unit per second) ');
    car_len = input('Please input the length of a single car:');
    car_wid= 2/3*w;
    while 1 
        sc=ceil(n/2*rand);
        nc=ceil(n/2*rand);
        ec=ceil(n/2*rand);
        wc=n-sc-nc-ec;
        if sc>=2&&nc>=2&&ec>=2&&wc>=2
            break;
        end
    end
end
    