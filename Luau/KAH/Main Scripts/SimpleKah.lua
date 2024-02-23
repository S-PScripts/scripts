--[[ 
____ ___ __  __ ____  _     _____ _  __    _    _   _ 
/ ___|_ _|  \/  |  _ \| |   | ____| |/ /   / \  | | | |
\___ \| || |\/| | |_) | |   |  _| | ' /   / _ \ | |_| |
 ___) | || |  | |  __/| |___| |___| . \  / ___ \|  _  |
|____/___|_|  |_|_|   |_____|_____|_|\_\/_/   \_\_| |_|

]]

local prefix = "."
local periastronlist = {"108158379", "80661504", "233520257", "73829193", "69499437", "139577901", "2544549379", "120307951", "99119240", "93136802", "80597060", "159229806", "77443461"}

print("Thank you for using SimpleKAH! Created by asechka19872.")

local function Chat(msg)
      game.Players:Chat(msg)
end

anticrash2 = true
antigear2 = false

game.Players.LocalPlayer.Chatted:Connect(function(msg)

	-- custom commands --
        if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antiattach' then
	            antiattach = true
        end
		
        if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantiattach' then
	            antiattach = false
        end

        if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'anticrash' then
	            anticrash2 = true
        end
		
        if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unanticrash' then
	            anticrash2 = false
        end

        if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antigear' then
	            antigear2 = true
        end
		
        if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantigear' then
	            antigear2 = false
        end

        if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'re' then
	            Chat("reload me")
        end

        if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'dncycle' then
                local dntime = 7
                local decdn = 0
                dncycle = true
        end

        if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'undncycle' then
                dncycle = false
        end

        if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'slock' then
                slockenabled = true
        end

        if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unslock' then
                slockenabled = false
        end
		
        if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'attach' then
                    Chat("sit me")
                    task.wait(1)
                    Chat("punish me")
                    task.wait(1)
                    Chat("unpunish me")
        end

        if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'vgcrash' then
                 VGCrash()
        end

        if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'autoff' then
                  autoff = true
        end

        if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unautoff' then
                  autoff = false
        end

        if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'tripesp' then
                  tripesp = true
        end

        if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'untripesp' then
                  tripesp = false
        end

  	if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'bring' then
        	bringu = (string.sub(msg:lower(), #prefix + 7))
		Bring()
    	end

   	if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'goto' then
        	gotou = (string.sub(msg:lower(), #prefix + 6))
		Goto()
    	end
    
        if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'sup' then
                  supermessage = string.sub(msg:lower(), #prefix + 5)
                  SuperCMD(supermessage)
        end

        if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'meteor' then
                  for i = 1,5 do
                      Chat("skydive me")
                  end
                  SuperCMD("part/10/10/10")
                  task.wait(1)
                  Chat("respawn me")
        end

	-- gear shit --
	if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'bhbomb' then
		local bh = string.sub(msg:lower(), #prefix + 8)
		if bh ~= "" then
			Chat("gear "..bh.." 28277486")
		else
			Chat("gear me 28277486")
		end
  	end

	if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'tictac' then
		local tt = string.sub(msg:lower(), #prefix + 8)
		if tt ~= "" then
			Chat("gear "..tt.." 16924676")
		else
			Chat("gear me 16924676")
		end
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

	if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'pgun' then
		local pg = string.sub(msg:lower(), #prefix + 6)
		if pg ~= "" then
			Chat("gear "..pg.." 34870758")
		else
			Chat("gear me 34870758")
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

	if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'trapmine' then
		local trp = string.sub(msg:lower(), #prefix + 10)
		if trp ~= "" then
				Chat("gear "..trp.. " 11999247")
				Chat("gear "..trp.. " 11999247")
				Chat("gear "..trp.. " 11999247")

		else
				Chat("gear me 11999247")
				Chat("gear me 11999247")
				Chat("gear me 11999247")
		end
  	end

	if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'camfixer' then
		local cam = string.sub(msg:lower(), #prefix + 10)
		if cam ~= "" then
				Chat("gear "..cam.. " 79736563")
		else
				Chat("gear me 79736563")
		end
  	end

	if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'camfixer' then
		local cam = string.sub(msg:lower(), #prefix + 10)
		if cam ~= "" then
				Chat("gear "..cam.. " 79736563")
		else
				Chat("gear me 79736563")
		end
  	end

	if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'painter' then
		local paint = string.sub(msg:lower(), #prefix + 9)
		if paint ~= "" then
				Chat("gear "..paint.. " 18474459")
		else
				Chat("gear me 18474459")
		end
  	end

	if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'perias' then
		local per = string.sub(msg:lower(), #prefix + 8)
		if per ~= "" then
			for i = 1, #periastronlist do
					Chat("gear "..plr.." ".. periastronlist[i])
       			end
		else
			for i = 1, #periastronlist do
					Chat("gear me ".. periastronlist[i])
       			end
		end
  	end

	if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'timegears' then
		local tmeg = string.sub(msg:lower(), #prefix + 11)
		if tmeg ~= "" then
				Chat("gear "..tmeg.. " 77443461")
				Chat("gear "..tmeg.. " 77443461")
		else
				Chat("gear me 77443461")
				Chat("gear me 77443461")
		end
  	end

	if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'telamon' then
		local telm = string.sub(msg:lower(), #prefix + 9)
		if telm ~= "" then
				Chat("gear "..telm.. " 93136746")
		else
				Chat("gear me 93136746")
		end
  	end
    
end)

function onPlayerAdded(player)
             PLRSTART(player)
	     if player.Name == "ScriptingProgrammer" then -- removed exact details so the script is better
    		 slockenabled = true
	     end
end

function SuperCMD(supermessage)
             for i = 1,128 do
                  Chat(supermessage)
                  task.wait()
             end      
end

game.Players.PlayerAdded:Connect(onPlayerAdded)

task.spawn(function()
	    while true do
	          task.wait()
      
            	  if autoff == true then
	                if game.Players.LocalPlayer.Character:FindFirstChild("ForceField") then
                      		Chat("unff me")
                 	end
	   	  end

            	  if tripesp == true then
	                  local sbspace = workspace.SubspaceTripmine
                    	  if game.Workspace:FindFirstChild("SubspaceTripmine") then
                        		sbspace.Transparency = 0
                   	  end
	          end
			
      end
end)

function VGCrash()
	Chat("gear me 00000000000000094794847")
        local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
        game.Players.LocalPlayer.Backpack:WaitForChild("VampireVanquisher")
        for _, v in ipairs(Backpack:GetChildren()) do
                v.Parent = game.Players.LocalPlayer.Character
        	v:Activate()
        end
        task.wait(.15)
        for i = 1,100 do
                Chat("unsize me me me")
        end
end
  
function PLRSTART(v)
      v.Chatted:Connect(function(msg)
             task.wait(0)
             task.spawn(function()
        	          if (string.sub(msg:lower(), 0, 3) == "sit" or string.sub(msg:lower(), 0, 4) == ":sit") and v.Name ~= game.Players.LocalPlayer.Name then
                         if antiattach then
                             Chat("reload "..v.Name)
                             print(v.Name..' tried to sit')
                             Chat('h \n\n\n [SimpleKAH]: '..v.Name..', You cannot sit due to anti-attach \n\n\n')
                         end
                  end
						
                    if (string.sub(msg:lower(), 0, 4) == "stun" or string.sub(msg:lower(), 0, 5) == ":stun") and v.Name ~= game.Players.LocalPlayer.Name then
                         if antiattach then
                             Chat("reload "..v.Name)
                             print(v.Name..' tried to stun.')
                             Chat('h \n\n\n [SimpleKAH]: '..v.Name..', you cannot stun due to anti-attach \n\n\n')
                         end
                    end
              end)
        end)
end

for i, v in pairs(game.Players:GetPlayers()) do
	task.wait(0)
	PLRSTART(v)
end

task.spawn(function()
	task.wait(0)
        if dncycle then
        	task.wait(0.1)
                for i = 1,24 do
                	for i = 1,59 do
                            task.wait(0.1)
                            decdn = decdn + 1
                            game.Players:Chat("time " .. dntime .. ":".. decdn)
                        end
                        decdn = decdn - 59
                        dntime = dntime + 1
                end
                dntime = 0
        end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	task.wait(0)
        for i, v in ipairs(game.Players:GetPlayers()) do
            if v.Backpack:FindFirstChild("VampireVanquisher") or v.Character:FindFirstChild("VampireVanquisher") then
               if v ~= game.Players.LocalPlayer and anticrash2 == true then
                Chat("ungear "..v.Name)
                Chat("punish "..v.Name)
                Chat("h \n\n\n [SimpleKAH]: Sorry, "..v.Name.. ", you cannot use the Vampire Vanquisher due to anti crash (2). \n\n\n")
               end
            end
            if v.Backpack:FindFirstChild("OrinthianSwordAndShield") or v.Character:FindFirstChild("OrinthianSwordAndShield") then
               if v ~= game.Players.LocalPlayer and anticrash2 == true then
                Chat("ungear "..v.Name)
                Chat("punish "..v.Name)
                Chat("h \n\n\n [SimpleKAH]: Sorry, "..v.Name.. ", you cannot use the Orinthian Sword and Shield due to anti crash (2). \n\n\n")
               end
            end
	    for i, gear in pairs(v.Backpack:GetChildren()) do
            	if gear:IsA("Tool") and antigear2 == true then
               		if v.Name ~= game.Players.LocalPlayer.Name then
				Chat("ungear "..v.Name)
				Chat("punish "..v.Name)
                		Chat("h \n\n\n [SimpleKAH]: Sorry, "..v.Name.. ", you cannot use gears due to anti gear (2). \n\n\n")
			end
            	end
       	    end
     end 
end)

task.spawn(function()
    while true do
    task.wait(0)
    local players = game.Players:GetPlayers()
    for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            for i, player in ipairs(players) do
                if string.find(player.Name:lower(), v.Name:lower()) then
                    if slockenabled == true and not table.find(bypslock, v.Name) then
                        if not game.Lighting:FindFirstChild(v.Name) then
                                Chat('punish '..v.Name)
                                Chat('blind '..v.Name)
                                Chat('pm '..v.Name..' [SimpleKAH]: sorry, this server is locked!')
                        end
		    end
                    break
                end
            end
        end
    end
    end
end)

function Goto()
          Chat("tp me "..gotou)
end

function Bring()
      Chat("tp "..bringu.." me")
end
