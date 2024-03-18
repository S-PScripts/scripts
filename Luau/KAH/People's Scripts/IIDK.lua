-- plz no leak
print([[Ported to Kohls Admin House by iiDk
plz no leak >w<

to use:
use the command .mode or .switch and choose one of the following modes
kill - used by default
anchor - freezes the player
unanchor - unfreezes the player
nil - punishes player
nan - sets size to nan
smack - smacks the player (unequip hammer right after hitting someone with this enabled)
spin - spins the player and plays music
smite - paints player black and explodes them
fling - flings the player
label - gives them a random name
furry - rawr
fem - maid outfit
color - paints the player a random color
duck - quack quack]])

local owner = game.Players.LocalPlayer
game.Players:Chat("gear me 10468797")
local hammer = owner.Backpack:WaitForChild("BanHammer")
local mode = "kill"

local phrases = {"Missclick","Really","Oops","Why","That is a very bad sin","while true do end","LOLWUT","You have been spun"}

owner.Chatted:Connect(function(msg)
	local BM = string.split(msg," ") -- FIREYAUTO
	if BM[1] == "/e" then
		table.remove(BM,1)
	end

	if string.lower(BM[1]) == ".mode" or string.lower(BM[1]) == ".switch" then
		mode = BM[2]
	end
end)

hammer.Handle.Touched:Connect(function(p)
	local sound = 10730819
	if p.Parent == owner.Character then return end
	if not p.Parent:FindFirstChild("Humanoid") then return end
	if #p.Parent.Name:split(" ")>1 then return end
	if mode == "kill" then
		game.Players:Chat("kill "..p.Parent.Name)
	end
	if mode == "unanchor" then
		sound = 12221990
		game.Players:Chat("unfreeze "..p.Parent.Name)
	end
	if mode == "anchor" then
		sound = 12222152
		game.Players:Chat("freeze "..p.Parent.Name)
	end
	if mode == "nil" then
		if p.Name ~= "Base" then
			sound = 4676738150
			game.Players:Chat("punish "..p.Parent.Name)
		end
	end
	if mode == "nan" then
		if p.Name ~= "Base" then
			sound = 135361652
			game.Players:Chat("size "..p.Parent.Name.." nan")
		end
	end
	if mode == "smack" then
		if p.Name ~= "Base" then
			sound = 5886215922
			game.Players:Chat("speed "..p.Parent.Name.." 0")
			game.Players:Chat("tp "..p.Parent.Name.." me")
			spawn(function()
			    wait(0.8)
			    game.Players:Chat("/e point")
			    wait(0.1)
			    game.Players:Chat("fling "..p.Parent.Name)
			end)
		end
	end
	if mode == "spin" then
	    sound = 1846368080
		game.Players:Chat("music 1846368080")
		game.Players:Chat("spin "..p.Parent.Name)
		game.Players:Chat("speed "..p.Parent.Name.." 0")
	end
	if mode == "smite" then
		sound = 12222030
		game.Players:Chat("ff me")
		game.Players:Chat("explode "..p.Parent.Name)
		game.Players:Chat("kill "..p.Parent.Name)
		game.Players:Chat("paint "..p.Parent.Name.." Really black")
		spawn(function()
		    wait(1)
		    game.Players:Chat("unff me")
		   end)
	end
	if mode == "fling" then
		sound = 12222046
		game.Players:Chat("fling "..p.Parent.Name)
	end
	if mode == "label" then
		sound = 12222140
		game.Players:Chat("name "..p.Parent.Name.." "..phrases[math.random(1,#phrases)])
	end
	if mode == "furry" then
	    sound = 4821245570
	    spawn(function()
	        v = game.Players[p.Parent.Name]
        game.Players:Chat("char "..v.Name.." 18")
        wait(0.5)
        game.Players:Chat("paint "..v.Name.." Institutional white")
        wait()
        game.Players:Chat("hat "..v.Name.." 10563319994")
        wait()
        game.Players:Chat("hat "..v.Name.." 12578728695")
        wait()
        game.Players:Chat("shirt "..v.Name.." 10571467676")
        wait()
        game.Players:Chat("pants "..v.Name.." 10571468508")
        wait()
        game.Players:Chat("tp "..v.Name.." me")
        end)
	end
	if mode == "fem" then
	    sound = 5064301214
	    spawn(function()
	    game.Players:Chat("char "..p.Parent.Name.." 31342830")
	    v = game.Players[p.Parent.Name]
        repeat wait() until v and v.Character and v.Character:FindFirstChild("Ultra-Fabulous Hair")
        wait(0.3)
        game.Players:Chat("removehats "..p.Parent.Name)
        wait()
        game.Players:Chat("paint "..p.Parent.Name.." Institutional white")
        wait()
        game.Players:Chat("hat "..p.Parent.Name.." 7141674388")
        wait()
        game.Players:Chat("hat "..p.Parent.Name.." 7033871971")
        wait()
        game.Players:Chat("shirt "..p.Parent.Name.." 5933990311")
        wait()
        game.Players:Chat("pants "..p.Parent.Name.." 7219538593")
        wait()
        game.Players:Chat("tp "..v.Name.." me")
        end)
	end
	if mode == "color" then
		game.Players:Chat("paint "..p.Parent.name.." "..BrickColor.Random().Name)
	end
	if mode == "duck" then
		game.Players:Chat("invisible "..p.Parent.Name)
		game.Players:Chat("hat "..p.Parent.Name.." 6532336503")
		game.Players:Chat("spin "..p.Parent.Name)
		game.Players:Chat("speed "..p.Parent.Name.." 0")
	end
	if mode == "color" then
		game.Players:Chat("music 11900833")
	else
		game.Players:Chat("music "..tostring(sound))
	end
	repeat wait()  until game:GetService("Workspace").Terrain["_Game"].Folder.Sound.IsLoaded
	spawn(function()
	    wait(game:GetService("Workspace").Terrain["_Game"].Folder.Sound.TimeLength)
	    game.Players:Chat("music nan")
	   end)
end)
