fprintf('Welcome to Battleship Player!')

loop=0;
while loop==0

my_scene = simpleGameEngine('Battleship(test).png',84,84);

fprintf('\n Select a difficulty.\n')
title1=11;
title2=12;
title3=13;
title4=14;
title5=15;
easy1=16;
easy2=17;
med1=18;
med2=19;
imp1=21;
imp2=22;

background=ones(5,10).*25;
start_screen = ones(5,10);
start_screen(2,1)=11;
start_screen(2,2)=12;
start_screen(2,3)=13;
start_screen(2,4)=14;
start_screen(2,5)=15;
start_screen(4,2)=easy1;
start_screen(4,3)=easy2;
start_screen(4,5)=med1;
start_screen(4,6)=med2;
start_screen(4,8)=imp1;
start_screen(4,9)=imp2;

drawScene(my_scene,background,start_screen)

func=0;
while func==0
    func=1;
    [r,c] = getMouseInput(my_scene);

    func = Battlehship_select_func(r,c);

end
close
if func==1
    
fprintf(' EASY MODE \n')

% Initialize scene
my_scene = simpleGameEngine('Battleship(test).png',84,84);

% Set up variables to name the various sprites
blank_sprite = 1;
water_sprite = 2;
left_ship_sprite = 3;
horiz_ship_sprite = 4;
right_ship_sprite = 5;
top_ship_sprite = 6;
vert_ship_sprite = 7;
bot_ship_sprite = 8;
hit_sprite = 9;
miss_sprite = 10;

%Set up Background
Water_display = blank_sprite * ones(10,21).*2;
Water_display(:,11) = blank_sprite;

%Set up info grids
Ship_positions = zeros(10,21);

%Set up game logic variables
hit_miss_display = ones(10,21);

game_status = 0;

AiCarrier_health = 5;
AiBattleship_health = 4;
AiCruiser_health = 3;
AiSubmarine_health = 3;
AiDestroyer_health = 2;

Player_Carrier_health = 5;
Player_Battleship_health = 4;
Player_Cruiser_health = 3;
Player_Submarine_health = 3;
Player_Destroyer_health = 2;

%movement based starting coords
iCA=1;
jCA=1;
k=0;

%Place the Carrier instructions

fprintf('You are about to place your CARRIER. \n')
fprintf(['After selecting the orientation of your ship, use the arrow ' ...
    'keys to move your ship around. \n'])
fprintf(['Press the "space" key to place your ship after you move' ...
    ' it to the postition you want it to be in. \n'])
fprintf('\n')

orientCA = input(['Choose your orientation(enter V for vertical, or ' ...
    'H for Horizontal): '],'s');

%move the ship code

if orientCA=='V' || orientCA=='v'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = vert_ship_sprite;
    Board_display(4,1) = vert_ship_sprite;
    Board_display(5,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iCA<10
               iCA=iCA+1;
            elseif k==28 && iCA>1
                iCA=iCA-1;
            elseif k==31 && jCA<6
                jCA=jCA+1;
            elseif k==30 && jCA>1
                jCA=jCA-1;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jCA,iCA) = top_ship_sprite;
    Board_display(jCA+1,iCA) = vert_ship_sprite;
    Board_display(jCA+2,iCA) = vert_ship_sprite;
    Board_display(jCA+3,iCA) = vert_ship_sprite;
    Board_display(jCA+4,iCA) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif orientCA=='H' || orientCA=='h'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = left_ship_sprite;
    Board_display(1,2) = horiz_ship_sprite;
    Board_display(1,3) = horiz_ship_sprite;
    Board_display(1,4) = horiz_ship_sprite;
    Board_display(1,5) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iCA<6
               iCA=iCA+1;
            elseif k==28 && iCA>1
                iCA=iCA-1;
            elseif k==31 && jCA<10
                jCA=jCA+1;
            elseif k==30 && jCA>1
                jCA=jCA-1;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jCA,iCA) = left_ship_sprite;
    Board_display(jCA,iCA+1) = horiz_ship_sprite;
    Board_display(jCA,iCA+2) = horiz_ship_sprite;
    Board_display(jCA,iCA+3) = horiz_ship_sprite;
    Board_display(jCA,iCA+4) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

else
    fprintf('Invalid input, defaulting to vertical.\n')
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = vert_ship_sprite;
    Board_display(4,1) = vert_ship_sprite;
    Board_display(5,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iCA<10
               iCA=iCA+1;
            elseif k==28 && iCA>1
                iCA=iCA-1;
            elseif k==31 && jCA<6
                jCA=jCA+1;
            elseif k==30 && jCA>1
                jCA=jCA-1;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jCA,iCA) = top_ship_sprite;
    Board_display(jCA+1,iCA) = vert_ship_sprite;
    Board_display(jCA+2,iCA) = vert_ship_sprite;
    Board_display(jCA+3,iCA) = vert_ship_sprite;
    Board_display(jCA+4,iCA) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

for i=1:210;
    if Board_display(i)==1;
        Water_display(i)=2;
        i=i+1;
    elseif Board_display(i)~=1;
        Water_display(i)=Board_display(i);
        i=i+1;
    end
end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=1;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)
close
%==========================================================================
%==========================================================================

%movement based starting coords
iBA=1;
jBA=1;
k=0;


%Place the Battleship instructions

fprintf('You are about to place your BATTLESHIP. \n')
fprintf(['After selecting the orientation of your ship, use the arrow ' ...
    'keys to move your ship around. \n'])
fprintf(['Press the "space" key to place your ship after you move' ...
    ' it to the postition you want it to be in. \n'])
fprintf('\n')

orientBA = input(['Choose your orientation(enter V for vertical, or ' ...
    'H for Horizontal): '],'s');

%move the ship code

if orientBA=='V' || orientBA=='v'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = vert_ship_sprite;
    Board_display(4,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);
    k=0;
    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iBA<10
               iBA=iBA+1;
            elseif k==28 && iBA>1
                iBA=iBA-1;
            elseif k==31 && jBA<7
                jBA=jBA+1;
            elseif k==30 && jBA>1
                jBA=jBA-1;
            elseif (k==32 && (Water_display(jBA,iBA)~=2 || Water_display(jBA+1,iBA)~=2 || Water_display(jBA+2,iBA)~=2 || Water_display(jBA+3,iBA)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jBA,iBA)==2 && Water_display(jBA+1,jBA)==2 && Water_display(jBA+2,iBA)==2 && Water_display(jBA+3,iBA)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jBA,iBA) = top_ship_sprite;
    Board_display(jBA+1,iBA) = vert_ship_sprite;
    Board_display(jBA+2,iBA) = vert_ship_sprite;
    Board_display(jBA+3,iBA) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end


%--------------------------------------------------------------------------

elseif orientBA=='H' || orientBA=='h'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = left_ship_sprite;
    Board_display(1,2) = horiz_ship_sprite;
    Board_display(1,3) = horiz_ship_sprite;
    Board_display(1,4) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iBA<7
               iBA=iBA+1;
            elseif k==28 && iBA>1
                iBA=iBA-1;
            elseif k==31 && jBA<10
                jBA=jBA+1;
            elseif k==30 && jBA>1
                jBA=jBA-1;
            elseif (k==32 && (Water_display(jBA,iBA)~=2 || Water_display(jBA,iBA+1)~=2 || Water_display(jBA,iBA+2)~=2 || Water_display(jBA,iBA+3)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jBA,iBA)==2 && Water_display(jBA,jBA+1)==2 && Water_display(jBA,iBA+2)==2 && Water_display(jBA,iBA+3)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jBA,iBA) = left_ship_sprite;
    Board_display(jBA,iBA+1) = horiz_ship_sprite;
    Board_display(jBA,iBA+2) = horiz_ship_sprite;
    Board_display(jBA,iBA+3) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

else
    fprintf('Invalid input, defaulting to vertical.\n')
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = vert_ship_sprite;
    Board_display(4,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);
    k=0;
    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iBA<10
               iBA=iBA+1;
            elseif k==28 && iBA>1
                iBA=iBA-1;
            elseif k==31 && jBA<7
                jBA=jBA+1;
            elseif k==30 && jBA>1
                jBA=jBA-1;
            elseif (k==32 && (Water_display(jBA,iBA)~=2 || Water_display(jBA+1,iBA)~=2 || Water_display(jBA+2,iBA)~=2 || Water_display(jBA+3,iBA)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jBA,iBA)==2 && Water_display(jBA+1,jBA)==2 && Water_display(jBA+2,iBA)==2 && Water_display(jBA+3,iBA)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jBA,iBA) = top_ship_sprite;
    Board_display(jBA+1,iBA) = vert_ship_sprite;
    Board_display(jBA+2,iBA) = vert_ship_sprite;
    Board_display(jBA+3,iBA) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end
    
end

%=========================================================================
%=========================================================================

for i1=1:210;
    if Board_display(i1)==1;
        Water_display(i1)=Water_display(i1);
        i1=i1+1;
    elseif Board_display(i1)~=1;
        Water_display(i1)=Board_display(i1);
        i1=i1+1;
    end
end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=2;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)
close
%==========================================================================
%==========================================================================

%movement based starting coords
iCR=1;
jCR=1;
k=0;

%%
%Place the Cruiser instructions

fprintf('You are about to place your CRUISER. \n')
fprintf(['After selecting the orientation of your ship, use the arrow ' ...
    'keys to move your ship around. \n'])
fprintf(['Press the "space" key to place your ship after you move' ...
    ' it to the postition you want it to be in. \n'])
fprintf('\n')

orientCR = input(['Choose your orientation(enter V for vertical, or ' ...
    'H for Horizontal): '],'s');

%move the ship code

if orientCR =='V' || orientCR == 'v'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iCR<10
               iCR=iCR+1;
            elseif k==28 && iCR>1
                iCR=iCR-1;
            elseif k==31 && jCR<8
                jCR=jCR+1;
            elseif k==30 && jCR>1
                jCR=jCR-1;
            elseif (k==32 && (Water_display(jCR,iCR)~=2 || Water_display(jCR+1,iCR)~=2 || Water_display(jCR+2,iCR)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jCR,iCR)==2 && Water_display(jCR+1,jCR)==2 && Water_display(jCR+2,iCR)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jCR,iCR) = top_ship_sprite;
    Board_display(jCR+1,iCR) = vert_ship_sprite;
    Board_display(jCR+2,iCR) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif orientCR =='H' || orientCR == 'h'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = left_ship_sprite;
    Board_display(1,2) = horiz_ship_sprite;
    Board_display(1,3) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iCR<8
               iCR=iCR+1;
            elseif k==28 && iCR>1
                iCR=iCR-1;
            elseif k==31 && jCR<10
                jCR=jCR+1;
            elseif k==30 && jCR>1
                jCR=jCR-1;
            elseif (k==32 && (Water_display(jCR,iCR)~=2 || Water_display(jCR,iCR+1)~=2 || Water_display(jCR,iCR+2)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jCR,iCR)==2 && Water_display(jCR,jCR+1)==2 && Water_display(jCR,iCR+2)==2)
                k=32;

            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jCR,iCR) = left_ship_sprite;
    Board_display(jCR,iCR+1) = horiz_ship_sprite;
    Board_display(jCR,iCR+2) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

else
    fprintf('Invalid input, defaulting to vertical.\n')
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);
    
    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iCR<10
               iCR=iCR+1;
            elseif k==28 && iCR>1
                iCR=iCR-1;
            elseif k==31 && jCR<8
                jCR=jCR+1;
            elseif k==30 && jCR>1
                jCR=jCR-1;
            elseif (k==32 && (Water_display(jCR,iCR)~=2 || Water_display(jCR+1,iCR)~=2 || Water_display(jCR+2,iCR)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jCR,iCR)==2 && Water_display(jCR+1,jCR)==2 && Water_display(jCR+2,iCR)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jCR,iCR) = top_ship_sprite;
    Board_display(jCR+1,iCR) = vert_ship_sprite;
    Board_display(jCR+2,iCR) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

for i1=1:210;
    if Board_display(i1)==1;
        Water_display(i1)=Water_display(i1);
        i1=i1+1;
    elseif Board_display(i1)~=1;
        Water_display(i1)=Board_display(i1);
        i1=i1+1;
    end
end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=3;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)
close
%==========================================================================
%==========================================================================

%movement based starting coords
iSU=1;
jSU=1;
k=0;

