-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTraceUpdate
-- Decompile time: 0.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
return function(a1) -- Line: 5 -- upvalues: React (val)
    local u4 = React.useRef(a1)
    React.useEffect(function() -- Line: 8 -- upvalues: a1 (val), u4 (val)
        local v1 = {}
        local v2 = a1
        for i, j in v2 do
            if u4.current[i] ~= j then
                v1[i] = j
            end
        end
        if next(v1) ~= nil then
            print("Changed props:", v1)
        end
        u4.current = v2
    end)
end