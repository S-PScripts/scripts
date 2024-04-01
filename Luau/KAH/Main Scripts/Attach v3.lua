-- PR SCRIPT / iidk admin
-- it's like attach v1 and attach v2 combined

function moveObject(target,wawawaa)
	
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
		local setdadamncframe = true
		local thedollar = wawawaa
		
		spawn(function()
        		repeat game:GetService("RunService").RenderStepped:Wait()
        			game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
				game.Players.LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
        			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = thedollar
        			game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
				game.Players.LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
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
				fwait()
				game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
				target.RotVelocity = Vector3.new(0,0,0)
		                target.Velocity = Vector3.new(0,0,0)
		                cf.Velocity = Vector3.new(0,0,0)
		                cf.RotVelocity = Vector3.new(0,0,0)
			    	cf.CFrame = target.CFrame * CFrame.new(-1*(target.Size.X/2)-(lp.Character['Torso'].Size.X/2), 0, 0)
				if not looping then 
					break 
				end
			end
		end)
		
		spawn(function() 
			while looping do 
				fwait() 
				Chat('unpunish me') 
			end 
		end)
		
		wait(0.3)
		looping = false
		lp.Character.IvoryPeriastron.Remote:FireServer(Enum.KeyCode.E)
		wait(0.3)
		Chat("respawn me")
		
	end
end
