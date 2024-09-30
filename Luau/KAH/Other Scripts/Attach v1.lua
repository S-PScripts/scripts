-- The old attaching for KohlsLite that might be used again...

local Game_Folder = game:GetService("Workspace").Terrain["_Game"]
local Workspace_Folder = Game_Folder.Workspace
local Admin_Folder = Game_Folder.Admin

function movepart()
	repeat wait() until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
	local cf = game.Players.LocalPlayer.Character.HumanoidRootPart
	local rmoving = true;mready = false
		task.spawn(function()
			while true do
				game:GetService('RunService').Heartbeat:Wait()
				game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
				cf.CFrame = target.CFrame * CFrame.new(-1*(target.Size.X/2)-(game.Players.LocalPlayer.Character['Torso'].Size.X/2), 0, 0)
				if not rmoving then 
					break 
				end
			end
		end)
		task.spawn(function() 
			while rmoving do 
				wait(.1) 
				Chat('unpunish me') 
			end 
		end)
		wait(0.25)
		rmoving = false;mready = true

end

-- SKYDIVE FOR MOVING
function skydivef()
	Chat("skydive me")
	Chat("skydive me")
	Chat("skydive me")
	Chat("skydive me")
	Chat("skydive me")
	Chat("skydive me")
end

-- Removing and adding the obby locally
function LocalObby(mode)
	if mode == "add" then
		 game.Chat:FindFirstChild("Obby").Parent = workspace.Terrain["_Game"]["Workspace"]
    		 game.Chat:FindFirstChild("Obby Box").Parent = workspace.Terrain["_Game"]["Workspace"]
	else 
		    workspace.Terrain["_Game"]["Workspace"].Obby.Parent = game.Chat
    		    workspace.Terrain["_Game"]["Workspace"]["Obby Box"].Parent = game.Chat
	end
end

-- OBBY BRICKS MOVER
function MoveObbyBricks()
         for i, v in pairs(Workspace_Folder["Obby"]:GetChildren()) do
		task.wait(1)
		target = v
          	movepart()
		repeat wait() until mready == true
		skydivef()
		wait(0.2)
	     	Chat("respawn me")
	 end
end

-- OBBY BOX MOVER
function MoveObbyBox()
          for i, v in pairs(Workspace_Folder["Obby Box"]:GetChildren()) do
		task.wait(1)
		target = v
          	movepart()
		repeat wait() until mready == true
		skydivef()
		wait(0.2)
	     	Chat("respawn me")
	  end
end

-- BUILDING BRICKS MOVER
function MoveBuildingBricks()
          for i, v in pairs(Workspace_Folder["Building Bricks"]:GetChildren()) do
		task.wait(1)
		target = v
          	movepart()
		repeat wait() until mready == true
		skydivef()
		wait(0.2)
	     	Chat("respawn me")
	  end
end

-- ADMIN DIVIDERS MOVER
function MoveAdminDividers()
 	 for i, v in pairs(Workspace_Folder["Admin Dividers"]:GetChildren()) do		
		task.wait(1)
		target = v
          	movepart()
		repeat wait() until mready == true
		skydivef()
		wait(0.2)
	     	Chat("respawn me")
	  end
end

-- HOUSE MOVER
function MoveHouse()
	for i, v in pairs(Workspace_Folder["Basic House"]:GetChildren()) do
		task.wait(1)
		target = v
          	movepart()
		repeat wait() until mready == true
		skydivef()
		wait(0.2)
	     	Chat("respawn me")
        end
end

-- ADMIN PAD MOVER
function MoveAdminPads(mode)
	 for i, v in pairs(Admin_Folder.Pads:GetDescendants()) do
		if v.Name == "Head" then
			task.wait(1)
        		target = v
          		movepart()
			repeat wait() until mready == true
			if mode == "move" then
				skydivef()
			else
				Chat("unskydive me")
				Chat("undog me me")
			end			
			wait(0.2)
	     		Chat("respawn me")
		end
	end
end

-- BASEPLATE MOVER
function MoveBasePlate(mode)
		task.wait(1)
		target = Workspace_Folder.Baseplate
          	movepart()
		repeat wait() until mready == true
		if mode == "move" then
			skydivef()
		elseif mode == "fix" then
			Chat("skydive me")
			task.wait(0.1)
			Chat("unskydive me")
		else
		end
		wait(0.2)
		if mode ~= "ufix" then
	     		Chat("respawn me")
		end
end

-- REGEN MOVER AND FIXER
function MoveRegen(mode)
	     task.wait(1)
	     target = Admin_Folder.Regen
	     movepart()		
	     repeat wait() until mready == true
	     if mode == "move" then
			skydivef()

	     else	
			Chat("unskydive me")
			Chat("undog me me")
	     end
	     wait(0.2)
	     Chat("respawn me")
end

-- regen pos
function regentp()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7.45691586, 8.62999058, 94.4823227, -0.99999845, -9.28177144e-08, -0.00174821995, -9.28509678e-08, 1, 1.8940268e-08, 0.00174821995, 1.91025631e-08, -0.99999845)
end
