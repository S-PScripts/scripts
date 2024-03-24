-- KAH fly

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
