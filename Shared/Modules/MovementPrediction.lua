-- Script path: ReplicatedStorage.Shared.Modules.MovementPrediction
-- Decompile time: 1.83 ms

local u0 = {}
local GameState = require(game:GetService("ReplicatedStorage").Shared.Modules.GameState)

local function flatten(a1, a2) -- Line: 9 -- types: a1: vector, a2: boolean?
    if a2 then
        return (Vector3.new(a1.X, 0, a1.Z))
    end
    return a1
end

local function getTargetPosition(a1) -- Line: 17
    local Part = a1.Part
    if Part then
        return Part.Position
    end
    return a1.Position
end

local function getTargetPathVelocity(a1) -- Line: 26
    local Speed_2 = if typeof(a1.Speed) ~= "number" then if not a1.GetWalkSpeed then 0 else a1:GetWalkSpeed() else a1.Speed
    if a1.Stopped then
        Speed_2 = 0
    end
    local v1 = if not a1.Reverse then Speed_2 else -Speed_2
    if typeof(a1.ForceSpeed) == "number" then
        v1 = v1 + a1.ForceSpeed
    end
    return v1
end

function u0.predict(a1, a2, a3, a4, a5) -- Line: 44
    -- upvalues: getTargetPathVelocity (val)
    local Scalar, v1
    local Part = a1.Part
    local Position = if not Part then a1.Position else Part.Position
    if not a1.Path then
        return Position
    end
    local v2 = getTargetPathVelocity(a1)
    if v2 == 0 then
        return Position
    end
    local v3 = math.max(a3 or 0, 0.001)
    local v4 = a4 or 0
    local PathDistance = a1.PathDistance
    local v5 = Position
    local v6 = ((if not a5 then a2 else Vector3.new(a2.X, 0, a2.Z)) - (if not a5 then Position else Vector3.new(Position.X, 0, Position.Z))).Magnitude / v3 + v4
    local v7, v8 = a1, a5
    for i = 1, 4 do
        Scalar = v7.Path:GetScalar(PathDistance + v2 * v6)
        v5 = Vector3.new(Scalar.X, Position.Y, Scalar.Z)
        v6 = (v1 - (if not v8 then v5 else Vector3.new(v5.X, 0, v5.Z))).Magnitude / v3 + v4
    end
    return v5
end

function u0.predictTowerProjectile(a1, a2, a3, a4, a5) -- Line: 83
    -- upvalues: GameState (val), u0 (val)
    return u0.predict(a1, a2, a3, (a4 or 0) + 0.06666666666666667 * GameState.TimeScale, a5)
end

return u0