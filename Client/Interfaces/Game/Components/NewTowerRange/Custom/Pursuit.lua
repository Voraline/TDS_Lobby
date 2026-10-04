-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.Custom.Pursuit
-- Decompile time: 1.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CircularRangeRing = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.CircularRangeRing)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useReplicatorBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatorBinding)
local useTagReplicatorInstance = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicatorInstance)
local memo = React.memo
local u36 = Color3.fromRGB(114, 179, 223)
return {
    HideDefaultRing = true,
    Render = memo(function(a1) -- Line: 25
        -- upvalues: useTagReplicatorInstance (val), useReplicatorBinding (val), createElement (val)
        -- upvalues: CircularRangeRing (val), u36 (val)
        return createElement(CircularRangeRing, {
            alwaysOnTop = true,
            target = a1.Model:FindFirstChild("PatrolPos"),
            radius = useReplicatorBinding(useTagReplicatorInstance(a1.Model, "TowerReplicator", "Tower"), "PatrolRange", 16),
            color = u36,
        })
    end),
}