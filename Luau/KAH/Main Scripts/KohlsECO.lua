-- KohlsECO / KohlsLite v2 --

-- Notes: --
-- This is a user friendly version of KohlsLite that aims to make it easier to edit
-- This won't have as many features but I'll add as many as possible.

-- Settings --
getgenv().klprefix2 = "."

-- Antis (settings) --
local antigear = false -- No one except you can use gears with this on
local anticrash = true -- No one except you can crash the servers (gears only)
local nobadtools = false -- Custom blacklist for gears

local antilag = false -- stop lag from effects

-- Version (don't change) --
getgenv().klversion2 = "v0.00 Alpha"

-- Chat function
local function Chat(msg)
	game:GetService("Players"):Chat(msg)
end

-- Remind function
local function Remind(text, num)
	if num == nil then
		num = 1
	end
	game:GetService("StarterGui"):SetCore("SendNotification",
	{
		Title = "KohlsECO",
		Text = text,
		Duration = num
	}
	)
end

-- Execution check
getgenv().executed2 = false

if getgenv().executed2 then 
	return Remind("KohlsECO is already executed.")
end

-- LocalPlayer variables
local lplr = game:GetService("Players").LocalPlayer

-- Anti logs
local antilog = ("0"):rep(40) -- Auto spam logs when people try looking
local musicantilog = ("0"):rep(40) -- music 0000000000000000000000000 (music)
local gearantilog = ("0"):rep(40) -- gear plr 00000000000000000000000 (gear)
local charantilog = ("0"):rep(40) -- char plr 00000000000000000000000 (char)

-- Gamepass checker
local function gamepassCheck()
	local hasPerm = false
	local hasPersons = false

	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 66254) then
		hasPerm = true
	elseif game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 64354) then
		hasPerm = true
	else
		-- 
	end

	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 35748) then
		hasPersons = true
	elseif game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 37127) then
		hasPersons = true
	else
		--
	end

	return {hasPerm, hasPersons}
end

-- Variables for the gamepass checker
local gamepassData = gamepassCheck()
local hasPerm = gamepassData[1]
local hasPersons = gamepassData[2]

-- Variables for Chatted --
local admin = {klprefix2 = klprefix2, klversion2 = klversion2}
local commands = {}
local descriptions = {}

-- Variables for credits --
local creditables = {}
local creddesc = {}

-- Tools that can crash servers!
local crashTools = {
	"VampireVanquisher", 
	"OrinthianSwordAndShield", 
	"BitePlant", 
	"Emerald Knights of the Seventh Sanctum Sword and Shield"
}

-- Custom tool blacklist. --
local badTools = {
}

---KL v1 gear list----
local gearlist = {
	["boombox"] = { gearid = "212641536" },
	["vg"] = { gearid = "94794847" },
	["osas"] = { gearid = "92628079" },
	["gb"] = { gearid = "82357101" },
	["bhbomb"] = { gearid = "28277486" },
	["tictac"] = { gearid = "16924676" },
	["pgun"] = { gearid = "34870758" },
	["camfixer"] = { gearid = "79736563" },
	["painter"] = { gearid = "18474459" },
	["telemon"] = { gearid = "93136746" },
	["trapmine"] = { gearid = "11999247" },
	["timegears"] = { gearid = "77443461" },
	["admslayer"] = { gearid = { "268586231", "1103011681"} },
	["kp"] = { gearid = {"583030187, 68539623"} },
	["icebreaker"] = { gearid = {"87361662", "66896601"} },
	["periastrons"] = { gearid = {"108158379", "80661504", "233520257", "73829193", "69499437", "139577901", "2544549379", "120307951", "99119240", "93136802", "80597060", "159229806", "77443461"} },
	["melees"] = { gearid = {"121946387", "12187348", "170897263", "427947884", "306971294", "306971294", "11999235", "28275809", "10758456", "243790334", "14719505", "13207169", "11956382", "10469910", "124472052", "20721924"} },
	["guns"] = { gearid = {"243007180", "116693764", "212296936", "168143042", "467138029", "42845609", "130113146", "26017478", "26014536", "9360722592", "18268645"} },
	["fungears"] = { gearid = {"111876831", "90718686", "283755431", "139578061", "90718686", "212641536", "392057539", "323477973", "78730532", "47597835", "212641536", "88143093", "73265108", "115377964", "98411393" } },
	["explosives"] = { gearid = {"88885539", "88885524", "73888479", "110337853", "101110605", "29957963", "503955938", "243788010", "88146497"} },
	["destructives"] = { gearid = {"125013830", "225921650", "60357972", "108158379"} },
	["swords"] = { gearid = {"25740034", "638089422", "170903610", "319655422", "125013769", "108158379", "2470750640", "2041982658", "361950297", "2103274863", "181356054", "163491866", "108158439"} },
	["rideables"] = { gearid = {"304719869", "2568114215", "158069143", "185422295", "346687565", "553939167", "820013867", "387285940", "163348575", "206799274", "928805891", "124127383", "125013849", "2445089071", "253519495"} }
}

