-- CrashX
execu = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Main%20Scripts/Crash%20X.lua"))()
task.wait(5)
execu = true
print("should execute")
-- KohlsLite
task.spawn(function()
    while true do
        task.wait(0)
        if execu == true then
            print("executed?")
            loadstring(game:HttpGet("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Main%20Scripts/KohlsLite.lua"))()
            break
        end
    end
end)
