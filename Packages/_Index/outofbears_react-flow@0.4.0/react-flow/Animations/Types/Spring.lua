-- Script path: ReplicatedStorage.Packages._Index.outofbears_react-flow@0.4.0.react-flow.Animations.Types.Spring
-- Decompile time: 1.16 ms

local Base = require(script.Parent.Parent.Base)
local Promise = require(script.Parent.Parent.Parent.Promise)
local SpringValue = require(script.Parent.Parent.Parent.Utility.SpringValue)
local Symbols = require(script.Parent.Parent.Symbols)
local u27 = {}
u27.__index = u27

function u27.definition(a1) -- Line: 19 -- upvalues: Symbols (val) -- types: a1: table
    return {Symbols.Spring, a1}
end

function u27.new(a1) -- Line: 26 -- upvalues: Base (val), u27 (val) -- types: a1: table
    local v1 = Base.new()
    local v2 = setmetatable(v1, u27)
    v2.props = a1
    v2.player = nil
    return v2
end

function u27.Play(a1, a2, a3) -- Line: 35
    -- upvalues: Promise (val), SpringValue (val)
    if a1.playing then
        a1:Stop()
    end
    local v1 = a1.props.start or a2
    local target = a1.props.target
    local force = a1.props.force
    assert(v1, "No start value provided")
    assert(target, "No target value provided")
    if v1 == target and not force then
        return Promise.resolve()
    end
    local u36 = SpringValue.new(v1, a1.props.speed, a1.props.damper)
    u36:SetImmediate(a3)
    u36:SetGoal(target)
    u36:SetDelay(a1.props.delay)
    local _oldSpring = a1._oldSpring and a1._oldSpring:GetVelocity()
    if _oldSpring then
        u36:Impulse(_oldSpring)
    end
    if force then
        u36:Impulse(force)
    end
    if a1._oldSpring then
        a1._oldSpring:Destroy()
    end
    local v2 = u36:Run(function() -- Line: 69 -- upvalues: a1 (val), u36 (val)
        if a1.listener then
            a1.listener(u36:GetValue())
        end
    end)
    a1.playing = true
    a1.player = v2
    a1._oldSpring = u36
    return v2
end

function u27:Stop() -- Line: 82
    if not self.playing then
        return
    end
    if self.player then
        self.player:cancel()
        self.player = nil
    end
    self.playing = false
end

return u27