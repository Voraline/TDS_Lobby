-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useFlashingColor
-- Decompile time: 1.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useBinding = React.useBinding
local useEffect = React.useEffect
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
return function(a1, a2, a3) -- Line: 10
    -- upvalues: useTween (val), useBinding (val), useReactBindings (val)
    local v1, u9, u10 = useTween(a1, a3, nil, true)
    local v2, v3 = useBinding(false)
    local v4 = {v2}
    useReactBindings(function(a1) -- Line: 14 -- upvalues: u9 (val), a2 (val), u10 (val)
        if a1 then
            u9(a2, true)
            return
        end
        u10()
    end, v4)
    return v1, v3
end