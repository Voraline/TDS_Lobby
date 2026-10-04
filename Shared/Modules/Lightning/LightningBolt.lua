-- Script path: ReplicatedStorage.Shared.Modules.Lightning.LightningBolt
-- Decompile time: 13.13 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local clock = os.clock
local u25 = CFrame.new(1000000, 1000000, 1000000)
local u26 = {}
local LightningStorage = workspace:FindFirstChild("LightningStorage")
if not LightningStorage then
    LightningStorage = Instance.new("Folder")
    LightningStorage.Name = "LightningStorage"
    LightningStorage.Parent = workspace
end

local function buildChain(a1) -- Line: 28 -- upvalues: LightningStorage (ref), u25 (val) -- types: a1: number
    local Attachment, Beam
    local v1 = table.create(a1 + 1)
    local v2 = a1 + 1
    for i = 1, v2 do
        Attachment = Instance.new("Attachment")
        Attachment.Name = ("LB_Att_%d"):format(i)
        Attachment.Parent = LightningStorage
        Attachment.CFrame = u25
        v1[i] = Attachment
    end
    v2 = table.create(a1)
    for j = 1, a1 do
        Beam = Instance.new("Beam")
        Beam.Name = ("LB_Beam_%d"):format(j)
        Beam.Attachment0 = v1[j]
        Beam.Attachment1 = v1[j + 1]
        Beam.Segments = 1
        Beam.FaceCamera = true
        Beam.Brightness = 2
        Beam.LightEmission = 1
        Beam.Color = ColorSequence.new(Color3.new(1, 1, 1))
        Beam.Transparency = NumberSequence.new(1)
        Beam.Parent = LightningStorage
        v2[j] = Beam
    end
    return v1, v2
end

local function poolAcquire(a1) -- Line: 57 -- upvalues: u26 (val), buildChain (val) -- types: a1: number
    local v1 = u26[a1]
    if not v1 then
        u26[a1] = {inUse = 0, free = {}}
    end
    local v2 = table.remove(v1.free)
    if not v2 then
        v1.inUse = v1.inUse + 1
        return buildChain(a1)
    end
    v1.inUse = v1.inUse + 1
    for i, j in v2.beams do
        j.Transparency = NumberSequence.new(0)
    end
    return v2.atts, v2.beams
end

local function poolRelease(a1, a2, a3) -- Line: 78
    -- upvalues: u26 (val), u25 (val)
    local v1 = u26[a1]
    if not v1 then
        u26[a1] = {inUse = 0, free = {}}
    end
    for i, j in a3 do
        j.Transparency = NumberSequence.new(1)
    end
    for k, n in a2 do
        n.CFrame = u25
    end
    v1.inUse = math.max(0, v1.inUse - 1)
    table.insert(v1.free, {atts = a2, beams = a3})
end

local function CubicBezier(a1, a2, a3, a4, a5) -- Line: 97
    -- upvalues: 
    return a2 * (1 - a1) ^ 3 + a3 * 3 * a1 * (1 - a1) ^ 2 + a4 * 3 * (1 - a1) * a1 ^ 2 + a5 * a1 ^ 3
end

local function DiscretePulse(a1, a2, a3, a4, a5, a6, a7) -- Line: 110
    -- upvalues: 
    return (math.clamp(a4 / (a5 * 2) - math.abs((a1 - a2 * a3 + a4 * 0.5) / a5), a6, a7))
end

local function ExtrudeCenter(a1) -- Line: 126 -- types: a1: number
    return (math.exp((a1 - 0.5) ^ 10 * -5000))
end

local function NoiseBetween(a1, a2, a3, a4, a5) -- Line: 130
    -- upvalues: 
    return a4 + (a5 - a4) * (math.noise(a1, a2, a3) + 0.5)
end

local u48 = {}
local u49 = {__type = "LightningBolt"}
u49.__index = u49
u49.DISABLE_TRANSPARENCY = false

