-- Script path: ReplicatedStorage.Shared.UI.Components.UIParticle.Particle
-- Decompile time: 3.73 ms

require(script.Parent.Types)
local Helpers = require(script.Parent.Helpers)
local Rotate = Helpers.Rotate
local Normalize = Helpers.Normalize
local EvaluateSequence = Helpers.EvaluateSequence
local EvaluateNumberRange = Helpers.EvaluateNumberRange
local u15 = Random.new()
local u16 = {}
u16.__index = u16
local u17 = {Grid2x2 = 2, Grid4x4 = 4, Grid8x8 = 8}

function u16.new(a1) -- Line: 20
    -- upvalues: u16 (val), EvaluateNumberRange (val), Rotate (val), u15 (val), EvaluateSequence (val), u17 (val)
    local v1
    local u4 = setmetatable({}, u16)
    local v2 = a1.Hook.AbsoluteSize.Y * 3.333 * a1.UnitMultiplier
    u4.FlipbookMode = a1.FlipbookMode
    u4.FlipbookFramerate = a1.FlipbookFramerate
    u4.FlipbookSize = a1.FlipbookSize
    u4.Color = a1.Color
    u4.Drag = a1.Drag
    u4.Transparency = a1.Transparency
    u4.Size = a1.Size
    u4.Squash = a1.Squash
    u4.SpreadAngle = EvaluateNumberRange(a1.SpreadAngle)
    u4.Acceleration = Rotate(a1.Acceleration * v2, -u4.SpreadAngle)
    u4.Speed = Vector2.new(EvaluateNumberRange(a1.xSpeed), EvaluateNumberRange(a1.ySpeed)) * v2
    u4.RotSpeed = EvaluateNumberRange(a1.RotSpeed)
    u4.Rotation = EvaluateNumberRange(a1.Rotation)
    u4.Transparency = a1.Transparency
    u4._elapsed = 0
    u4._lifetime = EvaluateNumberRange(a1.Lifetime)
    u4._dead = false
    local AbsolutePosition_2 = a1.Hook.AbsolutePosition
    if a1.EmitterMode ~= "Point" then
        local AbsoluteSize_2 = a1.Hook.AbsoluteSize
        v1 = Vector2.new(AbsolutePosition_2.X + u15:NextNumber(0, AbsoluteSize_2.X), AbsolutePosition_2.Y + u15:NextNumber(0, AbsoluteSize_2.Y))
    else
        local AbsoluteSize = a1.Hook.AbsoluteSize
        v1 = Vector2.new(AbsolutePosition_2.X + AbsoluteSize.X / 2, AbsolutePosition_2.Y + AbsoluteSize.Y / 2)
    end
    local v3 = a1:_acquireElement()
    v3.Size = UDim2.fromOffset(v2, v2)
    v3.AnchorPoint = Vector2.new(0.5, 0.5)
    v3.ZIndex = a1.Hook.ZIndex + a1.ZOffset
    v3.ImageTransparency = EvaluateSequence(u4.Transparency, 0)
    v3.ImageColor3 = EvaluateSequence(u4.Color, 0)
    v3.Visible = true
    v3.Position = UDim2.fromOffset(v1.X, v1.Y)
    v3.Parent = a1.LayerCollector
    if u4.FlipbookMode ~= "None" then
        local v4 = u17[u4.FlipbookMode]
        assert(v4, "Invalid flipbook size")
        u4.FlipbookGridSize = v4
        v3.ImageRectSize = Vector2.new(u4.FlipbookSize / v4, u4.FlipbookSize / v4)
        v3.ImageRectOffset = Vector2.zero
    end
    u4.Element = v3
    u4._emitter = a1
    u4.StartSize = v3.AbsoluteSize
    u4.Position = v1
    if a1.LockedToGui then
        local Hook = a1.Hook
        local AbsolutePosition = Hook.AbsolutePosition
        u4.LockedToGuiUpdate = (Hook:GetPropertyChangedSignal("AbsolutePosition")):Connect(function() -- Line: 92 -- upvalues: Hook (val), AbsolutePosition (ref), u4 (val)
            local AbsolutePosition_2 = Hook.AbsolutePosition
            local v1 = AbsolutePosition_2 - AbsolutePosition
            local v2 = u4
            v2.Position = v2.Position + v1
            u4.Element.Position = UDim2.fromOffset(u4.Position.X, u4.Position.Y)
            AbsolutePosition = AbsolutePosition_2
        end)
    end
    return u4
end

function u16:StepPhysics(a2) -- Line: 106 -- upvalues: Rotate (val) -- types: self: table, a2: number
    local v1 = (Rotate(self.Speed, self.SpreadAngle)) * Vector2.new(1, -1)
    self.Speed = self.Speed * (1 - a2 * self.Drag) + self.Acceleration * a2
    self.Position = self.Position + v1 * a2
    self.Rotation = self.Rotation + self.RotSpeed * a2
end

function u16.Update(a1, a2) -- Line: 113
    -- upvalues: Normalize (val), EvaluateSequence (val)
    a1._elapsed = a1._elapsed + a2
    if not (a1._lifetime <= a1._elapsed) and not a1._dead then
        local v1
        local v2 = Normalize(0, a1._lifetime, a1._elapsed)
        local v3 = EvaluateSequence(a1.Size.X, v2)
        local v4 = EvaluateSequence(a1.Size.Y, v2)
        local v5 = EvaluateSequence(a1.Squash, v2)
        local v6 = math.abs(v5)
        if not (v5 < 0) then
            v4 = v4 * (v6 + 1)
        else
            v3 = v3 * (v6 + 1)
        end
        if v3 and v4 then
            a1.Element.Size = UDim2.fromOffset(a1.StartSize.X * v3, a1.StartSize.Y * v4)
        end
        local v7 = EvaluateSequence(a1.Color, v2)
        if v7 and v7 ~= a1.Element.ImageColor3 then
            a1.Element.ImageColor3 = v7
        end
        a1.Element.ImageTransparency = EvaluateSequence(a1.Transparency, v2)
        if not (a2 > 0.1) then
            a1:StepPhysics(a2)
            v1 = a1
        else
            local v8 = a2
            while v8 > 0 do
                a1:StepPhysics(0.01)
                v8 = v8 - 0.01
            end
        end
        v1.Element.Rotation = v1.Rotation
        v1.Element.Position = UDim2.fromOffset(v1.Position.X, v1.Position.Y)
        local FlipbookGridSize = v1.FlipbookGridSize
        if FlipbookGridSize ~= nil then
            local v9 = v1.FlipbookSize / v1.FlipbookGridSize
            local v10 = (math.floor(v1._elapsed * v1.FlipbookFramerate)) % v1.FlipbookGridSize ^ 2
            local v11 = v10 % FlipbookGridSize
            local v12 = math.floor(v10 / FlipbookGridSize)
            v1.Element.ImageRectOffset = Vector2.new(v9 * v11, v9 * v12)
        end
        return true
    end
    return false
end

function u16:Destroy() -- Line: 171
    if self.LockedToGuiUpdate then
        self.LockedToGuiUpdate:Disconnect()
        self.LockedToGuiUpdate = nil
    end
    local Element = self.Element
    self.Element = nil
    self._dead = true
    if self._emitter and self._emitter._releaseElement and Element then
        self._emitter:_releaseElement(Element)
        return
    end
    if Element then
        Element:Destroy()
    end
end

return u16