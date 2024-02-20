local prefix = "."

print("Thank you for using SimpleKAH! Created by asechka19872.")

local function Chat(msg)
      game.Players:Chat(msg)
end

game.Players.LocalPlayer.Chatted:Connect(function(msg)
        if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antiattach' then
	            antiattach = true
        end
		
        if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantiattach' then
	            antiattach = false
        end

        if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'re' then
	            Chat("reload me")
        end

        if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'dncycle' then
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
        end

        if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'undncycle' then
                dncycle = false
        end

        if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'attach' then
                    Chat("sit me")
                    task.wait(1)
                    Chat("punish me")
                    task.wait(1)
                    Chat("unpunish me")
        end

        if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'vgcrash' then
                      Chat("gear me 00000000000000094794847")
                      local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
                      game.Players.LocalPlayer.Backpack:WaitForChild("VampireVanquisher")
                      for _, v in ipairs(Backpack:GetChildren()) do
                             v.Parent = game.Players.LocalPlayer.Character
                             v:Activate()
                      end
                      wait(.15)
                      for i = 1,100 do
                            Chat("unsize me me me")
                      end
        end

    
        if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'autoff' then
                  autoff = true
        end

        if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unautoff' then
                  autoff = false
        end

        if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'tripesp' then
                  tripesp = true
        end

        if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'untripesp' then
                  tripesp = false
        end
    
        if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'sup' then
                  supermessage = string.sub(msg:lower(), #prefix + 5)
                  SuperCMD(supermessage)
        end

        if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'meteor' then
                  for i = 1,5 do
                      Chat("skydive me")
                  end
                  SuperCMD("part/10/10/10")
                  task.wait(1)
                  Chat("respawn me")
        end
    
end)

function onPlayerAdded(player)
             PLRSTART(player)
end

function SuperCMD(supermessage)
             for i = 1,128 do
                  Chat(supermessage)
                  task.wait()
             end      
end

game.Players.PlayerAdded:Connect(onPlayerAdded)

task.spawn(function()
	    while true do
	          task.wait()
      
            if autoff == true then
	               if game.Players.LocalPlayer.Character:FindFirstChild("ForceField") then
                      Chat("unff me")
                 end
	          end

            if tripesp == true then
	                  local sbspace = workspace.SubspaceTripmine
                    if game.Workspace:FindFirstChild("SubspaceTripmine") then
                        sbspace.Transparency = 0
                    end
	          end
      end
end)


  
function PLRSTART(v)
      v.Chatted:Connect(function(msg)
             task.wait(0)
             task.spawn(function()
        	          if (string.sub(msg:lower(), 0, 3) == "sit" or string.sub(msg:lower(), 0, 4) == ":sit") and v.Name ~= game.Players.LocalPlayer.Name then
                         if antiattach then
                             Chat("reload "..v.Name)
                             print(v.Name..' tried to sit')
                             Chat('h \n\n\n [KohlsLite]: '..v.Name..', You cannot sit due to anti-attach \n\n\n')
                         end
                  end
						
                    if (string.sub(msg:lower(), 0, 4) == "stun" or string.sub(msg:lower(), 0, 5) == ":stun") and v.Name ~= game.Players.LocalPlayer.Name then
                         if antiattach then
                             Chat("reload "..v.Name)
                             print(v.Name..' tried to stun.')
                             Chat('h \n\n\n [KohlsLite]: '..v.Name..', you cannot stun due to anti-attach \n\n\n')
                         end
                    end
              end)
        end)
end

for i, v in pairs(game.Players:GetPlayers()) do
	task.wait(0)
	PLRSTART(v)
end

