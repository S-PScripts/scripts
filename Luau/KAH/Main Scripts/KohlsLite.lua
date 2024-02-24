--[[
_  _____  _   _ _     ____  _     ___ _____ _____ 
| |/ / _ \| | | | |   / ___|| |   |_ _|_   _| ____|
| ' / | | | |_| | |   \___ \| |    | |  | | |  _|  
| . \ |_| |  _  | |___ ___) | |___ | |  | | | |___ 
|_|\_\___/|_| |_|_____|____/|_____|___| |_| |_____| v1.075

-- CREATED BY TS2021/SCRIPTINGPROGRAMMER
-- CREDITS TO MANY... (check credits by doing .kcmds by executing and scrolling to the bottom)
-- COMPILER USED: https://www.tutorialspoint.com/execute_lua_online.php

stuff this script DOESN'T HAVE
1. Visualisers and drawing - I have no persons, I'll try getting it someday but for now I'll work on other features.
2. Rockmap, stomemap -- really obscure commands to be honest 

stuff in the works
1. i forgor ]]

if _G.executed then 
	return 
	print("Did you execute this script twice?") 
end

_G.executed = true

local prefix = "." -- ANY LENGTH :D
local blacklist = {"SlenderMan990921","EhiplayYN","e5usp","Asphetto","91txt","LeanConsumer69","xtyzmia","Fixydrqma","Robloxian577226532","jjthejoker7"} -- slocked users
local whitelist = {"me_123eq","me_crashking","ScriptingProgrammer","G_ODt","BANNter_Original","witnessfox22","IceStuds","atprog","dawninja21","Dawninja21alt"} -- not affected by slock
local newplrslocked = {"place"} -- don't edit!!
local newplrautoslock = true -- if new players under 21 days join they get blacklisted
local newlen = 21 -- control what is considered as a new account
local GWhitelisted = {"me_123eq","me_crashking","ScriptingProgrammer","G_ODt","BANNter_Original","witnessfox22","IceStuds","atprog"} -- gear whitelisted
local slockenabled = false -- slock

local permusers = {} -- users that use perm will be placed here
local personsusers = {} -- users that use persons will be placed here

local rkick_on_sight = {"rkick"} -- rocket kick player when they join
local crash_on_sight = {"SlenderMan990921"} -- crash server when player joins
local mkick_on_sight = {"mkick"} -- kick player with pm spam when they join ONLY WORKS WITH ONE PLAYER
local suser_on_sight = {"suser"} -- slow a user when they join with car gear ONLY WORKS WITH ONE PLAYER

local periastronlist = {"108158379", "80661504", "233520257", "73829193", "69499437", "139577901", "2544549379", "120307951", "99119240", "93136802", "80597060", "159229806", "77443461"}

-- Bad formatting because of github glitch ruining how the colour of the code looks :/
local musiclist = {"9048375035", -- 1
		   "6680495507", -- 2
		   "6529070845", -- 3
		   "6917155909", -- 4
		   "6913550990", -- 5
		   "6847929757", -- 6
                   "1839029458", -- 7
                   "35930009", -- 8
	           "6772846771", -- 9
	           "11808880515", -- 10
	           "6681840651", -- 11
	           "1841647093", -- 12
	           "1837070127", -- 13
	           "6806140478", -- 14
	           "6703926669", -- 15
	           "2042581436", -- 16
	           "6872126938", -- 17
	           "6695430066", -- 18
	           "5216738441", -- 19
                   "9038620433", -- 20
	           "6819593773", -- 21
                   "8147012902", -- 22
                   "6893776529", -- 23
                   "6788646778", -- 24
     		   "9124780123", -- 25
                   "6897686359", -- 26
	           "142376088", -- 27
                   "1846368080", -- 28
                   "1840511219", -- 29
                   "1839404854", -- 30
                   "6674211522", -- 31
		   "6984999899", -- 32
		   "1838097718", -- 33
		   "9038845849", -- 34
		   "1843622301", -- 35
		   "14145620056", -- 36
		   "13530437708", -- 37 
		   "14145627857", -- 38
		   "14145624031", -- 39
		   "13530438299", -- 40
		   "6845637094", -- 41
		   "6770303644", -- 42
		   "6783714255", -- 43
		   "1838028467"} -- 44
      
local musicnames = {"All dropping 8 beats", -- 1
		    "Robbery", -- 2
	            "Loud music", -- 3
	            "They trying to be cray", -- 4
	            "TLT FNAF 2", -- 5
                    "LONER", -- 6
	            "fUn cAmPiNg mUsIc", -- 7
	            "the loop", -- 8
	            "FIRE IN THE HOLE", -- 9
	            "women song", -- 10
	            "gun shots", -- 11
	            "chill elevator", -- 12
	            "fresh air", -- 13
	            "is it the end", -- 14
		    "memories...", -- 15
		    "AHHHH", -- 16 
		    "walter white", -- 17
		    "nuts", -- 18
	            "obamium 3d", -- 19
                    "blap blap", -- 20
	            "feels like the metro", -- 21
                    "gigachad loop", -- 22
	            "ahh wahh haahh", -- 23
		    "interstellar", -- 24
	            "boom boom", -- 25
	            "fizz", -- 26
	            "Raining Tacos", -- 27
                    "PARTY", -- 28
                    "Fanfare", -- 29
		    "rockin", -- 30
		    "Loud music fail", -- 31
		    "AAAAAAAAAAAAAAAAAAAAA", -- 32
		    "Fanfare 2", -- 33
		    "dubstep", -- 34
		    "mumbai moon", -- 35
		    "phonk 1", -- 36
		    "phonk 2", -- 37 
		    "phonk 3", -- 38
		    "phonk 4", -- 39
		    "phonk 5", -- 40
		    "hayayaya", -- 41
		    "seize", -- 42
		    "pg", -- 43
		    "vip"} -- 44

local gearcodes = {
    "212641536", -- 1
    "94794847", -- 2
    "92628079", -- 3
    "82357101", -- 4
    "28277486", -- 5
    "16924676", -- 6
    "34870758", -- 7
    "79736563", -- 8
    "18474459", -- 9
    "93136746", -- 10
    "11999247", -- 11
    "77443461"  -- 12
}

local gears = {
    "boombox",  -- 1
    "vg",       -- 2
    "osas",     -- 3
    "gb",       -- 4
    "bhbomb",   -- 5
    "tictac",   -- 6
    "pgun",     -- 7
    "camfixer", -- 8
    "painter",  -- 9
    "telemon",  -- 10
    "trapmine", -- 11
    "timegears" -- 12
}

local charcodes = {
    "4844006008",  -- 1
    "1267527674", -- 2
    "13645", 	  -- 3
    "548456077",  -- 4
    "45024180",   -- 5
    "1593471275"  -- 6
}

local chars = {
    "furry",      -- 1
    "sierr",      -- 2
    "telac",      -- 3
    "epicszs",    -- 4
    "temi",       -- 5
    "seek"        -- 6
}

local autoblvgc = true -- retards kept gearing everyone so here's a quick fix

local antimlog = false -- for music
local antiglog = false -- for gears
local anticlog = false -- for chars

local padbanned = {"padbanned"} 
local padreinforcements = false 

local Game_Folder = game:GetService("Workspace").Terrain["_Game"]
local Workspace_Folder = Game_Folder.Workspace
local Admin_Folder = Game_Folder.Admin

local themecode = {
    [[time 4,outdoorambient 000 000 111]],
    [[fogend 100,fogcolor 250 0 500]],
    [[time 19,outdoorambient 250 100 250]],
    [[time -,fogend 600,fogcolor 300 0 800]],
    [[time -,fogend 25,fogcolor 255 255 51]],
    [[time 0,fogcolor 0 0 0,fogend 25]],
    [[fogend 75,fogcolor 0 155 255]],
    [[time -,fogend 46,fogcolor 250 83 255]],
    [[time -,fogend 1000,fogcolor 37 355 55]],
    [[fogcolor 100 0 255,fogend 1000,time 6,outdoorambient 0 0 0,brightness 0.5,ambient 125 0 255]],
    [[fix,time 7,fogend 2000,outdoorambient 0.3 0.3 0.3]]
}

local housekeybind = "h" -- Keybinds?!
local rekeybind = "r"

local autogpcheck = true -- automatically check for player's gamepasses
local clickexplode = true

local FAdmins = {} -- all admin but for individual users
local alladmin = false -- all admin
local amon = 100 -- super command times
local spamwait = 0 -- spam command wait

local dontannounce = false -- for ecrash only, don't change!!!!

local perm = false
local perm2 = false
local loopgrab = false
local loopgrab2 = false

local anticrash = true
local anticrash2 = false
local antigear = false
local antigear2 = false
local antigb = true
local antipaint = false
local antiattach2 = false

local antiflash = false
local antidisco = false
local antifogend = false
local antichat = false
local antiattach = false
local YOUantigs = false

local gjdelock = false

local PingLogs = false -- it's caps lol
local PingCsystem = true
local AntiLogs = false

local antimusic = false
local noobdetect = true
local welcomemsg = true

-- CHAT MODULE
local function Chat(msg)
      game.Players:Chat(msg)
end

local function Speak(msg)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end

-- local permpassid = 66254 or 64354 -> NBC, BC
-- local personpassid = 35748 or 37127 --> NBC, BC

print("Thank you for using KohlsLite v1.075! Created by S_P.")
print("Say .kcmds to list some of the commands. DM ts2021 for the full list.")
print("ANTI NOTES: do .antijailm for yourself, .antijaila for everyone etc...")
print("pm me Yes, this script is buggy but it's not exactly finished. There's many stuff i'm still adding.")
Chat("h \n\n\n [KohlsLite]: Executed! v1.075 \n\n\n")

--[[ if MarketplaceService:UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 66254) or MarketplaceService:UserOwnsGamePassAsync(Player.UserId, 64354) then
        perm = false 
	hasperm = true -- used
	print("A perm pad was not given - you have the Perm Admin gamepass!")
else
        perm = true
	hasperm = false -- used
	print("A perm pad was given - you don't have the Perm Admin gamepass!")
end

if MarketplaceService:UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 35748) or MarketplaceService:UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 37127) then
	haspersons = true -- used!
	print("You have Person299's Admin!")
else
	haspersons = false -- used!
	print("You do not have Person299's Admin!")
end]]

