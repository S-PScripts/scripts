themelist = {"sunshine","blossom"}
themecode = {
    [[fogend 0, time 12]],
    [[fogend 100, time 0]]
}

local function Chat(msg)
    game.Players:Chat(msg)
end

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    task.wait(0)
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix.."theme" then
        local theme = string.sub(msg, #prefix + 7)
        for i, t in ipairs(themelist) do
            if t == theme then
                local themeCode = themecode[i]
                local codes = {}
                for code in themeCode:gmatch("[^%s]+") do
                    table.insert(codes, code)
                end
                for _, code in ipairs(codes) do
                    Chat(code)
                end
                break
            end
        end
    end
end)