%%
%Place the Cruiser instructions

fprintf('You are about to place your SUBMARINE. \n')
fprintf(['After selecting the orientation of your ship, use the arrow ' ...
    'keys to move your ship around. \n'])
fprintf(['Press the "space" key to place your ship after you move' ...
    ' it to the postition you want it to be in. \n'])
fprintf('\n')

orientSU = input(['Choose your orientation(enter V for vertical, or ' ...
    'H for Horizontal): '],'s');

%move the ship code

if orientSU =='V' || orientSU == 'v'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iSU<10
               iSU=iSU+1;
            elseif k==28 && iSU>1
                iSU=iSU-1;
            elseif k==31 && jSU<8
                jSU=jSU+1;
            elseif k==30 && jSU>1
                jSU=jSU-1;
            elseif (k==32 && (Water_display(jSU,iSU)~=2 || Water_display(jSU+1,iSU)~=2 || Water_display(jSU+2,iSU)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jSU,iSU)==2 && Water_display(jSU+1,jSU)==2 && Water_display(jSU+2,iSU)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jSU,iSU) = top_ship_sprite;
    Board_display(jSU+1,iSU) = vert_ship_sprite;
    Board_display(jSU+2,iSU) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif orientSU =='H' || orientSU == 'h'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = left_ship_sprite;
    Board_display(1,2) = horiz_ship_sprite;
    Board_display(1,3) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));
        
            if k==29 && iSU<8
               iSU=iSU+1;
            elseif k==28 && iSU>1
                iSU=iSU-1;
            elseif k==31 && jSU<10
                jSU=jSU+1;
            elseif k==30 && jSU>1
                jSU=jSU-1;
            elseif (k==32 && (Water_display(jSU,iSU)~=2 || Water_display(jSU,iSU+1)~=2 || Water_display(jSU,iSU+2)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jSU,iSU)==2 && Water_display(jSU,jSU+1)==2 && Water_display(jSU,iSU+2)==2)
                k=32;

            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jSU,iSU) = left_ship_sprite;
    Board_display(jSU,iSU+1) = horiz_ship_sprite;
    Board_display(jSU,iSU+2) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

else
    fprintf('Invalid input, defaulting to vertical.\n')
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iSU<10
               iSU=iSU+1;
            elseif k==28 && iSU>1
                iSU=iSU-1;
            elseif k==31 && jSU<8
                jSU=jSU+1;
            elseif k==30 && jSU>1
                jSU=jSU-1;
            elseif (k==32 && (Water_display(jSU,iSU)~=2 || Water_display(jSU+1,iSU)~=2 || Water_display(jSU+2,iSU)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jSU,iSU)==2 && Water_display(jSU+1,jSU)==2 && Water_display(jSU+2,iSU)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jSU,iSU) = top_ship_sprite;
    Board_display(jSU+1,iSU) = vert_ship_sprite;
    Board_display(jSU+2,iSU) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

for i1=1:210;
    if Board_display(i1)==1;
        Water_display(i1)=Water_display(i1);
        i1=i1+1;
    elseif Board_display(i1)~=1;
        Water_display(i1)=Board_display(i1);
        i1=i1+1;
    end
end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=4;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)
close
%==========================================================================
%==========================================================================

%movement based starting coords
iDE=1;
jDE=1;
k=0;

%%
%Place the destroyer instructions

fprintf('You are about to place your DESTROYER. \n')
fprintf(['After selecting the orientation of your ship, use the arrow ' ...
    'keys to move your ship around. \n'])
fprintf(['Press the "space" key to place your ship after you move' ...
    ' it to the postition you want it to be in. \n'])
fprintf('\n')

orientDE = input(['Choose your orientation(enter V for vertical, or ' ...
    'H for Horizontal): '],'s');

%move the ship code

if orientDE =='V' || orientDE == 'v'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iDE<10
               iDE=iDE+1;
            elseif k==28 && iDE>1
                iDE=iDE-1;
            elseif k==31 && jDE<9
                jDE=jDE+1;
            elseif k==30 && jDE>1
                jDE=jDE-1;
            elseif (k==32 && (Water_display(jDE,iDE)~=2 || Water_display(jDE+1,iDE)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jDE,iDE)==2 && Water_display(jDE+1,jDE)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jDE,iDE) = top_ship_sprite;
    Board_display(jDE+1,iDE) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif orientDE=='H' || orientDE=='h'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = left_ship_sprite;
    Board_display(1,2) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iDE<9
               iDE=iDE+1;
            elseif k==28 && iDE>1
                iDE=iDE-1;
            elseif k==31 && jDE<10
                jDE=jDE+1;
            elseif k==30 && jDE>1
                jDE=jDE-1;
            elseif (k==32 && (Water_display(jDE,iDE)~=2 || Water_display(jDE,iDE+1)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jDE,iDE)==2 && Water_display(jDE,jDE+1)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jDE,iDE) = left_ship_sprite;
    Board_display(jDE,iDE+1) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

else
    fprintf('Invalid input, defaulting to vertical.\n')
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iDE<10
               iDE=iDE+1;
            elseif k==28 && iDE>1
                iDE=iDE-1;
            elseif k==31 && jDE<9
                jDE=jDE+1;
            elseif k==30 && jDE>1
                jDE=jDE-1;
            elseif (k==32 && (Water_display(jDE,iDE)~=2 || Water_display(jDE+1,iDE)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jDE,iDE)==2 && Water_display(jDE+1,jDE)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jDE,iDE) = top_ship_sprite;
    Board_display(jDE+1,iDE) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

for i1=1:210;
    if Board_display(i1)==1;
        Water_display(i1)=Water_display(i1);
        i1=i1+1;
    elseif Board_display(i1)~=1;
        Water_display(i1)=Board_display(i1);
        i1=i1+1;
    end
end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=5;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)
close


%==========================================================================
%==========================================================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%==========================================================================
%==========================================================================
%AI PLACEMENT!!!

%movement based starting coords
AiCA=randi([12,17]);
AjCA=randi([1,6]);
k=0;


%Place the Carrier instructions

fprintf('Ai is placing Carrier... \n')
fprintf('... \n')
fprintf('... \n')
fprintf('Carrier Placed. \n')
fprintf('\n')

AiorientCA = randi([1,2]);

%move the ship code

if AiorientCA== 1
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = top_ship_sprite;
    Board_display(2,1+11) = vert_ship_sprite;
    Board_display(3,1+11) = vert_ship_sprite;
    Board_display(4,1+11) = vert_ship_sprite;
    Board_display(5,1+11) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiCA<(10+11)
               AiCA=AiCA+1;
            elseif k==28 && AiCA>(1+11)
                AiCA=AiCA-1;
            elseif k==31 && AjCA<(6)
                AjCA=AjCA+1;
            elseif k==30 && AjCA>(1)
                AjCA=AjCA-1;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AjCA,AiCA) = top_ship_sprite;
    Board_display(AjCA+1,AiCA) = vert_ship_sprite;
    Board_display(AjCA+2,AiCA) = vert_ship_sprite;
    Board_display(AjCA+3,AiCA) = vert_ship_sprite;
    Board_display(AjCA+4,AiCA) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif AiorientCA == 2
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = left_ship_sprite;
    Board_display(1,2+11) = horiz_ship_sprite;
    Board_display(1,3+11) = horiz_ship_sprite;
    Board_display(1,4+11) = horiz_ship_sprite;
    Board_display(1,5+11) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiCA<6+11
               AiCA=AiCA+1;
            elseif k==28 && AiCA>1+11
                AiCA=AiCA-1;
            elseif k==31 && AjCA<10
                AjCA=AjCA+1;
            elseif k==30 && AjCA>1
                AjCA=AjCA-1;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AjCA,AiCA) = left_ship_sprite;
    Board_display(AjCA,AiCA+1) = horiz_ship_sprite;
    Board_display(AjCA,AiCA+2) = horiz_ship_sprite;
    Board_display(AjCA,AiCA+3) = horiz_ship_sprite;
    Board_display(AjCA,AiCA+4) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

%for i=1:210;
%    if Board_display(i)==1;
%        Water_display(i)=Water_display(i);
%        i=i+1;
%    elseif Board_display(i)~=1;
%        Water_display(i)=Board_display(i);
%        i=i+1;
%    end
%end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=11;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)

%==========================================================================
%==========================================================================
%movement based starting coords
AiiBA=randi([12,18]);
AijBA=randi([1,7]);
k=0;


%Place the Battleship instructions

fprintf('Ai is placing Battleship... \n')
fprintf('... \n')
fprintf('... \n')
fprintf('Battleship Placed. \n')
fprintf('\n')

AiorientBA = randi([1,2]);

%move the ship code

if AiorientBA== 1
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = top_ship_sprite;
    Board_display(2,1+11) = vert_ship_sprite;
    Board_display(3,1+11) = vert_ship_sprite;
    Board_display(4,1+11) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiBA<(10+11)
               AiiBA=AiiBA+1;
            elseif k==28 && AiiBA>(1+11)
                AiiBA=AiiBA-1;
            elseif k==31 && AijBA<(7)
                AijBA=AijBA+1;
            elseif k==30 && AijBA>(1)
                AijBA=AijBA-1;
            elseif (k==32 && (Ship_positions(AijBA,AiiBA)~=0 || Ship_positions(AijBA+1,AiiBA)~=0 || Ship_positions(AijBA+2,AiiBA)~=0 || Ship_positions(AijBA+3,AiiBA)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijBA,AiiBA)==0 && Ship_positions(AijBA+1,AiiBA)==0 && Ship_positions(AijBA+2,AiiBA)==0 && Ship_positions(AijBA+3,AiiBA)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AijBA,AiiBA) = top_ship_sprite;
    Board_display(AijBA+1,AiiBA) = vert_ship_sprite;
    Board_display(AijBA+2,AiiBA) = vert_ship_sprite;
    Board_display(AijBA+3,AiiBA) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif AiorientBA == 2
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = left_ship_sprite;
    Board_display(1,2+11) = horiz_ship_sprite;
    Board_display(1,3+11) = horiz_ship_sprite;
    Board_display(1,4+11) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiBA<7+11
               AiiBA=AiiBA+1;
            elseif k==28 && AiiBA>1+11
                AiiBA=AiiBA-1;
            elseif k==31 && AijBA<10
                AijBA=AijBA+1;
            elseif k==30 && AijBA>1
                AijBA=AijBA-1;
            elseif (k==32 && (Ship_positions(AijBA,AiiBA)~=0 || Ship_positions(AijBA,AiiBA+1)~=0 || Ship_positions(AijBA,AiiBA+2)~=0 || Ship_positions(AijBA,AiiBA+3)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijBA,AiiBA)==0 && Ship_positions(AijBA,AiiBA+1)==0 && Ship_positions(AijBA,AiiBA+2)==0 && Ship_positions(AijBA,AiiBA+3)==0)
                k=32;

            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AijBA,AiiBA) = left_ship_sprite;
    Board_display(AijBA,AiiBA+1) = horiz_ship_sprite;
    Board_display(AijBA,AiiBA+2) = horiz_ship_sprite;
    Board_display(AijBA,AiiBA+3) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

%for i=1:210;
%    if Board_display(i)==1;
%        Water_display(i)=Water_display(i);
%        i=i+1;
%    elseif Board_display(i)~=1;
%        Water_display(i)=Board_display(i);
%        i=i+1;
%    end
%end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=22;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)

%==========================================================================
%==========================================================================
%movement based starting coords
AiiCR=randi([12,19]);
AijCR=randi([1,8]);
k=0;


%Place the Cruiser instructions

fprintf('Ai is placing Cruiser... \n')
fprintf('... \n')
fprintf('... \n')
fprintf('Cruiser Placed. \n')
fprintf('\n')

AiorientCR = randi([1,2]);

%move the ship code