function u49.new(a1, a2, a3) -- Line: 200
    -- upvalues: u49 (val), CubicBezier (val), DiscretePulse (val), ExtrudeCenter (val), poolAcquire (val), clock (val)
    -- upvalues: u48 (val)
    local v1 = setmetatable({}, u49)
    v1.Enabled = true
    v1.Attachment0 = a1
    v1.Attachment1 = a2
    v1.CurveSize0 = 0
    v1.CurveSize1 = 0
    v1.MinRadius = 0
    v1.MaxRadius = 2.4
    v1.Frequency = 1
    v1.AnimationSpeed = 7
    v1.Thickness = 1
    v1.MinThicknessMultiplier = 0.2
    v1.MaxThicknessMultiplier = 1
    v1.MinTransparency = 0
    v1.MaxTransparency = 1
    v1.PulseSpeed = 2
    v1.PulseLength = 1000000
    v1.FadeLength = 0.2
    v1.ContractFrom = 0.5
    v1.Color = Color3.new(1, 1, 1)
    v1.ColorOffsetSpeed = 3
    v1.SpaceCurveFunction = CubicBezier
    v1.OpacityProfileFunction = DiscretePulse
    v1.RadialProfileFunction = ExtrudeCenter
    local v2, v3 = poolAcquire(a3 or 30)
    v1.__Attachments = v2
    v1._Parts = v3
    v1._PartsHidden = false
    v1._DisabledTransparency = 1
    v1._StartT = clock()
    v1._RanNum = math.random() * 100
    v1._RefIndex = #u48 + 1
    v1._PrevOpacity = {}
    u48[v1._RefIndex] = v1
    return v1
end

