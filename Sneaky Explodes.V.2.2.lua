--[[
 _________  ___  ___  ________  ________   ___  __             ___    ___ ________  ___  ___          ________  ___  _____ ______   ___  ___  ________  ___  ___                       
|\___   ___\\  \|\  \|\   __  \|\   ___  \|\  \|\  \          |\  \  /  /|\   __  \|\  \|\  \        |\   __  \|\  \|\   _ \  _   \|\  \|\  \|\   __  \|\  \|\  \                      
\|___ \  \_\ \  \\\  \ \  \|\  \ \  \\ \  \ \  \/  /|_        \ \  \/  / | \  \|\  \ \  \\\  \       \ \  \|\  \ \  \ \  \\\__\ \  \ \  \\\  \ \  \|\  \ \  \\\  \                     
     \ \  \ \ \   __  \ \   __  \ \  \\ \  \ \   ___  \        \ \    / / \ \  \\\  \ \  \\\  \       \ \   _  _\ \  \ \  \\|__| \  \ \  \\\  \ \   _  _\ \  \\\  \                    
      \ \  \ \ \  \ \  \ \  \ \  \ \  \\ \  \ \  \\ \  \        \/  /  /   \ \  \\\  \ \  \\\  \       \ \  \\  \\ \  \ \  \    \ \  \ \  \\\  \ \  \\  \\ \  \\\  \                   
       \ \__\ \ \__\ \__\ \__\ \__\ \__\\ \__\ \__\\ \__\     __/  / /      \ \_______\ \_______\       \ \__\\ _\\ \__\ \__\    \ \__\ \_______\ \__\\ _\\ \_______\                  
        \|__|  \|__|\|__|\|__|\|__|\|__| \|__|\|__| \|__|    |\___/ /        \|_______|\|_______|        \|__|\|__|\|__|\|__|     \|__|\|_______|\|__|\|__|\|_______|                  
                                                             \|___|/                                                                                                                   
                                                                                                                                                                                                                                                                                                                                                                       
 _________  ___  ___  ________  ________   ___  __             ___    ___ ________  ___  ___          ___       __   ________  ___       ________               ________  ________     
|\___   ___\\  \|\  \|\   __  \|\   ___  \|\  \|\  \          |\  \  /  /|\   __  \|\  \|\  \        |\  \     |\  \|\   __  \|\  \     |\  _____\             |\   ____\|\   ____\    
\|___ \  \_\ \  \\\  \ \  \|\  \ \  \\ \  \ \  \/  /|_        \ \  \/  / | \  \|\  \ \  \\\  \       \ \  \    \ \  \ \  \|\  \ \  \    \ \  \__/              \ \  \___|\ \  \___|    
     \ \  \ \ \   __  \ \   __  \ \  \\ \  \ \   ___  \        \ \    / / \ \  \\\  \ \  \\\  \       \ \  \  __\ \  \ \  \\\  \ \  \    \ \   __\              \ \_____  \ \  \  ___  
      \ \  \ \ \  \ \  \ \  \ \  \ \  \\ \  \ \  \\ \  \        \/  /  /   \ \  \\\  \ \  \\\  \       \ \  \|\__\_\  \ \  \\\  \ \  \____\ \  \_|     ___       \|____|\  \ \  \|\  \ 
       \ \__\ \ \__\ \__\ \__\ \__\ \__\\ \__\ \__\\ \__\     __/  / /      \ \_______\ \_______\       \ \____________\ \_______\ \_______\ \__\     |\__\        ____\_\  \ \_______\
        \|__|  \|__|\|__|\|__|\|__|\|__| \|__|\|__| \|__|    |\___/ /        \|_______|\|_______|        \|____________|\|_______|\|_______|\|__|     \|__|       |\_________\|_______|
                                                             \|___|/                                                                                              \|_________|         
                                                                                                                                                                                       
                                                                                                                                                                                      
]]




-- add_explosion(v3 pos, int type, bool isAudible, bool isInvis, float fCamShake, Ped owner)

--notifies if the script is running
menu.notify("Sneaky Kills Running!")

--player table (for blaming)
--skidded off of moist's script, thank you xD
PlayerTable = {}
function PlayerArray()
    for pid = 0, 32 do
        local playername = tostring(player.get_player_name(pid))
        PlayerTable[pid+1] = string.format(playername)
    end
    PlayerTable[34] = "Anonymous"
