-- Script path: ReplicatedStorage.Shared.Modules.BhristtSpring.Eq
-- Decompile time: 2.57 ms

local v1 = {}

function OverDamping(a1, a2, a3, a4, a5, a6) -- Line: 33
    -- upvalues: 
    local v1 = a2 * a2 - a3 * 4 / a1
    local v2 = a2 + math.sqrt(v1)
    local v3 = a2 - math.sqrt(v1)
    local u18 = v2 * -0.5
    local u19 = v3 * -0.5
    local u23 = (u19 * a4 - a5) / (u19 - u18)
    local u27 = (u18 * a4 - a5) / (u18 - u19)
    local u28 = a6 / a3
    return {
        Offset = function(a1) -- Line: 50 -- upvalues: u23 (val), u18 (val), u27 (val), u19 (val), u28 (val)
            return u23 * math.exp(u18 * a1) + u27 * math.exp(u19 * a1) + u28
        end,
        Velocity = function(a1) -- Line: 53 -- upvalues: u23 (val), u18 (val), u27 (val), u19 (val)
            return u23 * u18 * math.exp(u18 * a1) + u27 * u19 * math.exp(u19 * a1)
        end,
        Acceleration = function(a1) -- Line: 56 -- upvalues: u23 (val), u18 (val), u27 (val), u19 (val)
            return u23 * u18 * u18 * math.exp(u18 * a1) + u27 * u19 * u19 * math.exp(u19 * a1)
        end,
    }
end

function CriticalDamping(a1, a2, a3, a4, a5, a6) -- Line: 62
    -- upvalues: 
    local u7 = -a2 / 2
    local u8 = a4
    local u10 = a5 - u7 * a4
    local u11 = a6 / a3
    return {
        Offset = function(a1) -- Line: 75 -- upvalues: u7 (val), u8 (val), u10 (val), u11 (val)
            return (math.exp(u7 * a1)) * (u8 + u10 * a1) + u11
        end,
        Velocity = function(a1) -- Line: 78 -- upvalues: u7 (val), u10 (val), u8 (val)
            return (math.exp(u7 * a1)) * (u10 * u7 * a1 + u8 * u7 + u10)
        end,
        Acceleration = function(a1) -- Line: 81 -- upvalues: u7 (val), u10 (val), u8 (val)
            return u7 * math.exp(u7 * a1) * (u10 * u7 * a1 + u8 * u7 + u10 * 2)
        end,
    }
end

function UnderDamping(a1, a2, a3, a4, a5, a6) -- Line: 87
    -- upvalues: 
    local v1 = a2 * a2 - a3 * 4 / a1
    local u11 = -a2 / 2
    local u14 = math.sqrt(-v1)
    local u15 = a4
    local u18 = (a5 - u11 * a4) / u14
    local u19 = a6 / a3
    return {
        Offset = function(a1) -- Line: 102 -- upvalues: u11 (val), u15 (val), u14 (val), u18 (val), u19 (val)
            return (math.exp(u11 * a1)) * (u15 * math.cos(u14 * a1) + u18 * math.sin(u14 * a1)) + u19
        end,
        Velocity = function(a1) -- Line: 105 -- upvalues: u11 (val), u15 (val), u14 (val), u18 (val)
            return -math.exp(u11 * a1) * ((u15 * u14 - u18 * u11) * math.sin(u14 * a1) + (-u18 * u14 - u15 * u11) * math.cos(u14 * a1))
        end,
        Acceleration = function(a1) -- Line: 109 -- upvalues: u11 (val), u18 (val), u14 (val), u15 (val)
            return -math.exp(u11 * a1) * ((u18 * u14 * u14 + u15 * 2 * u11 * u14 - u18 * u11 * u11) * math.sin(u14 * a1) + (u15 * u14 * u14 - u18 * 2 * u11 * u14 - u15 * u11 * u11) * math.cos(u14 * a1))
        end,
    }
end

function v1.F(a1) -- Line: 119 -- types: a1: table
    local InitialOffset = a1.InitialOffset
    local InitialVelocity = a1.InitialVelocity
    local ExternalForce = a1.ExternalForce
    local Mass = a1.Mass
    local Damping = a1.Damping
    local Constant = a1.Constant
    local v1 = Damping * Damping - Constant * 4 / Mass
    if v1 > 0 then
        return OverDamping(Mass, Damping, Constant, InitialOffset, InitialVelocity, ExternalForce)
    end
    if v1 == 0 then
        return CriticalDamping(Mass, Damping, Constant, InitialOffset, InitialVelocity, ExternalForce)
    end
    return UnderDamping(Mass, Damping, Constant, InitialOffset, InitialVelocity, ExternalForce)
end

return v1