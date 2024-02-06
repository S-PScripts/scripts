local anticrash = true
local crashTools = {"OrinthianSwordAndShield", "VampireVanquisher"}

function warnCrash(player, toolName)
       Chat("ungear " .. player.Name)
       Chat("punish " .. player.Name) -- if spamming to use the gear
       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName .. " because of anti crash. \n\n\n")
       Chat("clr") -- drop crash prevention
end

function checkPlayerBackpack(player)
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, toolName in ipairs(crashTools) do
            local tool = backpack:FindFirstChild(toolName)
            if tool and anticrash then
		                if player.Name ~= game.Players.LocalPlayer.Name and not table.find(GWhitelisted, player.Name) then
                            warnCrash(player, toolName)
                    break
                    end
            end
        end
    end
end


game.Players.PlayerAdded:Connect(function(player)
    task.wait(0)
    player.CharacterAdded:Connect(function(character)
            checkPlayerBackpack(player)
	  end)
    checkPlayerBackpack(player)
end)

game:GetService("RunService").Heartbeat:Connect(function()
    task.wait(0)
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Character then
            checkPlayerBackpack(player)
        end
    end
end)

for _, player in ipairs(game.Players:GetPlayers()) do
    task.wait(0)
    if player.Character then
            checkPlayerBackpack(player)
    end
end