end
PlayerArray()

--updating the player table every single time people leave and join
event.add_event_listener("player_join", function()
    PlayerTable = {}
    PlayerArray()
    print("Player Table Updated!")
end)

event.add_event_listener("player_leave", function()
    PlayerTable = {}
    PlayerArray()
    print("Player Table Updated!")
end)


--all the parents here
-- main player parent
local sneakyO = menu.add_player_feature("Sneaky Kills Tools", "parent", 0)
--parent for the kills
local sneakyKILLS = menu.add_player_feature("Sneaky Kills", "parent", sneakyO.id)
--parent for the suicide kills
local sneakySUICIDE = menu.add_player_feature("Sneaky Sucides", "parent", sneakyO.id)
--player sneaky single kills
local sneakyA = menu.add_player_feature("Sneaky Kills", "parent", sneakyKILLS.id)
--player sneaky loop kills
local sneakyL = menu.add_player_feature("Sneaky Loop Kills", "parent", sneakyKILLS.id)
--parent for sneaky blame kills
local sneakyABP = menu.add_player_feature("Sneaky Blames", "parent", sneakyO.id)
--player sneaky blame kills
local sneakyAB = menu.add_player_feature("Sneaky Blame Kills", "parent", sneakyABP.id)
--player sneaky blame loop kills
local sneakyAL = menu.add_player_feature("Sneaky Blame Loop Kills", "parent", sneakyABP.id)
--script menu main parent
local sneakyM = menu.add_feature("Sneaky Kills Tools", "parent", 0)
--script menu main lobby kills
local sneakyMLK = menu.add_feature("Sneaky Lobby Kills", "parent", sneakyM.id)
--player menu suicide kills
local sneakyAS = menu.add_player_feature("Sneaky Suicide Kills", "parent", sneakySUICIDE.id)
--player menu loop suicide kills
local sneakyLS = menu.add_player_feature("Sneaky Suicide Loops Kills", "parent", sneakySUICIDE.id)

--if make the explosion invisible?
DoWeHide = true

local HIDEITQ = menu.add_player_feature("Invisibile Explosion?", "parent", sneakyO.id)
local HIDEITQQ = menu.add_feature("Invisibile Explosion?", "parent", sneakyM.id)

--set the DoWeHide variable here, in the players list
local HIDEITY = menu.add_player_feature("Make it invisible.", "action", HIDEITQ.id, function()
    DoWeHide = true
    local a = tostring(DoWeHide)
    print("DoWeHide is " .. a)
    ui.notify_above_map("Invisibility set to " .. "~g~" .. "~h~" .. a .. "~h~" .. "~g~", "Sneaky Explosions", 0)
end)

local HIDEITN = menu.add_player_feature("Make it visible.", "action", HIDEITQ.id, function()
    DoWeHide = false
    local a = tostring(DoWeHide)
    print("DoWeHide is " .. a)
    ui.notify_above_map("Invisibility set to " .. "~r~" .. "~h~" .. a .. "~h~" .. "~r~", "Sneaky Explosions", 0)
end)

--set the DoWeHide variable here, in the script list
local HIDEITYY = menu.add_feature("Make it invisible.", "action", HIDEITQQ.id, function()
    DoWeHide = true
    local a = tostring(DoWeHide)
    print("DoWeHide is " .. a)
    ui.notify_above_map("Invisibility set to " .. "~g~" .. "~h~" .. a .. "~h~" .. "~g~", "Sneaky Explosions", 0)
end)

local HIDEITNN = menu.add_feature("Make it visible.", "action", HIDEITQQ.id, function()
    DoWeHide = false
    local a = tostring(DoWeHide)
    print("DoWeHide is " .. a)
    ui.notify_above_map("Invisibility set to " .. "~r~" .. "~h~" .. a .. "~h~" .. "~r~", "Sneaky Explosions", 0)
end)





--testing some features