if AiorientCR== 1
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = top_ship_sprite;
    Board_display(2,1+11) = vert_ship_sprite;
    Board_display(3,1+11) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiCR<(10+11)
               AiiCR=AiiCR+1;
            elseif k==28 && AiiCR>(1+11)
                AiiCR=AiiCR-1;
            elseif k==31 && AijCR<(8)
                AijCR=AijCR+1;
            elseif k==30 && AijCR>(1)
                AijCR=AijCR-1;
            elseif (k==32 && (Ship_positions(AijCR,AiiCR)~=0 || Ship_positions(AijCR+1,AiiCR)~=0 || Ship_positions(AijCR+2,AiiCR)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijCR,AiiCR)==0 && Ship_positions(AijCR+1,AiiCR)==0 && Ship_positions(AijCR+2,AiiCR)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AijCR,AiiCR) = top_ship_sprite;
    Board_display(AijCR+1,AiiCR) = vert_ship_sprite;
    Board_display(AijCR+2,AiiCR) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif AiorientCR == 2
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = left_ship_sprite;
    Board_display(1,2+11) = horiz_ship_sprite;
    Board_display(1,3+11) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiCR<8+11
               AiiCR=AiiCR+1;
            elseif k==28 && AiiCR>1+11
                AiiCR=AiiCR-1;
            elseif k==31 && AijCR<10
                AijCR=AijCR+1;
            elseif k==30 && AijCR>1
                AijCR=AijCR-1;
            elseif (k==32 && (Ship_positions(AijCR,AiiCR)~=0 || Ship_positions(AijCR,AiiCR+1)~=0 || Ship_positions(AijCR,AiiCR+2)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijCR,AiiCR)==0 && Ship_positions(AijCR,AiiCR+1)==0 && Ship_positions(AijCR,AiiCR+2)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AijCR,AiiCR) = left_ship_sprite;
    Board_display(AijCR,AiiCR+1) = horiz_ship_sprite;
    Board_display(AijCR,AiiCR+2) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

%for i=1:210;
%    if Board_display(i)==1;
%        Water_display(i)=Water_display(i);
%        i=i+1;
%    elseif Board_display(i)~=1;
%        Water_display(i)=Board_display(i);
%        i=i+1;
%    end
%end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=33;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)

%==========================================================================
%==========================================================================
%movement based starting coords
AiiSU=randi([12,19]);
AijSU=randi([1,8]);
k=0;


%Place the Submarine instructions

fprintf('Ai is placing Submarine... \n')
fprintf('... \n')
fprintf('... \n')
fprintf('Submarine Placed. \n')
fprintf('\n')

AiorientSU = randi([1,2]);

%move the ship code

if AiorientSU== 1
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = top_ship_sprite;
    Board_display(2,1+11) = vert_ship_sprite;
    Board_display(3,1+11) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiSU<(10+11)
               AiiSU=AiiSU+1;
            elseif k==28 && AiiSU>(1+11)
                AiiSU=AiiSU-1;
            elseif k==31 && AijSU<(8)
                AijSU=AijSU+1;
            elseif k==30 && AijSU>(1)
                AijSU=AijSU-1;
            elseif (k==32 && (Ship_positions(AijSU,AiiSU)~=0 || Ship_positions(AijSU+1,AiiSU)~=0 || Ship_positions(AijSU+2,AiiSU)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijSU,AiiSU)==0 && Ship_positions(AijSU+1,AiiSU)==0 && Ship_positions(AijSU+2,AiiSU)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AijSU,AiiSU) = top_ship_sprite;
    Board_display(AijSU+1,AiiSU) = vert_ship_sprite;
    Board_display(AijSU+2,AiiSU) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif AiorientSU == 2
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = left_ship_sprite;
    Board_display(1,2+11) = horiz_ship_sprite;
    Board_display(1,3+11) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiSU<8+11
               AiiSU=AiiSU+1;
            elseif k==28 && AiiSU>1+11
                AiiSU=AiiSU-1;
            elseif k==31 && AijSU<10
                AijSU=AijSU+1;
            elseif k==30 && AijSU>1
                AijSU=AijSU-1;
            elseif (k==32 && (Ship_positions(AijSU,AiiSU)~=0 || Ship_positions(AijSU,AiiSU+1)~=0 || Ship_positions(AijSU,AiiSU+2)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijSU,AiiSU)==0 && Ship_positions(AijSU,AiiSU+1)==0 && Ship_positions(AijSU,AiiSU+2)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AijSU,AiiSU) = left_ship_sprite;
    Board_display(AijSU,AiiSU+1) = horiz_ship_sprite;
    Board_display(AijSU,AiiSU+2) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

%for i=1:210;
%    if Board_display(i)==1;
%        Water_display(i)=Water_display(i);
%        i=i+1;
%    elseif Board_display(i)~=1;
%        Water_display(i)=Board_display(i);
%        i=i+1;
%    end
%end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=44;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)

%==========================================================================
%==========================================================================
%movement based starting coords
AiiDE=randi([12,20]);
AijDE=randi([1,9]);
k=0;


%Place the Destroyer instructions

fprintf('Ai is placing Destroyer... \n')
fprintf('... \n')
fprintf('... \n')
fprintf('Destroyer Placed. \n')
fprintf('\n')

AiorientDE = randi([1,2]);

%move the ship code

if AiorientDE== 1
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = top_ship_sprite;
    Board_display(2,1+11) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiDE<(10+11)
               AiiDE=AiiDE+1;
            elseif k==28 && AiiDE>(1+11)
                AiiDE=AiiDE-1;
            elseif k==31 && AijDE<(9)
                AijDE=AijDE+1;
            elseif k==30 && AijDE>(1)
                AijDE=AijDE-1;
            elseif (k==32 && (Ship_positions(AijDE,AiiDE)~=0 || Ship_positions(AijDE+1,AiiDE)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijDE,AiiDE)==0 && Ship_positions(AijDE+1,AiiDE)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AijDE,AiiDE) = top_ship_sprite;
    Board_display(AijDE+1,AiiDE) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif AiorientDE == 2
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = left_ship_sprite;
    Board_display(1,2+11) = right_ship_sprite;
    %drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiDE<9+11
               AiiDE=AiiDE+1;
            elseif k==28 && AiiDE>1+11
                AiiDE=AiiDE-1;
            elseif k==31 && AijDE<10
                AijDE=AijDE+1;
            elseif k==30 && AijDE>1
                AijDE=AijDE-1;
            elseif (k==32 && (Ship_positions(AijDE,AiiDE)~=0 || Ship_positions(AijDE,AiiDE+1)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijDE,AiiDE)==0 && Ship_positions(AijDE,AiiDE+1)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AijDE,AiiDE) = left_ship_sprite;
    Board_display(AijDE,AiiDE+1) = right_ship_sprite;
    %drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

%for i=1:210;
%    if Board_display(i)==1;
%        Water_display(i)=Water_display(i);
%        i=i+1;
%    elseif Board_display(i)~=1;
%        Water_display(i)=Board_display(i);
%        i=i+1;
%    end
%end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=55;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)

%==========================================================================
%==========================================================================
Debugdisplay=zeros(10,21);
for i=1:210;
    Debugdisplay(i)=Ship_positions(i);
end
%% later the Ai ship's display will need to be taken out of view, deleting
%% all the drawscene functions on the Ai placement code should resolve the
%% issue, hopefully.
fprintf('click on the board where you want to shoot')

H=0;

while game_status == 0

    fprintf('\n Make your move')
    z=0;
    while z==0
        z=1;
        [r,c] = getMouseInput(my_scene);

        if Ship_positions(r,c) == 0 && 0<r && r<11 && 11<c && c<22 
            hit_miss_display(r,c) = miss_sprite;
            Ship_positions(r,c) = 9;

        elseif Ship_positions(r,c)~=0 && 0<r && r<11 && 11<c && c<22 && Ship_positions(r,c)~=9
            hit_miss_display(r,c) = hit_sprite;

            if Ship_positions(r,c)==11
                AiCarrier_health=AiCarrier_health-1;
            elseif Ship_positions(r,c)==22
                AiBattleship_health=AiBattleship_health-1;
            elseif Ship_positions(r,c)==33
                AiCruiser_health=AiCruiser_health-1;
            elseif Ship_positions(r,c)==44
                AiSubmarine_health=AiSubmarine_health-1;
            elseif Ship_positions(r,c)==55
                AiDestroyer_health=AiDestroyer_health-1;
            end

            Ship_positions(r,c) = 9;

        elseif (Ship_positions(r,c))==9
                fprintf('\n You already shot in that square! \n')
                z=0;
                
        else
            z=0;
        end
    end

    if AiCarrier_health == 0
        fprintf('\n You sank the Carrier!')
        AiCarrier_health = -1;
    elseif AiBattleship_health == 0
        fprintf('\n You sank the Battleship!')
        AiBattleship_health = -1;
    elseif AiCruiser_health == 0
        fprintf('\n You sank the Cruiser!')
        AiCruiser_health = -1;
    elseif AiSubmarine_health == 0
        fprintf('\n You sank the Submarine!')
        AiSubmarine_health = -1;
    elseif AiDestroyer_health == 0
        fprintf('\n You sank the Destroyer!')
        AiDestroyer_health = -1;
    end

    drawScene(my_scene,Water_display,hit_miss_display)

%--------------------------------------------------------------------------
   %AI's turn to play

    z=0;
    while z==0
        z=1;
        r = randi([1,10]);
        c = randi([1,10]);

        if H==1
            r=r1;
            c=c2;
            H=0;
        elseif H==2
            r=r2;
            c=c1;
            H=0;
        end

        if Ship_positions(r,c) == 0 && 0<r && r<11 && 0<c && c<11
            hit_miss_display(r,c) = miss_sprite;
            Ship_positions(r,c) = 9;

        elseif Ship_positions(r,c)~=0 && Ship_positions(r,c)~=9
            hit_miss_display(r,c) = hit_sprite;
            H=randi([1,2]);
            r2=r;
            c2=c;
            if r>1 && r<10 && c>1 && c<10
            r1=r+randi([-1,1]);
            c1=c+randi([-1,1]);
            else
            r1 = randi([1,10]);
            c1 = randi([1,10]);
            end

            if Ship_positions(r,c)==1
                Player_Carrier_health=Player_Carrier_health-1;
            elseif Ship_positions(r,c)==2
                Player_Battleship_health=Player_Battleship_health-1;
            elseif Ship_positions(r,c)==3
                Player_Cruiser_health=Player_Cruiser_health-1;
            elseif Ship_positions(r,c)==4
                Player_Submarine_health=Player_Submarine_health-1;
            elseif Ship_positions(r,c)==5
                Player_Destroyer_health=Player_Destroyer_health-1;
            end

            Ship_positions(r,c) = 9;
         
        elseif (Ship_positions(r,c))==9
                z=0;

        else
            z=0;
        end
    end
    
    if Player_Carrier_health == 0
        Player_Carrier_health = -1;
    elseif Player_Battleship_health == 0
        Player_Battleship_health = -1;
    elseif Player_Cruiser_health == 0
        Player_Cruiser_health = -1;
    elseif Player_Submarine_health == 0
        Player_Submarine_health = -1;
    elseif Player_Destroyer_health == 0
        Player_Destroyer_health = -1;
    end

    drawScene(my_scene,Water_display,hit_miss_display)

    % Win Condition Code Goes here:
    if AiCarrier_health == -1 && AiBattleship_health == -1 && AiCruiser_health == -1 && AiSubmarine_health == -1 && AiDestroyer_health == -1
        fprintf('\n Congrats Player! You beat the computer!')
        game_status=1;
        close
    elseif Player_Carrier_health == -1 && Player_Battleship_health == -1 && Player_Cruiser_health == -1 && Player_Submarine_health == -1 && Player_Destroyer_health == -1
        fprintf(['\n You lost! Practice the art of battleship for another ' ...
        '1,000 years before you challenge me again'])
        game_status=1;
        close
    end

end

elseif func==2

fprintf(' 3-SHOT MODE \n')

% Initialize scene
my_scene = simpleGameEngine('Battleship(test).png',84,84);

% Set up variables to name the various sprites
blank_sprite = 1;
water_sprite = 2;
left_ship_sprite = 3;
horiz_ship_sprite = 4;
right_ship_sprite = 5;
top_ship_sprite = 6;
vert_ship_sprite = 7;
bot_ship_sprite = 8;
hit_sprite = 9;
miss_sprite = 10;

%Set up Background
Water_display = blank_sprite * ones(10,21).*2;
Water_display(:,11) = blank_sprite;

%Set up info grids
Ship_positions = zeros(10,21);

%Set up game logic variables
hit_miss_display = ones(10,21);

game_status = 0;

AiCarrier_health = 5;
AiBattleship_health = 4;
AiCruiser_health = 3;
AiSubmarine_health = 3;
AiDestroyer_health = 2;

