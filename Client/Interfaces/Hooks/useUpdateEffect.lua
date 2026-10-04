-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useUpdateEffect
-- Decompile time: 0.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
return function(a1, a2) -- Line: 4 -- upvalues: React (val) -- types: a1: function, a2: table?
    local u5 = React.useRef(false)
    local v1 = a2 or {}
    React.useEffect(function() -- Line: 7 -- upvalues: u5 (val), a1 (val)
        if u5.current then
            return a1()
        end
        u5.current = true
    end, v1)
end