menu.add_feature("Explode all peds", "action", sneakyM.id, function()
    --gets all peds in a table
    local b = ped.get_all_peds()
    --for all of the peds, has (i)
    for i = 1, #b do
        if not ped.is_ped_a_player(b[i]) then
            --exlodes the pedestrians
            local bc, bcoords = ped.get_ped_bone_coords(b[i], 0, v3(0, 0, 0))
            print(bcoords)
            fire.add_explosion(bcoords, 1, false, DoWeHide, 0, 0)
            entity.set_entity_as_no_longer_needed(b[i])
        end
    end
end)

--check for godmode feature
menu.add_player_feature("Check god", "action", sneakyO.id, function(feat, pid)
    local ped1 = player.get_player_ped(pid)
    local godcheck = player.is_player_god(pid)
    local intCheck = interior.get_interior_from_entity(ped1)
    if godcheck == true and intCheck == 0 then
        menu.notify("Player godmode is TRUE", "Godmode Check", 3, 221)
    else
        menu.notify("Player godmode is FALSE", "Godmode Check", 3, 221)
    end
    local ped1god = tostring(ped1)
    print(ped1god)
end)

menu.add_feature("How many people in Godmode?", "action", sneakyM.id, function(feat, pid)
    Godnumber = 0
    for i = 0, 31, 1 do
        local playerPED = player.get_player_ped(i)
        local interiorCheck = interior.get_interior_from_entity(playerPED)
        local godcheck = player.is_player_god(i)
        print(godcheck)
        if godcheck == true and interiorCheck == 0 then
            Godnumber = Godnumber + 1
        end
    end
    print(Godnumber)
    local godnumberString = tostring(Godnumber)
    ui.notify_above_map("There are " .. "~h~" .. "~y~" .. godnumberString .. "~y~" .. "~h~" .. " people in godmode!", "Sneaky Explosions", 0)
end)

menu.add_player_feature("Check health", "action", sneakyO.id, function(feat, pid)
    local ped1 = player.get_player_ped(pid)
    local ped1health = ped.get_ped_health(ped1)
    print(ped1health)
    ui.notify_above_map("Their health is " .. "~h~" .. "~y~" .. ped1health .. "~y~" .. "~h~", "Sneaky Explosions", 0)
end)
menu.add_player_feature("Set health to.. 0?", "action", sneakyO.id, function(feat, pid)
    local ped1 = player.get_player_ped(pid)
    ped.set_ped_health(ped1, 0.0)
    ui.notify_above_map("Set their health to... 0. " .. "~h~" .. "~y~" .. "Why the fuck would you do this?" .. "~y~" .. "~h~", "Sneaky Explosions", 0)
end)






--!!!!!!!!!!LOBBY EXPLODES HERE!!!!!!!!!!

--Explode All
menu.add_feature("Sneaky ALL Players Explosion", "action", sneakyMLK.id, function(feat, pid)
    for i = 0, 31, 1 do
        local playerPOS = player.get_player_coords(i)
        print(playerPOS)
        fire.add_explosion(playerPOS, 1, false, DoWeHide, 0, 0)
    end
end)

menu.add_feature("Sneaky ALL Players Orbital", "action", sneakyMLK.id, function(feat, pid)
    for i = 0, 31, 1 do
        local playerPOS = player.get_player_coords(i)
        fire.add_explosion(playerPOS, 59, false, DoWeHide, 0, 0)
        offset = v3(0.0,0.0,-2000.00)
        fire.add_explosion(playerPOS + offset, 60, true, DoWeHide, 1.8, 0)
        fire.add_explosion(playerPOS + offset, 62, true, DoWeHide, 2.0, 0)
        fire.add_explosion(playerPOS + v3(100.0,100.0,7000.00), 50, true, DoWeHide, 1.0, 0)
        fire.add_explosion(playerPOS, 50, true, DoWeHide, 1.0, 0)
    end
end)



--[[
#### Ped                get_player_ped(Player player)
#### Player             player_id()
]]









--!!!!!!!!!!!!!!!!!!!!!!!!!sneaky single explodes here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

--allexplode blame
menu.add_player_feature("Sneaky ALL Explosion BLAME", "action", sneakyAB.id, function(feat, pid)
    local blamer = player.get_player_ped(pid)
    print(blamer)
    for i = 0, 31, 1 do
        local playerPOS = player.get_player_coords(i)
        print(playerPOS)
        fire.add_explosion(playerPOS, 1, false, DoWeHide, 0, blamer)
    end
    ui.notify_above_map("~h~" .. "~r~" .. "Blamed for exploding all" .. "~r~" .. "~h~", "Sneaky Explosions", 0)
end)

