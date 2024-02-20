local function heplr(player)
-- ---Variables---
-- Modes
local gojo = false
-- Other
local plers = game.Players:GetPlayers()
local plrs = game:GetService("Players")
local pler = game.Players.LocalPlayer
local cam = game.Workspace.Camera
local chr = pler.Character or pler.CharacterAdded:Wait()
local humanoid = chr:WaitForChild("Humanoid")
local hrpart = chr:WaitForChild("HumanoidRootPart")
local ispam = false
local delay = 0.1
local antijail = false
local autogod = true
local antipunish = true
local antideath = true
local anticrash = true
local autoff = true
local antiabusers = true
local protection = true
local plrname = player.Name
local owner = ("asechka19872")
local antiattach = true
local dncycle = false
local gjdelock = false
local atpkick = true
local tripmineesp = true
-- -Tables-
local whitelist = {"asechka19872"}
local abusers = {}
local blacklist = {}
local bgears = {"VampireVanquisher"}
-- ---Functions---
-- ---If Statements---
    if game.ReplicatedStorage:FindFirstChild("WeaponsSystem") then
        game.Players:Chat("h/\n\n\n\n Found broken camera!!(This feature is still experimental)")
    end
--- ---Custom Commands---
    player.Chatted:Connect(function(msg)
        if msg:lower() == "antiattach" and player == game.Players.Localplayer then
            antiattach = true
        elseif msg:lower() == "unantiattach" and player == game.Players.LocalPlayer then
            antiattach = false
        end
        if msg:sub(1,9) == "unpunish " and player ~= game.Players.LocalPlayer and antiattach and not msg:lower() == "unpunish me" then
            local upushed = msg:sub(10)
            game.Players:Chat("reset " .. tostring(player))
            game.Players:Chat("reset " .. upushed)
            game.Players:Chat("pm " .. tostring(player) .. " Attach is not allowed currently on this server [FakeLite]")
        elseif msg:lower() == "unpunish me" and antiattach and player ~= game.Players.LocalPlayer then
            game.Players:Chat("reset " .. tostring(player))
            game.Players:Chat("pm " .. tostring(player) ..  " Attach is not allowed currently on this server [FakeLite]")
        end
        if player == game.Players.LocalPlayer then
            if msg:lower() == "re" then
                game.Players:Chat("reset me")
            end
            
            if msg:lower() == "dncycle" then
                local dntime = 7
                local decdn = 0
                dncycle = true
                while dncycle do
                    wait(0.1)
                    for i = 1,24 do
                        for i = 1,59 do
                            wait(0.1)
                            decdn = decdn + 1
                            game.Players:Chat("time " .. dntime .. ":".. decdn)
                        end
                        decdn = decdn - 59
                        dntime = dntime + 1
                    end
                    dntime = 0
                end
            elseif msg:lower() == "dncycle off" then
                dncycle = false
            end
            if msg:lower() == "remove wall" then
                game.Players:Chat("unpunish me")
                game.Players:Chat("skydive me")
                game.Players:Chat("respawn me")
            end
            if msg:lower() == "simple vg" then
                game.Players:Chat("spam gear all 94794847")
                game.Players:Chat("spam unsize all")
            end
            if msg:lower() == "anticrash" then
                anticrash = true
                while anticrash do
                    wait(0.1)
                    for crasher in pairs(game.Players:GetPlayers()) do
                        local plrbackpack = crasher.Backpack
                        if plrbackpack:FindFirstChild("VampireVanquisher") then
                            game.Players:Chat("ungear " .. crasher.Name)
                            game.Players:Chat("respawn " .. crasher.Name)
                        end
                    end
                end
            if msg:lower() == "simple vg" then
                game.Players:Chat("spam gear me 94794847")
                game.Players:Chat("spam unsize me")
            end
            elseif msg:lower() == "unanticrash" then
                anticrash = false
            end
            if msg:sub(1,7) == ";vibes " then
                game.Players:Chat(";vrtx")
                if msg:sub(8) == "1" then
                    game.Players:Chat("music 1840667470")
                game.Players:Chat("h Now playing Warm And Tender(A)")
                end
                if msg:sub(8) == "2" or msg:sub(8) == "taco" then
                    game.Players:Chat("music 142376088")
                    game.Players:Chat("h/\n\n\n\n ITS RAINING TACOS!!")
                end
                if msg:sub(8) == "fnaf" or msg:sub(8) == "3" then
                    game.Players:Chat("music 6913550990")
                    game.Players:Chat("h/\n\n\n\n\n\n\n\n I always come back!!!")
                end
            end
           if msg:lower() == "restard avoid" then
               atpkick = true
               while atpkick do
                   wait(0.1)
                   if game.Players:FindFirstChild("atprog") or game.Players:FindFirstChild("G_Odt") then
                       game:Shutdown()
                    end
                end
            end
            if msg:lower() == "antiabusers" then
                antiabusers = true
                while antiabusers do
                    wait(0.1)
                    if game.Players:FindFirstChild("SlenderMan990921") then
                        game.Players:Chat("h Found slender, Wait until leaves.")
                        game.Players:Chat(";s punish all")
                        game.Players:Chat(";s fix")
                        game.Players:Chat(";s clr")
                    end
                end
            elseif msg:lower() == "unantiabusers"  then
                antiabusers = false
            end
            if msg:lower() == "auff" then
                autoff = true
                while autoff do
                    wait(2)
                    if not game.Workspace.asechka19872:FindFirstChild("ForceField") then
                        game.Players:Chat("ff me")
                    end
                end
            elseif msg:lower() == "unauff" then
                autoff = false
            end
            if msg:sub(1,5) == ";sup " then
                local supercmd = msg:sub(6)
                for i = 1,200 do
                    game.Players:Chat(supercmd)
                end
            end
            if msg:lower() == "tripmineesp" then
                tripmineesp = true
                local sbspace = workspace.SubspaceTripmine
                if game.Workspace:FindFirstChild("SubspaceTripmine") then
                    while tripmineesp do
                        sbspace.Transparency = 0
                    end
                end
            end
            -- -Meteor
            if msg:lower() == ";meteor" then
                for i = 1, 5 do
                    game.Players:Chat("skydive me")
                end
                for i = 1, 200 do
                    game.Players:Chat("part/10/10/10")
                end
                wait(1)
                game.Players:Chat("respawn me")
            end
            -- -Rtx
            if msg:lower() == ";rtx" then
                game.Players:Chat("fix")
                game.Players:Chat("time 7")
                game.Players:Chat("fogend 2000")
                game.Players:Chat("outdoorambient 0.3 0.3 0.3")
            elseif msg:lower() == ";vrtx" then
                game.Players:Chat("fogcolor 100 0 255")
                game.Players:Chat("fogend 1000")
                game.Players:Chat("time 6")
                game.Players:Chat("outdoorambient 0 0 0")
                game.Players:Chat("brightness 0.5")
                game.Players:Chat("ambient 125 0 255")
            end
            if msg:sub(1,6) == ";nono " then
                local nub = msg:sub(7)
                game.Players:Chat("tp " .. "me ".. nub)
                game.Players:Chat("stun " .. nub)
                game.Players:Chat("iyc bang 1 999")
            end
            if msg:sub(1,3) == "to " then
                local toplr = msg:sub(4)
                game.Players:Chat("tp me " .. toplr)
            end
            if msg:sub(1,6) == "bring " then
                local brought = msg:sub(7)
                game.Players:Chat("tp " .. brought .. " me")
            end
            -- ---Gears
            if msg:sub(1,7) == "bhbomb " then
                local bhbomber = msg:sub(8)
                game.Players:Chat("gear " .. bhbomber .. " 28277486")
            elseif msg:lower() == "bhbomb" then
                game.Players:Chat("bhbomb me")
            end
            if msg:lower() == "tictac" then
                game.Players:Chat("gear me 16924676")
            end
            if msg:sub(1,10) == "admslayer " then
                local ADMslayer = msg:sub(11)
                game.Players:Chat("gear " .. ADMslayer .. " 268586231")
                game.Players:Chat("gear " .. ADMslayer .. " 1103011681")
            elseif msg:lower() == "admslayer" then
                game.Players:Chat("admslayer me")
            end
            if msg:sub(1,3) == "kp " then
                local kpplr =  msg:sub(1,4)
                game.Players:Chat("gear " .. kpplr .. " 583030187")
                game.Players:Chat("gear " .. kpplr .. " 68539623")
            elseif msg:lower() == "kp" then
                game.Players:Chat("gear me 583030187")
                game.Players:Chat("gear me 68539623")
            end
            if msg:sub(1,5) == "pgun " then
                pgplr = msg:sub(6)
                game.Players:Chat("gear " .. pgplr .. " 34870758")
            elseif msg:lower() == "pgun" then
                game.Players:Chat("gear me 34870758")
            end
            if msg:sub(1,11) == "icebreaker " then
                szplr = msg:sub(12)
                game.Players:Chat("gear " .. szplr .. " 87361662")
                game.Players:Chat("gear " .. szplr .. " 66896601")
            elseif msg:lower() == "icebreaker" then
                game.Players:Chat("icebreaker me")
            end
            if msg:sub(1,9) == "trapmine " then
                trplr = msg:sub(10)
                game.Players:Chat("gear " .. trplr .. " 11999247")
                game.Players:Chat("gear " .. trplr .. " 11999247")
                game.Players:Chat("gear " .. trplr .. " 11999247")
             
            elseif msg:lower() == "trapmine" then
                game.Players:Chat("trapmine me")
            end
            if msg:sub(1,9) == "camfixer " then
                local cmfplr = msg:sub(10)
                game.Players:Chat("gear " .. cmfplr .. " 79736563")
            elseif msg:lower() == "camfixer" then
                game.Players:Chat("camfixer me")
            end
            if msg:sub(1,7) == "painter " then
                painter = msg:sub(8)
                game.Players:Chat("gear " .. painter .. " 18474459")
            elseif msg:lower() == "painter" then
                game.Players:Chat("painter me")
            end
            if msg:sub(1,7) == "perias " then
                local peria = msg:sub(8)
                game.Players:Chat("gear " .. peria .. " 159229806")
                game.Players:Chat("gear " .. peria .. " 80597060")
                game.Players:Chat("gear " .. peria .. " 93136802")
                game.Players:Chat("gear " .. peria .. " 2544549379")
                game.Players:Chat("gear " .. peria .. " 139577901")
                game.Players:Chat("gear " .. peria .. " 69499437")
                game.Players:Chat("gear " .. peria .. " 73829193")
                game.Players:Chat("gear " .. peria .. " 233520257")
                game.Players:Chat("gear " .. peria .. " 80661504")
                game.Players:Chat("gear " .. peria .. " 120307951")
                game.Players:Chat("gear " .. peria .. " 99119240")
                game.Players:Chat("gear " .. peria .. " 108158379")
            elseif msg:lower() == "perias" then
                game.Players:Chat("perias me")
            end
            if msg:sub(1,10) == "timegears " then 
                local timeplr = msg:sub(11)
                game.Players:Chat("gear " .. timeplr .. " 77443461")
                game.Players:Chat("gear " .. timeplr .. " 77443491")
            elseif msg:lower() == "timegears" then
                game.Players:Chat("gear me 77443461")
                game.Players:Chat("gear me 77443491")
            end
            if msg:sub(1,8) == "telamon " then
                telplr = msg:sub(9)
                game.Players:Chat("gear " .. telplr .. " 93136746")
            elseif msg:lower() == "telamon" then
                game.Players:Chat("telamon me")
            end
            -- ---Special Chars/modes
                if msg:lower() == "mode!gojo" then
                    gojo = true
                end
                if msg:lower() == "purple" then
                    local gjpfgend = 0
                    local gjbpfgcl = 0
                    local gjgpfgcl = 0
                    local gjrpfgcl = 200
                    local time = 10
                    if gojo then
                        game.Players:Chat("h Red glow")
                        game.Players:Chat("fogcolor 200 0 0")
                        game.Players:Chat("outdoorambient 0 0 0")
                        game.Players:Chat("time " .. time)
                        for i = 1,10 do
                            wait(0.2)
                            gjpfgend = gjpfgend + 100
                            game.Players:Chat("fogend " .. gjpfgend)
                        end
                        game.Players:Chat("h Blue glow")
                        for i = 1,10 do
                            wait(0.3)
                            time = time - 0.4
                            game.Players:Chat("time " .. time)
                            gjpfgend = gjpfgend - 50
                            game.Players:Chat("fogend " .. gjpfgend)
                            gjbpfgcl = gjbpfgcl + 20
                            game.Players:Chat("fogcolor " .. "200 " .. "0 " .. gjbpfgcl)
                        end
                        game.Players:Chat("h Hollow Purple")
                        game.Players:Chat("speed others inf")
                        for i = 1,10 do
                            wait(0.2)
                            gjrpfgcl = gjrpfgcl + 5.5
                            gjbpfgcl = gjbpfgcl + 5.5
                            gjgpfgcl = gjgpfgcl + 25.5
                            gjpfgend = gjpfgend + 150
                            time = time + 0.1
                            game.Players:Chat("fogcolor " .. gjrpfgcl .. " " .. gjgpfgcl .. " " .. gjbpfgcl)
                            game.Players:Chat("fogend " .. gjpfgend)
                            game.Players:Chat("time " .. time)
                        end
                    end

                elseif msg:lower() == "domain expansion: infinity void" then
                    if gojo then
                        game.Players:Chat("h Domain Expansion: Infinity Void")
                        
                        local gjdeivfgend = 2000
                        local gjdeivrfgcl = 255
                        local gjdeivgfgcl = 255
                        local gjdeivbfgcl = 255
                        time = 7
                        game.Players:Chat(";rtx")
                        for i = 1,100 do
                            wait(0.1)
                            gjdeivfgend = gjdeivfgend - 19
                            gjdeivrfgcl = gjdeivrfgcl - 2.55
                            gjdeivgfgcl = gjdeivgfgcl - 2.55
                            gjdeivbfgcl = gjdeivbfgcl - 2.55
                            time = time - 0.01
                            game.Players:Chat("fogend " .. gjdeivfgend)
                            game.Players:Chat("fogcolor " .. gjdeivrfgcl .. " " .. gjdeivgfgcl .. " " .. gjdeivbfgcl)
                            game.Players:Chat("time " .. time)
                        end
                        gjdelock = true
                        while gjdelock do
                            wait(0.1)
                            game.Players:Chat("speed others 0")
                            game.Players:Chat("unfly others")
                            game.Players:Chat("pm/others/You entered my domain, So please wait until the user decides to close it.")
                            game.Players:Chat("time 6")
                            game.Players:Chat("fogend 500")
                            game.Players:Chat("fogcolor 0 0 0")
                            game.Players:Chat("speed me 30")
                        end
                    end
                elseif msg:lower() == "let go" then
                    gjdelock = false
                    game.Players:Chat("speed others 16")
                    game.Players:Chat(";rtx")
                end
            -- ---Basic Chars
            if msg:sub(1,6) == "sierr " then
                local fsierr = msg:sub(7)
                game.Players:Chat("char " .. fsierr .. " 1267527674")
                wait(0.2)
                game.Players:Chat("name " .. fsierr .. " sierr")
                game.Players:Chat("camfixer " .. fsierr)
            end
            if msg:sub(1,6) == "telac " then
                ftel = msg:sub(7)
                game.Players:Chat("char me 13645")
                wait(0.2)
                game.Players:Chat("camfixer " .. ftel)
                game.Players:Chat("telamon " .. ftel)
                game.Players:Chat("name " .. ftel .. " Telamon")
            end
            if msg:sub(1,8) == "epicszs " then
                local fepics = msg:sub(9)
                game.Players:Chat("char " .. fepics .. " 548456077")
                game.Players:Chat("name " .. fepics .. " epicszs")
                game.Players:Chat("camfixer " .. fepics)
            end
            if msg:sub(1,5) == "temi " then
                local ftemi = msg:sub(6)
                game.Players:Chat("char " .. ftemi .. " 45024180")
                game.Players:Chat("name ".. ftemi .. " Temi")
                game.Players:Chat("camfixer " .. ftemi)
            end
            if msg:sub(1,5) == "seek " then
                fsek = msg:sub(6)
                game.Players:Chat("char " .. fsek .. " 1593471275")
                wait(1.5)
                game.Players:Chat("name " .. fsek .. " Seek")
                game.Players:Chat("kp " .. fsek)
                game.Players:Chat("camfixer " .. fsek)
            end
        end
    end)
end

-- ---Initial Setup---
for _, player in pairs(game.Players:GetPlayers()) do
    heplr(player)
end

game.Players.PlayerAdded:Connect(function(player)
    heplr(player)
end)
-- ---AutoExec---

game.Players:Chat(";rtx")
for i = 1,5 do
    wait(1)
    game.Players:Chat("h \n\n\n\n\n\n\n\n FakeLite Loaded!")
end
game.Players:Chat("auff")
game.Players:Chat("antiabusers")
game.Players:Chat("restard avoid")
