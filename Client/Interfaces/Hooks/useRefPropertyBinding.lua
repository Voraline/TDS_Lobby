-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useRefPropertyBinding
-- Decompile time: 0.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useReactBinding = require(script.Parent.useReactBinding)
return function(a1, a2, a3) -- Line: 6 -- upvalues: useReactBinding (val), React (val) -- types: a2: string
    local v1, u13 = useReactBinding(a1.current and a1.current[a2] or a3)
    local useEffect = React.useEffect
    local v2 = {a1.current, a2}
    useEffect(function() -- Line: 14 -- upvalues: a1 (val), a2 (val), u13 (val)
        local current = a1.current
        local u11 = nil
        if current then
            u11 = (current:GetPropertyChangedSignal(a2)):Connect(function() -- Line: 19 -- upvalues: u13 (upval), current (val), a2 (upval)
                u13(current[a2])
            end)
            u13(current[a2])
        end
        return function() -- Line: 25 -- upvalues: u11 (ref)
            if u11 then
                u11:Disconnect()
            end
        end
    end, v2)
    return v1
end