Player_Carrier_health = 5;
Player_Battleship_health = 4;
Player_Cruiser_health = 3;
Player_Submarine_health = 3;
Player_Destroyer_health = 2;

%movement based starting coords
iCA=1;
jCA=1;
k=0;

%Place the Carrier instructions

fprintf('You are about to place your CARRIER. \n')
fprintf(['After selecting the orientation of your ship, use the arrow ' ...
    'keys to move your ship around. \n'])
fprintf(['Press the "space" key to place your ship after you move' ...
    ' it to the postition you want it to be in. \n'])
fprintf('\n')

orientCA = input(['Choose your orientation(enter V for vertical, or ' ...
    'H for Horizontal): '],'s');

%move the ship code

if orientCA=='V' || orientCA=='v'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = vert_ship_sprite;
    Board_display(4,1) = vert_ship_sprite;
    Board_display(5,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iCA<10
               iCA=iCA+1;
            elseif k==28 && iCA>1
                iCA=iCA-1;
            elseif k==31 && jCA<6
                jCA=jCA+1;
            elseif k==30 && jCA>1
                jCA=jCA-1;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jCA,iCA) = top_ship_sprite;
    Board_display(jCA+1,iCA) = vert_ship_sprite;
    Board_display(jCA+2,iCA) = vert_ship_sprite;
    Board_display(jCA+3,iCA) = vert_ship_sprite;
    Board_display(jCA+4,iCA) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif orientCA=='H' || orientCA=='h'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = left_ship_sprite;
    Board_display(1,2) = horiz_ship_sprite;
    Board_display(1,3) = horiz_ship_sprite;
    Board_display(1,4) = horiz_ship_sprite;
    Board_display(1,5) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iCA<6
               iCA=iCA+1;
            elseif k==28 && iCA>1
                iCA=iCA-1;
            elseif k==31 && jCA<10
                jCA=jCA+1;
            elseif k==30 && jCA>1
                jCA=jCA-1;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jCA,iCA) = left_ship_sprite;
    Board_display(jCA,iCA+1) = horiz_ship_sprite;
    Board_display(jCA,iCA+2) = horiz_ship_sprite;
    Board_display(jCA,iCA+3) = horiz_ship_sprite;
    Board_display(jCA,iCA+4) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

else
    fprintf('Invalid input, defaulting to vertical.\n')
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = vert_ship_sprite;
    Board_display(4,1) = vert_ship_sprite;
    Board_display(5,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iCA<10
               iCA=iCA+1;
            elseif k==28 && iCA>1
                iCA=iCA-1;
            elseif k==31 && jCA<6
                jCA=jCA+1;
            elseif k==30 && jCA>1
                jCA=jCA-1;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jCA,iCA) = top_ship_sprite;
    Board_display(jCA+1,iCA) = vert_ship_sprite;
    Board_display(jCA+2,iCA) = vert_ship_sprite;
    Board_display(jCA+3,iCA) = vert_ship_sprite;
    Board_display(jCA+4,iCA) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

for i=1:210;
    if Board_display(i)==1;
        Water_display(i)=2;
        i=i+1;
    elseif Board_display(i)~=1;
        Water_display(i)=Board_display(i);
        i=i+1;
    end
end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=1;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)
close
%==========================================================================
%==========================================================================

%movement based starting coords
iBA=1;
jBA=1;
k=0;


%Place the Battleship instructions

fprintf('You are about to place your BATTLESHIP. \n')
fprintf(['After selecting the orientation of your ship, use the arrow ' ...
    'keys to move your ship around. \n'])
fprintf(['Press the "space" key to place your ship after you move' ...
    ' it to the postition you want it to be in. \n'])
fprintf('\n')

orientBA = input(['Choose your orientation(enter V for vertical, or ' ...
    'H for Horizontal): '],'s');

%move the ship code

if orientBA=='V' || orientBA=='v'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = vert_ship_sprite;
    Board_display(4,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);
    k=0;
    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iBA<10
               iBA=iBA+1;
            elseif k==28 && iBA>1
                iBA=iBA-1;
            elseif k==31 && jBA<7
                jBA=jBA+1;
            elseif k==30 && jBA>1
                jBA=jBA-1;
            elseif (k==32 && (Water_display(jBA,iBA)~=2 || Water_display(jBA+1,iBA)~=2 || Water_display(jBA+2,iBA)~=2 || Water_display(jBA+3,iBA)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jBA,iBA)==2 && Water_display(jBA+1,jBA)==2 && Water_display(jBA+2,iBA)==2 && Water_display(jBA+3,iBA)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jBA,iBA) = top_ship_sprite;
    Board_display(jBA+1,iBA) = vert_ship_sprite;
    Board_display(jBA+2,iBA) = vert_ship_sprite;
    Board_display(jBA+3,iBA) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end


%--------------------------------------------------------------------------

elseif orientBA=='H' || orientBA=='h'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = left_ship_sprite;
    Board_display(1,2) = horiz_ship_sprite;
    Board_display(1,3) = horiz_ship_sprite;
    Board_display(1,4) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iBA<7
               iBA=iBA+1;
            elseif k==28 && iBA>1
                iBA=iBA-1;
            elseif k==31 && jBA<10
                jBA=jBA+1;
            elseif k==30 && jBA>1
                jBA=jBA-1;
            elseif (k==32 && (Water_display(jBA,iBA)~=2 || Water_display(jBA,iBA+1)~=2 || Water_display(jBA,iBA+2)~=2 || Water_display(jBA,iBA+3)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jBA,iBA)==2 && Water_display(jBA,jBA+1)==2 && Water_display(jBA,iBA+2)==2 && Water_display(jBA,iBA+3)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jBA,iBA) = left_ship_sprite;
    Board_display(jBA,iBA+1) = horiz_ship_sprite;
    Board_display(jBA,iBA+2) = horiz_ship_sprite;
    Board_display(jBA,iBA+3) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

else
    fprintf('Invalid input, defaulting to vertical.\n')
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = vert_ship_sprite;
    Board_display(4,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);
    k=0;
    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iBA<10
               iBA=iBA+1;
            elseif k==28 && iBA>1
                iBA=iBA-1;
            elseif k==31 && jBA<7
                jBA=jBA+1;
            elseif k==30 && jBA>1
                jBA=jBA-1;
            elseif (k==32 && (Water_display(jBA,iBA)~=2 || Water_display(jBA+1,iBA)~=2 || Water_display(jBA+2,iBA)~=2 || Water_display(jBA+3,iBA)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jBA,iBA)==2 && Water_display(jBA+1,jBA)==2 && Water_display(jBA+2,iBA)==2 && Water_display(jBA+3,iBA)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jBA,iBA) = top_ship_sprite;
    Board_display(jBA+1,iBA) = vert_ship_sprite;
    Board_display(jBA+2,iBA) = vert_ship_sprite;
    Board_display(jBA+3,iBA) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end
    
end

%=========================================================================
%=========================================================================

for i1=1:210;
    if Board_display(i1)==1;
        Water_display(i1)=Water_display(i1);
        i1=i1+1;
    elseif Board_display(i1)~=1;
        Water_display(i1)=Board_display(i1);
        i1=i1+1;
    end
end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=2;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)
close
%==========================================================================
%==========================================================================

%movement based starting coords
iCR=1;
jCR=1;
k=0;

%%
%Place the Cruiser instructions

fprintf('You are about to place your CRUISER. \n')
fprintf(['After selecting the orientation of your ship, use the arrow ' ...
    'keys to move your ship around. \n'])
fprintf(['Press the "space" key to place your ship after you move' ...
    ' it to the postition you want it to be in. \n'])
fprintf('\n')

orientCR = input(['Choose your orientation(enter V for vertical, or ' ...
    'H for Horizontal): '],'s');

%move the ship code

if orientCR =='V' || orientCR == 'v'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iCR<10
               iCR=iCR+1;
            elseif k==28 && iCR>1
                iCR=iCR-1;
            elseif k==31 && jCR<8
                jCR=jCR+1;
            elseif k==30 && jCR>1
                jCR=jCR-1;
            elseif (k==32 && (Water_display(jCR,iCR)~=2 || Water_display(jCR+1,iCR)~=2 || Water_display(jCR+2,iCR)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jCR,iCR)==2 && Water_display(jCR+1,jCR)==2 && Water_display(jCR+2,iCR)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jCR,iCR) = top_ship_sprite;
    Board_display(jCR+1,iCR) = vert_ship_sprite;
    Board_display(jCR+2,iCR) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif orientCR =='H' || orientCR == 'h'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = left_ship_sprite;
    Board_display(1,2) = horiz_ship_sprite;
    Board_display(1,3) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iCR<8
               iCR=iCR+1;
            elseif k==28 && iCR>1
                iCR=iCR-1;
            elseif k==31 && jCR<10
                jCR=jCR+1;
            elseif k==30 && jCR>1
                jCR=jCR-1;
            elseif (k==32 && (Water_display(jCR,iCR)~=2 || Water_display(jCR,iCR+1)~=2 || Water_display(jCR,iCR+2)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jCR,iCR)==2 && Water_display(jCR,jCR+1)==2 && Water_display(jCR,iCR+2)==2)
                k=32;

            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jCR,iCR) = left_ship_sprite;
    Board_display(jCR,iCR+1) = horiz_ship_sprite;
    Board_display(jCR,iCR+2) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

else
    fprintf('Invalid input, defaulting to vertical.\n')
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);
    
    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iCR<10
               iCR=iCR+1;
            elseif k==28 && iCR>1
                iCR=iCR-1;
            elseif k==31 && jCR<8
                jCR=jCR+1;
            elseif k==30 && jCR>1
                jCR=jCR-1;
            elseif (k==32 && (Water_display(jCR,iCR)~=2 || Water_display(jCR+1,iCR)~=2 || Water_display(jCR+2,iCR)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jCR,iCR)==2 && Water_display(jCR+1,jCR)==2 && Water_display(jCR+2,iCR)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jCR,iCR) = top_ship_sprite;
    Board_display(jCR+1,iCR) = vert_ship_sprite;
    Board_display(jCR+2,iCR) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

for i1=1:210;
    if Board_display(i1)==1;
        Water_display(i1)=Water_display(i1);
        i1=i1+1;
    elseif Board_display(i1)~=1;
        Water_display(i1)=Board_display(i1);
        i1=i1+1;
    end
end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=3;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)
close
%==========================================================================
%==========================================================================

%movement based starting coords
iSU=1;
jSU=1;
k=0;

%%
%Place the Cruiser instructions

fprintf('You are about to place your SUBMARINE. \n')
fprintf(['After selecting the orientation of your ship, use the arrow ' ...
    'keys to move your ship around. \n'])
fprintf(['Press the "space" key to place your ship after you move' ...
    ' it to the postition you want it to be in. \n'])
fprintf('\n')

orientSU = input(['Choose your orientation(enter V for vertical, or ' ...
    'H for Horizontal): '],'s');

%move the ship code

if orientSU =='V' || orientSU == 'v'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iSU<10
               iSU=iSU+1;
            elseif k==28 && iSU>1
                iSU=iSU-1;
            elseif k==31 && jSU<8
                jSU=jSU+1;
            elseif k==30 && jSU>1
                jSU=jSU-1;
            elseif (k==32 && (Water_display(jSU,iSU)~=2 || Water_display(jSU+1,iSU)~=2 || Water_display(jSU+2,iSU)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jSU,iSU)==2 && Water_display(jSU+1,jSU)==2 && Water_display(jSU+2,iSU)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jSU,iSU) = top_ship_sprite;
    Board_display(jSU+1,iSU) = vert_ship_sprite;
    Board_display(jSU+2,iSU) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif orientSU =='H' || orientSU == 'h'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = left_ship_sprite;
    Board_display(1,2) = horiz_ship_sprite;
    Board_display(1,3) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));
        
            if k==29 && iSU<8
               iSU=iSU+1;
            elseif k==28 && iSU>1
                iSU=iSU-1;
            elseif k==31 && jSU<10
                jSU=jSU+1;
            elseif k==30 && jSU>1
                jSU=jSU-1;
            elseif (k==32 && (Water_display(jSU,iSU)~=2 || Water_display(jSU,iSU+1)~=2 || Water_display(jSU,iSU+2)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jSU,iSU)==2 && Water_display(jSU,jSU+1)==2 && Water_display(jSU,iSU+2)==2)
                k=32;

            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jSU,iSU) = left_ship_sprite;
    Board_display(jSU,iSU+1) = horiz_ship_sprite;
    Board_display(jSU,iSU+2) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

