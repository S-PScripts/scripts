-- Hat kick --

hatkick_id = "18137588505" -- Put your hat id here
hatkick = {} -- Insert your blacklisted users here

antis = {}
antis.antimesh = true

local connections = {}
connections[#connections + 1] =
	game:GetService("RunService").RenderStepped:Connect(function()
		task.wait()
	  	if antis.antimesh then
        		for i, v in pairs(game.Workspace:GetDescendants()) do
    		    		if v:IsA("Accessory") and (v.Name == "Accessory (Pointy)" or v.Name == "Accessory (happy)" or v.Name == "Accessory (SUN)" or v.Name == "Accessory (MeshPart)" or v.Name == "") then -- cxo
        		    		v:Destroy()
    			  	end
		    	end
	  	end
	end)

local function Chat(msg)
    game.Players:Chat(msg)
end

function sendmsg(message)
    game.StarterGui:SetCore("SendNotification",
        {
            Title = "HAT KICKER",
            Text = message,
            Duration = 5.5
        })
end

function begin(player)
    task.wait(0)
    if table.find(hatkick, player.Name) then
        techkick(player, player.Name)
    end
end

function techkick(kickin, kickinplr) -- Tech's hatkick
    		hatspammingz = true
    		Chat("respawn "..kickinplr)
		Chat("blind "..kickinplr.."                                                                                                                                                                      discord")
		Chat("invis "..kickinplr.."                                                                                                                                                                      discord")
		Chat("skydive "..kickinplr.." "..kickinplr.." "..kickinplr.."                                                                                                                                    discord")
		Chat("skydive "..kickinplr.." "..kickinplr.." "..kickinplr.."                                                                                                                                    discord")
		Chat("skydive "..kickinplr.." "..kickinplr.." "..kickinplr.."                                                                                                                                    discord")
		Chat("size "..kickinplr.." 9.9")
		Chat("size "..kickinplr.." 9.9")
		chatt("spin                                                                                                                                                                      "..kickinplr.." discord")
		task.wait(0.15)
		Chat("setgrav "..kickinplr.." -251.2")

		task.delay(3.65, function()
			hatspammingz = false
		end)

		for i = 1, 103 do
			chatt("hat "..kickinplr.. hatkick_id)
		end

		while hatspammingz do task.wait()
			chatt("hat "..kickinplr.. hatkick_id)
		end
end

for i, v in pairs(game:GetService("Workspace").Terrain._Game.Workspace.Obby:GetChildren()) do
                        v.CanTouch = false
end

game:GetService("Players").PlayerAdded:Connect(begin)

for i, v in pairs(game.Players:GetPlayers()) do
        task.wait(0)
        begin(v)
end

Remind("Script booted.")
