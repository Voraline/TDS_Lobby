-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding
-- Decompile time: 0.93 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local useRef = React.useRef
return function(a1, a2, a3) -- Line: 8
    -- upvalues: useRef (val), ReactCharm (val)
    local u5 = useRef(a2)
    u5.current = a2
    return ReactCharm.useSignalBinding(function() -- Line: 12 -- upvalues: a1 (val), u5 (val)
        local v1 = a1()
        local current = u5.current
        if current then
            return current(v1)
        end
        return v1
    end, a3 or {a1})
end