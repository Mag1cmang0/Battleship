function func=Battlehship_select_func(r,c)
    if r==4 && (c==2 || c==3)
        func=1;
    elseif r==4 && (c==5 || c==6)
        func=2;
    elseif r==4 && (c==8 || c==9)
        func=3;
    else
        func=0;
    end
end