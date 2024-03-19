-- My Visualiser.lua --
-- shitty i know --

-- FUNCTION SET UP --
local function Remind(msg)
	game.StarterGui:SetCore("SendNotification", {
		Title = "MyVisualiser.lua",
		Text = msg,
		Duration = 1
	})
end;

local function Chat(msg)
        game.Players:Chat(msg)
end

local vprefix = "-"

-- INPUTS --
print("--- MyVisualiser.lua executed! Created by quivings, ported by S_P ---")
Remind(" MyVisualiser.lua executed! Created by quivings, ported by S_P ")
Chat("h \n\n\n [MyVisualiser.lua]: Executed! \n\n\n")

-- VARIABLES --

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Terrain = workspace.Terrain
local KAHGameFolder = Terrain:FindFirstChild("_Game")
local KAHWorkspace = KAHGameFolder:FindFirstChild("Workspace")
local KAHAdmin = KAHGameFolder:FindFirstChild("Admin")
local KAHInstances = KAHGameFolder:FindFirstChild("Folder")
local RunService = game:GetService('RunService')

local vismode = 0
local visradius = 20
local visamt = 20
local visorbiter = LocalPlayer.Character.HumanoidRootPart.CFrame
viscolor = 50
viscolor2 = 100
viscolor3 = 150

local function personColor(PB, part, color)
    if not PB then
        repeat task.wait() until LocalPlayer.Character:FindFirstChild("PaintBucket")
        PB = LocalPlayer.Character:FindFirstChild("PaintBucket")
    end
    repeat task.wait() until PB:FindFirstChild("Remotes") and PB:FindFirstChild("Remotes"):FindFirstChild("ServerControls")
    
	local Arguments = {
		["Part"] = part,
		["Color"] = Color3.new(color.R,color.G,color.B)
	}
	PB:WaitForChild("Remotes"):WaitForChild("ServerControls"):InvokeServer("PaintPart", Arguments)
end

local Connections = {
    Building = {},
    Drawing = {},
}

local SkipEvent = Instance.new("BindableEvent")
local StopEvent = Instance.new("BindableEvent")
local VisBindable = Instance.new("BindableEvent")

