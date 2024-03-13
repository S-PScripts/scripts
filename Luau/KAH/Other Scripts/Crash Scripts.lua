print("trying dog crash...")
for i = 1,100 do
    game.Players:Chat("dog all all all")
    game.Players:Chat("clone all all all")
end

game.Players:Chat("reload all")

print("trying freeze crash...")
for i = 1,100 do
    game.Players:Chat("freeze all all all")
    game.Players:Chat("clone all all all")
end

game.Players:Chat("reload all")

print("trying rocket/shield crash...")
for i = 1,100 do
    game.Players:Chat("shield/all/all/all")
    game.Players:Chat("rocket/all/all/all")
    game.Players:Chat("clone all all all")
end

game.Players:Chat("reload all")

print("trying vg crash...")
game.Players:Chat("gear me 0000000000000000000000000094794847")
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

game.Players:Chat("reload me")

print("trying fuck crash...")
for i = 0,5 do
        for i = 0,3 do 
            game.Players:Chat("size all .3") 
        end
        for i = 0,2 do 
            game.Players:Chat("freeze all all all") 
        end
        game.Players:Chat("size all 9.99")
        game.Players:Chat("dog all all all")
        game.Players:Chat("size all 10")
        for i = 0,4 do 
                game.Players:Chat("clone all all all") 
        end
        game.Players:Chat("unsize all all all")
end

game.Players:Chat("reload all")

print("trying fuck crash (kozy/knocks)...")
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

game.Players:Chat("reload all")

print("trying dog crash (tech)...")
for i = 1,52 do
    game.Players:Chat("dog all all all")
end
for i = 1,51 do
    game.Players:Chat("clone all all all")
end

print("the server should be crashed! sorry if it didn't.")
