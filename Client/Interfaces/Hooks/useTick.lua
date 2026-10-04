-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTick
-- Decompile time: 1.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local React = require(ReplicatedStorage.Shared.UI.React)
local useState = React.useState
local useEffect = React.useEffect
local u18 = {}
task.spawn(function() -- Line: 11 -- upvalues: u18 (val)
    local v1
    while task.wait(1) do
        v1 = tick()
        for k in pairs(u18) do
            k(v1)
        end
    end
end)
return function(a1) -- Line: 21
    -- upvalues: useReactBinding (val), useState (val), useEffect (val), u18 (val)
    local v1, v2
    if not a1 then
        v1, v2 = useState(tick())
    else
        v1, v2 = useReactBinding(tick())
    end
    local u16 = v2
    useEffect(function() -- Line: 30 -- upvalues: u18 (upval), u16 (ref)
        u18[u16] = true
        return function() -- Line: 33 -- upvalues: u18 (upval), u16 (upval)
            u18[u16] = nil
        end
    end, {})
    return v1
end