-- Connections --
local connections = {}

-- Anti crash for gears and anti gear
connections[#connections + 1] =
	game:GetService("RunService").RenderStepped:Connect(function()
		if antigear then
		for i, v in game.Players:GetPlayers() do
			if v.Name ~= lplr.Name and v.Backpack:FindFirstChildOfClass("Tool") then
				Chat("ungear " .. v.Name)
				Chat("punish " .. v.Name)
				Chat("clr")
				Chat(klprefix2 .. "regen")
			end

			if v.Name ~= lplr.Name and v.Character and v.Character:FindFirstChildOfClass("Tool") then
				Chat("ungear " .. v.Name)
				Chat("punish " .. v.Name)
				Chat("clr")
				Chat(klprefix2 .. "regen")
			end
		end
	end

		if anticrash then
		for i, tool in crashTools do
			for i, v in game.Players:GetPlayers() do
				if v.Name ~= lplr.Name and v.Backpack:FindFirstChild(tool) then
					Chat("ungear " .. v.Name)
					Chat("punish " .. v.Name)
					Chat("clr")
					Chat(klprefix2 .. "regen")
				end

				if v.Name ~= lplr.Name and v.Character and v.Character:FindFirstChild(tool) then
					Chat("ungear " .. v.Name)
					Chat("punish " .. v.Name)
					Chat("clr")
					Chat(klprefix2 .. "regen")
				end
			end

			if workspace:FindFirstChild(tool) then
				Chat("ungear others")
				Chat("punish others")
				Chat("clr")
				Chat(klprefix2 .. "regen")
			end
		end
	end
	end)


-- Anti lag items
local items = {
	"Smoke",
	"ForceField",
	"Explosion",
	"Fire",
	"Sparkles"
}

-- Anti lag
connections[#connections + 1] = workspace.DescendantAdded:Connect(function(ch)
	if antilag then
		for i,v in items do
			if ch:IsA(v) then
				repeat
					ch:Destroy()
					game:GetService("RunService").RenderStepped:Wait()
				until not ch
			end
		end
	end
end)

-- Command adder --
-- From Shortcut v2 NEW (https://github.com/Tech-187/Lua-scripts/blob/main/Shortcut__v2_src2.lua)
function addcommand(information)
	local cmdName = information.name
	local cmdAlias = information.aliases
	local cmdFunction = information.funct
	local cmdDescription = information.description

	commands[cmdName] = cmdName
	descriptions[cmdName] = cmdDescription

	connections[#connections + 1] = 
		game.Players.LocalPlayer.Chatted:Connect(function(msg)
			msg = msg:lower()
			args = msg:split(" ")
			if args[1] == admin.klprefix2 .. cmdName then
			cmdFunction()
		end

			for _, alias in ipairs(cmdAlias) do
			if args[1] == admin.klprefix2 .. alias then
				cmdFunction()
				break
			end
		end
		end)
end

-- Credit adder --
function addcredit(cName, cDescription)
	creditables[cName] = cName
	creddesc[cName] = cDescription
end

-- Credits --
addcredit("ScriptingProgrammer (Roblox) / ts2021x (Discord)/ S-PScripts (GitHub)",
	"created KohlsLite and KohlsECO (KohlsLite v2)"
)

addcredit("Tech/t_echr/techq and other admins of Shortcut",
	"creating Shortcut v1, v2 and v3 [var] - giving ideas and help for scripts"
)

addcredit("trollfacenan",
	"adding stuff to KohlsECO (i edited some of it though)"
)

addcredit("iiDK",
	"creating ii's Stupid Admin - help for scripts"
)

addcredit("atprog",
	"creating PR Script - being a collaborator for KohlsLite"
)

addcredit("Gojo",
	"creating SimpleKAH - gear and char ids"
)

addcredit("Dizzy",
	"creating Route - music ids that I stole with an audio logger haha"
)

addcredit("DarkSpecies",
	"creating Radiation Hub - being a collaborator for KohlsLite"
)

addcredit("You!",
	"using my script and spreading it around. Thank you!"
)

-- Credit list -- 
addcommand({
	name = "credits",
	aliases = {},
	description = "print out the credits for KohlsECO",
	funct = function()
		print("Credits:")
		print("\n\n\n")
		for i, v in pairs(creditables) do
			dupe = v.. " - ".. creddesc[v]
			print(dupe)
		end
	end
})

-- Command list --

addcommand({
	name = "cmds", -- not sure why in scv2 new it doesn't use the system that was created!
	aliases = {"commands"},
	description = "print out the commands for KohlsECO",
	funct = function()
		print("Commands:")
		print("\n\n\n")
		for i, v in pairs(commands) do
			dupe = v.. " - ".. descriptions[v]
			print(dupe)
		end
	end
})

-- Information --
addcommand({
	name = "help", 
	aliases = {},
	description = "print out information about KohlsECO",
	funct = function()
		print("Information:")
		print("\n\n\n")
		print("You are using KohlsECO (KohlsLite v2) by ScriptingProgrammer/ts2021x/S-PScripts. This script has been maintained since 2023.")
		print("For help, please contact me on Discord at ts2021x.")
		print("The version you are using is "..admin.klversion2..".")
	end
})

-- Commands ---
addcommand({
	name = "vgcrash",
	aliases = {"vampirecrash"},
	description = "crashes the server with the vampire vanquisher",
	funct = function()
		if game.Lighting:FindFirstChild(lplr.Name) then
			if hasPerm or hasPersons then
				Chat("respawn me")
			end
		end

		if hasPerm or hasPersons then
			Chat(klprefix2.."regen")
		end

		Chat("blind others")
		Chat("speed others 0")
		Chat("freeze others")

		Chat("gear me "..antilog.."94794847")
		repeat task.wait() until lplr.Backpack:WaitForChild("VampireVanquisher")
		local vg = lplr.Backpack:FindFirstChild("VampireVanquisher")
		vg.Parent = lplr.Character

		task.wait(0.2)
		vg:Activate()

		Chat("blind others")
		Chat("speed others 0")
		Chat("freeze others")

		for i = 1, 100 do
			Chat("unsize me me me")
		end
	end
})

addcommand({
	name = "vgcrash2",
	aliases = {"vampirecrash2"},
	description = "crashes the server with the vampire vanquisher",
	funct = function()
		if game.Lighting:FindFirstChild(lplr.Name) then
			if hasPerm or hasPersons then
				Chat("respawn me")
			end
		end

		if hasPerm or hasPersons then
			Chat(klprefix2.."regen")
		end

		Chat("blind others")
		Chat("speed others 0")
		Chat("freeze others")

		Chat("gear me "..antilog.."94794847")
		repeat task.wait() until lplr.Backpack:WaitForChild("VampireVanquisher")
		local vg = lplr.Backpack:FindFirstChild("VampireVanquisher")
		vg.Parent = lplr.Character

		repeat task.wait() until not lplr.Character.VampireVanquisher:FindFirstChild("Coffin")
		repeat task.wait() until lplr.Character.VampireVanquisher:FindFirstChild("Remote")
		lplr.Character.VampireVanquisher.Remote:FireServer(Enum.KeyCode.Q)

		Chat("blind others")
		Chat("speed others 0")
		Chat("freeze others")

		for i = 1, 100 do
			Chat("unsize me me me")
		end
	end
})

addcommand({
	name = "crash",
	aliases = {"dogcrash", "silcrash"},
	description = "crashes the server with dog and clone spam",
	funct = function()
		if hasPerm or hasPersons then
			Chat(klprefix2.."regen")
		end

		for i = 1, 100 do
			Chat("dog all all all")
			Chat("clone all all all")
		end
	end
})

addcommand({
	name = "dcrash2",
	aliases = {"dogcrash2","silcrash2"},
	description = "crashes the server with dog and clone spam",
	funct = function()
		if hasPerm or hasPersons then
			Chat(klprefix2.."regen")
		end

		for i = 1, 50 do
			Chat("dog all all all")
		end

		for i = 1, 50 do
			Chat("clone all all all")
		end
	end
})

addcommand({
	name = "fcrash",
	aliases = {"freezecrash"},
	description = "crashes the server with freeze and clone spam",
	funct = function()
		if hasPerm or hasPersons then
			Chat(klprefix2.."regen")
		end

		for i = 1, 100 do
			Chat("freeze all all all")
			Chat("clone all all all")
		end
	end
})

addcommand({
	name = "shieldcrash",
	aliases = {},
	description = "crashes the server with shield, rocket and clone spam",
	funct = function()
		if hasPersons then
			for i = 1, 100 do
				Chat("shield/all/all/all")
				Chat("rocket/all/all/all")
				Chat("clone all all all")
			end
		else
			Remind("You need to Persons to use this command, sorry!")
		end
	end
})

addcommand({
	name = "logspam",
	aliases = {"spamlogs","floodlogs","logflood"},
	description = "spam logs with text",
	funct = function()
		for i = 1, 100 do
			Chat("reset KohlsECO .on .top - .2024") -- the dots won't make people that have their username start on those words reset
		end
	end
})

addcommand({
	name = "house",
	aliases = {"tphouse"},
	description = "teleport to the house",
	funct = function()
		lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-31.0896435, 8.22999477, 70.522644, -0.999961913, 4.495271e-08, -0.0087288795, 4.55292621e-08, 1, -6.58523618e-08, 0.0087288795, -6.62472743e-08, -0.999961913)
	end
})

addcommand({
	name = "spawn",
	aliases = {"tpspawn"},
	description = "teleport to spawn",
	funct = function()
		lplr.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-29, 3.70000005, -25.5900116))
	end
})

