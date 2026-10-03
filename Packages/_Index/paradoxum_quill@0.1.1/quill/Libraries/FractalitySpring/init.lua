-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.Libraries.FractalitySpring
-- Decompile time: 0.88 ms

local RbxLinearSpring = require(script.RbxLinearSpring)
local CFrameSpring = require(script.CFrameSpring)
local u8 = {}
u8.__index = u8
u8.ClassName = "FractalitySpring"

function u8.new(a1, a2, a3, a4) -- Line: 29
    -- upvalues: u8 (val), CFrameSpring (val), RbxLinearSpring (val)
    local v1 = setmetatable({}, u8)
    if typeof(a3) == "CFrame" then
        v1.internal = CFrameSpring.new(a1, a2, a3, a4)
        return v1
    end
    v1.internal = RbxLinearSpring.new(a1, a2, a3, a4)
    return v1
end

function u8:getDampingRatio() -- Line: 50
    return self.internal:getDampingRatio()
end

function u8:getFrequency() -- Line: 54
    return self.internal:getFrequency()
end

function u8:getPosition() -- Line: 58
    return self.internal:getPosition()
end

function u8:getVelocity() -- Line: 62
    return self.internal:getVelocity()
end

function u8:getGoal() -- Line: 66
    return self.internal:getGoal()
end

function u8:setDampingRatio(a2) -- Line: 70 -- types: a2: number
    self.internal:setDampingRatio(a2)
end

function u8:setFrequency(a2) -- Line: 74 -- types: a2: number
    self.internal:setFrequency(a2)
end

function u8:setPosition(a2) -- Line: 78
    self.internal:setPosition(a2)
end

function u8:setVelocity(a2) -- Line: 82 -- types: a2: table
    self.internal:setVelocity(a2)
end

function u8:setGoal(a2) -- Line: 86
    self.internal:setGoal(a2)
end

function u8:canSleep() -- Line: 90
    return self.internal:canSleep()
end

function u8:step(a2) -- Line: 94 -- types: a2: number
    return self.internal:step(a2)
end

return u8