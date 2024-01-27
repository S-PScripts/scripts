print("Crash X booted.")

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

PadCheck = true
GetPad()
