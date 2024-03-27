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
local Mouse = LocalPlayer:GetMouse()
local Terrain = workspace.Terrain
local KAHGameFolder = Terrain:FindFirstChild("_Game")
local KAHWorkspace = KAHGameFolder:FindFirstChild("Workspace")
local KAHAdmin = KAHGameFolder:FindFirstChild("Admin")
local KAHInstances = KAHGameFolder:FindFirstChild("Folder")
local RunService = game:GetService('RunService')
local UIS = game:GetService("UserInputService")

vismode = 0
visradius = 20
visamt = 20
visorbiter = LocalPlayer.Character.HumanoidRootPart.CFrame
viscolor = 50
viscolor2 = 100
viscolor3 = 150

partColorer = Instance.new("Part")
partColorer.Color = Color3.new(1,1,1)

selectedColor = partColorer.Color
brushSize = 1

drawState = false

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

local function roundNumber(num, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
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

   	   if string.sub(msg:lower(), 1, #vprefix + 4) == vprefix.."draw" then
           	drawState = true; draw()
		Remind("Setting...")
      	   end

   	   if string.sub(msg:lower(), 1, #vprefix + 6) == vprefix.."undraw" then
           	drawState = false; draw()
		Remind("Closed!");Chat('clr')
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
		Remind("Closed!")
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
	print("cmds visual unvis vismode [args1] viscolors [arg1] [args2] [args3]")
	print("draw undraw")
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
                --sethiddenproperty(child, "NetworkIstask.waiting", false)

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

function draw()
	if drawState == false then
            for _,connection in pairs(Connections.Drawing) do
                if typeof(connection) == "RBXScriptConnection" then
                    connection:Disconnect()
                end
            end
            return 
        end

        local mouseDown = false
        local debounce = false
        local currentPosition
        local lastMousePos
        local currentPart
        local mouseTarget 
        local paintBucket

        

        Mouse.TargetFilter = KAHInstances

        Connections.Drawing.InstancesAdded = {}
        


        local sizeL
        local oriL
        local positionL
        local colorL
        local nextPart = false

        Connections.Drawing["InstanceAdded"] = KAHInstances.ChildAdded:Connect(function(Child)
            local size,position,color,ori = sizeL,positionL, colorL, oriL
            nextPart = true
            if Child:IsA("Part") and Child.Name == "Part" and (roundNumber(Child.Size.X, 3) == size.X) and (roundNumber(Child.Size.Y, 3) == size.Y) and (roundNumber(Child.Size.Z, 3) == size.Z) then
                
                ----sethiddenproperty(Child, "NetworkOwnershipRule", Enum.NetworkOwnership.Manual)

                local s = Instance.new("ForceField", Child)
                s.Visible = false
            
                task.spawn(personColor, PB, Child, color)

                --sethiddenproperty(Child, "NetworkIstask.waiting", false)
                
                Child.CanCollide = false
                Child.CanQuery = false
                Child.CanTouch = false
                Child.Massless = true
    
                local partStay  

                partStay = RunService.Heartbeat:Connect(function()
                    Child.Velocity = Vector3.new(54,34,1)
                    Child.AssemblyLinearVelocity = Vector3.new(54,34,1)
                    Child.AssemblyAngularVelocity = Vector3.new(54,34,1)
                    Child:ApplyImpulse(Vector3.new(54,34,1))
                    Child.CFrame = position
                    Child.Orientation = ori
                end)

                local B
                B = RunService.Heartbeat:Connect(function()
                    if Child.Parent ~= KAHInstances then
                        partStay:Disconnect()
                        B:Disconnect()
                    end
                end)
            end
        end)

        local function draw(positionG, sizeG, oriG, colorG)
            nextPart = false
            sizeL = sizeG
            oriL = oriG
            colorL = colorG
            positionL = positionG
            task.spawn(Chat, "part/" .. sizeG.X .. "/" .. sizeG.Y .. "/" .. sizeG.Z)
            repeat task.wait() until nextPart
        end

        task.spawn(function()
            while drawState do
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

        Connections.Drawing["netKeep"] = Players.PlayerAdded:Connect(function(player)
            local char = player.Character or player.CharacterAdded:Wait()
            local nm = player:GetAttribute("fixName")
            if not nm then
                repeat task.wait() until player:GetAttribute("fixName")
                nm = player:GetAttribute("fixName")
            end

            Chat("setgrav " .. nm .. " 10000000000000000") 
	    Chat("punish " .. nm)
	    Chat("unpunish " .. nm)
            for _,v in pairs(KAHInstances:GetChildren()) do
                if v.Name == "Part" and v:IsA("Part") then
                    v.Anchored = false
                    task.delay(1.5, function()
                        --v.Anchored = true
                    end)
                end
            end
        end)
        
        Connections.Drawing["mouseMove"] = Mouse.Move:Connect(function()
            --[[if lastMousePos then
                if (math.abs(UIS:GetMouseLocation().X - lastMousePos.X) < brushSize * 4) and (math.abs(UIS:GetMouseLocation().Y - lastMousePos.Y) < brushSize * 4) then
                    return
                end
            end]]

            lastMousePos = UIS:GetMouseLocation()

            if debounce then return end
            
            if not drawState then
                Connections.Drawing["mouseMove"]:Disconnect()
                return
            end

            if mouseDown then
                debounce = true
                draw(Mouse.Hit, Vector3.new(brushSize, brushSize, brushSize), Vector3.new(0,0,0), selectedColor)
                task.wait(.005)
                debounce = false
            end
        end)

        Connections.Drawing["buttonDown"] = Mouse.Button1Down:Connect(function()
            if not drawState then
                Connections.Drawing["buttonDown"]:Disconnect()
                return
            end
            mouseDown = true
            draw(Mouse.Hit, Vector3.new(brushSize, brushSize, brushSize), Vector3.new(0,0,0), selectedColor)
        end)

        Connections.Drawing["buttonUp"] = Mouse.Button1Up:Connect(function()
            if not drawState then
                Connections.Drawing["buttonUp"]:Disconnect()
                return
            end
            mouseDown = false
        end)
end