-- COMMAND HUB --
game.Players.LocalPlayer.Chatted:Connect(function(msg)
	   task.wait(0)
		
    	   if string.sub(msg:lower(), 1, #vprefix + 4) == vprefix.."cmds" then
           	CMDPrint()
	   	Remind("Check your console by running /console!")
      	   end
		
    	   if string.sub(msg:lower(), 1, #vprefix + 6) == vprefix.."visual" then
           	visc()
		Remind("Setting...")
      	   end

	   if string.sub(msg:lower(), 1, #vprefix + 5) == vprefix.."unvis" then
           	vis.Parent = nil
                kahcon:Disconnect()

                vis:Destroy()
                Chat('clr')
                if Connections["netKeepvis"] then
                    Connections["netKeepvis"]:Disconnect()
                    Connections["netKeepvis"] = nil
                end

                conn:Disconnect()
                conn2:Disconnect()
		Remind("Closed!")
      	   end
		
    	   if string.sub(msg:lower(), 1, #vprefix + 6) == vprefix.."visrad" then
           	visradius = tonumber(string.sub(msg:lower(), #vprefix + 8))
		Remind("Radius changed")
      	   end

    	   if string.sub(msg:lower(), 1, #vprefix + 7) == vprefix.."vismode" then
           	vismode = tonumber(string.sub(msg:lower(), #vprefix + 9))
		Remind("Mode changed")
      	   end

    	   if string.sub(msg:lower(), 1, #vprefix + 9) == vprefix.."viscolors" then
		local args = string.split(msg, " ")
	        viscolor = args[2]
		viscolor2 = args[3]
		viscolor3 = args[4]
		Remind("Colours changed")
      	   end
end)

-- COMMAND LIST ---
function CMDPrint()
	print("cmds visual unvis visrad [args1] vismode [args1] viscolors [arg1] [args2] [args3]")
	print("prefix is a dash")
end

function visc()
        vis = Instance.new("Folder", workspace)
        local currentSong = KAHInstances:FindFirstChild("Sound") or nil
        local orbiter = LocalPlayer

        local paintBucket

        kahcon =

        task.spawn(function()
            while vis.Parent == workspace do
                task.wait(.5)
                if not paintBucket or (paintBucket.Parent ~= LocalPlayer.Character and paintBucket.Parent ~= LocalPlayer.Backpack) then
                    Chat('gear me 18474459')
                    paintBucket = LocalPlayer.Backpack:WaitForChild("PaintBucket")
                    paintBucket:FindFirstChildOfClass("LocalScript").Disabled = true
                    task.wait()
                    paintBucket.Parent = LocalPlayer.Character 
                end
            end
        end)

        kahcon = KAHInstances.ChildAdded:Connect(function(child)
            if child:IsA("Sound") and child.Name == "Sound" and child.SoundId ~= "" and child.SoundId ~= nil then
                currentSong = child
            end
            if child:IsA("Part") and child.Size == Vector3.new(4,1.2,2) then

                task.wait()
                child.Parent = vis
                child.CanCollide = false
                child.CanTouch = false
                child.Massless = true
                --sethiddenproperty(child, "NetworkIsSleeping", false)

                task.spawn(function()
                    child.Velocity = Vector3.new(54,34,0)
                end)
            end
        end)

        for i = 1,visamt do
            task.wait()
            Chat('part/4/1.2/2')
        end

        repeat task.wait() 
            
        until #vis:GetChildren() >= visamt

        local oldPos = {}
        local angle = 0
        local spin = 0
        local radius = visradius
        local speed = 0.01
        local axis = "y"
        local Mode = vismode
        local rotpart = Instance.new("Part")
        local waves = false
        

        Connections["netKeepvis"] = Players.PlayerAdded:Connect(function(player)
            local char = player.Character or player.CharacterAdded:Wait()
            local nm = player:GetAttribute("fixName")
            if not nm then
                repeat task.wait() until player:GetAttribute("fixName")
                nm = player:GetAttribute("fixName")
            end

            Chat("setgrav " .. nm .. " 10000000000000000")
	    Chat("punish " .. nm)
	    Chat("unpunish " .. nm)
        end)
	
        conn =
        conn0        
       
        task.spawn(function()
            local lastpbl = 0
            while vis.Parent == workspace do
                task.wait(.1)
                local pbl = currentSong and currentSong.PlaybackLoudness * 2 or 0
                lastpbl = pbl
                for _,v in pairs(vis:GetChildren()) do
                    task.spawn(function()
                        if pbl == 0 or pbl < 1 then
                            task.spawn(personColor, paintBucket, v, Color3.fromRGB(viscolor,viscolor2,viscolor3 * 255))
                        else
                            task.spawn(personColor, paintBucket, v, Color3.fromRGB(viscolor * 255,(viscolor3 * 255) - (pbl * 1.05),(viscolor2 * 255) - (pbl * 1.05)))
                        end
                    end)
                end
                if #vis:GetChildren() < visamt then
                    task.spawn(function()
                        task.wait(.1)
                        Chat("part/4/1.2/2")
                    end)  
                end
            end
        end)

        local function VectorFromSettings(angle,str)
            if str=="x" then
                return Vector3.new(angle,0,0)
            elseif str=="y" then
                return Vector3.new(0,angle,0)
            elseif str=="z" then
                return Vector3.new(0,0,angle)
            end
        end
        
        local woah = 0
        local wave = 1
        local a = 1

      --[[  RunService.Heartbeat:Connect(function()
            for _,v in pairs(vis:GetChildren()) do
                if gethiddenproperty(v, "ReceiveAge") > 0 then
                    v.Parent = KAHInstances
                end
            end
        end)]]

        conn = game:GetService("RunService").Heartbeat:Connect(function(dt)
	    visorbiter = LocalPlayer
            local pbl = currentSong and currentSong.PlaybackLoudness * 2 or 0
            
            
            if vismode == 0 then
                for _,v in pairs(vis:GetChildren()) do
                    if spin >= 360 then
                        spin = 0
                    end
                    local iter = math.rad(spin+(_*(360/#vis:GetChildren())))
                    local z = visradius + pbl/ (1 ~= 100 and (100 - 1) or .01)
                    local g = pbl / (35 ~= 100 and (100-35) or .01)
                    local p = CFrame.new(typeof(visorbiter) == "CFrame" and visorbiter.X or visorbiter.Character.HumanoidRootPart.CFrame.X,typeof(visorbiter) == "CFrame" and visorbiter.Y or visorbiter.Character.HumanoidRootPart.CFrame.Y,typeof(visorbiter) == "CFrame" and visorbiter.Z or visorbiter.Character.HumanoidRootPart.CFrame.Z) * CFrame.Angles(axis == "x" and iter or 0, axis == "y" and iter or 0, axis == "z" and iter or 0) * CFrame.new(0,0,z)
                    local AddVector = Vector3.new(0,0,0)
    
                    if waves then     
                        AddVector = VectorFromSettings(math.sin((((dt*0)+(_/#vis:GetChildren())*(math.pi*2)))), axis)
                    end
    
                    v.CFrame = p+AddVector
                    rotpart.CFrame = CFrame.new(v.Position, typeof(visorbiter) == "CFrame" and visorbiter.p + Vector3.new(0,g,0) or visorbiter.Character.HumanoidRootPart.Position + Vector3.new(0,g,0))
                    v.Rotation = rotpart.Rotation 
                    spin += speed
                end 
            end

            if vismode == 1 then

                for _,v in pairs(vis:GetChildren()) do
                    local ro = math.rad(a / 2 * _ + (_ * (360 / #vis:GetChildren())))
                    local vector = math.sin((a/#vis:GetChildren()/4 * _),0)
                    local uh = math.sin(woah+(_+_*(0/#vis:GetChildren()))*(math.pi), 0)
                    local F = CFrame.new(typeof(visorbiter) == "CFrame" and visorbiter.p or visorbiter.Character:WaitForChild("Torso").Position) * CFrame.Angles(0, ro/4, 0) * CFrame.new((pbl/ (1 ~= 100 and (100 - 1) or .01))+visradius, 0, (_+(_/#vis:GetChildren()/2)))

                    v.CFrame = F+Vector3.new(0,0,0)

                    a += speed / 2.5
                    woah += speed/#vis:GetChildren()/8
                    wave += 1
                end
            end

            if vismode == 2 then
                for _,v in pairs(vis:GetChildren()) do
                    local ro = math.rad(a / 2 * _ + (_ * (360 / #vis:GetChildren())))
                    local vector = math.sin((a/#vis:GetChildren()/4 * _),0)
                    local uh = math.sin(woah+(_+_*(0/#vis:GetChildren()))*(math.pi), 0)
                    local F = CFrame.new(typeof(visorbiter) == "CFrame" and visorbiter.p or visorbiter.Character:WaitForChild("Torso").Position) * CFrame.Angles(0, ro/4, 0) * CFrame.new((pbl/ (1 ~= 100 and (100 - 1) or .01))+visradius, (_+(_/#vis:GetChildren()/2))/1.5, (_+(_/#vis:GetChildren()/2)))

                    v.CFrame = F+Vector3.new(0,0,0)

                    a += speed / 2.5
                    woah += speed/#vis:GetChildren()/8
                    wave += 1


                end
            end

            if vismode == 3 then
                for _,v in pairs(vis:GetChildren()) do
                    local ro = math.rad(a / 2 * _ + (_ * (360 / #vis:GetChildren())))
                    local vector = math.sin((a/#vis:GetChildren()/4 * _),0)
                    local uh = math.sin(woah+(_+_*(0/#vis:GetChildren()))*(math.pi), 0)
                    local F = CFrame.new(typeof(visorbiter) == "CFrame" and visorbiter.p or visorbiter.Character:WaitForChild("Torso").Position) * CFrame.Angles(uh*5, uh*5+ro, 0) * CFrame.new(uh*5+(pbl/ (1 ~= 100 and (100 - 1) or .01))+visradius, 0, 0)
                    
                    v.CFrame = F+Vector3.new(0,0,0)

                    a+= speed /2.5
                    woah += speed/#vis:GetChildren()/8
                    wave += 1
                end
            end

            if vismode == 4 then
                for _,v in pairs(vis:GetChildren()) do
                    local ro = math.rad(a/2 + (_*(360/#vis:GetChildren())))
                    local uh = math.sin(woah+(_+_*(0/#vis:GetChildren()))*(math.pi), 0)
                    local F = CFrame.new(typeof(visorbiter) == "CFrame" and visorbiter.p or visorbiter.Character:WaitForChild("Torso").Position)*CFrame.Angles(0, ro, 0)*CFrame.new(0, 0, uh*5+(pbl/ (1 ~= 100 and (100 - 1) or .01))+visradius)
                    

                    v.CFrame = F+Vector3.new(0,vector,0)

                    woah = woah + speed/#vis:GetChildren()/8
                    a = a+speed/2.5
                end
            end
        end)

end
