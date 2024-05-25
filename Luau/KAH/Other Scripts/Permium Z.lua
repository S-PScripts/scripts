-- Permium Z

print("Permium Z booted. Created by S_P.")

-- variables
local prefix = "!"

local perm = false
local perm2 = true
local loopgrab = false

local padreinforcements = true
local padbanned = {"sgoslee"}

-- player finder
function PLAYERCHECK(plr)
  for i, v in pairs(game.Players:GetPlayers()) do
      if string.sub(v.Name:lower(), 1, #plr) == plr then
          player = v.Name
	  cplr = v
          print("Found"..player)
      end
  end
end

print("-commands-")
print("perm/unperm - perm pad")
print("perm2/unperm2 - perm 2 pad")
print("lg/unlg - loopgrab pads")
print("padreinf/unpadreinf - pad reinforcements")
print("padban/unpadban - pad ban user")
print("regen - regen the pad")

-- Chat
game.Players.LocalPlayer.Chatted:Connect(function(msg)
		
	if string.sub(msg:lower(), 1, #prefix + 2) == prefix.."lg" then
	         loopgrab = true
        end
		
	if string.sub(msg:lower(), 1, #prefix + 4) == prefix.."unlg" then
	         loopgrab = false
        end

	if string.sub(msg:lower(), 1, #prefix + 4) == prefix.."perm" then
	         perm = true
        end
		
	if string.sub(msg:lower(), 1, #prefix + 6) == prefix.."unperm" then
	         perm = false
        end
		
	if string.sub(msg:lower(), 1, #prefix + 5) == prefix.."perm2" then
	         perm2 = true
        end
		
	if string.sub(msg:lower(), 1, #prefix + 7) == prefix.."unperm2" then
	         perm2 = false
        end
		
	if string.sub(msg:lower(), 1, #prefix + 6) == prefix.."padban" then
	         local dasplayer = string.sub(msg:lower(), #prefix + 8)
         	 PLAYERCHECK(dasplayer)
         	 if player ~= nil then
                	Chat("h \n\n\n [PermiumZ]: "..player.." has been padbanned. \n\n\n")
                	table.insert(padbanned, player)
        	 else
                	print('Cannot find player with the name: '..dasplayer)
         	end
        end
		
	if string.sub(msg:lower(), 1, #prefix + 8) == prefix.."unpadban" then
	         local dasplayer = string.sub(msg:lower(), #prefix + 10)
         	 PLAYERCHECK(dasplayer)
         	 if player ~= nil then
                	Chat("h \n\n\n [PermiumZ]: "..player.." has been padbanned. \n\n\n")
                	table.remove(padbanned, table.find(padbanned, player))
        	 else
                	print('Cannot find player with the name: '..dasplayer)
         	end
        end

	if string.sub(msg, 1, #prefix + 8) == prefix..'padreinf' then
       		Chat("h \n\n\n [Permium Z]: Pad reinforcements are on. \n\n\n")
      		padreinforcements = true
    	end

    	if string.sub(msg, 1, #prefix + 10) == prefix..'unpadreinf' then
       		Chat("h \n\n\n [Permium Z]: Pad reinforcements are off! \n\n\n")
       		padreinforcements = false
    	end

	if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'regen' then
		Regen()
    	end
		
end)

if string.sub(msg, 1, 9) == "rocontrol" then
nbc = false
bc = true
end
-- Perm
task.spawn(function()
    while true do 
        task.wait(0)
        coroutine.wrap(function()
			      local spr = game.Players.LocalPlayer.Character:FindFirstChild("Head")
			      if perm ~= true or workspace.Terrain._Game.Admin.Pads:FindFirstChild(game.Players.LocalPlayer.Name.."'s admin") ~= nil then 
			      else
				    pcall(function()
					      local pad = workspace.Terrain._Game.Admin.Pads:FindFirstChild("Touch to get admin")
					      local a = pad.Head
					      firetouchinterest(a, spr, 1)
                firetouchinterest(a, spr, 0)
                firetouchinterest(a, spr, 1)
					      task.wait()
					      firetouchinterest(a, spr, 0)
				    end)
			      end
        end)()
    end
end)

-- Perm 2
task.spawn(function()
    while true do
        task.wait(0)
        if perm2 == true then
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
			                Regen()
                  end
            end
        end
  end
end)

-- Loopgrab
task.spawn(function()
    while true do 
        task.wait(0)
        coroutine.wrap(function()
			      if loopgrab == true then
				        local pads = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren("Head")
			      	    	for i, pad in pairs(pads) do
					            coroutine.wrap(function()
						                pcall(function()
							                  local cre = pad.Head
						              	    local spr = game.Players.LocalPlayer.Character:FindFirstChild("Head")
						              	    firetouchinterest(cre, spr, 1)
                          			firetouchinterest(cre, spr, 0)
                          			firetouchinterest(cre, spr, 1)
							                  task.wait()
    							              firetouchinterest(cre, spr, 0)
							                  if pad.Name ~= game.Players.LocalPlayer.Name.."'s admin" then
									                  Regen()
							                  end
						                 end)()
					            end)()
				            end
              end
        end)
    end
end)

-- Regen
function Regen()
        fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector, 0)
end

-- Padbanned
task.spawn(function()
	while true do
		task.wait(0)
		for i,player in pairs(padbanned) do
			for i,pad in pairs(game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetDescendants()) do
				if pad.Name == player.."'s admin" then
					Chat("respawn "..player)
					Chat("h \n\n\n [Permium Z]: Sorry, "..player..", you're banned from using the admin pads! \n\n\n")
					Regen()
				end
			end
		end
	end
end)

-- Pad Reinforcements
task.spawn(function()
	while true do
		if padreinforcements == true then
			for i,v in pairs(game.Players:GetChildren()) do
				local times = 0
				for i,pad in pairs(game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetDescendants()) do
					if pad.Name == v.Name.."'s admin" then
						times = times + 1
					end
				end
				if times >= 2 then
					Chat("respawn "..v.Name)
					Chat("h \n\n\n [Permium Z]: The pads have been reset because "..v.Name.." tried to take them all! \n\n\n")
					Regen()
				end
			end
		end
	end
end)
