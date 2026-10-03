-- Script path: ReplicatedStorage.Packages._Index.egomoose_fractality-spring@0.2.0.fractality-spring.Primitives.RotationSpring
-- Decompile time: 6.02 ms

local exp = math.exp
local sin = math.sin
local cos = math.cos
local max = math.max
local sqrt = math.sqrt
local atan2 = math.atan2
local u6 = {}
u6.__index = u6
u6.ClassName = "RotationSpring"

function u6.new(a1, a2, a3, a4) -- Line: 33
    -- upvalues: u6 (val)
    local v1 = setmetatable({}, u6)
    v1.dampingRatio = a1
    v1.frequency = a2
    v1.goal = a4:Orthonormalize()
    v1.position = a3:Orthonormalize()
    v1.velocity = Vector3.new(0, 0, 0)
    return v1
end

local function dot(a1, a2) -- Line: 49 -- types: a1: vector, a2: vector
    return a1.X * a2.X + a1.Y * a2.Y + a1.Z * a2.Z
end

local function areRotationsClose(a1, a2) -- Line: 53 -- types: a1: userdata, a2: userdata
    local XVector = a1.XVector
    local XVector_2 = a2.XVector
    local v1 = XVector.X * XVector_2.X + XVector.Y * XVector_2.Y + XVector.Z * XVector_2.Z
    local YVector = a1.YVector
    local YVector_2 = a2.YVector
    local v2 = YVector.X * YVector_2.X + YVector.Y * YVector_2.Y + YVector.Z * YVector_2.Z
    local ZVector = a1.ZVector
    local ZVector_2 = a2.ZVector
    local v3 = ZVector.X * ZVector_2.X + ZVector.Y * ZVector_2.Y + ZVector.Z * ZVector_2.Z
    return 2.9999999695382584 < v1 + v2 + v3
end

local function angleDiff(a1, a2) -- Line: 61
    -- upvalues: max (val), sqrt (val), atan2 (val)
    local XVector = a1.XVector
    local XVector_2 = a2.XVector
    local v1 = XVector.X * XVector_2.X + XVector.Y * XVector_2.Y + XVector.Z * XVector_2.Z
    local YVector = a1.YVector
    local YVector_2 = a2.YVector
    local v2 = YVector.X * YVector_2.X + YVector.Y * YVector_2.Y + YVector.Z * YVector_2.Z
    local ZVector = a1.ZVector
    local ZVector_2 = a2.ZVector
    local v3 = ZVector.X * ZVector_2.X + ZVector.Y * ZVector_2.Y + ZVector.Z * ZVector_2.Z
    local v4 = v1 + v2 + v3 - 1
    return (atan2(sqrt((max(0, 1 - v4 * v4 * 0.25))), v4 * 0.5))
end

local function fromAxisAngle(a1, a2) -- Line: 70 -- upvalues: cos (val), sin (val) -- types: a1: vector, a2: number
    local v1 = cos(a2)
    local v2 = sin(a2)
    local X = a1.X
    local Y = a1.Y
    local Z = a1.Z
    local v3 = X * Y * (1 - v1)
    local v4 = Y * Z * (1 - v1)
    local v5 = Z * X * (1 - v1)
    local v6 = Vector3.new(X * X * (1 - v1) + v1, v3 + Z * v2, v5 - Y * v2)
    local v7 = Vector3.new(v3 - Z * v2, Y * Y * (1 - v1) + v1, v4 + X * v2)
    local v8 = Vector3.new(v5 + Y * v2, v4 - X * v2, Z * Z * (1 - v1) + v1)
    return CFrame.fromMatrix(Vector3.new(0, 0, 0), v6, v7, v8):Orthonormalize()
end

local function rotateAxis(a1, a2) -- Line: 86 -- upvalues: fromAxisAngle (val) -- types: a1: vector, a2: userdata
    local identity = CFrame.identity
    local Magnitude = a1.Magnitude
    if Magnitude > 1e-06 then
        identity = fromAxisAngle(a1.Unit, Magnitude)
    end
    return identity * a2
end

local function axisAngleDiff(a1, a2) -- Line: 96 -- upvalues: angleDiff (val) -- types: a1: userdata, a2: userdata
    return ((a1 * a2:Inverse()):ToAxisAngle()).Unit * (angleDiff(a1, a2))
end

function u6.getDampingRatio(a1) -- Line: 107
    return a1.dampingRatio
end

