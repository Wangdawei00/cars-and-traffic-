function plate=plate2()
    x='QWERTYUIOPASDFGHJKLZXCVBNM0123456789'; 
    set=[x(ceil(rand*26)) x(ceil(rand*10)+26) x(ceil(rand*36)) ...
        x(ceil(rand*36)) x(ceil(rand*36))];
    plate2=perm(set);
    plate=plate2(ceil(rand*size(plate2,1)),:);
    plate=[x(ceil(rand*26)) ' ' plate];
end
function set=perm(str)
    set=[];
    if length(str)==1
        set=str;
    else
        for i=1:length(str)
            str2=str;
            str2(i)=[];
            set2=perm(str2);
            for j=1:size(set2,1)
                set=[set;str(i) set2(j,:)];
            end
        end
    end
end