-- CrashX
execu = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Main%20Scripts/Crash%20X.lua"))()
task.wait(5)
execu = true

-- KohlsLite
task.spawn(function()
    while true do
        task.wait(0)
        if execu == true then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Main%20Scripts/KohlsLite.lua"))()
        end
    end
end)
