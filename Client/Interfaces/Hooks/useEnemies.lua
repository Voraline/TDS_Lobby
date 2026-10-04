-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useEnemies
-- Decompile time: 1.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useChild = require(script.Parent.useChild)
local useChildren = require(script.Parent.useChildren)
return function() -- Line: 7 -- upvalues: useChild (val), ReplicatedStorage (val), useChildren (val), React (val)
    local v1 = useChild(ReplicatedStorage, "Assets")
    local v2 = useChild(v1, "NewEnemies")
    local v3 = useChild(v1, "Enemies")
    local u14 = useChildren(v2)
    local u17 = useChildren(v3)
    return React.useMemo(function() -- Line: 14 -- upvalues: u14 (val), u17 (val)
        local v1 = {}
        for i, j in u14 do
            table.insert(v1, j.Name)
        end
        for k, n in u17 do
            table.insert(v1, n.Name)
        end
        return v1
    end, {u14, u17})
end