addcommand({
	name = "breakcam",
	aliases = {"nocam"},
	description = "break everyone's camera",
	funct = function()
		Chat("gear me 4842207161")
		repeat task.wait() until lplr.Backpack:FindFirstChild("AR")
		local cambrek = lplr.Backpack:FindFirstChild("AR")
		cambrek.Parent = lplr.Character

		task.wait(0.2)
		cambrek:Activate()

		Remind("The camera is now broken into shiftlock - you won't see the effect until you rejoin.")
	end
})


addcommand({
	name = "regen",
	aliases = {"regenerate"},
	description = "regenerate the admin pads",
	funct = function()
		if fireclickdetector then
			if workspace.Terrain["_Game"].Admin:FindFirstChild("Regen") then
				fireclickdetector(workspace.Terrain["_Game"].Admin.Regen.ClickDetector, 0)
			else
				Remind("The regen pad is not loaded - please find it first.")
			end	
		else
			Remind("Cannot regen; Your exploit does not support the fireclickdetector function.")
		end
	end
})

addcommand({
	name = "serverhop",
	aliases = {"shop","switchserver"},
	description = "switch to a different server",
	funct = function()
		local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
		for i,v in pairs(Servers.data) do
			if v.playing ~= v.maxPlayers then
				game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
			end
		end    
	end
})

