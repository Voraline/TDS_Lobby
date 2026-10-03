-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useAttribute
-- Decompile time: 1.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useState = React.useState
local useEffect = React.useEffect

local function updateState(a1, a2, a3) -- Line: 7
    if a3 == nil then
        a1(a2)
        return
    end
    a1(a3)
end

return function(a1, a2, a3) -- Line: 15 -- upvalues: useState (val), useEffect (val) -- types: a2: string
    local v1, u6 = useState(a3)
    local v2 = {a1, a2}
    useEffect(function() -- Line: 18 -- upvalues: a1 (val), a2 (val), u6 (val), a3 (val)
        local current
        local u16 = nil
        if typeof(a1) ~= "Instance" then
            current = a1.current
        else
            current = a1
            if not current then
                current = a1.current
            end
        end
        if current then
            u16 = (current:GetAttributeChangedSignal(a2)):connect(function() -- Line: 23 -- upvalues: u6 (upval), a3 (upval), current (val), a2 (upval)
                local v1 = u6
                local v2 = a3
                local Attribute = current:GetAttribute(a2)
                if Attribute == nil then
                    v1(v2)
                    return
                end
                v1(Attribute)
            end)
            local v1 = u6
            local v2 = a3
            local Attribute = current:GetAttribute(a2)
            if Attribute ~= nil then
                v1(Attribute)
            else
                v1(v2)
            end
        end
        return function() -- Line: 30 -- upvalues: u16 (ref)
            if u16 then
                u16:disconnect()
                u16 = nil
            end
        end
    end, v2)
    return v1
end