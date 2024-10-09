
# Lua code containing commands
lua_code = """
game.Players.LocalPlayer.Chatted:Connect(function(msg)
        task.wait(0)
		
        if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'kcmds' then
           CMDPrint()
           Remind("Check your console by running /console!")
        end

        if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'iy' then -- the classic
                   GExecute("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
		   Remind("Executed Infinite Yield (IY).")
        end

	-- cmd v3
	if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'myvis' then
                if haspersons == true then
                        Remind("The prefix is -")
                        GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Main%20Scripts/MyVisualiser.lua")
                else 
                        Remind("Sorry, you need persons for this command!")
                end
        end 

        if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'mydraw' then
                if haspersons == true then
                        Remind("The prefix is -")
                        GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Main%20Scripts/MyVisualiser.lua")
                else 
                        Remind("Sorry, you need persons for this command!")
                end
        end
		
        if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'cmdpi' then -- well, you need that visualiser, do you?
		if IsOnMobile then
			Remind("CMD PI/V3 does not work on mobile executors.")
		else
                	GExecute("https://raw.githubusercontent.com/S-PScripts/KAH/main/CMD%20v3.lua")
			Remind("Executed CMD PI/V3. Created by quiving..")
		end
        end

        if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'prsc' then -- PR Script ~ atprog
                GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/People's%20Scripts/PR_Script.txt")
		Remind("Executed PR Script. Created by atprog.")
        end

        if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'cmdy' then -- you don't need this for attaching anymore ;)
                GExecute("https://raw.githubusercontent.com/S-PScripts/KAH/main/CMD-Y%20(v1.56).lua")
		Remind("Executed CMD Y/V2. Created by quiving.")
        end

        if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'tricky' then -- CREDITS TO TECH
                Remind("This might not work if it's already been executed. Sorry! Created by Tech")
                if haspersons == true then
                        GExecute("https://raw.githubusercontent.com/Tech-187/Music-lyrics-on-time/main/Tricky%20lyrics.lua")
                else
                        GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Other%20Scripts/Tricky%20Lyrics%20non%20persons.lua")
                end
        end

        if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'ilove' then -- CREDITS TO TECH
                Remind("This might not work if it's already been executed. Sorry! Created by Tech")
                if haspersons == true then
                        GExecute("https://raw.githubusercontent.com/Tech-187/Music-lyrics-on-time/main/I%20loveee.lua")
                else
                        GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Other%20Scripts/I%20loveee%20non%20persons.lua")
                end
        end

        if string.sub(msg, 1, #prefix + 2)  == prefix..'wl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 4)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
		if player == game.Players.LocalPlayer.Name then 
			return Remind("You cannot whitelist yourself.")
		end
		
		if not table.find(whitelist, player) then		
			if blwl_an then
				if watermark_kl then
                        		Chat("h \n\n\n [KohlsLite]: "..player.." has been whitelisted! \n\n\n")
				else
                        		Chat("h \n\n\n "..player.." has been whitelisted! \n\n\n")
				end
			end	
			if table.find(blacklist, player) then
				Remind("Unblacklisted "..player.." to whitelist them.")
				table.remove(blacklist, table.find(blacklist, player))
			else
                        	Remind("Whitelisted "..player)
			end	
                        table.insert(whitelist, player)
                        Chat('unblind '..player)
                        Chat('unpunish '..player)
                else
                        Remind(player.." is already whitelisted!")
                end
	
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

       if string.sub(msg, 1, #prefix + 9)  == prefix..'whitelist' then
		local dasplayer = string.sub(msg:lower(), #prefix + 11)
		Chat(prefix.."wl "..dasplayer)
		-- Remind("ERROR: Use 'wl' instead of 'whitelist'!") -- woz gonna be lazy
       end

       if string.sub(msg, 1, #prefix + 4) == prefix..'unwl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 6)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if table.find(whitelist, player) then	
			if blwl_an then
				if watermark_kl then
					Chat("h \n\n\n [KohlsLite]: "..player.." has been unwhitelisted. \n\n\n")
				else
                        		Chat("h \n\n\n "..player.." has been unwhitelisted. \n\n\n")
				end
			end
                        Remind("Unwhitelisted "..player)
                        table.remove(whitelist, table.find(whitelist, player))
                else
                        Remind(player.." was never whitelisted!")        
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

	if string.sub(msg, 1, #prefix + 11)  == prefix..'unwhitelist' then
		local dasplayer = string.sub(msg:lower(), #prefix + 13)
		Chat(prefix.."unwl "..dasplayer)
	end

	if string.sub(msg, 1, #prefix + 2) == prefix..'bl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 4)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
		if player == game.Players.LocalPlayer.Name then 
			return Remind("You cannot blacklist yourself.")
		end
				
                if not table.find(blacklist, player) then
			if blwl_an then
				if watermark_kl then
					Chat("h \n\n\n [KohlsLite]: "..player.." has been blacklisted. \n\n\n");Regen()
				else
                        		Chat("h \n\n\n "..player.." has been blacklisted. \n\n\n");Regen()
				end
			end
			if table.find(whitelist, player) then
				Remind("Unwhitelisted "..player.." to blacklist them.")
				table.remove(whitelist, table.find(whitelist, player))
			else
                        	Remind("Blacklisted "..player)
			end
                        table.insert(blacklist, player)
                else
                        Remind(player.." is already blacklisted!")        
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

	if string.sub(msg, 1, #prefix + 9)  == prefix..'blacklist' then
		local dasplayer = string.sub(msg:lower(), #prefix + 11)
		Chat(prefix.."bl "..dasplayer)
	end
		
        if string.sub(msg, 1, #prefix + 4) == prefix..'unbl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 6)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if table.find(blacklist, player) then
			if blwl_an then
				if watermark_kl then
					Chat("h \n\n\n [KohlsLite]: "..player.." has been unblacklisted! \n\n\n")
				else
                        		Chat("h \n\n\n "..player.." has been unblacklisted! \n\n\n")
				end
			end
                        table.remove(blacklist, table.find(blacklist, player))
			if table.find(newplrslocked, player) then
				 table.remove(newplrslocked, table.find(newplrslocked, player))
			end
                        Remind("Unblacklisted "..player)
                        Chat('unblind '..player)
                        Chat('unpunish '..player)
                else
                        Remind(player.." was never blacklisted!")        
                end

         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
        end

        if string.sub(msg, 1, #prefix + 11)  == prefix..'unblacklist' then
		local dasplayer = string.sub(msg:lower(), #prefix + 13)
		Chat(prefix.."unbl "..dasplayer)
        end
		
        if string.sub(msg, 1, #prefix + 6)  == prefix..'listwl' then
           Remind("Check your console by running /console!")
           for i = 1, #whitelist do
                  print(whitelist[i])
           end
        end

        if string.sub(msg, 1, #prefix + 8)  == prefix..'antimlog' then
                antimlog = true
		Remind("Players won't be finding out the music ids in this script now!")
        end

        if string.sub(msg, 1, #prefix + 10)  == prefix..'unantimlog' then
                antimlog = false
		Remind("Players can find out the music ids in this script now!")
        end

        if string.sub(msg, 1, #prefix + 5)  == prefix..'admin' then
         local dasplayer = string.sub(msg:lower(), #prefix + 7)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if not table.find(FAdmins, player) then
			if blwl_an then
                        	Chat("h \n\n\n "..player.." has been given admin! \n\n\n")
			end
                        Remind("Admined "..player)
                        table.insert(FAdmins, player)
                else
                        Remind(player.." is already an admin!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

        if string.sub(msg, 1, #prefix + 7)  == prefix..'unadmin' then
         local dasplayer = string.sub(msg:lower(), #prefix + 9)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if table.find(FAdmins, player) then
			if blwl_an then
                        	Chat("h \n\n\n "..player.." has been removed from admin. \n\n\n")
			end
                        Remind("Unadmined "..player)
                        table.remove(FAdmins, table.find(FAdmins, player))
                else
                        Remind(player.." was never an admin!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

       if string.sub(msg, 1, #prefix + 9)  == prefix..'listadmins' then
          Remind("Check your console by running /console!")
          for i = 1, #FAdmins do
                  print(FAdmins[i])
          end
        end

        if string.sub(msg, 1, #prefix + 6)  == prefix..'gearwl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 8)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
		if player == game.Players.LocalPlayer.Name then 
			return Remind("You cannot gear whitelist yourself.")
		end
				
                if not table.find(GWhitelisted, player) then
			if blwl_an then
                        	Chat("h \n\n\n "..player.." has been whitelisted from anti-gears! \n\n\n")
			end
                        Remind("Gear whitelisted "..player)
                        table.insert(GWhitelisted, player)
                else
                        Remind(player.." is already gear whitelisted!")        
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

        if string.sub(msg, 1, #prefix + 8)  == prefix..'ungearwl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 10)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if table.find(GWhitelisted, player) then
			if blwl_an then
                        	Chat("h \n\n\n "..player.." has been unwhitelisted from anti-gears. \n\n\n")
			end
                        Remind("Un gear whitelisted "..player)
                        table.remove(GWhitelisted, table.find(GWhitelisted, player))
                else
                        Remind(player.." was never gear whitelisted!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

        if string.sub(msg, 1, #prefix + 10)  == prefix..'listgearwl' then
           Remind("Check your console by running /console!")
           for i = 1, #GWhitelisted do
                  print(GWhitelisted[i])
           end
        end

        if string.sub(msg, 1, #prefix + 6)  == prefix..'fogvis' then -- fonalc funny var
                fogdance = true
		Remind("Fog visualiser is now on!")
        end

        if string.sub(msg, 1, #prefix + 8)  == prefix..'unfogvis' then -- fonalc funny var
                fogdance = false
                task.wait(0.5)
                Chat("fix")
		Remind("Fog visualiser is now off!")
        end

        if string.sub(msg, 1, #prefix + 4)  == prefix..'ccol' then
                Chat("fogend 0")
                ccolours = true
		Remind("CrAzY cOlOuRs!")
        end

        if string.sub(msg, 1, #prefix + 6)  == prefix..'unccol' then
                ccolours = false
                task.wait(0.5)
                Chat("fix")
		Remind("No more crazy colours, phew!")
        end
		
        if string.sub(msg, 1, #prefix + 6)  == prefix..'blwlan' then
			blwl_an = true
			Remind("Blacklist/whitelist/gearwhitelist etc announcements enabled.")
	end

        if string.sub(msg, 1, #prefix + 6)  == prefix..'unblwlan' then
			blwl_an = true
			Remind("Blacklist/whitelist/gearwhitelist etc announcements enabled.")
	end

       if string.sub(msg, 1, #prefix + 8) == prefix..'loopkill' then
         local dasplayer = string.sub(msg:lower(), #prefix + 10)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if not table.find(loopkill, player) then
			if blwl_an then
                        	Chat("h \n\n\n "..player.." is being loopkilled. \n\n\n")
			end
                        Remind("Loopkilling "..player)
                        table.insert(loopkill, player)
                else
                        Remind(player.." is already being loopkilled!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

       if string.sub(msg, 1, #prefix + 10) == prefix..'unloopkill' then
         local dasplayer = string.sub(msg:lower(), #prefix + 12)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if table.find(loopkill, player) then
			if blwl_an then
                        	Chat("h \n\n\n "..player.." is no longer being loopkilled! \n\n\n")
			end
                        Remind("Stopped loopkilling "..player)
                        table.remove(loopkill, table.find(loopkill, player))
                else
                        Remind(player.." was never loopkilled!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

   if string.sub(msg, 1, #prefix + 5) == prefix..'names' then
         local dasplayer = string.sub(msg:lower(), #prefix + 7)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if not table.find(byecam, player) then
			if blwl_an then
                        	Chat("h \n\n\n "..player.."'s camera is getting spam named! \n\n\n")
			end
                        Remind("Spam naming "..player)
                        table.insert(byecam, player)
                else
                        Remind(player.." is already being spam named!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

       if string.sub(msg, 1, #prefix + 7) == prefix..'unnames' then
         local dasplayer = string.sub(msg:lower(), #prefix + 9)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if table.find(byecam, player) then
			if blwl_an then
                        	Chat("h \n\n\n "..player.."'s camera is no longer being spam named! \n\n\n")
			end
                        Remind("Stopped spam naming "..player)
                        table.remove(byecam, table.find(byecam, player))
                else
                        Remind(player.." was never spam named!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

   if string.sub(msg, 1, #prefix + 6) == prefix..'lagged' then
         local dasplayer = string.sub(msg:lower(), #prefix + 8)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if not table.find(carcar, player) then
			if blwl_an then
                        	Chat("h \n\n\n "..player.." loves cars! Yummy! \n\n\n")
			end
                        Remind("Spam car-ing "..player)
                        table.insert(carcar, player)
                else
                        Remind(player.." is already being spam carred!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

       if string.sub(msg, 1, #prefix + 8) == prefix..'unlagged' then
         local dasplayer = string.sub(msg:lower(), #prefix + 10)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if table.find(carcar, player) then
			if blwl_an then
                        	Chat("h \n\n\n "..player.."'s hates cars! Noooooo \n\n\n")
			end
                        Remind("Stopped spam car-ing "..player)
                        table.remove(carcar, table.find(carcar, player))
                else
                        Remind(player.." was never spam carred!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

       if string.sub(msg, 1, #prefix + 7) == prefix..'coinlag' then
		local response = Instance.new("BindableFunction")
		function response.OnInvoke(answer)
			if answer == "Yes" then
				SuperCMD("gear me 24015579")
                		local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
                		for _, v in ipairs(Backpack:GetChildren()) do
					v.Parent = game.Players.LocalPlayer.Character
					task.wait(0)
					v:Activate() 
				end 
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "KohlsLite Manager",
			Text = "This might lag you. Are you sure about this?",
			Duration = math.huge,
			Callback = response,
			Button1 = "Yes",
			Button2 = "No"
		})
	end
		
       if string.sub(msg, 1, #prefix + 6) == prefix..'report' then
         local dasplayer = string.sub(msg:lower(), #prefix + 8)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                        Remind("Reported "..player.."! Note that reporting doesn't work on some executors")
                        game.Players:ReportAbuse(game:GetService("Players"),player,"Cheating/Exploiting", "Spamming random stuff " .. math.random(1, 3276700))         
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

      if string.sub(msg, 1, #prefix + 9) == prefix..'checkperm' then
         local dasplayer = string.sub(msg:lower(), #prefix + 11)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                gcplr = cplr
                gcplrn = player
                checkforperm()
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

       if string.sub(msg, 1, #prefix + 10) == prefix..'fcheckperm' then -- cool amirite
	  Remind("Wait 5 seconds then check logs...")
          Chat("reset all")
          Regen()
          task.wait(1)
          checkperm2 = true
          Chat("ff admins")
          task.wait(2)
          checkperm2 = false
          Chat("unff admins")
       end

       if string.sub(msg, 1, #prefix + 12) == prefix..'checkpersons' then
         local dasplayer = string.sub(msg:lower(), #prefix + 14)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                gcplr = cplr
                gcplrn = player
                checkforpersons()
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
        end

      if string.sub(msg, 1, #prefix + 8) == prefix..'checkgps' then
         local dasplayer = string.sub(msg:lower(), #prefix + 10)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                gcplr = cplr
                gcplrn = player
                checkforperm()
                checkforpersons()
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

        if string.sub(msg, 1, #prefix + 6)  == prefix..'listbl' then
           Remind("Check your console by running /console!")
           for i = 1, #blacklist do
                  print(blacklist[i])
           end
        end

        if string.sub(msg, 1, #prefix + 9)  == prefix..'permusers' then
           Remind("Check your console by running /console!")
           for i = 1, #permusers do
                  print(permusers[i])
           end
        end

        if string.sub(msg, 1, #prefix + 12)  == prefix..'personsusers' then
           Remind("Check your console by running /console!")
           for i = 1, #personsusers do
                  print(personsusers[i])
           end
        end

       if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'adminjoy' then
                game.Players.LocalPlayer:Kick("you: 'i use adminjoy trash!' Anyways, ask ME to add the colourful seizure crap, don't use THAT!")
       end

       if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'timeout' then
                Remind("Go use ii's stupid admin for that.")
       end		
		
       if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'slock' then
	if blwl_an then
        	Chat("h \n\n\n Server is locked! \n\n\n");Regen()
	end
        slockenabled = true
	Remind("Turned on the serverlock!")
       end

       if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unslock' then
        slockenabled = false
	if blwl_an then
        	Chat("h \n\n\n Server is unlocked! \n\n\n")
	end
        Chat('unblind all')
        Chat('unpunish all')
	Remind("Turned off the serverlock!")
       end

       if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'newplrslock' then
          newplrautoslock = true
	  Remind("New player auto slock is now enabled!")
       end

       if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unnewplrslock' then
          newplrautoslock = false
	  Remind("New player auto slock is now disabled!")
       end

       if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'autoblvgc' then
                Remind("Auto blacklisting users using the VG!")
                autoblvgc = true
       end

       if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unautoblvgc' then
                Remind("No longer auto blacklisting users using the VG!")
                autoblvgc = false
       end

        if string.sub(msg, 1, #prefix + 7)  == prefix..'npslist' then
           Remind("Check your console by running /console!")
           for i = 1, #newplrslocked do
                  print(newplrslocked[i])
           end
        end

      if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'plrnewlen' then
                newlen = tonumber(string.sub(msg:lower(), #prefix + 11))
                Remind("Set age restrictions to "..newlen.." days!")
      end

      if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'pboombox' then
            Chat("gear me 212641536")
            task.wait(0.5)
            local check = string.sub(msg:lower(), #prefix + 10, #prefix + 10)
	    if check == "g" then
			local idrinkrum = string.sub(msg, #prefix + 11) ; task.wait(0)
			myplay = musictable[idrinkrum].id
	    else
			myplay = string.sub(msg:lower(), 10 + #prefix)
	    end
            repeat task.wait() until game.Players.LocalPlayer.Backpack:WaitForChild("SuperFlyGoldBoombox")
            local bom = game.Players.LocalPlayer.Backpack:FindFirstChild("SuperFlyGoldBoombox")
            bom.Parent = game.Players.LocalPlayer.Character                                   
            task.wait(0.25)
	    bom.Remote:FireServer("PlaySong", tonumber(myplay))
      end

      if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'mboombox' then
            Chat("gear me 212641536")
            task.wait(0.5)
            local check = string.sub(msg:lower(), #prefix + 10, #prefix + 10)
	    if check == "g" then
			local idrinkrum = string.sub(msg, #prefix + 11) ; task.wait(0)
			myplay = musictable[idrinkrum].id
	    else
			myplay = string.sub(msg:lower(), 10 + #prefix)
	    end
            repeat task.wait() until game.Players.LocalPlayer.Backpack:WaitForChild("SuperFlyGoldBoombox")
            local bom = game.Players.LocalPlayer.Backpack:FindFirstChild("SuperFlyGoldBoombox")
            bom.Parent = game.Players.LocalPlayer.Character                                   
            task.wait(0.25)
	    bom.Remote:FireServer("PlaySong", tonumber(myplay))
	    function rng() 
                	return math.random(-bgrange, bgrange)
            end
            bom.GripPos = Vector3.new(rng(), 1, rng())
      end

      if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'bgrange' then
		bgrange = tonumber(string.sub(msg:lower(), #prefix + 9))
      end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'diceroll' then
 	local args = string.split(msg, " ")
        if #args == 3 then
                local min = tonumber(args[2])
		local max = tonumber(args[3])
		local diroll = math.random(min, max)
		Remind("Dice roll: ".. diroll)
	else
		diroll = math.random(1, 6) -- USE DEFAULT
		Remind("Dice roll: ".. diroll)
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'coinflip' then
	if math.random(1, 2) == 1 then cflip = "Heads" else cflip =  "Tails" end
	Remind("Coin flip: "..cflip)
    end
		
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'lgmusic' then
        thevariablewastoomean = string.sub(msg, #prefix + 8)
        if workspace.Terrain["_Game"].Folder:FindFirstChild("localsound") then
                        lsound:Stop()
                        lsound:Destroy()
        end
        lsound = Instance.new("Sound", workspace.Terrain["_Game"].Folder)
        lsound.Name = "localsound"
        lsound.SoundId = "rbxassetid://"..musictable[thevariablewastoomean].id
        lsound:Play()
	Remind("Local gmusic playing.")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unlgmusic' then
              if workspace.Terrain["_Game"].Folder:FindFirstChild("localsound") then
                        lsound:Stop()
                        lsound:Destroy()
			Remind("Local gmusic ended.")
              end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'msay' then
        musicsay = true
	Remind("Gmusic will be announced.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unmsay' then
        musicsay = false
	Remind("Gmusic will no longer be announced.")
    end                

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'gmusic' then
        musicplay = string.sub(msg, #prefix + 7)
        if musicsay == true then
           Chat("h \n\n\n Playing music: ".. musictable[musicplay].name ..". \n\n\n")
        end
        if antimlog then
            Chat("music 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" .. musictable[musicplay].id)
        else
            Chat("music " .. musictable[musicplay].id)
        end;musicplay = tonumber(musicplay)
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'rgmusic' then
        local length = 0
        for _ in pairs(musictable) do
                    length = length + 1
        end
        local randomindex = math.random(1, length)
        local rizz = tostring(randomindex)
         if musicsay == true then
                    Chat("h \n\n\n Playing music: " .. musictable[rizz].name .. ". \n\n\n")
         end
         if antimlog then
                    Chat("music 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" .. musictable[rizz].id)
         else
                Chat("music " ..musictable[rizz].id)
         end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'nmusic' then -- if it double executes ... you
            if ratelj then print("anti double execution worked!") return end
            ratelj = true

            local length = 0
            for _ in pairs(musictable) do
                length = length + 1
            end

           if musicplay == nil or musicplay == length then
                        musicplay = 1
            else
                        musicplay = musicplay + 1
            end

            local mast = tostring(musicplay)

            if musicsay == true then
                Chat("h \n\n\n Playing music: " .. musictable[mast].name .. ". \n\n\n")
            end

            if antimlog then
                Chat("music 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" .. musictable[mast].id)
           else
                Chat("music " .. musictable[mast].id)
           end; ratelj = false
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'pmusic' then -- if it double executes ... you
            if ratelj then print("anti double execution worked!") return end
            ratelj = true

            local length = 0
            for _ in pairs(musictable) do
                length = length + 1
            end

           if musicplay == nil or musicplay == 1 then
                        musicplay = length
            else
                        musicplay = musicplay - 1
            end

            local mast = tostring(musicplay)

            if musicsay == true then
                Chat("h \n\n\n Playing music: " .. musictable[mast].name .. ". \n\n\n")
            end

            if antimlog then
                Chat("music 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" .. musictable[mast].id)
           else
                Chat("music " .. musictable[mast].id)
           end; ratelj = false
    end

    if string.sub(msg, 1, #prefix + 9)  == prefix..'musiclist' then
         Remind("Check your console by running /console!")
             local length = 0
             for _ in pairs(musictable) do
                length = length + 1
             end
         for i = 1, length do
                 q = tostring(i)
                  print("gmusic"..i.." - "..musictable[q].id.." - "..musictable[q].name)
         end
    end

  if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'theme' then		
		local themeNumber = tonumber(string.sub(msg:lower(), #prefix + 6))

		if themeNumber and themecode[tostring(themeNumber)] then
    			Chat("fix")
    			local codeParts = {}
    			for code in themecode[tostring(themeNumber)].code:gmatch("[^,]+") do
        			table.insert(codeParts, code)
    			end
    			for _, v in ipairs(codeParts) do
        			Chat(v)
    			end
		else
    			Remind("Invalid theme number. Please enter a number between 1 and 23.")
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'themelist' then
                Remind("Check your console by running /console!")
		for key, theme in pairs(themecode) do -- doesn't work properly :( tried using ipairs but errors
    			print(key .. " - " .. theme.name .. " - " .. theme.code)
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'gear' then
             local args = string.split(msg, " ")
             if #args >= 3 then
                local target = args[2]
                local gearName = table.concat(args, " ", 3)
                local gearIDs = gearlist[gearName].gearid 
                if type(gearIDs) == "table" then
                            for _, selectedGearID in ipairs(gearIDs) do
                                Chat("gear " .. target .. " " .. selectedGearID)
                            end
                else
                            Chat("gear " .. target .. " " .. gearIDs)
                end
         end
    end

    if string.sub(msg, 1, #prefix + 8)  == prefix..'gearlist' then
         Remind("Check your console by running /console!")
         local sgn = {}
         for gearname, _ in pairs(gearlist) do
                    table.insert(sgn, gearname)
         end
         table.sort(sgn)
         for _, gearname in ipairs(sgn) do
                     local gearid = gearlist[gearname].gearid
                     if type(gearid) == "table" then
                        gearid = table.concat(gearid, ", ")
                     end
                    print(gearname .. " - IDS: " .. gearid)
         end
    end

   if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'char' then
        local args = string.split(msg, " ")
        if #args >= 3 then
                    local target = args[2]
                    local charName = table.concat(args, " ", 3)
                    local china = charlist[charName].charid
                    Chat("char " .. target .. " " .. china)
        end
    end

    if string.sub(msg, 1, #prefix + 8)  == prefix..'charlist' then
         Remind("Check your console by running /console!")
         local sn = {}
         for charname, _ in pairs(charlist) do
                    table.insert(sn, charname)
         end
         table.sort(sn)
         for _, charname in ipairs(sn) do
                    print(charname .. " - IDS: " .. charlist[charname].charid)
         end
    end

   if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'turn' then
            local args = string.split(msg, " ")
            if #args >= 3 then
                local turner = args[3]
                local daturnings = turnlist[turner]
                if daturnings then
                            for i, code in ipairs(daturnings.name) do
                                    code = replaceArgs2(code, args[2])
                                    Chat(code)
                            end
                       else
                            Remind("Invalid turn (char) chosen.")
                end
            end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'pausem' then
       	for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Folder:GetDescendants()) do
                if v:IsA("Sound") and v.Playing then
                        v.Playing = false
                end
        end
       Remind("Paused the music!")
    end
		
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'playm' then
        for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Folder:GetDescendants()) do
                if v:IsA("Sound") and not v.Playing then
                        v.Playing = true
                end
        end
	      Remind("Playing the music!")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'stopm' then
        for i, v in pairs(game:GetService("Workspace").Terrain["_Game"].Folder:GetDescendants()) do
                if v:IsA("Sound") then
                    v:Stop()
                end
        end   
	Remind("Stopped the music!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'startm' then
        for i, v in pairs(game:GetService("Workspace").Terrain["_Game"].Folder:GetDescendants()) do
                if v:IsA("Sound") then
                    v:Play()
                end
        end   
        Remind("Started the music!")
    end
		
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'stops' then
        for i, v in pairs(game:GetDescendants()) do
                if v:IsA("Sound") then
                    v:Stop()
                end
        end   
	Remind("Stopped sounds!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'starts' then
        for i, v in pairs(game:GetDescendants()) do
                if v:IsA("Sound") then
                    v:Play()
                end
        end   
        Remind("Started sounds!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'deiv' then -- ported from simplekah
			gjdelock = false
                        Chat("h \n\n\n Domain Expansion: Infinity Void \n\n\n")
                        local deivfogend = 2000
                        local deivfog1 = 255
                        local deivfog2 = 255
                        local deivfog3 = 255
                        time = 7
                        for i = 1,100 do
                            task.wait(0.1)
                            deivfogend = deivfogend - 19
                            deivfog1 = deivfog1 - 2.55
                            deivfog2 = deivfog2 - 2.55
                            deivfog3 = deivfog3 - 2.55
                            time = time - 0.01
                            Chat("fogend " .. deivfogend)
                            Chat("fogcolor " .. deivfog1 .. " " .. deivfog2 .. " " .. deivfog3)
                            Chat("time " .. time)
			    if gjdelock == "stop" then
					return 
			    end
                        end
			if gjdelock ~= "stop" then
                        	gjdelock = true
                        	Chat("h \n\n\n You have entered my domain so please wait until I decide to close it... \n\n\n")
			end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'undeiv' then  -- ported from simplekah
                        Chat("fix")
                        Chat("reload all")
                        gjdelock = "stop"
			Remind("Turned off DEIV.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'tropics' then  -- ported from simplekah
                     local tropfogend = 0
                     local tropfogcolor = 0
                     local tropfogcolor2 = 0
                     local tropfogcolor3 = 200
                     local time = 10
                     Chat("h \n\n\n Red glow... \n\n\n")
                     Chat("fogcolor 200 0 0")
                     Chat("outdoorambient 0 0 0")
                     Chat("time " .. time)
                     for i = 1,10 do
                            task.wait(0.2)
                            tropfogend = tropfogend + 100
                            Chat("fogend " .. tropfogend)
                     end
                     Chat("h \n\n\n Blue glow... \n\n\n")
                     for i = 1,10 do
                            task.wait(0.3)
                            time = time - 0.4
                            Chat("time " .. time)
                            tropfogend = tropfogend - 50
                            Chat("fogend " .. tropfogend)
                            tropfogcolor = tropfogcolor + 20
                            Chat("fogcolor " .. "200 " .. "0 " .. tropfogcolor)
                     end
                     Chat("h \n\n\n Hollow purple! \n\n\n")
                        Chat("speed others inf")
                     for i = 1,10 do
                            task.wait(0.2)
                            tropfogcolor3 = tropfogcolor3 + 5.5
                            tropfogcolor = tropfogcolor + 5.5
                            tropfogcolor2 = tropfogcolor2 + 25.5
                            tropfogend = tropfogend + 150
                            time = time + 0.1
                            Chat("fogcolor " .. tropfogcolor3 .. " " .. tropfogcolor2 .. " " .. tropfogcolor)
                            Chat("fogend " .. tropfogend)
                            Chat("time " .. time)
                    end
                    Chat("fix")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'sclr' then -- super clr fix everything (ffix does everything to yourself)
                Chat("fix")
                Chat("clr")
                Chat("removeclones")
                Chat("removejails")
		Chat(prefix.."fixpaint")
		Chat("reload all")
		Remind("Cleaned the server.") 
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
                              Remind("Current music ID: "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.SoundId)
              end
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'cmusicid' then
              if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
				Remind("Copied the music id to your clipboard.")
                                local url = game:GetService("Workspace").Terrain["_Game"].Folder.Sound.SoundId
                                local number = url:match("id=(%d+)")
                                setclipboard(number)
              end
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'audiolog' then
		Loops.alog = true
		Remind("The audiolog will save to your workspace.")
   end

   if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unaudiolog' then
		Loops.alog = false
		Remind("Switched off the audiolog.")
   end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'cvol' then
              if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                              Remind("Current volume: "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.Volume)
              end        
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'timepos' then
              local tplace = tonumber(string.sub(msg:lower(), #prefix + 9))
              if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                        game:GetService("Workspace").Terrain["_Game"].Folder.Sound.TimePosition = tplace 
              end        
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'timeis' then
              if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                        Remind("Current time position: "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.TimePosition)
              end        
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'timedur' then
              if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                        Remind("Time length: "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.TimeLength)
              end        
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'timeps' then
              if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                        Remind("The playback speed is: "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.PlaybackSpeed)
              end        
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'timeplay' then
             newPlaybackSpeed = tonumber(string.sub(msg:lower(), #prefix + 10))
             local Sound = game:GetService("Workspace").Terrain["_Game"].Folder.Sound
             Sound.PlaybackSpeed = newPlaybackSpeed
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'audiolol' then
       audiotroll = true
	Remind("Listen to the audio now...")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unaudiolol' then
       audiotroll = false
	Remind("Stopped messing up the audio!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antimusic' then
       mymusiconly = false
       antimusic = true
	Remind("Anti music is on! Do 'pmu (NO ID AFTER IT!!)' if this command doesn't work well")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantimusic' then
       antimusic = false
	Remind("Turned anti music off!")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'pmu' then
	if not string.sub(msg:lower(), 1, #prefix + 4) == prefix..'pmu2' then
        	musicoff = false
        	mymusiconly = true
        	gottenmode = 2
        	mymusiconlyid = tonumber(string.sub(msg:lower(), #prefix + 5))
        	Remind("Perm music is on")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'2pmu' then
        if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                                local url = game:GetService("Workspace").Terrain["_Game"].Folder.Sound.SoundId
                                local number = url:match("id=(%d+)")
                                gottenmode = 1
                                musicoff = false
                                mymusiconly = true
                                mymusiconlyid = number
                                Remind("Perm music is on (set to current id)")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'bring' then
        bringu = (string.sub(msg:lower(), #prefix + 7))
        Bring()
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'goto' then
        gotou = (string.sub(msg:lower(), #prefix + 6))
        Goto()
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'song' then -- bit buggy if you stop the music but keep the playlist open
             local args = string.split(msg, " ")
             if #args == 2 then
                local shazam = args[2]
                Playlist(shazam)
		Remind("Playlist starting.")
         end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'ssong' then
                SkipEvent:Fire()
		Remind("Skipped song.")
    end
                
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'esong' then
                StopEvent:Fire()
		Remind("Ended playlist.")
    end
                
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'ggear' then
        local args = string.split(msg, " ")
        if #args >= 3 then
            local target = args[2]
            local gearName = table.concat(args, " ", 3)
            local keyword = game:GetService("HttpService"):UrlEncode(gearName)
            local GearsJSON = game:HttpGet("https://catalog.roblox.com/v1/search/items?category=All&includeNotForSale=true&keyword="..keyword.."&limit=120")
            local GearsDecoded = game:GetService("HttpService"):JSONDecode(GearsJSON)
            if GearsDecoded and GearsDecoded.data then
                for _,v in pairs(GearsDecoded.data) do
                --    print(v.id)
                    local Asset
                    local AssetOk, E = pcall(function() Asset = game:GetService("MarketplaceService"):GetProductInfo(v.id) end)
                    if AssetOk then
                        if Asset.AssetTypeId == Enum.AssetType.Gear.Value then
                            Chat("gear " .. target .. " " .. v.id)
                        end
                    end
                end
            end 
        else
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'gchar' then -- tech added this command to scv3-var :)
        local args = string.split(msg, " ")
        local target = args[2]
        local specialid = table.concat(args, " ", 3)
        local charpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local circus = game.Players:GetUserIdFromNameAsync(specialid)
        Chat("char " .. target .. " " .. circus);task.wait(0.5)
        if target == "me" then -- it tps you back to your old position if you state that you're the person to have the char done
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = charpos
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiabuse' then
        Remind("WIP")

    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiabuse' then
        Remind("WIP")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'bok' then
          bokme = (string.sub(msg:lower(), #prefix + 5))
          SuperCMD("dog "..bokme)
          task.wait(1)
          Chat("explode "..bokme)
	  Remind("Boked the player!")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'cgoto' then
           local dasplayer = string.sub(msg:lower(), #prefix + 7)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                gotou = cplr
                Goto2(gotou)
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'fixbp' then
	if not string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fixbp2' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                moveobject(game.Workspace.Terrain["_Game"].Workspace["Baseplate"], 2)
                repeat fwait() until movestatus == false
                GravFix()
                Chat("respawn me")
                ColFix()
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'movebp' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                moveobject(game.Workspace.Terrain["_Game"].Workspace["Baseplate"], 1)
                repeat fwait() until movestatus == false
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'spawnkill' then
                        moveObject(game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump9,CFrame.new(-41.0650024, 1.30000007, -28.601058959961, 0, 0, -1, 0, 1, 0, 1, 0, 0))
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'cagespawn' then
                    moveObject(game:GetService("Workspace").Terrain["_Game"].Workspace["Basic House"].SmoothBlockModel40,CFrame.new(-10.7921638, 17.3182983, -16.0743637, -0.999961913, -0.0085983118, 0.00151610479, -1.01120179e-08, 0.173648253, 0.98480773, -0.00873095356, 0.984770179, -0.173641637))
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fixpads2' then
        local adminPadCFrames = {CFrame.new(-40.7649879, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-36.7649803, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-32.7649765, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-20.7649632, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-44.7649994, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-12.7649641, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-28.7649689, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-16.7649612, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-24.764967, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)}
            for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren()) do
                moveObject(v.Head,adminPadCFrames[i]*CFrame.new(0,4,0))
                task.wait(0.25)
            end    
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'fixregen2' then
                    moveObject(game:GetService("Workspace").Terrain["_Game"].Admin.Regen,CFrame.new(-7.16500044, 5.42999268, 91.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0))
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fixbp2' then
                    moveObject(workspace.Terrain["_Game"].Workspace.Baseplate,CFrame.new(-501, 0.100000001, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'fcam' then
		local dasplayer = string.sub(msg:lower(), #prefix + 6)
                PLAYERCHECK(dasplayer)
                if player ~= nil then
                        FCAM(cplr, player)
			Remind("Freezing the person's camera...")
        
                else                        
                        Remind('Cannot find player with the name: '..dasplayer)
                end
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fixspawn' then
                if movestatus == true then 
                        return 
                end        
                DisCol()
                if Map:FindFirstChild("Spawn1") then
                        moveobject(Map:FindFirstChild("Spawn1"), 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                task.wait(1)
                if Map:FindFirstChild("Spawn2") then
                        moveobject(Map:FindFirstChild("Spawn2"), 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                task.wait(1)
                if Map:FindFirstChild("Spawn3") then
                        moveobject(Map:FindFirstChild("Spawn3"), 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'movespawn' then
                if movestatus == true then 
                        return 
                end        
                DisCol()
                if Map:FindFirstChild("Spawn1") then
                        moveobject(Map:FindFirstChild("Spawn1"), 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                task.wait(1)
                if Map:FindFirstChild("Spawn2") then
                        moveobject(Map:FindFirstChild("Spawn2"), 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                task.wait(1)
                if Map:FindFirstChild("Spawn3") then
                        moveobject(Map:FindFirstChild("Spawn3"), 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fixregen' then
	if not string.sub(msg:lower(), 1, #prefix + 9) == prefix..'fixregen2' then

                if movestatus == true then 
                        return 
                end
                DisCol()
                moveobject(Admin.Regen, 2)
                repeat fwait() until movestatus == false
                GravFix()
                Chat("respawn me")
                ColFix()
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'ivmove' then
			yeahthemover("yes")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'omove' then
			yeahthemover("no")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'moveregen' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                moveobject(Admin.Regen, 1)
                repeat fwait() until movestatus == false
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'saveregen' then
                Remind("Keep your regen co-ords safe!")
                adx, ady, adz = Admin.Regen.Position.X, Admin.Regen.Position.Y, Admin.Regen.Position.Z
                q = adx .. ady .. adz
                print(Admin.Regen.Position.X, Admin.Regen.Position.Y, Admin.Regen.Position.Z)
                setclipboard(q)
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'cusername' then
 		local dasplayer = string.sub(msg:lower(), #prefix + 11)
                PLAYERCHECK(dasplayer)
                if player ~= nil then
        		su = player
			setclipboard(su)
			Remind("Successfully copied the player's username to clipboard.")
                else                        
                        Remind('Cannot find player with the name: '..dasplayer)
                end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fixpads' then    
	if not string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fixpads2' then

                if movestatus == true then 
                        return 
                end        
                for i,v in pairs(Pads) do
                        if allclear() == false then break end
                        if v:FindFirstChildOfClass("Part") then
                                v:FindFirstChildOfClass("Part").Name = "Pad" .. tostring(i)
                        end
                end
                DisCol()
                for i,v in ipairs(Pads) do
                        if allclear() == false then break end
                        if v:FindFirstChildOfClass("Part") then
                                v:FindFirstChildOfClass("Part").CanCollide = true
                                moveobject(v:FindFirstChildOfClass("Part"), 2)
                                repeat fwait() until movestatus == false
                                Chat("respawn me")
                                v:FindFirstChildOfClass("Part").CanCollide = false
                        end
                end
                GravFix()
                Chat("respawn me")
                ColFix()
	end
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'movepads' then        
                if movestatus == true then 
                        return 
                end        
                DisCol()
                for i,v in ipairs(Pads) do
                        if allclear() == false then break end
                        if v:FindFirstChildOfClass("Part") then
                                v:FindFirstChildOfClass("Part").CanCollide = true
                                moveobject(v:FindFirstChildOfClass("Part"), 1)
                                repeat fwait() until movestatus == false
                                Chat("respawn me")
                                v:FindFirstChildOfClass("Part").CanCollide = false
                        end
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'fixfl' then        
                if movestatus == true then 
                        return 
                end        
                DisCol()
                if game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel38") then
                        moveobject(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel38"), 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                if game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel40") then
                        moveobject(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel40"), 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                if game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel112") then
                        moveobject(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel112"), 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'movefl' then        
                if movestatus == true then 
                        return 
                end        
                DisCol()
                if game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel38") then
                        moveobject(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel38"), 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                if game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel40") then
                        moveobject(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel40"), 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                if game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel112") then
                        moveobject(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel112"), 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fixobby' then
                Chat(prefix.."tnok")
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(workspace.Terrain._Game.Workspace["Obby Box"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Obby"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'moveobby' then
                Chat(prefix.."tnok")
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(workspace.Terrain._Game.Workspace["Obby Box"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Obby"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'fixkb' then
                Chat(prefix.."tnok")
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Obby"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'movekb' then
                Chat(prefix.."tnok")
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Obby"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fixobox' then
                Chat(prefix.."tnok")
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(workspace.Terrain._Game.Workspace["Obby Box"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'moveobox' then
                Chat(prefix.."tnok")
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(workspace.Terrain._Game.Workspace["Obby Box"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

  if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fixadv' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Admin Dividers"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

  if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'moveadv' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Admin Dividers"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

  if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fixhouse' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

  if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'movehouse' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

  if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'fixbb' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Building Bricks"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'movebb' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Building Bricks"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end        

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'toregen' then
        regentp()
	Remind("Teleported to the regen (if it's loaded)")
    end
	
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'rparts' then
	for i,v in pairs(workspace.Terrain["_Game"].Folder:GetChildren()) do
		if v:IsA("Part") and v.Name == "Part" then
			v:Destroy()
		end
	end
	Remind("Removed Persons parts")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'lrobb' then
         LocalObby("remove")
	 Remind("Removed the obby client-side")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'laobb' then
         LocalObby("add")
	 Remind("Added the obby client-side")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'findregen' then -- i know it sucks but perm exists lol
	if not string.sub(msg:lower(), 1, #prefix + 10) == prefix..'findregen2' then
		failsafe3 = false
        	regenfind = true
		task.wait(0)
		findregen()
		Remind("Finding the regen (skydived)")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'nofindregen' then
	if not string.sub(msg:lower(), 1, #prefix + 12) == prefix..'nofindregen2' then
		failsafe3 = true
        	regenfind = false
		Remind("Stopped the regen (skydived)")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unfindregen' then
	if not string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unfindregen2' then
		failsafe3 = true
        	regenfind = false
		Remind("Stopped the regen (skydived)")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'findregen' then -- i know it sucks but perm exists lol
        failsafe3 = false
	regenfind2 = true
	task.wait(0)
	findregen2()
	Remind("Finding the regen (KL/CMD-Y)")
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'nofindregen2' then
	failsafe3 = true
        regenfind2 = false
	Remind("Stopped the regen (KL/CMD-Y)")
    end
		
    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unfindregen2' then
	failsafe3 = true
        regenfind2 = false
	Remind("Stopped the regen (KL/CMD-Y)")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'leakedreg' then -- i know it sucks but perm exists lol
        leakedcords()
	Remind("Checking leaked coords for the regen!")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'unpmu' then
        mymusiconly = false
        musicoff = true
        Chat("stopmusic")
        Remind("Perm music is off")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'offmusic' then
        musicoff = true
        Chat("stopmusic")
	Remind("Perm music is now paused.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'onmusic' then
        musicoff = false
	Remind("Perm music is no longer paused.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'remusic' then
               Chat(prefix.."startm")
     end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'equipall' then
                local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
                for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
                end
		Remind("Equipped all items in your inventory!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'actall' then
                local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
                for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
                             v:Activate()
                end
		Remind("Activated all items in your inventory!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'invall' then
                local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
                local Character = game.Players.LocalPlayer.Character
                for _, v in ipairs(Character:GetChildren()) do
                         if v:IsA("Tool") then
                                    v.Parent = Backpack
                         end
                end
		Remind("Unequipped all items in your inventory!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'dropall' then
                local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
                local Character = game.Players.LocalPlayer.Character
                for _, v in ipairs(Character:GetChildren()) do
                         if v:IsA("Tool") then
                                    v.Parent = Backpack
                         end                
                end
                for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = workspace
                end
		Remind("Dropped all items in your inventory!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'vgcrash' then
	if skipwarncrash then -- idea from sinx
		VGCrash()
		Remind("VG Crashed the server.")
	else
		local response = Instance.new("BindableFunction")
		function response.OnInvoke(answer)
			if answer == "Yes" then
		    		VGCrash()
				Remind("VG Crashed the server.")
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "KohlsLite Manager",
			Text = "Are you sure about this?",
			Duration = math.huge,
			Callback = response,
			Button1 = "Yes",
			Button2 = "No"
		})
	end
    end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'cocrash' then
	if skipwarncrash then -- idea from sinx
		CoCrash()
		Remind("VG Crashed (2) the server.")
	else
		local response = Instance.new("BindableFunction")
		function response.OnInvoke(answer)
			if answer == "Yes" then
		    		CoCrash()
				Remind("VG Crashed (2) the server.")
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "KohlsLite Manager",
			Text = "Are you sure about this?",
			Duration = math.huge,
			Callback = response,
			Button1 = "Yes",
			Button2 = "No"
		})
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'emcrash' then
	if skipwarncrash then -- idea from sinx
		EmCrash()
		Remind("Emerald Crashed the server.")
	else
		local response = Instance.new("BindableFunction")
		function response.OnInvoke(answer)
			if answer == "Yes" then
		    		EmCrash()
				Remind("Emerald Crashed the server.")
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "KohlsLite Manager",
			Text = "Are you sure about this?",
			Duration = math.huge,
			Callback = response,
			Button1 = "Yes",
			Button2 = "No"
		})
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'pcrash' then
	if skipwarncrash then -- idea from sinx
		PCrash()
		Remind("Orinthian Crashed the server.")
	else
		local response = Instance.new("BindableFunction")
		function response.OnInvoke(answer)
			if answer == "Yes" then
		    		PCrash()
				Remind("Orinthian Crashed the server.")
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "KohlsLite Manager",
			Text = "Are you sure about this?",
			Duration = math.huge,
			Callback = response,
			Button1 = "Yes",
			Button2 = "No"
		})
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fcrash' then
	if skipwarncrash then -- idea from sinx
		FCrash()
		Remind("Freeeze Crashed the server.")
	else
		local response = Instance.new("BindableFunction")
		function response.OnInvoke(answer)
			if answer == "Yes" then
		    		FCrash()
				Remind("Freeze Crashed the server.")
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "KohlsLite Manager",
			Text = "Are you sure about this?",
			Duration = math.huge,
			Callback = response,
			Button1 = "Yes",
			Button2 = "No"
		})
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'dcrash' then
	if skipwarncrash then -- idea from sinx
		DCrash()
		Remind("Dog Crashed the server.")
	else
		local response = Instance.new("BindableFunction")
		function response.OnInvoke(answer)
			if answer == "Yes" then
		    		DCrash()
				Remind("Dog Crashed the server.")
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "KohlsLite Manager",
			Text = "Are you sure about this?",
			Duration = math.huge,
			Callback = response,
			Button1 = "Yes",
			Button2 = "No"
		})
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'scrash' then -- not a silent crash!
        if haspersons == false then
Remind([[Sorry, you don't have Person's to perform this command!
Commands required: shield]])
        else
		if skipwarncrash then -- idea from sinx
			SCrash()
			Remind("Shield Crashed the server.")
		else
			local response = Instance.new("BindableFunction")
			function response.OnInvoke(answer)
				if answer == "Yes" then
		    			SCrash()
					Remind("Shield Crashed the server.")
				end
			end
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "KohlsLite Manager",
				Text = "Are you sure about this?",
				Duration = math.huge,
				Callback = response,
				Button1 = "Yes",
				Button2 = "No"
			})
		end
        end
    end

   if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'swc' then
			skipwarncrash = true
			Remind("Warning for crashing disabled.")
   end

   if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'unswc' then
			skipwarncrash = false
			Remind("A warning will now appear whenever you want to crash.")
   end
		
   if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'rkick' then
        if haspersons == false then
Remind([[Sorry, you don't have Person's to perform this command!
Commands required: rocket]])
        else
                local dasplayer = string.sub(msg:lower(), #prefix + 7)
                   PLAYERCHECK(dasplayer)
                   if player ~= nil and not table.find(nokick, player) then
                        rkickplr(cplr,player)
                        Remind("Rocket kicking "..player)
                elseif table.find(nokick, player) then
                        Remind("Sorry, this player cannot be kicked!")
                else                        
                        Remind('Cannot find player with the name: '..dasplayer)
                   end
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unrkick' then
		if haspersons == false then
Remind([[Sorry, you don't have Person's to perform this command!
Commands required: rocket]])
return
		end
		if rkicking then
			rkicking = false
			Remind("Stopped rocket kicking player")
		end
		Chat("unrocket/all/all/all")
		Chat("respawn me "..player)
		Chat("removejails")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'seedkick' then 
		Remind("This kick was found by Digitality.") 
		local dasplayer = string.sub(msg:lower(), #prefix + 10)
                PLAYERCHECK(dasplayer)
	
                if player ~= nil and not table.find(nokick, player) then
			kickin = cplr
			kickinplr = player
                        Remind("Kicking "..player)
                elseif table.find(nokick, player) then
                        return Remind("Sorry, this player cannot be kicked!")
                else                        
                        return Remind('Cannot find player with the name: '..dasplayer)
                end
	
		Chat("speed "..kickinplr.." 0")
		task.wait()
		game.Players.LocalPlayer.Character:PivotTo(kickin.Character:GetPivot())
		task.wait(.3)
                local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
                for _, v in ipairs(Backpack:GetChildren()) do
			if v.Name == "BitePlant" then 
				v.Parent = game.Players.LocalPlayer.Character
				task.wait(0)
				v:Activate() 
			end
		end 
		Chat("punish me")
		task.wait(.5)
		Chat("unpunish me")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'meshkick' then  -- mesh kick haha
		dzjecraft = false
		local dasplayer = string.sub(msg:lower(), #prefix + 10)
                PLAYERCHECK(dasplayer)
	
                if player ~= nil and not table.find(nokick, player) then
			kickin = cplr
			kickinplr = player
                        Remind("Kicking "..player)
			hatkick(kickin, kickinplr)
                elseif table.find(nokick, player) then
                        return Remind("Sorry, this player cannot be kicked!")
                else                        
                        return Remind('Cannot find player with the name: '..dasplayer)
                end
	
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unmeshkick' then 
	dzjecraft = true
	Remind("Ended mesh-kick")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'hatkick' then  -- hat kick haha
		dzjecraft = false
		local dasplayer = string.sub(msg:lower(), #prefix + 9)
                PLAYERCHECK(dasplayer)
	
                if player ~= nil and not table.find(nokick, player) then
			kickin = cplr
			kickinplr = player
                        Remind("Kicking "..player)
			hatkick(kickin, kickinplr)
                elseif table.find(nokick, player) then
                        return Remind("Sorry, this player cannot be kicked!")
                else                        
                        return Remind('Cannot find player with the name: '..dasplayer)
                end
	
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unhatkick' then 
	dzjecraft = true
	Remind("Ended hat-kick")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'techkick' then  -- tech kick
		local dasplayer = string.sub(msg:lower(), #prefix + 10)
                PLAYERCHECK(dasplayer)
	
                if player ~= nil and not table.find(nokick, player) then
			kickin = cplr
			kickinplr = player
                        Remind("Kicking "..player)
			techkick(kickin, kickinplr)
                elseif table.find(nokick, player) then
                        return Remind("Sorry, this player cannot be kicked!")
                else                        
                        return Remind('Cannot find player with the name: '..dasplayer)
                end
	
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antimesh' then 
		antimesh = true
		Remind("Anti mesh/hat kick enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantimesh' then 
		antimesh = false
		Remind("Anti mesh/hat kick disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antihat' then 
		antimesh = true
		Remind("Anti mesh/hat kick enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantihat' then 
		antimesh = false
		Remind("Anti mesh/hat kick disabled.")

    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'welmsg' then
        welcomemsg = true
	Remind("The welcome/leaving message has been enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unwelmsg' then
        welcomemsg = false
	Remind("The welcome/leaving message has been disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antian' then
        crash_an = true
	Remind("Antis are announced when triggered.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantian' then
        crash_an = false
	Remind("Antis are no announced when triggered.")
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'clickexplode' then
        clickexplode = true
	Remind("Click a player and they'll explode!")
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'unclickexplode' then
        clickexplode = false
	Remind("Players will no longer explode when you click them, phew!")
    end

  if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'cakeday' then
                local args = string.split(msg, " ")
		if #args == 2 then
                	local caketar = args[2]
			PLAYERCHECK(caketar)
         		if player ~= nil then
                  		caketarsuccess = player
				Chat("h \n\n\n Happy birthday, ".. caketarsuccess .."! \n\n\n")
         		else
                		Remind('Cannot find player with the name: '..caketar)
         		end
		else
				
			local atprogcakeday = "08/23" -- atprog's birthday
			local spcakeday = "04/28" -- 

			local ctime = os.date("%m/%d")

			if ctime == atprogcakeday then			
				Chat("h \n\n\n Happy birthday, atprog! \n\n\n")
				Speak("Happy birthday, atprog!")
			elseif ctime == spcakeday then
				Chat("h \n\n\n Happy birthday, s_p! \n\n\n")
				Speak("Happy birthday, s_p!")
			else
				Remind("It is not atprog's/s_p's birthday today. If it is someone else's birthday in the server, provide the second argument.")
			end
		end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'control' then -- really funny ngl (scv1)
                local dogman = string.sub(msg:lower(), #prefix + 9)
                Chat("speed "..dogman.." 0")
                Chat("dog me "..dogman)
                Chat("tp me "..dogman)
                task.wait(1)
                Chat("punish me "..dogman)
                Chat("undog me "..dogman)
                task.wait(0.25)
                Chat("unpunish me "..dogman)
                Chat("invis me")
                Remind("You should be attached to the player!")
    end

		-- broken command
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'ncontrol' then -- really funny ngl (cmdpi)
        	local dasplayer = string.sub(msg:lower(), #prefix + 10)
                PLAYERCHECK(dasplayer)
                if player ~= nil then
			Chat('size me nan')
			Chat('invis me')
			Chat('stun ' .. player)
	 		Mover:pingWait() 
			Mover:Attach(cplr.Character.Torso)
            		Chat('size me nan')
                        Remind("Attaching to "..player)
                else                        
                        Remind('Cannot find player with the name: '..dasplayer)
                end
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'iceblock' then -- pr script
                local theblock = string.sub(msg:lower(), #prefix + 10)
                if theblock == "me" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,-40,0)
                end
                task.wait(0.25)
                  Chat("invisible "..theblock); task.wait()
                    Chat("freeze "..theblock);task.wait()
                Chat("size "..theblock.." 10");task.wait()
                Chat("clone "..theblock);task.wait()
                Chat("respawn "..theblock)
		Remind("Created a big ice block!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'glitch' then -- noobsploit
		local dosd = string.sub(msg:lower(), #prefix + 8)
		Chat("gear me 71037101")
 		repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("DaggerOfShatteredDimensions")
        	dagg = game.Players.LocalPlayer.Backpack:FindFirstChild("DaggerOfShatteredDimensions")
        	task.wait()
        	dagg.Parent = game.Players.LocalPlayer.Character
		task.wait()
		Chat("god "..dosd)
		Chat("tp "..dosd.." me")
		game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.Q,false,game)
		task.wait(2)
		Chat("reset me")
    end
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'headrise' then -- jotunnheim
		local hrise = string.sub(msg:lower(), #prefix + 10)	
		Chat("size " .. hrise .. " .3")
                Chat("bighead " .. hrise);task.wait()
                Chat("size " .. hrise .. " 10");task.wait()
                Chat("thaw " .. hrise);task.wait()
                Chat("unsize " .. hrise)
		Remind("Headrised player.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'headroot' then -- jotunnheim
		local hroot = string.sub(msg:lower(), #prefix + 10)	
		Chat("size " .. hroot .. " 10");task.wait()
                Chat("freeze " .. hroot);task.wait()
                Chat("bighead " .. hroot);task.wait()
                Chat("size " .. hroot .. " .3");task.wait()
                Chat("thaw " .. hroot);task.wait()
                Chat("unsize " .. hroot)
		Remind("Headrooted player.")
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'skybox' then -- jotunnheim
		local skbox = string.sub(msg:lower(), #prefix + 8)	
		Chat("size " .. skbox .. " .3")
                Chat("freeze " .. skbox)
                Chat("size " .. skbox .. " 10")
                Chat("goldify " .. skbox)
                Chat("clone " .. skbox)
                Chat("reset " .. skbox)
		Remind("Skyboxed player.")
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'amputate' then -- jotunnheim
		local amp = string.sub(msg:lower(), #prefix + 10)	
		Chat("size " .. amp .. " 10")
                task.wait(.3)
                Chat("freeze " .. amp)
                task.wait(.3)
                Chat("trip " .. amp)
                task.wait(.3)
                Chat("unsize " .. amp)
                task.wait(.3)
                Chat("paint " .. amp .. " red")
		Remind("Amputated player.")
    end
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'icetower' then -- jotunnheim
		local icet = string.sub(msg:lower(), #prefix + 10)
		for i = 1, 30 do
                    Chat("size " .. icet .. " .6")
                    Chat("seizure " .. icet)
                    Chat("freeze " .. icet)
                    Chat("unsize " .. icet)
                end
    end
				
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'coconut' then -- noobsploit
		local coco = string.sub(msg:lower(), #prefix + 9)
		Chat("char "..coco.." 5")
		Chat("paint "..coco.." brown")
		for i = 1, 5 do
			Chat("size "..coco.." .3")
		end
		Chat("unsize "..coco)
		Chat("size "..coco.." 2")
		task.wait(0.3)
		Chat("paint "..coco.." brown")
		Remind("The player should now be a coconut!")
    end
		
    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'cube' then -- cmdv3/pi
                local imacube = string.sub(msg:lower(), #prefix + 6)
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
                Remind("The player should now be a cube!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'tank' then -- thomas the tank engine - from yt video
                local thomas = string.sub(msg:lower(), #prefix + 6)
		Chat("removelimbs "..thomas);task.wait(0.5)
		Chat("dog "..thomas);task.wait(0.5)
		Chat("creeper "..thomas)
                Remind("The player should now be a tank!")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'ufo' then -- ufo!!! scv1
                local ufo = string.sub(msg:lower(), #prefix + 5)
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
                Remind("The player should now be a ufo!")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'rat' then -- scv1
	        local eww = string.sub(msg:lower(), #prefix + 5)
		Chat("char "..eww.." 6")
		task.wait(1)
		Chat("hat "..eww.." 6203125039")
		Chat("size "..eww.." 0.8")
		Chat("speed "..eww.." 26")
		Remind("Turned player into a rat, yuck!")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'titan' then -- yeah im adding scv1 cmds lol
	        local thatanime = string.sub(msg:lower(), #prefix + 7)
		Chat("char "..thatanime.." 4")
		task.wait(1)
		Chat("skydive "..thatanime)
		Chat("paint "..thatanime.." red")
		Chat("size "..thatanime.." 5")
		Chat("speed "..thatanime.." 24")
		Chat("pants "..thatanime.." 1187508947")
		Remind("Turned player into a titan!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'speaker' then -- yeah im adding scv1 cmds lol
	        local spek = string.sub(msg:lower(), #prefix + 9)
		Chat("char "..spek.." 1702851506")
		task.wait(1.2)
		Chat("skydive "..spek.."")
		task.wait(.35)
		Chat("size "..spek.." 0.3")
		Chat("size "..spek.." 0.3")
		Chat("creeper "..spek.."")
		Chat("paint "..spek.." black")
		Chat("size "..spek.." 10")
		Chat("size "..spek.." 5")
		Chat("speed "..spek.." 32")
		task.wait(0.5)
		Chat("paint "..spek.." black")
		Remind("Turned player into a speaker!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'dogrock' then -- noobsploit/shazam
		local drock = string.sub(msg:lower(), #prefix + 9)
		Chat("dog "..drock)
		task.wait(0.25)
		Chat("size "..drock.." 0.3")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'rdogrock' then -- noobsploit/shazam
		local drock = string.sub(msg:lower(), #prefix + 10)
		Chat("trail "..drock.." rainbow")
		Chat("dog "..drock)
		task.wait(0.25)
		Chat("size "..drock.." 0.3")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'taxi' then -- kohlsnoob
	        local target = string.sub(msg:lower(), #prefix + 6)
		Chat("dog "..target)
		Chat("paint "..target.." gold")
		Chat("speed "..target.." 100")
		Chat("trail "..target.." gold")
		Chat("god "..target)
		Chat("unhat "..target)
		Remind("Turned player into a taxi!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'smoothie' then -- kohlsnoob
	        local daddyhelpmee = string.sub(msg:lower(), #prefix + 10)
		Chat("jail "..daddyhelpmee)
		Chat("stun "..daddyhelpmee)
		Chat("spin "..daddyhelpmee)
		Chat("fire "..daddyhelpmee)
		Remind("Blendered the player!")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'tnt' then -- sHaZam!
	        local iduckingexplodedinmypants = string.sub(msg:lower(), #prefix + 5)
		Chat("removepants "..iduckingexplodedinmypants)
		Chat("removeshirt "..iduckingexplodedinmypants)
		Chat("paint "..player.." red")
		task.wait(1)
		Chat("bonfire "..iduckingexplodedinmypants)
		task.wait(2)
		Chat("explode "..iduckingexplodedinmypants)
		Remind("KABLAM!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'headfloat' then -- yeah im adding scv1 cmds lol
	        local hf = string.sub(msg:lower(), #prefix + 11)
		Chat("size "..hf.." 0.5")
		task.wait(0.25)
		Chat("bighead "..hf)
		task.wait(0.25)
		Chat("unsize "..hf)
	        Remind("The player's head should now be floating!")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'space' then -- kohls true anti kill
		if haspersons == false then
Remind([[Sorry, you don't have Person's to perform this command!
Commands required: rocket]])
return
		end
                local person = string.sub(msg:lower(), #prefix + 7)
                Chat("h \n\n\n Guys, we've finally done it! \n\n\n");task.wait(4)
                Chat("h \n\n\n We're sending someone to space! \n\n\n");task.wait(4)
                Chat("h \n\n\n Are we ready? Hopefully our volunteer is too! Here we go! \n\n\n")
                Chat("time 0")
                Chat("rocket/" ..person) -- if they jump then i don't care ngl
                Chat("jail "..person) -- ok maybe i do care
                Chat("spin " ..person);task.wait(4)
                Chat("h \n\n\n LIFT OFF! \n\n\n")
                Chat("unjail "..person)
                Chat("jump " ..person);task.wait(2)
                Chat("explode " ..person);task.wait(2)
                Chat("reload "..person)
                Chat("blind others")
                Chat("h \n\n\n No one saw that, right? \n\n\n");task.wait(4)
                Chat("unblind others")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'tripin' then -- pr
                local person = string.sub(msg:lower(), #prefix + 8)
                Chat("h \n\n\n WOAH, LOOK OVER THERE! THAT GUY'S ASCENDING! \n\n\n")
                Chat("music 9061674082")
                Chat("setgrav "..person.." -256")
                Chat("trip "..person)
                task.wait(0.4)
                Chat("trip "..person)
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'ascend' then -- kohlsnoob
                local person = string.sub(msg:lower(), #prefix + 8)
		Chat("h \n\n\n and they go \n\n\n")
		chat("unfly "..person)
		chat("setgrav "..person.." -270")
		chat("stun "..person)
		chat("glow "..person.." 0 0 255")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'bed' then -- noobsploit techno
                local person = string.sub(msg:lower(), #prefix + 5)
                Chat("size "..person.." nan");task.wait()
                Chat("dog "..person.."");task.wait(.2)
                Chat("size "..person.." 2.60");task.wait()
                Chat("paint "..person.." white");task.wait()
                Chat("removelimbs "..person);task.wait(.2)
                Chat("speed "..person.." 24")
                Chat("paint "..person.." white")
                Remind("The player should now be a bed!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'kitten' then -- nak3d would get tagged, inspired by simplekah
                local meow = string.sub(msg:lower(), #prefix + 8)
                PLAYERCHECK(meow)
                if player ~= nil then
                         kit = cplr
                         if kit and kit.Character and kit.Character.Head then
                                    Chat("paint "..kit.Name.." "..kit.Character.Head.BrickColor.Name)
				    Remind("Painted the player to be nak3d!")
                         end
                 else
                        Remind('Cannot find player with the name: '..meow)
                 end
    end

   if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'smack' then -- pr
                local person = string.sub(msg:lower(), #prefix + 7)
                Chat("music 5886215922")
                Chat("speed "..person.." 0")
                Chat("tp "..person.." me")
                task.wait(0.8)
                Speak("SMACK!")
                Chat("/e point")
                Chat("fling "..person)
                task.wait(1.45)
                Chat("explode "..person)
                Chat("music nan")
    end

   if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'dumb' then -- pr
                local dum = string.sub(msg:lower(), #prefix + 6)
                PLAYERCHECK(dum)        
                if player ~= nil then
                        dummy = player
                        idum = cplr
                        DumbGuy()
                else
                        Remind('Cannot find player with the name: '..dum)
                end

    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'bend' then -- pr/cxodek script
		if haspersons == false then
Remind([[Sorry, you don't have Person's to perform this command!
Commands required: rocket]])
return
		end
		if bending then return 
		else
			bending = true
                	local bendin = string.sub(msg:lower(), #prefix + 6)
                	Chat("rocket/"..bendin);task.wait(.5)
                	Chat("freeze "..bendin)
                	Chat("unrocket/"..bendin);task.wait(.34)
                	Chat("name "..bendin.." "..bendin);task.wait(.34)
                	Chat("thaw "..bendin);task.wait(.34)
                	Chat("unseizure "..bendin)
                	Chat("tp "..bendin.." "..bendin)
                	Chat("sit "..bendin)
			Remind("The player should be ready... for uhhhh")
			bending = false
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'ruin' then -- pr/vitalux script
                local rrrr = string.sub(msg:lower(), #prefix + 6)
		Chat("unpunish "..rrrr);task.wait()
	--	Chat("invis "..rrrr)
		Chat("reset "..rrrr)
	--	Chat("invis "..rrrr)
		Chat("kill "..rrrr)
		Chat("trip "..rrrr)
		Chat("setgrav "..rrrr.." -inf");task.wait(.1)
	--	Chat("invis "..rrrr)
		Chat("unpunish "..rrrr.." "..rrrr.." "..rrrr);task.wait(.2)
	--	Chat("invis "..rrrr)task.wait(.2)
		Chat("reset "..rrrr);task.wait(.15)
		Chat("punish "..rrrr.." "..rrrr.." "..rrrr)
		Remind("Broke/glitched the player.")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'fspin' then -- kohlsnoob
                local target = string.sub(msg:lower(), #prefix + 7)
		Chat("unfly "..target)
		Chat("nograv "..target)
		Chat("stun "..target)
		Chat("spin "..target)
		Remind("Float spinned the player.")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'yeet' then -- kohlsnoob
                local yeetusmcgleetus = string.sub(msg:lower(), #prefix + 6)
		Chat("sit "..yeetusmcgleetus)
		Chat("nograv "..yeetusmcgleetus)
		Chat("ff "..yeetusmcgleetus)
		for i = 1, 5 do
			chat("explode "..yeetusmcgleetus)
		end
		Remind("Your victim has been to who knows where")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'creeper' then -- kohlsnoob
		local pearlharbour = string.sub(msg:lower(), #prefix + 9)
		Chat("h \n\n\n UH OH, IS THAT A CREEPER? RUN!!! \n\n\n")
		Chat("unff "..pearlharbour)
		chat("removehats "..pearlharbour)
		chat("creeper "..pearlharbour)
		local woahwoahwoah = "red"
		task.wait(1)
		local e = nil
		for i = 1,20 do
			chat("paint "..pearlharbour.." "..woahwoahwoah)
			if woahwoahwoah == "red" then 
				woahwoahwoah = "green"
			else
				woahwoahwoah = "red"
			end
			if i < 11 then
				task.wait(((10-i) *.1) + (i * .005))
				if i == 10 then
					e = ((10-i) *.1) + (i*.005)
				end
			else
				task.wait(e)
			end
		end
		task.wait()
		chat("explode "..pearlharbour)
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'gbreak' then -- pr script
		local golding = string.sub(msg:lower(), #prefix + 8)
		Chat("freeze " .. golding)
                for i = 1, 100 do
                    Chat("dog " .. golding)
                end
                task.wait(.4)
                for i = 1, 100 do
                    Chat("dog " .. golding)
                end
                task.wait(.1)
                Chat("goldify " .. golding)
                task.wait(.2)
                Chat("thaw " .. golding)
                task.wait(.2)
                Chat("explode " .. golding)
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antidisco' then
        antidisco = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantidisco' then
        antidisco = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiflash' then
        antiflash = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiflash' then
        antiflash = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antifogend' then
        antifogend = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantifogend' then
        antifogend = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antiilight' then
        antiilight = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantiilight' then
        antiilight = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'antifogstart' then
        antifogstart = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'unantifogstart' then
        antifogstart = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antifogc' then
        antifogcolor = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantifogc' then
        antifogcolor = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antitime' then
        antitime = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantitime' then
        antitime = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antiamb' then
        antiambient = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantiamb' then
        antiambient = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antitrip' then
        antitripmine = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantitrip' then
        antitripmine = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antiegg' then
        antiegg = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantiegg' then
        antiegg = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiplant' then
	antiplant = true
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiplant' then
	antiplant = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antibright' then
        antibrightness = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantibright' then
        antibrightness = false
	Remind("Disabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antioutamb' then
        antioutamb = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantioutamb' then
        antioutamb = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'adv' then
       ADVERTISEMENT()
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'cadv' then
       CADVERTISEMENT()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'ipboom' then
	diy = string.sub(msg:lower(), #prefix + 8)
	if diy == "true" then
		dontincludeyou = true
	else
		dontincludeyou = false
	end
        IPBOOM(dontincludeyou)
	Remind("!!! REAL !!!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'logspam' then
       LogSpam()
       Remind("Logs have been spammed!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'logtrap' then -- scv1
        LogTrap()
	Remind("Don't do 'logs'...")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'logmode' then
        lmode = string.sub(msg:lower(), #prefix + 9)
	if lmode == "default" then
		logmode = "default"
	elseif lmode == "crack" then
		logmode = "crack"
	else
		Remind("Log mode must be default or crack.")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'persons' then
		haspersons = true
		Remind("Manually set - persons true.")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unpersons' then
		haspersons = false
		Remind("Manually set - persons false.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'peadmin' then
		hasperm = true
		Remind("Manually set - perm true.")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unpeadmin' then
		hasperm = false
		Remind("Manually set - perm false.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'tptool' then
        InitTool()
        Remind("You should have been given a TP tool now!")
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'supercmd' then
        supermessage = string.sub(msg, #prefix + 10)
        SuperCMD(supermessage)
	Remind("Supercmding your message...")
    end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'supert' then
        amon = tonumber(string.sub(msg:lower(), #prefix + 8))
        Remind("Supercmd amount has been modified.")
    end

   if string.sub(msg, 1, #prefix + 5) == prefix..'spamt' then
        spamtext = string.sub(msg, #prefix + 7)
        spam = true
        spamon = true
        Remind("Spamming the requested text!")
    end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unspamt' then
        spam = false
        spamon = false
        Remind("Stopped spamming the requested text!")
    end

   if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'chatz' then
        ChatFudge()
	Remind("Crapping on the chat filter.")
   end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'spamw' then
        spamwait = tonumber(string.sub(msg:lower(), #prefix + 7))
        Remind("Spam wait has been modified!")
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'spamwait' then
        spamwait = tonumber(string.sub(msg:lower(), #prefix + 10))
        Remind("Spam wait has been modified!")
    end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'spamoff' then
        spamon = false
	Remind("Spamming has been paused.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'spamon' then
        spamon = true
	Remind("Spamming has been resumed.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'cbtools' then
                local cbt = string.sub(msg:lower(), #prefix + 9)
                if cbt ~= "" then
                                Chat("gear " .. cbt .. " 16200204")
                                Chat("gear " .. cbt .. " 16200402")
                                Chat("gear " .. cbt .. " 16969792")
                                Chat("gear " .. cbt .. " 73089190")
                else
                                Chat("gear me 16200204")                                        
                                Chat("gear me 16200402")
                                Chat("gear me 16969792")                                        
                                Chat("gear me 73089190")
                end
		Remind("Client btools given.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'ecrash' then
        	Chat("fix") -- ;Chat(prefix.."perm2")
        	musicsay = false
        	-- task.wait(0.5)
		-- Chat(prefix.."unantimsg")
            	Chat("h \n\n\n Error occured. Please join a different server. \n\n\n")
		Chat(prefix.."gmusic84")
		--  Chat(prefix.."byp ")
           	Chat("fogcolor 0 0 0")
		Chat("time 0")
		Chat("fogend 0")
		Chat("paint all black")
            	task.wait(1.5)
		skipwarncrash = true
            	DCrash()        
    end
  
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'dicrash' then
		musicsay = false
        	Chat(prefix.."gchar all D_ionte")
		Chat(prefix.."gmusic62")
		Chat("h \n\n\n all praise dionte \n\n\n")
		Chat("name all Dionte is our hero!")
		task.wait(1.5)
		skipwarncrash = true
		DCrash()
    end
  
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'fredcrash' then
		musicsay = false 
		Chat(prefix.."gchar all FR6DDiie")
		Chat(prefix.."gmusic41")
		Chat("h \n\n\n all praise fred \n\n\n")
		Chat("name all Fred is our hero!") 
		task.wait(1.5)
		skipwarncrash = true
		DCrash()
    end

  
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'chcrash' then
 		local args = string.split(msg, " ")
        	local specialid = args[2]
		if #args >= 2 then
        		mehcrashchariz = game.Players:GetUserIdFromNameAsync(specialid)
		else
			local myusername = game.Players.LocalPlayer.Name
			mehcrashchariz = game.Players:GetUserIdFromNameAsync(myusername) 
		end
			
        	Chat("char all " .. mehcrashchariz)
		task.wait(1.5)
		skipwarncrash = true
		DCrash()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'rockmap' then
        StoneMap()
        Remind("Wait around 10 seconds for the effect to be permanent.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'stonemap' then
        StoneMap()
        Remind("Wait around 10 seconds for the effect to be permanent.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'hammer' then
        SpHammer()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'platform' then
		if Loops.platform then 
			return Remind("You already have a platform!")
		else
			Remind("Setting a platform up...")
	        	Loops.platform = true
			Platform()
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'noplatform' then
		Remind("Removing the platform...")
		Loops.platform = false  
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'float' then
		Remind("Adding the platform...")
		float()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unfloat' then
		Remind("Removing the platform...")
		unfloat()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'icemap' then
		if IsOnMobile then
                	return Remind("You have been detected as being on mobile. This command will not run to prevent crashing.")
		end
		if firetouchinterest then
                	Remind("If you crash... that sucks!")
               		IceMap()
		else
			Remind("Sorry, your exploit does not support this command (firetouchinterest)")
	        end
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'byp' then -- created by tech-187, open source on his repo :)
        local args = string.split(msg, " ")
        local cmd = args[1]
        local bypsed = table.concat(args, " ", 2)
        local file = bypsed
        local a = {}

        for letter in file:gmatch(".") do
                  if letter ~= "\r" and letter ~= "\n" then
                            table.insert(a, letter)
                  end
        end

        for b, c in ipairs(a) do
                    local d = "variable_" .. tostring(b)
                   _G[d] = c
        end

        for b, c in ipairs(a) do -- it works but i still don't care if it sometimes doesn't bypass!
                    local e = string.rep("  ", 2 * (b - 1))
                if haspersons == true then
                        Chat("h/KohlsLite ez\n\n\n\n\n\n\n\n\n\n" .. e .. _G["variable_" .. tostring(b)])
                else
                            Chat("h KohlsLite ez\n\n\n\n\n\n\n\n\n\n" .. e .. _G["variable_" .. tostring(b)])
                end
        end
    end

     if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'nbyp' then -- my version (might work better)
			local args = string.split(msg, " ")
        		local cmd = args[1]
            		local bypsed = table.concat(args, " ", 2)
			local a = bypsed

			local chars = {}
			for char in a:gmatch(".") do
    				table.insert(chars, char)
			end

			for i, char in ipairs(chars) do
    				local spaces = string.rep(" ", (i-1) * 4)
	               		if haspersons == true then
    					Chat("h/KohlsLite ez\n\n\n\n\n\n\n\n\n\n" .. spaces .. char)
				else
					Chat("h KohlsLite ez\n\n\n\n\n\n\n\n\n\n" .. spaces .. char)
				end
			end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'sregen' then
        SRegen = true
	Remind("Non-perm players can no longer get admin.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unsregen' then
        SRegen = false
	Remind("Non-perm players can now get admin again.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'autogpc' then
        autogpcheck = true
	Remind("Now checking players for perm and persons upon joining.")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unautogpc' then
        autogpcheck = false
	Remind("No longer checking players for perm and persons upon joining.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'padban' then
         local dasplayer = string.sub(msg:lower(), #prefix + 8)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
		if blwl_an then
                	Chat("h \n\n\n "..player.." has been padbanned. \n\n\n")
		end
                table.insert(padbanned, player)
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
    end

    if string.sub(msg, 1, #prefix + 8) == prefix..'unpadban' then
         local dasplayer = string.sub(msg:lower(), #prefix + 10)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
		if blwl_an then
               		Chat("h \n\n\n "..player.." has been unpadbanned! \n\n\n")
		end
                table.remove(padbanned, table.find(padbanned, player))
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
    end

    if string.sub(msg, 1, #prefix + 8) == prefix..'padreinf' then
	if blwl_an then
        	Chat("h \n\n\n Pad reinforcements are on. \n\n\n")
	end
        padreinforcements = true
	Remind("Pad reinforcements are on.")
    end

    if string.sub(msg, 1, #prefix + 10) == prefix..'unpadreinf' then
	if blwl_an then
        	Chat("h \n\n\n Pad reinforcements are off! \n\n\n")
	end
        padreinforcements = false
	Remind("Pad reinforcements are off.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'qattach' then
        Chat("sit me down");task.wait(1)
        Chat("punish me");task.wait(1)
        Chat("unpunish me")
	Remind("Quick attach is done.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'biglogs' then
	    danum = tonumber(string.sub(msg:lower(), #prefix + 9))
	    if danum == "" then
            		game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScrollGui").TextButton.Frame.Size = UDim2.new(0,1000,0,1000)
	    else
			game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScrollGui").TextButton.Frame.Size = UDim2.new(0,danum,0,danum)
	    end
	    Remind("If you did this on mobile... you're dumb.")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'regen' then
        Regen()
	Remind("Reset the admin pads.")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'house' then
        House()
	Remind("Teleported to the house.")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'spawn' then
        GSpawn()
	Remind("Teleported to spawn.")
    end

    if string.sub(msg:lower(), 1, 3)  == ',re' then
        Chat("reset me"); Remind("Reset you.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'hhouse' then
       if haspersons then Chat("invis/me") else Chat("invis me") end
       task.wait(.35)
       House()
       task.wait(.35)
       if haspersons then Chat("vis/me") else Chat("vis me") end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'phelp' then
        local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        phelper = string.sub(msg:lower(), #prefix + 7)
        House()
        task.wait(0.5)
        if phelper ~= "" then        
                Chat("tp "..phelper.." me")
        else
                Chat("tp all me")
        end
	if phelper ~= "all" and phelper ~= "" then
		task.wait(0.5)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'void' then -- kohlsnoob
		local fakehelperhaha = string.sub(msg:lower(), #prefix + 6)
       		local opos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, -200, 0)
		task.wait(.45)
		Chat("tp "..fakehelperhaha.." me")
		Chat("unfly "..fakehelperhaha)
		task.wait()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = opos
		Remind("Player has been sent to the void!")
    end

    if string.sub(msg, 1, #prefix + 7) == prefix..'execute' then
        Execute(string.sub(msg, #prefix + 9))
	Remind("Executed the text!")
    end

    if string.sub(msg, 1, #prefix + 8) == prefix..'announce' then
        annsecret = string.sub(msg, #prefix + 10)
        Announce()
    end

    if string.sub(msg, 1, #prefix + 9) == prefix..'cannounce' then -- inspired by scv3-var
        local args = string.split(msg, " ")
        local dasplayer = args[2]
        PLAYERCHECK(dasplayer)
        if player ~= nil then
                        sus = player
                        whatsapp = table.concat(args, " ", 3)
                        AnnounceWM()
        else
                	Remind('Cannot find player with the name: '..dasplayer)
        end
    end

    if string.sub(msg, 1, #prefix + 6) == prefix..'shlong' then
		if haspersons == false then
Remind([[Sorry, you don't have Person's to perform this command!
Commands required: part]])
return
		end
		local args = string.split(msg, " ")
		if #args == 3 then
        		local dasplayer = args[2]
			PLAYERCHECK(dasplayer)
			if player ~= nil then
				puser = cplr
				local len = tonumber(args[3])
				Loops.pp = true
				pp(puser, len)
			else
				Remind('Cannot find player with the name: '..dasplayer)
			end		
		else
			Remind("Invalid amount of arguments. (it should be 3)")
		end
    end

    if string.sub(msg, 1, #prefix + 8) == prefix..'unshlong' then
		if haspersons == false then
Remind([[Sorry, you don't have Person's to perform this command!
Commands required: part]])
return
		end
		local args = string.split(msg, " ")
		if #args == 2 then
        		local dasplayer = args[2]
			PLAYERCHECK(dasplayer)
			if player ~= nil then
				Loops.pp = false
			else
				Remind('Cannot find player with the name: '..dasplayer)
			end		
		else
			Remind("Invalid amount of arguments. (it should be 2)")
		end
    end

    if string.sub(msg, 1, #prefix + 7) == prefix..'dncycle' then
		Loops.dncycle = true
		dncycle()
		Remind("Day and night cycle started.")
    end

    if string.sub(msg, 1, #prefix + 9) == prefix..'undncycle' then
		Loops.dncycle = false
		Remind("Day and night cycle ended.")
    end

    if string.sub(msg, 1, #prefix + 5) == prefix..'arena' then
		if haspersons == false then
Remind([[Sorry, you don't have Person's to perform this command!
Commands required: part]])
return
		end
		local args = string.split(msg, " ")
		if #args == 3 then
				local plr1 = args[2]
				local plr2 = args[2]
				arena(plr1, plr2)
				Remind("Building the arena")
		else
				Remind("Please give 3 arguments - arena (plr1) (plr2).")
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'prefix' then
        prefix = string.sub(msg:lower(), #prefix + 8)
	Remind("Changed the prefix!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'goodexec' then
	Remind("Created by Tech (Tech-187)")

	getgenv().scapproved = {
		"Fluxus", -- provided you don't use the RAT one (non silent caliber)
		"Delta" -- i agree with these, codex and arceus x (and probably vega x too) suck
	}

	local function check(d, e)
		for f, g in ipairs(e) do
			if g == d then
				return true
			end
		end;
		return false
	end;

	if check(identifyexecutor(), scapproved) then
		Remind("Your executor is SC Approved!")
	else
		Remind("Your executor is NOT SC Approved.")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'circa' then
	Remind("Warning! Experimental command.")
	local ic = 0

    	for _, item in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        	if item:IsA("Tool") then
            		item.Parent = game.Players.LocalPlayer.Character
            		ic = ic + 1
		        local angle = (ic - 1) * (360 / #game.Players.LocalPlayer.Backpack:GetChildren()) * (math.pi / 180)
            		local x = circrad * math.cos(angle)
            		local z = circrad * math.sin(angle)
            		item.GripPos = Vector3.new(x, 1, z)
        	end
    	end

    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'crad' then
		circrad = tonumber(string.sub(msg:lower(), #prefix + 6))
    end
		
    if string.sub(msg:lower(), 1, 7) == 'cprefix' then
        Remind("Your current prefix is "..prefix)
    end

    if string.sub(msg:lower(), 1, 6) == 'sneban' then
        Speak("I'm gonna say the s word. You are a filthy snekkur ngl")
    end

    if string.sub(msg:lower(), 1, 6) == 'cmp' then
	Speak("collect my pages...")
    end

   if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'pmap' then
		local colourhere = string.sub(msg, #prefix + 6)
		PaintMap(colourhere,"norm")
		Remind("Painted the map!")
   end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'paintmap' then
		local colourhere = string.sub(msg, #prefix + 10)
		PaintMap(colourhere,"norm")
		Remind("Painted the map!")
   end

  if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'messpaint' then
		PaintMap(colourhere,"random")
		Remind("Ruined the map's paint!")
   end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'rbgmap' then
		local args = string.split(msg, " ")
		r = args[2] 
		g = args[3]
		b = args[4]
		PaintMap_2(r,g,b)
		Remind("Painted the map (rbg)!")
   end
		
 if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'rmap' then
		if Loops.rainbowmap == false then
			Loops.rainbowmap = true
			rmap()
			Remind("Rainbow map is now enabled.")
		else
			Loops.rainbowmap = false
			Remind("Disabled since it was already enabled!")
		end
   end

 if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'rbase' then
		if Loops.rbase == false then
			Loops.rbase = true
			rbase()
			Remind("Rainbow baseplate is now enabled.")
		else
			Loops.rbase = false
			Remind("Disabled since it was already enabled!")
		end
   end

 if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'rfog' then
		deran = tonumber(string.sub(msg:lower(), #prefix + 6))
		if Loops.rfog == false then
			Loops.rfog = true
			rfog(deran)
			Remind("Rainbow fog is now enabled.")
		else
			Loops.rfog = false
			Remind("Disabled since it was already enabled!")
		end
   end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unrmap' then
		Loops.rainbowmap = false
		Remind("Run fixpaint to fix the map's colours now!")
   end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unrbase' then
		Loops.rbase = false
		Remind("Run fixpaint to fix the baseplate's colour now!")
   end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unrfog' then
		Loops.rfog = false
		Remind("Rainbow fog is now disabled")
		Chat("fix")
   end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'autoafk' then
        autoafk = true
	Remind("Auto afk is now enabled.")
   end

   if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unautoafk' then
        autoafk = false
	Remind("Auto afk is now disabled.")
   end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antilag' then
        antilag = true
	Remind("Anti Lag is now enabled.")
   end

   if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantilag' then
        antilag = false
	Remind("Anti Lag is now disabled.")
   end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'capfps' then
	local sfc = tonumber(string.sub(msg:lower(), #prefix + 8))
	if setfpscap and type(setfpscap) == "function" then
		local num = sfc or 1e6
		if num == 'none' then
			return setfpscap(1e6)
		elseif num > 0 then
			return setfpscap(num)
		else
			return Remind("Please provide a number above 0 or 'none'.")
		end
	else
		return Remind("Sorry, your exploit does not support fps changing (setfpscap)")
	end
   end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'alladmin' then
	alladmin = true
	Chat("h \n\n\n Everyone has been given admin! Chat any command. \n\n\n")
	Remind("All admin enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'keybind' then
	keybindz = true
	Remind("Key binds enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'vkeybind' then
	keybindz_unsafe = true
	Remind("UNSAFE Key binds enabled (include crash keybind).")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unkeybind' then
	keybindz = false
	Remind("Key binds disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unvkeybind' then
	keybindz_unsafe = false
	Remind("UNSAFE Key binds disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'setkey' then
		local args = string.split(msg, " ")
        	if #args == 3 then
                	keyb = args[2]
			kmart = args[3]
			if keyb == "house" then
				housekeybind =args[3]
			elseif keyb == "reset" then
				rekeybind = args[3]
			elseif keyb == "fly" then
				flykeybind = args[3]
			elseif keyb == "crash" then
				crashkey = args[3]
			else
				Remind("Argument 2 invalid [must be house/reset/fly/crash]")
			end
				
		else
			Remind("Invalid amount of arguments (must be 3)")
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unalladmin' then
	alladmin = false
        Chat("h \n\n\n Free admin is off. \n\n\n")
	Remind("All admin disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'nok' then
		if not (string.sub(msg:lower(), 1, #prefix + 4) == prefix..'nok2' or string.sub(msg:lower(), 1, #prefix + 4) == prefix..'nok3') then
                	NOK()
			Remind("You will no longer die to the obby!")
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'nok2' then
        	NOK2()
		Remind("You will no longer die to the obby! (2)")	
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'nok3' then
		NOK3()
		Remind("You will no longer die to the obby! (3)")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'tnok' then
                TNOK("true")
		Remind("You will no longer die to the obby!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'untnok' then
                TNOK("false")
		Remind("You can die to the obby again!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'getping' then
                GetPing()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'autogb' then
                autogb = true
		Remind("Auto gearban is enabled. People get gearbanned when they join this server")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unautogb' then
                autogb = false
		Remind("Auto gearban is now disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'qpunish' then -- idea from zercon
                	local trolled = string.sub(msg:lower(), #prefix + 9)
                        Chat("punish " .. trolled)
                        Regen()
			Remind("Quick punished the player")
    end   

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'spunish' then -- ii's admin
                	local trolled = string.sub(msg:lower(), #prefix + 9)
                        Chat("speed "..trolled.." inf")
			Remind("Sped the player to infinity!")
    end   

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'gpunish' then -- ii's admin
                	local trolled = string.sub(msg:lower(), #prefix + 9)
                        Chat("setgrav "..trolled.." -9e9")
			Remind("Setgraved player to the heavens!")
    end   

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'ungearban' then
                local plrg = string.sub(msg:lower(), #prefix + 11)
                if plrg == "" or plrg == "me" then
                        game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
			Remind("Ungearbanned yourself.")
                else 
                        Ungearban(plrg)
                end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'gearban' then
                 local dasplayer = string.sub(msg:lower(), #prefix + 9)
                 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        xplayer = player
                        xplr = cplr
                        Gearban()
                 else
                        Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'rail' then
                 local dasplayer = string.sub(msg:lower(), #prefix + 6)
                 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        railer = player
                        Rail()
                 else
                        Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'lemonman' then
                 local dasplayer = string.sub(msg:lower(), #prefix + 10)
                 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        lemonman = player
                        lman = cplr
                        Lemon()
                 else
                        Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'laser' then
                 local dasplayer = string.sub(msg:lower(), #prefix + 7)
                 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        laserman = player
                        laman = cplr
                        Laser()
                 else
                        Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'surround' then
                 local dasplayer = string.sub(msg:lower(), #prefix + 10)
                 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        surrer = player
                        Surround("sur")
                 else
                        Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'rnuke' then
		local args = string.split(msg, " ")
        	if #args == 3 then
                	range = tonumber(args[2])
			amount = tonumber(args[3])
			RNuke(amount, range)
		else
			Remind("Invalid amount of arguments. (it should be 3)")
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'dnuke' then
 		local args = string.split(msg, " ")
        	if #args == 3 then
            		local amount = tonumber(args[2])
			local range = tonumber(args[3])
			local user = nil
			RoNuke(amount, range, user)
		elseif #args == 2 then
			local tar = args[2]
			PLAYERCHECK(tar)
			if tar ~= nil then
				local amount = nil
				local range = nil
				user = cplr
				RoNuke(amount, range, user)
			else
				Remind("Player doesn't exist!")
			end
		else
			Remind("Invalid amount of arguments. (it should be 2 or 3)")
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'jnuke' then
		local args = string.split(msg, " ")
        	if #args == 1 then
			dj = "default"
			jnu = nil
			JNUKE(dj, jnu)
		elseif #args == 2 then
            		local target = args[2]
                 	PLAYERCHECK(target)
                 	if target ~= nil then
                        	dj = "player"
				jnu = cplr
				JNUKE(dj, jnu)
			else
                               Remind('Cannot find player with the name: '..dasplayer)
                        end
		else
			Remind("Invalid amount of arguments. (it should be 1 or 2)")
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'rcannon' then
		rcannon("def")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'wrcannon' then
		rcannon("wide")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'uncannon' then
    	        Connections.cannoning:Disconnect()

    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'astrike' then
		ASTRIKE()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unastrike' then
		Connections.airstrike:Disconnect()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'skcraze' then
		SKCRAZE()
		skf = true
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unskcraze' then
		skf = false
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'weld' then
                local args = string.split(msg, " ")
        	if #args >= 3 then
            		local target = args[2]
                 	PLAYERCHECK(target)
                 	if target ~= nil then
                        	welder = player
				wld = cplr
				mode = table.concat(args, " ", 3)
                        	Welding(mode)
                 	else
                               Remind('Cannot find player with the name: '..dasplayer)
                	 end
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'nweld' then
                local args = string.split(msg, " ")
        	if #args >= 2 then
            		local target = args[2]
                 	PLAYERCHECK(target)
                 	if target ~= nil then
                        	welder = player
				wld = cplr
                        	NewW(welder, wld)
                 	else
                               Remind('Cannot find player with the name: '..dasplayer)
                	 end
		end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'hfreeze' then
                local args = string.split(msg, " ")
        	if #args == 2 then
            		local target = args[2]
                 	PLAYERCHECK(target)
                 	if target ~= nil then
                        	welder = player
				wld = cplr
                        	HFreeze()
                 	else
                               Remind('Cannot find player with the name: '..dasplayer)
                	 end
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'tattach' then
                local args = string.split(msg, " ")
        	if #args == 2 then
            		local target = args[2]
                 	PLAYERCHECK(target)
                 	if target ~= nil then
                        	welder = player
				wld = cplr
                        	TAttach()
                 	else
                               Remind('Cannot find player with the name: '..dasplayer)
                	 end
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'acton' then
    		local args = string.split(msg, " ")
    
    		if #args ~= 3 then
        		Remind("Invalid amount of arguments. (it should be 3)")
        		return
    		end

    		local act = args[2]
    		local getnumber = args[3]

    		if actions[act] then
        		actions[act](getnumber)
        		Remind("Action: " .. act)
    		else
        		Remind("Invalid action!")
    		end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'listacton' then
		local anz = {}

		for actname in pairs(actions) do
    			table.insert(anz, actname)
		end

		table.sort(anz)

		for _, actname in ipairs(anz) do
    			print(actname)
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'rfgun' then
	bullets = tonumber(string.sub(msg:lower(), #prefix + 7))
	RFGUN(bullets)
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unrfgun' then
	Connections.rapidfiregun:Disconnect()
    end

   if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'sjail' then
		Chat("jail me")
       		task.wait(0.2)
        	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,4,0)
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'nuke' then
                 local dasplayer = string.sub(msg:lower(), #prefix + 6)
                 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        surrer = player
                        Surround("nuke")
                 else
                               Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'age' then
                 local dasplayer = string.sub(msg:lower(), #prefix + 5)
                 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        myageis = cplr.AccountAge
			print("Age of player: "..myageis)
                        Remind("Age of player: "..myageis)
                        -- Speak(player.."'s age is "..myageis.." days!")
                        Chat("h \n\n\n "..player.."'s account age is "..myageis.." days! \n\n\n")
                 else
                        Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'jdate' then
                 local dasplayer = string.sub(msg:lower(), #prefix + 7)
                 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        local dates = {}
			local user = game:HttpGet("https://users.roblox.com/v1/users/"..cplr.UserId)
			local json = game.HttpService:JSONDecode(user)
			local date = json["created"]:sub(1,10)
			local splitDates = string.split(date,"-")
			table.insert(dates,cplr.Name.." joined: "..splitDates[2].."/"..splitDates[3].."/"..splitDates[1])
			print('Join Date (Month/Day/Year)'.. table.concat(dates, ',\n'))
			Remind('Join Date (Month/Day/Year)'.. table.concat(dates, ',\n'))
                 else
                        Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'dkick' then -- buggy!
                 local dasplayer = string.sub(msg:lower(), #prefix + 7)
		 PLAYERCHECK(dasplayer)
                 if player ~= nil then
			if  table.find(nokick, player) then
                        	Remind("Sorry, this player cannot be kicked!") return
			end          
			dk = cplr
			dkicked = player
			dkickin = true
                        dkick(dk, kicked)
			Remind("Dog kicking the player...")
                 else
                        Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'undkick' then -- buggy!
                 local dasplayer = string.sub(msg:lower(), #prefix + 9)
		 PLAYERCHECK(dasplayer)
                 if player ~= nil then
			dkickin = false
			Chat("respawn "..dkicked)
                 else
                        Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'slag' then -- buggy!
                 local dasplayer = string.sub(msg:lower(), #prefix + 6)
		 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        slag(cplr, player)
			Remind("Skate lagging the player")
                 else
                        Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'nslag' then -- buggy!
                 local dasplayer = string.sub(msg:lower(), #prefix + 7)
		 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        lagify(cplr,player)
			Remind("Skate lagging the player (2)")
                 else
                        Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'rpaintui' then
                for i,v in ipairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
                                if v.Name == "SelectionBox" or v.Name == "LineHandleAdornment" or v.Name == "PaletteGui" then
                                                        v:Destroy()
                                end
                end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'sspawn' then -- save spawn
                SSpawn()
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'cpos' then -- print current pos
                CPOS()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'gsspawn' then -- go to saved spawn
                Spawn()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'frespawn' then -- force respawn (broken)
        FRespawn()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'mrespawn' then -- force respawn (broken)
        MRespawn()
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'dummy' then
                 Dummy()
		 Remind("Creating test dummy...")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'ffix' then 
        GravFix()
        Chat("respawn me")
        ColFix()
        movestatus = false
	Remind("Fixed your game!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'rejoin' then
        Remind("Rejoinning... please wait.")
        REJOIN()
    end

    if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'rj' then
        Remind("Rejoinning... please wait.")
        REJOIN()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'autorj' then
	autorejoin = true
        Remind("You will now auto rejoin this server if you get disconnected.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unautorj' then
	autorejoin = false
        Remind("You will no longer auto rejoin this server if you get disconnected.")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'prj' then
		Remind("Rejoinning... please wait.")
                game:GetService("TeleportService"):TeleportToPrivateServer(game.PlaceId, game.PrivateServerId, game:GetService("Players").LocalPlayer)
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'prejoin' then
		Remind("Rejoinning... please wait.")
                game:GetService("TeleportService"):TeleportToPrivateServer(game.PlaceId, game.PrivateServerId, game:GetService("Players").LocalPlayer)
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'shop' then
        Remind("Serverhopping... please wait!")
        Remind("[WARN]: THIS MAY REJOIN YOU TO THE SAME SERVER.")
        SERVERHOP()
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'serverhop' then
        Remind("Serverhopping... please wait!")
        Remind("[WARN]: THIS MAY REJOIN YOU TO THE SAME SERVER.")
        SERVERHOP()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'iyshop' then
	Remind("Serverhopping... (IY)")
	IYServerhop()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'scshop' then
        Remind("Serverhopping... (Shortcut Version)")
        SCSERVERHOP(false, nil)
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'rshop' then
	rwj = tonumber(string.sub(msg:lower(), #prefix + 7))
        Remind("Serverhopping with your given player in server amount...")
        SCSERVERHOP(true, rwj)
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'infjump' then
                INFJUMP = true
		Remind("You can infinitely jump!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'uninfjump' then
                INFJUMP = false
		Remind("You can no longer infinitely jump!")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'speed' then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(string.sub(msg:lower(), #prefix + 7))
	 Remind("Modified your walkspeed!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'editsp' then
	 editedspeed = true
	 editedspeedis = tonumber(string.sub(msg:lower(), #prefix + 8))
	 Remind("Your walkspeed is set until you unset it!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'uneditsp' then
	 editedspeed = false
	 Remind("Unset the walkspeed.")
    end

    if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'jp' then
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(string.sub(msg:lower(), #prefix + 4))
	 Remind("Modified your jumppower!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'editjp' then
	 editedjump = true
	 editedjumpis = tonumber(string.sub(msg:lower(), #prefix + 8))
	 Remind("Your jumppower is set until you unset it!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'uneditjp' then
	 editedjump = false
	 Remind("Unset the jumppower.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'minzoom' then
         game.Players.LocalPlayer.CameraMinZoomDistance = tonumber(string.sub(msg:lower(), #prefix + 9))
	 Remind("Modified your minimum zoom!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'maxzoom' then
         game.Players.LocalPlayer.CameraMaxZoomDistance = tonumber(string.sub(msg:lower(), #prefix + 9))
	 Remind("Modified your maximum zoom!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'hlth' then
         game.Players.LocalPlayer.Character.Humanoid.Health = tonumber(string.sub(msg:lower(), #prefix + 6))
	 Remind("Modified your health!")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'fov' then
        workspace.Camera.FieldOfView = tonumber(string.sub(msg:lower(), #prefix + 5))
	Remind("Modified your Field Of View!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'grav' then
		workspace.Gravity = tonumber(string.sub(msg:lower(), #prefix + 6))
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unlockws' then
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Locked = false
		end
	end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'lockws' then
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Locked = true
		end
	end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'noclip' then
	 noclip()
	 Remind("Noclip is now on!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'clip' then
         clip()
	 Remind("Noclip is now off!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'ufly' then
	 Remind("Setting you up...")
         eincrash = true ; task.wait(0.1) ; UFLY()
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'isc' then
        local Ping1 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        task.wait(1)
        local Ping2 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()   
        if Ping1 == Ping2 then 
                Remind("The server's crashed!") 
		PtSH()
        else 
                Remind("This server's not crashed!")
        end
    end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'checkc' then
        local dasplayer = string.sub(msg:lower(), #prefix + 8)
        PLAYERCHECK(dasplayer)
        if player ~= nil then
                        clientcheck = player
			Chat("reload ".. clientcheck) ; task.wait(0.5)
                        Chat("unpunish " .. clientcheck)
                        Chat("unfly " .. clientcheck)
                        Chat("thaw " .. clientcheck)
                        Chat("clip " .. clientcheck)
                        Chat("unsit " .. clientcheck)
                         local Animator = workspace:FindFirstChild(clientcheck):WaitForChild("Humanoid"):WaitForChild("Animator")
                            if #Animator:GetPlayingAnimationTracks() == 0 then
                                        Remind(clientcheck .. "'s client is frozen.")
                            else
                                Remind(clientcheck .. "'s client is running fine.")
                            end

         else
                               Remind('Cannot find player with the name: '..dasplayer)
         end
    end

   if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'breakanims' then
        local dasplayer = string.sub(msg:lower(), #prefix + 12)
        PLAYERCHECK(dasplayer)
        if player ~= nil then
                        bokck = player
                            Chat('reset ' .. bokck)
                                task.wait()
                                Chat('name ' .. bokck .. ' Torso')
                                task.wait()
                                Chat("unname " .. bokck)
				Remind("Keep trying if it didn't work!")
         else
                               Remind('Cannot find player with the name: '..dasplayer)
         end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'nocam' then
                NoCam()
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'wbcam' then
                TogCam("b")    
		Remind("Breaking/fixing people's camera...")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'wfcam' then
                TogCam("f")   
		Remind("Breaking/fixing people's camera...")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'breakcam' then
                NoCam()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fixcam' then
                FixCam()
		Remind("Fixed your camera (only)!")
    end

     if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fixvelo' then
                VFix()
		Remind("Velocity has been fixed! Now you can do bpfixv to fix everyone's velocity.")
     end

     if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'obpfixv' then
                Remind("You need to be positioned by a wall! If you aren't, rerun this command after 5 seconds.")
                Chat("sit me down");task.wait(1)
                Chat("punish me");task.wait(1)
                Chat("unpunish me");task.wait(1)
                Chat("unskydive me")     
     end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'bpfixv' then
	local target = workspace.Terrain["_Game"].Workspace.Baseplate
	movepart(target)  
	repeat task.wait() until mready == true 
	task.wait(0.5)
	Chat("skydive me")
	task.wait(0.75)
	Chat("unskydive me")
	task.wait(0.75)
	Chat("respawn me")
	Remind("If this didn't work, it might be that you didn't fix YOUR own velo yet! Do fixvelo then try again.")
     end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'flipbp' then
	Remind("Flipping...")
	local target = workspace.Terrain["_Game"].Workspace.Baseplate
	movepart(target)  
	repeat task.wait() until mready == true
	task.wait(0.5)
	Chat("skydive me")
	task.wait(0.75)
	Chat("unskydive me")
	task.wait(0.75)
	Chat("trip me")
	task.wait(0.75)
	Chat("respawn me")
	Remind("Flipped the baseplate!")
     end

     if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fakebp' then
                local gamefolder = game:GetService("Workspace").Terrain["_Game"]
                if not gamefolder:FindFirstChild("PhantomStorage") then
                            local PStore = Instance.new("Folder")
                            PStore.Name = "PhantomStorage"
                            PStore.Parent = gamefolder
                end
                local Storage = gamefolder["PhantomStorage"] -- Phantom Storage folder
                local Phantom_Baseplate = Instance.new("Part")
                Phantom_Baseplate.BrickColor = BrickColor.new("Bright green")
                Phantom_Baseplate.Material = Enum.Material.Plastic
                Phantom_Baseplate.Position = Vector3. new(0, 0.1, 0)
                Phantom_Baseplate.Size = Vector3. new(1000, 1.2, 1000)
                Phantom_Baseplate.Anchored = true
                Phantom_Baseplate.Parent = Storage
		Remind("Remove the fake baseplate by doing nofakebp.")
    end

     if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'nofakebp' then
                game:GetService("Workspace").Terrain["_Game"]["PhantomStorage"]:Destroy()
		Remind("Removed the fake baseplate!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fixcol' then
                ColFix()
		Remind("Fixed your collisions.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fixgrav' then
                GravFix()
		Remind("Fixed your gravity.")
    end

     if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'novelo' then
                NoVelo()
		Remind("Breaking everyone's velocity...")
     end

     if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'breakvelo' then
                NoVelo()
		Remind("Breaking everyone's velocity...")
     end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'loopgrab' then
    	if not string.sub(msg:lower(), 1, #prefix + 9) == prefix..'loopgrab2' then
        	loopgrab = true
		Remind("Loopgrabbing the pads!")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unloopgrab' then
	if not string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unloopgrab2' then
		loopgrab = false
		Remind("Stopped loopgrabbing the pads!")
	end
    end

     if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fastpads' then
                FastPads()	
		Remind("Getting the pads.")
     end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'loopgrab2' then
        loopgrab2 = true
	Remind("Loopgrabbing the pads (2)!")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unloopgrab2' then
        loopgrab2 = false
	Remind("Stopped loopgrabbing the pads (2)!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'perm' then
	if not string.sub(msg:lower(), 1, #prefix + 5) == prefix..'perm2' then
        	perm = true
		Remind("You now have a perm pad!")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unperm' then
	if not string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unperm2' then
        	perm = false
		Remind("You no longer have a perm pad!")
	end
    end

   if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'perm2' then
        perm2 = true
	Remind("You now have a perm pad (2)!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unperm2' then
        perm2 = false
	Remind("You no longer have a perm pad (2)!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'allpads' then
                AllPads()
		Remind("Got all the pads available.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'checkbp' then
        local checker = string.sub(msg:lower(), #prefix + 9)
        PLAYERCHECK(checker)
        if player ~= nil then 
                CheckBackpack()
		Remind("Check console by running /console!")
        else
                Remind('Cannot find player with the name: '..checker)
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'gotosky' then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1000,0)
		Remind("Skydived you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'ungearme' then
                Chat("ungear me																				all	all")
		Remind("Ungeared yourself... and everyone.")
    end


    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'watermap' then
                SuperCMD("gear me 236438668")
		Chat("Do actall then ungear so they don't retract")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'nowater' then
                removewater()
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'removewater' then
                removewater()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'rwater' then
                removewater()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'clrwater' then
                removewater()
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'clearwater' then
                removewater()
end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fixpaint' then
	Remind("Fixing paint...")
        FixPaint()
     end

   if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'anticrash' then
        anticrash = true
	Remind("Anti crash is now enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unanticrash' then
        anticrash = false
	Remind("Anti crash is now disabled.")
    end

   if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'emranticrash' then
        emranticrash = true
	Remind("EMR Anti crash is now enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 16) == prefix..'unemranticrash' then
        emranticrash = false
	Remind("EMR Anti crash is now disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antigs' then -- what is this?
        antis.antigrayscale = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantigs' then 
        antis.antigrayscale = false
	Remind("Disabled this anti!")
    end	   

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antipaint' then
        antipaint = true
	Remind("Anti paint is now enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantipaint' then
        antipaint = false
	Remind("Anti paint is now disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antigear' then
        antigear = true
	Remind("Anti gear is now enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantigear' then
        antigear = false
	Remind("Anti gear is now disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antigb' then
        antigb = true
	Remind("Anti gearban is now enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantigb' then
        antigb = false
	Remind("Anti gearban is now disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antiattach2' then
        antiattach2 = true
	Remind("Anti ivory is now enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantiattach2' then
        antiattach2 = false
	Remind("Anti ivory is now disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antiperi' then
		antiperi = true
		Remind("Anti periastron is now enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantiperi' then
		antiperi = false
		Remind("Anti periastron is now disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antiattach' then
	if not string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antiattach2' then
        	antiattach = true
		Remind("Anti attach is now enabled.")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantiattach' then
	if not string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantiattach2' then
        	antiattach = false
		Remind("Anti attach is now disabled.")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antifling' then
        antis.antifling = true
	Remind("Anti fling is now enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantifling' then
        antis.antifling = false
	Remind("Anti fling is now disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'noblt' then
        noblt = true
	Remind("Players can no longer use some tools since they are annoying.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unnoblt' then
        noblt = false
	Remind("Players can now use the annoying tools.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antiray' then
        antiraygun = true
	Remind("Players can no longer use the ray gun.")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantiray' then
        antiraygun = false
	Remind("Players can now use the ray gun.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'novoid' then
                workspace.FallenPartsDestroyHeight = 0/0
		Remind("Void removed.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fixvoid' then
                workspace.FallenPartsDestroyHeight = -500
		Remind("Void returned.")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'cvoid' then
	        local args = string.split(msg, " ")
		local dh = args[2] or -500
		if isNumber(dh) then
			workspace.FallenPartsDestroyHeight = dh
		end		
		Remind("Void changed.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'pinglogs' then
        PingLogs = true
	Remind("You'll get pinged when someone uses logs.")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unpinglogs' then
        PingLogs = false
	Remind("You'll no longer get pinged when someone uses logs.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antilogs' then
        AntiLogs = true
	Remind("Auto-spamming the logs now when someone tries looking.")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantilogs' then
        AntiLogs = false
	Remind("No longer auto-spamming the logs now when someone tries looking.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'pingcsys' then
        PingCsystem = true
	Remind("You'll get pinged when someone uses /c system or /w.")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unpingcsys' then
        PingCsystem = false
	Remind("You'll no longer get pinged when someone uses /c system or /w.")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'noobdetect' then
        noobdetect = true
	Remind("You'll get pinged when someone uses baby commands or wrong prefixes")
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unnoobdetect' then
        noobdetect = false
	Remind("You'll no longer get pinged when someone uses baby commands or wrong prefixes")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiblind' then
        antis.antiblind = true
	Remind("Turned this anti on for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiblind' then
        antis.antiblind = false
	Remind("Turned this anti off for you!")
    end

-- !! I WILL TRY TO FIX THE ANTI SYSTEM SO IT CAN BE INDIVIDUAL PLAYERS FOR EVERYTHING. ALSO, I WILL FIX THE VARIABLE NAMES !! --
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiaddon' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiaddon = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiaddon = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antiaddon = true
                ALLantiaddon = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiaddon' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiaddon = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiaddon = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antiaddon = false
                ALLantiaddon = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'anticlone' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.anticlone = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLanticlone = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.anticlone = true
                ALLanticlone = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unanticlone' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.anticlone = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLanticlone = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.anticlone = false
                ALLanticlone = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antidog' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antidog = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantidog = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antidog = true
                ALLantidog = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantidog' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antidog = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantidog = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antidog = false
                ALLantidog = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antifire' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antifire = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantifire = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antifire = true
                ALLantifire = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantifire' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antifire = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantifire = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antifire = false
                ALLantifire = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end   
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antifreeze' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antifreeze = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantifreeze = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antifreeze = true
                ALLantifreeze = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

   if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantifreeze' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antifreeze = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantifreeze = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antifreeze = false
                ALLantifreeze = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end   
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antiff' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiff = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiff = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antiff = true
                ALLantiff = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

  if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantiff' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiff = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiff = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antiff = false
                ALLantiff = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antiglow' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiglow = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiglow = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antiglow = true
                ALLantiglow = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantiglow' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiglow = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiglow = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antiglow = false
                ALLantiglow = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antihc' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antihealthchange = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantihealthc = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antihealthchange = true
                ALLantihealthc = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantihc' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antihealthchange = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantihealthc = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antihealthchange = false
                ALLantihealthc = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antijail' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antijail = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantijail = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antijail = true
                ALLantijail = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantijail' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antijail = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantijail = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antijail = false
                ALLantijail = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antijump' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antijump = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantijump = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antijump = true
                ALLantijump = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantijump' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antijump = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantijump = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antijump = false
                ALLantijump = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antikill' then
        local args = string.split(msg, " ")
	if #args == 2 then
        	if args[2] == "me" then
                	antis.antikill = true
                	Remind("Turned this anti on for you!")
        	elseif args[2] == "others" then
                	ALLantikill = true
                	Remind("Turned this anti on for others!")
        	elseif args[2] == "all" then
               		antis.antikill = true
                	ALLantikill = true
                	Remind("Turned this anti on for everyone!")
        	else
		  	kia = args[2]
           	  	PLAYERCHECK(kia)
	         	if player ~= nil then
				if not table.find(antikill, player) then
					Remind(player.." is on the list now!")
					table.insert(antikill, player)
				else
					Remind(player.." is already in the table!")
				end
                 	else                           
                        	Remind('Cannot find player with the name: '..dasplayer)
			end
                end
	else
                Remind("Invalid amount of arguments: Must be me, others, all or a player!")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantikill' then
        local args = string.split(msg, " ")
        if #args == 2 then
        	if args[2] == "me" then
                	antis.antikill = false
                	Remind("Turned this anti off for you!")
        	elseif args[2] == "others" then
                	ALLantikill = false
                	Remind("Turned this anti off for others!")
        	elseif args[2] == "all" then
               		antis.antikill = false
                	ALLantikill = false
                	Remind("Turned this anti off for everyone!")
        	else
		  	kia = args[2]
           	  	PLAYERCHECK(kia)
	         	if player ~= nil then
				if table.find(antikill, player) then
					Remind(player.." is no longer in the table!")
					table.remove(antikill, table.find(antikill, player))
				else
					Remind(player.." was never in the list!")
				end
                 	else                           
                        	Remind('Cannot find player with the name: '..dasplayer)
			end
                end
	else
                Remind("Invalid amount of arguments: Must be me, others, all or a player!")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antifly' then -- forgot to add this to the list lmao
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antifly = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantifly = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antifly = true
                ALLantifly = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantifly' then -- forgot to add this to the list lmao
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antifly = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantifly = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antifly = false
                ALLantifly = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antinoc' then -- yes
                antis.antinoclip = true
                Remind("Turned this anti on for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantinoc' then -- yes
                antis.antinoclip = false
                Remind("Turned this anti off for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antichar' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antichar = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantichar = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antichar = true
                ALLantichar = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantichar' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antichar = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantichar = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antichar = false
                ALLantichar = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antimsg' then
        antis.antimessage = true
        Remind("Turned this anti on for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantimsg' then
        antis.antimessage = false
        Remind("Turned this anti off for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antitp' then
        antitp = true
        Remind("Turned this anti on for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantitp' then
        antitp = false
        Remind("Turned this anti off for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antiafk' then
        antiafk = true
        Remind("Turned this anti on for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantiafk' then
        antiafk = false
        Remind("Turned this anti off for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'autoungb' then
	autoungb = true
	Remind("You will automatically get ungearbanned if gearbanned.")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unautoungb' then
	autoungb = false
	Remind("You will no longer automatically get ungearbanned if gearbanned.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antivoid' then
        antis.antivoid = true
        Remind("Turned this anti on for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantivoid' then
        antis.antivoid = false
        Remind("Turned this anti off for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antisky' then
        antis.antiskydive = true
        Remind("Turned this anti on for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantisky' then
        antis.antiskydive = false
        Remind("Turned this anti off for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antiname' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiname = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiname = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antiname = true
                ALLantiname = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end     
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantiname' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiname = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiname = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antiname = false
                ALLantiname = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end     
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'antiparticles' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiparticles = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiparticles = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antiparticles = true
                ALLantiparticles = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end     
    end

    if string.sub(msg:lower(), 1, #prefix + 15) == prefix..'unantiparticles' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiparticles = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiparticles = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antiparticles = false
                ALLantiparticles = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end     
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antipunish' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antipunish = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantipunish = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antipunish = true
                ALLantipunish = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end         
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantipunish' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antipunish = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantipunish = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antipunish = false
                ALLantipunish = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end         
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antirocket' then
         local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antirocket = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantirocket = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antirocket = true
                ALLantirocket = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end             
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantirocket' then
         local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antirocket = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantirocket = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antirocket = false
                ALLantirocket = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end             
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antikick' then
                antikick2 = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantikick' then
                antikick2 = false
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'antit' then
                antitoolm = true
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unantit' then
                antitoolm = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antisit' then
         local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antisit = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantisit = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antisit = true
                ALLantisit = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end             
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantisit' then
         local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antisit = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantisit = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antisit = false
                ALLantisit = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end             
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antiseizure' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiseizure = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiseizure = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antiseizure = true
                ALLantiseizure = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantiseizure' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiseizure = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiseizure = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antiseizure = false
                ALLantiseizure = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
     end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antismoke' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antismoke = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantismoke = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antismoke = true
                ALLantismoke = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantismoke' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antismoke = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantismoke = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antismoke = false
                ALLantismoke = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'antisparkles' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antisparkles = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantisparkles = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                 antis.antisparkles = true
                ALLantisparkles = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end        
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'unantisparkles' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antisparkles = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantisparkles = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antisparkles = false
                ALLantisparkles = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end        
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antispeed' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antispeed = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantispeed = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antispeed = true
                ALLantispeed = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantispeed' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antispeed = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantispeed = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antispeed = false
                ALLantispeed = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antispin' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antispin = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantispin = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antispin = true
                ALLantispin = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantispin' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antispin = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantispin = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antispin = false
                ALLantispin = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antistun' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antistun = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantistun = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antistun = true
                ALLantistun = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantistun' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antistun = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantistun = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antistun = false
                ALLantistun = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antistg' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antisetgrav = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantisetgrav = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antisetgrav = true
                ALLantisetgrav = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantistg' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antisetgrav = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantisetgrav = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antisetgrav = false
                ALLantisetgrav = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antiswag' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiswag = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiswag = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antiswag = true
                ALLantiswag = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantiswag' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiswag = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiswag = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antiswag = false
                ALLantiswag = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antichat' then
        antichat = true
        antis.antimessage = true -- stop you from crashing :)
	Remind("Spamming h messages with emojis to lag and remove chat for people")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantichat' then
        antichat = false
        antis.antimessage = false
	Remind("No longer spamming h messages with emojis to lag and remove chat for people")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'mkick' then -- haha i found it
        acplr = string.sub(msg:lower(), #prefix + 7)
           PLAYERCHECK(acplr)
                   if player ~= nil and not table.find(nokick, player) then
			acplr = player
                           antichatplr = true
                elseif table.find(nokick, player) then
                        Remind("Sorry, this player cannot be kicked!")
                else                           
                        Remind("Player doesn't exist!")
                  end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unmkick' then
        antichatplr = false
        Chat("reset "..acplr)
	Remind("No longer kicking "..acplr)
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'pkick' then
                   acplr = string.sub(msg:lower(), #prefix + 7)
                   PLAYERCHECK(acplr)
                   if player ~= nil and not table.find(nokick, player) then
                           Chat("freeze "..acplr)
                           Chat("dog "..acplr)
                           Chat("rainbowify "..acplr)
                           Chat("name "..acplr.. " \n Imagine Getting \n CRASHED!!!")
			   acplr = player
                           antichatplr = true
                   elseif table.find(nokick, player) then
                        Remind("Sorry, this player cannot be kicked!")
                else
                           Remind("Player doesn't exist!")
                  end
   end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unpkick' then
                antichatplr = false
                Chat("reset "..acplr)
		Remind("No longer kicking "..acplr)
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'lkick' then
                   acplr = string.sub(msg:lower(), #prefix + 7)
                   PLAYERCHECK(acplr)
                   if player ~= nil and not table.find(nokick, player) then
                           Chat(prefix.."laser "..acplr)
			   Chat("blind "..acplr)
                        antichatplr = true
                   elseif table.find(nokick, player) then
                        Remind("Sorry, this player cannot be kicked!")
                else
                           Remind("Player doesn't exist!")
                  end
   end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unlkick' then
                antichatplr = false
                Chat("reset "..acplr)
		Remind("No longer kicking "..acplr)
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'autoff' then
        autos.autoff = true
        Remind("Auto ff is on!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unautoff' then
        autos.autoff = false
        Remind("Auto ff is off!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'autogod' then
        autos.autogod = true
        Remind("Auto god is on!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unautogod' then
        autos.autogod = false
        Remind("Auto god is off!")
    end      

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'autochar' then
  	local args = string.split(msg, " ")
        if args[2] == "me" then
                autocharme = true
		oname = args[3]
		autocharid = game.Players:GetUserIdFromNameAsync(oname)
                Remind("Auto char is on for you!")
        elseif args[2] == "others" then
                autocharall = true
		oname = args[3]
		autocharid = game.Players:GetUserIdFromNameAsync(oname)
                Remind("Auto char is on for others!")
        elseif args[2] == "all" then
                autocharme = true
                autocharall = true
		oname = args[3]
		autocharid = game.Players:GetUserIdFromNameAsync(oname)
                Remind("Auto char is on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unautochar' then
  	local args = string.split(msg, " ")
        if args[2] == "me" then
                autocharme = false
                Remind("Auto char is off for you!")
		Chat("unchar me")
        elseif args[2] == "others" then
                autocharall = false
                Remind("Auto char is off for others!")
		Chat("unchar others")
        elseif args[2] == "all" then
                autocharme = false
                autocharall = false
                Remind("Auto char is off for everyone!")
		Chat("unchar all")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'freerobux' then 
	Speak("I have a really cool script that can give me free robux")
	task.wait(4)
	Speak("while true do end"); Remind("wow you're so smart")
	task.wait(1)
	while true do end
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'febypass' then 
	Speak("I have a really cool script that bypasses fe")
	task.wait(4)
	Speak("while true do end"); Remind("wow you're so smart")
	task.wait(1)
	while true do end
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'reserver' then -- kohlsnoob and betterpersons (tech)
	Remind("Checking...")

        pcall(function()
                if not game:GetService("Workspace").Terrain["_Game"].Admin:FindFirstChild("Regen") then
                    Remind("Regen was not found.")
                end
		
               if not game:GetService("Workspace").Terrain["_Game"].Workspace:FindFirstChild("Baseplate") then
                    Remind("Baseplate was not found.")
                end
        end)

        pcall(function()
                if not game:GetService("Workspace").Terrain._Game.Workspace["Basic House"]:FindFirstChild("SmoothBlockModel112") then
                    Remind("House floor missing.")
                end
        end)

        pcall(function()
                if game:GetService("Workspace").Terrain["_Game"].Workspace.Baseplate.CFrame.Y > 1.5 then
                    Remind("Baseplate at wrong place")
                end
		
		if game:GetService("Workspace").Terrain._Game.Workspace["Basic House"].SmoothBlockModel112.CFrame.Y > 15 then
		    Remind("House floor at wrong place.")
		end
        end)

        pcall(function()
                if game:GetService("Workspace").Terrain["_Game"].Workspace.Baseplate.CFrame.Y < 0 then
                    Remind("Baseplate at wrong place.")
                end
        end)

	local pads =  workspace.Terrain._Game.Admin.Pads
	
	local padsCount = 0
	for i,v in pairs(pads:GetChildren()) do
		if v:FindFirstChild("Head") then
			padsCount = padsCount + 1
		end
	end
	
	if padsCount == 9 then
		Remind("All admin pads found")
	elseif padsCount == 0 then
		Remind("All admin pads missing")
	else
		Remind(tostring(9-padsCount).." admin pads missing")
	end
	
	local ado = #workspace.Terrain._Game.Workspace.Obby:GetChildren()
	if ado == 10 then
		Remind("All obby jumps found")
	elseif ado == 0 then
		Remind("All obby jumps missing")
	else
		notif(tostring(10-ado).." obby jumps missing")
	end
	
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'devcmd' then
		Remind("KohlsLite is working!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'discord' then
		if setclipboard then
			Remind("Clipboard set to my username on Discord.")
			setclipboard("ts2021 (discord)")
		else
			Remind("Check console for my username on Discord.")
			print("ts2021 (discord)")
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'buy' then
		game:GetService("MarketplaceService"):PromptGamePassPurchase(game.Players.LocalPlayer, 883283806)
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'purchase' then
		game:GetService("MarketplaceService"):PromptGamePassPurchase(game.Players.LocalPlayer, 883283806)
    end

-- From here, my script becomes infinite yield because of Proton... --
    if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'r6' then
        ChangeRig("R6")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'r15' then
        ChangeRig("R15")
    end  

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'dance' then
	local dances = {"27789359", "30196114", "248263260", "45834924", "33796059", "28488254", "52155728"}
	if checkforR15(game.Players.LocalPlayer) then
		dances = {"3333432454", "4555808220", "4049037604", "4555782893", "10214311282", "10714010337", "10713981723", "10714372526", "10714076981", "10714392151", "11444443576"}
	end
	local animation = Instance.new("Animation")
	animation.AnimationId = "rbxassetid://" .. dances[math.random(1, #dances)]
	danceTrack = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(animation)
	danceTrack.Looped = true
	danceTrack:Play()  
	Remind("Started dancing!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'undance' then
	danceTrack:Stop()
	danceTrack:Destroy()   
	Remind("Stopped dancing.")
    end  

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'spasm' then
	if not checkforR15(game.Players.LocalPlayer) then
		local pchar = game.Players.LocalPlayer.Character
		local AnimationId = "33796059"
		SpasmAnim = Instance.new("Animation")
		SpasmAnim.AnimationId = "rbxassetid://"..AnimationId
		Spasm = pchar:FindFirstChildOfClass('Humanoid'):LoadAnimation(SpasmAnim)
		Spasm:Play()
		Spasm:AdjustSpeed(99)
		Remind("Started spasming!")
	else
		Remind("This command requires the r6 rig type. Do r6.")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unspasm' then
		Spasm:Stop()
		SpasmAnim:Destroy()
		Remind("Ended the spasm.")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'headthrow' then
	if not checkforR15(game.Players.LocalPlayer) then
		local AnimationId = "35154961"
		local Anim = Instance.new("Animation")
		Anim.AnimationId = "rbxassetid://"..AnimationId
		local k = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):LoadAnimation(Anim)
		k:Play(0)
		k:AdjustSpeed(1)
		Remind("Throwing your head!")
	else
		Remind("This command requires the r6 rig type. Do r6.")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'headsit' then
		local dasplayer = string.sub(msg:lower(), #prefix + 9)
        	PLAYERCHECK(dasplayer)
        	if player == nil then 
			return 
		else
			hs = cplr
		end

		RunService = game:GetService("RunService")

		if headSit then 
			headSit:Disconnect() 
		end

		game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').Sit = true
		task.wait()

		headSit = RunService.Heartbeat:Connect(function()
			if game:GetService("Players"):FindFirstChild(hs.Name) and hs.Character ~= nil and getRoot(hs.Character) and getRoot(game.Players.LocalPlayer.Character) and game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').Sit == true then
					getRoot(game.Players.LocalPlayer.Character).CFrame = getRoot(hs.Character).CFrame * CFrame.Angles(0,math.rad(0),0)* CFrame.new(0,1.6,0.4)
			else
					headSit:Disconnect()
			end
		end)
		Remind("Headsitting on the player!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'carpet' then
		local dasplayer = string.sub(msg:lower(), #prefix + 8)
        	PLAYERCHECK(dasplayer)
        	if player == nil then 
			return Remind("Fail: User not found!")
		else
			caplr = cplr
		end

		RunService = game:GetService("RunService")

		if not checkforR15(game.Players.LocalPlayer) then
			Chat(prefix..'uncarpet')
			task.wait()
			carpetAnim = Instance.new("Animation")
			carpetAnim.AnimationId = "rbxassetid://282574440"
			carpet = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):LoadAnimation(carpetAnim)
			carpet:Play(.1, 1, 1)

			local carpetplr = caplr

			carpetDied = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').Died:Connect(function()
				carpetLoop:Disconnect()
				carpet:Stop()
				carpetAnim:Destroy()
				carpetDied:Disconnect()
			end)

			carpetLoop = RunService.Heartbeat:Connect(function()
				pcall(function()
					getRoot(game.Players.LocalPlayer.Character).CFrame = getRoot(carpetplr.Character).CFrame
				end)
			end)

			Remind("You're a carpet for the player!")
		else
			Remind("This command requires the r6 rig type. Do r6.")
		end
	end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'uncarpet' then
		if carpetLoop then
			carpetLoop:Disconnect()
			carpetDied:Disconnect()
			carpet:Stop()
			carpetAnim:Destroy()
			Remind("You're no longer a carpet for the player!")
		end
     end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'bang' then
		local args = string.split(msg, " ")
                if #args == 3 then
                        bangsp = tonumber(args[3])
                end
		local dasplayer = args[2]
        	PLAYERCHECK(dasplayer)
        	if player == nil then 
			return Remind("Fail: User not found!")
		elseif player == "ScriptingProgrammer" or player == "atprog" or player == "kohlslitedev" then
			Remind("You can't bang developers!")
		else
			banger = cplr
		end

		Chat(prefix.."unbang")
		RunService = game:GetService("RunService")
		task.wait()

		local humanoid = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
		bangAnim = Instance.new("Animation")
		bangAnim.AnimationId = not checkforR15(game.Players.LocalPlayer) and "rbxassetid://148840371" or "rbxassetid://5918726674"
		bang = humanoid:LoadAnimation(bangAnim)
		bang:Play(0.1, 1, 1)
		if #args == 3 then 
			bang:AdjustSpeed(bangsp)
		else
			bang:AdjustSpeed(3)
		end

		bangDied = humanoid.Died:Connect(function()
			bang:Stop()
			bangAnim:Destroy()
			bangDied:Disconnect()
			bangLoop:Disconnect()
		end)

		local bangplr = banger
		local bangOffet = CFrame.new(0, 0, 1.1)

		bangLoop = RunService.Stepped:Connect(function()
			pcall(function()
				local otherRoot = getTorso(bangplr.Character)
				getRoot(game.Players.LocalPlayer.Character).CFrame = otherRoot.CFrame * bangOffet
			end)
		end)
		Remind("You're banging the player!")
	end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unbang' then
	if bangDied then
		bangDied:Disconnect()
		bang:Stop()
		bangAnim:Destroy()
		bangLoop:Disconnect()
		Remind("You're no longer banging the player!")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'mutebb' then -- yes this isn't a loop, i'm lazy
	SoundService = game:GetService("SoundService")
	if not notifiedRespectFiltering and SoundService.RespectFilteringEnabled then 
			notifiedRespectFiltering = true 
	end
	local players = game.Players:GetPlayers()
	for i, v in pairs(players) do
		task.spawn(function()
			for i, x in next, v.Character:GetDescendants() do
				if x:IsA("Sound") and x.Playing == true then
					x.Playing = false
				end
			end
			for i, x in next, v:FindFirstChildOfClass("Backpack"):GetDescendants() do
				if x:IsA("Sound") and x.Playing == true then
					x.Playing = false
				end
			end
		end)
	end
	Remind("Muted people's boomboxes!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unmutebb' then
	SoundService = game:GetService("SoundService")
	if not notifiedRespectFiltering and SoundService.RespectFilteringEnabled then 
			notifiedRespectFiltering = true 
	end

	local players = game.Players:GetPlayers()
	for i, v in pairs(players) do
		task.spawn(function()
			for i, x in next, v.Character:GetDescendants() do
					if x:IsA("Sound") and x.Playing == false then
						x.Playing = true
					end
			end
		end)
        end
	Remind("Unmuted people's boomboxes!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'view' then
		local dasplayer = string.sub(msg:lower(), #prefix + 6)
        	PLAYERCHECK(dasplayer)
        	if player == nil then 
			return Remind("Fail: User not found!")
		else
			brokeboi = cplr
		end

		StopFreecam()
		if viewDied then
			viewDied:Disconnect()
			viewChanged:Disconnect()
		end

		viewing = brokeboi
		workspace.CurrentCamera.CameraSubject = viewing.Character
		Remind("Viewing " .. brokeboi.Name)

		local function viewDiedFunc()
			repeat wait() until brokeboi.Character ~= nil and getRoot(brokeboi.Character)
			workspace.CurrentCamera.CameraSubject = viewing.Character
		end

		viewDied = brokeboi.CharacterAdded:Connect(viewDiedFunc)
		local function viewChangedFunc()
			workspace.CurrentCamera.CameraSubject = viewing.Character
		end

		viewChanged = workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(viewChangedFunc)
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unview' then
	StopFreecam()
	if viewing ~= nil then
		viewing = nil
		Remind('No longer viewing the player.')
	end
	if viewDied then
		viewDied:Disconnect()
		viewChanged:Disconnect()
	end
	workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'spin' then
	local args = string.split(msg, " ")
        if #args == 2 then
                        spinSpeed = tonumber(args[2])
	else
			spinSpeed = 20
        end
	for i,v in pairs(getRoot(game.Players.LocalPlayer.Character):GetChildren()) do
		if v.Name == "Spinning" then
			v:Destroy()
		end
	end
	local Spin = Instance.new("BodyAngularVelocity")
	Spin.Name = "Spinning"
	Spin.Parent = getRoot(game.Players.LocalPlayer.Character)
	Spin.MaxTorque = Vector3.new(0, math.huge, 0)
	Spin.AngularVelocity = Vector3.new(0,spinSpeed,0)
	Remind("Spinning without admin! Cool, right?")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unspin' then
	for i,v in pairs(getRoot(game.Players.LocalPlayer.Character):GetChildren()) do
		if v.Name == "Spinning" then
			v:Destroy()
		end
	end
	Remind("No longer spinning!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'swim' then
		swim()
		Remind("Enabled swimming!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unswim' then
		unswim()
		Remind("Disabled swimming!")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'tswim' then
	if swimming then
		Chat(prefix..'unswim')
	else
		Chat(prefix..'swim')
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'fling' then
		fling()
		Remind("Enabled flinging!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unfling' then
		unfling()
		Remind("Disabled flinging!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'freecam' then
		StartFreecam()
		Remind("Starting up the free cam.")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unfreecam' then
		StopFreecam()
		Remind("Stopping the free cam.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fcspeed' then
		local args = string.split(msg, " ")
       		if #args == 2 then
                        FCspeed = args[2]
		else
			FCspeed = 1
       		end
		if isNumber(FCspeed) then
			NAV_KEYBOARD_SPEED = Vector3.new(FCspeed, FCspeed, FCspeed)
		end    
		Remind("Changed the free cam speed.")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'stopanims' then
		local Char = game.Players.LocalPlayer.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")
		for i,v in next, Hum:GetPlayingAnimationTracks() do
			v:Stop()
		end
		Remind("Stopped animations!")
    end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'noanim' then
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		Remind("Removed animations!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'reanim' then
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		Remind("Added animations!")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'sit' then
		game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Sit = true
		Remind("You are now sitting! To stop sitting, jump... or do unsit.")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'stun' then
		game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
		Remind("You are now stunned! To stop being stunned, run unstun.")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'unsit' then
		game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Sit = false
		Remind("You actually ran it?")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unstun' then
		game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
		Remind("You are now unstunned!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'trip' then
	if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and getRoot(game.Players.LocalPlayer.Character) then
		local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		local root = getRoot(game.Players.LocalPlayer.Character)
		hum:ChangeState(0)
		root.Velocity = root.CFrame.LookVector * 30
		Remind("You've been tripped without admin! Cool, right?")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'animsp' then
		local args = string.split(msg, " ")
                if #args == 2 then
                        anisp = tonumber(args[2])
                end
		local Char = game.Players.LocalPlayer.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")
		for i,v in next, Hum:GetPlayingAnimationTracks() do
			if #args == 2 then
				v:AdjustSpeed(anisp)
			else
				v:AdjustSpeed(1)
			end
		end
		Remind("Modified animation speed!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'delvelo' then
		for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if v:IsA("BodyVelocity") or v:IsA("BodyGyro") or v:IsA("RocketPropulsion") or v:IsA("BodyThrust") or v:IsA("BodyAngularVelocity") or v:IsA("AngularVelocity") or v:IsA("BodyForce") or v:IsA("VectorForce") or v:IsA("LineForce") then
				v:Destroy()
			end
		end
		Remind("Deleted velocities in your character.")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'bvelo' then
		local bas = false
		V3 = Vector3.new(0, 0, 0)
		delay(1, function()
			bas = true
		end)
		while not bas do
			for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Velocity = V3
					v.RotVelocity = V3
				end
			end
			wait()
		end
		Remind("Set velocity in your character to 0.")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'cfly' then
	Remind("Setting you up...")
	game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
	local Head = game.Players.LocalPlayer.Character:WaitForChild("Head")
	Head.Anchored = true
	if CFloop then CFloop:Disconnect() end
	RunService = game:GetService("RunService")
	CFloop = RunService.Heartbeat:Connect(function(deltaTime)
		local moveDirection = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').MoveDirection * (CFspeed * deltaTime)
		local headCFrame = Head.CFrame
		local cameraCFrame = workspace.CurrentCamera.CFrame
		local cameraOffset = headCFrame:ToObjectSpace(cameraCFrame).Position
		cameraCFrame = cameraCFrame * CFrame.new(-cameraOffset.X, -cameraOffset.Y, -cameraOffset.Z + 1)
		local cameraPosition = cameraCFrame.Position
		local headPosition = headCFrame.Position

		local objectSpaceVelocity = CFrame.new(cameraPosition, Vector3.new(headPosition.X, cameraPosition.Y, headPosition.Z)):VectorToObjectSpace(moveDirection)
		Head.CFrame = CFrame.new(headPosition) * (cameraCFrame - cameraPosition) * CFrame.new(objectSpaceVelocity)
	end)
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'uncfly' then
	if CFloop then
		CFloop:Disconnect()
		game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
		local Head = game.Players.LocalPlayer.Character:WaitForChild("Head")
		Head.Anchored = false
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'cfspeed' then
        local args = string.split(msg, " ")
	if isNumber(args[2]) then
		CFspeed = args[2]
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'fly' then
        local args = string.split(msg, " ")
	if not IsOnMobile then
		NOFLY()
		wait()
		sFLY()
	else
		mobilefly(game.Players.LocalPlayer)
	end
	if args[2] and isNumber(args[2]) then
		flyspeed = args[2]
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'unfly' then
	if not IsOnMobile then 
		NOFLY() 
	else 
		unmobilefly(game.Players.LocalPlayer)
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fspeed' then
	local args = string.split(msg, " ")
	local speed = args[2] or 1
	if isNumber(speed) then
		flyspeed = speed
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'qefly' then
	local args = string.split(msg, " ")
	if args[2] == 'false' then
		QEfly = false
	else
		QEfly = true
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'tfly' then
	if FLYING then
		if not IsOnMobile then 
			NOFLY()
		else 
			unmobilefly(game.Players.LocalPlayer) 
		end
	else
		if not IsOnMobile then 
			sFLY() 
		else 
			mobilefly(game.Players.LocalPlayer) 
		end
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'weaken' then
	local args = string.split(msg, " ")
	for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if child.ClassName == "Part" then
			if args[2] then
				child.CustomPhysicalProperties = PhysicalProperties.new(-args[1], 0.3, 0.5)
			else
				child.CustomPhysicalProperties = PhysicalProperties.new(0, 0.3, 0.5)
			end
		end
	end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unweaken' then
	local args = string.split(msg, " ")
	for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if child.ClassName == "Part" then
			child.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
		end
	end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'strengthen' then
	local args = string.split(msg, " ")
	for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if child.ClassName == "Part" then
			if args[2] then
				child.CustomPhysicalProperties = PhysicalProperties.new(args[1], 0.3, 0.5)
			else
				child.CustomPhysicalProperties = PhysicalProperties.new(100, 0.3, 0.5)
			end
		end
	end
    end
			
    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unstrengthen' then
	local args = string.split(msg, " ")
	for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if child.ClassName == "Part" then
			child.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
		end
	end
    end

end)
"""

# Extract commands that start with prefix..
import re

# Find all occurrences of prefix..'command' in the Lua code
commands_from_lua = re.findall(r"prefix\.\.'(.*?)'", lua_code)

# Print the extracted commands in the desired format
for command in commands_from_lua:
    print(f"print(prefix..'{command}')")
    print("\n")


