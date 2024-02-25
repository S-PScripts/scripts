-- // to be added to kohlslite \\ --

-- // variables \\ --
	local Player = game.Players.LocalPlayer
	local PlayerService = game:GetService("Players")


local function moveobject(part, o)
		if movestatus == false then
			movestatus = true
			if o == 1 then
				if allclear() == true then
					removelimbs()
					task.wait()
					workspace.Gravity = 0
					act("size me .5")
					workspace.FallenPartsDestroyHeight = 0/0
					act("gear me 0000000000000000000000000000000000000108158379")
					repeat fwait() until Player.Backpack:FindFirstChild("IvoryPeriastron")
					Player.Character.Humanoid:EquipTool(Player.Backpack:FindFirstChild("IvoryPeriastron"))
					local ivory = Player.Character:FindFirstChild("IvoryPeriastron")
					local randcoord = CFrame.new(math.random(-30593, -23388), math.random(-30593, -10455), math.random(-30593, -10455))
					Player.Character.HumanoidRootPart.CFrame = randcoord
					PlayerService.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
					if Player.Character.Torso:FindFirstChild("Weld") then
						Player.Character.Torso:FindFirstChild("Weld"):Destroy()
					end
					task.wait(.25)
					if not Player.Character:FindFirstChild("IvoryPeriastron") then
						fixgame()
						forcerespawn()
						movestatus = false
						return
					end
					ivory:WaitForChild("Remote"):FireServer(Enum.KeyCode.E)
					task.wait(.25)
					attach(part)
					task.wait(.25)
					if not Player.Character:FindFirstChild("IvoryPeriastron") then
						fixgame()
						forcerespawn()
						movestatus = false
						return
					end
					ivory:WaitForChild("Remote"):FireServer(Enum.KeyCode.E)
					task.wait(.25)
					movestatus = false
				else
					prompt("Something went wrong removing the parts.")
					forcerespawn()
					fixgame()
				end
			elseif o == 2 then
				local loop = false
				if allclear() == true then
					removelimbs()
					task.wait()
					act("size me .5")
					workspace.Gravity = 0
					workspace.FallenPartsDestroyHeight = 0/0
					act("gear me 0000000000000000000000000000000000000108158379")
					repeat fwait() until Player.Backpack:FindFirstChild("IvoryPeriastron")
					Player.Character.Humanoid:EquipTool(Player.Backpack:FindFirstChild("IvoryPeriastron"))
					local ivory = Player.Character:FindFirstChild("IvoryPeriastron")
					local newcoord = CFrame.new(ogcframes[part.Name][1],ogcframes[part.Name][2],ogcframes[part.Name][3],ogcframes[part.Name][4],ogcframes[part.Name][5],ogcframes[part.Name][6],ogcframes[part.Name][7],ogcframes[part.Name][8],ogcframes[part.Name][9],ogcframes[part.Name][10],ogcframes[part.Name][11],ogcframes[part.Name][12]) * CFrame.new(-1*(part.Size.X/2)-(Player.Character.HumanoidRootPart.Size.X/2),0,0)
					loop = true
					task.spawn(function()
						while loop do
							fwait() 
							Player.Character.HumanoidRootPart.CFrame = newcoord
							if loop == false then break end
						end
					end)
					repeat fwait() 
					until Player.Character.HumanoidRootPart.CFrame == newcoord
					loop = false
					if Player.Character.Torso:FindFirstChild("Weld") then
						Player.Character.Torso:FindFirstChild("Weld"):Destroy()
					end
					PlayerService.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
					task.wait(.25)
					if not Player.Character:FindFirstChild("IvoryPeriastron") then
						fixgame()
						forcerespawn()
						movestatus = false
						return
					end
					ivory:WaitForChild("Remote"):FireServer(Enum.KeyCode.E)
					task.wait(.25)
					attach(part)
					task.wait(.25)
					if not Player.Character:FindFirstChild("IvoryPeriastron") then
						fixgame()
						forcerespawn()
						movestatus = false
						return
					end
					ivory:WaitForChild("Remote"):FireServer(Enum.KeyCode.E)
					task.wait(.25)
					movestatus = false
				else
					loop = false
					forcerespawn()
					fixgame()
					prompt("Something went wrong removing the parts.")
				end
			elseif o == 3 then
				if allclear() == true then
					removelimbs()
					task.wait()
					act("size me .5")
					workspace.Gravity = 0
					workspace.FallenPartsDestroyHeight = 0/0
					act("gear me 0000000000000000000000000000000000000108158379")
					repeat fwait() until Player.Backpack:FindFirstChild("IvoryPeriastron")
					Player.Character.Humanoid:EquipTool(Player.Backpack:FindFirstChild("IvoryPeriastron"))
					local ivory = Player.Character:FindFirstChild("IvoryPeriastron")
					local randcoord = CFrame.new(0, math.random(-14950, -15000), 0)
					Player.Character.HumanoidRootPart.CFrame = randcoord
					if Player.Character.Torso:FindFirstChild("Weld") then
						Player.Character.Torso:FindFirstChild("Weld"):Destroy()
					end
					PlayerService.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
					task.wait(.25)
					if not Player.Character:FindFirstChild("IvoryPeriastron") then
						fixgame()
						forcerespawn()
						movestatus = false
						return
					end
					ivory:WaitForChild("Remote"):FireServer(Enum.KeyCode.E)
					task.wait(.05)
					attach(part)
					task.wait(.05)
					if not Player.Character:FindFirstChild("IvoryPeriastron") then
						fixgame()
						forcerespawn()
						movestatus = false
						return
					end
					ivory:WaitForChild("Remote"):FireServer(Enum.KeyCode.E)
					task.wait(.25)
					movestatus = false
				else
					prompt("Something went wrong removing the parts.")
					forcerespawn()
					fixgame()
				end
			end
		end
	end

	local function removelimbs()
		for i,v in pairs(PlayerService.LocalPlayer.Character.Torso:GetChildren()) do
			if v.Name == "Left Shoulder" then
				v:Destroy()
			end
			if v.Name == "Left Hip" then
				v:Destroy()
			end
			if v.Name == "Right Hip" then
				v:Destroy()
			end
		end
	end

