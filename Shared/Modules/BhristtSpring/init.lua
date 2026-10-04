-- Script path: ReplicatedStorage.Shared.Modules.BhristtSpring
-- Decompile time: 3.11 ms

local Eq = require(script:WaitForChild("Eq"))
local sqrt = math.sqrt
local v1 = {}
local u10 = {}

function u10.__index(a1, a2) -- Line: 131 -- upvalues: sqrt (val), u10 (val)
    local v1 = {
        Offset = function() -- Line: 133 -- upvalues: a1 (val)
            return (a1.F.Offset(tick() - a1.StartTick))
        end,
        Velocity = function() -- Line: 139 -- upvalues: a1 (val)
            return (a1.F.Velocity(tick() - a1.StartTick))
        end,
        Acceleration = function() -- Line: 145 -- upvalues: a1 (val)
            return (a1.F.Acceleration(tick() - a1.StartTick))
        end,
        Goal = function() -- Line: 151 -- upvalues: a1 (val)
            return a1.ExternalForce / a1.Constant
        end,
        Frequency = function() -- Line: 156 -- upvalues: a1 (val), sqrt (upval)
            local Damping = a1.Damping
            local Constant = a1.Constant
            local Mass = a1.Mass
            local v1 = -Damping * Damping + 4 * Constant / Mass
            return sqrt(v1) / 6.283185307179586
        end,
    }
    local v2 = rawget(a1, a2)
    if v2 ~= nil then
        return v2
    end
    local v3 = v1[a2]
    if v3 ~= nil then
        return v3()
    end
    return u10[a2]
end

function u10.__tostring(a1) -- Line: 174
    local v1 = tick() - a1.StartTick
    local F = a1.F
    local AdvancedObjectStringEnabled = a1.AdvancedObjectStringEnabled
    local v2 = nil
    if AdvancedObjectStringEnabled == false then
        return (string.format(
            ".\n------------------------\nSPRING PROPERTIES BASIC:\n------------------------\n[DELTA PROPERTIES]:\n\t--> [OFFSET]: %.3f\n\t--> [VELOCITY]: %.3f\n\t--> [ACCELERATION]: %.3f\n",
            F.Offset(v1),
            F.Velocity(v1),
            F.Acceleration(v1)
        ))
    end
    if AdvancedObjectStringEnabled == true then
        v2 = string.format(
            ".\n---------------------------\nSPRING PROPERTIES ADVANCED:\n---------------------------\n[BASE PROPERTIES]:\n\t--> MASS: %.3f\n\t--> DAMPING: %.3f\n\t--> STIFFNESS: %.3f\n\t--> GOAL: %.3f\n\t--> FREQUENCY: %.3f\n\t--> INITIAL OFFSET: %.3f\n\t--> INITIAL VELOCITY: %.3f\n\t--> EXTERNAL FORCE: %.3f\n\t--> START TICK: %f\n[DELTA PROPERTIES]:\n\t--> [OFFSET]: %.3f\n\t--> [VELOCITY]: %.3f\n\t--> [ACCELERATION]: %.3f\n",
            a1.Mass,
            a1.Damping,
            a1.Constant,
            a1.Goal,
            a1.Frequency,
            a1.InitialOffset,
            a1.InitialVelocity,
            a1.ExternalForce,
            a1.StartTick,
            F.Offset(v1),
            F.Velocity(v1),
            F.Acceleration(v1)
        )
    end
    return v2
end

function v1.new(a1, a2, a3, a4, a5, a6) -- Line: 210
    -- upvalues: u10 (val)
    assert(a1 > 0, "Mass for spring system cannot be less than or equal to 0")
    assert(a3 > 0, "Spring constant for spring system cannot be less than or equal to 0")
    local v1 = a6 or 0
    local v2 = v1 * a3
    local v3 = {
        AdvancedObjectStringEnabled = false,
        StartTick = 0,
        Mass = a1,
        Damping = a2,
        Constant = a3,
        InitialOffset = (a4 or 0) - v1,
        InitialVelocity = a5 or 0,
        ExternalForce = v2,
    }
    setmetatable(v3, u10)
    v3:Reset()
    return v3
end

function v1.fromFrequency(a1, a2, a3, a4, a5, a6) -- Line: 256
    -- upvalues: u10 (val)
    assert(a1 > 0, "Mass for spring system cannot be less than or equal to 0")
    assert(a3 > 0, "Spring frequency for spring system cannot be less than or equal to 0")
    local v1 = a1 * 0.25 * (39.47841760435743 * a3 * a3 + a2 * a2)
    local v2 = a6 or 0
    local v3 = v2 * v1
    local v4 = {
        AdvancedObjectStringEnabled = false,
        StartTick = 0,
        Mass = a1,
        Damping = a2,
        Constant = v1,
        InitialOffset = (a4 or 0) - v2,
        InitialVelocity = a5 or 0,
        ExternalForce = v3,
    }
    setmetatable(v4, u10)
    v4:Reset()
    return v4
end

function u10:Reset() -- Line: 300 -- upvalues: Eq (val)
    self.F = Eq.F(self)
    self.StartTick = tick()
end

function u10.SetExternalForce(a1, a2) -- Line: 309 -- types: a1: table, a2: number
    a1.ExternalForce = a2
    a1.InitialOffset = a1.Offset - a2 / a1.Constant
    a1.InitialVelocity = a1.Velocity
    a1:Reset()
end

function u10.SetGoal(a1, a2) -- Line: 321 -- types: a1: table, a2: number
    a1.ExternalForce = a2 * a1.Constant
    a1.InitialOffset = a1.Offset - a2
    a1.InitialVelocity = a1.Velocity
    a1:Reset()
end

function u10.SetFrequency(a1, a2) -- Line: 334 -- types: a1: table, a2: number
    a1.Constant = 0.25 * a1.Mass * (39.47841760435743 * a2 * a2 + a1.Damping * a1.Damping)
    a1.InitialOffset = a1.Offset
    a1.InitialVelocity = a1.Velocity
    a1:Reset()
end

function u10.SnapToCriticalDamping(a1) -- Line: 349 -- upvalues: sqrt (val)
    a1.Damping = sqrt(a1.Constant / a1.Mass) * 2
    a1.InitialOffset = a1.Offset
    a1.InitialVelocity = a1.Velocity
    a1:Reset()
end

function u10.SetOffset(a1, a2, a3) -- Line: 360 -- types: a1: table, a2: number, a3: boolean?
    a1.InitialOffset = a2 - a1.Goal
    a1.InitialVelocity = if not a3 then a1.Velocity else 0
    a1:Reset()
end

function u10.AddOffset(a1, a2) -- Line: 370 -- types: a1: table, a2: number
    a1.InitialOffset = a1.Offset + a2
    a1.InitialVelocity = a1.Velocity
    a1:Reset()
end

function u10.SetVelocity(a1, a2) -- Line: 380 -- types: a1: table, a2: number
    a1.InitialOffset = a1.Offset
    a1.InitialVelocity = a2
    a1:Reset()
end

function u10.AddVelocity(a1, a2) -- Line: 390 -- types: a1: table, a2: number
    a1.InitialOffset = a1.Offset
    a1.InitialVelocity = a1.Velocity + a2
    a1:Reset()
end

function u10.Print(a1) -- Line: 398
    local v1 = tostring(a1)
    print(v1)
end

return v1