--explode all players molotov blame
menu.add_player_feature("Sneaky ALL Molotov BLAME", "action", sneakyAB.id, function(feat, pid)
    local blamer = player.get_player_ped(pid)
    for i = 0, 31, 1 do
        local playerPOS = player.get_player_coords(i)
        fire.add_explosion(playerPOS, 3, false, DoWeHide, 0, blamer)
    end
    ui.notify_above_map("~h~" .. "~r~" .. "Blamed for molotoving all" .. "~r~" .. "~h~", "Sneaky Explosions", 0)
end)

--explode all players blimp blame
menu.add_player_feature("Sneaky ALL Blimp BLAME", "action", sneakyAB.id, function(feat, pid)
    local blamer = player.get_player_ped(pid)
    for i = 0, 31, 1 do
        local playerPOS = player.get_player_coords(i)
        fire.add_explosion(playerPOS, 29, false, DoWeHide, 0, blamer)
    end
    ui.notify_above_map("~h~" .. "~r~" .. "Blamed for blimp-exploding all" .. "~r~" .. "~h~", "Sneaky Explosions", 0)
end)

--water hydrant all players blame
menu.add_player_feature("Sneaky ALL Water Hydrant BLAME", "action", sneakyAB.id, function(feat, pid)
    local blamer = player.get_player_ped(pid)
    for i = 0, 31, 1 do
        local playerPOS = player.get_player_coords(i)
        fire.add_explosion(playerPOS, 13, false, DoWeHide, 0, blamer)
    end
end)

--explode all players with orbital
menu.add_player_feature("Sneaky ALL Orbital BLAME", "action", sneakyAB.id, function(feat, pid)
    local blamer = player.get_player_ped(pid)
    for i = 0, 31, 1 do
        local playerPOS = player.get_player_coords(i)
        fire.add_explosion(playerPOS, 59, false, DoWeHide, 0, blamer)
        local offset = v3(0.0,0.0,-2000.00)
        fire.add_explosion(playerPOS + offset, 60, true, DoWeHide, 1.8, blamer)
        fire.add_explosion(playerPOS + offset, 62, true, DoWeHide, 2.0, blamer)
        fire.add_explosion(playerPOS + v3(100.0,100.0,7000.00), 50, true, DoWeHide, 1.0, blamer)
        fire.add_explosion(playerPOS, 50, true, DoWeHide, 1.0, blamer)
    end
end)

--explode all players who are in a vehicle blame
menu.add_player_feature("Sneaky All In Vehicle Explode BLAME", "action", sneakyAB.id, function(feat,pid)
    local blamer = player.get_player_ped(pid)
    for i = 0, 31, 1 do
        --checks if they're in a vehicle
        if player.is_player_in_any_vehicle(i) then
            local playerPOS = player.get_player_coords(i)
            fire.add_explosion(playerPOS, 1, false, DoWeHide, 0, blamer)
        end
    end
end)

--explode all peds with blame
menu.add_player_feature("Sneaky Kill All Peds Blamed", "action", sneakyAB.id, function(feat, pid)
    local playerPED = player.get_player_ped(pid)
    --gets all peds in a table
    local b = ped.get_all_peds()
    --for all of the peds, has (i)
    for i = 1, #b do
        if not ped.is_ped_a_player(b[i]) then
            --exlodes the pedestrians
            local bc, bcoords = ped.get_ped_bone_coords(b[i], 0, v3(0, 0, 0))
            for e = 0, 35, 1 do
                fire.add_explosion(bcoords, e, false, DoWeHide, 0, playerPED)
                entity.set_entity_as_no_longer_needed(b[i])
            end
        end
    end
end)







-- explode a single player

--skidded off of moist's script
Features = {}
--[[
menu.add_feature("Yes.", "action", 0, function(feat)
    for i = 0, 32 do
        print(PlayerTable[i])
    end
end)
]]


-- add_explosion(v3 pos, int type, bool isAudible, bool isInvis, float fCamShake, Ped owner)

