-- Script path: ReplicatedStorage.Client.Modules.Shaker.CameraShake.CameraShakePresets
-- Decompile time: 0.98 ms

local CameraShakeInstance = require(script.Parent.CameraShakeInstance)
local u5 = {}

function u5.Bump() -- Line: 24 -- upvalues: CameraShakeInstance (val)
    local v1 = CameraShakeInstance.new(2.5, 4, 0.1, 0.75)
    v1.PositionInfluence = Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448)
    v1.RotationInfluence = Vector3.new(1, 1, 1)
    return v1
end

function u5.Explosion() -- Line: 33 -- upvalues: CameraShakeInstance (val)
    local v1 = CameraShakeInstance.new(5, 10, 0, 1.5)
    v1.PositionInfluence = Vector3.new(0.25, 0.25, 0.25)
    v1.RotationInfluence = Vector3.new(4, 1, 1)
    return v1
end

function u5.Earthquake() -- Line: 42 -- upvalues: CameraShakeInstance (val)
    local v1 = CameraShakeInstance.new(0.6, 3.5, 2, 10)
    v1.PositionInfluence = Vector3.new(0.25, 0.25, 0.25)
    v1.RotationInfluence = Vector3.new(1, 1, 4)
    return v1
end

function u5.BadTrip() -- Line: 51 -- upvalues: CameraShakeInstance (val)
    local v1 = CameraShakeInstance.new(10, 0.15, 5, 10)
    v1.PositionInfluence = Vector3.new(0, 0, 0.15000000596046448)
    v1.RotationInfluence = Vector3.new(2, 1, 4)
    return v1
end

function u5.HandheldCamera() -- Line: 60 -- upvalues: CameraShakeInstance (val)
    local v1 = CameraShakeInstance.new(1, 0.25, 5, 10)
    v1.PositionInfluence = Vector3.new(0, 0, 0)
    v1.RotationInfluence = Vector3.new(1, 0.5, 0.5)
    return v1
end

function u5.Vibration() -- Line: 69 -- upvalues: CameraShakeInstance (val)
    local v1 = CameraShakeInstance.new(0.4, 20, 2, 2)
    v1.PositionInfluence = Vector3.new(0, 0.15000000596046448, 0)
    v1.RotationInfluence = Vector3.new(1.25, 0, 4)
    return v1
end

function u5.RoughDriving() -- Line: 78 -- upvalues: CameraShakeInstance (val)
    local v1 = CameraShakeInstance.new(1, 2, 1, 1)
    v1.PositionInfluence = Vector3.new(0, 0, 0)
    v1.RotationInfluence = Vector3.new(1, 1, 1)
    return v1
end

function u5.Thump() -- Line: 86 -- upvalues: CameraShakeInstance (val)
    local v1 = CameraShakeInstance.new(3.2, 9, 0.06, 0.28)
    v1.PositionInfluence = Vector3.new(0.14000000059604645, 0.14000000059604645, 0.14000000059604645)
    v1.RotationInfluence = Vector3.new(1.0499999523162842, 1.0499999523162842, 1.0499999523162842)
    return v1
end

return (setmetatable({}, {
    __index = function(a1, a2) -- Line: 95 -- upvalues: u5 (val)
        local v1 = u5[a2]
        if type(v1) == "function" then
            return v1()
        end
        error("No preset found with index \"" .. a2 .. "\"")
    end,
}))