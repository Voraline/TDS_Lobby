-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useAttributes
-- Decompile time: 0.76 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useState = React.useState
local useEffect = React.useEffect
return function(a1) -- Line: 7 -- upvalues: useState (val), useEffect (val)
    local v1, u4 = useState({})
    local v2 = useEffect
    local v3 = {a1, name}
    v2(function() -- Line: 10 -- upvalues: a1 (val), u4 (val)
        local current
        local u13 = nil
        if typeof(a1) ~= "Instance" then
            current = a1.current
        else
            current = a1
            if not current then
                current = a1.current
            end
        end
        if current then
            u13 = current.AttributeChanged:Connect(function() -- Line: 15 -- upvalues: u4 (upval), current (val)
                u4(current:GetAttributes())
            end)
            u4(current:GetAttributes())
        end
        return function() -- Line: 22 -- upvalues: u13 (ref)
            if u13 then
                u13:disconnect()
                u13 = nil
            end
        end
    end, v3)
    return v1
end