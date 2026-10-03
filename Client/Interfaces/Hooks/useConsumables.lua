-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useConsumables
-- Decompile time: 0.76 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local Consumables = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Consumables)
local React = require(ReplicatedStorage.Shared.UI.React)
local useChild = require(script.Parent.useChild)
local useChildren = require(script.Parent.useChildren)
local u39 = RunService:IsRunning()
return function() -- Line: 14
    -- upvalues: useChild (val), u39 (val), ReplicatedStorage (val), ServerStorage (val), useChildren (val), React (val)
    -- upvalues: Consumables (val)
    local v1 = useChild(u39 and ReplicatedStorage or ServerStorage, "Content")
    local v2 = useChild(v1, "Consumables")
    local u15 = useChildren(v2)
    return React.useMemo(function() -- Line: 19 -- upvalues: u15 (val), Consumables (upval)
        local v1
        local v2 = {}
        for i, j in u15 do
            v1 = Consumables(j.Name)
            if v1 then
                v2[j.Name] = v1
            end
        end
        return v2
    end, {v1, v2, u15})
end