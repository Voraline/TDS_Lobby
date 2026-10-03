-- Script path: ReplicatedStorage.Packages._Index.egomoose_fractality-spring@0.2.0.fractality-spring.RbxLinearSpring
-- Decompile time: 1.09 ms

local LinearSpring = require(script.Parent.Primitives.LinearSpring)
local Conversion = require(script.Conversion)
local u10 = {}
u10.__index = u10
u10.ClassName = "RbxLinearSpring"

function u10.new(a1, a2, a3, a4) -- Line: 25
    -- upvalues: u10 (val), Conversion (val), LinearSpring (val)
    local v1 = setmetatable({}, u10)
    v1.metaType = typeof(a3)
    v1.converter = Conversion[v1.metaType]
    v1.internal = LinearSpring.new(a1, a2, v1.converter.serialize(a3), (v1.converter.serialize(a4)))
    return v1
end

function u10:getDampingRatio() -- Line: 41
    return self.internal:getDampingRatio()
end

function u10:getFrequency() -- Line: 45
    return self.internal:getFrequency()
end

function u10.getPosition(a1) -- Line: 49
    return a1.converter.deserialize(a1.internal.position)
end

function u10:getVelocity() -- Line: 53
    return self.internal:getVelocity()
end

function u10:getGoal() -- Line: 57
    return self.converter.deserialize(self.internal:getGoal())
end

function u10:setDampingRatio(a2) -- Line: 61 -- types: a2: number
    self.internal:setDampingRatio(a2)
end

function u10:setFrequency(a2) -- Line: 65 -- types: a2: number
    self.internal:setFrequency(a2)
end

function u10:setPosition(a2) -- Line: 69
    self.internal:setPosition((self.converter.serialize(a2)))
end

function u10:setVelocity(a2) -- Line: 73 -- types: a2: table
    self.internal:setVelocity(a2)
end

function u10:setGoal(a2) -- Line: 77
    self.internal:setGoal((self.converter.serialize(a2)))
end

function u10:canSleep() -- Line: 81
    return self.internal:canSleep()
end

function u10:step(a2) -- Line: 85 -- types: a2: number
    return self.converter.deserialize(self.internal:step(a2))
end

return u10