addcommand({
	name = "anticrash",
	aliases = {"ac","antivg"},
	description = "toggle anti crash (gears only)",
	funct = function()
		if anticrash then
			anticrash = false
		else
			anticrash = true
		end
		Remind("Anti crash is now set to "..anticrash)
	end
})

addcommand({
	name = "unanticrash",
	aliases = {"unac","unantivg"},
	description = "turn off anti crash",
	funct = function()
		if anticrash then
			anticrash = false
		end
		Remind("Anti crash is now set to false.")
	end
})

addcommand({
	name = "antigear",
	aliases = {"ag"},
	description = "toggle anti gear",
	funct = function()
		if antigear then
			antigear = false
		else
			antigear = true
		end
		Remind("Anti gear is now set to "..antigear)
	end
})

addcommand({
	name = "unantigear",
	aliases = {"unag"},
	description = "turn off anti gear",
	funct = function()
		if antigear then
			antigear = false
		end
		Remind("Anti gear is now set to false.")
	end
})

addcommand({
	name = "antilag",
	aliases = {"al"},
	description = "toggle anti lag",
	funct = function()
		if antilag then
			antilag = false
		else
			antilag = true
		end
		Remind("Anti gear is now set to "..antilag)
	end
})

addcommand({
	name = "unantilag",
	aliases = {"unal"},
	description = "turn off anti lag",
	funct = function()
		if antilag then
			antilag = false
		end
		Remind("Anti lag is now set to false.")
	end
})

