wait(3)

local antiabuse = true
local antirocket = true
local antidog = true
local antipunish = true
local antikill = true
local anticrash = true
local antiff = false
local antigod = false
local gb = false

local SPlayers = game:GetService("Players")
local Players = game.Players
local lp = Players.LocalPlayer
local lpchar = lp.Character
local ScrOwner = "Ih0temyIife"
local perm = false
local prefix = ";"
local pperm = false -- Players perm, further features
local killbricks = {game:GetService("Workspace").Terrain["_Game"].Workspace.Obby:GetChildren()}
local musicid = {
    1848354536, -- Relaxed scene
    6913550990, -- fnaf
    142376088,  -- Raining Tacos
    9048375035  -- All dropping 8 bits
}

local adminf = game:GetService("Workspace").Terrain["_Game"].Admin
local rp = game:GetService("Workspace").Terrain["_Game"].Admin:FindFirstChild("Regen")
local adminpads = (adminf.Pads:GetChildren())

-- Gear codes

local periastronsid = {108158379, 99119240, 80661504, 93136802, 120307951, 159229806, 73829193, 139577901, 80597060, 69499437, 2544549379, 233520257}

local admslayerid = {1103011681, 268586231}

local kpids = {583030187, 68539623}

local subzeroids = {87361662 , 66896601}
----
local Sblacklist = {}
local bpunish = false
local lpowner = false
local Ownerhere = true
local lpname = lp.Name
local whitelist = {"Raysdamain", "asechka198720", "asechka19872"}
local crashonretardjoin = true
local retards = {"someguylmao"}

-- Functions

local function ct(ChatMessage)

    Players:Chat(ChatMessage)

end

local function music(id)

    ct("music "..id)

end

local function fogend(num)

    ct("fogend "..num)

end

local function fogcolor(r,g,b)

    ct("fogcolor "..r.." "..g.." "..b)

end

local function oda(num1,num2,num3)
    
    ct("outdoorambient "..num1.." "..num2.." "..num3)

end

local function brightness(num)

    ct("brightness "..num)

end

local function ambient(num1,num2,num3)

    ct("ambient "..num1.." "..num2.." "..num3)

end

local function time(num)

    ct("time "..num)

end

local function msg(message)

    ct("m "..message)

end

local function omsg(oldmessage)

    if person then
        ct("m/"..oldmessage)
    else
        ct("m "..oldmessage)
    end

end

local function h(hmessage)

    ct("h "..hmessage)

end

local function ohmsg(oldhmessage)

    if person then
        ct("h/"..oldhmessage)
    else
        ct("h "..oldhmessage)

    end

end

local function Regen()

    fireclickdetector(rp.ClickDetector)

end

local function adplr(player)

    h("\n\n\n Welcome to the server, "..tostring(player.Name).."\n\n\n")

end
----

-- If statements

if lpname ~= "asechka19872" then

    h("\n\n\n SimpleKAH executed by "..tostring(lp).." - Created by "..tostring(ScrOwner)..". \n\n\n")
    lpowner = false
    Ownerhere = false

    local OwnerCheck = coroutine.wrap(function()
    
        while not Ownerhere do

            if game.Players:FindFirstChild(ScrOwner) then

                h("\n\n\n "..tostring(ScrOwner)..", the owner of SimpleKAH V2, has joined! \n\n\n")
                local Ownerhere = true
                coroutine.yield(OwnerCheck)

            end

        end

    end)

else

    lpowner = true

end

----

-- Setup