Features["Explode one"] = {feat = menu.add_player_feature("Blame for exploding: ", "action_value_str", sneakyAB.id, function(feat, pid)
    --gets the ped of the person we blame it on
    local blamer = player.get_player_ped(pid)
    --prints a number to the console, the selected player's PID.
    print(feat.value)
    --getting the v3 coords of selected player
    local theKilled = player.get_player_coords(feat.value)
    --makes the coords a string (for debugging)
    local theKilledSTR = tostring(theKilled)
    --prints the v3 into console (debugging)
    print("target coords: " .. theKilledSTR)
    --explosion at coords (no string)
    -- a couple of them because the person might be in a car
    for v = 0, 20, 1 do
        fire.add_explosion(theKilled, 0, false, DoWeHide, 0, blamer)
        --print for debugging
        print("Explosion number: " .. v)
    end
end), type = "action"}
    Features["Explode one"].feat:set_str_data(PlayerTable)








--((NON BLAMES))
--explode
menu.add_player_feature("Sneaky Explosion", "action", sneakyA.id, function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    print(playerPOS)
    fire.add_explosion(playerPOS, 1, false, DoWeHide, 0, 0)
end)

--molotov
menu.add_player_feature("Sneaky Molotov", "action", sneakyA.id, function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    print(playerPOS)
    fire.add_explosion(playerPOS, 3, false, DoWeHide, 0, 0)
end)

--blimp
menu.add_player_feature("Sneaky Blimp", "action", sneakyA.id, function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    fire.add_explosion(playerPOS, 29, false, DoWeHide, 0, 0)
end)

--water hydrant
menu.add_player_feature("Sneaky Water Hydrant (blames them)", "action", sneakyA.id, function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    local playerPED = player.get_player_ped(pid)
    fire.add_explosion(playerPOS, 13, false, DoWeHide, 0, playerPED)
end)

--orbital cannon
menu.add_player_feature("Sneaky Orbital Cannon (alpha)", "action", sneakyA.id, function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    fire.add_explosion(playerPOS, 59, false, DoWeHide, 0, 0)
    --skidded off of moist2054
    offset = v3(0.0,0.0,-2000.00)
    fire.add_explosion(playerPOS + offset, 60, true, DoWeHide, 1.8, 0)
    fire.add_explosion(playerPOS + offset, 62, true, DoWeHide, 2.0, 0)
    fire.add_explosion(playerPOS + v3(100.0,100.0,7000.00), 50, true, DoWeHide, 1.0, 0)
    fire.add_explosion(playerPOS, 50, true, DoWeHide, 1.0, 0)
end)








---!!!!!!!!!!SNEAKY BLAME KILL LOOPS HERE!!!!!!!!!!

--sneaky blame kill loop EXPLOSION
local SAEBL = function(feat, pid)
    local blamer = player.get_player_ped(pid)
    if feat.on then
        for i = 0, 31, 1 do
            local playerPOS = player.get_player_coords(i)
            fire.add_explosion(playerPOS, 1, false, DoWeHide, 0, blamer)
        end
        system.wait(100)
        return HANDLER_CONTINUE
    end
end
menu.add_player_feature("Sneaky ALL Explosion Blame Loop", "toggle", sneakyAL.id, SAEBL)

--sneaky blame kill loop MOLOTOV
local SAMBL = function(feat, pid)
    local blamer = player.get_player_ped(pid)
    if feat.on then
        for i = 0, 31, 1 do
            local playerPOS = player.get_player_coords(i)
            fire.add_explosion(playerPOS, 3, false, DoWeHide, 0, blamer)
        end
        system.wait(100)
        return HANDLER_CONTINUE
    end
end
menu.add_player_feature("Sneaky ALL Molotov Blame Loop", "toggle", sneakyAL.id, SAMBL)

--sneaky blame kill loop BLIMP
local SABBL = function(feat, pid)
    local blamer = player.get_player_ped(pid)
    if feat.on then
        for i = 0, 31, 1 do
            local playerPOS = player.get_player_coords(i)
            fire.add_explosion(playerPOS, 29, false, DoWeHide, 0, blamer)
        end
        system.wait(100)
        return HANDLER_CONTINUE
    end
