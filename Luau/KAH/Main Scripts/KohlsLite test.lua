-- scv2 new :D

local connections = {}

getgenv().klprefix2 = "."
local admin = {klprefix2 = klprefix2, version = "v2"}
local commands = {}
local descriptions = {}

function addcommand(cmdName, cmdDescription, cmdFunction)
    commands[cmdName] = cmdName
    descriptions[cmdName] = cmdDescription
    connections[#connections + 1] = 
            game.Players.LocalPlayer.Chatted:Connect(function(msg)
                msg = msg:lower()
                args = msg:split(" ")
                if args[1] == admin.klprefix2 .. cmdName then
                    cmdFunction()
                elseif args[1] == "/e" and args[2] == admin.klprefix2 .. cmdName then
                    args[2] = args[3]
                    cmdFunction()
                end
        end)
end

addcommand("credits",
"print out the credits for kohlslite v2",
function()
end
)

for i, v in pairs(commands) do
        sjiknx = v.. " - ".. descriptions[v]
        print(sjiknx)
end
