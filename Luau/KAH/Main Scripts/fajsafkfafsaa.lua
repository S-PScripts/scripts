```
local lplr = game:GetService("Players").LocalPlayer
local gprefix = "-"
local gv = "v1"

local antigear = false -- No one except you can use gears with this on
local anticrash = true -- No one except you can crash the servers (gears only)

local connections = {}

local function chat(msg)
	game:GetService("Players"):Chat(msg)
end

local function notify(text, num)
	if num == nil then
		num = 1
	end
	game:GetService("StarterGui"):SetCore("SendNotification",
	{
		Title = "Info",
		Text = text,
		Duration = num
	}
	)
end

local admin = {prefix = gprefix, v = gv}
local commands = {}
local descriptions = {}

local crashTools = {
	"VampireVanquisher", 
	"OrinthianSwordAndShield", 
	"BitePlant", 
	"Emerald Knights of the Seventh Sanctum Sword and Shield"
}

function addcommand(cmdName, cmdDescription, cmdFunction) -- doesn't this look familiar? it's scv2! I should edit this to add an alias.
    commands[cmdName] = cmdName
    descriptions[cmdName] = cmdDescription
    connections[#connections + 1] = 
            game.Players.LocalPlayer.Chatted:Connect(function(msg)
                msg = msg:lower()
                args = msg:split(" ")
                if args[1] == admin.prefix .. cmdName then
                    cmdFunction()
                elseif args[1] == "/e" and args[2] == admin.prefix .. cmdName then
                    args[2] = args[3]
                    cmdFunction()
                end
        end)
end

connections[#connections + 1] = 
	game:GetService("RunService").RenderStepped:Connect(function()
		if antigear then
			for i, v in game.Players:GetPlayers() do
				if v.Name ~= lplr.Name and v.Backpack:FindFirstChildOfClass("Tool") then
					chat("ungear "..v.Name)
					chat("punish "..v.Name)
					chat("clr")
					chat(prefix.."regen")
				end

				if v.Name ~= lplr.Name and v.Character and v.Character:FindFirstChildOfClass("Tool") then
					chat("ungear "..v.Name)
					chat("punish "..v.Name)
					chat("clr")
					chat(prefix.."regen")
				end
			end
		end
		
		if anticrash then
			for i, tool in crashTools do
				for i, v in game.Players:GetPlayers() do
					if v.Name ~= lplr.Name and v.Backpack:FindFirstChild(tool) then
						chat("ungear "..v.Name)
						chat("punish "..v.Name)
			 			chat("clr")
						chat(prefix.."regen")
					end
					
					if v.Name ~= lplr.Name and v.Character and v.Character:FindFirstChild(tool) then
						chat("ungear "..v.Name)
						chat("punish "..v.Name)
			 			chat("clr")
						chat(prefix.."regen")
					end
				end

				if workspace:FindFirstChild(tool) then
					chat("ungear others")
					chat("punish others")
					chat("clr")
					chat(prefix.."regen")
				end
			end
		end
	end)

addcommand("regen",
	"regenerate the admin pads",
	function()
      		 if fireclickdetector then
			if game:GetService("Workspace").Terrain["_Game"].Admin.Regen then
                     		fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector, 0)
			else
				notify("The regen pad is not loaded - please find it first.")
		 else
			notify("Bad executor - fireclickdetector is not supported to run regen.")
		 end
	end
)

addcommand("anticrash",
	"toggle anti crash (gears only)",
	function()
		if anticrash then
      			anticrash = false
		else
			anticrash = true
		end
		notify("Anti crash is now set to "..anticrash)
	end
)

addcommand("unanticrash",
	"turn off anti crash",
	function()
		if anticrash then
      			anticrash = false
		end
		notify("Anti crash is now set to false.")
	end
)

addcommand("antigear",
	"toggle anti gear",
	function()
		if antigear then
      			antigear = false
		else
			antigear = true
		end
		notify("Anti gear is now set to "..antigear)
	end
)

addcommand("unantigear",
	"turn off anti gear",
	function()
		if antigear then
      			antigear = false
		end
		notify("Anti gear is now set to false.")
	end
)
  ```
