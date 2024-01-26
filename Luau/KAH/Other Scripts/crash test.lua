for i = 1,100 do
            Chat("dog all all all                                                                             fuck")
            Chat("clone all all all                                                                           fuck")
end

local Players = game:GetService("Players"):GetPlayers()
local randomPlayer = "Placeholder"
task.wait(2)
if #Players > 0 then -- so it don't pick yourself
    repeat
    randomPlayer = Players[math.random(#Players)] 
    until randomPlayer ~= game.Players.LocalPlayer
end

local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("PromptBlockPlayer", randomPlayer)

-- serverhop script...
local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/112420803/servers/Public?sortOrder=Asc&limit=100"))
for i,v in pairs(Servers.data) do
  	if v.playing ~= v.maxPlayers then
      	    game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
                StarterGui:SetCore("PromptUnblockPlayer", randomPlayer)
            end
end