addcommand({
	name = "klv1",
	aliases = {"oldkohlslite","kohlslitev1"},
	description = "Open the legacy version of KohlsLite. This is still maintained!",
	funct = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Main%20Scripts/KohlsLite.lua"))()
	end
})

addcommand({
	name = "tank",
	aliases = {"wartank"},
	description = "turn someone into a tank",
	funct = function()
		local tankeng = args[2]
		Chat("removelimbs "..tankeng)
		task.wait(0.5)
		Chat("dog "..tankeng)
		task.wait(0.5)
		Chat("creeper "..tankeng)
		Remind("Turned the player into a tank!")
	end
})

addcommand({
	name = "cube",
	aliases = {"square"},
	description = "turn someone into a cube",
	funct = function()
		local imacube = args[2]
		Chat("unpackage "..imacube)
		for i = 1,15 do
			task.wait()
			Chat("size " .. imacube .. " .3")
		end
		Chat("paint " .. imacube .. " white")
		Chat("bighead " .. imacube)
		Chat("unsize " .. imacube)
		Chat("removelimbs " .. imacube)
		Chat("size " .. imacube .. " 2.5")
		Chat("shiny " .. imacube)
		Remind("Turned the player into a cube!")
	end
})

addcommand({
	name = "ufo",
	aliases = {"flyingobject"},
	description = "turn someone into a ufo",
	funct = function()
		local ufo = args[2]
		for i = 1, 7 do
			Chat("size "..ufo.." 0.3")
		end
		Chat("unsize "..ufo)
		Chat("size "..ufo.." 4")
		Chat("paint "..ufo.." brown")
		task.wait(0.25)
		Chat("removelimbs "..ufo)
		Chat("dog "..ufo)
		Chat("rainbowify "..ufo)
		Chat("spin "..ufo)
		Remind("Turned the player into a UFO!")
	end
})

