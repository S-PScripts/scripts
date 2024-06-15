Loops.alog = false

musiclog = {}

task.spawn(function()
	while true do
		task.wait(0)
		if Loops.alog then
			if workspace.Terrain["_Game"].Folder:FindFirstChild("Sound") then
				musicid = workspace.Terrain["_Game"].Folder:FindFirstChild("Sound").SoundId
				if not table.find(musiclog, musicid) then
					print("The song being played is "..workspace.Terrain["_Game"].Folder:FindFirstChild("Sound").SoundId)
					table.insert(musiclog, musicid)
				end
			end
		end
	end
end)
