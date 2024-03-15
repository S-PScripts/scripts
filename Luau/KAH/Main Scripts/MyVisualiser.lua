-- My Visualiser.lua --

-- VARIABLES --

-- INPUTS --
print("--- MyVisualiser.lua executed! Created by S_P ---")
Chat("h \n\n\n [MyVisualiser.lua]: Executed! v0.00 \n\n\n")

-- FUNCTIONS --

-- COMMAND HUB --
game.Players.LocalPlayer.Chatted:Connect(function(msg)
	    task.wait(0)
    	if string.sub(msg:lower(), 1, #prefix + 5) == prefix.."kcmds" then
           CMDPrint()
	         Remind("Check your console by running /console!")
      end
end)

-- COMMAND LIST ---
function CMDPrint()
print("Me_funzysass")
end
