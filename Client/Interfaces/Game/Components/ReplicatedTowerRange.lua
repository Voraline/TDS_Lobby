-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.ReplicatedTowerRange
-- Decompile time: 2.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local NewTowerRange = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement

local function ignoreOnRange(a1, a2) -- Line: 28 -- types: a1: number, a2: number
    if a1 and a1 > 0 then
        return 0
    end
    return a2
end

return function(a1) -- Line: 36
    -- upvalues: useReplicatedState (val), createElement (val), NewTowerRange (val)
    local Replicator = a1.Replicator
    local isLowQuality = a1.isLowQuality
    local v1 = useReplicatedState(Replicator, "Deadzone")
    local v2 = useReplicatedState(Replicator, "Buildzone")
    local v3 = useReplicatedState(Replicator, "Range") or 0
    local v4 = useReplicatedState(Replicator, "FlightRange") or 0
    local v5 = useReplicatedState(Replicator, "RangeBuff") or 0
    local v6 = useReplicatedState(Replicator, "ScaredBuff")
    local Boundary = v3 + v3 * v5 / 100 - v3 * (v6 or 0) / 100
    if a1.ShowOnlyBoundary then
        Boundary = a1.Boundary
    end
    local v7 = {
        Valid = a1.Valid,
        Target = a1.Target,
        Tower = a1.Tower or "",
        Model = a1.Model,
        ShowOnlyBoundary = a1.ShowOnlyBoundary,
        BorderColor = a1.BorderColor,
        DisableFill = a1.DisableFill,
        FillTransparency = a1.FillTransparency,
        LineOffset = a1.LineOffset,
        LineSize = a1.LineSize,
        LineTransparency = a1.LineTransparency,
    }
    local Boundary_2 = a1.Boundary
    v7.Boundary = if not v4 then Boundary_2 else if not (v4 > 0) then Boundary_2 else 0
    v7.Range = if not v4 then Boundary else if not (v4 > 0) then Boundary else 0
    v7.Deadzone = if not v4 then v1 else if not (v4 > 0) then v1 else 0
    v7.Buildzone = if not v4 then v2 else if not (v4 > 0) then v2 else 0
    v7.FlightRange = v4
    v7.isLowQuality = isLowQuality
    v7.QualityMode = a1.QualityMode
    return createElement(NewTowerRange, v7)
end