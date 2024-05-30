-- KohlsLite v2
-- This is a rewrite of the Chatted function as well as some other things

-- INFORMATION ABOUT MY SCRIPT --

-- This free, open-source script is for the Roblox game Kohls Admin House (KAH)
-- You can play KAH here: https://www.roblox.com/games/112420803/Kohls-Admin-House-NBC-Updated
-- Created by ScriptingProgrammer (Roblox) / TS2021x (Discord) / S-PScripts (GitHub)

-- Support this script today by donating Robux to me!
-- You can make your own script instead of skidding and you can take stuff from here if necessary.

-- Don't go abusing like crazy with this script. I made this free/open-source and don't want idiots doing stuff that make me make this paid/obfuscated.

-- CODE --

-- Variables --

-- Setup --
getgenv().klprefix2 = "."
getgenv().klversion2 = "v0.00 Alpha"

-- Connections --
local connections = {}

-- Variables for Chatted --
local admin = {klprefix2 = klprefix2, klversion = "v2"}
local commands = {}
local descriptions = {}

-- Variables for credits --
local creditables = {}
local creddesc = {}

-- Command adder --
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

-- Credit adder --
function addcredit(cName, cDescription)
    creditables[cName] = cName
    creddesc[cName] = cDescription
end

-- Credits --
addcredit("ScriptingProgrammer (Roblox) / ts2021x (Discord)/ S-PScripts (GitHub)",
"created KohlsLite"
)

addcredit("Tech/t_echr/techq and other admins of Shortcut",
"creating Shortcut v1, v2 and v3 [var] - giving ideas and help for scripts"
)

addcredit("iiDK",
"creating ii's Stupid Admin - help for scripts"
)

addcredit("atprog",
"creating PR Script - being a collaborator for KohlsLite"
)

addcredit("Gojo",
"creating SimpleKAH - gear and char ids"
)

addcredit("Dizzy",
"creating Route - music ids that I stole with an audio logger haha"
)

addcredit("You!",
"using my script and spreading it around :D"
)

-- LISTS --

-- Credit list -- 
addcommand("credits",
"print out the credits for KohlsLite",
function()
        for i, v in pairs(creditables) do
            dupe = v.. " - ".. creddesc[v]
            print(dupe)
        end
end)

-- Command list --
addcommand("cmds",
"print out the commands for KohlsLite",
function()
        for i, v in pairs(commands) do
            dupe = v.. " - ".. descriptions[v]
            print(dupe)
        end
end)
