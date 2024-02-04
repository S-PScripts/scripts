-- KOHLSLITE BY TS2021/S_P FOR KOHLS ADMIN HOUSE
-- CREDITS TO MANY (tech + stuff from https://github.com/S-PScripts/kah-fork)
-- compiler used: https://www.tutorialspoint.com/execute_lua_online.php
-- not the best script in the world, i know, but decent enough

--[[ Things this script doesn't have...
fixing parts, moving parts, finding parts, -- DON'T WORRY, THIS WILL COME OUT EVENTUALLY
visualiser and parts because i have no persons wHaT a ShaME ]]

if _G.executed then 
	return 
	print("Did you execute this script twice?") 
end

_G.executed = true

local prefix = "." -- ANY LENGTH :D
local blacklist = {"sgoslee","sussy_ivan"} -- slocked users
local whitelist = {"me_123eq","me_crashking","ScriptingProgrammer","G_ODt","BANNter_Original","witnessfox22"} -- not affected by slock
local newplrslocked = {} -- don't edit!!
local newplrautoslock = true -- if new players under 21 days join they get blacklisted
local newlen = 21 -- control what is considered as a new account
local GWhitelisted = {"me_123eq","me_crashking","ScriptingProgrammer","G_ODt","BANNter_Original","witnessfox22"} -- gear whitelisted
local slockenabled = false -- slock

local permusers = {} -- users that use perm
local personsusers = {} -- users that use persons

local rkick_on_sight = {""} -- rocket kick player when they join
local crash_on_sight = {""} -- crash server when player joins
local mkick_on_sight = {""} -- kick player with pm spam when they join ONLY WORKS WITH ONE PLAYER
local suser_on_sight = {""} -- slow a user when they join with car gear ONLY WORKS WITH ONE PLAYER

local musiclist = {"9048375035", -- 1
		   "6680495507", -- 2
		   "6529070845", -- 3
		   "6917155909", -- 4
		   "6913550990", -- 5
		   "6847929757", -- 6
                   "1839029458", -- 7
                   "0035930009", -- 8
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
	           "0142376088", -- 27
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
		   "6770303644"} -- 42
      

local musicnames = {"All dropping 8 beats", -- 1
		    "Meow meow", -- 2
	            "Loud music", -- 3
	            "They trying to be cray", -- 4
	            "TLT FNAF 2", -- 5
                    "LONER", -- 6
	            "fUn cAmPiNg mUsIc", -- 7
	            "the loop", -- 8
	            "FIRE IN THE HOLE", -- 9
	            "women sings", -- 10
	            "gun shots", -- 11
	            "chill elevator", -- 12
	            "fresh air", -- 13
	            "the end", -- 14
		    "memories", -- 15
		    "AHHHH", -- 16 
		    "walter white", -- 17
		    "nuts", -- 18
	            "obamium 3d", -- 19
                    "blap blap", -- 20
	            "the metro", -- 21
                    "gigachad loop", -- 22
	            "ahh wahh haahh", -- 23
		    "interstellar", -- 24
	            "boom boom", -- 25
	            "fizz", -- 26
	            "Raining Tacos", -- 27
                    "PARTY", -- 28
                    "Fanfare", -- 29
		    "Rock On", -- 30
		    "LOUD MUSIC INTERUPT", -- 31
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
		    "seize"} -- 42

local antimlog = false -- for music

local padbanned = {"placeholder"} 
local padreinforcements = false 

local themes = {} -- one day...
local themecode = {}

local housekeybind = "h" -- Keybinds?!
local rekeybind = "r"

local clickexplode = true

local FAdmins = {} -- all admin but for individual users
local alladmin = false -- all admin
local amon = 100 -- super command times
local spamwait = 0 -- spam command wait

local perm = false
local perm2 = true
local loopgrab = false

local anticrash = true
local anticrash2 = false
local antigear = false
local antigear2 = false
local antigb = true
local antipaint = false
local antiattach2 = false

local antiflash = false
local antidisco = false
local antichat = false
local antiattach = false
local antigs = false

local PingLogs = false -- it's caps because caps
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

local permpassid = 66254 or 64354 -- don't edit
local personpassid = 35748 or 37127 -- don't edit

print("~~~Thank you for using KohlsLite! Created by S_P.~~~")
Chat("h \n\n\n [KohlsLite]: Executed! v1.050 keyword \n\n\n")

-- delta broke this, it was working before an update :P
--[[if string.match(game:HttpGet("https://inventory.roproxy.com/v1/users/" .. game.Players.LocalPlayer.UserId .. "/items/GamePass/" .. permpassid), permpassid) then
        perm = false 
	hasperm = true -- used
	print("A perm pad was not given - you have the Perm Admin gamepass!")
else
        perm = true
	hasperm = false -- used
	print("A perm pad was given - you don't have the Perm Admin gamepass!")
end

if string.match(game:HttpGet("https://inventory.roproxy.com/v1/users/" .. game.Players.LocalPlayer.UserId .. "/items/GamePass/" .. personpassid), personpassid) then
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

    	if string.sub(msg:lower(), 1, #prefix + 2) == prefix.."iy" then
	   GExecute("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
	end

	if string.sub(msg:lower(), 1, #prefix + 5) == prefix.."cmdpi" then -- well, you need that visualiser, do you?
		GExecute("https://raw.githubusercontent.com/quivings/KAH/main/CMD%20v3.lua")
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

       if string.sub(msg, 1, #prefix + 9)  == prefix..'adminlist' then
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

       if string.sub(msg, 1, #prefix + 12) == prefix..'checkpersons' then
         local dasplayer = string.sub(msg:lower(), #prefix + 14)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
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
            Chat("h \n\n\n [KohlsLite]: Playing music:" .. musicnames[musicplay] .. ". \n\n\n")
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
 		 print(musiclist[i].."-"..musicnames[i])
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
		
    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'volm' then
   	    local newVolume = tonumber(string.sub(msg:lower(), #prefix + 6))
   	    if newVolume ~= nil and game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
      		    game:GetService("Workspace").Terrain["_Game"].Folder.Sound.Volume = newVolume
       	end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'musicid' then
	      if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
			      print("Current Music ID: "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.SoundId)
	      end
    end

    if string.sub(msg:lower(), 0, 7) == prefix.."pbspeed" then
		local newPlaybackSpeed = tonumber(string.sub(msg:lower(), 9))
		local Sound = game:GetService("Workspace").Terrain["_Game"].Folder.Sound
		Sound.PlaybackSpeed = newPlaybackSpeed
    end

    if string.sub(msg:lower(), 0, 8) == prefix.."cpbspeed" then
		if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
				print("Current PlayBack speed: "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.PlaybackSpeed)
		end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'cvol' then
	      if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
			      print("Current Volume: "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.Volume)
	      end	
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
	print("BETA EDITION")
	RegenMover()
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
       if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
	  local myid  = game:GetService("Workspace").Terrain["_Game"].Folder.Sound.SoundId 
	  local myidfix = myid:match("(%d+)$")
	  if antimlog then
            	Chat("music 00000000000000000000000000" .. myidfix)
	  else
		Chat("music " .. myidfix)
	  end
       end
     end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'vgcrash' then
	VGCrash()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'pcrash' then
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
		
    if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'ad' then
       ADVERTISEMENT()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'ipboom' then
       IPBOOM()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'giforjif' then
       GIFORJIF()
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

  if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'boombox' then -- shortcut cmd lol
	local ubox = string.sub(msg:lower(), #prefix + 9)
	if ubox ~= "" then
		Chat("gear "..ubox.." 212641536")
		Chat("pm"..ubox.." play your music on the boombox pls")
	else
		Chat("gear me 212641536")
	end
  end

  if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'furry' then
	local furry = string.sub(msg:lower(), #prefix + 7)
	if furry ~= "" then
		Chat("char "..furry.." 0000000000000000004844006008")
	else
		Chat("char me 0000000000000000004844006008")
	end
  end

  if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'ecrash' then
	    GExecute("https://pastebin.com/raw/2RkVQ4vc") -- prevent bugs in the main script
	    task.wait(2)
            Chat("music 0000000000000000000006917155909")
            Chat("fogcolor 0 0 0")
            Chat("fogend 0")
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

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'qattach2' then
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
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'paintmap' then
	_G.ColourHere = string.sub(msg:lower(), #prefix + 10)
	GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Main%20Scripts/Paint Map.lua")
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
		name = string.sub(msg:lower(), #prefix + 9)
		Gearban()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'sspawn' then
		SSpawn()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'pspawn' then
		Pspawn()
    end
		
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'gsspawn' then
		Spawn()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'frespawn' then
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

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'breakcam' then
		NoCam()
    end

     if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fixvelo' then
		VFix()
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

     if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fastpads' then
		FastPads()
     end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unloopgrab' then
	loopgrab = false
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'unlg' then
	loopgrab = false
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
		
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'checkbp' then
	local checker = string.sub(msg:lower(), #prefix + 9)
        PLAYERCHECK(checker)
        if player ~= nil then 
		CheckBackpack()
        else
                print('Cannot find player with the name: '..checker)
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'stonemap' then
	StoneMap()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'rockmap' then
	StoneMap()
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'icemap' then
 	IceMap()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fixpaint' then
	GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Main%20Scripts/Paint.lua")
     end

   if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'anticrash' then
	anticrash = true
    end
 
    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'antigrayscale' then -- what is this??
	antigs = true
    end

    if string.sub(msg:lower(), 1, #prefix + 15) == prefix..'unantigrayscale' then 
	antigs = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unanticrash' then
	anticrash = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'anticrash2' then
	anticrash2 = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unanticrash2' then
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
		
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiblind' then
	YOUantiblind = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiblind' then
	YOUantiblind = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'anticlone' then
	YOUanticlone = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unanticlone' then
	YOUanticlone = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'anticlonea' then
	ALLanticlone = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unanticlonea' then
	ALLanticlone = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antifire' then
	YOUantifire = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantifire' then
	YOUantifire = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antifirea' then
	ALLantifire = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantifirea' then
	ALLantifire = false
    end	

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antifreeze' then
	YOUantifreeze = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantifreeze' then
	YOUantifreeze = false
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antifreezea' then
	ALLantifreeze = true
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantifreezea' then
	ALLantifreeze = false
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antiff' then
	YOUantiff = true
    end
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantiff' then
	YOUantiff = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antiffa' then
	ALLantiff = true
    end
		
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantiffa' then
	ALLantiff = false
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antiglow' then
	YOUantiglow = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantiglow' then
	YOUantiglow = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiglowa' then
	ALLantiglow = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiglowa' then
	ALLantiglow = false
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antihealthc' then
	YOUantihealthc = true
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantihealthc' then
	YOUantihealthc = false
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'antihealthca' then
	ALLantihealthc = true
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'unantihealthca' then
	ALLantihealthc = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antijail' then
	YOUantijail = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantijail' then
	YOUantijail = false
    end
				
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antijaila' then
	ALLantijail = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantijaila' then
	ALLantijail = false
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antijump' then
	YOUantijump = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantijump' then
	YOUantijump = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antijumpa' then
	ALLantijump = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantijumpa' then
	ALLantijump = false
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antikill' then
	YOUantikill = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantikill' then
	YOUantikill = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antikilla' then
	ALLantikill = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantikilla' then
	ALLantikill = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antimsg' then
	YOUantimsg = true
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantimsg' then
	YOUantimsg = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antiname' then
	YOUantiname = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantiname' then
	YOUantiname = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antinamea' then
	ALLantiname = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantinamea' then
	ALLantiname = false
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'antiparticles' then
	YOUantiparticles = true
    end

    if string.sub(msg:lower(), 1, #prefix + 15) == prefix..'unantiparticles' then
	YOUantiparticles = false
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'antiparticlesa' then
	ALLantiparticles = true
    end

    if string.sub(msg:lower(), 1, #prefix + 16) == prefix..'unantiparticlesa' then
	ALLantiparticles = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antipunish' then
	YOUantipunish = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantipunish' then
	YOUantipunish = false
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antipunisha' then
	ALLantipunish = true
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantipunisha' then
	ALLantipunish = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antirocket' then
	YOUantirocket = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantirocket' then
	YOUantirocket = false
    end

   if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antirocketa' then
	ALLantirocket = true
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantirocketa' then
	ALLantirocket = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antisit' then
	YOUantisit = true
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantisit' then
	YOUantisit = false
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antisita' then
	ALLantisit = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantisita' then
	ALLantisit = false
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antiseizure' then
	YOUantiseizure = true
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantiseizure' then
	YOUantiseizure = false
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'antiseizurea' then
	ALLantiseizure = true
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'unantiseizurea' then
	ALLantiseizure = true
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antismoke' then
	YOUantismoke = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantismoke' then
	YOUantismoke = false
    end

   if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antismokea' then
	ALLantismoke = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantismokea' then
	ALLantismoke = false
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'antisparkles' then
	YOUantisparkles = true
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'unantisparkles' then
	YOUantisparkles = false
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'antisparklesa' then
	ALLantisparkles = true
    end

    if string.sub(msg:lower(), 1, #prefix + 15) == prefix..'unantisparklesa' then
	ALLantisparkles = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antispeed' then
	YOUantispeed = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantispeed' then
	YOUantispeed = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antispeeda' then
	ALLantispeed = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantispeeda' then
	ALLantispeed = false
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antistun' then
	YOUantistun = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantistun' then
	YOUantistun = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antistuna' then
	ALLantistun = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantistuna' then
	ALLantistun = false
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antiswag' then
	YOUantiswag = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantiswag' then
	YOUantiswag = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiswaga' then
	ALLantiswag = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiswaga' then
	ALLantiswag = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antitrail' then
	YOUantitrail = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantitrail' then
	YOUantitrail = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antitraila' then
	ALLantitrail = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantitraila' then
	ALLantitrail = false
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antichat' then
	antichat = true
	antimsg = true -- stop you from crashing :D
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantichat' then
	antichat = false
	antimsg = false
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'mkick' then
	local acplr = string.sub(msg:lower(), #prefix + 10)
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

print("---")
print("unloopgrab/unlg - stop loopgrabing all the pads")

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
print("giforjif - the famous question")
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
print("ad - advertise this script (pls do this you are nice if you do this :D)")
print("frespawn - force respawn if punished")

print("---")
print("welmsg - welcome people to the server (and leave msg too)")
print("unwelmsg - no more welcome and leave msg")

print("---")
print("autoafk - names you as afk when you're afk")
print("unautoafk - stops naming you as afk when you're afk")

print("---")
print("nocam/breakcam - break the camera")
print("fixvelo - fix your velocity")

print("---")
print("goto - alt to tp me plr")
print("bring - alt to tp plr me")

print("---")
print("biglogs - make the logs bigger!")
print("chatz - chat a string of - causing the previous messages to vanish")

print("---")
print("qattach - quickly attach to something")
print("qattach2 - quickly attach to something")

print("---")
print("house - teleport to the house")
print("spawn - teleport to spawn")

print("---")
print("infjump - infinite jump")
print("uninfjump - stop infinite jump")

print("---")
print("checkperm - check player for perm")
print("checkpersons - check player for persons")
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
print("furry - HAHIUSHJDIKH")
	
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
print("announcewm - announce a message with [KohlsLite]: as the sender of the h")

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
print("cvol - print thecurrent volume of music")
print("musicid - print the current music id")
print("pbspeed - set the playback speed")
print("cpbspeed - print the current playback speed")

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
print("anticrash2 - anti-crash with vg or osas")
print("antigear - stop users from using gears")
print("antigear2 - stop users from using gears")
print("antipaint - stop users from using the paint bucket and Subspace Tripmine")
print("antigb - stop users from using the portable justice and car gear") -- ik car gear isn't a gear ban gear but i'm lazy
print("antiattach2 - stop users from using the Ivory Periastron")

print("---")
print("antichat - stop people chatting by spamming h command full of emojis")
print("unantichat - allow people to chat again")
print("mkick - crash players with emojis using pm. You can use this instead of h as pm can be more effective.")
print("unmkick - stop trying to crash players with emojis")

print("---")
print("There are also many other antis (for you or for everyone)!")

print("---")
print("KohlsLite, since 2023. Created by S_P")
print("Version is: v1.048 - 23rd January 2024 Build")
end

-- CHECK FOR PERM
function checkforperm()
	if string.match(game:HttpGet("https://inventory.roblox.com/v1/users/" .. cplr.userId .. "/items/GamePass/" .. permpassid), permpassid) then
	   print(player.." has perm!")
	   table.insert(permusers,player)
	else
	   print(player.."does not have perm!")
	end
end

-- CHECK FOR PERSONS
function checkforpersons()
	if string.match(game:HttpGet("https://inventory.roblox.com/v1/users/" .. cplr.userId .. "/items/GamePass/" .. personpassid), personpassid) then
	   print(player.." has persons!")
	   table.insert(personsusers,player)
	else
	   print(player.."does not have persons!")
	end
end

-- this is similar to CMD's system :D
-- SLOCK/BL/WL
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
                                Chat('pm [KohlsLite]: '..v.Name..' sorry, this server is locked!')
                        end
                    elseif table.find(blacklist, v.Name) then
                        if not game.Lighting:FindFirstChild(v.Name) then
                                Chat('punish '..v.Name)
                                Chat('blind '..v.Name)
                                Chat('pm [KohlsLite]: '..v.Name..' sorry, you are blacklisted!')
                        end
                    elseif table.find(newplrslocked, v.Name) then
			if not game.Lighting:FindFirstChild(v.Name) then
                                Chat('punish '..v.Name)
                                Chat('blind '..v.Name)
                                Chat('pm [KohlsLite]: '..v.Name..' sorry, you are blacklisted for having an account under the account age limit!')
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
  end
end)

-- anti chat/msg-crash
task.spawn(function()
	while true do
	task.wait()
		if antichat == true then
			Chat("h \n\n\n [KohlsLite]: 😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀 \n\n\n")
			Chat("h/ \n\n\n [KohlsLite]: 😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀 \n\n\n")
		end
		if antichatplr == true then
			Chat("pm"..acplr.." [KohlsLite]: 😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀")
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
			
	if antigs == true then
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
		game.Players.LocalPlayer.Character.Humanoid.Health = 100            
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
	end
			
	if YOUantiname == true then
	   local player = game.Players:FindFirstChild(game.Players.LocalPlayer.Name)
          	if player and player.Character then
                  	local modelName = player.Character.Name
                  	local actualName = player.Name
                 	 if modelName ~= actualName then
                        	Chat("reset me")
                 	 end
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
                local oldposition = Player.Character.HumanoidRootPart.CFrame
                Chat("reload me")
                Player.Character.HumanoidRootPart.CFrame = oldposition
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

	if YOUantitrail == true then
	    local player = game.Players.LocalPlayer
             if player.Character then
                    local humanoid = player.Character:WaitForChild("Humanoid", 1)
                    if humanoid and humanoid.Trail then
                        humanoid.Trail = false
                        Chat("untrail me")
                    end
             end
	end
			
	end
end)

-- ANTIS FOR EVERYONE
task.spawn(function()
	while true do
	task.wait()
	for _, player in ipairs(game.Players:GetPlayers()) do
	if player ~= game.Players.LocalPlayer then
	if ALLanticlone == true then
	    if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild(player.Name) then
                Chat("unclone"..player.Name)
            end
	end
				
	if ALLantifire == true then
	    if player.Name.Character:FindFirstChild("Torso") then
                if player.Name.Character.Torso:FindFirstChild("Fire") then
                    Chat("unfire"..player.Name)
                end
            end
	end
				
	if ALLantifreeze == true then
	     if player.Name.Character:FindFirstChild("ice") then
                Chat("thaw"..player.Name)
            end
	end
				
	if ALLantifly == true then
	    if not player.Name.Character:FindFirstChild("Seizure") and player.Name.Character.Humanoid:GetState().Name == "PlatformStanding" then
                Chat("unfly"..player.Name)
                Chat("clip"..player.Name)
            end
	end
				
	if ALLantiff == true then
	 if player.Name.Character:FindFirstChild("ForceField") then
                Chat("unff"..player.Name)
            end
	end
				
	if ALLantiglow == true then
	   if player.Name.Character:FindFirstChild("PointLight") then
                  Chat("unglow"..player.Name)
            end
	end
				
	if ALLantihealthc == true then
	   if not player.Name.Character.Humanoid.Health == 100 then
		Chat("health"..player.Name.."100")
	   end
        end
            
	if ALLantijail == true then
	    if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild(player.Name .. "'s jail") then
                Chat("unjail"..player.Name)
            end
        end
				
	if ALLantijump == true then
	    if not player.Name.Character.Humanoid.JumpPower == 50 then
		Chat("normaljump"..player.Name)
            end
	end
				
	if ALLantikill == true then
	   if player.Name.Character.Humanoid.Health == 0 then
                    Chat("reset"..player.Name)
                end
	end

	if ALLantiname == true then
	   local player = game.Players:FindFirstChild(player.Name)
          	if player and player.Character then
                  	local modelName = player.Character.Name
                  	local actualName = player.Name
                 	 if modelName ~= actualName then
                        	Chat("reset"..player.Name)
                 	 end
         	 end
	end
				
	if ALLantiparticles == true then
	   if player.Name.Character:FindFirstChild("ParticleEmitter") then
                  Chat("unparticle"..player.Name)
            end
	end
				
	if ALLantipunish == true then
	    if game.Lighting:FindFirstChild(player.Name) then
                Chat("unpunish"..player.Name)
            end
	end
				
	if ALLantirocket == true then
	   if player.Name.Character:FindFirstChild("Rocket") then
                Chat("reload"..player.Name)
            end
	end
				
	if ALLantisit == true then
	   local player = player.Name
            	 if player.Character then
                    local humanoid = player.Character:WaitForChild("Humanoid", 1)
                    if humanoid and humanoid.Sit then
                        Chat("unsit"..player.Name)
                    end
             	end
	end
				
	if ALLantiseizure == true then
	        if player.Name.Character:FindFirstChild("Seizure") then
                Chat("unseizure"..player.Name)
            end
	end
				
	if ALLantismoke == true then
	     if player.Name.Character:FindFirstChild("Torso") then
                if player.Name.Character.Torso:FindFirstChild("Smoke") then
                    Chat("unsmoke"..player.Name)
                end
            end
	end
				
	if ALLantisparkles == true then
	    if player.Name.Character:FindFirstChild("Torso") then
                if player.Name.Character.Torso:FindFirstChild("Sparkles") then
                    Chat("unsparkles"..player.Name)
                end
            end
	end
				
	if ALLantispeed == true then
	    if not player.Name.Character.Humanoid.WalkSpeed == 16 then
		Chat("speed"..player.Name.."16")
	    end
	end
				
	if ALLantistun == true then
	    local player = player.Name
             if player.Character then
                    local humanoid = player.Character:WaitForChild("Humanoid", 1)
                    if humanoid and humanoid.PlatformStand then
                        Chat("unstun"..player.Name)
                    end
             end
	end
				
	if ALLantiswag == true then
		if player.Name.Character:FindFirstChild("EpicCape") then
                	Chat("normal"..player.Name)
		end
	end

	if ALLantitrail == true then
	    local player = player.Name
             if player.Character then
                    local humanoid = player.Character:WaitForChild("Humanoid", 1)
                    if humanoid and humanoid.Trail then
                        Chat("untrail"..player.Name)
                    end
             end
	end
	end		
	end
	end
end)

-- PLAYER CHECK
function PLAYERCHECK(plr)
  for i, v in pairs(game.Players:GetPlayers()) do
      if string.sub(v.Name:lower(), 1, #plr) == plr then
          player = v.Name
	  cplr = v
          print("Found"..player)
      end
  end
end

-- ANTI CRASH 2
game:GetService("RunService").RenderStepped:Connect(function()
	task.wait(0)
        for _, Player in pairs(game.Players:GetChildren()) do
            if Player.Backpack:FindFirstChild("VampireVanquisher") or Player.Character:FindFirstChild("VampireVanquisher") and anticrash2 then
               if Player ~= game.Players.LocalPlayer then
                Chat("ungear ".. Player.Name)
                Chat("punish ".. Player.Name)
                Chat("h \n\n\n [KohlsLite]: Sorry, ".. Player.Name.. ", you cannot use the Vampire Vanquisher due to anti crash. \n\n\n")
               end
            end
            if Player.Backpack:FindFirstChild("OrinthianSwordAndShield") or Player.Character:FindFirstChild("OrinthianSwordAndShield") and anticrash2 then
               if Player ~= game.Players.LocalPlayer then
                Chat("ungear ".. Player.Name)
                Chat("punish ".. Player.Name)
                Chat("h \n\n\n [KohlsLite]: Sorry, ".. Player.Name.. ", you cannot use the Orinthian Sword and Shield due to anti crash. \n\n\n")
               end
            end
	    for _, gear in pairs(Player.Backpack:GetChildren()) do
            	if gear:IsA("Tool") and antigear2 == true then
               		if Player ~= game.Players.LocalPlayer then
				Chat("ungear ".. Player.Name)
				Chat("punish ".. Player.Name)
                		Chat("h \n\n\n [KohlsLite]: Sorry, ".. Player.Name.. ", you cannot use gears due to anti gear. \n\n\n")
			end
            	end
       	    end
     end 
end)

-- ANTIS FOR CRASHING ATTACHING GEARBANNING AND HAVING A GEAR
local crashTools = {"OrinthianSwordAndShield", "VampireVanquisher"}
local attachTools = {"IvoryPeriastron"}
local nogearTools = {"PortableJustice","UltimateDriveSpeedster"}
local colourTools = {"PaintBucket","SubspaceTripmine"}

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
       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName .. " because of anti paint. \n\n\n")
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
    Chat('tp',number,".",number2,".",number3,".",number4)
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
   Chat("h \n\n\n Wait a second... that's me!!!!!!!")
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

-- SERVERHOP
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
	
-- GIF OR JIF
function GIFORJIF()
Speak("Hey you")
task.wait(2)
Speak("Yes, you!")
task.wait(2)
local Players = game.Players:GetPlayers()
local randomPlayer = "Placeholder"
task.wait(2)
	
repeat
randomPlayer = Players[math.random(#Players)] 
until randomPlayer ~= game.Players.LocalPlayer

Speak("I'm talking about you"..randomPlayer.."!")
task.wait(2)
Speak("How do you pronounce GIF?")
task.wait(2)
Speak("Is it GIF or JIF?")
noobs = true
repeat task.wait() until noobs == false
if resultg == false then
    task.wait(2)
    Speak("No death for you!")
else
    task.wait(2)
    Speak("I sense that the illuminati is coming...")
    task.wait(2)
    Speak("Is this game over...?")
    task.wait(2)
    Chat("fogend 0")
    Chat("time 0")
    DCrash()
end
end

-- some antis and admin system
function PLRSTART(v)
v.Chatted:Connect(function(msg)
     task.wait(0)
     task.spawn(function()
		task.wait(0)
                if (string.sub(msg:lower(), 0, 2) == "/w" or string.sub(msg:lower(), 0, 9) == "/c system") and v.Name ~= game.Players.LocalPlayer then
                   if PingCsystem then
                        print(v.Name..' is using /c system or whispering commands.')
                        Chat('h \n\n\n [KohlsLite]: '..v.Name..' is using /c system or whispering commands. \n\n\n')
                   end
                end
                if (string.sub(msg:lower(), 0, 4) == "logs" or string.sub(msg:lower(), 0, 5) == ":logs") and v.Name ~= game.Players.LocalPlayer then
                   if PingLogs then
                        print(v.Name..' is using logs.')
                        Chat('h \n\n\n [KohlsLite]: '..v.Name..' is using logs. \n\n\n')
                   end
        		   if AntiLogs then
            			LogSpam()
        		   end
                end

		if string.sub(msg:lower(), 0, 3) == "gif" and v.Name == randomPlayer and noobs == true then
        	    noobs = false
                    resultg = false
                end
		if string.sub(msg:lower(), 0, 3) == "jif" and v.Name == randomPlayer and noobs == true then
                    noobs = false
        	    resultg = true
            	end
					
        	if (string.sub(msg:lower(), 0, 3) == "sit" or string.sub(msg:lower(), 0, 4) == ":sit") and v.Name ~= game.Players.LocalPlayer then
                   if antiattach then
                     Chat("unsit"..v.Name)
                     print(v.Name..' tried to sit')
                     Chat('h \n\n\n [KohlsLite]: '..v.Name..', You cannot sit due to anti-attach \n\n\n')
                   end
                end
						
                if (string.sub(msg:lower(), 0, 4) == "stun" or string.sub(msg:lower(), 0, 5) == ":stun") and v.Name ~= game.Players.LocalPlayer then
                   if antiattach then
                     Chat("unstun"..v.Name)
                     print(v.Name..' tried to stun.')
                     Chat('h \n\n\n [KohlsLite]: '..v.Name..', you cannot stun due to anti-attach \n\n\n')
                   end
                end
						
    	        if string.sub(msg:lower(), 0, 4) == ";fly" and v.Name ~= game.Players.LocalPlayer then
		if noobdetect then
                   print(v.Name..' is a noob.')
                   Chat('h \n\n\n [KohlsLite]: '..v.Name..', it is fly me, not ;fly!! \n\n\n')
                end
		end
					
                if string.sub(msg:lower(), 0, 5) == ";poop" or string.sub(msg:lower(), 0, 5) == ":poop" or string.sub(msg:lower(), 0, 4) == "poop" then
		if noobdetect then
                   print(v.Name..' is a noob.')
                   Chat('h \n\n\n [KohlsLite]: '..v.Name..', go back to FREE ADMIN, POOP IS NOT A COMMAND!! \n\n\n')
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
                   Chat('h \n\n\n [KohlsLite]: '..v.Name..', imagine using the ; prefix! You dont need any!! \n\n\n')
                end
		end
					
                if (string.sub(msg:lower(), 0, 6) == ";bring" or string.sub(msg:lower(), 0, 6) == ":bring" or string.sub(msg:lower(), 0, 5) == "bring") and v.Name ~= game.Players.LocalPlayer then
		if noobdetect then
                   print(v.Name..' is a noob.')
                   Chat('h \n\n\n [KohlsLite]: '..v.Name..', it is tp (plr) me, not ;bring!! \n\n\n')
                end
		end
					
                if (string.sub(msg:lower(), 0, 5) == ";goto" or string.sub(msg:lower(), 0, 5) == ":goto" or string.sub(msg:lower(), 0, 4) == "goto") and v.Name ~= game.Players.LocalPlayer then
		if noobdetect then
                   print(v.Name..' is a noob.') 
                   Chat('h \n\n\n [KohlsLite]: '..v.Name..', it is tp me (plr), not ;goto!! \n\n\n')
            	end
		end




                    
-- ADMIN
            if alladmin == true or table.find(FAdmins, v.Name) and not table.find(blacklist, v.Name) and not table.find(newplrslocked, v.Name) then
            	local command = string.gsub(msg:lower(), "me", v.Name)
            	if string.sub(command, 1, 1) == ":" then
              	 	command = ""
               		Chat("pm "..v.Name.." [KohlsLite]: Please use commands without : . Thanks!")
            	end
            
           	 if string.sub(command, 1, 1) == "/" then
               		command = ""
            	end
            
                if string.sub(command, 1, 1) == prefix then
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
               Chat("pm "..v.Name.." [KohlsLite]: I can't make you private message because due to limitations. Sorry!")
          
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
	local checkme = game.Players:FindFirstChild(checker)
	local Backpack = checkme:FindFirstChild("Backpack")
	if Backpack then
      		for _, v in pairs(Backpack:GetChildren()) do
    	    		print(v.Name)
      		end
	end
end


-- LOOPGRAB 1
task.spawn(function()
    while true do 
        task.wait(0)
        coroutine.wrap(function()
			      if loopgrab == true then
				        local pads = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren("Head")
			      	    	for i, pad in pairs(pads) do
					        coroutine.wrap(function()
						          pcall(function()
							            local cre = pad.Head
						              	    local spr = game.Players.LocalPlayer.Character:FindFirstChild("Head")
						              	    firetouchinterest(cre, spr, 1)
                          					    firetouchinterest(cre, spr, 0)
                          				            firetouchinterest(cre, spr, 1)
							            task.wait()
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

-- MUSIC RELATED
task.spawn(function()
 while true do
    task.wait(0)
    if antimusic == true then
		  if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
				 Chat("music antimusic is on!")
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
          Chat("tp me"..gotou)
end

-- for cframe goto
function Goto2()
	  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = gotou.Character.HumanoidRootPart.CFrame
end

-- BRING
function Bring()
      Chat("tp"..bringu.."me")
end


function VFix()
    for i,v in pairs(game:GetService("Workspace").Terrain._Game.Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Velocity = Vector3.new(0,0,0)
        end
    end
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
      for i = 1,100 do
          Chat("rocket/"..rkicker.."/"..rkicker.."/"..rkicker)
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


-- LOG SPAM
function LogSpam()
      for i = 1,100 do
          Chat("ff LOGS ARE BAD")
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
	for _, Bricks in pairs(game:GetService("Workspace").Terrain._Game.Workspace.Obby:GetChildren()) do
		if nokstat == true then
        		Bricks.CanTouch = false
		else
			Bricks.CanTouch = true
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
    print("lol this doesn't actually work lol")
end

-- regen mover
function RegenMover()
    print("Attempting to move REGEN pad...")
    adminfolder = game:GetService("Workspace").Terrain["_Game"].Workspace.Admin
    if adminfolder.Regen.CFrame.Y < 500 then
	repeat wait() 
	until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
	local cf = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	local moveregen = true
	task.spawn(function()
		while true do
			task.wait(0)
			game:GetService('RunService').Heartbeat:Wait()
			game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
			cf.CFrame = adminfolder.Regen.CFrame * CFrame.new(-1*(adminfolder.Regen.Size.X/2)-(game.Players.LocalPlayer.Character['Torso'].Size.X/2), 0, 0)
			if not moveregen then 
				break 
			end
		end
	end)
    end
				
	task.spawn(function() 
		while moveregen do 
			task.wait(0)
			wait(.1) 
			Chat('unpunish me') 
		end 
	end)
end

-- STONE MAP
function StoneMap() -- cmd pi
local stoneTool1 = "PL"
local stoneTool2 = "PL"
Chat("ungear me")
Chat('gear me 59190534')
Chat('gear me 59190534')
repeat task.wait() until #LocalPlayer.Backpack:GetChildren() >= 2
stoneTool1 = LocalPlayer.Backpack:GetChildren()
stoneTool2 = LocalPlayer.Backpack:GetChildren()
task.wait()
stoneTool1.Parent = LocalPlayer.Character
stoneTool2.Parent = LocalPlayer.Character
task.wait()
thread(function()
      stoneTool1.ServerControl:InvokeServer("KeyPress", {["Key"] = "x", ["Down"] = true})
end)
thread(function()
      stoneTool2.ServerControl:InvokeServer("KeyPress", {["Key"] = "x", ["Down"] = true})
end)
print("Click on mobile yourself")
end

-- ICE MAP
function IceMap() -- cmd pi
Workspace = game:GetService("Workspace").Terrain["_Game"].Folder
local plasticTool = "Placeholder"
Chat('gear me 2758794374')
repeat task.wait() until LocalPlayer.Backpack:FindFirstChild("2019BloxyAward")
plasticTool = LocalPlayer.Backpack:FindFirstChild("2019BloxyAward")
task.wait(0)
plasticTool.Parent = LocalPlayer.Character
task.wait(0)
for _,part in pairs(Workspace:GetDescendants()) do
      thread(function()
          if part:IsA("Part") then
             local MassCheck = part:Clone()
             MassCheck.Material = Enum.Material.Ice
              if MassCheck:GetMass() <= 5 then
                return
              end
              repeat 
                  plasticTool:Activate()
                    task.wait(0)
                    firetouchinterest(plasticTool:WaitForChild("Handle"), part, 0)
                    firetouchinterest(plasticTool:WaitForChild("Handle"), part, 1)
              until
                  (part.Material == Enum.Material.Ice and part.BrickColor == BrickColor.new("Bright yellow")) or plasticTool.Parent ~= LocalPlayer.Character
           end
      end)
 end
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

function PCrash()
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
    if welcomemsg == true then -- removed because you can just ask
    	 Chat("h \n\n\n [KohlsLite]: Welcome to the server, " .. player.Name .. ". \n\n\n")
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


    if table.find(mkick_on_sight, player.Name) then
		antichatplr = false
    end
    task.wait()
end

game.Players.PlayerAdded:Connect(onPlayerAdded)
game.Players.PlayerRemoving:Connect(onPlayerLeaving)

-- SUPER COMMAND
function SuperCMD()
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
    		Chat("name me [KohlsLite]: AFK")
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
		  names = game.Players:GetChildren()
		  for i,v in pairs(names) do
			    strlower = string.lower(v.Name)
			    sub = string.sub(strlower,1,#name)
			      if name == sub then
				          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
				          task.wait(0.25)
				          local JailPlayer = v.Name
				          game:GetService("Workspace").Terrain._Game.Workspace[game.Players.LocalPlayer.Name].PortableJustice.MouseClick:FireServer(game:GetService("Workspace").Terrain._Game.Workspace[JailPlayer])
				          task.wait(0.25)
				          Chat("reset "..v.Name)
                  Chat("pm "..v.Name.. "No gears for you now! Rejoin if you want them.")
			      end
		  end
end

-- ballin
for i, v in pairs(game.Players:GetPlayers()) do
	task.wait(0)
	PLRSTART(v)
end