end
menu.add_player_feature("Sneaky ALL Blimp Blame Loop", "toggle", sneakyAL.id, SABBL)

--blame kill loop water hydrant
local SAWBL = function(feat, pid)
    local blamer = player.get_player_ped(pid)
    if feat.on then
        for i = 0, 31, 1 do
            local playerPOS = player.get_player_coords(i)
            fire.add_explosion(playerPOS, 13, false, DoWeHide, 0, blamer)
        end
        system.wait(100)
        return HANDLER_CONTINUE
    end
end
menu.add_player_feature("Sneaky ALL Water Hydrant Blame Loop", "toggle", sneakyAL.id, SAWBL)

--blame kill loop orbital cannon
local SAOBL = function(feat, pid)
    local blamer = player.get_player_ped(pid)
    local offset = v3(0.0,0.0,-2000.00)
    if feat.on then
        for i = 0, 31, 1 do
            local playerPOS = player.get_player_coords(i)
            fire.add_explosion(playerPOS, 59, false, DoWeHide, 0, blamer)
            fire.add_explosion(playerPOS + offset, 60, true, DoWeHide, 1.8, blamer)
            fire.add_explosion(playerPOS + offset, 62, true, DoWeHide, 2.0, blamer)
            fire.add_explosion(playerPOS + v3(100.0,100.0,7000.00), 50, true, DoWeHide, 1.0, blamer)
            fire.add_explosion(playerPOS, 50, true, DoWeHide, 1.0, blamer)
        end
        system.wait(100)
        return HANDLER_CONTINUE
    end
end
menu.add_player_feature("Sneaky ALL Orbital Blame Loop", "toggle", sneakyAL.id, SAOBL)

--blame kill loop all in vehicle
local SAVBL = function(feat, pid)
    local blamer = player.get_player_ped(pid)
    if feat.on then
        for i = 0, 31, 1 do
            if player.is_player_in_any_vehicle(i) then
                local playerPOS = player.get_player_coords(i)
                fire.add_explosion(playerPOS, 1, false, DoWeHide, 0, blamer)
                fire.add_explosion(playerPOS, 1, false, DoWeHide, 0, blamer)
                fire.add_explosion(playerPOS, 1, false, DoWeHide, 0, blamer)
                fire.add_explosion(playerPOS, 1, false, DoWeHide, 0, blamer)
            end
        end
        system.wait(100)
        return HANDLER_CONTINUE
    end
end
menu.add_player_feature("Sneaky ALL In Vehicle Explode Blame Loop", "toggle", sneakyAL.id, SAVBL)

--blame kill loop all peds
local SAWBL = function(feat, pid)
    local blamer = player.get_player_ped(pid)
    local b = ped.get_all_peds()
    if feat.on then
        for i = 1, #b do
            if not ped.is_ped_a_player(b[i]) then
                --exlodes the pedestrians
                local bc, bcoords = ped.get_ped_bone_coords(b[i], 0, v3(0, 0, 0))
                fire.add_explosion(bcoords, 1, false, DoWeHide, 0, blamer)
                entity.set_entity_as_no_longer_needed(b[i])
            end
        end
        system.wait(100)
        return HANDLER_CONTINUE
    end
end
menu.add_player_feature("Sneaky ALL All Peds Blame Loop", "toggle", sneakyAL.id, SAWBL)






--!!!!!!!!!!!!!!!!!!!!!sneaky loop explodes here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

--explode
local SLE = function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    if feat.on then
        fire.add_explosion(playerPOS, 1, false, DoWeHide, 0, 0)
        system.wait(100)
        print("looped sneaky explosion")
        return HANDLER_CONTINUE
    end
end
menu.add_player_feature("Sneaky Loop Explosion", "toggle", sneakyL.id, SLE)

--molotov
local SLM = function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    if feat.on then
        fire.add_explosion(playerPOS, 3, false, DoWeHide, 0, 0)
        system.wait(100)
        print("looped sneaky molotov")
        return HANDLER_CONTINUE
    end
end
menu.add_player_feature("Sneaky Loop Molotov", "toggle", sneakyL.id, SLM)

--blimp
local SLB = function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    if feat.on then
        fire.add_explosion(playerPOS, 29, false, DoWeHide, 0, 0)
        system.wait(100)
        return HANDLER_CONTINUE
    end
