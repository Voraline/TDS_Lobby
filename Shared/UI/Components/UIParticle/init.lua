-- Script path: ReplicatedStorage.Shared.UI.Components.UIParticle
-- Decompile time: 3.08 ms

game:GetService("RunService")
local Colllector = require(script.Colllector)
local Particle = require(script.Particle)
require(script.Types)
local u17 = {}
u17.__index = u17

function u17.fromEmitter3D(a1, a2, a3) -- Line: 12
    -- upvalues: u17 (val), Colllector (val)
    local v1 = setmetatable({}, u17)
    v1._elapsed = 0
    v1._dead = false
    v1._particles = {}
    v1._elementPool = {}
    v1.Hook = a1
    v1.Enabled = false
    v1.LayerCollector = Colllector(a1)
    v1.LayerCollector.Name = ("%*Particles"):format(a2.Name)
    local LayerCollector_2 = v1.LayerCollector
    LayerCollector_2.ZIndex = LayerCollector_2.ZIndex + a2.ZOffset
    v1.UnitMultiplier = a3 or 1
    v1.MaxParticles = a2:GetAttribute("MaxParticles") or 150
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Name = "Particle"
    ImageLabel.Size = UDim2.fromOffset(1, 1)
    ImageLabel.Image = a2.Texture
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Visible = false
    v1.Element = ImageLabel
    v1._ownsElement = true
    v1.Rate = a2.Rate
    v1.Drag = a2.Drag
    v1.Color = a2.Color
    v1.Squash = a2.Squash
    v1.Size = {X = a2.Size, Y = a2.Size}
    v1.Transparency = a2.Transparency
    v1.ZOffset = a2.ZOffset
    v1.xSpeed = NumberRange.new(0, 0)
    v1.ySpeed = NumberRange.new(a2.Speed.Min, a2.Speed.Max)
    v1.SpreadAngle = NumberRange.new(-math.abs(a2.SpreadAngle.X), (math.abs(a2.SpreadAngle.X)))
    v1.RotSpeed = a2.RotSpeed
    v1.Lifetime = a2.Lifetime
    v1.Acceleration = Vector2.new(a2.Acceleration.X, a2.Acceleration.Y)
    v1.LockedToGui = a2.LockedToPart
    v1.Rotation = a2.Rotation
    v1.FlipbookSize = a2:GetAttribute("FlipbookSize") or 1024
    v1.FlipbookMode = a2.FlipbookLayout.Name
    v1.FlipbookFramerate = a2.FlipbookFramerate.Max
    v1.EmitterMode = if a2.ShapeStyle ~= Enum.ParticleEmitterShapeStyle.Volume then "Point" else "Fill"
    v1:Step(0)
    return v1
end

function u17.new(a1, a2, a3) -- Line: 71
    -- upvalues: u17 (val), Colllector (val)
    local v1 = setmetatable({}, u17)
    v1._elapsed = 0
    v1._dead = false
    v1._particles = {}
    v1._elementPool = {}
    v1.Hook = a1
    v1.Enabled = false
    v1.LayerCollector = Colllector(a1)
    v1.Element = a2
    v1._ownsElement = false
    v1.EmitterMode = "Point"
    v1.FlipbookMode = "None"
    v1.LockedToGui = false
    v1.UnitMultiplier = a3 or 1
    v1.MaxParticles = 150
    v1.Rate = 20
    v1.Drag = 0
    v1.Color = ColorSequence.new(Color3.new(1, 1, 1))
    v1.Size = {X = NumberSequence.new(1), Y = NumberSequence.new(1)}
    v1.Transparency = NumberSequence.new(0)
    v1.Squash = NumberSequence.new(0)
    v1.SpreadAngle = NumberRange.new(-15, 15)
    v1.Acceleration = Vector2.new(0, -500)
    v1.Lifetime = NumberRange.new(5, 10)
    v1.RotSpeed = NumberRange.new(0)
    v1.Rotation = NumberRange.new(0)
    v1.ZOffset = 0
    v1.xSpeed = NumberRange.new(0, 0)
    v1.ySpeed = NumberRange.new(150, 500)
    v1:Step(0)
    return v1
end

function u17._acquireElement(a1) -- Line: 114
    local v1 = table.remove(a1._elementPool)
    if v1 then
        return v1
    end
    return a1.Element:Clone()
end

function u17._releaseElement(a1, a2) -- Line: 123 -- types: a1: table, a2: userdata
    a2.Visible = false
    a2.Parent = nil
    if not a1._dead and not (a1.MaxParticles <= #a1._elementPool) then
        table.insert(a1._elementPool, a2)
        return
    end
    a2:Destroy()
end

function u17:_insertParticle(a2) -- Line: 135
    local v1
    if self.MaxParticles <= 0 then
        a2:Destroy()
        return
    end
    local v2, v3 = self, a2
    while true do
        if not (v2.MaxParticles <= #v2._particles) then
            break
        end
        v1 = table.remove(v2._particles, 1)
        if v1 then
            v1:Destroy()
        end
    end
    table.insert(v2._particles, v3)
end

function u17.Clear(a1) -- Line: 151
    for i, v in ipairs(a1._particles) do
        v:Destroy()
    end
    a1._particles = {}
end

function u17:Step(a2) -- Line: 159 -- upvalues: Particle (val) -- types: self: table, a2: number
    local v1
    self._elapsed = self._elapsed + a2
    for i = #self._particles, 1, -1 do
        v1 = self._particles[i]
        if v1 and not v1:Update(a2) then
            v1:Destroy()
            table.remove(self._particles, i)
        end
    end
    if 0 < self.Rate and not self._dead and self.Enabled then
        local _elapsed_2, v2, v3
        local _elapsed = self._elapsed
        while true do
            _elapsed_2 = self._elapsed
            if not (1 / self.Rate <= _elapsed_2) then
                break
            end
            v2 = _elapsed - self._elapsed
            self._elapsed = self._elapsed - 1 / self.Rate
            if not (self.Lifetime.Max <= v2) then
                v3 = Particle.new(self)
                if not v3:Update(v2) then
                    v3:Destroy()
                else
                    self:_insertParticle(v3)
                end
            end
        end
        return
    end
end

function u17.Emit(a1, a2) -- Line: 198 -- upvalues: Particle (val) -- types: a1: table, a2: number
    for i = 1, (math.max(math.floor(a2), 0)) do
        a1:_insertParticle((Particle.new(a1)))
    end
end

function u17:Destroy() -- Line: 205
    if self._dead then
        error("Cannot destroy dead particle emitter.")
        return
    end
    self._dead = true
    for i, v in ipairs(self._particles) do
        if v then
            v:Destroy()
        end
    end
    self._particles = {}
    for i2, i3 in ipairs(self._elementPool) do
        i3:Destroy()
    end
    self._elementPool = {}
    if self.LayerCollector then
        self.LayerCollector:Destroy()
        self.LayerCollector = nil
    end
    if self._ownsElement and self.Element then
        self.Element:Destroy()
    end
end

return u17