-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTowers
-- Decompile time: 2.49 ms

local u43
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local Troops = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops)
local useChild = require(script.Parent.useChild)
local useChildren = require(script.Parent.useChildren)
if RunService:IsRunning() then
    u43 = ReplicatedStorage
else
    u43 = ServerStorage
    if not u43 then
        u43 = ReplicatedStorage
    end
end
return function() -- Line: 15 -- upvalues: useChild (val), u43 (val), useChildren (val), React (val), Troops (val)
    local v1 = useChild(u43, "Content")
    local v2 = useChild(v1, "Tower")
    local u10 = useChildren(v2)
    return React.useMemo(function() -- Line: 20 -- upvalues: u10 (val), Troops (upval)
        local v1
        local v2 = {}
        for i, j in u10 do
            v1 = Troops(j.Name)
            if v1 then
                v2[j.Name] = v1
            end
        end
        return v2
    end, {v1, v2, u10})
end