addcommand({
	name = "rat",
	aliases = {"yuckify"},
	description = "turn someone into a rat",
	funct = function()
		local eww = args[2]
		Chat("char "..eww.." 6")
		task.wait(1)
		Chat("hat "..eww.." 6203125039")
		Chat("size "..eww.." 0.8")
		Chat("speed "..eww.." 26")
		Remind("Turned the player into a rat!")
	end
})

addcommand({
	name = "titan",
	aliases = {"onepiece"},
	description = "turn someone into a titan",
	funct = function()
		local thatanime = args[2]
		Chat("char "..thatanime.." 4")
		task.wait(1.2)
		Chat("skydive "..thatanime)
		Chat("paint "..thatanime.." red")
		Chat("size "..thatanime.." 5")
		Chat("speed "..thatanime.." 24")
		Chat("pants "..thatanime.." 1187508947")
		Remind("Turned the player into a titan!")
	end
})

addcommand({
	name = "speaker",
	aliases = {},
	description = "turn someone into a speaker",
	funct = function()
		local spek = args[2]
		Chat("char "..spek.." 1702851506")
		task.wait(1.2)
		Chat("skydive "..spek)
		task.wait(.35)
		Chat("size "..spek.." 0.3")
		Chat("size "..spek.." 0.3")
		Chat("creeper "..spek)
		Chat("paint "..spek.." black")
		Chat("size "..spek.." 10")
		Chat("size "..spek.." 5")
		Chat("speed "..spek.." 32")
		task.wait(.35)
		Chat("paint "..spek.." black")
		Remind("Turned the player into a speaker!")
	end
})

addcommand({
	name = "taxi",
	aliases = {"rider"},
	description = "turn someone into a taxi",
	funct = function()
		local taxi = args[2]
		Chat("dog "..taxi)
		Chat("paint "..taxi.." gold")
		Chat("speed "..taxi.." 100")
		Chat("trail "..taxi.." gold")
		Chat("god "..taxi)
		Chat("unhat "..taxi)
		Remind("Turned the player into a taxi!")
	end
})

addcommand({
	name = "smoothie",
	aliases = {"blender"},
	description = "blender someone up",
	funct = function()
		local ahhno = args[2]
		Chat("jail "..ahhno)
		Chat("stun "..ahhno)
		Chat("spin "..ahhno)
		Chat("fire "..ahhno)
		Remind("Blendered the player!")
	end
})

addcommand({
	name = "tnt",
	aliases = {"creeper","explosion"},
	description = "turn someone into a creeper",
	funct = function()
		local tnt = args[2]
		Chat("removepants "..tnt)
		Chat("removeshirt "..tnt)
		Chat("paint "..player.." red")
		task.wait(1)
		Chat("bonfire "..tnt)
		task.wait(2)
		Chat("explode "..tnt)
		Remind("Exploded the player like a creeper!")
	end
})

addcommand({
	name = "headfloat",
	aliases = {"floathead"},
	description = "make someone's head float!",
	funct = function()
		local hf = args[2]
		Chat("size "..hf.." 0.5")
		task.wait(0.25)
		Chat("bighead "..hf)
		task.wait(0.25)
		Chat("unsize "..hf)
		Remind("Made the player's head float!")
	end
})

addcommand({
	name = "coconut",
	aliases = {"coco"},
	description = "turn a player into a coconut!",
	funct = function()
		local coco = args[2]
		Chat("char "..coco.." 5")
		task.wait(1.2)
		Chat("paint "..coco.." brown")
		for i = 1, 5 do
			Chat("size "..coco.." .3")
		end
		Chat("unsize "..coco)
		Chat("size "..coco.." 2")
		task.wait(0.3)
		Chat("paint "..coco.." brown")
		Remind("Turned the player into a coconut!")
	end
})

addcommand({
	name = "icetower",
	aliases = {"itower"},
	description = "create a ice tower with a player!",
	funct = function()
		local icet = args[2]
		for i = 1, 30 do
			Chat("size " .. icet .. " .6")
			Chat("seizure " .. icet)
			Chat("freeze " .. icet)
			Chat("unsize " .. icet)
		end
		Remind("Turned the player into an ice tower!")
	end
})

