function kick()
    vk = game:GetService("Workspace").Remote.votekick
    vs = workspace.Remote.votekick
    for i = 1,100 do
	    print("kicking"..cplr.."that's cool")
	    print("kicking 2"..cplr.."that's cool")
	    vk:InvokeServer(unpack(explosion))
	    vk:InvokeServer(unpack(explosion2))
	    vs:InvokeServer(unpack(explosion))
	    vs:InvokeServer(unpack(explosion2))
	    vk:InvokeServer("Start",game.Players[cplr])
	    vk:InvokeServer("Start",game.Players[player])
	    vs:InvokeServer("Start",game.Players[cplr])
	    vs:InvokeServer("Start",game.Players[player])
	    vk:InvokeServer("Vote")
            vs:InvokeServer("Vote")
            vk:InvokeServer("Vote",game.Players[cplr])
	    vk:InvokeServer("Vote",game.Players[player])
	    vs:InvokeServer("Vote",game.Players[cplr])
	    vs:InvokeServer("Vote",game.Players[player])
    end
end

prefix = "!"

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
	  explosion2 = {"Start", cplr}
          print("Found"..player)
      end
  end
end
