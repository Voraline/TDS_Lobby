-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useUnitStats
-- Decompile time: 0.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useChild = require(ReplicatedStorage.Client.Interfaces.Hooks.useChild)
return function(a1) -- Line: 5 -- upvalues: useChild (val), ReplicatedStorage (val), React (val) -- types: a1: string
    local u8 = useChild(useChild(ReplicatedStorage, "Content"), "Unit")
    local v1, u14 = React.useState({Default = {Health = 100}})
    local v2 = {a1, u8}
    React.useEffect(function() -- Line: 15 -- upvalues: u8 (val), a1 (val), u14 (val)
        if u8 == nil then
            return
        end
        local v1 = u8:FindFirstChild(a1)
        if v1 == nil then
            return
        end
        u14((require(v1:FindFirstChild("Stats"))))
    end, v2)
    return v1
end