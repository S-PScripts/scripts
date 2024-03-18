-- From Shortcut v2

function createKohlsUi(textTable)
	local kohlsUI = Instance.new("ScreenGui")
	local TextButton = Instance.new("TextButton")
	local Frame = Instance.new("Frame")
	local closeUi = Instance.new("TextButton")
	local Frame_2 = Instance.new("Frame")
	local a = Instance.new("TextLabel")
	local UIGridLayout = Instance.new("UIGridLayout")
	local clearUi = Instance.new("TextButton")

	--Properties:

	kohlsUI.Name = "kohlsUI"
	kohlsUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	kohlsUI.ResetOnSpawn = false

	TextButton.Parent = kohlsUI
	TextButton.BackgroundTransparency = 1.000
	TextButton.Draggable = true
	TextButton.Position = UDim2.new(0.5, -548, 0.5, -94)
	TextButton.Size = UDim2.new(0, 385, 0, 20)
	TextButton.AutoButtonColor = false
	TextButton.Text = ""

	Frame.Parent = TextButton
	Frame.ClipsDescendants = true
	Frame.Size = UDim2.new(0, 400, 0, 400)
	Frame.ZIndex = 7
	Frame.Style = Enum.FrameStyle.RobloxRound

	closeUi.Name = "closeUi"
	closeUi.Parent = Frame
	closeUi.Position = UDim2.new(1, -15, 0, -5)
	closeUi.Size = UDim2.new(0, 20, 0, 20)
	closeUi.ZIndex = 10
	closeUi.Style = Enum.ButtonStyle.RobloxButtonDefault
	closeUi.Font = Enum.Font.ArialBold
	closeUi.Text = "X"
	closeUi.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeUi.TextSize = 18.000

	Frame_2.Parent = Frame
	Frame_2.Position = UDim2.new(0, 0, 0, -9)
	Frame_2.ZIndex = 8

	a.Name = "a"
	a.Parent = Frame_2
	a.BackgroundTransparency = 1.000
	a.Position = UDim2.new(NAN, 0, NAN, 0)
	a.Size = UDim2.new(200, 18, 200, 18)
	a.ZIndex = 8
	a.Font = Enum.Font.Arial
	a.Text = ""
	a.TextColor3 = Color3.fromRGB(255, 255, 255)
	a.TextSize = 18.000
	a.TextStrokeTransparency = 0.800
	a.TextXAlignment = Enum.TextXAlignment.Left
	a.TextYAlignment = Enum.TextYAlignment.Top

	UIGridLayout.Parent = Frame_2
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellSize = UDim2.new(0, 100, 0, 18)

	clearUi.Name = "clearUi"
	clearUi.Parent = Frame
	clearUi.Position = UDim2.new(0.944999993, -15, 0, -5)
	clearUi.Size = UDim2.new(0, 20, 0, 20)
	clearUi.ZIndex = 10
	clearUi.Style = Enum.ButtonStyle.RobloxButtonDefault
	clearUi.Font = Enum.Font.ArialBold
	clearUi.Text = "C"
	clearUi.TextColor3 = Color3.fromRGB(255, 255, 255)
	clearUi.TextSize = 18.000

	-- Scripts:

	local function NNQOKB_fake_script() -- Frame_2.LocalScript 
		local script = Instance.new('LocalScript', Frame_2)

		function addLabel(txt)
			local newLb = script.Parent.a:Clone()
			newLb.Name = "TextLabel"
			newLb.Text = txt
			newLb.Parent = script.Parent
		end
		
		function addLabelWCheck(txt)
			local cnt = 0
			for i,v in pairs(script.Parent:GetChildren()) do
				if v.Name == "TextLabel" then
					cnt = cnt + 1
				end
			end
			if cnt >= 16 then
				clearLabels()
			end
			addLabel(txt)
		end
		
		function clearLabels()
			for i,v in pairs(script.Parent:GetChildren()) do
				if v.Name == "TextLabel" then
					v:Destroy()
				end
			end
		end
		
		script.Parent.Parent.closeUi.MouseButton1Click:Connect(function()
			script.Parent.Parent.Parent.Parent:Destroy()
		end)
		
		script.Parent.Parent.clearUi.MouseButton1Click:Connect(clearLabels)
		
		for _, text in ipairs(textTable) do
			addLabelWCheck(text)
		end
	end
	coroutine.wrap(NNQOKB_fake_script)()
