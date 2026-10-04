-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.Libraries.FractalitySpring.CFrameSpring
-- Decompile time: 1.62 ms

local RbxLinearSpring = require(script.Parent.RbxLinearSpring)
local RotationSpring = require(script.Parent.Primitives.RotationSpring)
local u11 = {}
u11.__index = u11
u11.ClassName = "CFrameSpring"

function u11.new(a1, a2, a3, a4) -- Line: 18
    -- upvalues: u11 (val), RbxLinearSpring (val), RotationSpring (val)
    local v1 = setmetatable({}, u11)
    v1.posInternal = RbxLinearSpring.new(a1, a2, a3.Position, a4.Position)
    v1.rotInternal = RotationSpring.new(a1, a2, a3.Rotation, a4.Rotation)
    return v1
end

function u11:getDampingRatio() -- Line: 27
    return self.posInternal:getDampingRatio()
end

function u11:getFrequency() -- Line: 31
    return self.posInternal:getFrequency()
end

function u11:getPosition() -- Line: 35
    local v1 = self.posInternal:getPosition()
    local v2 = self.rotInternal:getPosition()
    return CFrame.new(v1) * v2
end

function u11:getVelocity() -- Line: 42
    local v1 = self.posInternal:getVelocity()
    local v2 = self.rotInternal:getVelocity()
    return {v1[1], v1[2], v1[3], v2.X, v2.Y, v2.Z}
end

function u11:getGoal() -- Line: 49
    local v1 = self.posInternal:getGoal()
    local v2 = self.rotInternal:getGoal()
    return CFrame.new(v1) * v2
end

function u11:setDampingRatio(a2) -- Line: 56 -- types: a2: number
    self.posInternal:setDampingRatio(a2)
    self.rotInternal:setDampingRatio(a2)
end

function u11:setFrequency(a2) -- Line: 61 -- types: a2: number
    self.posInternal:setFrequency(a2)
    self.rotInternal:setFrequency(a2)
end

function u11:setPosition(a2) -- Line: 66 -- types: a2: userdata
    self.posInternal:setPosition(a2.Position)
    self.rotInternal:setPosition(a2.Rotation)
end

function u11:setVelocity(a2) -- Line: 71 -- types: a2: table
    self.posInternal:setVelocity({a2[1], a2[2], a2[3]})
    self.rotInternal:setVelocity((Vector3.new(a2[4], a2[5], a2[6])))
end

function u11:setGoal(a2) -- Line: 76 -- types: a2: userdata
    self.posInternal:setGoal(a2.Position)
    self.rotInternal:setGoal(a2.Rotation)
end

function u11:canSleep() -- Line: 81
    return self.posInternal:canSleep() and self.rotInternal:canSleep()
end

function u11:step(a2) -- Line: 85 -- types: a2: number
    local v1 = self.posInternal:step(a2)
    local v2 = self.rotInternal:step(a2)
    return CFrame.new(v1) * v2
end

return u11