function u6.getFrequency(a1) -- Line: 111
    return a1.frequency
end

function u6.getPosition(a1) -- Line: 115
    return a1.position
end

function u6.getVelocity(a1) -- Line: 119
    return a1.velocity
end

function u6.getGoal(a1) -- Line: 123
    return a1.goal
end

function u6.setDampingRatio(a1, a2) -- Line: 127 -- types: a2: number
    a1.dampingRatio = a2
end

function u6.setFrequency(a1, a2) -- Line: 131 -- types: a2: number
    a1.frequency = a2
end

function u6.setPosition(a1, a2) -- Line: 135 -- types: a2: userdata
    a1.position = a2
end

function u6.setVelocity(a1, a2) -- Line: 139 -- types: a2: vector
    a1.velocity = a2
end

function u6.setGoal(a1, a2) -- Line: 143 -- types: a2: userdata
    a1.goal = a2
end

function u6.canSleep(a1) -- Line: 147
    local position = a1.position
    local goal = a1.goal
    local XVector = position.XVector
    local XVector_2 = goal.XVector
    local v1 = XVector.X * XVector_2.X + XVector.Y * XVector_2.Y + XVector.Z * XVector_2.Z
    local YVector = position.YVector
    local YVector_2 = goal.YVector
    local v2 = YVector.X * YVector_2.X + YVector.Y * YVector_2.Y + YVector.Z * YVector_2.Z
    local ZVector = position.ZVector
    local ZVector_2 = goal.ZVector
    local v3 = ZVector.X * ZVector_2.X + ZVector.Y * ZVector_2.Y + ZVector.Z * ZVector_2.Z
    local v4 = 2.9999999695382584 < v1 + v2 + v3
    local v5 = a1.velocity.Magnitude < 0.0017453292519943296
    return v4 and v5
end

function u6.step(a1, a2) -- Line: 153
    -- upvalues: angleDiff (val), exp (val), fromAxisAngle (val), sqrt (val), cos (val), sin (val)
    local v1, v2, v3
    local dampingRatio = a1.dampingRatio
    local v4 = a1.frequency * 6.283185307179586
    local goal = a1.goal
    local position = a1.position
    local velocity = a1.velocity
    local v5 = ((position * goal:Inverse()):ToAxisAngle()).Unit * (angleDiff(position, goal))
    local v6 = exp(-dampingRatio * v4 * a2)
    if dampingRatio == 1 then
        v2 = (v5 * (1 + v4 * a2) + velocity * a2) * v6
        local identity = CFrame.identity
        local Magnitude = v2.Magnitude
        if Magnitude > 1e-06 then
            identity = fromAxisAngle(v2.Unit, Magnitude)
        end
        v3 = identity * goal
        v1 = (velocity * (1 - a2 * v4) - v5 * (a2 * v4 * v4)) * v6
    else
        local v7, v8, v9, v10
        if not (dampingRatio < 1) then
            v2 = sqrt(dampingRatio * dampingRatio - 1)
            v7 = -v4 * (dampingRatio + v2)
            v8 = -v4 * (dampingRatio - v2)
            v9 = (velocity - v5 * v7) / (2 * v4 * v2)
            v10 = (v5 - v9) * exp(v7 * a2)
            local v11 = v9 * exp(v8 * a2)
            local v12 = v10 + v11
            local identity_3 = CFrame.identity
            local Magnitude_3 = v12.Magnitude
            if Magnitude_3 > 1e-06 then
                identity_3 = fromAxisAngle(v12.Unit, Magnitude_3)
            end
            v3 = identity_3 * goal
            v1 = v10 * v7 + v11 * v8
        else
            v2 = sqrt(1 - dampingRatio * dampingRatio)
            v7 = cos(a2 * v4 * v2)
            v8 = sin(a2 * v4 * v2)
            v9 = v8 / (v4 * v2)
            local v13 = v8 / v2
            v10 = (v5 * (v7 + v13 * dampingRatio) + velocity * v9) * v6
            local identity_2 = CFrame.identity
            local Magnitude_2 = v10.Magnitude
            if Magnitude_2 > 1e-06 then
                identity_2 = fromAxisAngle(v10.Unit, Magnitude_2)
            end
            v3 = identity_2 * goal
            v1 = (velocity * (v7 - v13 * dampingRatio) - v5 * (v13 * v4)) * v6
        end
    end
    a1.position = v3
    a1.velocity = v1
    return v3
end

return u6