else
    fprintf('Invalid input, defaulting to vertical.\n')
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iSU<10
               iSU=iSU+1;
            elseif k==28 && iSU>1
                iSU=iSU-1;
            elseif k==31 && jSU<8
                jSU=jSU+1;
            elseif k==30 && jSU>1
                jSU=jSU-1;
            elseif (k==32 && (Water_display(jSU,iSU)~=2 || Water_display(jSU+1,iSU)~=2 || Water_display(jSU+2,iSU)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jSU,iSU)==2 && Water_display(jSU+1,jSU)==2 && Water_display(jSU+2,iSU)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jSU,iSU) = top_ship_sprite;
    Board_display(jSU+1,iSU) = vert_ship_sprite;
    Board_display(jSU+2,iSU) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

for i1=1:210;
    if Board_display(i1)==1;
        Water_display(i1)=Water_display(i1);
        i1=i1+1;
    elseif Board_display(i1)~=1;
        Water_display(i1)=Board_display(i1);
        i1=i1+1;
    end
end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=4;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)
close
%==========================================================================
%==========================================================================

%movement based starting coords
iDE=1;
jDE=1;
k=0;

%%
%Place the destroyer instructions

fprintf('You are about to place your DESTROYER. \n')
fprintf(['After selecting the orientation of your ship, use the arrow ' ...
    'keys to move your ship around. \n'])
fprintf(['Press the "space" key to place your ship after you move' ...
    ' it to the postition you want it to be in. \n'])
fprintf('\n')

orientDE = input(['Choose your orientation(enter V for vertical, or ' ...
    'H for Horizontal): '],'s');

%move the ship code

if orientDE =='V' || orientDE == 'v'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iDE<10
               iDE=iDE+1;
            elseif k==28 && iDE>1
                iDE=iDE-1;
            elseif k==31 && jDE<9
                jDE=jDE+1;
            elseif k==30 && jDE>1
                jDE=jDE-1;
            elseif (k==32 && (Water_display(jDE,iDE)~=2 || Water_display(jDE+1,iDE)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jDE,iDE)==2 && Water_display(jDE+1,jDE)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jDE,iDE) = top_ship_sprite;
    Board_display(jDE+1,iDE) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif orientDE=='H' || orientDE=='h'
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = left_ship_sprite;
    Board_display(1,2) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iDE<9
               iDE=iDE+1;
            elseif k==28 && iDE>1
                iDE=iDE-1;
            elseif k==31 && jDE<10
                jDE=jDE+1;
            elseif k==30 && jDE>1
                jDE=jDE-1;
            elseif (k==32 && (Water_display(jDE,iDE)~=2 || Water_display(jDE,iDE+1)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jDE,iDE)==2 && Water_display(jDE,jDE+1)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jDE,iDE) = left_ship_sprite;
    Board_display(jDE,iDE+1) = right_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

else
    fprintf('Invalid input, defaulting to vertical.\n')
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=waitforbuttonpress;
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

        k = double(get(gcf,'CurrentCharacter'));

            if k==29 && iDE<10
               iDE=iDE+1;
            elseif k==28 && iDE>1
                iDE=iDE-1;
            elseif k==31 && jDE<9
                jDE=jDE+1;
            elseif k==30 && jDE>1
                jDE=jDE-1;
            elseif (k==32 && (Water_display(jDE,iDE)~=2 || Water_display(jDE+1,iDE)~=2))
                fprintf('CANNOT PLACE SHIP HERE \n')
                k=0;
            elseif (k==32 && Water_display(jDE,iDE)==2 && Water_display(jDE+1,jDE)==2)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(jDE,iDE) = top_ship_sprite;
    Board_display(jDE+1,iDE) = bot_ship_sprite;
    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

for i1=1:210;
    if Board_display(i1)==1;
        Water_display(i1)=Water_display(i1);
        i1=i1+1;
    elseif Board_display(i1)~=1;
        Water_display(i1)=Board_display(i1);
        i1=i1+1;
    end
end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=5;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)
close

%==========================================================================
%==========================================================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%==========================================================================
%==========================================================================
%AI PLACEMENT!!!

%movement based starting coords
AiCA=randi([12,17]);
AjCA=randi([1,6]);
k=0;


%Place the Carrier instructions

fprintf('Ai is placing Carrier... \n')
fprintf('... \n')
fprintf('... \n')
fprintf('Carrier Placed. \n')
fprintf('\n')

AiorientCA = randi([1,2]);

%move the ship code

if AiorientCA== 1
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = top_ship_sprite;
    Board_display(2,1+11) = vert_ship_sprite;
    Board_display(3,1+11) = vert_ship_sprite;
    Board_display(4,1+11) = vert_ship_sprite;
    Board_display(5,1+11) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiCA<(10+11)
               AiCA=AiCA+1;
            elseif k==28 && AiCA>(1+11)
                AiCA=AiCA-1;
            elseif k==31 && AjCA<(6)
                AjCA=AjCA+1;
            elseif k==30 && AjCA>(1)
                AjCA=AjCA-1;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AjCA,AiCA) = top_ship_sprite;
    Board_display(AjCA+1,AiCA) = vert_ship_sprite;
    Board_display(AjCA+2,AiCA) = vert_ship_sprite;
    Board_display(AjCA+3,AiCA) = vert_ship_sprite;
    Board_display(AjCA+4,AiCA) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif AiorientCA == 2
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = left_ship_sprite;
    Board_display(1,2+11) = horiz_ship_sprite;
    Board_display(1,3+11) = horiz_ship_sprite;
    Board_display(1,4+11) = horiz_ship_sprite;
    Board_display(1,5+11) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiCA<6+11
               AiCA=AiCA+1;
            elseif k==28 && AiCA>1+11
                AiCA=AiCA-1;
            elseif k==31 && AjCA<10
                AjCA=AjCA+1;
            elseif k==30 && AjCA>1
                AjCA=AjCA-1;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AjCA,AiCA) = left_ship_sprite;
    Board_display(AjCA,AiCA+1) = horiz_ship_sprite;
    Board_display(AjCA,AiCA+2) = horiz_ship_sprite;
    Board_display(AjCA,AiCA+3) = horiz_ship_sprite;
    Board_display(AjCA,AiCA+4) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

%for i=1:210;
%    if Board_display(i)==1;
%        Water_display(i)=Water_display(i);
%        i=i+1;
%    elseif Board_display(i)~=1;
%        Water_display(i)=Board_display(i);
%        i=i+1;
%    end
%end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=11;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)

%==========================================================================
%==========================================================================
%movement based starting coords
AiiBA=randi([12,18]);
AijBA=randi([1,7]);
k=0;


%Place the Battleship instructions

fprintf('Ai is placing Battleship... \n')
fprintf('... \n')
fprintf('... \n')
fprintf('Battleship Placed. \n')
fprintf('\n')

AiorientBA = randi([1,2]);

%move the ship code

if AiorientBA== 1
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = top_ship_sprite;
    Board_display(2,1+11) = vert_ship_sprite;
    Board_display(3,1+11) = vert_ship_sprite;
    Board_display(4,1+11) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiBA<(10+11)
               AiiBA=AiiBA+1;
            elseif k==28 && AiiBA>(1+11)
                AiiBA=AiiBA-1;
            elseif k==31 && AijBA<(7)
                AijBA=AijBA+1;
            elseif k==30 && AijBA>(1)
                AijBA=AijBA-1;
            elseif (k==32 && (Ship_positions(AijBA,AiiBA)~=0 || Ship_positions(AijBA+1,AiiBA)~=0 || Ship_positions(AijBA+2,AiiBA)~=0 || Ship_positions(AijBA+3,AiiBA)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijBA,AiiBA)==0 && Ship_positions(AijBA+1,AiiBA)==0 && Ship_positions(AijBA+2,AiiBA)==0 && Ship_positions(AijBA+3,AiiBA)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AijBA,AiiBA) = top_ship_sprite;
    Board_display(AijBA+1,AiiBA) = vert_ship_sprite;
    Board_display(AijBA+2,AiiBA) = vert_ship_sprite;
    Board_display(AijBA+3,AiiBA) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif AiorientBA == 2
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = left_ship_sprite;
    Board_display(1,2+11) = horiz_ship_sprite;
    Board_display(1,3+11) = horiz_ship_sprite;
    Board_display(1,4+11) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiBA<7+11
               AiiBA=AiiBA+1;
            elseif k==28 && AiiBA>1+11
                AiiBA=AiiBA-1;
            elseif k==31 && AijBA<10
                AijBA=AijBA+1;
            elseif k==30 && AijBA>1
                AijBA=AijBA-1;
            elseif (k==32 && (Ship_positions(AijBA,AiiBA)~=0 || Ship_positions(AijBA,AiiBA+1)~=0 || Ship_positions(AijBA,AiiBA+2)~=0 || Ship_positions(AijBA,AiiBA+3)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijBA,AiiBA)==0 && Ship_positions(AijBA,AiiBA+1)==0 && Ship_positions(AijBA,AiiBA+2)==0 && Ship_positions(AijBA,AiiBA+3)==0)
                k=32;

            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AijBA,AiiBA) = left_ship_sprite;
    Board_display(AijBA,AiiBA+1) = horiz_ship_sprite;
    Board_display(AijBA,AiiBA+2) = horiz_ship_sprite;
    Board_display(AijBA,AiiBA+3) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

%for i=1:210;
%    if Board_display(i)==1;
%        Water_display(i)=Water_display(i);
%        i=i+1;
%    elseif Board_display(i)~=1;
%        Water_display(i)=Board_display(i);
%        i=i+1;
%    end
%end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=22;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)

%==========================================================================
%==========================================================================
%movement based starting coords
AiiCR=randi([12,19]);
AijCR=randi([1,8]);
k=0;


%Place the Cruiser instructions

fprintf('Ai is placing Cruiser... \n')
fprintf('... \n')
fprintf('... \n')
fprintf('Cruiser Placed. \n')
fprintf('\n')

AiorientCR = randi([1,2]);

%move the ship code

if AiorientCR== 1
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = top_ship_sprite;
    Board_display(2,1+11) = vert_ship_sprite;
    Board_display(3,1+11) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiCR<(10+11)
               AiiCR=AiiCR+1;
            elseif k==28 && AiiCR>(1+11)
                AiiCR=AiiCR-1;
            elseif k==31 && AijCR<(8)
                AijCR=AijCR+1;
            elseif k==30 && AijCR>(1)
                AijCR=AijCR-1;
            elseif (k==32 && (Ship_positions(AijCR,AiiCR)~=0 || Ship_positions(AijCR+1,AiiCR)~=0 || Ship_positions(AijCR+2,AiiCR)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijCR,AiiCR)==0 && Ship_positions(AijCR+1,AiiCR)==0 && Ship_positions(AijCR+2,AiiCR)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AijCR,AiiCR) = top_ship_sprite;
    Board_display(AijCR+1,AiiCR) = vert_ship_sprite;
    Board_display(AijCR+2,AiiCR) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif AiorientCR == 2
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = left_ship_sprite;
    Board_display(1,2+11) = horiz_ship_sprite;
    Board_display(1,3+11) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiCR<8+11
               AiiCR=AiiCR+1;
            elseif k==28 && AiiCR>1+11
                AiiCR=AiiCR-1;
            elseif k==31 && AijCR<10
                AijCR=AijCR+1;
            elseif k==30 && AijCR>1
                AijCR=AijCR-1;
            elseif (k==32 && (Ship_positions(AijCR,AiiCR)~=0 || Ship_positions(AijCR,AiiCR+1)~=0 || Ship_positions(AijCR,AiiCR+2)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijCR,AiiCR)==0 && Ship_positions(AijCR,AiiCR+1)==0 && Ship_positions(AijCR,AiiCR+2)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AijCR,AiiCR) = left_ship_sprite;
    Board_display(AijCR,AiiCR+1) = horiz_ship_sprite;
    Board_display(AijCR,AiiCR+2) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

%for i=1:210;
%    if Board_display(i)==1;
%        Water_display(i)=Water_display(i);
%        i=i+1;
%    elseif Board_display(i)~=1;
%        Water_display(i)=Board_display(i);
%        i=i+1;
%    end
%end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=33;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)

