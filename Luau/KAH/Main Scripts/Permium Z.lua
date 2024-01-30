-- Permium Z unfinished
print("Permium Z booted. Created by S_P.")

-- variables
perm = false
perm2 = true
loopgrab = false

padreinforcements = true
padbanned = {"sgoslee"}

print("-commands-")
print("perm/unperm - perm pad")
print("perm2/unperm2 - perm 2 pad")
print("lg/unlg - loopgrab pads")
print("padreinf/unpadreinf - pad reinforcements")
print("padban/unpadban - pad ban user")

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
