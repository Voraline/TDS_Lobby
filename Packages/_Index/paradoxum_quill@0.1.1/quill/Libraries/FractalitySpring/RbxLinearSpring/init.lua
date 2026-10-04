-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.Libraries.FractalitySpring.RbxLinearSpring
-- Decompile time: 1.05 ms

local LinearSpring = require(script.Parent.Primitives.LinearSpring)
local Conversion = require(script.Conversion)
local u10 = {}
u10.__index = u10
u10.ClassName = "RbxLinearSpring"

function u10.new(a1, a2, a3, a4) -- Line: 21
    -- upvalues: u10 (val), Conversion (val), LinearSpring (val)
    local v1 = setmetatable({}, u10)
    v1.metaType = typeof(a3)
    v1.converter = Conversion[v1.metaType]
    v1.internal = LinearSpring.new(a1, a2, v1.converter.serialize(a3), (v1.converter.serialize(a4)))
    return v1
end

function u10:getDampingRatio() -- Line: 35
    return self.internal:getDampingRatio()
end

function u10:getFrequency() -- Line: 39
    return self.internal:getFrequency()
end

function u10.getPosition(a1) -- Line: 43
    return a1.converter.deserialize(a1.internal.position)
end

function u10:getVelocity() -- Line: 47
    return self.internal:getVelocity()
end

function u10:getGoal() -- Line: 51
    return self.converter.deserialize(self.internal:getGoal())
end

function u10:setDampingRatio(a2) -- Line: 55 -- types: a2: number
    self.internal:setDampingRatio(a2)
end

function u10:setFrequency(a2) -- Line: 59 -- types: a2: number
    self.internal:setFrequency(a2)
end

function u10:setPosition(a2) -- Line: 63
    self.internal:setPosition((self.converter.serialize(a2)))
end

function u10:setVelocity(a2) -- Line: 67 -- types: a2: table
    self.internal:setVelocity(a2)
end

function u10:setGoal(a2) -- Line: 71
    self.internal:setGoal((self.converter.serialize(a2)))
end

function u10:canSleep() -- Line: 75
    return self.internal:canSleep()
end

function u10:step(a2) -- Line: 79 -- types: a2: number
    return self.converter.deserialize(self.internal:step(a2))
end

return u10