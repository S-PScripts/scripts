-- tech's lyrics // source

local function Chat(msg)
    game.Players:Chat(msg)
end

local folder = workspace.Terrain._Game.Folder

Chat("clr")

repeat task.wait() until not folder:FindFirstChild("Sound")	

Chat("-- setup --")
Chat("-- setup --")

repeat task.wait() until folder:FindFirstChild("Sound") and folder:FindFirstChild("Sound").Playing
local sound = folder:FindFirstChild("Sound")

function CheckSound()
    if not folder:FindFirstChild("Sound").Playing then return end
end

task.spawn(function() 
        if sound.TimePosition == 0 then 
                repeat task.wait() until not sound.TimePosition == 0 
        end

        if sound.TimePosition ~= 0 then
                repeat task.wait() until not sound.TimePosition == 0 
        end
        
        CheckSound();Chat("fix");
        CheckSound();Chat("clr");
end)

getgenv().bassline = true

-- LYRICS
task.delay(5, function() 
    CheckSound();Chat(" -- message --");wait()
    CheckSound();Chat(" -- message --");wait()
end)
