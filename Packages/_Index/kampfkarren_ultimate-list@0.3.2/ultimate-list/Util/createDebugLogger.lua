-- Script path: ReplicatedStorage.Packages._Index.kampfkarren_ultimate-list@0.3.2.ultimate-list.Util.createDebugLogger
-- Decompile time: 0.44 ms

local v1 = script:FindFirstAncestor("ultimate-list")
local DebugFlags = require(v1.DebugFlags)
return function(a1) -- Line: 7 -- upvalues: DebugFlags (val) -- types: a1: string
    return function(a1_2, ...) -- Line: 8 -- upvalues: DebugFlags (upval), a1 (val)
        if not DebugFlags.shouldLog then
            return
        end
        if typeof(a1_2) == "string" then
            print((("[%*] %*"):format(a1, (string.format(a1_2, ...)))))
            return
        end
        print(("[%*]"):format(a1), a1_2(...))
    end
end