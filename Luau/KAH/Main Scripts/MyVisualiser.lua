-- kozy you retard go ask quiving about his horrible vis






-- My Visualiser.lua --
-- yes this is quiving's will be changed at some point yk h --

-- FUNCTION SET UP --
local function Remind(msg)
	game.StarterGui:SetCore("SendNotification", {
		Title = "MyVisualiser.lua",
		Text = msg,
		Duration = 1
	})
end;

if _G.visexecuted then 
	return 
	Remind("You've already executed MyVisualiser.lua!") 
end

_G.visexecuted = true

local function Chat(msg)
        game.Players:Chat(msg)
end

function PLAYERCHECK(plr)
  for i, v in pairs(game.Players:GetPlayers()) do
      if string.sub(v.Name:lower(), 1, #plr) == plr:lower() then
          player = v.Name
	  cplr = v
          Remind("[debug]: Found "..player)
      end
  end
end

local vprefix = "-"

-- INPUTS --
print("--- MyVisualiser.lua executed! Created by quivings, ported by S_P ---")
Remind(" MyVisualiser.lua executed! Created by quivings, ported by S_P ")
--Chat("h \n\n\n [MyVisualiser.lua]: Executed! \n\n\n")

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

local Toggles = {
VisAmt = 20,
VisMode = 0,
VisColor = Color3.new(255,255,255),
VisSize = {s1 = 4, s2 = 1.2, s3 = 2},
VisRadius = 20,
VisOrbiter = LocalPlayer
}

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

   	  if string.sub(msg:lower(), 1, #vprefix + 7) == vprefix.."vprefix" then
           	  vprefix = string.sub(msg:lower(), #vprefix + 9)
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
		Remind("Closed!")
      	  end

    	  if string.sub(msg:lower(), 1, #vprefix + 7) == vprefix.."vismode" then
           	vism = tonumber(string.sub(msg:lower(), #vprefix + 9))
		if vism ~= nil and vism > -1 and vism < 5 then 
			Toggles.VisMode = vism
			Remind("Mode changed")
		else
			Remind("Invalid mode (0 to 4)")
		end
      	  end

    	  if string.sub(msg:lower(), 1, #vprefix + 6) == vprefix.."visamt" then
           	visa = tonumber(string.sub(msg:lower(), #vprefix + 8))
		if Toggles.VisAmt ~= nil then 
			Toggles.VisAmt = visa
			Remind("Amount changed")
		end
      	  end
		
    	  if string.sub(msg:lower(), 1, #vprefix + 6) == vprefix.."visrad" then
		visr = tonumber(string.sub(msg:lower(), #vprefix + 8))
		if Toggles.VisRadius ~= nil then 
			Toggles.VisRadius = visr
			Remind("Radius changed")
		end
      	  end

   	  if string.sub(msg:lower(), 1, #vprefix + 6) == vprefix.."viscol" then
		local args = string.split(msg, " ")
           	local Red = tonumber(args[2])
		local Green = tonumber(args[3])
		local Blue = tonumber(args[4])
		Toggles.VisColor = Color3.new(Red,Green,Blue)
		Remind("Colours changed")
      	  end

   	  if string.sub(msg:lower(), 1, #vprefix + 7) == vprefix.."vissize" then
		local args = string.split(msg, " ")
           	local a = tonumber(args[2])
		local b = tonumber(args[3])
		local c = tonumber(args[4])
		Toggles.VisSize = {s1 = a, s2 = b, s3 = c}
		Remind("Sizes changed");Chat(vprefix.."visual")
      	  end

    	  if string.sub(msg:lower(), 1, #vprefix + 6) == vprefix.."visorb" then
		local dasplayer = string.sub(msg:lower(), #vprefix + 8)
		PLAYERCHECK(dasplayer)
		if player ~= nil then
           		Toggles.VisOrbiter = cplr
			Remind("Orbiter changed")
		else
			Remind("Player does not exist!")
		end
      	  end

   	  if string.sub(msg:lower(), 1, #vprefix + 4) == vprefix.."draw" then
           	  drawState = true; draw()
		  Remind("Setting...")
      	  end

   	  if string.sub(msg:lower(), 1, #vprefix + 6) == vprefix.."undraw" then
           	  drawState = false; draw()
		  Remind("Closed!");Chat('clr')
          end


   	  if string.sub(msg:lower(), 1, #vprefix + 5) == vprefix.."dsize" then
           	  brushSize = tonumber(string.sub(msg:lower(), #vprefix + 7))
		  Remind("Size changed")
      	  end

   	  if string.sub(msg:lower(), 1, #vprefix + 4) == vprefix.."dcol" then
		local args = string.split(msg, " ")
           	local Red = tonumber(args[2])
		local Green = tonumber(args[3])
		local Blue = tonumber(args[4])
		partColorer.Color = Color3.new(Red,Green,Blue)
		selectedColor = partColorer.Color		  
		Remind("Colours changed")
      	  end
		
  	  if string.sub(msg:lower(), 1, #vprefix + 2) == vprefix.."rj" then
           	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,game.Players.LocalPlayer) 
      	  end
		
end)

-- COMMAND LIST ---
function CMDPrint()
	print("--- MyVisualiser.lua ---")
	print("")
	print("vprefix - set the prefix, default is a dash - ")
	print("cmds - show the commands in this script")
	print("rj - rejoin the server")
	print("")
	print("--- Visualiser ---")
	print("visual - start the part visualiser")
	print("unvis - end the part visualiser")
	print("")
	print("vismode - set the visualiser mode")
	print("visamt - set the amount of parts for the visualiser")
	print("visrad - set the radius of the visualiser")
	print("visorb - set the player that the visualiser will go around")
	print("viscol - set the visualiser colors [arg] [arg] [arg]")
	print("")
	print("--- Drawing ---")
	print("draw - start drawing")
	print("undraw - stop drawing")
	print("")
	print("dsize - set the draw size")
	print("")
	print("--- Information ---")
	print("Script by quiving, ported by TS2021")
end

function visc()
        vis = Instance.new("Folder", workspace)
        local currentSong = KAHInstances:FindFirstChild("Sound") or nil
        local orbiter = LocalPlayer

        local paintBucket

        kahcon = nil

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
            if child:IsA("Part") and child.Size == Vector3.new(Toggles.VisSize.s1,Toggles.VisSize.s2,Toggles.VisSize.s3) then

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

        for i = 1, Toggles.VisAmt do
    		task.wait()
    		Chat("part/"..Toggles.VisSize.s1.."/"..Toggles.VisSize.s2.."/"..Toggles.VisSize.s3)
	end

        repeat task.wait() 

        until #vis:GetChildren() >= Toggles.VisAmt

        local oldPos = {}
        local angle = 0
        local spin = 0
        local radius = Toggles.VisRadius
        local speed = 0.01
        local axis = "y"
        local Mode = Toggles.VisMode
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

        conn = nil
        conn0     = nil   

        task.spawn(function()
            local lastpbl = 0
            while vis.Parent == workspace do
                task.wait(.1)
                local pbl = currentSong and currentSong.PlaybackLoudness * 2 or 0
                lastpbl = pbl
                for _,v in pairs(vis:GetChildren()) do
                    task.spawn(function()
                        if pbl == 0 or pbl < 1 then
                            task.spawn(personColor, paintBucket, v, Color3.fromRGB(Toggles.VisColor.R * 255,Toggles.VisColor.G * 255,Toggles.VisColor.B * 255))
                        else
                            task.spawn(personColor, paintBucket, v, Color3.fromRGB(Toggles.VisColor.R * 255,(Toggles.VisColor.B * 255) - (pbl * 1.05),(Toggles.VisColor.G * 255) - (pbl * 1.05)))
                        end
                    end)
                end
                if #vis:GetChildren() < Toggles.VisAmt then
                    task.spawn(function()
                        task.wait(.1)
                        Chat("part/"..Toggles.VisSize.s1.."/"..Toggles.VisSize.s2.."/"..Toggles.VisSize.s3)
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
            if typeof(Toggles.VisOrbiter) ~= "CFrame" and Toggles.VisOrbiter ~= LocalPlayer and (not Toggles.VisOrbiter or Toggles.VisOrbiter.Character == nil or not Toggles.VisOrbiter.Character:FindFirstChild("HumanoidRootPart")) then
                        Toggles.VisOrbiter = LocalPlayer
            end           
            local pbl = currentSong and currentSong.PlaybackLoudness * 2 or 0


            if Toggles.VisMode == 0 then
                for _,v in pairs(vis:GetChildren()) do
                    if spin >= 360 then
                        spin = 0
                    end
                    local iter = math.rad(spin+(_*(360/#vis:GetChildren())))
                    local z = Toggles.VisRadius + pbl/ (1 ~= 100 and (100 - 1) or .01)
                    local g = pbl / (35 ~= 100 and (100-35) or .01)
                    local p = CFrame.new(typeof(Toggles.VisOrbiter) == "CFrame" and Toggles.VisOrbiter.X or Toggles.VisOrbiter.Character.HumanoidRootPart.CFrame.X,typeof(Toggles.VisOrbiter) == "CFrame" and Toggles.VisOrbiter.Y or Toggles.VisOrbiter.Character.HumanoidRootPart.CFrame.Y,typeof(Toggles.VisOrbiter) == "CFrame" and Toggles.VisOrbiter.Z or Toggles.VisOrbiter.Character.HumanoidRootPart.CFrame.Z) * CFrame.Angles(axis == "x" and iter or 0, axis == "y" and iter or 0, axis == "z" and iter or 0) * CFrame.new(0,0,z)
                    local AddVector = Vector3.new(0,0,0)

                    if waves then     
                        AddVector = VectorFromSettings(math.sin((((dt*0)+(_/#vis:GetChildren())*(math.pi*2)))), axis)
                    end

                    v.CFrame = p+AddVector
                    rotpart.CFrame = CFrame.new(v.Position, typeof(Toggles.VisOrbiter) == "CFrame" and Toggles.VisOrbiter.p + Vector3.new(0,g,0) or Toggles.VisOrbiter.Character.HumanoidRootPart.Position + Vector3.new(0,g,0))
                    v.Rotation = rotpart.Rotation 
                    spin += speed
                end 
            end

            if Toggles.VisMode == 1 then

                for _,v in pairs(vis:GetChildren()) do
                    local ro = math.rad(a / 2 * _ + (_ * (360 / #vis:GetChildren())))
                    local vector = math.sin((a/#vis:GetChildren()/4 * _),0)
                    local uh = math.sin(woah+(_+_*(0/#vis:GetChildren()))*(math.pi), 0)
                    local F = CFrame.new(typeof(Toggles.VisOrbiter) == "CFrame" and Toggles.VisOrbiter.p or Toggles.VisOrbiter.Character:WaitForChild("Torso").Position) * CFrame.Angles(0, ro/4, 0) * CFrame.new((pbl/ (1 ~= 100 and (100 - 1) or .01))+Toggles.VisRadius, 0, (_+(_/#vis:GetChildren()/2)))

                    v.CFrame = F+Vector3.new(0,0,0)

                    a += speed / 2.5
                    woah += speed/#vis:GetChildren()/8
                    wave += 1
                end
            end

            if Toggles.VisMode == 2 then
                for _,v in pairs(vis:GetChildren()) do
                    local ro = math.rad(a / 2 * _ + (_ * (360 / #vis:GetChildren())))
                    local vector = math.sin((a/#vis:GetChildren()/4 * _),0)
                    local uh = math.sin(woah+(_+_*(0/#vis:GetChildren()))*(math.pi), 0)
                    local F = CFrame.new(typeof(Toggles.VisOrbiter) == "CFrame" and Toggles.VisOrbiter.p or Toggles.VisOrbiter.Character:WaitForChild("Torso").Position) * CFrame.Angles(0, ro/4, 0) * CFrame.new((pbl/ (1 ~= 100 and (100 - 1) or .01))+Toggles.VisRadius, (_+(_/#vis:GetChildren()/2))/1.5, (_+(_/#vis:GetChildren()/2)))

                    v.CFrame = F+Vector3.new(0,0,0)

                    a += speed / 2.5
                    woah += speed/#vis:GetChildren()/8
                    wave += 1


                end
            end

            if Toggles.VisMode == 3 then
                for _,v in pairs(vis:GetChildren()) do
                    local ro = math.rad(a / 2 * _ + (_ * (360 / #vis:GetChildren())))
                    local vector = math.sin((a/#vis:GetChildren()/4 * _),0)
                    local uh = math.sin(woah+(_+_*(0/#vis:GetChildren()))*(math.pi), 0)
                    local F = CFrame.new(typeof(Toggles.VisOrbiter) == "CFrame" and Toggles.VisOrbiter.p or Toggles.VisOrbiter.Character:WaitForChild("Torso").Position) * CFrame.Angles(uh*5, uh*5+ro, 0) * CFrame.new(uh*5+(pbl/ (1 ~= 100 and (100 - 1) or .01))+Toggles.VisRadius, 0, 0)

                    v.CFrame = F+Vector3.new(0,0,0)

                    a+= speed /2.5
                    woah += speed/#vis:GetChildren()/8
                    wave += 1
                end
            end

            if Toggles.VisMode == 4 then
                for _,v in pairs(vis:GetChildren()) do
                    local ro = math.rad(a/2 + (_*(360/#vis:GetChildren())))
                    local uh = math.sin(woah+(_+_*(0/#vis:GetChildren()))*(math.pi), 0)
                    local F = CFrame.new(typeof(Toggles.VisOrbiter) == "CFrame" and Toggles.VisOrbiter.p or Toggles.VisOrbiter.Character:WaitForChild("Torso").Position)*CFrame.Angles(0, ro, 0)*CFrame.new(0, 0, uh*5+(pbl/ (1 ~= 100 and (100 - 1) or .01))+Toggles.VisRadius)


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

                --sethiddenproperty(Child, "NetworkOwnershipRule", Enum.NetworkOwnership.Manual)

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
