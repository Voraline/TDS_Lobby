-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTowersOwned
-- Decompile time: 0.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(ReplicatedStorage.Shared.UI.React)
local Sift = require(ReplicatedStorage.Packages.Sift)
local useCache = require(Hooks.useCache)
local useMemo = React.useMemo
return function() -- Line: 17 -- upvalues: useCache (val), useMemo (val), Sift (val)
    local u3 = useCache("Inventory.Troops", {})
    return (useMemo(function() -- Line: 19 -- upvalues: Sift (upval), u3 (val)
        return Sift.Dictionary.keys(u3)
    end, {u3}))
end