local function heplr(heplr)

    heplr.Chatted:Connect(function(m)

----

    ---- Messages from other players

        -- Anti punish

        if m:sub(1, 7) == "punish " or m:sub(1, 7) == "punish/" and antipunish and heplr ~= game.Players.LocalPlayer then

            ct("unpunish "..m:sub(8))

        end

        ----

        if heplr == lp then
  
            -- Regen

            if m:lower() == prefix.."regen" or m:lower() == "regen" then

                Regen()
        
            end

            -- Vibes

            if m:sub(1, #prefix + 5) == prefix.."vibe " then

                local vibe = m:sub(#prefix + 6)

                if vibe == "rscene" or vibe == "1" then

                    music(musicid[1])

                elseif vibe == "fnaf" or vibe == "2"then

                    music(musicid[2])

                elseif vibe == "taco" or vibe == "3" then

                    music(musicid[3])

                elseif vibe == "8bits" or vibe == "4" then

                    music(musicid[4])

                end

            end

            ----

            -- potato

            if m:sub(1, #prefix + 7) == prefix.."potato " then

                local potatotarget = m:sub(#prefix+8)

                ct("punish "..potatotarget)
                ct("spam pm "..potatotarget.." 😀😃😄😁😆😅😂🤣😗😙😚😘🥰😍🤩🤗🙂🙃☺😊😊😇🥲🤭🥳😉😌😌😌😛😛😝😝😜😜🤪😎😏😏😏😏😒😒😒😔😔😢😢😢😭😭🥺🥺😶😶😶😟😕🙁🙁🙁🙁🙁☹️☹️☹️☹️😣😖😖😖😫😫😫😫😩😩😩🤨🤨😡🤯🤯🤯🤯🥶🥵😶‍🌫️😑😶‍🌫️😑🧐🤓🥸🤡🤡😑😑🤡🤡😧😮😮‍💨🥱🥱😮😰😮😮‍💨😲😵😵🤤😥😱😥😱😥😱😥😥😱😥😨😰😬🙄😬🤔🤔🤔🤔😬🤔😬😴🤥😪🤥😴🤑🤑🤧🤕😷🤑😷")

            end

            --Re(Reset me)

            if m:lower() == prefix.."re" or m:lower() == "re" then

                ct("reset me")

            end

            -- Gearban

            if m:lower() == prefix.."gb" then

                gb = true

            elseif m:lower() == prefix.."gb off" then

                gb = false

            end

            --AntiAbuse

            if m:lower() == prefix.."antiabuse" then

                antikill = true
                anticrash = true
                antirocket = true
                antipunish = true
                antidog = true

            end

            if m:lower() == prefix.."antipunish" then

                antipunish = true

            elseif m:lower() == prefix.."antipunish off" then

                antipunish = false

            end

            if m:lower() == prefix.."nok" then

                antikill = true

            elseif m:lower() == prefix.."nok off" then

                antikill = false

            end

            ----

            -- Nudes

            if m:sub(#prefix, #prefix + 7) == prefix.."kitten " then

                local nudetarget = m:sub(#prefix + 8)

                ct("unshirt "..nudetarget)
                ct("unpants "..nudetarget)

            end

            -- Rtx

            if m:sub(1, #prefix + 4) == prefix.."rtx " then

                local rtx = m:sub(#prefix + 5)
                ct("fix")

                if rtx == "vibes" or rtx == "1" then

                    oda(0,0,0)
                    fogend(100)
                    fogcolor(125,0,255)
                    time(0)

                elseif rtx == "morning" or rtx == "2" then

                    oda(0.2,0.2,0.2)
                    fogend(2000)
                    time(6.8)
                    brightness(0.7)

                elseif rtx == "afternoon" or rtx == "3" then

                    oda(0.5,0.5,0.5)
                    fogend(2000)
                    time(14.00)
                    brightness(0.9)

                elseif rtx == "sunset" or rtx == "4" then

                    oda(0.3,0.3,0.3)
                    fogend(2000)
                    time(17.00)
                    brightness(0.7)

                elseif rtx == "night" or rtx == "5" then

                    oda(0,0,0)
                    fogend(2000)
                    fogcolor(0,0,0)
                    time(0)
                    brightness(0.3)

                end

            end


            -- Simple vg

            if m:lower() == prefix.."simple vg" or m:lower() == "simple vg" then

                local Vghelpvar = true
                music(musicid[2])
                ct(prefix.."rtx vibes")
                ohmsg("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\ Lv 10 mr super gyatt W fanum tax skibidi toilet kiss big black oily man g man scientist toilet so skibidi gyatt \n\n\n\n\ super sigma gyatt chad free coems  \n\n\n\n\ Skibid rizz infinite rizz so skibidi fanum tax blade ball music \n\n\n\n\ 😘😘🥰🥰😍😍🤩🤩🤑🤑😩😩🤤🤤🤤 \n\n\n\n\ ")

                ct("spam gear all 94794847")
                ct("spam unsize all")
                local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
                  game.Players.LocalPlayer.Backpack:WaitForChild("VampireVanquisher")
                for _, v in ipairs(Backpack:GetChildren()) do
                    v.Parent = game.Players.LocalPlayer.Character
                    v:Activate()
                end
                -- Credits to ts2021(aka kohlslite creator) for making tool equip

            end

            -- Blacklist

            if m:sub(#prefix, #prefix + 3) == prefix.."bl " then

                local Sblacklisted = m:sub(#prefix + 4)
                table.insert(Sblacklist, Sblacklisted)
                bpunish = true
                print(Sblacklist)

            elseif m:sub(#prefix, #prefix + 5) == prefix.."unbl " then

                local sblindex = m:sub(#prefix + 6)
                table.remove(Sblacklist, sblindex)

            elseif m:lower() == prefix.."blcheck" then

                print(Sblacklist)

            end

            -- Goto

            if m:sub(#prefix, #prefix + 3) == prefix.."to " then
                local totarget = m:sub(#prefix+4)
                ct("tp me "..totarget)
            elseif m:sub(1,3) == "to " then
                local totarget2 = m:sub(3)
                ct("tp me"..totarget2)
            end

            -- Bring

            if m:sub(#prefix, #prefix + 6) == prefix.."bring " then
                local bringtarget = m:sub(#prefix + 7)
                ct("tp "..bringtarget.." me")
            elseif m:sub(1,6) == "bring " then
                local bringtarget2 = m:sub(7)
                ct("tp "..bringtarget2.." me")

            end

            -- Attaches

            if m:lower() == prefix.."attach" or m:lower() == "attach" then

                ct("unpunish me")

            elseif m:lower() == prefix.."fattach" or m:lower() == "fattach" then

                ct("sit me")
                wait(0.6)
                ct("unpunish me")
                ct("jump me")

            elseif m:lower() == prefix.."wremove" or m:lower() == "wremove" then

                ct("unpunish me")
                ct("skydive me me me me me me me me me me me")
                ct("respawn me")

            elseif m:lower() == prefix.."fremove" or m:lower() == "fremove" then

                ct("fattach")
                ct("wremove")

            end

                    
            -- Gears -----

            -- Periastrons

            if m:sub(#prefix, #prefix + 7) == prefix.."perias " then

                local periastarget = m:sub(#prefix + 8)

                for _, v in ipairs(periastronsid) do

                    ct("gear "..periastarget.." "..v)

                end

            elseif m:sub(1,7) == "perias " then

                local periastarget2 = m:sub(8) 

                ct(";perias "..periastarget2)

            elseif m:lower() == "perias" or m:lower() == prefix.."perias" then

                ct("perias me")

            end

            -- Adm(Azure dragon magic) slayer + Extra

            if m:sub(#prefix, #prefix + 10) == prefix.."admslayer " then

                local admslayertarget = m:sub(#prefix + 11)
                
                for _, v in ipairs(admslayerid) do

                    ct("gear "..admslayertarget.." "..v)

                end

            elseif m:sub(1, 10) == "admslayer " then

                local admslayertarget2 = m:sub(11)

                ct(";admslayer "..admslayertarget2)

            elseif m:lower() == "admslayer" or m:lower() == prefix.."kp" then

                ct("admslayer me")

            end

            -- Korblox sword and Pickaxe

            if m:sub(#prefix, #prefix + 3) == prefix.."kp " then

                local kptarget = m:sub(#prefix + 4)

                for _, v in ipairs(kpids) do

                    ct("gear "..kptarget.." "..v)

                end

            elseif m:sub(1,3) == "kp " then

                local kptarget2 = m:sub(4)

                ct(";kp "..kptarget2)

            elseif m:lower() == "kp" or m:lower() == prefix.."kp" then

                ct("kp me")

            end

            -- Icebreaker

            if m:sub(1, #prefix + 5) == prefix.."subz " then

                local subztarget = m:sub(#prefix + 6)

                for _, v in ipairs(subzeroids) do

                    ct("gear "..subztarget.." "..v)

                end

            elseif m:sub(1,5) == "subz " then

                local subztarget2 = m:sub(6)

                ct(";subz "..subztarget2)

            elseif m:lower() == prefix.."subz" or m:lower() == "subz" then

                ct("subz me")

            end

            ----

        end
    end)
end

-- Setup

for _, plr in pairs(game.Players:GetPlayers()) do
    heplr(plr)
end

game.Players.PlayerAdded:Connect(function(addedplr)

    heplr(addedplr)
    adplr()

end)

----

-- Actions

local gearban = coroutine.wrap(function()

    if gb then

        for _, v in pairs(game.Players:GetPlayers()) do

            if v.Backpack:GetChildren() > 0 and v.Name ~= whitelist and v ~= game.Players.LocalPlayer then

                ct("ungear "..v.Name)

            end

        end

    end

end)

gearban()

local nokill = coroutine.wrap(function()

    while task.wait() do

        if antikill then

            if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then

                ct("re")
                ct("unseizure me")

            end

        end

    end

end)

for _, Bricks in pairs(game:GetService("Workspace").Terrain._Game.Workspace.Obby:GetChildren()) do
        Bricks.CanTouch = false
end
-- Credits to dizzy for making this

nokill()

while true do

if not game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild(game.Players.LocalPlayer.Name .. "'s admin") then
            if game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin") then
                local pad = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head")
                local padCFrame = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head").CFrame
                task.wait()
                pad.CanCollide = false
                repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                pad.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                task.wait()
                pad.CFrame = padCFrame
                pad.CanCollide = true
          else
                fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector, 0)
end
            end

task.wait()
end

-- Credits to dizzy he made this code(mine didnt work properly)

----

-- Autoexecute
wait(3)
h("\n\n\n The SimpleKAH V2 script has loaded - the owner is "..tostring(ScrOwner).."\n\n\n")
