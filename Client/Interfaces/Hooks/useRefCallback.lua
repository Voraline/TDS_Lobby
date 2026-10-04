-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useRefCallback
-- Decompile time: 1.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
return function(a1, a2, a3, a4) -- Line: 5 -- upvalues: React (val) -- types: a2: string, a3: function, a4: table?
    local useEffect = React.useEffect
    local v1 = {}
    local current = a1.current
    local v2 = a4 or {}
    v1[1] = a1
    v1[2] = current
    v1[3] = a2
    v1[4] = a3
    v1[5] = unpack(v2)
    useEffect(function() -- Line: 11 -- upvalues: a1 (val), a2 (val), a3 (val)
        local current = a1.current
        local u9 = nil
        if current then
            u9 = current[a2]:Connect(a3)
        end
        return function() -- Line: 19 -- upvalues: u9 (ref)
            if u9 then
                u9:Disconnect()
            end
        end
    end, v1)
end