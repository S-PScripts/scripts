-- test with ii's command thing, probably changing

local commandlist = {}

function runcmd(param1, specargs)
    for i, v in pairs(commandlist) do
        if prefix .. v[1] == param1 and running then
            if #specargs > #v[2] - 1 then
                pcall(function()
                        local s, f = pcall(v[3](specargs))
                        if not s then
                            if consoleOn then
                                print(f)
                            end
                        end
                end)
                return
            else
                local lister = prefix .. v[1] .. " "
                for i, d in pairs(v[2]) do
                    lister = lister .. d .. " "
                end
                GUI:Remind("KohlsLite v2", "The command you have recently sent is not properly formatted. The correct format is: " ..lister)
            end
        end
    end
end

function addcmd(name,args,func)
    table.insert(commandlist,{name,args,func})
end
