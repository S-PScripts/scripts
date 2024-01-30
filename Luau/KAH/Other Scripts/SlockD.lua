local prefix = '-'
local whitelist = {"scriptingprogrammer","me_123eq","me_crashking"}
local blacklist = {}
local slockenabled = false

local Players = game:GetService("Players")
function checkforplayer(plr)
  for i, v in pairs(game.Players:GetPlayers()) do
      if string.sub(v.Name:lower(), 1, #plr) == plr then
          player = v.Name
          print(player,"was found.")
      end
  end
end

game.Players:Chat("h \n\n\n [SlockD] Please be careful, this server is protected. \n\n\n")
print("-Commands-")
print("-slock/-unslock -> Serverlock the whole server.")
print("-wl/-unwl -> Let a user bypass the serverlock.")
print("-bl/unbl -> Serverlock a particular individual.")

print("SlockD by S_P. The simple base for KohlsLite.")

-- this is similar to CMD's system :D
task.spawn(function()
    while true do
        local players = game.Players:GetPlayers()
        for i, v in pairs(game.Workspace:GetChildren()) do
            if v.Name ~= game.Players.LocalPlayer.Name and not table.find(whitelist, v.Name) then
                for i, player in ipairs(players) do
                    if string.find(player.Name:lower(), v.Name:lower()) then
                        if slockenabled == true then
                            if not game.Lighting:FindFirstChild(v.Name) then
                                game.Players:Chat('punish '..v.Name)
                                game.Players:Chat('blind '..v.Name)
                                game.Players:Chat('pm [SlockD] '..v.Name..' sorry, this server is locked!')
                            end
                        elseif table.find(blacklist, v.Name) then
                            if not game.Lighting:FindFirstChild(v.Name) then
                                game.Players:Chat('punish '..v.Name)
                                game.Players:Chat('blind '..v.Name)
                                game.Players:Chat('pm [SlockD] '..v.Name..' sorry, you are blacklisted!')
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

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if string.sub(msg:lower(), 1, #prefix + 2)  == prefix..'wl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 4)
         checkforplayer(dasplayer)
         if player ~= nil then
                game.Players:Chat("h \n\n\n [SlockD] "..player.." has been whitelisted! \n\n\n")
                table.insert(whitelist, player)
                game.Players:Chat('unblind '..player)
                game.Players:Chat('unpunish '..player)
         else
                print('Cannot find player with the name: '..dasplayer)
         end
    end
    
    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'unwl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 6)
         checkforplayer(dasplayer)
         if player ~= nil then
                game.Players:Chat("h \n\n\n [SlockD] "..player.." has been unwhitelisted. \n\n\n")
                table.remove(whitelist, table.find(whitelist, player))
         else
                print('Cannot find player with the name: '..dasplayer)
         end
    end

    if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'bl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 4)
         checkforplayer(dasplayer)
         if player ~= nil then
                game.Players:Chat("h \n\n\n [SlockD] "..player.." has been blacklisted. \n\n\n")
                table.insert(blacklist, player)
         else
                print('Cannot find player with the name: '..dasplayer)
         end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'unbl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 6)
         checkforplayer(dasplayer)
         if player ~= nil then
                game.Players:Chat("h \n\n\n [SlockD] "..player.." has been unblacklisted! \n\n\n")
                table.remove(blacklist, table.find(blacklist, player))
                game.Players:Chat('unblind '..player)
                game.Players:Chat('unpunish '..player)
         else
                print('Cannot find player with the name: '..dasplayer)
         end
    end
    
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'slock' then
        game.Players:Chat("h \n\n\n [SlockD] Server is locked! \n\n\n")
        slockenabled = true
    end
    
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unslock' then
        slockenabled = false
        game.Players:Chat("h \n\n\n [SlockD] Server is unlocked! \n\n\n")
        game.Players:Chat('unblind all')
        game.Players:Chat('unpunish all')
    end
    
end)          
