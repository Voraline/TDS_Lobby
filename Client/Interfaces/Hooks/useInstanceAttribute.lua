-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useInstanceAttribute
-- Decompile time: 1.02 ms

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

return function(a1, a2, a3) -- Line: 15 -- upvalues: useState (val), useEffect (val) -- types: a1: userdata, a2: string
    local v1, u6 = useState(a3)
    local v2 = {a1, a2}
    useEffect(function() -- Line: 18 -- upvalues: a1 (val), a2 (val), u6 (val), a3 (val)
        local u11 = nil
        if a1 then
            u11 = (a1:GetAttributeChangedSignal(a2)):Connect(function() -- Line: 22 -- upvalues: u6 (upval), a3 (upval), a1 (upval), a2 (upval)
                local v1 = u6
                local v2 = a3
                local Attribute = a1:GetAttribute(a2)
                if Attribute == nil then
                    v1(v2)
                    return
                end
                v1(Attribute)
            end)
            local v1 = u6
            local v2 = a3
            local Attribute = a1:GetAttribute(a2)
            if Attribute ~= nil then
                v1(Attribute)
            else
                v1(v2)
            end
        end
        return function() -- Line: 29 -- upvalues: u11 (ref)
            if u11 then
                u11:Disconnect()
                u11 = nil
            end
        end
    end, v2)
    return v1
end