%==========================================================================
%==========================================================================
%movement based starting coords
AiiSU=randi([12,19]);
AijSU=randi([1,8]);
k=0;


%Place the Submarine instructions

fprintf('Ai is placing Submarine... \n')
fprintf('... \n')
fprintf('... \n')
fprintf('Submarine Placed. \n')
fprintf('\n')

AiorientSU = randi([1,2]);

%move the ship code

if AiorientSU== 1
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = top_ship_sprite;
    Board_display(2,1+11) = vert_ship_sprite;
    Board_display(3,1+11) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiSU<(10+11)
               AiiSU=AiiSU+1;
            elseif k==28 && AiiSU>(1+11)
                AiiSU=AiiSU-1;
            elseif k==31 && AijSU<(8)
                AijSU=AijSU+1;
            elseif k==30 && AijSU>(1)
                AijSU=AijSU-1;
            elseif (k==32 && (Ship_positions(AijSU,AiiSU)~=0 || Ship_positions(AijSU+1,AiiSU)~=0 || Ship_positions(AijSU+2,AiiSU)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijSU,AiiSU)==0 && Ship_positions(AijSU+1,AiiSU)==0 && Ship_positions(AijSU+2,AiiSU)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AijSU,AiiSU) = top_ship_sprite;
    Board_display(AijSU+1,AiiSU) = vert_ship_sprite;
    Board_display(AijSU+2,AiiSU) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif AiorientSU == 2
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = left_ship_sprite;
    Board_display(1,2+11) = horiz_ship_sprite;
    Board_display(1,3+11) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiSU<8+11
               AiiSU=AiiSU+1;
            elseif k==28 && AiiSU>1+11
                AiiSU=AiiSU-1;
            elseif k==31 && AijSU<10
                AijSU=AijSU+1;
            elseif k==30 && AijSU>1
                AijSU=AijSU-1;
            elseif (k==32 && (Ship_positions(AijSU,AiiSU)~=0 || Ship_positions(AijSU,AiiSU+1)~=0 || Ship_positions(AijSU,AiiSU+2)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijSU,AiiSU)==0 && Ship_positions(AijSU,AiiSU+1)==0 && Ship_positions(AijSU,AiiSU+2)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AijSU,AiiSU) = left_ship_sprite;
    Board_display(AijSU,AiiSU+1) = horiz_ship_sprite;
    Board_display(AijSU,AiiSU+2) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

%for i=1:210;
%    if Board_display(i)==1;
%        Water_display(i)=Water_display(i);
%        i=i+1;
%    elseif Board_display(i)~=1;
%        Water_display(i)=Board_display(i);
%        i=i+1;
%    end
%end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=44;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)

%==========================================================================
%==========================================================================
%movement based starting coords
AiiDE=randi([12,20]);
AijDE=randi([1,9]);
k=0;


%Place the Destroyer instructions

fprintf('Ai is placing Destroyer... \n')
fprintf('... \n')
fprintf('... \n')
fprintf('Destroyer Placed. \n')
fprintf('\n')

AiorientDE = randi([1,2]);

%move the ship code

if AiorientDE== 1
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = top_ship_sprite;
    Board_display(2,1+11) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiDE<(10+11)
               AiiDE=AiiDE+1;
            elseif k==28 && AiiDE>(1+11)
                AiiDE=AiiDE-1;
            elseif k==31 && AijDE<(9)
                AijDE=AijDE+1;
            elseif k==30 && AijDE>(1)
                AijDE=AijDE-1;
            elseif (k==32 && (Ship_positions(AijDE,AiiDE)~=0 || Ship_positions(AijDE+1,AiiDE)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijDE,AiiDE)==0 && Ship_positions(AijDE+1,AiiDE)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AijDE,AiiDE) = top_ship_sprite;
    Board_display(AijDE+1,AiiDE) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif AiorientDE == 2
    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(1,1+11) = left_ship_sprite;
    Board_display(1,2+11) = right_ship_sprite;
    %drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiDE<9+11
               AiiDE=AiiDE+1;
            elseif k==28 && AiiDE>1+11
                AiiDE=AiiDE-1;
            elseif k==31 && AijDE<10
                AijDE=AijDE+1;
            elseif k==30 && AijDE>1
                AijDE=AijDE-1;
            elseif (k==32 && (Ship_positions(AijDE,AiiDE)~=0 || Ship_positions(AijDE,AiiDE+1)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijDE,AiiDE)==0 && Ship_positions(AijDE,AiiDE+1)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,21);
    Board_display(:,11) = blank_sprite;
    Board_display(AijDE,AiiDE) = left_ship_sprite;
    Board_display(AijDE,AiiDE+1) = right_ship_sprite;
    %drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

%for i=1:210;
%    if Board_display(i)==1;
%        Water_display(i)=Water_display(i);
%        i=i+1;
%    elseif Board_display(i)~=1;
%        Water_display(i)=Board_display(i);
%        i=i+1;
%    end
%end

for i=1:210;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=55;
        i=i+1;
    end
end
Water_display(:,11) = blank_sprite;
drawScene(my_scene,Water_display)

%==========================================================================
%==========================================================================
Debugdisplay=zeros(10,21);
for i=1:210;
    Debugdisplay(i)=Ship_positions(i);
end
%% later the Ai ship's display will need to be taken out of view, deleting
%% all the drawscene functions on the Ai placement code should resolve the
%% issue, hopefully.
fprintf('click on the board where you want to shoot. You get three shots in a row. \n After your three shots, the AI can shoot 3 times. In this game mode it is possible to tie the AI.')

H=0;

while game_status == 0

    fprintf('\n Make your move \n')
    z=0;
    while z==0
        z=1;
        [r,c] = getMouseInput(my_scene);

        if Ship_positions(r,c) == 0 && 0<r && r<11 && 11<c && c<22 
            hit_miss_display(r,c) = miss_sprite;
            Ship_positions(r,c) = 9;

        elseif Ship_positions(r,c)~=0 && 0<r && r<11 && 11<c && c<22 && Ship_positions(r,c)~=9
            hit_miss_display(r,c) = hit_sprite;

            if Ship_positions(r,c)==11
                AiCarrier_health=AiCarrier_health-1;
            elseif Ship_positions(r,c)==22
                AiBattleship_health=AiBattleship_health-1;
            elseif Ship_positions(r,c)==33
                AiCruiser_health=AiCruiser_health-1;
            elseif Ship_positions(r,c)==44
                AiSubmarine_health=AiSubmarine_health-1;
            elseif Ship_positions(r,c)==55
                AiDestroyer_health=AiDestroyer_health-1;
            end

            Ship_positions(r,c) = 9;

        elseif (Ship_positions(r,c))==9
                fprintf('\n You already shot in that square! \n')
                z=0;
                
        else
            z=0;
        end
    end

    if AiCarrier_health == 0
        fprintf('\n You sank the Carrier!')
        AiCarrier_health = -1;
    elseif AiBattleship_health == 0
        fprintf('\n You sank the Battleship!')
        AiBattleship_health = -1;
    elseif AiCruiser_health == 0
        fprintf('\n You sank the Cruiser!')
        AiCruiser_health = -1;
    elseif AiSubmarine_health == 0
        fprintf('\n You sank the Submarine!')
        AiSubmarine_health = -1;
    elseif AiDestroyer_health == 0
        fprintf('\n You sank the Destroyer!')
        AiDestroyer_health = -1;
    end

    drawScene(my_scene,Water_display,hit_miss_display)
    z=0;
    while z==0
        z=1;
        [r,c] = getMouseInput(my_scene);

        if Ship_positions(r,c) == 0 && 0<r && r<11 && 11<c && c<22 
            hit_miss_display(r,c) = miss_sprite;
            Ship_positions(r,c) = 9;

        elseif Ship_positions(r,c)~=0 && 0<r && r<11 && 11<c && c<22 && Ship_positions(r,c)~=9
            hit_miss_display(r,c) = hit_sprite;

            if Ship_positions(r,c)==11
                AiCarrier_health=AiCarrier_health-1;
            elseif Ship_positions(r,c)==22
                AiBattleship_health=AiBattleship_health-1;
            elseif Ship_positions(r,c)==33
                AiCruiser_health=AiCruiser_health-1;
            elseif Ship_positions(r,c)==44
                AiSubmarine_health=AiSubmarine_health-1;
            elseif Ship_positions(r,c)==55
                AiDestroyer_health=AiDestroyer_health-1;
            end

            Ship_positions(r,c) = 9;

        elseif (Ship_positions(r,c))==9
                fprintf('\n You already shot in that square! \n')
                z=0;
                
        else
            z=0;
        end
    end

    if AiCarrier_health == 0
        fprintf('\n You sank the Carrier!')
        AiCarrier_health = -1;
    elseif AiBattleship_health == 0
        fprintf('\n You sank the Battleship!')
        AiBattleship_health = -1;
    elseif AiCruiser_health == 0
        fprintf('\n You sank the Cruiser!')
        AiCruiser_health = -1;
    elseif AiSubmarine_health == 0
        fprintf('\n You sank the Submarine!')
        AiSubmarine_health = -1;
    elseif AiDestroyer_health == 0
        fprintf('\n You sank the Destroyer!')
        AiDestroyer_health = -1;
    end

    drawScene(my_scene,Water_display,hit_miss_display)
    z=0;
    while z==0
        z=1;
        [r,c] = getMouseInput(my_scene);

        if Ship_positions(r,c) == 0 && 0<r && r<11 && 11<c && c<22 
            hit_miss_display(r,c) = miss_sprite;
            Ship_positions(r,c) = 9;

        elseif Ship_positions(r,c)~=0 && 0<r && r<11 && 11<c && c<22 && Ship_positions(r,c)~=9
            hit_miss_display(r,c) = hit_sprite;

            if Ship_positions(r,c)==11
                AiCarrier_health=AiCarrier_health-1;
            elseif Ship_positions(r,c)==22
                AiBattleship_health=AiBattleship_health-1;
            elseif Ship_positions(r,c)==33
                AiCruiser_health=AiCruiser_health-1;
            elseif Ship_positions(r,c)==44
                AiSubmarine_health=AiSubmarine_health-1;
            elseif Ship_positions(r,c)==55
                AiDestroyer_health=AiDestroyer_health-1;
            end

            Ship_positions(r,c) = 9;

        elseif (Ship_positions(r,c))==9
                fprintf('\n You already shot in that square! \n')
                z=0;
                
        else
            z=0;
        end
    end

    if AiCarrier_health == 0
        fprintf('\n You sank the Carrier!')
        AiCarrier_health = -1;
    elseif AiBattleship_health == 0
        fprintf('\n You sank the Battleship!')
        AiBattleship_health = -1;
    elseif AiCruiser_health == 0
        fprintf('\n You sank the Cruiser!')
        AiCruiser_health = -1;
    elseif AiSubmarine_health == 0
        fprintf('\n You sank the Submarine!')
        AiSubmarine_health = -1;
    elseif AiDestroyer_health == 0
        fprintf('\n You sank the Destroyer!')
        AiDestroyer_health = -1;
    end

    drawScene(my_scene,Water_display,hit_miss_display)
