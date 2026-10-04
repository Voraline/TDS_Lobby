-- Script path: ReplicatedStorage.Packages.Fusion.Utility.cleanup
-- Decompile time: 0.59 ms

local cleanup

function cleanup(a1) -- Line: 14 -- upvalues: cleanup (val)
    local v1 = typeof(a1)
    if v1 == "Instance" then
        a1:Destroy()
        return
    end
    if v1 == "RBXScriptConnection" then
        a1:Disconnect()
        return
    end
    if v1 == "function" then
        a1()
        return
    end
    if v1 == "table" then
        if typeof(a1.destroy) == "function" then
            a1:destroy()
            return
        end
        if typeof(a1.Destroy) == "function" then
            a1:Destroy()
            return
        end
        if a1[1] ~= nil then
            for i, v in ipairs(a1) do
                cleanup(v)
            end
        end
    end
end

return cleanup