-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useMaps
-- Decompile time: 1.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useChild = require(script.Parent.useChild)
local useChildren = require(script.Parent.useChildren)
return function() -- Line: 6 -- upvalues: useChild (val), ReplicatedStorage (val), useChildren (val), React (val)
    local u10 = useChildren((useChild(useChild(ReplicatedStorage, "Content"), "Maps")))
    local v1, u20 = React.useState(#u10 <= 0)
    local v2 = {u10}
    return (React.useMemo(function() -- Line: 13 -- upvalues: u10 (val), u20 (val)
        local v1 = {}
        for i, j in u10 do
            table.insert(v1, j.Name)
        end
        u20(#u10 <= 0)
        return v1
    end, v2)), v1
end