end

createKohlsUi(
                {
                    "Thanks for using KohlsLite!",
                    "This script was created by TS2021.",
		    " ",
		    "To see the command list:",
		    "1. Chat .kcmds",
		    "2. Chat /console",
		    " ",
		    "Have fun using my script!"
	 	}
)


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "KohlsLite",
   LoadingTitle = "KohlsLite",
   LoadingSubtitle = "By ScriptingProgrammer",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "KohlsLite"
   },
   Discord = {
      Enabled = false,
      Invite = "",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "KohlsLite",
      Subtitle = "Start",
      Note = "You should only see this if you are on a PC. Insert PC into the key box. If you are on mobile, please close this GUI.",
      FileName = "KeyKohlsLite",
      SaveKey = false,
      GrabKeyFromSite = false,
      Key = {"PC","pc"}
   }
})

local Tab = Window:CreateTab("Antis", 4483362458) -- Title, Image

local Toggle = Tab:CreateToggle({
   Name = "No Obby Kill (NOK)",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
   if Value then
        TNOK("true")
    else
        TNOK("false")
    end
end
})

local Toggle = Tab:CreateToggle({
   Name = "Anti Kill",
   CurrentValue = false,
   Flag = "Toggle1", 
   Callback = function(Value)
        if Value then
           YOUantikill = true
	else 
	   YOUantikill = false
        end
    end
})

local Toggle = Tab:CreateToggle({
   Name = "Anti Punish",
   CurrentValue = false,
   Flag = "Toggle1", 
   Callback = function(Value)
        if Value then
           YOUantipunish = true
	else 
	   YOUantipunish = false
        end
    end
})

local Toggle = Tab:CreateToggle({
   Name = "Anti Rocket",
   CurrentValue = false,
   Flag = "Toggle1", 
   Callback = function(Value)
        if Value then
           YOUantirocket = true
	else 
	   YOUantirocket = false
        end
    end
})

local Toggle = Tab:CreateToggle({
   Name = "Anti Message",
   CurrentValue = false,
   Flag = "Toggle1", 
   Callback = function(Value)
        if Value then
           YOUantimsg = true
	else 
	   YOUantimsg = false
        end
    end
})

local Tab = Window:CreateTab("Crash", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Dog Crash",
   Callback = function()
      DCrash()
   end,
})

local Button = Tab:CreateButton({
   Name = "Freeze Crash",
   Callback = function()
      FCrash()
   end,
})

local Button = Tab:CreateButton({
   Name = "VG Crash",
   Callback = function()
      VGCrash()
   end,
})

local Button = Tab:CreateButton({
   Name = "Shield Crash",
   Callback = function()
      SCrash()
   end,
})

local Tab = Window:CreateTab("Teleports", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Regen",
   Callback = function()
      regentp()
   end,
})

local Button = Tab:CreateButton({
   Name = "House",
   Callback = function()
           House()
   end,
})


local Button = Tab:CreateButton({
   Name = "Spawn",
   Callback = function()
           GSpawn()
   end,
})

local Tab = Window:CreateTab("Music", 4483362458) -- Title, Image
local Input = Tab:CreateInput({
   Name = "Music ID",
   PlaceholderText = "Input",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      gmusic = tonumber(Text)
      Chat(prefix.."gmusic"..gmusic)
   end,
})

local dropdownOptions = {}
for i, name in ipairs(musicnames) do
    dropdownOptions[i] = string.format("%d. %s", i, name)
end

local Dropdown = Tab:CreateDropdown({
    Name = "Full List",
    Options = dropdownOptions, -- due to limitations of rayfield you can't click the button and play that song number :(
    CurrentOption = "All dropping 8 beats",
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(Option)
    end,
})
