-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTotems
-- Decompile time: 1.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ContentAssets = require(ReplicatedStorage.Shared.Modules.ContentAssets)
local React = require(ReplicatedStorage.Shared.UI.React)
local NewTotems = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewTotems)
local useChildren = require(script.Parent.useChildren)
local Totems = ContentAssets("Totems")
return function() -- Line: 12 -- upvalues: useChildren (val), Totems (val), React (val), NewTotems (val)
    local u2 = useChildren(Totems)
    return React.useMemo(function() -- Line: 15 -- upvalues: u2 (val), NewTotems (upval)
        local v1
        local v2 = {}
        for i, j in u2 do
            v1 = NewTotems(j.Name)
            if v1 then
                v2[j.Name] = v1
            end
        end
        return v2
    end, {u2})
end