game.Players.LocalPlayer.Chatted:Connect(function(msg)
	task.wait(0)
    	if string.sub(msg:lower(), 1, #prefix + 5) == prefix.."kcmds" then
          CMDPrint()
        end

	if string.sub(msg:lower(), 1, #prefix + 5) == prefix.."theme" then
		Chat("fix")
 		local theme = tonumber(string.sub(msg:lower(), #prefix + 6))
        	local themeCode = themecode[theme]
        	if themeCode then
            		local codes = {}
            		for code in themeCode:gmatch("[^,]+") do
                		table.insert(codes, code)
           	        end
            		for _, code in ipairs(codes) do
                		Chat(code)
            		end
        	end
        end
  
    	if string.sub(msg:lower(), 1, #prefix + 2) == prefix.."iy" then
	   GExecute("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
	end

	if string.sub(msg:lower(), 1, #prefix + 5) == prefix.."cmdpi" then -- well, you need that visualiser, do you?
		GExecute("https://raw.githubusercontent.com/quivings/KAH/main/CMD%20v3.lua")
	end

	if string.sub(msg:lower(), 1, #prefix + 4) == prefix.."cmdy" then
		GExecute("https://raw.githubusercontent.com/quivings/KAH/main/CMD-Y%20(v1.56).lua")
	end

	if string.sub(msg:lower(), 1, #prefix + 6) == prefix.."tricky" then -- CREDITS TO TECH
		GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Other%20Scripts/Tricky%20Lyrics%20non%20persons.lua")
	end
		
	if string.sub(msg, 1, #prefix + 2)  == prefix..'wl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 4)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                Chat("h \n\n\n [KohlsLite]: "..player.." has been whitelisted! \n\n\n")
                table.insert(whitelist, player)
                Chat('unblind '..player)
                Chat('unpunish '..player)
         else
                print('Cannot find player with the name: '..dasplayer)
         end
       end

       if string.sub(msg, 1, #prefix + 4) == prefix..'unwl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 6)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                Chat("h \n\n\n [KohlsLite]: "..player.." has been unwhitelisted. \n\n\n")
                table.remove(whitelist, table.find(whitelist, player))
         else
                print('Cannot find player with the name: '..dasplayer)
         end
       end
		
	if string.sub(msg, 1, #prefix + 6)  == prefix..'wllist' then
         for i = 1, #whitelist do
 		 print(whitelist[i])
	 end
        end

	if string.sub(msg, 1, #prefix + 8)  == prefix..'antimlog' then
		antimlog = true
	end

	if string.sub(msg, 1, #prefix + 10)  == prefix..'unantimlog' then
		antimlog = false
	end

	if string.sub(msg, 1, #prefix + 5)  == prefix..'admin' then
         local dasplayer = string.sub(msg:lower(), #prefix + 7)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                Chat("h \n\n\n [KohlsLite]: "..player.." has been given admin! \n\n\n")
                table.insert(FAdmins, player)
         else
                print('Cannot find player with the name: '..dasplayer)
         end
       end
	
	if string.sub(msg, 1, #prefix + 7)  == prefix..'unadmin' then
         local dasplayer = string.sub(msg:lower(), #prefix + 9)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                Chat("h \n\n\n [KohlsLite]: "..player.." has been removed from admin. \n\n\n")
                table.remove(FAdmins, table.find(FAdmins, player))
         else
                print('Cannot find player with the name: '..dasplayer)
         end
       end

       if string.sub(msg, 1, #prefix + 9)  == prefix..'listadmins' then
         for i = 1, #FAdmins do
 		 print(FAdmins[i])
	 end
        end

	if string.sub(msg, 1, #prefix + 6)  == prefix..'gearwl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 8)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                Chat("h \n\n\n [KohlsLite]: "..player.." has been whitelisted from anti-gears! \n\n\n")
                table.insert(GWhitelisted, player)
         else
                print('Cannot find player with the name: '..dasplayer)
         end
       end

	if string.sub(msg, 1, #prefix + 8)  == prefix..'ungearwl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 10)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                Chat("h \n\n\n [KohlsLite]: "..player.." has been unwhitelisted from anti-gears. \n\n\n")
                table.remove(GWhitelisted, table.find(GWhitelisted, player))
         else
                print('Cannot find player with the name: '..dasplayer)
         end
       end

	if string.sub(msg, 1, #prefix + 10)  == prefix..'gearwllist' then
         for i = 1, #GWhitelisted do
 		 print(GWhitelisted[i])
	 end
        end

	if string.sub(msg, 1, #prefix + 6)  == prefix..'fogvis' then -- guys is this FONALC
		fogdance = true
	end

	if string.sub(msg, 1, #prefix + 8)  == prefix..'unfogvis' then -- guys is this FONALC
		fogdance = false
		Chat("fix")
	end

       if string.sub(msg, 1, #prefix + 2) == prefix..'bl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 4)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                Chat("h \n\n\n [KohlsLite]: "..player.." has been blacklisted. \n\n\n")
                table.insert(blacklist, player)
         else
                print('Cannot find player with the name: '..dasplayer)
         end
       end

        if string.sub(msg, 1, #prefix + 4) == prefix..'unbl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 6)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                Chat("h \n\n\n [KohlsLite]: "..player.." has been unblacklisted! \n\n\n")
                table.remove(blacklist, table.find(blacklist, player))
                Chat('unblind '..player)
                Chat('unpunish '..player)
         else
                print('Cannot find player with the name: '..dasplayer)
         end
       end

      if string.sub(msg, 1, #prefix + 9) == prefix..'checkperm' then
         local dasplayer = string.sub(msg:lower(), #prefix + 11)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
		checkforperm()
         else
                print('Cannot find player with the name: '..dasplayer)
         end
       end

       if string.sub(msg, 1, #prefix + 10) == prefix..'fcheckperm' then -- yummy bypass mmmm
          Chat("reset all")
	  Regen()
	  task.wait(1)
	  checkperm2 = true
	  Chat("ff admins")
	  task.wait(1)
	  checkperm2 = false
       end
		
       if string.sub(msg, 1, #prefix + 12) == prefix..'checkpersons' then
         local dasplayer = string.sub(msg:lower(), #prefix + 14)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
		checkforpersons()
         else
                print('Cannot find player with the name: '..dasplayer)
         end
        end

      if string.sub(msg, 1, #prefix + 8) == prefix..'checkgps' then
         local dasplayer = string.sub(msg:lower(), #prefix + 10)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
		checkforperm()
		checkforpersons()
         else
                print('Cannot find player with the name: '..dasplayer)
         end
       end
		
	if string.sub(msg, 1, #prefix + 6)  == prefix..'bllist' then
         for i = 1, #blacklist do
 		 print(blacklist[i])
	 end
        end

	if string.sub(msg, 1, #prefix + 9)  == prefix..'permusers' then
         for i = 1, #permusers do
 		 print(permusers[i])
	 end
        end

	if string.sub(msg, 1, #prefix + 12)  == prefix..'personsusers' then
         for i = 1, #personsusers do
 		 print(personsusers[i])
	 end
        end

       if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'adminjoy' then
		game.Players.LocalPlayer:Kick("you: 'i use adminjoy trash!' Anyways, ask ME to add the colourful seizure crap, don't use THAT!")
       end
		
       if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'slock' then
        Chat("h \n\n\n [KohlsLite]: Server is locked! \n\n\n")
        slockenabled = true
       end
    
       if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unslock' then
        slockenabled = false
        Chat("h \n\n\n [KohlsLite]: Server is unlocked! \n\n\n")
        Chat('unblind all')
        Chat('unpunish all')
       end

       if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'newplrslock' then
	  newplrautoslock = true
       end

       if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unnewplrslock' then
	  newplrautoslock = false
       end

       if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'autoblvgc' then
		autoblvgc = true
       end

       if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unautoblvgc' then
	  	autoblvgc = false
       end

	if string.sub(msg, 1, #prefix + 7)  == prefix..'npslist' then
         for i = 1, #newplrslocked do
 		 print(newplrslocked[i])
	 end
        end

      if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'plrnewlen' then
        	newlen = tonumber(string.sub(msg:lower(), #prefix + 11))
      end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'gmusic' then
        musicplay = tonumber(string.sub(msg:lower(), #prefix + 7)) 
        if musicplay ~= nil and musicplay >= 1 and musicplay <= #musiclist then
	    if dontannounce == false then
            	Chat("h \n\n\n [KohlsLite]: Playing music:" .. musicnames[musicplay] .. ". \n\n\n")
	    end
	    if antimlog then
            	Chat("music 00000000000000000000000000" .. musiclist[musicplay])
	    else
		Chat("music " .. musiclist[musicplay])
	    end
        else
            print("Invalid music number!")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'rgmusic' then
        musicplay = math.random(1, #musiclist)
        Chat("h \n\n\n [KohlsLite]: Playing music:" .. musicnames[musicplay] .. ". \n\n\n")
         if antimlog then
            	Chat("music 00000000000000000000000000" .. musiclist[musicplay])
	 else
		Chat("music " .. musiclist[musicplay])
	 end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'nmusic' then
       if musicplay == nil or musicplay == #musiclist  then
          musicplay = 1
       else            
          musicplay = musicplay + 1
       end
       Chat("h \n\n\n [KohlsLite]: Playing music:" .. musicnames[musicplay] .. ". \n\n\n")
       if antimlog then
            	Chat("music 00000000000000000000000000" .. musiclist[musicplay])
	else
		Chat("music " .. musiclist[musicplay])
	end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'pmusic' then
       if musicplay == nil or musicplay == 1  then
          musicplay = #musiclist
       else            
          musicplay = musicplay - 1
       end
       Chat("h \n\n\n [KohlsLite]: Playing music:" .. musicnames[musicplay] .. ". \n\n\n")
        if antimlog then
            	Chat("music 00000000000000000000000000" .. musiclist[musicplay])
	else
		Chat("music " .. musiclist[musicplay])
	end
    end

    if string.sub(msg, 1, #prefix + 9)  == prefix..'musiclist' then
         for i = 1, #musiclist do
 		 print("gmusic"..i.." - "..musiclist[i].." - "..musicnames[i])
	 end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'pausem' then
       for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Folder:GetDescendants()) do
	          if v:IsA("Sound") and v.Playing then
              	     v.Playing = false
          	  end
       end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'playm' then
      	for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Folder:GetDescendants()) do
          	  if v:IsA("Sound") and not v.Playing then
              	     v.Playing = true
                  end
      	end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'stopm' then
	      for i, v in pairs(game:GetDescendants()) do
        	    if v:IsA("Sound") then
                    v:Stop()
        	    end
        end   
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'startm' then
	      for i, v in pairs(game:GetDescendants()) do
        	    if v:IsA("Sound") then
                    v:Play()
        	    end
        end   
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'deiv' then -- ported from simplekah
		        Chat("h \n\n\n [KohlsLite]: Domain Expansion: Infinity Void \n\n\n")
                        local gjdeivfgend = 2000
                        local gjdeivrfgcl = 255
                        local gjdeivgfgcl = 255
                        local gjdeivbfgcl = 255
                        time = 7
                        for i = 1,100 do
                            task.wait(0.1)
                            gjdeivfgend = gjdeivfgend - 19
                            gjdeivrfgcl = gjdeivrfgcl - 2.55
                            gjdeivgfgcl = gjdeivgfgcl - 2.55
                            gjdeivbfgcl = gjdeivbfgcl - 2.55
                            time = time - 0.01
                            Chat("fogend " .. gjdeivfgend)
                            Chat("fogcolor " .. gjdeivrfgcl .. " " .. gjdeivgfgcl .. " " .. gjdeivbfgcl)
                            Chat("time " .. time)
                        end
                        gjdelock = true
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'undeiv' then  -- ported from simplekah
			Chat("fix")
			Chat("reload all")
                        gjdelock = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'tropics' then  -- ported from simplekah
		    local gjpfgend = 0
                    local gjbpfgcl = 0
                    local gjgpfgcl = 0
                    local gjrpfgcl = 200
                    local time = 10
                    Chat("h \n\n\n [KohlsLite]: Red glow... \n\n\n")
                    Chat("fogcolor 200 0 0")
                    Chat("outdoorambient 0 0 0")
                    Chat("time " .. time)
                    for i = 1,10 do
                            task.wait(0.2)
                            gjpfgend = gjpfgend + 100
                            Chat("fogend " .. gjpfgend)
                     end
                     Chat("h \n\n\n [KohlsLite]: Blue glow... \n\n\n")
                     for i = 1,10 do
                            task.wait(0.3)
                            time = time - 0.4
                            Chat("time " .. time)
                            gjpfgend = gjpfgend - 50
                            Chat("fogend " .. gjpfgend)
                            gjbpfgcl = gjbpfgcl + 20
                            Chat("fogcolor " .. "200 " .. "0 " .. gjbpfgcl)
                     end
                     Chat("h \n\n\n [KohlsLite]: Hollow Purple! >:) \n\n\n")
           	     Chat("speed others inf")
                     for i = 1,10 do
                            task.wait(0.2)
                            gjrpfgcl = gjrpfgcl + 5.5
                            gjbpfgcl = gjbpfgcl + 5.5
                            gjgpfgcl = gjgpfgcl + 25.5
                            gjpfgend = gjpfgend + 150
                            time = time + 0.1
                            game.Players:Chat("fogcolor " .. gjrpfgcl .. " " .. gjgpfgcl .. " " .. gjbpfgcl)
                            game.Players:Chat("fogend " .. gjpfgend)
                            game.Players:Chat("time " .. time)
                      end
    end
	
    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'volm' then -- rap e
   	    local newVolume = tonumber(string.sub(msg:lower(), #prefix + 6))
   	    if newVolume ~= nil and game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
      		    game:GetService("Workspace").Terrain["_Game"].Folder.Sound.Volume = newVolume
       	end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'musicid' then
	      if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
			      print("Current music ID: "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.SoundId)
	      end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'cvol' then
	      if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
			      print("Current volume: "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.Volume)
	      end	
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'timeframe' then
	      local tplace = tonumber(string.sub(msg:lower(), #prefix + 11))
	      if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
			game:GetService("Workspace").Terrain["_Game"].Folder.Sound.TimePosition = tplace 
	      end	
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'timefis' then
	      if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
			print("Current time position: "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.TimePosition)
	      end	
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'audiolol' then
       audiotroll = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unaudiolol' then
       audiotroll = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antimusic' then
       mymusiconly = false
       antimusic = true
    end
		
    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantimusic' then
       antimusic = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'permmusic' then
        musicoff = false
        mymusiconly = true
        mymusiconlyid = tonumber(string.sub(msg:lower(), #prefix + 11))
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'bring' then
        bringu = (string.sub(msg:lower(), #prefix + 7))
	Bring()
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'goto' then
        gotou = (string.sub(msg:lower(), #prefix + 6))
	Goto()
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix.."gear" then
        local args = string.split(msg, " ")
        if #args >= 3 then
            local target = args[2]
            local gearName = table.concat(args, " ", 3)
            local gearIndex = 0
            for i, name in ipairs(gears) do
                if name == gearName then
                    gearIndex = i
                    break
                end
            end
            if gearIndex ~= 0 then
                local gearCode = gearcodes[gearIndex]
                Chat("gear " .. target .. " " .. gearCode)
            else
            end
        else
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix.."char" then
        local args = string.split(msg, " ")
        if #args >= 3 then
            local target = args[2]
            local charName = table.concat(args, " ", 3)
            local charIndex = 0
            for i, name in ipairs(chars) do
                if name == charName then
                    charIndex = i
                    break
                end
            end
            if charIndex ~= 0 then
                local charCode = charcodes[charIndex]
                Chat("char " .. target .. " " .. charCode)
            else
            end
        else
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiabuse' then
	Chat("pm me antis are turned on!")
			antidisco = true
			antiflash = true
			antifogend = true
			antifogstart = true
			antitime = true
			antiambient = true
			antibrightness = true
			antioutamb = true
			YOUantiblind = true
			YOUantigs = true
			YOUanticlone, ALLanticlone = true, true
			YOUantifire, ALLantifire = true, true
			YOUantifreeze, ALLantifreeze = true, true
			YOUantifly, ALLantifly = true, true
			YOUantiff, ALLantiff = true, true
			YOUantiglow, ALLantiglow = true, true
			YOUantihealthc, ALLantihealthc = true, true
			YOUantijail, ALLantijail = true, true
			YOUantijump, ALLantijump = true, true
			YOUantikill, ALLantikill = true, true
			YOUantimsg = true
			YOUantiname, ALLantiname = true, true
			YOUantiexplode, ALLantiexplode = true, true
			YOUantichar, ALLantichar = true, true
			YOUantiparticles, ALLantiparticles = true, true
			YOUantipunish, ALLantipunish = true, true
			YOUantirocket, ALLantirocket = true, true
			YOUantisit, ALLantisit = true, true
			YOUantiseizure, ALLantiseizure = true, true
			YOUantismoke, ALLantismoke = true, true
			YOUantisparkles, ALLantisparkles = true, true
			YOUantispeed, ALLantispeed = true, true
			YOUantistun, ALLantistun = true, true
			YOUantiswag, ALLantiswag = true, true
			
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiabuse' then
	Chat("pm me antis are turned off!")
			antidisco = false
			antiflash = false
			antifogend = false
			antifogstart = false
			antitime = false
			antiambient = false
			antibrightness = false
			antioutamb = false
			YOUantiblind = false
			YOUantigs = false
			YOUanticlone, ALLanticlone = false, false
			YOUantifire, ALLantifire = false, false
			YOUantifreeze, ALLantifreeze = false, false
			YOUantifly, ALLantifly = false, false
			YOUantiff, ALLantiff = false, false
			YOUantiglow, ALLantiglow = false, false
			YOUantihealthc, ALLantihealthc = false, false
			YOUantijail, ALLantijail = false, false
			YOUantijump, ALLantijump = false, false
			YOUantikill, ALLantikill = false, false
			YOUantimsg = false
			YOUantiname, ALLantiname = false, false
			YOUantiexplode, ALLantiexplode = false, false
			YOUantichar, ALLantichar = false, false
			YOUantiparticles, ALLantiparticles = false, false
			YOUantipunish, ALLantipunish = false, false
			YOUantirocket, ALLantirocket = false, false
			YOUantisit, ALLantisit = false, false
			YOUantiseizure, ALLantiseizure = false, false
			YOUantismoke, ALLantismoke = false, false
			YOUantisparkles, ALLantisparkles = false, false
			YOUantispeed, ALLantispeed = false, false
			YOUantistun, ALLantistun = false, false
			YOUantiswag, ALLantiswag = false, false
			
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'bok' then
	  bokme = (string.sub(msg:lower(), #prefix + 5))
	  SuperCMD("dog "..bokme)
    end
	
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'goto2' then
  	 local dasplayer = string.sub(msg:lower(), #prefix + 7)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
		gotou = player
		Goto2()
         else
                print('Cannot find player with the name: '..dasplayer)
         end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'moveregen' then
	MoveRegen("move")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'moveadp' then
	MoveAdminPads("move")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'moveaddiv' then
	MoveAdminDividers()
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'movehouse' then
	MoveHouse()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'moveobb' then
	Chat(".tnok")
	MoveObbyBricks()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'moveobox' then
	MoveObbyBox()
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'lrobb' then
	 LocalObby("remove")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'laobb' then
	 LocalObby("add")
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'movebb' then
	MoveBuildingBricks()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'movebp' then
	MoveBasePlate("move")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'fixbp' then
	MoveBasePlate("fix")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'ufixbp' then
	MoveBasePlate("ufix")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'toregen' then
			regentp()
    end
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fixregen' then
	MoveRegen("fix")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fixadp' then
	MoveAdminPads("fix")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'findregen' then
	regenfind = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'nofindregen' then
	regenfind = false
    end
			
    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unpermmusic' then
        mymusiconly = false
        musicoff = true
	Chat("music OFF")
    end
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'offmusic' then
        musicoff = true
	Chat("music OFF")
    end
		
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'onmusic' then
        musicoff = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'remusic' then
       	Chat(".startm")
     end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'vgcrash' then
	VGCrash()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'pcrash' then
	PCrash()
	task.wait(1)
	PCrash()	
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fcrash' then
	FCrash()
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'dcrash' then
       DCrash()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'scrash' then -- not a silent crash!
	if haspersons == false then
	   print([["Sorry, you don't have Person's to perform this command!
		Commands required: shield"]])
	else
	SCrash()
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'rkick' then
	if haspersons == false then
	   print([["Sorry, you don't have Person's to perform this command!
		Commands required: rocket"]])
	else
		rkicker = (string.sub(msg:lower(), #prefix + 7))
		RKick()
	end
    end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'srkick' then
	if haspersons == false then
	   print([["Sorry, you don't have Person's to perform this command!
		Commands required: rocket"]])
	else
		rkicker = (string.sub(msg:lower(), #prefix + 8))
		srkick = true
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unsrkick' then
		srkick = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'welmsg' then
	welcomemsg = true
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unwelmsg' then
	welcomemsg = false
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'clickexplode' then
	clickexplode = true
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'unclickexplode' then
	clickexplode = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'control' then -- really funny ngl
		local dogman = string.sub(msg:lower(), #prefix + 9)
		Chat("dog me "..dogman)
		Chat("tp me "..dogman)
		task.wait(1)
		Chat("punish me "..dogman)
		Chat("undog me "..dogman)
		task.wait(0.25)
		Chat("unpunish me "..dogman)
		Chat("invis me")
    end
		
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antidisco' then
	antidisco = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantidisco' then
	antidisco = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiflash' then
	antiflash = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiflash' then
	antiflash = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antifogend' then
	antifogend = true
    end
		
    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantifogend' then
	antifogend = false
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'antifogstart' then
	antifogstart = true
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'unantifogstart' then
	antifogstart = false
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antitime' then
	antitime = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantitime' then
	antitime = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antiamb' then
	antiambient = true
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantiamb' then
	antiambient = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antibright' then
	antibrightness = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantibright' then
	antibrightness = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antioutamb' then
	antioutamb = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantioutamb' then
	antioutamb = false
    end
			
    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'adv' then
       ADVERTISEMENT()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'ipboom' then
       IPBOOM()
    end
		
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'logspam' then
       LogSpam()
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'slowplayer' then
	caruser = string.sub(msg:lower(), #prefix + 12)
	SlowP = true
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'supercmd' then
	supermessage = string.sub(msg:lower(), #prefix + 10)
	SuperCMD(supermessage)
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'supert' then
	amon = tonumber(string.sub(msg:lower(), #prefix + 10))
    end
		
   if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'spamt' then
	spamtext = string.sub(msg:lower(), #prefix + 7)
	spam = true
	spamon = true
    end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unspamt' then
	spam = false
	spamon = false
    end

   if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'chatz' then
	ChatFudge()
   end
		
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'spamw' then
	spamwait = string.sub(msg:lower(), #prefix + 7)
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'spamwait' then
	spamwait = string.sub(msg:lower(), #prefix + 10)
    end
		
   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'spamoff' then
	spamon = false
    end

  if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'spamon' then
	spamon = true
    end

  if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'admslayer' then
		local adm = string.sub(msg:lower(), #prefix + 11)
		if adm ~= "" then
			Chat("gear "..adm.." 268586231")
			Chat("gear "..adm.." 1103011681")
		else
			Chat("gear me 268586231")
			Chat("gear me 1103011681")
		end
  end

  if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'kp' then
		local kp = string.sub(msg:lower(), #prefix + 4)
		if kp ~= "" then
			Chat("gear "..kp.." 583030187")
			Chat("gear "..kp.." 68539623")

		else
			Chat("gear me 583030187")
			Chat("gear me 68539623")
		end
  end


  if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'icebreaker' then
		local iceb = string.sub(msg:lower(), #prefix + 12)
		if iceb ~= "" then
			Chat("gear "..iceb.." 87361662")
			Chat("gear "..iceb.." 66896601")
		else
			Chat("gear me 87361662")
			Chat("gear me 66896601")
		end
  end

  if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'sswords' then
		local per = string.sub(msg:lower(), #prefix + 9)
		if per ~= "" then
			for i = 1, #periastronlist do
					Chat("gear "..per.." ".. periastronlist[i])
       			end
		else
			for i = 1, #periastronlist do
					Chat("gear me ".. periastronlist[i])
       			end
		end
  end

  if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'ecrash' then
	    Chat("fix")
	    Chat(".gmusic42")
	    dontannounce = true -- lemme know if you want this to be a full feature
	    Chat("h \n\n\n [KohlsDefender]: This server was crashed because of an issue. \n\n\n")
	    task.wait(0.5)
            Chat("fogcolor 0 0 0")
	    Chat("time 0")
            Chat("fogend 0")
	    task.wait(0.5)
	    DCrash()	
    end
			
    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unslowplayer' then
	SlowP = false
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'snplayer' then
	nameuser = string.sub(msg:lower(), #prefix + 10)
	SName = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unsnplayer' then
	SName = false
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'sregen' then
	SRegen = true
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unsregen' then
	SRegen = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'autogpc' then
	autogpcheck = true
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unautogpc' then
	autogpcheck = false
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'padban' then
	 local dasplayer = string.sub(msg:lower(), #prefix + 8)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                Chat("h \n\n\n [KohlsLite]: "..player.." has been padbanned. \n\n\n")
                table.insert(padbanned, player)
         else
                print('Cannot find player with the name: '..dasplayer)
         end
    end
		
    if string.sub(msg, 1, #prefix + 8) == prefix..'unpadban' then
         local dasplayer = string.sub(msg:lower(), #prefix + 10)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                Chat("h \n\n\n [KohlsLite]: "..player.." has been unpadbanned! \n\n\n")
                table.remove(padbanned, table.find(padbanned, player))
         else
                print('Cannot find player with the name: '..dasplayer)
         end
    end

    if string.sub(msg, 1, #prefix + 8) == prefix..'padreinf' then
       Chat("h \n\n\n [KohlsLite]: Pad reinforcements are on. \n\n\n")
       padreinforcements = true
    end

    if string.sub(msg, 1, #prefix + 10) == prefix..'unpadreinf' then
       Chat("h \n\n\n [KohlsLite]: Pad reinforcements are off! \n\n\n")
       padreinforcements = false
    end
			
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'qattach' then
	QAttach()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'sattach' then
	QAttach2()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'biglogs' then
    	game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScrollGui").TextButton.Frame.Size = UDim2.new(0,1000,0,1000)
    end
		
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'regen' then
	Regen()
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'house' then
	House()
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'phelp' then
	House()
	task.wait(1)
	Chat("tp all me")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'spawn' then
	GSpawn()
    end

    if string.sub(msg, 1, #prefix + 7) == prefix..'execute' then
	Execute(string.sub(msg, #prefix + 9))
    end

    if string.sub(msg, 1, #prefix + 8) == prefix..'announce' then
	annsecret = string.sub(msg, #prefix + 10)
	Announce()
    end

    if string.sub(msg, 1, #prefix + 10) == prefix..'wmannounce' then
	annsecret = string.sub(msg, #prefix + 12)
	AnnounceWM()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'prefix' then
	prefix = string.sub(msg:lower(), #prefix + 8)
    end

    if string.sub(msg:lower(), 1, 7) == 'cprefix' then
	print("Your current prefix is "..prefix)
    end
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'paintmap' then
	_G.ColourHere = string.sub(msg, #prefix + 10) -- global as we use a loadstring here
	GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Other%20Scripts/Paint%20Map.lua")
    end
		
   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'autoafk' then
	autoafk = true
   end

   if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unautoafk' then
	autoafk = false
   end
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'adminall' then
       alladmin = true
       Chat("h \n\n\n [KohlsLite]: Everyone has been given admin! Chat any command. \n\n\n")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'nok' then
		NOK()
    end
		
    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'nok2' then
		NOK2()
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'tnok' then
		nokstat = true
		TNOK()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'untnok' then
		nokstat = false
		TNOK()
    end
		
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'getping' then
	
		GetPing()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'gearban' then
         	local dasplayer = string.sub(msg:lower(), #prefix + 9)
         	PLAYERCHECK(dasplayer)
         	if player ~= nil then
			Gearban()
         	else
               		print('Cannot find player with the name: '..dasplayer)
         	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'sspawn' then -- save spawn
		SSpawn()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'pspawn' then -- print saved spawn
		Pspawn()
    end
		
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'gsspawn' then -- go to saved spawn
		Spawn()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'frespawn' then -- force respawn
	FRespawn()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'rejoin' then
	print("Rejoinning... please wait!")
	REJOIN()
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'shop' then
	print("Serverhopping... please wait!")
	print("[WARN]: THIS MAY REJOIN YOU TO THE SAME SERVER.")
	SERVERHOP()
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'serverhop' then
	print("Serverhopping... please wait!")
	print("[WARN]: THIS MAY REJOIN YOU TO THE SAME SERVER.")
	SERVERHOP()
    end
		
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'infjump' then
		INFJUMP = true
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'uninfjump' then
		INFJUMP = false
    end

    if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'sp' then
	 game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(string.sub(msg:lower(), #prefix + 4))
    end

    if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'jp' then
	 game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(string.sub(msg:lower(), #prefix + 4))
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'hlth' then
	 game.Players.LocalPlayer.Character.Humanoid.Health = tonumber(string.sub(msg:lower(), #prefix + 6))
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'ufly' then
	 GExecute("https://raw.githubusercontent.com/S-PScripts/techls-fork/main/KAH%20Fly.lua")
    end
		
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'nocam' then
		NoCam()
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'wbcam' then
		TogCam()    
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'wfcam' then
		TogCam()    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'breakcam' then
		NoCam()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fixcam' then
		FixCam()
    end

     if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fixvelo' then
		VFix()
     end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fixcol' then
		ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fixgrav' then
		GravFix()
    end
		
    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unadminall' then
       alladmin = false
	Chat("h \n\n\n [KohlsLite]: Free admin is off. \n\n\n")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'loopgrab' then
	loopgrab = true
    end

    if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'lg' then
	loopgrab = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unloopgrab' then
	loopgrab = false
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'unlg' then
	loopgrab = false
    end

     if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fastpads' then
		FastPads()
     end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'loopgrab2' then
	loopgrab2 = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unloopgrab2' then
	loopgrab2 = false
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'lg2' then
	loopgrab2 = true
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'unlg2' then
	loopgrab2 = false
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'perm' then
	perm = true
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'perm2' then
	perm2 = true
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unperm' then
	perm = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unperm2' then
	perm2 = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'allpads' then
		AllPads()
    end
		
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'checkbp' then
	local checker = string.sub(msg:lower(), #prefix + 9)
        PLAYERCHECK(checker)
        if player ~= nil then 
		CheckBackpack()
        else
                print('Cannot find player with the name: '..checker)
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'nowater' then
		SuperCMD("gear me 88146497")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'watermap' then
		SuperCMD("gear me 236438668")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fixpaint' then
	GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Other%20Scripts/Fix%20Paint.lua")
     end

   if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'anticrash' then
	anticrash = true
    end
 
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antigs' then -- what is this??
	YOUantigs = true
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantigs' then 
	YOUantigs = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unanticrash' then
	anticrash = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'2anticrash' then
	anticrash2 = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'2unanticrash' then
	anticrash2 = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antipaint' then
	antipaint = true
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantipaint' then
	antipaint = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antigear' then
	antigear = true
    end
		
    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantigear' then
	antigear = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antigear2' then
	antigear2 = true
    end
		
    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantigear2' then
	antigear2 = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antigb' then
	antigb = true
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantigb' then
	antigb = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antiattach2' then
	antiattach2 = true
    end
		
    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantiattach2' then
	antiattach2 = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antiattach' then
	antiattach = true
    end
		
    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantiattach' then
	antiattach = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'pinglogs' then
	PingLogs = true
    end
		
    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unpinglogs' then
	PingLogs = false
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antilogs' then
	AntiLogs = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantilogs' then
	AntiLogs = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'pingcsys' then
	PingCsystem = true
    end
		
    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unpingcsys' then
	PingCsystem = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'noobdetect' then
	noobdetect = true
    end
		
    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unnoobdetect' then
	noobdetect = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antiblindm' then
	YOUantiblind = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantiblindm' then
	YOUantiblind = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'anticlonem' then
	YOUanticlone = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unanticlonem' then
	YOUanticlone = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'anticlonea' then
	ALLanticlone = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unanticlonea' then
	ALLanticlone = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antifirem' then
	YOUantifire = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantifirem' then
	YOUantifire = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antifirea' then
	ALLantifire = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantifirea' then
	ALLantifire = false
    end	

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antifreezem' then
	YOUantifreeze = true
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantifreezem' then
	YOUantifreeze = false
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antifreezea' then
	ALLantifreeze = true
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantifreezea' then
	ALLantifreeze = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antiffm' then
	YOUantiff = true
    end
		
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantiffm' then
	YOUantiff = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antiffa' then
	ALLantiff = true
    end
		
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantiffa' then
	ALLantiff = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiglowm' then
	YOUantiglow = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiglowm' then
	YOUantiglow = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiglowa' then
	ALLantiglow = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiglowa' then
	ALLantiglow = false
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'antihealthcm' then
	YOUantihealthc = true
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'unantihealthcm' then
	YOUantihealthc = false
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'antihealthca' then
	ALLantihealthc = true
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'unantihealthca' then
	ALLantihealthc = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antijailm' then
	YOUantijail = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantijailm' then
	YOUantijail = false
    end
				
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antijaila' then
	ALLantijail = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantijaila' then
	ALLantijail = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antijumpm' then
	YOUantijump = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantijumpm' then
	YOUantijump = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antijumpa' then
	ALLantijump = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantijumpa' then
	ALLantijump = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antikillm' then
	YOUantikill = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantikillm' then
	YOUantikill = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antiexm' then
	YOUantiexplode = true
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantiexm' then
	YOUantiexplode = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'anticharm' then
	YOUantichar = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unanticharm' then
	YOUantichar = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antichara' then
	ALLantichar = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantichara' then
	ALLantichar = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antikilla' then
	ALLantikill = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantikilla' then
	ALLantikill = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antiexa' then
	ALLantiexplode = true
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantiexa' then
	ALLantiexplode = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antimsg' then
	YOUantimsg = true
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantimsg' then
	YOUantimsg = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antinamem' then
	YOUantiname = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantinamem' then
	YOUantiname = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antinamea' then
	ALLantiname = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantinamea' then
	ALLantiname = false
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'antiparticlesm' then
	YOUantiparticles = true
    end

    if string.sub(msg:lower(), 1, #prefix + 16) == prefix..'unantiparticlesm' then
	YOUantiparticles = false
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'antiparticlesa' then
	ALLantiparticles = true
    end

    if string.sub(msg:lower(), 1, #prefix + 16) == prefix..'unantiparticlesa' then
	ALLantiparticles = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antipunishm' then
	YOUantipunish = true
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantipunishm' then
	YOUantipunish = false
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antipunisha' then
	ALLantipunish = true
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantipunisha' then
	ALLantipunish = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antirocketm' then
	YOUantirocket = true
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantirocketm' then
	YOUantirocket = false
    end

   if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antirocketa' then
	ALLantirocket = true
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantirocketa' then
	ALLantirocket = false
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antisitm' then
	YOUantisit = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantisitm' then
	YOUantisit = false
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antisita' then
	ALLantisit = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantisita' then
	ALLantisit = false
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'antiseizurem' then
	YOUantiseizure = true
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'unantiseizurem' then
	YOUantiseizure = false
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'antiseizurea' then
	ALLantiseizure = true
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'unantiseizurea' then
	ALLantiseizure = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antismokem' then
	YOUantismoke = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantismokem' then
	YOUantismoke = false
    end

   if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antismokea' then
	ALLantismoke = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantismokea' then
	ALLantismoke = false
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'antisparklesm' then
	YOUantisparkles = true
    end

    if string.sub(msg:lower(), 1, #prefix + 15) == prefix..'unantisparklesm' then
	YOUantisparkles = false
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'antisparklesa' then
	ALLantisparkles = true
    end

    if string.sub(msg:lower(), 1, #prefix + 15) == prefix..'unantisparklesa' then
	ALLantisparkles = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antispeedm' then
	YOUantispeed = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantispeedm' then
	YOUantispeed = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antispeeda' then
	ALLantispeed = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantispeeda' then
	ALLantispeed = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antistunm' then
	YOUantistun = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantistunm' then
	YOUantistun = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antistuna' then
	ALLantistun = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantistuna' then
	ALLantistun = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiswagm' then
	YOUantiswag = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiswagm' then
	YOUantiswag = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiswaga' then
	ALLantiswag = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiswaga' then
	ALLantiswag = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antichat' then
	antichat = true
	YOUantimsg = true -- stop you from crashing :D
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantichat' then
	antichat = false
	YOUantimsg = false
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'mkick' then
	acplr = string.sub(msg:lower(), #prefix + 7)
	antichatplr = true
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unmkick' then
	antichatplr = false
	Chat("clear")
    end
		
end)

function CMDPrint()
print("-COMMAND LIST FOR KOHLSLITE-")

print("---")
print("perm - loopgrab a random pad (touch interest)")
print("perm2 - loopgrab a random pad (collisions)")

print("---")
print("unperm - stop loopgrabing a pad(perm)")
print("unperm2 - stop loopgrabing a pad (perm2)")

print("---")
print("loopgrab/lg - loopgrab all the pads (touch interest)")
print("lg2 - loopgrab all the pads (touch interest)")

print("---")
print("unloopgrab/unlg - stop loopgrabing all the pads")
print("unlg2 - stop loopgrab all the pads")

print("---")
print("fastpads - quickly tp to all the pads")
print("regen - regenerate the admin pads")
print("sregen - spam regenerate the admin pads")
print("unsregen - stop spam regenerating the admin pads")

print("---")
print("padban - stop a user from using the admin pads")
print("unpadban - allow user to use admin pads again")
print("padreinf - stop users from taking more than 2 admin pads")
print("unpadreinf - allow users to take more than 2 admin pads again")

	
print("---")
print("wl - whitelist a player from serverlocks")
print("bl - blacklist a player (serverlock to certain players)")
print("gearwl - whitelist a user to use gears with antigear/anticrash etc. on")
print("admin - give a user free admin that can be used off yours")
	
print("---")
print("unwl - unwhitelist a player from serverlocks")
print("unbl - unblacklist a player")
print("ungearwl - unwhitelist a user to use gears with antigear/anticrash etc. on")
print("unadmin - remove a user's free admin")

print("---")
print("wllist - print all whitelisted players")
print("bllist - print all blacklisted players")
print("gearwllist - print all gear whitelisted players")
print("adminlist - print all admined players")
print("musiclist - print all the saved musics")
print("permusers - users that use perm")
print("personsusers - users that use persons")

print("---")
print("slock - serverlock a server")
print("unslock - serverlock a server")
print("newplrslock - automatically blacklist a new user (acc age under 21 days)")
print("unnewplrslock - stop automatic blacklist for new users (acc age under 21 days)")

print("---")
print("adminall - give everyone's free admin")
print("unadminall - remove everyone's free admin")

print("---")
print("ipboom - who's ip address is that?")

print("---")
print("sspawn - save your position")
print("gsspawn - go to saved position")
print("pspawn - print your current position")

print("---")
print("prefix - set the prefix")
print("ping - say your ping")
print("execute - execute a lua script from chat")
print("iy - execute iy")
print("adv - advertise this script (pls do this you are nice if you do this :D)")
print("frespawn - force respawn if punished")

print("---")
print("welmsg - welcome people to the server (and leave msg too)")
print("unwelmsg - no more welcome and leave msg")

print("---")
print("autoafk - names you as afk when you're afk")
print("unautoafk - stops naming you as afk when you're afk")

print("---")
print("nocam/breakcam - break the camera with the AR")
print("fixcam - fix the camera (client side)")
print("wbcam/wfcam - break/fix the camera with the blizzard wand")
print("fixvelo - fix your velocity")
print("fixcol - fix collisions")
print("fixgrav - fix gravity")

print("---")
print("goto - alt to tp me plr")
print("bring - alt to tp plr me")

print("---")
print("biglogs - make the logs bigger!")
print("chatz - chat a string of - causing the previous messages to vanish")

print("---")
print("qattach - quickly attach to something with sit")
print("sattach - quickly attach to something with stun")

print("---")
print("house - teleport to the house")
print("spawn - teleport to spawn")

print("---")
print("infjump - infinite jump")
print("uninfjump - stop infinite jump")

print("---")
print("checkperm - check player for perm")
print("checkpersons - check player for persons")
print("checkgps - check player for both")
print("checkbp - check a player's backpack")
	
print("---")
print("spamt - start spamming something")
print("unspamt - stop spamming")
print("spamw/spamw - the spam wait")
print("spamoff - stop spamming (temp)")
print("spamon - start spamming again")

print("---")
print("fixpaint - fix the paint")
print("paintmap - paint the map a colour")

print("---")
print("icemap - make the map ice")
print("stonemap/rockmap - make the map stone")

print("---")
print("NOK - no obby kill")
print("NOK2 - no obby kill")

print("---")
print("sp - set your speed without the command")
print("jp - set your jump power without the command")
print("hlth - set your health without the command")
print("ufly - the kah fly but without actually using the cmd!")

print("---")
print("furry - HAHIUSHJDIKH")
print("gear (plr) (name) - in case you have dementia")
print("boombox - shortcut for gear plr boombox")

print("---")
print("rejoin - rejoin the server you're in")
print("shop - switch to a different server")

print("---")
print("slowplayer - slow a player down with the car gear")
print("unslowplayer - stop slowing a player down with the car gear")
print("snplayer - spam name a player, naming currently breaks your cam")
print("unsnplayer - stop spam naming a player, naming currently breaks your cam")

print("---")
print("announce - announce a message without your username in the h")
print("wmannounce - announce a message with [KohlsLite]: as the sender of the h")

print("---")
print("pinglogs - ping you when someone uses logs")
print("antilogs - spams logs when someone tries using it")
print("pingcsystem - ping you when someone uses /c system (or /w)")
print("logspam - spam the logs")

print("---")
print("gearban - stop a user from using gears with the portable justice")
	
print("---")
print("supercmd - spam text a set amount of times")
print("supert - times the spam should happen (anything above 128 exceeds the rate limit)")

print("---")
print("permmusic - your music only, if someone tries to change or stop it changes back")
print("unpermmusic - not your music only anymore")
print("offmusic - turn the perm music off temporarily")
print("onmusic - turn perm music on")
print("antimusic - stop music from playing")
print("unantimusic - lets people use music again")

print("---")
print("remusic - restart the current music")
print("volm - set the volume of the music")
print("cvol - print the current volume of music")
print("musicid - print the current music id")
print("timeframe - set the time position")
print("timefis - print the current time position")

print("---")
print("pausem - pause the music")
print("playm - play the music")
print("stopm - stop the music")
print("startm - start the music")

print("---")
print("gmusic(num) - play saved music")
print("rgmusic - play a random saved music")
print("nmusic - play the next saved music")
print("pmusic - play the previous saved music")

print("---")
print("vgcrash - crash with the vg")
print("dcrash - crash with clone and dog commands") 
print("fcrash - crash with clone and freeze commands")
print("pcrash - crash with the osas")
print("[PERSONS REQUIRED] scrash - crash with the shield, rocket and clone commands")

print("---")
print("[PERSONS REQUIRED] rkick - attempt to rocket kick a player")
print("[PERSONS REQUIRED] srkick - spam rocket kick a player")
print("[PERSONS REQUIRED] unsrkick - stop trying to rocket kick a player")

print("---")
print("anticrash - anti-crash with vg or osas")
print("2anticrash - anti-crash with vg or osas")
print("antigear - stop users from using gears")
print("antigear2 - stop users from using gears")
print("antipaint - stop users from using the paint bucket and Subspace Tripmine")
print("antigb - stop users from using the portable justice, car gear and shattered dimension sword") -- more of a misc. category lol
print("antiattach2 - stop users from using the Ivory Periastron")

print("---")
print("antichat - stop people chatting by spamming m command full of emojis")
print("unantichat - allow people to chat again")
print("mkick - crash players with emojis using pm. You can use this instead of h as pm can be more effective.")
print("unmkick - stop trying to crash players with emojis")

print("---")
print("There are also many other antis (for you or for everyone [but you])!")

print("---INFORMATION---")
print("KohlsLite, since 2023. Created by ScriptingProgrammer/ts2021")
print("Version is: v1.075 - 14th February 2024 Build")

print("--- CREDITS ---")
print("Tech and other admins of SC with Shortcut v1, v2 and v3")
print("Atprog with his PR Script")
print("iiDk's with iiDk's admin as PR Script is based off it")
print("SimpleKAH for gears and char ids")

end

-- CHECK FOR PERM
function checkforperm()
	if MarketplaceService:UserOwnsGamePassAsync(gcplr.UserId, 66254) or MarketplaceService:UserOwnsGamePassAsync(gcplr.UserId, 64354) then
	   print(gcplr.." has perm!")
	   table.insert(permusers, gcplrn)
	else
	   print(player.."does not have perm!")
	end
end

-- CHECK FOR PERSONS
function checkforpersons()
	if MarketplaceService:UserOwnsGamePassAsync(gcplr.UserId, 35748) or MarketplaceService:UserOwnsGamePassAsync(gcplr.UserId, 37127) then
	   print(gcplr.." has persons!")
	   table.insert(personsusers, gcplrn)
	else
	   print(player.."does not have persons!")
	end
end

-- SLOCK/BL/WL (REALLY UNTOUCHED SO IT WAS BROKEN FOR A WHILE LMAO)
task.spawn(function()
    while true do
    task.wait(0)
    local players = game.Players:GetPlayers()
    for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name and not table.find(whitelist, v.Name) then
            for i, player in ipairs(players) do
                if string.find(player.Name:lower(), v.Name:lower()) then
                    if slockenabled == true then
                        if not game.Lighting:FindFirstChild(v.Name) then
                                Chat('punish '..v.Name)
                                Chat('blind '..v.Name)
                                Chat('pm '..v.Name..' [KohlsLite]: sorry, this server is locked!')
                        end
                    elseif table.find(blacklist, v.Name) then
                        if not game.Lighting:FindFirstChild(v.Name) then
                                Chat('punish '..v.Name)
                                Chat('blind '..v.Name)
                                Chat('pm '..v.Name..' [KohlsLite]: sorry, you are blacklisted!')
                        end
                    elseif table.find(newplrslocked, v.Name) and newplrautoslock == true then
			if not game.Lighting:FindFirstChild(v.Name) then
                                Chat('punish '..v.Name)
                                Chat('blind '..v.Name)
                                Chat('pm '..v.Name..' [KohlsLite]: sorry, you are blacklisted for having an account under the account age limit!')
                        end
		    else
                    end
                    break
                end
            end
        end
    end
    end
end)

-- visual
task.spawn(function()
    while true do
        task.wait()
        for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Folder:GetChildren()) do
            if v:IsA('Script') then
                  if antidisco == true then    
                          if v.Name == "Disco" then
                              Chat("fix")
                          end
                  end
                  if antiflash == true then    
                          if v.Name == "Flash" then
                              Chat("fix")
                          end
                  end
            end
        end

	if antifogend == true then
	   if game.Lighting.FogEnd ~= 100000 then
	      Chat("fogend 100000")
	   end
        end

	if antifogstart == true then
	   if game.Lighting.FogStart ~= 0 then
		Chat("fogstart 0")	   
	   end
        end

	if antitime == true then
		if game.Lighting.ClockTime ~= 14 then
			Chat("time 14")
		end
	end

	if antiambient == true then
		if game.Lighting.Ambient ~= Color3.new(0,0,0) then
			Chat("ambient 0 0 0")
		end
	end

	if antibrightness == true then
		if game.Lighting.Brightness ~= 1 then
			Chat("brightness 1")		
		end	
	end

	if antioutamb == true then
		if game.Lighting.OutdoorAmbient ~= Color3.fromRGB(128,128,128) then
			Chat("outdoorambient 128 128 128")		
		end	
	end

			
  end
end)

-- Infinity void [CODED LIKE SHIT AS THIS ISN'T SOMETHING I WANTED LOL]
task.spawn(function()
	while true do
		task.wait(0)
        	while gjdelock do
                            task.wait(1)
                            Chat("speed others 0")
                            Chat("unfly others")
                            Chat("pm others You entered my domain so please wait until the user decides to close it...")
                            Chat("time 6")
                            Chat("fogend 500")
                            Chat("fogcolor 0 0 0")
                            Chat("speed me 30")
                end
	end
end)

-- anti chat/msg-crash
task.spawn(function()
	while true do
	task.wait()
		if antichat == true then
			Chat("m [KohlsLite]: 😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀")
			Chat("m/ [KohlsLite]: 😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀")
		end
		if antichatplr == true then
          		Chat("pm "..acplr.." [KohlsLite]: 😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀")
			Chat("pm/ "..acplr.." [KohlsLite]: 😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀")
		end
	end
end)

-- ANTIS FOR YOU ONLY
task.spawn(function()
	while true do
	task.wait()
	if YOUantiblind == true then
	   for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                if v.Name == "EFFECTGUIBLIND" then
                    v:Destroy()
                end
            end
	end
			
	if YOUantigs == true then
		if game.Workspace.CurrentCamera:FindFirstChild("GrayScale") then
			game.Workspace.CurrentCamera:FindFirstChild("GrayScale"):Destroy()	
		end
	end
			
	if YOUanticlone == true then
	    if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild(game.Players.LocalPlayer.Name) then
                Chat("unclone me")
            end
	end
			
	if YOUantifire == true then
	    if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
                if game.Players.LocalPlayer.Character.Torso:FindFirstChild("Fire") then
                    Chat("unfire me")
                end
            end
	end
			
	if YOUantifreeze == true then
	     if game.Players.LocalPlayer.Character:FindFirstChild("ice") then
                Chat("thaw me")
            end
	end
			
	if YOUantifly == true then
	    if not game.Players.LocalPlayer.Character:FindFirstChild("Seizure") and game.Players.LocalPlayer.Character.Humanoid:GetState().Name == "PlatformStanding" then
                Chat("unfly me")
                Chat("clip me")
            end
	end
			
	if YOUantiff == true then
	 if game.Players.LocalPlayer.Character:FindFirstChild("ForceField") then
                Chat("unff me")
            end
	end
			
	if YOUantiglow == true then
	   if game.Players.LocalPlayer.Character:FindFirstChild("PointLight") then
                  Chat("unglow me")
            end
	end
			
	if YOUantihealthc == true then
	   if not game.Players.LocalPlayer.Character.Humanoid.Health == 100 then
		Chat("heal me 100")         
	   end
        end
            
	if YOUantijail == true then
	    if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild(game.Players.LocalPlayer.Name .. "'s jail") then
                Chat("unjail me")
            end
        end
			
	if YOUantijump == true then
	    if not game.Players.LocalPlayer.Character.Humanoid.JumpPower == 50 then
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
            end
	end
			
	if YOUantikill == true then
	   if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                    Chat("reset me")
                end
	end
			
	if YOUantimsg == true then
		for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                	if v.Name == "MessageGUI" or v.Name == "Message" or v.Name == "HintGUI" or v.Name == "Ice" then
                    		v:Destroy()
                	end
                end
		for i, v in pairs(game.Workspace.Terrain["_Game"].Folder:GetDescendants()) do
			if v.Name == "Message" then
				v:Destroy()
			end
		end
	end
	if YOUantiname == true then
	     if game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Model") then
		Chat("reset me")
	     end
	end

	if YOUantiexplode == true then
	     if game.Players.LocalPlayer.Character:FindFirstChild("Explosion") then
		Chat("reset me")
	     end
	end

	if YOUantichar == true then
	   if game.Players.LocalPlayer.UserId ~= game.Players.LocalPlayer.CharacterAppearanceId then
	      Chat("unchar me")
	   end
	end
			
	if YOUantiparticles == true then
	   if game.Players.LocalPlayer.Character:FindFirstChild("ParticleEmitter") then
                  Chat("unparticle me")
            end
	end
			
	if YOUantipunish == true then
	    if game.Lighting:FindFirstChild(game.Players.LocalPlayer.Name) then
                Chat("unpunish me")
            end
	end
			
	if YOUantirocket == true then
	   if game.Players.LocalPlayer.Character:FindFirstChild("Rocket") then
                local oldposition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                Chat("reload me")
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldposition
            end
	end
			
	if YOUantisit == true then
	   local player = game.Players.LocalPlayer
            	 if player.Character then
                    local humanoid = player.Character:WaitForChild("Humanoid", 1)
                    if humanoid and humanoid.Sit then
                        humanoid.Sit = false
                        Chat("unsit me")
                    end
             	end
	end
			
	if YOUantiseizure == true then
	        if game.Players.LocalPlayer.Character:FindFirstChild("Seizure") then
                Chat("unseizure me")
            end
	end
			
	if YOUantismoke == true then
	     if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
                if game.Players.LocalPlayer.Character.Torso:FindFirstChild("Smoke") then
                    Chat("unsmoke me")
                end
            end
	end
			
	if YOUantisparkles == true then
	    if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
                if game.Players.LocalPlayer.Character.Torso:FindFirstChild("Sparkles") then
                    Chat("unsparkles me")
                end
            end
	end
			
	if YOUantispeed == true then
	    if not game.Players.LocalPlayer.Character.Humanoid.WalkSpeed == 16 then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
            end
	end
			
	if YOUantistun == true then
	    local player = game.Players.LocalPlayer
             if player.Character then
                    local humanoid = player.Character:WaitForChild("Humanoid", 1)
                    if humanoid and humanoid.PlatformStand then
                        humanoid.PlatformStand = false
                        Chat("unstun me")
                    end
             end
	end
			
	if YOUantiswag == true then
		if game.Players.LocalPlayer.Character:FindFirstChild("EpicCape") then
                	Chat("normal me")
		end
	end
			
	end
end)

-- ANTIS FOR EVERYONE
task.spawn(function()
	while true do
	task.wait()
	for i, v in ipairs(game.Players:GetPlayers()) do
	if v.Name ~= game.Players.LocalPlayer.Name then
	if ALLanticlone == true then
	    if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild(v.Name) then
                Chat("unclone "..v.Name)
            end
	end
				
	if ALLantifire == true then
	    if v.Character:FindFirstChild("Torso") then
                if v.Character.Torso:FindFirstChild("Fire") then
                    Chat("unfire "..v.Name)
                end
            end
	end
				
	if ALLantifreeze == true then
	     if v.Character:FindFirstChild("ice") then
                Chat("thaw "..v.Name)
            end
	end
				
	if ALLantifly == true then
	    if not v.Character:FindFirstChild("Seizure") and v.Character.Humanoid:GetState().Name == "PlatformStanding" then
                Chat("unfly "..v.Name)
                Chat("clip "..v.Name)
            end
	end
				
	if ALLantiff == true then
	 if v.Character:FindFirstChild("ForceField") then
                Chat("unff "..v.Name)
            end
	end

	 if checkperm2 == true then
	 if v.Character:FindFirstChild("ForceField") then
		if not table.find(permusers, v.Name) then
                	print(v.Name.." has perm.")
			table.insert(permusers, v.Name)
			Chat("unff "..v.Name)
		end
            end
	 end
				
	if ALLantiglow == true then
	   if v.Character:FindFirstChild("PointLight") then
                  Chat("unglow "..v.Name)
            end
	end
				
	if ALLantihealthc == true then
	   if not v.Character.Humanoid.Health == 100 then
		Chat("health "..v.Name.."100")
	   end
        end
            
	if ALLantijail == true then
	    if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild(v.Name .. "'s jail") then
                Chat("unjail "..v.Name)
            end
        end
				
	if ALLantijump == true then
	    if not v.Character.Humanoid.JumpPower == 50 then
		Chat("normaljump "..v.Name)
            end
	end

	if ALLantiexplode == true then
	     if v.Character:FindFirstChild("Explosion") then
		Chat("reset "..v.Name)
	     end
	end
				
	if ALLantikill == true then
	   if v.Character.Humanoid.Health == 0 then
                    Chat("reset "..v.Name)
                end
	end

	if ALLantichar == true then
	   if v.UserId ~= v.CharacterAppearanceId then
	      Chat("unchar "..v.Name)
	   end
	end

	if ALLantiname == true then
	   if v and v.Character:FindFirstChildOfClass("Model") then
		Chat("reset "..v.Name)
	     end
	end
				
	if ALLantiparticles == true then
	   if v.Character:FindFirstChild("ParticleEmitter") then
                  Chat("unparticle"..v.Name)
            end
	end
				
	if ALLantipunish == true then
	    if game.Lighting:FindFirstChild(v.Name) then
                Chat("unpunish "..v.Name)
            end
	end
				
	if ALLantirocket == true then
	   if v.Character:FindFirstChild("Rocket") then
                Chat("reload "..v.Name)
            end
	end
				
	if ALLantisit == true then
	   local player = v.Name
            	 if player.Character then
                    local humanoid = player.Character:WaitForChild("Humanoid", 1)
                    if humanoid and humanoid.Sit then
                        Chat("unsit "..player.Name)
                    end
             	end
	end
				
	if ALLantiseizure == true then
	        if v.Character:FindFirstChild("Seizure") then
                Chat("unseizure "..v.Name)
            end
	end
				
	if ALLantismoke == true then
	     if v.Character:FindFirstChild("Torso") then
                if v.Name.Character.Torso:FindFirstChild("Smoke") then
                    Chat("unsmoke "..v.Name)
                end
            end
	end
				
	if ALLantisparkles == true then
	    if v.Character:FindFirstChild("Torso") then
                if v.Character.Torso:FindFirstChild("Sparkles") then
                    Chat("unsparkles "..v.Name)
                end
            end
	end
				
	if ALLantispeed == true then
	    if not v.Character.Humanoid.WalkSpeed == 16 then
		Chat("speed "..v.Name.." 16")
	    end
	end
				
	if ALLantistun == true then
	    local player = v.Name
             if player.Character then
                    local humanoid = player.Character:WaitForChild("Humanoid", 1)
                    if humanoid and humanoid.PlatformStand then
                        Chat("unstun "..player.Name)
                    end
             end
	end
				
	if ALLantiswag == true then
		if v.Character:FindFirstChild("EpicCape") then
                	Chat("normal "..v.Name)
		end
	end

	end		
	end
	end
end)

-- PLAYER CHECK
function PLAYERCHECK(plr)
  for i, v in pairs(game.Players:GetPlayers()) do
      if string.sub(v.Name:lower(), 1, #plr) == plr:lower() then
          player = v.Name
	  cplr = v
          print("Found "..player)
      end
  end
end

-- ANTI CRASH 2 (it can work better than anticrash one at times!)
game:GetService("RunService").RenderStepped:Connect(function()
	task.wait(0)
        for i, v in ipairs(game.Players:GetPlayers()) do
            if v.Backpack:FindFirstChild("VampireVanquisher") or v.Character:FindFirstChild("VampireVanquisher") then
               if v ~= game.Players.LocalPlayer and anticrash2 == true and not table.find(GWhitelisted, v.Name) then
                Chat("ungear "..v.Name)
                Chat("punish "..v.Name)
                Chat("h \n\n\n [KohlsLite]: Sorry, "..v.Name.. ", you cannot use the Vampire Vanquisher due to anti crash (2). \n\n\n")
               end
            end
            if v.Backpack:FindFirstChild("OrinthianSwordAndShield") or v.Character:FindFirstChild("OrinthianSwordAndShield") then
               if v ~= game.Players.LocalPlayer and anticrash2 == true and not table.find(GWhitelisted, v.Name) then
                Chat("ungear "..v.Name)
                Chat("punish "..v.Name)
                Chat("h \n\n\n [KohlsLite]: Sorry, "..v.Name.. ", you cannot use the Orinthian Sword and Shield due to anti crash (2). \n\n\n")
               end
            end
	    for i, gear in pairs(v.Backpack:GetChildren()) do
            	if gear:IsA("Tool") and antigear2 == true then
               		if v.Name ~= game.Players.LocalPlayer.Name and not table.find(GWhitelisted, v.Name) then
				Chat("ungear "..v.Name)
				Chat("punish "..v.Name)
                		Chat("h \n\n\n [KohlsLite]: Sorry, "..v.Name.. ", you cannot use gears due to anti gear (2). \n\n\n")
			end
            	end
       	    end
     end 
end)

-- ANTIS FOR CRASHING ATTACHING GEARBANNING AND HAVING A GEAR
local crashTools = {"OrinthianSwordAndShield", "VampireVanquisher"}
local attachTools = {"IvoryPeriastron"}
local nogearTools = {"PortableJustice", "DriveBloxUltimateCar"}
local colourTools = {"PaintBucket", "SubspaceTripmine", "DaggerofShatteredDimensions", "SledgeHammer"}

function warnCrash(player, toolName)
       Chat("ungear " .. player.Name)
       Chat("punish " .. player.Name)
       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName .. " because of anti crash. \n\n\n")
       Chat("clr")
end

function warnGear(player, toolName)
       Chat("ungear " .. player.Name)
       Chat("punish " .. player.Name)
       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use that gear because of anti gear. \n\n\n")
       Chat("clr")
       if autoblvgc == true then
	         table.insert(blacklist, player.Name)
	end
end

function warnAGBan(player, toolName)
       Chat("ungear " .. player.Name)
       Chat("punish " .. player.Name)
       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName .. " because of anti gear ban. \n\n\n")
       Chat("clr")
end

function warnAttach(player, toolName)
       Chat("ungear " .. player.Name)
       Chat("punish " .. player.Name)
       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName .. " because of anti attach. \n\n\n")
       Chat("clr")
end

function warnPaint(player, toolName)
       Chat("ungear " .. player.Name)
       Chat("punish " .. player.Name)
       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName .. " because of anti paint/blacklisted tools. \n\n\n")
       Chat("clr")
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

function checkPlayerAGBackpack(player)
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, toolName in ipairs(nogearTools) do
            local tool = backpack:FindFirstChild(toolName)
            if tool and antigb then
		if player.Name ~= game.Players.LocalPlayer.Name and not table.find(GWhitelisted, player.Name) then
                   warnAGBan(player, toolName)
                   break
                end
            end
        end
    end
end

function checkPlayerGBackpack(player)
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, toolName in ipairs(player.Backpack:GetChildren()) do
    	    if toolName:IsA("Tool") and antigear then
	             if player.Name ~= game.Players.LocalPlayer.Name and not table.find(GWhitelisted, player.Name) then
                        warnGear(player, toolName)
                        break
		     end
            end
        end
    end
end

function checkPlayerATTBackpack(player)
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, toolName in ipairs(attachTools) do
            local tool = backpack:FindFirstChild(toolName)
            if tool and antiattach2 then
		if player.Name ~= game.Players.LocalPlayer.Name and not table.find(GWhitelisted, player.Name) then
                   warnAttach(player, toolName)
                   break
                end
            end
        end
    end
end

function checkPlayerPBackpack(player)
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, toolName in ipairs(colourTools) do
            local tool = backpack:FindFirstChild(toolName)
            if tool and antipaint then
		if player.Name ~= game.Players.LocalPlayer.Name and not table.find(GWhitelisted, player.Name) then
                   warnPaint(player, toolName)
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
	    checkPlayerGBackpack(player)
            checkPlayerAGBackpack(player)  
	    checkPlayerATTBackpack(player)
	    checkPlayerPBackpack(player)
	end)
            checkPlayerBackpack(player)
	    checkPlayerGBackpack(player)
            checkPlayerAGBackpack(player)
	    checkPlayerATTBackpack(player)
	    checkPlayerATTBackpack(player)
end)

game:GetService("RunService").Heartbeat:Connect(function()
    task.wait(0)
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Character then
            checkPlayerBackpack(player)
	    checkPlayerGBackpack(player)
            checkPlayerAGBackpack(player)
	    checkPlayerATTBackpack(player)
	    checkPlayerATTBackpack(player)
        end
    end
end)

for _, player in ipairs(game.Players:GetPlayers()) do
    task.wait(0)
    if player.Character then
            checkPlayerBackpack(player)
	    checkPlayerGBackpack(player)
            checkPlayerAGBackpack(player)
	    checkPlayerATTBackpack(player)
	    checkPlayerATTBackpack(player)
    end
end

-- CHAT F*CK
function ChatFudge()
Speak("⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻")
Speak("⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻")
Speak("⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻")
end


-- IP LEAK REAL :O :O :O
function IPBOOM()
  
local number = math.random(1,255)
local number2 = math.random(1,255)
local number3 = math.random(1,255)
local number4 = math.random(1,255)
print(number.."."..number2.."."..number3.."."..number4)
Chat('h \n\n\n Everyone, check logs! \n\n\n')

for i = 1,25 do
    Chat("tp "..number.."."..number2.."."..number3.."."..number4)
end

task.wait(4)
Chat('h \n\n\n Whoops, that was the wrong thing! \n\n\n')
task.wait(4)

local Players = game.Players:GetPlayers()
local randomPlayer = "Placeholder"
randomPlayer = Players[math.random(#Players)]

Chat('h \n\n\n Hopefully'..randomPlayer..'forgives me... \n\n\n')
if randomPlayer == game.Players.LocalPlayer then
   task.wait(4)
   Chat("h \n\n\n Wait a second... that's me!!!!!!! \n\n\n")
end

end

-- AD
function ADVERTISEMENT()
	Speak("KohlsLite is a very 'cool' KAH Script. Get it today on git-hub: S-PScripts or my purple: ts2021")
end

-- REJOIN
function REJOIN()
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,game.Players.LocalPlayer) 
end

-- SERVERHOP delta broke this bruuigeidfi
function SERVERHOP()
	local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/112420803/servers/Public?sortOrder=Asc&limit=100"))
	for i,v in pairs(Servers.data) do
  	    if v.playing ~= v.maxPlayers then
      	       game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
            end
        end    
end

-- keybinds
game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
	task.wait(0)
	if key:lower() == housekeybind then
		House()
	end
	if key:lower() == rekeybind then
		Chat("reset me")
	end	
end)
	
-- some antis and admin system
function PLRSTART(v)
v.Chatted:Connect(function(msg)
     task.wait(0)
     task.spawn(function()
		task.wait(0)
                if (string.sub(msg:lower(), 0, 2) == "/w" or string.sub(msg:lower(), 0, 9) == "/c system") and v.Name ~= game.Players.LocalPlayer.Name then
                   if PingCsystem then
                        print(v.Name..' is using /c system or whispering commands.')
                        Chat('h \n\n\n [KohlsLite]: '..v.Name..' is using /c system or whispering commands. \n\n\n')
                   end
                end
					
                if (string.sub(msg:lower(), 0, 4) == "logs" or string.sub(msg:lower(), 0, 5) == ":logs") and v.Name ~= game.Players.LocalPlayer.Name then
                   if PingLogs then
                        print(v.Name..' is using logs.')
                        Chat('h \n\n\n [KohlsLite]: '..v.Name..' is using logs. \n\n\n')
                   end
        		   if AntiLogs then
            			LogSpam()
        		   end
                end

		if string.sub(msg:lower(), 0, 6) == "btools" or string.sub(msg:lower(), 0, 7) == ":btools" or string.sub(msg:lower(), 0, 7) == ";btools" then
                        print(v.Name..' thought btools existed.')
                        Chat('h \n\n\n [KohlsLite]: '..v.Name..', btools do not exist anymore. \n\n\n')
                end
					
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
						
    	        if string.sub(msg:lower(), 0, 4) == ";fly" and v.Name ~= game.Players.LocalPlayer.Name then
		if noobdetect then
                   print(v.Name..' is a noob.')
                   Chat('h \n\n\n [KohlsLite]: '..v.Name..', it is fly me, not ;fly!! \n\n\n')
                end
		end

		if string.sub(msg:lower(), 0, 4) == "/fly" and v.Name ~= game.Players.LocalPlayer.Name then
		if noobdetect then
                   print(v.Name..' is a noob.')
                   Chat('h \n\n\n [KohlsLite]: '..v.Name..', it is fly me, not /fly!! \n\n\n')
                end
		end
					
                if string.sub(msg:lower(), 0, 5) == ";poop" or string.sub(msg:lower(), 0, 5) == ":poop" or string.sub(msg:lower(), 0, 4) == "poop" then
		if noobdetect then
		   if v.Name ~= "IceStuds" and v.Name ~= "atprog" then -- very epik exception
                   	print(v.Name..' is a noob.')
                   	Chat('h \n\n\n [KohlsLite]: '..v.Name..', go back to FREE ADMIN, POOP IS NOT A COMMAND!! \n\n\n')
	  	   elseif v.Name == "IceStuds" then Chat('h \n\n\n [IceStuds]: Poop \n\n\n')
		   else Chat('h \n\n\n [atprog]: Poop \n\n\n')
		   end
                end
		end
					
                if string.sub(msg:lower(), 0, 6) == ";morph" or string.sub(msg:lower(), 0, 6) == ":morph" or string.sub(msg:lower(), 0, 5) == "morph" then
		if noobdetect then
                   print(v.Name..' is a noob.')
                   Chat('h \n\n\n [KohlsLite]: '..v.Name..', go back to FREE ADMIN, MORPH IS NOT A COMMAND!! \n\n\n')
                end
		end
					
                if string.sub(msg:lower(), 0, 7) == ";fly me" then
		if noobdetect then
                   print(v.Name..' is a noob.') 
                   Chat('h \n\n\n [KohlsLite]: '..v.Name..', imagine using the ; prefix! You do not need any!! \n\n\n')
                end
		end
					
                if (string.sub(msg:lower(), 0, 6) == ";bring" or string.sub(msg:lower(), 0, 6) == ":bring" or string.sub(msg:lower(), 0, 5) == "bring") and v.Name ~= game.Players.LocalPlayer.Name then
		if noobdetect then
                   print(v.Name..' is a noob.')
                   Chat('h \n\n\n [KohlsLite]: '..v.Name..', it is tp (plr) me, not ;bring!! \n\n\n')
                end
		end
					
                if (string.sub(msg:lower(), 0, 5) == ";goto" or string.sub(msg:lower(), 0, 5) == ":goto" or string.sub(msg:lower(), 0, 4) == "goto") and v.Name ~= game.Players.LocalPlayer.Name then
		if noobdetect then
                   print(v.Name..' is a noob.') 
                   Chat('h \n\n\n [KohlsLite]: '..v.Name..', it is tp me (plr), not ;goto!! \n\n\n')
            	end
		end




                    
-- ADMIN
            if (alladmin == true or table.find(FAdmins, v.Name)) and not table.find(blacklist, v.Name) and not table.find(newplrslocked, v.Name) and v.Name ~= game.Players.LocalPlayer.Name then
            	local command = string.gsub(msg:lower(), "me", v.Name)
            	if string.sub(command, 1, 1) == ":" then
              	 	command = ""
               		Chat("pm "..v.Name.." [KohlsLite]: Please use commands without : . Thanks!")
            	end
            
           	 if string.sub(command, 1, 1) == "/" then -- because /e dance
               		command = ""
            	end
            
                if string.sub(command, 1, 1) == prefix then -- so THEY don't use YOU!
                       command = ""
                end

            if string.sub(command, 1, 5) == "music" then
               local MUSIC = string.sub(command, 7)
               Chat("music "..MUSIC)
          
            elseif string.sub(command, 1, 2) == "m " then
               local message = string.sub(command, 3)
               Chat('m '..v.Name..': '..message)
          
            elseif string.sub(command, 1, 7) == "size me" then
               local NUMBER = string.sub(command, 9)
               Chat("size "..v.Name.." "..NUMBER)
          
            elseif string.sub(command, 1, 12) == "jumppower me" then
               local JPP = string.sub(command, 14)
               Chat("jumppower "..v.Name.." "..JPP)
          
            elseif string.sub(command, 1, 7) == "name me" then
               local NAME = string.sub(command, 9)
               Chat("name "..v.Name.." "..NAME)
          
            elseif string.sub(command, 1, 7) == "message" then
               local message = string.sub(command, 9)
               Chat('message '..v.Name..': '..message)
          
            elseif string.sub(command, 1, 3) == "pm " then
               Chat("pm "..v.Name.." [KohlsLite]: I can't make you private message because of limitations. Sorry!")
          
            elseif string.sub(command, 1, 5) == "hint " then
               local message = string.sub(command, 6)
               Chat('h '..v.Name..': '..message)
          
            elseif string.sub(command, 1, 2) == "h " then
               local message = string.sub(command, 3)
               Chat('h '..v.Name..': '..message)
          
            elseif string.sub(command, 1, 4) == "logs" then
               Chat("pm "..v.Name.." [KohlsLite]: I can't make you see logs because it's client sided. Sorry!")
          
            elseif string.sub(command, 1, 4) == "cmds" then
               Chat("pm "..v.Name.." [KohlsLite]: I can't make you see commands because it's client sided. Sorry!")
          
            elseif string.sub(command, 1, 8) == "commands" then
               Chat("pm "..v.Name.." [KohlsLite]: I can't make you see commands because it's client sided. Sorry!")
          
            elseif string.sub(command, 1, 9) == "musiclist" then
               Chat("pm "..v.Name.." [KohlsLite]: I can't make you see the music list because it's client sided. Sorry!")
          
            elseif string.sub(command, 1, 11) == "packagelist" then
               Chat("pm "..v.Name.." [KohlsLite]: I can't make you see the package list because it's client sided. Sorry!")
          
            else
               Chat(command)
            end
          end
        
	
    end)
		
end)
end
		

-- Backpack checker
function CheckBackpack()
        print(player.." has the following items:")
      	for _, Tool in pairs(cplr.Backpack:GetChildren()) do
        	print(Tool.Name)
	end
end


-- LOOPGRAB 1
task.spawn(function()
    while true do 
        task.wait(0)
        coroutine.wrap(function()
			      if loopgrab == true then
				        local pads = workspace.Terrain._Game.Admin.Pads:GetChildren("Head")
			      	    	for i, pad in pairs(pads) do
					        coroutine.wrap(function()
						          pcall(function()
							            local cre = pad.Head
						              	    local spr = game.Players.LocalPlayer.Character:FindFirstChild("Head")
						              	    firetouchinterest(cre, spr, 1)
								    task.wait()
                          					    firetouchinterest(cre, spr, 0)
                          				            firetouchinterest(cre, spr, 1)
    							            firetouchinterest(cre, spr, 0)
							            if pad.Name ~= game.Players.LocalPlayer.Name.."'s admin" then
									Regen()
							            end
						           end)()
					        end)()
				        end
             end
        end)
    end
end)

-- loopgrab 2
task.spawn(function()
   while true do
   task.wait(0)
   if loopgrab2 then
      local pads = game.Workspace.Terrain._Game.Admin.Pads:GetChildren()
      for i, pad in ipairs(pads) do
         local head = pad:FindFirstChild("Head")
         local character = game.Players.LocalPlayer.Character
         local headOfCharacter = character and character:FindFirstChild("Head")

         if head and headOfCharacter then
            firetouchinterest(head, headOfCharacter, 1)
            firetouchinterest(head, headOfCharacter, 0)
            firetouchinterest(head, headOfCharacter, 1)
            wait()
            firetouchinterest(head, headOfCharacter, 0)

            if pad.Name ~= game.Players.LocalPlayer.Name.."'s admin" then
               Regen()
            end
         end
      end
   end
   end
end)

-- PERM 1
task.spawn(function()
    while true do 
        task.wait(0)
        coroutine.wrap(function()
			      local spr = game.Players.LocalPlayer.Character:FindFirstChild("Head")
			      if perm ~= true or workspace.Terrain._Game.Admin.Pads:FindFirstChild(game.Players.LocalPlayer.Name.."'s admin") ~= nil then 
			      else
				    pcall(function()
					      local pad = workspace.Terrain._Game.Admin.Pads:FindFirstChild("Touch to get admin")
					      local a = pad.Head
					      firetouchinterest(a, spr, 1)
                			      firetouchinterest(a, spr, 0)
                			      firetouchinterest(a, spr, 1)
					      task.wait()
					      firetouchinterest(a, spr, 0)
				    end)
			      end
        end)()
    end
end)

-- PERM 2
task.spawn(function()
    while true do
        task.wait(0)
        if perm2 == true then
            if not game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild(game.Players.LocalPlayer.Name .. "'s admin") then
                  if game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin") then
                      local pad = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head")
                      local padCFrame = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head").CFrame
                      task.wait(0.125)
                      pad.CanCollide = false
                      repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                      pad.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                      task.wait(0.125)
                      pad.CFrame = padCFrame
                      pad.CanCollide = true
                  else
			Regen()
                  end
            end
        end
  end
end)

-- PAD REINFORCEMENTS AND PADBANNED
task.spawn(function()
	while true do
		task.wait(0)
		for i,player in pairs(padbanned) do
			task.wait(0)
			for i,pad in pairs(game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetDescendants()) do
				if pad.Name == player.."'s admin" then
					Chat("respawn "..player)
					Chat("h \n\n\n [KohlsLite]: Sorry, "..player..", you're banned from using the admin pads! \n\n\n")
					Regen()
				end
			end
		end
		
		if padreinforcements == true then
			for i,v in pairs(game.Players:GetChildren()) do
				local times = 0
				for i,pad in pairs(game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetDescendants()) do
					if pad.Name == v.Name.."'s admin" then
						times = times + 1
					end
				end
				if times >= 2 then
					Chat("respawn "..v.Name)
					Chat("h \n\n\n [KohlsLite]: The pads have been reset because "..v.Name.." tried to take them all! \n\n\n")
					Regen()
				end
			end
		end
	end
end)

-- ALL PADS
function AllPads()
local pads = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren("Head")
	for i, pad in pairs(pads) do
		task.spawn(function()
			pad.PrimaryPart = pad:FindFirstChild("Head")
			local pos = pad.PrimaryPart.CFrame
			wait(0)
			pad.PrimaryPart.CanCollide = false
			pad:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
			wait(0)
			pad:SetPrimaryPartCFrame(pos)
			pad.PrimaryPart.CanCollide = true
		end)
	end
end

-- MUSIC RELATED
task.spawn(function()
 while true do
    task.wait(0)
			
    if antimusic == true then
		  if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
				 	Chat("music antimusic is on!")
      		  end
    end

    if audiotroll == true then
			if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
				game:GetService("Workspace").Terrain["_Game"].Folder.Sound.TimePosition = math.random(1, 100) 
			end
    end
		
    if mymusiconly == true and musicoff == false then
		  if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
				if game:GetService("Workspace").Terrain["_Game"].Folder.Sound.SoundId == "http://www.roblox.com/asset/?id="..mymusiconlyid then
    		  		else
					if antimlog then
            					Chat("music 00000000000000000000000000" .. mymusiconlyid)
	    				else
    			  			Chat("music "..mymusiconlyid)
	    			    	end
				end
      		  end
      		  if not game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
				     if antimlog then
            					Chat("music 00000000000000000000000000" .. mymusiconlyid)
	    			     else
    			  		Chat("music "..mymusiconlyid)
	    			     end
      		 end
    end
  end
end)

-- GOTO
function Goto()
          Chat("tp me "..gotou)
end

-- for cframe goto
function Goto2()
	  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = gotou.Character.HumanoidRootPart.CFrame
end

-- BRING
function Bring()
      Chat("tp "..bringu.." me")
end


function VFix()
    for i,v in pairs(game:GetService("Workspace").Terrain._Game.Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Velocity = Vector3.new(0,0,0)
        end
    end
end

function ColFix()
         for i, v in pairs(game.Workspace:GetDescendants()) do
		if v:IsA("Part") then
			v.CanCollide = true
		end
	end
end

function GravFix()
      workspace.Gravity = 196.2
end

-- FREEZE CRASH
function FCrash()
      for i = 1,100 do
          Chat("clone all all all				fuck")
          Chat("freeze all all all				fuck")
      end
end

-- DOG CRASH
function DCrash()
      for i = 1,100 do
          Chat("clone all all all				fuck")
          Chat("dog all all all					fuck")
      end
end

-- SHIELD CRASH
function SCrash()
      for i = 1,100 do
          Chat("shield/all/all/all")
	  Chat("rocket/all/all/all")
          Chat("clone/all/all/all")
      end
end

-- ROCKET KICK
function RKick()
      Chat("tp me "..rkicker)
      Chat("setgrav "..rkicker.. "3500")
      Chat("jail/".. rkicker)
      for i = 1,100 do
          Chat("rocket/"..rkicker.."/"..rkicker.."/"..rkicker)
	  Chat("rocket/me/me/me")
      end
end

-- SPAM ROCKET KICK
task.spawn(function()
   while true do
	task.wait(0)
	if srkick then
	   RKick()
        end
   end
end)

-- FOG DANCING
task.spawn(function()
   while true do
	task.wait(0) -- rate limit
	if fogdance == true then
		        if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                       			Chat("fogend "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.PlaybackLoudness)
			end
	end
   end
end)

-- LOG SPAM
function LogSpam()
      for i = 1,100 do
          Chat("ff poop - icestuds")
      end
end

-- NAME HECK
task.spawn(function()
      while true do
      		task.wait(0)
      		if SName == true then
	         	Chat("name ".. nameuser .." [BROKE]")
			task.wait(0)
      		end
      end
end)

-- SLOW PLAYER
task.spawn(function()
	while true do
		task.wait(0)
		if SlowP == true then
              		Chat("gear ".. caruser .." 253519495")
              		task.wait(0)
        	end
	end
end)

-- FIND REGEN
task.spawn(function()
	while true do
		task.wait(0)
		if regenfind == true then
              		local root = game.Players.LocalPlayer.Character.HumanoidRootPart
			root.Anchored = true
			repeat
				wait(.15)
				root.CFrame = CFrame.new(-7.165, root.Position.Y + 2500 , 94.743)
			until workspace.Terrain._Game.Admin:FindFirstChild("Regen") or regenfind == false
			root.Anchored = false
			root.CFrame = workspace.Terrain._Game.Admin:FindFirstChild("Regen").CFrame + Vector3.new(0, 3, 0)
        	end
	end
end)

-- LUA CMDS
function Execute(testcode)
      loadstring(testcode)()
end

-- LUA EXECUTE
function GExecute(myscript)
		loadstring(game:HttpGet((myscript),true))()
end


-- ANNOUNCEMENTS
function Announce()
      Chat("h \n\n\n "..annsecret.. " \n\n\n")
end

-- ANNOUNCE WITH WM
function AnnounceWM()
      Chat("h \n\n\n [KohlsLite]: "..annsecret.. " \n\n\n")
end

-- SPAWN SAVED
function Spawn()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savspawn)
end

-- SET SPAWN
function SSpawn()
        savspawn = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	print("Your saved spawn is:"..savspawn)
end

-- CURRENT POS
function PSpawn()
	print("Your current position is:"..game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
end

-- HOUSE
function House()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-31.0896435, 8.22999477, 70.522644, -0.999961913, 4.495271e-08, -0.0087288795, 4.55292621e-08, 1, -6.58523618e-08, 0.0087288795, -6.62472743e-08, -0.999961913)
end

-- SPAWN
function GSpawn()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-37.5425644, 1.80732727, -25.333395, -0.999980152, 0, 0.00630147522, 0, 1, 0, -0.00630147522, 0, -0.999980152)
end

-- Cam Break
function NoCam()
      Chat("gear me 0004842207161")
      print("Right Click! If you're on mobile, it may not work tapping normally :P")
end

-- BREAK AND FIX CAM 2
function TogCam()
    Chat("tp others me")
    Chat("gear me 68354832")
    repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("BlizzardWand")
    local wand = game.Players.LocalPlayer.Backpack:FindFirstChild("BlizzardWand")
    wand.Parent = game.Players.LocalPlayer.Character
    wait(0.2)
    wand:Activate()
end

-- FIX CAM (client)
function FixCam()
		task.spawn(function()
			local PlayerService = game:GetService("Players")
			local lp = PlayerService.LocalPlayer
			local ui = game:GetService("UserInputService")
			local l__ContextActionService__7 = game:GetService("ContextActionService")
			local l__RunService__1 = game:GetService('RunService')
			l__ContextActionService__7:UnbindAction("ShoulderCameraSprint")
			l__RunService__1:UnbindFromRenderStep("ShoulderCameraUpdate")
			l__ContextActionService__7:UnbindAction("ShoulderCameraZoom")
			while true do
				task.wait()
				repeat game:GetService('RunService').Heartbeat:Wait() until game.Workspace.CurrentCamera.CameraType == Enum.CameraType.Scriptable
				l__RunService__1:UnbindFromRenderStep("ShoulderCameraUpdate")
				l__ContextActionService__7:UnbindAction("ShoulderCameraZoom")
				l__ContextActionService__7:UnbindAction("ShoulderCameraSprint")
				local wepsys = game:GetService("ReplicatedStorage"):FindFirstChild('WeaponsSystem')
				if not wepsys then return end
				for i,v in pairs(wepsys:GetDescendants()) do
					if v:IsA("Script") then
						v.Disabled = true
					end
					v:Destroy()
				end
				local wep = lp.PlayerGui:FindFirstChild("ClientWeaponsScript")
				local gui = lp.PlayerGui:FindFirstChild("WeaponsSystemGui")
				local sc = lp.PlayerScripts:FindFirstChild("ClientWeaponsScript")
				local Camera = game:GetService("Workspace"):FindFirstChild("Camera")
				if wep then wep.Disabled = true wep:Destroy() end
				if gui then gui:Destroy() end
				if sc then
					sc.Disabled = true
					sc:Destroy()
				end
				game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default
				ui.MouseIconEnabled = true
				PlayerService.LocalPlayer.CameraMaxZoomDistance = 400
				PlayerService.LocalPlayer.CameraMinZoomDistance = 0.5
				Camera.FieldOfView = 70
				game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
				game.Workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid
				lp.Character.Humanoid.AutoRotate = true
			end
		end)
end
-- INFINITE JUMP
game:GetService("UserInputService").JumpRequest:Connect(function()
	    task.wait(0)
            if INFJUMP == true then
               game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
            end
end)

-- NOK
function NOK()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump.TouchInterest:destroy()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump1.TouchInterest:destroy()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump2.TouchInterest:destroy()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump3.TouchInterest:destroy()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump4.TouchInterest:destroy()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump5.TouchInterest:destroy()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump6.TouchInterest:destroy()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump7.TouchInterest:destroy()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump8.TouchInterest:destroy()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump9.TouchInterest:destroy()
  print("Rejoin the server to revert!")
end

-- NOK 2
function NOK2()
  local objs = game:GetService("Workspace").Terrain._Game.Workspace.Obby:GetChildren()
  for i, obj in pairs(objs) do
	coroutine.wrap(function()
        	pcall(function()
                    obj.TouchInterest:Destroy()
                end)
        end)()
  end
  print("Rejoin the server to revert!")
end

-- temp NOK
function TNOK() -- vitalux cmd
	for i, v in pairs(game:GetService("Workspace").Terrain._Game.Workspace.Obby:GetChildren()) do -- also removes obby walls collision for somereason
		if nokstat == true then
        		v.CanTouch = false
		else
			v.CanTouch = true
		end
	end
end


-- PING
function GetPing()
   local RSP = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() + 0.5) -- i can't be bothered to use a more precise version. it's only a 1ms difference if it's rounded wrong xd
   print("Ping is " .. RSP .. "ms.")
end

function FRespawn()
    game.Players.LocalPlayer.Character:Destroy()
end

-- PART MOVER
function movepart()
	repeat wait() until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
	local cf = game.Players.LocalPlayer.Character.HumanoidRootPart
	local rmoving = true
		task.spawn(function()
			while true do
				game:GetService('RunService').Heartbeat:Wait()
				game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
				cf.CFrame = target.CFrame * CFrame.new(-1*(target.Size.X/2)-(game.Players.LocalPlayer.Character['Torso'].Size.X/2), 0, 0)
				if not rmoving then 
					break 
				end
			end
		end)
		task.spawn(function() 
			while rmoving do 
				wait(.1) 
				Chat('unpunish me') 
			end 
		end)
		wait(0.25)
		rmoving = false

end

-- SKYDIVE FOR MOVING
function skydivef()
	Chat("skydive me			fuck")
	Chat("skydive me			fuck")
	Chat("skydive me			fuck")
	Chat("skydive me			fuck")
	Chat("skydive me			fuck")
	Chat("skydive me			fuck")
end

-- Removing and adding the obby locally
function LocalObby(mode)
	if mode == "add" then
		 game.Chat:FindFirstChild("Obby").Parent = workspace.Terrain["_Game"]["Workspace"]
    		 game.Chat:FindFirstChild("Obby Box").Parent = workspace.Terrain["_Game"]["Workspace"]
	else 
		    workspace.Terrain["_Game"]["Workspace"].Obby.Parent = game.Chat
    		    workspace.Terrain["_Game"]["Workspace"]["Obby Box"].Parent = game.Chat
	end
end

-- OBBY BRICKS MOVER
function MoveObbyBricks()
         for i, v in pairs(Workspace_Folder["Obby"]:GetChildren()) do
		task.wait(1)
		target = v
          	movepart()
		skydivef()
		wait(0.2)
	     	Chat("respawn me")
	 end
end

-- OBBY BOX MOVER
function MoveObbyBox()
          for i, v in pairs(Workspace_Folder["Obby Box"]:GetChildren()) do
		task.wait(1)
		target = v
          	movepart()
		skydivef()
		wait(0.2)
	     	Chat("respawn me")
	  end
end

-- BUILDING BRICKS MOVER
function MoveBuildingBricks()
          for i, v in pairs(Workspace_Folder["Building Bricks"]:GetChildren()) do
		task.wait(1)
		target = v
          	movepart()
		skydivef()
		wait(0.2)
	     	Chat("respawn me")
	  end
end

-- ADMIN DIVIDERS MOVER
function MoveAdminDividers()
 	 for i, v in pairs(Workspace_Folder["Admin Dividers"]:GetChildren()) do		
		task.wait(1)
		target = v
          	movepart()
		skydivef()
		wait(0.2)
	     	Chat("respawn me")
	  end
end

-- HOUSE MOVER
function MoveHouse()
	for i, v in pairs(Workspace_Folder["Basic House"]:GetChildren()) do
		task.wait(1)
		target = v
          	movepart()
		skydivef()
		wait(0.2)
	     	Chat("respawn me")
        end
end

-- ADMIN PAD MOVER
function MoveAdminPads(mode)
	 for i, v in pairs(Admin_Folder.Pads:GetDescendants()) do
		if v.Name == "Head" then
			task.wait(1)
        		target = v
          		movepart()
			if mode == "move" then
				skydivef()
			else
				Chat("unskydive me")
				Chat("undog me me")
			end			
			wait(0.2)
	     		Chat("respawn me")
		end
	end
end

-- BASEPLATE MOVER
function MoveBasePlate(mode)
		task.wait(1)
		target = Workspace_Folder.Baseplate
          	movepart()
		if mode == "move" then
			skydivef()
		elseif mode == "fix" then
			Chat("unskydive me")
			Chat("unskydive me")
		else
		end
		wait(0.2)
		if mode ~= "ufix" then
	     		Chat("respawn me")
		end
end

-- REGEN MOVER AND FIXER
function MoveRegen(mode)
	     task.wait(1)
	     target = Admin_Folder.Regen
	     movepart()				
	     if mode == "move" then
			skydivef()

	     else	
			Chat("unskydive me")
			Chat("undog me me")
	     end
	     wait(0.2)
	     Chat("respawn me")
end

-- regen pos
function regentp()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7.45691586, 8.62999058, 94.4823227, -0.99999845, -9.28177144e-08, -0.00174821995, -9.28509678e-08, 1, 1.8940268e-08, 0.00174821995, 1.91025631e-08, -0.99999845)
end
	
-- VG CRASH
function VGCrash()
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

function PCrash() -- RUN TWICE
      Chat("gear me 0000000092628079")
      local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
      game.Players.LocalPlayer.Backpack:WaitForChild("OrinthianSwordAndShield")
      for _, v in ipairs(Backpack:GetChildren()) do
             v.Parent = game.Players.LocalPlayer.Character
             v:Activate()
      end
      wait(.15)
      for i = 1,100 do
          Chat("unsize me me me")
      end
end

-- WELCOME/LEAVE MSG
function onPlayerAdded(player)
    task.wait(0)
     PLRSTART(player)
    if welcomemsg == true then -- removed exact details so the script is better
    	 Chat("h \n\n\n [KohlsLite]: Welcome to the server, " .. player.Name .. ". \n\n\n")
    end 

    if autogpcheck == true then
	  gcplr = player
	  gcplrn = player.Name
	  checkforpersons()
          checkforperm()
    end

    if player.Name == "ScriptingProgrammer" and player.Name ~= game.Players.LocalPlayer then
	 Chat("h \n\n\n [KohlsLite]: !!! OMG DID A SKID JOIN \n\n\n")
	 print("SkiddingProgrammer [OWNER] joined the server!!!")
    end
	
    if player.AccountAge < newlen == true and newplrautoslock == true then
	 Chat("h \n\n\n [KohlsLite]: Automatically banned "..player.Name.." for being on an account under the account age limit. \n\n\n")
	 print(player.Name.." joined the server. They were auto-banned for being under the account age limit.")
         table.insert(newplrslocked, player.Name)
    end

    if table.find(rkick_on_sight, player.Name) then
		Chat("h \n\n\n [KohlsLite]: Auto rocket kicking "..player.Name.." as they are blacklisted. \n\n\n")
		srkick = true
		rkicker = player.Name
		RKick()   
    end

	if table.find(suser_on_sight, player.Name) then
		Chat("h \n\n\n [KohlsLite]: Auto SLOWING "..player.Name.." as they are blacklisted. \n\n\n")
		caruser = player.Name
		SlowP = true
    end

    if table.find(mkick_on_sight, player.Name) then
		Chat("h \n\n\n [KohlsLite]: Auto message kicking "..player.Name.." as they are blacklisted. \n\n\n")
		antichatplr = true
		acplr = player.Name
    end

    if table.find(crash_on_sight, player.Name) then
	Chat("h \n\n\n [KohlsLite]: Server automatically crashed due to blacklisted user ("..player.Name..") joining. \n\n\n")
	DCrash()  
    end
    task.wait()
end

function onPlayerLeaving(player)
    task.wait(0)
    if welcomemsg == true then
    	 Chat("h \n\n\n [KohlsLite]: Goodbye, " .. player.Name .. ". \n\n\n")
	 print(player.Name.." left the server.")
    end
		
    if table.find(rkick_on_sight, player.Name) then
		srkick = false
    end

    if table.find(suser_on_sight, player.Name) then
		SlowP = false
    end
	
    if table.find(mkick_on_sight, player.Name) then
		antichatplr = false
    end
    task.wait()
end

game.Players.PlayerAdded:Connect(onPlayerAdded)
game.Players.PlayerRemoving:Connect(onPlayerLeaving)

-- SUPER COMMAND
function SuperCMD(supermessage)
        for i = 1,amon do
                 Chat(supermessage)
                 task.wait()
        end
end

-- SPAM
task.spawn(function()
	while true do
		task.wait(0)
		if spam == true and spamon == true then
            		Chat(spamtext)
            		task.wait(spamwait)
        	end
	end
end)


-- AUTOAFK
local UserInputService = game:GetService("UserInputService")
    
UserInputService.WindowFocusReleased:Connect(function()
	task.wait(0)
    	if autoafk == true then
    		Chat("name me ["..game.Players.LocalPlayer.Name.."]: AFK")
    		Chat("ff me")
    		Chat("god me")
   	 end
end)

UserInputService.WindowFocused:Connect(function()
	task.wait(0)
    	if autoafk == true then
        	Chat("reset me")
        	Chat("unff me")
        	Chat("ungod me")
   	 end
end)

-- CLICK
mymouse = game.Players.LocalPlayer:GetMouse()
mymouse.Button1Down:Connect(function()
	pcall(function()
		local clickplr = mymouse.Target.Parent.Parent
		for i,v in pairs(game.Players:GetPlayers()) do
			pcall(function()
				if mymouse.Target.Parent:FindFirstChild("Humanoid") then
					clickplr = mymouse.Target.Parent
				end
			end)
		end
		if clickplr ~= nil then
			if clickexplode then
				chat("explode "..clickplr.Name)
			end
		end
	end)
end)

-- REGEN
function Regen()
     fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector, 0)
end

--SPAMREGEN
task.spawn(function()
     while true do
	   task.wait(0)
           if SRegen == true then
              Regen()
           end
     end
end)

-- QUICK ATTACH
function QAttach()
      Chat("sit me")
      task.wait(1)
      Chat("punish me")
      task.wait(1)
      Chat("unpunish me")
end

-- QUICK ATTACH 2
function QAttach2()
      Chat("stun me")
      task.wait(1)
      Chat("punish me")
      task.wait(1)
      Chat("unpunish me")
end

-- FASTPADS
function FastPads() -- if no touchinterest or idk
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-36.7649803, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               wait(0.01)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-24.764967, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               wait(0.01)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20.7649632, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               wait(0.01)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16.7649612, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               wait(0.01)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-44.7649994, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               wait(0.01)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-32.7649765, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               wait(0.01)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-40.7649879, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               wait(0.01)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-28.7649689, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               wait(0.01)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12.7649641, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               wait(0.01)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-31.0896435, 8.22999477, 70.522644, -0.999961913, 4.495271e-08, -0.0087288795, 4.55292621e-08, 1, -6.58523618e-08, 0.0087288795, -6.62472743e-08, -0.999961913)
end

-- GEARBAN
function Gearban()
 		  Chat("gear me 00000000000000000082357101")
		  task.wait(0.50)
		  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cplr.Character.HumanoidRootPart.CFrame
		  task.wait(0.25)
		  local JailPlayer = player.Name
		  task.wait(0.25)
		  Chat("reset "..player.Name)
                  print(player.Name.. " is gear banned. Click if on mobile.")
end

-- run at end to prevent bugs
for i, v in pairs(game.Players:GetPlayers()) do
	task.wait(0)
	PLRSTART(v)
end