%--------------------------------------------------------------------------
   %AI's turn to play
   fprintf('\n AI is thinking...\n')
   pause(.33)
   fprintf('\n still thinking... \n')
   pause(.33)
    z=0;
    while z==0
        z=1;
        r = randi([1,10]);
        c = randi([1,10]);

        if H==1
            r=r1;
            c=c2;
            H=0;
        elseif H==2
            r=r2;
            c=c1;
            H=0;
        end

        if Ship_positions(r,c) == 0 && 0<r && r<11 && 0<c && c<11
            hit_miss_display(r,c) = miss_sprite;
            Ship_positions(r,c) = 9;

        elseif Ship_positions(r,c)~=0 && Ship_positions(r,c)~=9
            hit_miss_display(r,c) = hit_sprite;
            H=randi([1,2]);
            r2=r;
            c2=c;
            if r>1 && r<10 && c>1 && c<10
            r1=r+randi([-1,1]);
            c1=c+randi([-1,1]);
            else
            r1 = randi([1,10]);
            c1 = randi([1,10]);
            end

            if Ship_positions(r,c)==1
                Player_Carrier_health=Player_Carrier_health-1;
            elseif Ship_positions(r,c)==2
                Player_Battleship_health=Player_Battleship_health-1;
            elseif Ship_positions(r,c)==3
                Player_Cruiser_health=Player_Cruiser_health-1;
            elseif Ship_positions(r,c)==4
                Player_Submarine_health=Player_Submarine_health-1;
            elseif Ship_positions(r,c)==5
                Player_Destroyer_health=Player_Destroyer_health-1;
            end

            Ship_positions(r,c) = 9;
         
        elseif (Ship_positions(r,c))==9
                z=0;

        else
            z=0;
        end
    end
    
    if Player_Carrier_health == 0
        Player_Carrier_health = -1;
    elseif Player_Battleship_health == 0
        Player_Battleship_health = -1;
    elseif Player_Cruiser_health == 0
        Player_Cruiser_health = -1;
    elseif Player_Submarine_health == 0
        Player_Submarine_health = -1;
    elseif Player_Destroyer_health == 0
        Player_Destroyer_health = -1;
    end

    drawScene(my_scene,Water_display,hit_miss_display)
    pause(.33)
    z=0;
    while z==0
        z=1;
        r = randi([1,10]);
        c = randi([1,10]);

        if H==1
            r=r1;
            c=c2;
            H=0;
        elseif H==2
            r=r2;
            c=c1;
            H=0;
        end

        if Ship_positions(r,c) == 0 && 0<r && r<11 && 0<c && c<11
            hit_miss_display(r,c) = miss_sprite;
            Ship_positions(r,c) = 9;

        elseif Ship_positions(r,c)~=0 && Ship_positions(r,c)~=9
            hit_miss_display(r,c) = hit_sprite;
            H=randi([1,2]);
            r2=r;
            c2=c;
            if r>1 && r<10 && c>1 && c<10
            r1=r+randi([-1,1]);
            c1=c+randi([-1,1]);
            else
            r1 = randi([1,10]);
            c1 = randi([1,10]);
            end

            if Ship_positions(r,c)==1
                Player_Carrier_health=Player_Carrier_health-1;
            elseif Ship_positions(r,c)==2
                Player_Battleship_health=Player_Battleship_health-1;
            elseif Ship_positions(r,c)==3
                Player_Cruiser_health=Player_Cruiser_health-1;
            elseif Ship_positions(r,c)==4
                Player_Submarine_health=Player_Submarine_health-1;
            elseif Ship_positions(r,c)==5
                Player_Destroyer_health=Player_Destroyer_health-1;
            end

            Ship_positions(r,c) = 9;
         
        elseif (Ship_positions(r,c))==9
                z=0;

        else
            z=0;
        end
    end
    
    if Player_Carrier_health == 0
        Player_Carrier_health = -1;
    elseif Player_Battleship_health == 0
        Player_Battleship_health = -1;
    elseif Player_Cruiser_health == 0
        Player_Cruiser_health = -1;
    elseif Player_Submarine_health == 0
        Player_Submarine_health = -1;
    elseif Player_Destroyer_health == 0
        Player_Destroyer_health = -1;
    end

    drawScene(my_scene,Water_display,hit_miss_display)
   pause(.33)
    z=0;
    while z==0
        z=1;
        r = randi([1,10]);
        c = randi([1,10]);

        if H==1
            r=r1;
            c=c2;
            H=0;
        elseif H==2
            r=r2;
            c=c1;
            H=0;
        end

        if Ship_positions(r,c) == 0 && 0<r && r<11 && 0<c && c<11
            hit_miss_display(r,c) = miss_sprite;
            Ship_positions(r,c) = 9;

        elseif Ship_positions(r,c)~=0 && Ship_positions(r,c)~=9
            hit_miss_display(r,c) = hit_sprite;
            H=randi([1,2]);
            r2=r;
            c2=c;
            if r>1 && r<10 && c>1 && c<10
            r1=r+randi([-1,1]);
            c1=c+randi([-1,1]);
            else
            r1 = randi([1,10]);
            c1 = randi([1,10]);
            end

            if Ship_positions(r,c)==1
                Player_Carrier_health=Player_Carrier_health-1;
            elseif Ship_positions(r,c)==2
                Player_Battleship_health=Player_Battleship_health-1;
            elseif Ship_positions(r,c)==3
                Player_Cruiser_health=Player_Cruiser_health-1;
            elseif Ship_positions(r,c)==4
                Player_Submarine_health=Player_Submarine_health-1;
            elseif Ship_positions(r,c)==5
                Player_Destroyer_health=Player_Destroyer_health-1;
            end

            Ship_positions(r,c) = 9;
         
        elseif (Ship_positions(r,c))==9
                z=0;

        else
            z=0;
        end
    end
    
    if Player_Carrier_health == 0
        Player_Carrier_health = -1;
    elseif Player_Battleship_health == 0
        Player_Battleship_health = -1;
    elseif Player_Cruiser_health == 0
        Player_Cruiser_health = -1;
    elseif Player_Submarine_health == 0
        Player_Submarine_health = -1;
    elseif Player_Destroyer_health == 0
        Player_Destroyer_health = -1;
    end

    drawScene(my_scene,Water_display,hit_miss_display)
    % Win Condition Code Goes here:
    if AiCarrier_health == -1 && AiBattleship_health == -1 && AiCruiser_health == -1 && AiSubmarine_health == -1 && AiDestroyer_health == -1 && Player_Carrier_health == -1 && Player_Battleship_health == -1 && Player_Cruiser_health == -1 && Player_Submarine_health == -1 && Player_Destroyer_health == -1
        fprintf('\n Oh.. I guess we tied? Truce shall we say?')
        game_status=1;
        close
    elseif Player_Carrier_health == -1 && Player_Battleship_health == -1 && Player_Cruiser_health == -1 && Player_Submarine_health == -1 && Player_Destroyer_health == -1
        fprintf(['\n You lost! Practice the art of battleship for another ' ...
        '1,000 years before you challenge me again'])
        game_status=1;
        close
    elseif AiCarrier_health == -1 && AiBattleship_health == -1 && AiCruiser_health == -1 && AiSubmarine_health == -1 && AiDestroyer_health == -1 
        fprintf('\n Congrats Player! you beat the computer!')
        game_status=1;
        close
    end

end

elseif func==3

fprintf(' TIMED MODE \n')
fprintf('After  the countdown, race against the clock to beat the game in as fast of a time as possible!')
pause(5)
% Initialize scene
my_scene = simpleGameEngine('Battleship(test).png',84,84);

% Set up variables to name the various sprites
blank_sprite = 1;
water_sprite = 2;
left_ship_sprite = 3;
horiz_ship_sprite = 4;
right_ship_sprite = 5;
top_ship_sprite = 6;
vert_ship_sprite = 7;
bot_ship_sprite = 8;
hit_sprite = 9;
miss_sprite = 10;

%Set up Background
Water_display = blank_sprite * ones(10,10).*2;

%Set up info grids
Ship_positions = zeros(10,10);

%Set up game logic variables
hit_miss_display = ones(10,10);

game_status = 0;

AiCarrier_health = 5;
AiBattleship_health = 4;
AiCruiser_health = 3;
AiSubmarine_health = 3;
AiDestroyer_health = 2;

%AI PLACEMENT!!!

%movement based starting coords
AiCA=randi([1,6]);
AjCA=randi([1,6]);
k=0;


%Place the Carrier instructions

fprintf('Ai is placing Carrier... \n')
fprintf('... \n')
fprintf('... \n')
fprintf('Carrier Placed. \n')
fprintf('\n')

AiorientCA = randi([1,2]);

%move the ship code

if AiorientCA== 1
    Board_display = blank_sprite * ones(10,10);
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = vert_ship_sprite;
    Board_display(4,1) = vert_ship_sprite;
    Board_display(5,1) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiCA<(10)
               AiCA=AiCA+1;
            elseif k==28 && AiCA>(1)
                AiCA=AiCA-1;
            elseif k==31 && AjCA<(6)
                AjCA=AjCA+1;
            elseif k==30 && AjCA>(1)
                AjCA=AjCA-1;
            end

    Board_display = blank_sprite * ones(10,10);
    Board_display(AjCA,AiCA) = top_ship_sprite;
    Board_display(AjCA+1,AiCA) = vert_ship_sprite;
    Board_display(AjCA+2,AiCA) = vert_ship_sprite;
    Board_display(AjCA+3,AiCA) = vert_ship_sprite;
    Board_display(AjCA+4,AiCA) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif AiorientCA == 2
    Board_display = blank_sprite * ones(10,10);
    Board_display(1,1) = left_ship_sprite;
    Board_display(1,2) = horiz_ship_sprite;
    Board_display(1,3) = horiz_ship_sprite;
    Board_display(1,4) = horiz_ship_sprite;
    Board_display(1,5) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiCA<6
               AiCA=AiCA+1;
            elseif k==28 && AiCA>1
                AiCA=AiCA-1;
            elseif k==31 && AjCA<10
                AjCA=AjCA+1;
            elseif k==30 && AjCA>1
                AjCA=AjCA-1;
            end

    Board_display = blank_sprite * ones(10,10);
    Board_display(AjCA,AiCA) = left_ship_sprite;
    Board_display(AjCA,AiCA+1) = horiz_ship_sprite;
    Board_display(AjCA,AiCA+2) = horiz_ship_sprite;
    Board_display(AjCA,AiCA+3) = horiz_ship_sprite;
    Board_display(AjCA,AiCA+4) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

%for i=1:210;
%    if Board_display(i)==1;
%        Water_display(i)=Water_display(i);
%        i=i+1;
%    elseif Board_display(i)~=1;
%        Water_display(i)=Board_display(i);
%        i=i+1;
%    end
%end

for i=1:100;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=11;
        i=i+1;
    end
end
drawScene(my_scene,Water_display)

%==========================================================================
%==========================================================================
%movement based starting coords
AiiBA=randi([1,7]);
AijBA=randi([1,7]);
k=0;


%Place the Battleship instructions

fprintf('Ai is placing Battleship... \n')
fprintf('... \n')
fprintf('... \n')
fprintf('Battleship Placed. \n')
fprintf('\n')

AiorientBA = randi([1,2]);

%move the ship code

if AiorientBA== 1
    Board_display = blank_sprite * ones(10,10);
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = vert_ship_sprite;
    Board_display(4,1) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiBA<(10)
               AiiBA=AiiBA+1;
            elseif k==28 && AiiBA>(1)
                AiiBA=AiiBA-1;
            elseif k==31 && AijBA<(7)
                AijBA=AijBA+1;
            elseif k==30 && AijBA>(1)
                AijBA=AijBA-1;
            elseif (k==32 && (Ship_positions(AijBA,AiiBA)~=0 || Ship_positions(AijBA+1,AiiBA)~=0 || Ship_positions(AijBA+2,AiiBA)~=0 || Ship_positions(AijBA+3,AiiBA)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijBA,AiiBA)==0 && Ship_positions(AijBA+1,AiiBA)==0 && Ship_positions(AijBA+2,AiiBA)==0 && Ship_positions(AijBA+3,AiiBA)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,10);
    Board_display(AijBA,AiiBA) = top_ship_sprite;
    Board_display(AijBA+1,AiiBA) = vert_ship_sprite;
    Board_display(AijBA+2,AiiBA) = vert_ship_sprite;
    Board_display(AijBA+3,AiiBA) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif AiorientBA == 2
    Board_display = blank_sprite * ones(10,21);
    Board_display(1,1) = left_ship_sprite;
    Board_display(1,2) = horiz_ship_sprite;
    Board_display(1,3) = horiz_ship_sprite;
    Board_display(1,4) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiBA<7
               AiiBA=AiiBA+1;
            elseif k==28 && AiiBA>1
                AiiBA=AiiBA-1;
            elseif k==31 && AijBA<10
                AijBA=AijBA+1;
            elseif k==30 && AijBA>1
                AijBA=AijBA-1;
            elseif (k==32 && (Ship_positions(AijBA,AiiBA)~=0 || Ship_positions(AijBA,AiiBA+1)~=0 || Ship_positions(AijBA,AiiBA+2)~=0 || Ship_positions(AijBA,AiiBA+3)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijBA,AiiBA)==0 && Ship_positions(AijBA,AiiBA+1)==0 && Ship_positions(AijBA,AiiBA+2)==0 && Ship_positions(AijBA,AiiBA+3)==0)
                k=32;

            end

    Board_display = blank_sprite * ones(10,10);
    Board_display(AijBA,AiiBA) = left_ship_sprite;
    Board_display(AijBA,AiiBA+1) = horiz_ship_sprite;
    Board_display(AijBA,AiiBA+2) = horiz_ship_sprite;
    Board_display(AijBA,AiiBA+3) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