addcommand({
	name = "amputate",
	aliases = {"cutup","cutoff"},
	description = "amputate a player",
	funct = function()
		local amp = args[2]	
		Chat("size " .. amp .. " 10")
		task.wait(.3)
		Chat("freeze " .. amp)
		task.wait(.3)
		Chat("trip " .. amp)
		task.wait(.3)
		Chat("unsize " .. amp)
		task.wait(.3)
		Chat("paint " .. amp .. " red")
		Remind("Amputated the player!")
	end
})

addcommand({
	name = "skybox",
	aliases = {},
	description = "skybox a player",
	funct = function()
		local skbox = args[2]
		Chat("size " .. skbox .. " .3")
		Chat("freeze " .. skbox)
		Chat("size " .. skbox .. " 10")
		Chat("goldify " .. skbox)
		Chat("clone " .. skbox)
		Chat("reset " .. skbox)
		Remind("Skyboxed the player!")
	end
})

addcommand({
	name = "headroot",
	aliases = {"roothead"},
	description = "headroot a player",
	funct = function()
		local hroot = args[2]
		Chat("size " .. hroot .. " 10")
		task.wait()
		Chat("freeze " .. hroot)
		task.wait()
		Chat("bighead " .. hroot)
		task.wait()
		Chat("size " .. hroot .. " .3")
		task.wait()
		Chat("thaw " .. hroot)
		task.wait()
		Chat("unsize " .. hroot)
		Remind("Headrooted the player!")
	end
})

addcommand({
	name = "headrise",
	aliases = {"risehead"},
	description = "headrise a player",
	funct = function()
		local hrise = args[2]
		Chat("size " .. hrise .. " .3")
		task.wait()
		Chat("bighead " .. hrise)
		task.wait()
		Chat("size " .. hrise .. " 10")
		task.wait()
		Chat("thaw " .. hrise)
		task.wait()
		Chat("unsize " .. hrise)
		Remind("Headrised the player!")
	end
})

addcommand({
	name = "glitch",
	aliases = {"glitchify"},
	description = "glitch a player with the dagger of shattered dimensions",
	funct = function()
		local dosd = args[2]
		Chat("gear me 71037101")
		repeat task.wait() until lplr.Backpack:FindFirstChild("DaggerOfShatteredDimensions")
		dagg = lplr.Backpack:FindFirstChild("DaggerOfShatteredDimensions")
		task.wait()
		dagg.Parent = lplr.Character
		task.wait()
		Chat("god "..dosd)
		Chat("tp "..dosd.." me")
		game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.Q,false,game)
		task.wait(2)
		Chat("reset me")
		Remind("Glitched the player!")
	end
})


addcommand({
	name = "iceblock",
	aliases = {"blockice"},
	description = "create an iceblock with a player",
	funct = function()
		local theblock = args[2]
		if theblock == "me" or theblock == "" then
			lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,-40,0)
		end
		task.wait(0.25)
		Chat("invisible "..theblock)
		task.wait()
		Chat("freeze "..theblock)
		task.wait()
		Chat("size "..theblock.." 10")
		task.wait()
		Chat("clone "..theblock)
		task.wait()
		Chat("respawn "..theblock)
		Remind("Created a big ice block with the player!")
	end
})

addcommand({
	name = "qpunish",
	aliases = {"quickpunish"},
	description = "punish a player then regen",
	funct = function()
		local trolled = args[2]
		Chat("punish " ..trolled)
		Regen()
		Remind("Quick punished the player")
	end
})

addcommand({
	name = "spunish",
	aliases = {"speedpunish"},
	description = "speed a player to infinity then regen",
	funct = function()
		local trolled = args[2]
		Chat("speed " ..trolled.. " inf")
		Regen()
		Remind("Speed punished the player")
	end
})

