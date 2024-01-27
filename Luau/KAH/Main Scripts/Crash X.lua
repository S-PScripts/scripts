print("Crash X booted.")

-- // variables \\ --
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local gameFlr = workspace.Terrain._Game
local adminFlr = gameFlr.Admin

-- // gamepasses \\ --
local persons = (MarketplaceService:UserOwnsGamePassAsync(LocalPlayer.UserId, 35748) or MarketplaceService:UserOwnsGamePassAsync(LocalPlayer.UserId, 37127))
local perm = (MarketplaceService:UserOwnsGamePassAsync(LocalPlayer.UserId, 66254) or MarketplaceService:UserOwnsGamePassAsync(LocalPlayer.UserId, 64354))


-- // function discord \\ --

-- // chat function \\ --
local function Chat(msg)
    game.Players:Chat(msg)
end

-- // get a pad \\ --