local function attach(part)
		if Player.Character.Torso:FindFirstChild("Weld") then
			Player.Character.Torso:FindFirstChild("Weld"):Destroy()
		end
		PlayerService.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
		local looping = true
		task.spawn(function()
			if Player.Character.Torso:FindFirstChild("Weld") then
				Player.Character.Torso:FindFirstChild("Weld"):Destroy()
			end
			while true do
				fwait()
				if allclear() == true then
					PlayerService.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
					Player.Character.HumanoidRootPart.CFrame = part.CFrame * CFrame.new(-1*(part.Size.X/2)-(Player.Character.HumanoidRootPart.Size.X/2),0,0) 
				elseif allclear() == false then
					forcerespawn()
					fixgame()
					prompt("Something went wrong moving the parts. Fixing game and respawning..")
					looping = false
				end
				if looping == false then break end
			end
		end)
		task.spawn(function() 
			while looping do 
				fwait()
				act("unpunish me")
				if allclear() == false then 
					forcerespawn()
					fixgame()
					prompt("Something went wrong moving the parts. Fixing game and respawning..")
					looping = false
				end 
				if looping == false then break end
			end
		end)
		
		repeat fwait() Player.Character.HumanoidRootPart.CFrame = part.CFrame * CFrame.new(-1*(part.Size.X/2)-(Player.Character.HumanoidRootPart.Size.X/2),0,0) 
		until Player.Character.HumanoidRootPart.CFrame == part.CFrame * CFrame.new(-1*(part.Size.X/2)-(Player.Character.HumanoidRootPart.Size.X/2),0,0)
		repeat 
			fwait() 
			if allclear() == false then
				break
			end
		until 
			Player.Character.Torso:FindFirstChild("Weld")
		looping = false
	end

	local function fixgame()
		workspace.Gravity = 198.6
		for _,v in pairs(workspace:GetDescendants()) do
			if v:IsA("Part") then
				v.CanCollide = true
			end
		end
	end

	local function forcerespawn()
		if respawning == true then
			return
		else
			respawning = true
			local char = PlayerService.LocalPlayer.Character
			if char:FindFirstChildOfClass("Humanoid") then char:FindFirstChildOfClass("Humanoid"):ChangeState(15) end
			char:ClearAllChildren()
			local newChar = Instance.new("Model")
			newChar.Parent = workspace
			PlayerService.LocalPlayer.Character = newChar
			wait()
			PlayerService.LocalPlayer.Character = char
			newChar:Destroy()
			respawning = false
		end
	end
