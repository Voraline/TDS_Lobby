-- Script path: ReplicatedStorage.Client.Modules.LiveEventVisuals.Gubby
-- Decompile time: 3.93 ms

local Lighting = game:GetService("Lighting")
local u5 = {}
local v1 = Color3.fromRGB(255, 85, 170)
local v2 = Color3.fromRGB(255, 200, 60)
local v3 = Color3.fromRGB(90, 230, 120)
local v4 = Color3.fromRGB(70, 190, 255)
u5[1] = v1
u5[2] = v2
u5[3] = v3
u5[4] = v4
u5[5] = Color3.fromRGB(170, 110, 255)

local function colorAt(a1, a2) -- Line: 32 -- upvalues: u5 (val) -- types: a1: number, a2: number
    return u5[((math.floor(a2 * 1.5)) + a1) % #u5 + 1]
end

local function pulse(a1, a2) -- Line: 38 -- types: a1: number, a2: number
    return math.max(0, (math.cos((a1 * 1.5 + a2) * 3.141592653589793 * 2))) ^ 2
end

local function ball(a1, a2, a3, a4) -- Line: 43
    local Part = Instance.new("Part")
    Part.Name = a2
    Part.Shape = Enum.PartType.Ball
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanTouch = false
    Part.CanQuery = false
    Part.CastShadow = false
    Part.Material = a4
    Part.Size = Vector3.new(1, 1, 1) * a3
    Part.Parent = a1
    return Part
end

local function fixture(a1) -- Line: 58
    local Neon = Enum.Material.Neon
    local v1 = Instance.new("Part")
    v1.Name = "GubbyLight"
    v1.Shape = Enum.PartType.Ball
    v1.Anchored = true
    v1.CanCollide = false
    v1.CanTouch = false
    v1.CanQuery = false
    v1.CastShadow = false
    v1.Material = Neon
    v1.Size = Vector3.new(1.600000023841858, 1.600000023841858, 1.600000023841858)
    v1.Parent = a1
    local ForceField = Enum.Material.ForceField
    local v2 = Instance.new("Part")
    v2.Name = "GubbyLightShell"
    v2.Shape = Enum.PartType.Ball
    v2.Anchored = true
    v2.CanCollide = false
    v2.CanTouch = false
    v2.CanQuery = false
    v2.CastShadow = false
    v2.Material = ForceField
    v2.Size = Vector3.new(3.200000047683716, 3.200000047683716, 3.200000047683716)
    v2.Parent = a1
    local SmoothPlastic = Enum.Material.SmoothPlastic
    local v3 = Instance.new("Part")
    v3.Name = "GubbyLightTarget"
    v3.Shape = Enum.PartType.Ball
    v3.Anchored = true
    v3.CanCollide = false
    v3.CanTouch = false
    v3.CanQuery = false
    v3.CastShadow = false
    v3.Material = SmoothPlastic
    v3.Size = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612)
    v3.Parent = a1
    v3.Transparency = 1
    local SpotLight = Instance.new("SpotLight")
    SpotLight.Face = Enum.NormalId.Front
    SpotLight.Range = 60
    SpotLight.Angle = 45
    SpotLight.Parent = v1
    local Attachment = Instance.new("Attachment")
    Attachment.Parent = v1
    local Attachment_2 = Instance.new("Attachment")
    Attachment_2.Parent = v3
    local Beam = Instance.new("Beam")
    Beam.Attachment0 = Attachment
    Beam.Attachment1 = Attachment_2
    Beam.Width0 = 1.5
    Beam.Width1 = 14
    Beam.FaceCamera = true
    Beam.LightEmission = 1
    Beam.LightInfluence = 0
    Beam.Segments = 1
    Beam.Parent = v1
    local ParticleEmitter = Instance.new("ParticleEmitter")
    ParticleEmitter.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    ParticleEmitter.Rate = 6
    ParticleEmitter.Lifetime = NumberRange.new(0.6, 1.2)
    ParticleEmitter.Speed = NumberRange.new(2, 5)
    ParticleEmitter.SpreadAngle = Vector2.new(180, 180)
    ParticleEmitter.Size = NumberSequence.new(0.8, 0)
    ParticleEmitter.LightEmission = 1
    ParticleEmitter.Parent = v1
    return {
        core = v1,
        shell = v2,
        target = v3,
        spot = SpotLight,
        beam = Beam,
        sparkles = ParticleEmitter,
    }
end

return function(a1, a2, a3) -- Line: 106 -- upvalues: fixture (val), Lighting (val), u5 (val)
    local data = a1.data or {}
    local Position = if not data.center then workspace.CurrentCamera.Focus.Position else Vector3.new(data.center.x, data.center.y, data.center.z)
    local u21 = data.radius or 40
    local u22 = {}
    for i = 1, 12 do
        table.insert(u22, (fixture(a3)))
    end
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "LiveEventGubby"
    ColorCorrectionEffect.Parent = Lighting
    a2(function() -- Line: 122 -- upvalues: ColorCorrectionEffect (val)
        ColorCorrectionEffect:Destroy()
    end)
    return function(a1) -- Line: 126 -- upvalues: u22 (val), Position (val), u21 (val), u5 (upval), ColorCorrectionEffect (val)
        local v1, v2, v3, v4, v5, v6, v7, v8
        local v9 = a1 * 0.5
        local v10 = -a1 * 0.8
        local v11 = nil
        local v12 = nil
        local v13 = a1
        for i, j in u22, v11, v12 do
            v7 = (i - 1) / 12 * 3.141592653589793 * 2
            v8 = v9 + v7
            v1 = Position + Vector3.new((math.cos(v8)) * u21, 24, (math.sin(v8)) * u21)
            v2 = v10 + v7 * 2
            v3 = Position + Vector3.new((math.cos(v2)) * u21 * 0.6, 0, (math.sin(v2)) * u21 * 0.6)
            v5 = if i % 2 ~= 0 then 0 else 0.5
            v4 = math.max(0, (math.cos((v13 * 1.5 + v5) * 3.141592653589793 * 2))) ^ 2
            v6 = math.floor(v13 * 1.5) + i
            v5 = u5[v6 % #u5 + 1]
            j.core.CFrame = CFrame.lookAt(v1, v3)
            j.shell.Position = v1
            j.target.Position = v3
            j.core.Color = v5
            j.core.Transparency = 0.4 - v4 * 0.4
            j.shell.Color = v5
            j.spot.Color = v5
            j.spot.Brightness = v4 * 6
            j.beam.Color = ColorSequence.new(v5)
            j.beam.Transparency = NumberSequence.new(0.85 - v4 * 0.55, 1)
            j.sparkles.Color = ColorSequence.new(v5)
        end
        v11 = math.floor(v13 * 1.5) + 0
        local v14 = u5[v11 % #u5 + 1]
        ColorCorrectionEffect.TintColor = (Color3.new(1, 1, 1)):Lerp(v14, (math.max(0, (math.cos((v13 * 1.5 + 0) * 3.141592653589793 * 2)))) ^ 2 * 0.12)
    end
end