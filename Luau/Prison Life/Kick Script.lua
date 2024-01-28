function kick()
    vk = game:GetService("Workspace").Remote.votekick
    vs = workspace.Remote.votekick
    local plr = game.Players[player]
	while plswork < 100 do
	    print("kicking a player")
	    vk:InvokeServer(unpack(explosion))
	    vs:InvokeServer(unpack(explosion))
	    vk:InvokeServer("Start",plr)
	    vs:InvokeServer("Start",plr)
	    vk:InvokeServer("Vote")
            vs:InvokeServer("Vote")
	    plswork = plswork + 1
    end
end

prefix = "!"
plswork = 0

print("Prison Kicker executed!")
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    	if string.sub(msg:lower(), 1, #prefix + 4) == prefix.."kick" then
         local dasplayer = string.sub(msg:lower(), #prefix + 6)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
              print(player.."has been found!")
              kick()
         else
              print('Cannot find player with the name: '..dasplayer)
         end
    end
end)

function PLAYERCHECK(plr)
  for i, v in pairs(game.Players:GetPlayers()) do
      if string.sub(v.Name:lower(), 1, #plr) == plr then
          player = v.Name
	  cplr = v
	  explosion = {"Start", player}
          print("Found"..player)
      end
  end
end
