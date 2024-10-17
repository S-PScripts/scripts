-- github.com/lnfinitecoder beautified GUI

local lp = game.Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local StarterGui = game:GetService("StarterGui")
local sg = Instance.new("ScreenGui")
local plrgui = lp.PlayerGui
sg.Parent = StarterGui
sg.Name = "sg"

local togbutton = Instance.new("ImageButton")
togbutton.Parent = sg
togbutton.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
togbutton.Size = UDim2.new(0.03, 0, 0.08, 0)
togbutton.Name = "FrameToggler"
togbutton.Transparency = 0.5
togbutton.Position = UDim2.new(0.9, 0, 0.4, 0)

local circulizer = Instance.new("UICorner")
circulizer.Parent = togbutton
circulizer.CornerRadius = UDim.new(1, 0)

local cmdbar = Instance.new("TextBox")
local cmdbartoggle = false
cmdbar.Name = "cmdbar"
cmdbar.TextColor3 = Color3.fromRGB(255, 255, 255)
cmdbar.TextTransparency = 0
cmdbar.TextSize = 12
cmdbar.Parent = sg
cmdbar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
cmdbar.Size = UDim2.new(0.12, 0, 0.12, 0)
cmdbar.Transparency = 0.5
cmdbar.Position = UDim2.new(0.75, 0, 0.37, 0)
cmdbar.Text = "Input"
circulizer:Clone().Parent = cmdbar

local toplrgui =
    coroutine.wrap(function()
        while wait(0.1) do
            if not lp.PlayerGui:FindFirstChild("sg") then
                local clonesg = sg:Clone()
                clonesg.Parent = lp.PlayerGui
                repeat
                    wait()
                until plrgui:FindFirstChild("sg")

                plrgui.sg.FrameToggler.Activated:Connect(function()
                        print("Button Clicked")

                        if not cmdbartoggle then
                            local ecmdbar = plrgui.sg.cmdbar
                            ecmdbar:Destroy()
                            cmdbartoggle = not cmdbartoggle
                        elseif cmdbartoggle then
                            sg.cmdbar:Clone().Parent = plrgui.sg
                            cmdbartoggle = not cmdbartoggle
                            plrgui.sg.cmdbar.FocusLost:Connect(function()
                                    local cmsg = plrgui.sg.cmdbar.Text
                                    game.Players:Chat(tostring(cmsg))
                                    pcall(function()
                                            loadstring(tostring(cmsg))()
                                    end)
                                    print("Inputted: " .. tostring(cmsg))
                                    csmg = "Input"
                            end)
                        end
                    end)
            end
        end
    end
)
toplrgui()