end
menu.add_player_feature("Sneaky Loop Blimp", "toggle", sneakyL.id, SLB)

--water hydrant
local SLW = function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    local playerPED = player.get_player_ped(pid)
    if feat.on then
        fire.add_explosion(playerPOS, 13, false, DoWeHide, 0, playerPED)
        system.wait(100)
        return HANDLER_CONTINUE
    end
end
menu.add_player_feature("Sneaky Loop Water Hydrant (blames them)", "toggle", sneakyL.id, SLW)






--!!!!!!!!!!!!!!!!!!!!!!!sneaky suicide loop kills here!!!!!!!!!!!!!!!!!!!!

--explode suicide loop
local SLEB = function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    local playerPED = player.get_player_ped(pid)
    if feat.on then
        fire.add_explosion(playerPOS, 1, false, DoWeHide, 0, playerPED)
        system.wait(100)
        print("looped sneaky explosion")
        return HANDLER_CONTINUE
    end
end
menu.add_player_feature("Sneaky Suicide Explode Loop", "toggle", sneakyLS.id, SLEB)

--molotov suicide loop
local SLMB = function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    local playerPED = player.get_player_ped(pid)
    if feat.on then
        fire.add_explosion(playerPOS, 3, false, DoWeHide, 0, playerPED)
        system.wait(100)
        print("looped sneaky explosion")
        return HANDLER_CONTINUE
    end
end
menu.add_player_feature("Sneaky Suicide Molotov Loop", "toggle", sneakyLS.id, SLMB)

--blimp suicide loop
local SLBB = function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    local playerPED = player.get_player_ped(pid)
    if feat.on then
        fire.add_explosion(playerPOS, 29, false, DoWeHide, 0, playerPED)
        system.wait(100)
        print("looped sneaky explosion")
        return HANDLER_CONTINUE
    end
end
menu.add_player_feature("Sneaky Suicide Blimp Loop", "toggle", sneakyLS.id, SLBB)






--!!!!!!!!!!!!!!!!!!!!!!!sneaky suicide kills here!!!!!!!!!!!!!!!!!!!!

--explode suicide
menu.add_player_feature("Sneaky Suicide Explode", "action", sneakyAS.id, function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    local playerPED = player.get_player_ped(pid)
    fire.add_explosion(playerPOS, 1, false, DoWeHide, 0, playerPED)
end)

--molotov suicide
menu.add_player_feature("Sneaky Suicide Molotov", "action", sneakyAS.id, function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    local playerPED = player.get_player_ped(pid)
    fire.add_explosion(playerPOS, 3, false, DoWeHide, 0, playerPED)
end)

--blimp suicide
menu.add_player_feature("Sneaky Suicide Blimp", "action", sneakyAS.id, function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    local playerPED = player.get_player_ped(pid)
    fire.add_explosion(playerPOS, 29, false, DoWeHide, 0, playerPED)
end)

--experimental



