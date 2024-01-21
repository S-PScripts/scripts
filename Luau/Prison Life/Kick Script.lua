local vk = workspace.Remote.votekick
vk:InvokeServer("Start",game.Players["Player"])
for i = 1,1000 do
vk:InvokeServer("Vote")
end

-- this will be made into a gui!
