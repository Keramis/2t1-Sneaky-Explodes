-- add_explosion(v3 pos, int type, bool isAudible, bool isInvis, float fCamShake, Ped owner)

--notifies if the script is running
menu.notify("Sneaky Kills Running!")


--all the parents here
-- main player parent
local sneakyO = menu.add_player_feature("Sneaky Kills Tools", "parent", 0)
--parent for the kills
local sneakyKILLS = menu.add_player_feature("Sneaky Kills", "parent", sneakyO.id)
--parent for the suicide kills
local sneakySUICIDE = menu.add_player_feature("Sneaky Sucides", "parent", sneakyO.id)
--player sneaky loop kills
local sneakyL = menu.add_player_feature("Sneaky Loop Kills", "parent", sneakyKILLS.id)
--player sneaky single kills
local sneakyA = menu.add_player_feature("Sneaky Kills", "parent", sneakyKILLS.id)
--player sneaky blame kills
local sneakyAB = menu.add_player_feature("Sneaky Blame Kills", "parent", sneakyO.id)
--script menu main parent
local sneakyM = menu.add_feature("Sneaky Kills Tools", "parent", 0)
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

--check for godmode feature (experimental)
menu.add_player_feature("Check god", "action", sneakyO.id, function(feat, pid)
    local ped1 = player.is_player_god(pid)
    if ped1 == true then
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
        local godcheck = player.is_player_god(i)
        print(godcheck)
        if godcheck == true then
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

--allexplode test
menu.add_feature("Sneaky ALL Explosion", "action", sneakyM.id, function(feat, pid)
    for i = 0, 31, 1 do
        local playerPOS = player.get_player_coords(i)
        print(playerPOS)
        fire.add_explosion(playerPOS, 1, false, DoWeHide, 0, 0)
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
menu.add_player_feature("Sneaky Water Hydrant", "action", sneakyA.id, function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    fire.add_explosion(playerPOS, 13, false, DoWeHide, 0, 0)
end)



--!!!!!!!!!!!!!!!!!!!!!sneaky loop explodes here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

--explode
local SLE = function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    if feat.on then
        fire.add_explosion(playerPOS, 1, false, DoWeHide, 0, 0)
        system.wait(1000)
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
        system.wait(1000)
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
        system.wait(1000)
        return HANDLER_CONTINUE
    end
end
menu.add_player_feature("Sneaky Loop Blimp", "toggle", sneakyL.id, SLB)

--water hydrant
local SLW = function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    if feat.on then
        fire.add_explosion(playerPOS, 13, false, DoWeHide, 0, 0)
        system.wait(1000)
        return HANDLER_CONTINUE
    end
end
menu.add_player_feature("Sneaky Loop Water Hydrant", "toggle", sneakyL.id, SLW)


--!!!!!!!!!!!!!!!!!!!!!!!sneaky suicide loop kills here!!!!!!!!!!!!!!!!!!!!

--explode suicide loop
local SLEB = function(feat, pid)
    local playerPOS = player.get_player_coords(pid)
    local playerPED = player.get_player_ped(pid)
    if feat.on then
        fire.add_explosion(playerPOS, 1, false, DoWeHide, 0, playerPED)
        system.wait(1000)
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
        system.wait(1000)
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
        system.wait(1000)
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
    SOURCE: https://wiki.gtanet.work/index.php?title=Explosions
    EXPLOSION_GRENADE 	0
EXPLOSION_GRENADELAUNCHER 	1
EXPLOSION_STICKYBOMB 	2
EXPLOSION_MOLOTOV 	3
EXPLOSION_ROCKET 	4
EXPLOSION_TANKSHELL 	5
EXPLOSION_HI_OCTANE 	6
EXPLOSION_CAR 	7
EXPLOSION_PLANE 	8
EXPLOSION_PETROL_PUMP 	9
EXPLOSION_BIKE 	10
EXPLOSION_DIR_STEAM 	11
EXPLOSION_DIR_FLAME 	12
EXPLOSION_DIR_WATER_HYDRANT 	13
EXPLOSION_DIR_GAS_CANISTER 	14
EXPLOSION_BOAT 	15
EXPLOSION_SHIP_DESTROY 	16
EXPLOSION_TRUCK 	17
EXPLOSION_BULLET 	18
EXPLOSION_SMOKEGRENADELAUNCHER 	19
EXPLOSION_SMOKEGRENADE 	20
EXPLOSION_BZGAS 	21
EXPLOSION_FLARE 	22
EXPLOSION_GAS_CANISTER 	23
EXPLOSION_EXTINGUISHER 	24
EXPLOSION_PROGRAMMABLEAR 	25
EXPLOSION_TRAIN 	26
EXPLOSION_BARREL 	27
EXPLOSION_PROPANE 	28
EXPLOSION_BLIMP 	29
EXPLOSION_DIR_FLAME_EXPLODE 	30
EXPLOSION_TANKER 	31
EXPLOSION_PLANE_ROCKET 	32
EXPLOSION_VEHICLE_BULLET 	33
EXPLOSION_GAS_TANK 	34
EXPLOSION_BIRD_CRAP 	35 
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