function u49:Destroy() -- Line: 249 -- upvalues: u48 (val), poolRelease (val)
    u48[self._RefIndex] = nil
    if self._Parts and self.__Attachments and #self._Parts > 0 then
        poolRelease(#self._Parts, self.__Attachments, self._Parts)
    end
    self._Parts = {}
    self.__Attachments = {}
end

local u55 = {}

function u49.DestroyDissipate(a1, a2, a3) -- Line: 262
    -- upvalues: clock (val), GameState (val), u55 (val)
    local u19
    local u3 = a2 or 0.2
    local u4 = a3 or 0.5
    local u6 = clock()
    local MinTransparency = a1.MinTransparency
    local ContractFrom = a1.ContractFrom
    local u15 = a1.ContractFrom + 1 / (#a1._Parts * a1.FadeLength)
    local MaxRadius = a1.MaxRadius
    local MinThicknessMultiplier = a1.MinThicknessMultiplier

    function u19() -- Line: 273
        -- upvalues: clock (upval), u6 (val), GameState (upval), a1 (val), MinThicknessMultiplier (val), u3 (ref)
        -- upvalues: MinTransparency (val), ContractFrom (val), u15 (val), MaxRadius (val), u4 (ref), u55 (upval)
        -- upvalues: u19 (ref)
        local v1
        local v2 = (clock() - u6) * GameState.TimeScale
        a1.MinThicknessMultiplier = MinThicknessMultiplier + (-2 - MinThicknessMultiplier) * v2 / u3
        if v2 < u3 * 0.4 then
            v1 = v2 / (u3 * 0.4)
            a1.MinTransparency = MinTransparency + (ContractFrom - MinTransparency) * v1
            return
        end
        if not (v2 < u3) then
            if (clock() - a1._StartT) * GameState.TimeScale < (a1.PulseLength + 1) / a1.PulseSpeed then
                a1:Destroy()
            end
            u55[u19] = nil
            return
        end
        v1 = (v2 - u3 * 0.4) / (u3 * 0.6)
        a1.MinTransparency = ContractFrom + (u15 - ContractFrom) * v1
        a1.MaxRadius = MaxRadius * (1 + u4 * v1)
        a1.MinRadius = a1.MinRadius + (a1.MaxRadius - a1.MinRadius) * v1
    end

    u55[u19] = true
end

function u49:_UpdateGeometry(a2, a3, a4, a5, a6, a7, a8) -- Line: 302
    -- upvalues: u49 (val)
    local v1 = self.OpacityProfileFunction(
        a4,
        a5,
        self.PulseSpeed,
        self.PulseLength,
        self.FadeLength,
        1 - self.MaxTransparency,
        1 - self.MinTransparency
    )
    local v2 = self.Thickness * a6 * v1
    v1 = v2 > 0 and v1 or 0
    local v3 = 1 - self.ContractFrom
    local v4 = #self._Parts
    local v5 = self._PrevOpacity[a3] or 0
    if a3 == 1 then
        self.__Attachments[1].WorldCFrame = CFrame.new(a7)
    end
    local v6 = self.__Attachments[a3 + 1]
    v6.WorldCFrame = CFrame.new(a8)
    if v3 < v1 then
        v6 = math.abs(v1 - v5)
        if v6 > 0.05 then
            v6 = if not u49.DISABLE_TRANSPARENCY then 1 - v1 else 0
            a2.Transparency = NumberSequence.new(v6)
            self._PrevOpacity[a3] = v1
        end
        a2.Width0 = v2
        a2.Width1 = v2
    elseif not (v3 - 1 / (v4 * self.FadeLength) < v1) then
        a2.Transparency = NumberSequence.new(1)
    else
        local v7 = 1 - (v1 - (v3 - 1 / (v4 * self.FadeLength))) * v4 * self.FadeLength
        local v8 = v2 * (1 - math.abs(v7 * (if not (a4 < a5 * self.PulseSpeed - 0.5 * self.PulseLength) then -1 else 1)))
        a2.Width0 = v8
        a2.Width1 = v8
        local v9 = math.abs(v1 - v5)
        if v9 > 0.05 then
            v9 = if not u49.DISABLE_TRANSPARENCY then 1 - v1 else 0
            a2.Transparency = NumberSequence.new(v9)
            self._PrevOpacity[a3] = v1
        end
    end
    return nil
end

function u49:_UpdateColor(a2, a3, a4) -- Line: 379 -- types: self: table, a2: userdata, a3: number, a4: number
    local v1
    if typeof(self.Color) == "Color3" then
        a2.Color = ColorSequence.new(self.Color)
        return
    end
    local v2 = (self._RanNum + a3 - a4 * self.ColorOffsetSpeed) % 1
    local Keypoints = self.Color.Keypoints
    local v3 = #Keypoints - 1
    for i = 1, v3 do
        if Keypoints[i].Time < v2 and v2 < Keypoints[i + 1].Time then
            v1 = Keypoints[i].Value:lerp(Keypoints[i + 1].Value, (v2 - Keypoints[i].Time) / (Keypoints[i + 1].Time - Keypoints[i].Time))
            a2.Color = ColorSequence.new(v1)
            return
        end
    end
end

function u49:_Disable() -- Line: 398
    self.Enabled = false
    for i, v in ipairs(self._Parts) do
        v.Transparency = NumberSequence.new(self._DisabledTransparency)
    end
end

local u61 = 0
Scheduler.add("LightningBolt", RunService.Heartbeat, function() -- Line: 410 -- upvalues: u61 (ref), u48 (val), clock (val), GameState (val), u55 (val)
    local AnimationSpeed, Attachment0, Attachment1, CurveSize0, CurveSize1, Frequency, MaxRadius, MaxThicknessMultiplier, MinRadius, MinThicknessMultiplier, Position, RadialProfileFunction, SpaceCurveFunction, WorldPosition, WorldPosition_2, _Parts, _RanNum, lshift, lshift_2, lshift_3, lshift_4, rshift, rshift_2, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, xorShift
    u61 = u61 + 1
    if u61 % 2 ~= 0 then
        return
    end
    debug.profilebegin("LightningBolt")
    if not next(u48) then
        debug.profileend()
        return
    end
    for k, v in pairs(u48) do
        if v.Enabled == true then
            v._PartsHidden = false
            MinRadius = v.MinRadius
            MaxRadius = v.MaxRadius
            _Parts = v._Parts
            v16 = #_Parts
            _RanNum = v._RanNum
            AnimationSpeed = v.AnimationSpeed
            Frequency = v.Frequency
            MinThicknessMultiplier = v.MinThicknessMultiplier
            MaxThicknessMultiplier = v.MaxThicknessMultiplier
            v1 = (clock() - v._StartT) * GameState.TimeScale
            SpaceCurveFunction = v.SpaceCurveFunction
            RadialProfileFunction = v.RadialProfileFunction
            v2 = (v.PulseLength + 1) / v.PulseSpeed
            Attachment0 = v.Attachment0
            Attachment1 = v.Attachment1
            CurveSize0 = v.CurveSize0
            CurveSize1 = v.CurveSize1
            WorldPosition = Attachment0.WorldPosition
            v3 = Attachment0.WorldPosition + Attachment0.WorldAxis * CurveSize0
            v4 = Attachment1.WorldPosition - Attachment1.WorldAxis * CurveSize1
            WorldPosition_2 = Attachment1.WorldPosition
            v5 = SpaceCurveFunction(0, WorldPosition, v3, v4, WorldPosition_2)
            v6 = AnimationSpeed * -v1 + _RanNum * 4
            v7 = 5 * (AnimationSpeed * 0.01 * -v1 / 10) + _RanNum * 4
            if not (v1 < v2) then
                v:Destroy()
            else
                for i = 1, v16 do
                    v8 = _Parts[i]
                    v9 = i / v16
                    v10 = v6 + Frequency * 10 * v9 - 0.2
                    v11 = v7 + Frequency * v9
                    v12 = (MinRadius + (MaxRadius - MinRadius) * (math.noise(3.4, v11, v10) + 0.5)) * RadialProfileFunction(v9)
                    v13 = MinThicknessMultiplier + (MaxThicknessMultiplier - MinThicknessMultiplier) * (math.noise(2.3, v11, v10) + 0.5)
                    local u152 = bit32.band(bit32.bxor(math.floor(_RanNum * 1000000) + i, 305419896), 4294967295)

                    function xorShift() -- Line: 482 -- upvalues: u152 (ref)
                        u152 = bit32.band(bit32.bxor(u152, (bit32.lshift(u152, 13))), 4294967295)
                        u152 = bit32.band(bit32.bxor(u152, (bit32.rshift(u152, 17))), 4294967295)
                        u152 = bit32.band(bit32.bxor(u152, (bit32.lshift(u152, 5))), 4294967295)
                        return u152 % 4294967296 / 4294967296
                    end

                    lshift = bit32.lshift
                    u152 = bit32.band(bit32.bxor(u152, (lshift(u152, 13))), 4294967295)
                    rshift = bit32.rshift
                    u152 = bit32.band(bit32.bxor(u152, (rshift(u152, 17))), 4294967295)
                    lshift_2 = bit32.lshift
                    u152 = bit32.band(bit32.bxor(u152, (lshift_2(u152, 5))), 4294967295)
                    v15 = u152 % 4294967296 / 4294967296 * 0.6283185307179586
                    lshift_3 = bit32.lshift
                    u152 = bit32.band(bit32.bxor(u152, (lshift_3(u152, 13))), 4294967295)
                    rshift_2 = bit32.rshift
                    u152 = bit32.band(bit32.bxor(u152, (rshift_2(u152, 17))), 4294967295)
                    lshift_4 = bit32.lshift
                    u152 = bit32.band(bit32.bxor(u152, (lshift_4(u152, 5))), 4294967295)
                    v14 = v15 + u152 % 4294967296 / 4294967296 * 5.654866776461628
                    v15 = SpaceCurveFunction(v9, WorldPosition, v3, v4, WorldPosition_2)
                    Position = i ~= v16 and ((CFrame.new(v5, v15)) * CFrame.Angles(0, 0, v14) * CFrame.Angles(
                        math.acos((math.clamp(6.123233995736766e-17 + 0.9999999999999999 * (math.noise(v11, v10, 2.7) + 0.5), -1, 1))),
                        0,
                        0
                    ) * CFrame.new(0, 0, -v12)).Position or v15
                    v:_UpdateGeometry(v8, i, v9, v1, v13, v5, Position)
                    v:_UpdateColor(v8, v9, v1)
                end
            end
        elseif v._PartsHidden == false then
            v._PartsHidden = true
            v:_Disable()
        end
    end
    for j in u55 do
        j()
    end
    debug.profileend()
end)
return u49