--[[ 
 _______   _______   ______   ______    ______   __    __  __    __  __    __ 
|       \ |       \ |      \ /      \  /      \ |  \  |  \|  \  |  \|  \  /  \
| $$$$$$$\| $$$$$$$\ \$$$$$$|  $$$$$$\|  $$$$$$\| $$\ | $$| $$  | $$| $$ /  $$
| $$__/ $$| $$__| $$  | $$  | $$___\$$| $$  | $$| $$$\| $$| $$  | $$| $$/  $$ 
| $$    $$| $$    $$  | $$   \$$    \ | $$  | $$| $$$$\ $$| $$  | $$| $$  $$  
| $$$$$$$ | $$$$$$$\  | $$   _\$$$$$$\| $$  | $$| $$\$$ $$| $$  | $$| $$$$$\  
| $$      | $$  | $$ _| $$_ |  \__| $$| $$__/ $$| $$ \$$$$| $$__/ $$| $$ \$$\ 
| $$      | $$  | $$|   $$ \ \$$    $$ \$$    $$| $$  \$$$ \$$    $$| $$  \$$\
 \$$       \$$   \$$ \$$$$$$  \$$$$$$   \$$$$$$  \$$   \$$  \$$$$$$  \$$   \$$

Created by ScriptingProgrammer
]]

local function Remind(MSG, LENGTH)
        game.StarterGui:SetCore("SendNotification", {
                Title = "PrisonUK",
                Text = MSG,
                Duration = 1 or LENGTH
        })
end;


local function Chat(MSG)
    game.Players:Chat(MSG)
end

getgenv().prefix = "-"

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    
    if string.sub(msg:lower(), 1, #prefix + 4) == prefix.."test" then
         Remind("operational")
    end
    
end)

Remind("PrisonUK by S_P")