%for i=1:210;
%    if Board_display(i)==1;
%        Water_display(i)=Water_display(i);
%        i=i+1;
%    elseif Board_display(i)~=1;
%        Water_display(i)=Board_display(i);
%        i=i+1;
%    end
%end

for i=1:100;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=22;
        i=i+1;
    end
end
drawScene(my_scene,Water_display)

%==========================================================================
%==========================================================================
%movement based starting coords
AiiCR=randi([1,8]);
AijCR=randi([1,8]);
k=0;


%Place the Cruiser instructions

fprintf('Ai is placing Cruiser... \n')
fprintf('... \n')
fprintf('... \n')
fprintf('Cruiser Placed. \n')
fprintf('\n')

AiorientCR = randi([1,2]);

%move the ship code

if AiorientCR== 1
    Board_display = blank_sprite * ones(10,10);
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = vert_ship_sprite;
    Board_display(3,1) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiCR<(10)
               AiiCR=AiiCR+1;
            elseif k==28 && AiiCR>(1)
                AiiCR=AiiCR-1;
            elseif k==31 && AijCR<(8)
                AijCR=AijCR+1;
            elseif k==30 && AijCR>(1)
                AijCR=AijCR-1;
            elseif (k==32 && (Ship_positions(AijCR,AiiCR)~=0 || Ship_positions(AijCR+1,AiiCR)~=0 || Ship_positions(AijCR+2,AiiCR)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijCR,AiiCR)==0 && Ship_positions(AijCR+1,AiiCR)==0 && Ship_positions(AijCR+2,AiiCR)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,10);
    Board_display(AijCR,AiiCR) = top_ship_sprite;
    Board_display(AijCR+1,AiiCR) = vert_ship_sprite;
    Board_display(AijCR+2,AiiCR) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif AiorientCR == 2
    Board_display = blank_sprite * ones(10,10);
    Board_display(1,1) = left_ship_sprite;
    Board_display(1,2) = horiz_ship_sprite;
    Board_display(1,3) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiCR<8
               AiiCR=AiiCR+1;
            elseif k==28 && AiiCR>1
                AiiCR=AiiCR-1;
            elseif k==31 && AijCR<10
                AijCR=AijCR+1;
            elseif k==30 && AijCR>1
                AijCR=AijCR-1;
            elseif (k==32 && (Ship_positions(AijCR,AiiCR)~=0 || Ship_positions(AijCR,AiiCR+1)~=0 || Ship_positions(AijCR,AiiCR+2)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijCR,AiiCR)==0 && Ship_positions(AijCR,AiiCR+1)==0 && Ship_positions(AijCR,AiiCR+2)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,10);
    Board_display(AijCR,AiiCR) = left_ship_sprite;
    Board_display(AijCR,AiiCR+1) = horiz_ship_sprite;
    Board_display(AijCR,AiiCR+2) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

%for i=1:210;
%    if Board_display(i)==1;
%        Water_display(i)=Water_display(i);
%        i=i+1;
%    elseif Board_display(i)~=1;
%        Water_display(i)=Board_display(i);
%        i=i+1;
%    end
%end

for i=1:100;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=33;
        i=i+1;
    end
end
drawScene(my_scene,Water_display)

%==========================================================================
%==========================================================================
%movement based starting coords
AiiSU=randi([1,8]);
AijSU=randi([1,8]);
k=0;


%Place the Submarine instructions

fprintf('Ai is placing Submarine... \n')
fprintf('... \n')
fprintf('... \n')
fprintf('Submarine Placed. \n')
fprintf('\n')

AiorientSU = randi([1,2]);

%move the ship code

if AiorientSU== 1
    Board_display = blank_sprite * ones(10,10);
    Board_display(1,1+11) = top_ship_sprite;
    Board_display(2,1+11) = vert_ship_sprite;
    Board_display(3,1+11) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiSU<(10)
               AiiSU=AiiSU+1;
            elseif k==28 && AiiSU>(1)
                AiiSU=AiiSU-1;
            elseif k==31 && AijSU<(8)
                AijSU=AijSU+1;
            elseif k==30 && AijSU>(1)
                AijSU=AijSU-1;
            elseif (k==32 && (Ship_positions(AijSU,AiiSU)~=0 || Ship_positions(AijSU+1,AiiSU)~=0 || Ship_positions(AijSU+2,AiiSU)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijSU,AiiSU)==0 && Ship_positions(AijSU+1,AiiSU)==0 && Ship_positions(AijSU+2,AiiSU)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,10);
    Board_display(AijSU,AiiSU) = top_ship_sprite;
    Board_display(AijSU+1,AiiSU) = vert_ship_sprite;
    Board_display(AijSU+2,AiiSU) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif AiorientSU == 2
    Board_display = blank_sprite * ones(10,10);
    Board_display(1,1) = left_ship_sprite;
    Board_display(1,2) = horiz_ship_sprite;
    Board_display(1,3) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiSU<8
               AiiSU=AiiSU+1;
            elseif k==28 && AiiSU>1
                AiiSU=AiiSU-1;
            elseif k==31 && AijSU<10
                AijSU=AijSU+1;
            elseif k==30 && AijSU>1
                AijSU=AijSU-1;
            elseif (k==32 && (Ship_positions(AijSU,AiiSU)~=0 || Ship_positions(AijSU,AiiSU+1)~=0 || Ship_positions(AijSU,AiiSU+2)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijSU,AiiSU)==0 && Ship_positions(AijSU,AiiSU+1)==0 && Ship_positions(AijSU,AiiSU+2)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,10);
    Board_display(AijSU,AiiSU) = left_ship_sprite;
    Board_display(AijSU,AiiSU+1) = horiz_ship_sprite;
    Board_display(AijSU,AiiSU+2) = right_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

%for i=1:210;
%    if Board_display(i)==1;
%        Water_display(i)=Water_display(i);
%        i=i+1;
%    elseif Board_display(i)~=1;
%        Water_display(i)=Board_display(i);
%        i=i+1;
%    end
%end

for i=1:100;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=44;
        i=i+1;
    end
end
drawScene(my_scene,Water_display)

%==========================================================================
%==========================================================================
%movement based starting coords
AiiDE=randi([1,9]);
AijDE=randi([1,9]);
k=0;


%Place the Destroyer instructions

fprintf('Ai is placing Destroyer... \n')
fprintf('... \n')
fprintf('... \n')
fprintf('Destroyer Placed. \n')
fprintf('\n')

AiorientDE = randi([1,2]);

%move the ship code

if AiorientDE== 1
    Board_display = blank_sprite * ones(10,10);
    Board_display(1,1) = top_ship_sprite;
    Board_display(2,1) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiDE<(10)
               AiiDE=AiiDE+1;
            elseif k==28 && AiiDE>(1)
                AiiDE=AiiDE-1;
            elseif k==31 && AijDE<(9)
                AijDE=AijDE+1;
            elseif k==30 && AijDE>(1)
                AijDE=AijDE-1;
            elseif (k==32 && (Ship_positions(AijDE,AiiDE)~=0 || Ship_positions(AijDE+1,AiiDE)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijDE,AiiDE)==0 && Ship_positions(AijDE+1,AiiDE)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,10);
    Board_display(AijDE,AiiDE) = top_ship_sprite;
    Board_display(AijDE+1,AiiDE) = bot_ship_sprite;
%    drawScene(my_scene,Water_display,Board_display)
    end

%--------------------------------------------------------------------------

elseif AiorientDE == 2
    Board_display = blank_sprite * ones(10,10);
    Board_display(1,1+11) = left_ship_sprite;
    Board_display(1,2+11) = right_ship_sprite;
    %drawScene(my_scene,Water_display,Board_display);

    while k~=32
        k=randi([28, 32]);
        % 28 - leftarrow
        % 29 - rightarrow
        % 30 - uparrow
        % 31 - downarrow
        % 32 - space(we will use this for confirmation to place)

            if k==29 && AiiDE<9
               AiiDE=AiiDE+1;
            elseif k==28 && AiiDE>1
                AiiDE=AiiDE-1;
            elseif k==31 && AijDE<10
                AijDE=AijDE+1;
            elseif k==30 && AijDE>1
                AijDE=AijDE-1;
            elseif (k==32 && (Ship_positions(AijDE,AiiDE)~=0 || Ship_positions(AijDE,AiiDE+1)~=0))
                k=0;
            elseif (k==32 && Ship_positions(AijDE,AiiDE)==0 && Ship_positions(AijDE,AiiDE+1)==0)
                k=32;
            end

    Board_display = blank_sprite * ones(10,10);
    Board_display(AijDE,AiiDE) = left_ship_sprite;
    Board_display(AijDE,AiiDE+1) = right_ship_sprite;
    %drawScene(my_scene,Water_display,Board_display)
    end

end

%=========================================================================
%=========================================================================

%for i=1:210;
%    if Board_display(i)==1;
%        Water_display(i)=Water_display(i);
%        i=i+1;
%    elseif Board_display(i)~=1;
%        Water_display(i)=Board_display(i);
%        i=i+1;
%    end
%end

for i=1:100;
    if Board_display(i)==1;
        Ship_positions(i)=Ship_positions(i);
        i=i+1;
    elseif Board_display(i)~=1;
        Ship_positions(i)=55;
        i=i+1;
    end
end
drawScene(my_scene,Water_display)

%==========================================================================
%==========================================================================
Debugdisplay=zeros(10,10);
for i=1:100;
    Debugdisplay(i)=Ship_positions(i);
end
%% later the Ai ship's display will need to be taken out of view, deleting
%% all the drawscene functions on the Ai placement code should resolve the
%% issue, hopefully.

title('GET READY IN:')
pause(0.5)
title('3!')
pause(0.5)
title('2!')
pause(0.5)
title('1!')
pause(0.5)
title('GO!')

tic

H=0;

while game_status == 0

    z=0;
    while z==0
        z=1;
        [r,c] = getMouseInput(my_scene);

        if Ship_positions(r,c) == 0 && 0<r && r<11 && 0<c && c<11 
            hit_miss_display(r,c) = miss_sprite;
            Ship_positions(r,c) = 9;

        elseif Ship_positions(r,c)~=0 && 0<r && r<11 && 0<c && c<11 && Ship_positions(r,c)~=9
            hit_miss_display(r,c) = hit_sprite;

            if Ship_positions(r,c)==11
                AiCarrier_health=AiCarrier_health-1;
            elseif Ship_positions(r,c)==22
                AiBattleship_health=AiBattleship_health-1;
            elseif Ship_positions(r,c)==33
                AiCruiser_health=AiCruiser_health-1;
            elseif Ship_positions(r,c)==44
                AiSubmarine_health=AiSubmarine_health-1;
            elseif Ship_positions(r,c)==55
                AiDestroyer_health=AiDestroyer_health-1;
            end

            Ship_positions(r,c) = 9;

        elseif (Ship_positions(r,c))==9
                fprintf('\n You already shot in that square! \n')
                z=0;
                
        else
            z=0;
        end
    end

    if AiCarrier_health == 0
        fprintf('\n You sank the Carrier!')
        AiCarrier_health = -1;
    elseif AiBattleship_health == 0
        fprintf('\n You sank the Battleship!')
        AiBattleship_health = -1;
    elseif AiCruiser_health == 0
        fprintf('\n You sank the Cruiser!')
        AiCruiser_health = -1;
    elseif AiSubmarine_health == 0
        fprintf('\n You sank the Submarine!')
        AiSubmarine_health = -1;
    elseif AiDestroyer_health == 0
        fprintf('\n You sank the Destroyer!')
        AiDestroyer_health = -1;
    end

    drawScene(my_scene,Water_display,hit_miss_display)

%--------------------------------------------------------------------------
    
    drawScene(my_scene,Water_display,hit_miss_display)

    % Win Condition Code Goes here:
    if AiCarrier_health == -1 && AiBattleship_health == -1 && AiCruiser_health == -1 && AiSubmarine_health == -1 && AiDestroyer_health == -1
        W=toc;
        fprintf('\n Congrats Player! Your time was: %.3f seconds!',W)
        game_status=1;
        close
    end
end
end
loop =0;
end
