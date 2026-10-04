-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.MapItem
-- Decompile time: 0.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local MapItems = require(ReplicatedStorage.Shared.Modules.Content)("MapItems")
local u20 = RunService:IsClient()
return function(a1) -- Line: 9 -- upvalues: MapItems (val), u20 (val)
    if workspace.Type.Value == "Lobby" then
        warn("MapItem is not available in lobby")
        return
    end
    local v1 = MapItems:FindFirstChild(a1)
    if not v1 then
        warn("MapItem folder not found: " .. a1)
        return
    end
    if u20 then
        return {animator = require(v1.Animator), stats = require(v1.Stats)}
    end
    return {controller = require(v1.Controller), stats = require(v1.Stats)}
end