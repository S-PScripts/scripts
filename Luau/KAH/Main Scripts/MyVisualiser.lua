-- My Visualiser.lua --

-- VARIABLES --
local function Remind(msg)
	game.StarterGui:SetCore("SendNotification", {
		Title = "Visualiser DS",
		Text = msg,
		Duration = 1
	})
end;

local function Chat(msg)
        game.Players:Chat(msg)
end

local prefix = "-"

-- INPUTS --
print("--- MyVisualiser.lua executed! Created by S_P ---")
Chat("h \n\n\n [MyVisualiser.lua]: Executed! v0.00 \n\n\n")

-- FUNCTIONS --

-- COMMAND HUB --
game.Players.LocalPlayer.Chatted:Connect(function(msg)
	   task.wait(0)
    	   if string.sub(msg:lower(), 1, #prefix + 4) == prefix.."cmds" then
           	CMDPrint()
	   	Remind("Check your console by running /console!")
      	   end
end)

-- COMMAND LIST ---
function CMDPrint()
print("Me_funzysass")
end
