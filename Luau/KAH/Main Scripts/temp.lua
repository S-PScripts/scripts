local part = workspace.Terrain["_Game"].Workspace.Baseplate

-- array of players currently touching this part
-- manipulated with table.find and table.remove because it's guaranteed not to grow larger than 100 players
local playersTouching = {}

function getPlayerFromRootPart(part)
	return part.Name == "HumanoidRootPart" and game.Players:GetPlayerFromCharacter(part.Parent)
end

function onTouch(part)
	local player = getPlayerFromRootPart(part)
	if not player then return end -- do nothing if this isn't a player's rootpart
	if table.find(playersTouching, player) then return end -- player somehow triggered Touched while still touching the part
	table.insert(playersTouching, player) -- player is now in the list of touching players

	-- your code that should run when player enters the region here
	print("Entered", player)
end

function onTouchEnded(part)
	local player = getPlayerFromRootPart(part)
	if not player then return end
	local index = table.find(playersTouching, player)
	if not index then return end -- player somehow triggered TouchEnded without having touched the part
	table.remove(playersTouching, index)

	-- your code that should run when player exits the region here
	print("Exited", player)
end

part.Touched:Connect(onTouch)
part.TouchEnded:Connect(onTouchEnded)

local tool = script.Parent -- Replace 'script.Parent' with the reference to your tool

tool.Unequipped:Connect(function()
    tool.Handle.Transparency = 0 -- Set the transparency of the tool handle to 0 to make it visible again
end)

tool.Equipped:Connect(function()
    tool.Handle.Transparency = 1 -- Set the transparency of the tool handle to 1 to make it invisible
end)

-- altered version of tech's chatbypasser :0
a = "Hello world"

-- Split the string into individual characters
local chars = {}
for char in a:gmatch(".") do
    table.insert(chars, char)
end

-- Print out each letter with increasing number of spaces
for i, char in ipairs(chars) do
    local spaces = string.rep(" ", (i-1) * 4) -- Increase the size of spaces by multiplying (i-1) by 2
    print(spaces .. char)
end