--[[
    SOURCE: https://wiki.rage.mp/index.php?title=Explosions
EXP_TAG_GRENADE 	0
EXP_TAG_GRENADELAUNCHER 	1
EXP_TAG_STICKYBOMB 	2
EXP_TAG_MOLOTOV 	3
EXP_TAG_ROCKET 	4
EXP_TAG_TANKSHELL 	5
EXP_TAG_HI_OCTANE 	6
EXP_TAG_CAR 	7
EXP_TAG_PLANE 	8
EXP_TAG_PETROL_PUMP 	9
EXP_TAG_BIKE 	10
EXP_TAG_DIR_STEAM 	11
EXP_TAG_DIR_FLAME 	12
EXP_TAG_DIR_WATER_HYDRANT 	13
EXP_TAG_DIR_GAS_CANISTER 	14
EXP_TAG_BOAT 	15
EXP_TAG_SHIP_DESTROY 	16
EXP_TAG_TRUCK 	17
EXP_TAG_BULLET 	18
EXP_TAG_SMOKEGRENADELAUNCHER 	19
EXP_TAG_SMOKEGRENADE 	20
EXP_TAG_BZGAS 	21
EXP_TAG_FLARE 	22
EXP_TAG_GAS_CANISTER 	23
EXP_TAG_EXTINGUISHER 	24
EXP_TAG_PROGRAMMABLEAR 	25
EXP_TAG_TRAIN 	26
EXP_TAG_BARREL 	27
EXP_TAG_PROPANE 	28
EXP_TAG_BLIMP 	29
EXP_TAG_DIR_FLAME_EXPLODE 	30
EXP_TAG_TANKER 	31
EXP_TAG_PLANE_ROCKET 	32
EXP_TAG_VEHICLE_BULLET 	33
EXP_TAG_GAS_TANK 	34
EXP_TAG_BIRD_CRAP 	35
EXP_TAG_RAILGUN 	36
EXP_TAG_BLIMP2 	37
EXP_TAG_FIREWORK 	38
EXP_TAG_SNOWBALL 	39
EXP_TAG_PROXMINE 	40
EXP_TAG_VALKYRIE_CANNON 	41
EXP_TAG_AIR_DEFENSE 	42
EXP_TAG_PIPEBOMB 	43
EXP_TAG_VEHICLEMINE 	44
EXP_TAG_EXPLOSIVEAMMO 	45
EXP_TAG_APCSHELL 	46
EXP_TAG_BOMB_CLUSTER 	47
EXP_TAG_BOMB_GAS 	48
EXP_TAG_BOMB_INCENDIARY 	49
EXP_TAG_BOMB_STANDARD 	50
EXP_TAG_TORPEDO 	51
EXP_TAG_TORPEDO_UNDERWATER 	52
EXP_TAG_BOMBUSHKA_CANNON 	53
EXP_TAG_BOMB_CLUSTER_SECONDARY 	54
EXP_TAG_HUNTER_BARRAGE 	55
EXP_TAG_HUNTER_CANNON 	56
EXP_TAG_ROGUE_CANNON 	57
EXP_TAG_MINE_UNDERWATER 	58
EXP_TAG_ORBITAL_CANNON 	59
EXP_TAG_BOMB_STANDARD_WIDE 	60
EXP_TAG_EXPLOSIVEAMMO_SHOTGUN 	61
EXP_TAG_OPPRESSOR2_CANNON 	62
EXP_TAG_MORTAR_KINETIC 	63
EXP_TAG_VEHICLEMINE_KINETIC 	64
EXP_TAG_VEHICLEMINE_EMP 	65
EXP_TAG_VEHICLEMINE_SPIKE 	66
EXP_TAG_VEHICLEMINE_SLICK 	67
EXP_TAG_VEHICLEMINE_TAR 	68
EXP_TAG_SCRIPT_DRONE 	69
EXP_TAG_RAYGUN 	70
EXP_TAG_BURIEDMINE 	71
EXP_TAG_SCRIPT_MISSILE 	72 
]]


--[[]
    !!!!!!!!!!!!!2take1script-revive code for a lobby host kick!!!!!!!!!!!!!!!!!!!

    local s = {
    o = io.open,
    no = tonumber,
    wait = system.wait,
    time = utils.time_ms,
    random = math.random,
    id = player.player_id,
    d_exists = utils.dir_exists,
    ped = player.get_player_ped,
    f_exists = utils.file_exists,
    explode = fire.add_explosion,
    valid = player.is_player_valid,
    god = entity.set_entity_god_mode,
    gcoords = entity.get_entity_coords,
    visible = entity.set_entity_visible,
    script = script.trigger_script_event,
    navigate = menu.set_menu_can_navigate,
    vehicle = ped.get_vehicle_ped_is_using,
    attach = entity.attach_entity_to_entity,
    unload = streaming.set_model_as_no_longer_needed,
    bullet = gameplay.shoot_single_bullet_between_coords
}

    local function kick_pl(lobby, id)
    for i = 0, 31 do
        if lobby then
            if i ~= s.id() then
                if network.network_is_host() then
                    network.network_session_kick_player(i)
                else
                    s.script(1249026189, i, {0, 4294967295, 0})
                end
            end
        else
            if i ~= s.id() then
                if network.network_is_host() then
                    n('Haha, got a host kick.', nc.g)
                    network.network_session_kick_player(id)
                else
                    s.script(1249026189, id, {0, 4294967295, 0})
                    break
                end
            end
        end
    end
end
]]