addcommand({
	name = "gpunish",
	aliases = {"gravpunish","setgravpunish"},
	description = "setgrav a player to -9e9 then regen",
	funct = function()
		local trolled = args[2]
		Chat("setgrav " ..trolled.. " -9e9")
		Regen()
		Remind("Setgrav punished the player")
	end
})

nokmode = false

addcommand({
	name = "tnok",
	aliases = {"temporarynok"},
	description = "toggle temporary no obby kill",
	funct = function()
		for i, v in pairs(game:GetService("Workspace").Terrain._Game.Workspace.Obby:GetChildren()) do  
			if nokmode == false then
				v.CanTouch = false
			else
				v.CanTouch = true
			end
		end
		nokmode = not nokmode
		Remind("NOK mode is set to "..nokmode)
	end
})

addcommand({
	name = "untnok",
	aliases = {"untemporarynok"},
	description = "turn off temporary no obby kill",
	funct = function()
		for i, v in pairs(game:GetService("Workspace").Terrain._Game.Workspace.Obby:GetChildren()) do  
			if nokmode == true then
				v.CanTouch = true
			end
		end
		nokmode = false
		Remind("NOK mode is set to false.")
	end
})

alreadydunit_nok = false
addcommand({
	name = "nok",
	aliases = {"noobbykill"},
	description = "turn on permanent no obby kill (CANNOT BE TURNED OFF)",
	funct = function()
		if alreadydunit_nok then Remind("You've already used this command!") end
		for i, v in pairs(game:GetService("Workspace").Terrain._Game.Workspace["Obby"]:GetDescendants()) do
			if v.Name == "TouchInterest" then
				v:Destroy()
			end
		end
		alreadydunit_nok = true
	end
})

addcommand({
	name = "nok2",
	aliases = {"noobbykill2"},
	description = "turn on permanent no obby kill (CANNOT BE TURNED OFF)",
	funct = function()
		if alreadydunit_nok then Remind("You've already used this command!") end
		for i, v in pairs(workspace.Terrain["_Game"]["Workspace"].Obby:GetDescendants()) do
			if v:IsA("TouchTransmitter") then 
				v:Destroy() 
			end
		end
		alreadydunit_nok = true 
	end
})

addcommand({
	name = "ungearban",
	aliases = {"ungb"},
	description = "ungearban a player (including yourself)",
	funct = function()
		local plrg = args[2]
		if plrg == "" or plrg == "me" then
			game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
			Remind("Ungearbanned yourself.")
		else 
			--
		end
	end
})

local spamming = false
local function getPlayer(p): Player
	for i, v in game.Players:GetPlayers() do
		if v.Name:lower():sub(1, p:len()) == p:lower() or v.DisplayName:lower():sub(1, p:len()) == p:lower() then
			return v
		end
	end
end
addcommand({
	name = "rocketkick",
	aliases = {"rkick"},
	description = "crashes a player (person299)",
	funct = function()
		if hasPersons then
			local plrg = args[2]
			if not getPlayer(plrg) then
				Remind("Invalid player")
				return
			end
			Chat(`jail/{plrg}`)
			for i = 1, 128 do
				Chat(`rocket/{plrg} me {plrg} me`)
			end
			task.wait(.49)
			spamming = true
			local p = getPlayer(plrg)
			repeat
				Chat("rocket/all all all")
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.Angles(0,math.rad(180),0)*CFrame.new(0,0,-2)
				if lplr.Character:FindFirstChild("Rocket") then
					lplr.Character.Rocket.CanCollide = false
					task.delay(.5, function()
						lplr.Character.Rocket:Destroy()
					end)
				end
				if p.Character:FindFirstChild("Rocket") then
					p.Character.Rocket.CanCollide = false
					task.delay(.5, function()
						p.Character.Rocket:Destroy()
					end)
				end
				task.wait()
			until not spamming or not getPlayer(plrg)
		else
			return Remind("Person299 is required to use this command")
		end
	end
})
