-- new thing for kohlslite i'm working on

local codes = {
    "193769809", -- 1
    "94794847", -- 2
    "92628079", -- 3
    "82357101", -- 4
}

local gears = {
    "boombox", -- 1
    "vg",      -- 2
    "osas",    -- 3
    "sword",   -- 4
}

local function Chat(msg)
    game.Players:Chat(msg)
end

local prefix = "!"
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    task.wait(0)
    if string.sub(msg:lower(), 1, #prefix + 4) == prefix.."gear" then
        local args = string.split(msg, " ")
        if #args >= 3 then
            local target = args[2]
            local gearName = table.concat(args, " ", 3)
            local gearIndex = 0
            for i, name in ipairs(gears) do
                if name == gearName then
                    gearIndex = i
                    break
                end
            end
            if gearIndex ~= 0 then
                local gearCode = codes[gearIndex]
                Chat("gear " .. target .. " " .. gearCode)
            else
                Chat("Sorry, I couldn't find that gear.")
            end
        else
            Chat("Invalid command format. Please use !gear <target> <gear name>")
        end
    end
end)
