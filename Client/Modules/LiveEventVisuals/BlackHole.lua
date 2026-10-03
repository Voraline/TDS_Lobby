-- Script path: ReplicatedStorage.Client.Modules.LiveEventVisuals.BlackHole
-- Decompile time: 13.94 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u10 = {"smoke", "fog", "cloud", "mist"}
local u19 = Color3.fromRGB(8, 4, 14)
local u24 = Color3.fromRGB(160, 70, 255)
local u29 = Color3.fromRGB(200, 140, 255)
local u34 = Color3.fromRGB(235, 220, 255)
local u39 = Color3.fromRGB(255, 255, 255)

local function vector(a1) -- Line: 64
    return (Vector3.new(a1.x, a1.y, a1.z))
end

local function lerp(a1, a2, a3) -- Line: 68 -- types: a1: number, a2: number, a3: number
    return a1 + (a2 - a1) * a3
end

local function easeOutBack(a1) -- Line: 73 -- types: a1: number
    local v1 = a1 - 1
    return v1 * 2.70158 * v1 * v1 + 1 + v1 * 1.70158 * v1
end

local function spinAngle(a1, a2) -- Line: 84 -- types: a1: number, a2: number
    local v1 = math.min(a1, a2)
    local v2 = v1 * 0.9599310885968813 + v1 * v1 * 3.0543261909900767 / (a2 * 2)
    if a2 < a1 then
        v2 = v2 + (a1 - a2) * 4.014257279586958
    end
    return v2
end

local function findAsset(...) -- Line: 93 -- upvalues: ReplicatedStorage (val)
    local v1 = ReplicatedStorage
    for i, j in {...} do
        v1 = if not v1 then nil else v1:FindFirstChild(j)
    end
    return v1
end

local function findTexture(a1) -- Line: 101 -- types: a1: userdata?
    if not a1 then
        return nil
    end
    for i, j in a1:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            return j.Texture
        end
    end
    return nil
end

local function findBeamTemplate() -- Line: 115 -- upvalues: findAsset (val)
    local v1 = findAsset("Assets", "Effects", "Particles", "Beam")
    if not v1 then
        return nil
    end
    if v1:IsA("Beam") then
        return v1
    end
    for i, j in v1:GetDescendants() do
        if j:IsA("Beam") then
            return j
        end
    end
    return nil
end

local function fadeSequence(a1, a2, a3) -- Line: 133 -- types: a1: number, a2: number, a3: number
    return NumberSequence.new({
        NumberSequenceKeypoint.new(0, (math.clamp(1 - a3 * (1 - a1), 0, 1))),
        (NumberSequenceKeypoint.new(1, (math.clamp(1 - a3 * (1 - a2), 0, 1)))),
    })
end

local function ball(a1, a2, a3, a4) -- Line: 142 -- types: a1: string, a3: CFrame, a4: userdata
    local Part = Instance.new("Part")
    Part.Name = a1
    Part.Shape = Enum.PartType.Ball
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanTouch = false
    Part.CanQuery = false
    Part.CastShadow = false
    Part.Material = a2
    Part.Color = a3
    Part.Size = Vector3.new(1, 1, 1)
    Part.Transparency = 1
    Part.Parent = a4
    return Part
end

local function createTorus(a1, a2, a3) -- Line: 165
    -- upvalues: findAsset (val)
    local v1 = findAsset("Assets", "Effects", "Mob", "SonicBoom")
    if v1 and v1:IsA("BasePart") then
        local v2 = v1:Clone()
        v2.Name = a1
        v2.Anchored = true
        v2.CanCollide = false
        v2.CanTouch = false
        v2.CanQuery = false
        v2.CastShadow = false
        v2.Material = Enum.Material.Neon
        v2.Color = a2
        v2.Transparency = 1
        v2.Parent = a3
        return {fromMesh = true, instance = v2, offset = CFrame.Angles(1.5707963267948966, 0, 0)}
    end
    local Part = Instance.new("Part")
    Part.Name = a1
    Part.Shape = Enum.PartType.Cylinder
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanTouch = false
    Part.CanQuery = false
    Part.CastShadow = false
    Part.Material = Enum.Material.Neon
    Part.Color = a2
    Part.Transparency = 1
    Part.Parent = a3
    return {fromMesh = false, instance = Part, offset = CFrame.Angles(0, 0, 1.5707963267948966)}
end

local function updateTorus(a1, a2, a3, a4, a5) -- Line: 196
    -- upvalues: 
    local instance = a1.instance
    local v1 = if not a1.fromMesh then Vector3.new(a4, a3, a3) else Vector3.new(a3, a3, a4)
    instance.Size = v1
    a1.instance.CFrame = a2 * a1.offset
    a1.instance.Transparency = a5
end

local function prepareCarrier(a1) -- Line: 210 -- types: a1: userdata
    a1.Anchored = true
    a1.CanCollide = false
    a1.CanTouch = false
    a1.CanQuery = false
    a1.CastShadow = false
    a1.Transparency = 1
end

local function setEmittersEnabled(a1, a2) -- Line: 224 -- types: a1: userdata, a2: boolean
    for i, j in a1:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            j.Enabled = a2
        end
    end
end

local function pruneHazyEmitters(a1) -- Line: 235 -- upvalues: u10 (val) -- types: a1: userdata
    local v1, v2
    for i, j in a1:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            v1 = string.lower(j.Name)
            v2 = false
            for k, n in u10 do
                if string.find(v1, n, 1, true) then
                    v2 = true
                    break
                end
            end
            if not v2 then
                j.Rate = j.Rate * 0.6
            else
                j:Destroy()
            end
        end
    end
end

local function tameDiskEmitters(a1) -- Line: 259 -- types: a1: userdata
    local Value, v1, v2, v3, v4
    for i, j in a1:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            j.LockedToPart = true
            if j.Orientation == Enum.ParticleOrientation.VelocityParallel then
                v2 = false
                v3 = {}
                v4 = nil
                v1 = nil
                for k, n in j.Squash.Keypoints, v4, v1 do
                    Value = n.Value
                    if Value > 1.5 then
                        Value = 1.5
                        v2 = true
                    end
                    table.insert(v3, (NumberSequenceKeypoint.new(n.Time, Value, n.Envelope)))
                end
                if v2 then
                    j.Squash = NumberSequence.new(v3)
                end
            end
        end
    end
end

local function collectEntityModels() -- Line: 287 -- upvalues: ReplicatedStorage (val)
    local u0 = {}
    pcall(function() -- Line: 289 -- upvalues: ReplicatedStorage (upval), u0 (val)
        for i in require(ReplicatedStorage.Client.Modules.Replicators.TowerReplicator).getTowers() do
            table.insert(u0, i)
        end
    end)
    pcall(function() -- Line: 296 -- upvalues: u0 (val)
        local NPCs = workspace:FindFirstChild("NPCs")
        if not NPCs then
            return
        end
        for i, j in NPCs:GetChildren() do
            if j:IsA("Model") and j.PrimaryPart then
                table.insert(u0, j)
            end
        end
    end)
    return u0
end

return function(a1, a2, a3) -- Line: 310
    -- upvalues: ReplicatedStorage (val), u19 (val), u29 (val), u24 (val), createTorus (val), u39 (val), findAsset (val)
    -- upvalues: pruneHazyEmitters (val), tameDiskEmitters (val), setEmittersEnabled (val), findTexture (val)
    -- upvalues: findBeamTemplate (val), collectEntityModels (val), u34 (val), Lighting (val), fadeSequence (val)
    local Attachment_2, Attachment_3, Attachment_4, Beam, Neon_3, Trail, model, result, success, v1, v2, v3, v4
    local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
    local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
    local center = a1.data.center
    local u378 = Vector3.new(center.x, center.y, center.z)
    local u410 = a1.data.duration or 4
    local u463 = u410 + 0.15
    local SmoothPlastic = Enum.Material.SmoothPlastic
    local v5 = u19
    local u418 = Instance.new("Part")
    u418.Name = "BlackHoleCore"
    u418.Shape = Enum.PartType.Ball
    u418.Anchored = true
    u418.CanCollide = false
    u418.CanTouch = false
    u418.CanQuery = false
    u418.CastShadow = false
    u418.Material = SmoothPlastic
    u418.Color = v5
    u418.Size = Vector3.new(1, 1, 1)
    u418.Transparency = 1
    u418.Parent = a3
    u418.Transparency = 0
    local Highlight = Instance.new("Highlight")
    Highlight.Name = "BlackHoleRim"
    Highlight.Adornee = u418
    Highlight.FillTransparency = 1
    Highlight.OutlineColor = u29
    Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Highlight.Parent = a3
    local ForceField = Enum.Material.ForceField
    local v6 = u24
    local u426 = Instance.new("Part")
    u426.Name = "BlackHoleShimmer"
    u426.Shape = Enum.PartType.Ball
    u426.Anchored = true
    u426.CanCollide = false
    u426.CanTouch = false
    u426.CanQuery = false
    u426.CastShadow = false
    u426.Material = ForceField
    u426.Color = v6
    u426.Size = Vector3.new(1, 1, 1)
    u426.Transparency = 1
    u426.Parent = a3
    local Glass = Enum.Material.Glass
    local v7 = u24
    local u430 = Instance.new("Part")
    u430.Name = "BlackHoleLens"
    u430.Shape = Enum.PartType.Ball
    u430.Anchored = true
    u430.CanCollide = false
    u430.CanTouch = false
    u430.CanQuery = false
    u430.CastShadow = false
    u430.Material = Glass
    u430.Color = v7
    u430.Size = Vector3.new(1, 1, 1)
    u430.Transparency = 1
    u430.Parent = a3
    local Neon = Enum.Material.Neon
    local v8 = u24
    v6 = Instance.new("Part")
    v6.Name = "BlackHoleLight"
    v6.Shape = Enum.PartType.Ball
    v6.Anchored = true
    v6.CanCollide = false
    v6.CanTouch = false
    v6.CanQuery = false
    v6.CastShadow = false
    v6.Material = Neon
    v6.Color = v8
    v6.Size = Vector3.new(1, 1, 1)
    v6.Transparency = 1
    v6.Parent = a3
    v6.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    local PointLight = Instance.new("PointLight")
    PointLight.Color = u29
    PointLight.Range = 40
    PointLight.Brightness = 0
    PointLight.Parent = v6
    local u438 = createTorus("BlackHoleInnerRing", u39, a3)
    local u442 = createTorus("BlackHoleOuterRing", u24, a3)
    local u446 = createTorus("BlackHoleFaintRing", u24, a3)
    local u450 = {}
    local v9 = findAsset("Assets", "Effects", "Particles", "VoidStorm")
    local v10 = findAsset("Assets", "Effects", "Mob", "Portal")
    for i, j in {v9, v10} do
        if j and j:IsA("BasePart") then
            v1 = j:Clone()
            v1.Anchored = true
            v1.CanCollide = false
            v1.CanTouch = false
            v1.CanQuery = false
            v1.CastShadow = false
            v1.Transparency = 1
            pruneHazyEmitters(v1)
            tameDiskEmitters(v1)
            v1.Parent = a3
            setEmittersEnabled(v1, true)
            table.insert(u450, v1)
        end
    end
    local Neon_2 = Enum.Material.Neon
    local v11 = u24
    local u454 = Instance.new("Part")
    u454.Name = "BlackHoleInflowAnchor"
    u454.Shape = Enum.PartType.Ball
    u454.Anchored = true
    u454.CanCollide = false
    u454.CanTouch = false
    u454.CanQuery = false
    u454.CastShadow = false
    u454.Material = Neon_2
    u454.Color = v11
    u454.Size = Vector3.new(1, 1, 1)
    u454.Transparency = 1
    u454.Parent = a3
    u454.Size = Vector3.new(60, 60, 60)
    u454.Position = u378
    local ParticleEmitter = Instance.new("ParticleEmitter")
    ParticleEmitter.Shape = Enum.ParticleEmitterShape.Sphere
    ParticleEmitter.ShapeInOut = Enum.ParticleEmitterShapeInOut.Inward
    ParticleEmitter.ShapeStyle = Enum.ParticleEmitterShapeStyle.Surface
    ParticleEmitter.Orientation = Enum.ParticleOrientation.VelocityParallel
    ParticleEmitter.Squash = NumberSequence.new(2.5)
    ParticleEmitter.Speed = NumberRange.new(28, 34)
    ParticleEmitter.Lifetime = NumberRange.new(1.1, 1.4)
    ParticleEmitter.LightEmission = 1
    ParticleEmitter.Rate = 0
    ParticleEmitter.Color = ColorSequence.new(u29, Color3.new(1, 1, 1))
    ParticleEmitter.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.2), (NumberSequenceKeypoint.new(1, 1))})
    ParticleEmitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.4), (NumberSequenceKeypoint.new(1, 0.2))})
    v11 = findTexture(v10) or findTexture(v9)
    if v11 then
        ParticleEmitter.Texture = v11
    end
    ParticleEmitter.Parent = u454
    local Attachment = Instance.new("Attachment")
    Attachment.Parent = u418
    local v12 = findBeamTemplate()
    v1 = {}
    for k, n in collectEntityModels() do
        success, result = pcall(function() -- Line: 408 -- upvalues: n (val)
            return n:GetPivot()
        end)
        if success then
            table.insert(v1, {model = n, distance = (result.Position - u378).Magnitude})
        end
    end
    table.sort(v1, function(a1, a2) -- Line: 415
        return a1.distance < a2.distance
    end)
    local u248 = {}
    local v13 = a3
    for m = 1, (math.min(10, #v1)) do
        model = v1[m].model
        v3 = ("BlackHoleTether%*"):format(m)
        Neon_3 = Enum.Material.Neon
        v4 = u24
        v2 = Instance.new("Part")
        v2.Name = v3
        v2.Shape = Enum.PartType.Ball
        v2.Anchored = true
        v2.CanCollide = false
        v2.CanTouch = false
        v2.CanQuery = false
        v2.CastShadow = false
        v2.Material = Neon_3
        v2.Color = v4
        v2.Size = Vector3.new(1, 1, 1)
        v2.Transparency = 1
        v2.Parent = v13
        v2.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
        Attachment_2 = Instance.new("Attachment")
        Attachment_2.Parent = v2
        Beam = Instance.new("Beam")
        Beam.Name = "BlackHoleTetherBeam"
        Beam.Attachment0 = Attachment_2
        Beam.Attachment1 = Attachment
        Beam.Width0 = 0.12
        Beam.Width1 = 0.6
        Beam.CurveSize0 = 0
        Beam.CurveSize1 = 6
        Beam.LightEmission = 1
        Beam.FaceCamera = true
        Beam.Segments = 16
        Beam.Color = ColorSequence.new(u24, Color3.new(1, 1, 1))
        Beam.Transparency = NumberSequence.new(1)
        Beam.Enabled = false
        if v12 then
            Beam.Texture = v12.Texture
            Beam.TextureMode = v12.TextureMode
            Beam.TextureSpeed = v12.TextureSpeed
        end
        Beam.Parent = v13
        Attachment_3 = Instance.new("Attachment")
        Attachment_3.Position = Vector3.new(0, 0, -0.30000001192092896)
        Attachment_3.Parent = v2
        Attachment_4 = Instance.new("Attachment")
        Attachment_4.Position = Vector3.new(0, 0, 0.30000001192092896)
        Attachment_4.Parent = v2
        Trail = Instance.new("Trail")
        Trail.Name = "BlackHoleTetherTrail"
        Trail.Attachment0 = Attachment_3
        Trail.Attachment1 = Attachment_4
        Trail.Color = ColorSequence.new(u24)
        Trail.Lifetime = 0.25
        Trail.FaceCamera = true
        Trail.LightEmission = 1
        Trail.Transparency = NumberSequence.new(1)
        Trail.Enabled = false
        Trail.Parent = v2
        table.insert(u248, {model = model, follower = v2, beam = Beam, trail = Trail})
    end
    local Neon_4 = Enum.Material.Neon
    local v14 = u34
    local u364 = Instance.new("Part")
    u364.Name = "BlackHoleFlash"
    u364.Shape = Enum.PartType.Ball
    u364.Anchored = true
    u364.CanCollide = false
    u364.CanTouch = false
    u364.CanQuery = false
    u364.CastShadow = false
    u364.Material = Neon_4
    u364.Color = v14
    u364.Size = Vector3.new(1, 1, 1)
    u364.Transparency = 1
    u364.Parent = v13
    u364.Position = u378
    local u383 = createTorus("BlackHoleShockwave", u34, v13)
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "BlackHoleColorCorrection"
    ColorCorrectionEffect.Saturation = 0
    ColorCorrectionEffect.Brightness = 0
    ColorCorrectionEffect.TintColor = Color3.new(1, 1, 1)
    ColorCorrectionEffect.Parent = Lighting
    a2(function() -- Line: 484 -- upvalues: ColorCorrectionEffect (val)
        ColorCorrectionEffect:Destroy()
    end)
    local u403 = false
    local u404 = false
    local u405 = true
    return function(a1) -- Line: 492
        -- upvalues: u410 (val), u403 (ref), Shaker (val), u378 (val), a2 (val), u418 (val), Highlight (val), u426 (val)
        -- upvalues: u430 (val), PointLight (val), u438 (val), u442 (val), u446 (val), u405 (ref), u450 (val)
        -- upvalues: setEmittersEnabled (upval), u454 (val), ParticleEmitter (val), u248 (val), fadeSequence (upval)
        -- upvalues: ColorCorrectionEffect (val), u404 (ref), u463 (val), EmitterManager (val), u364 (val), u383 (val)
        local result, success, v1, v2
        local v3 = math.clamp(a1 / u410, 0, 1)
        local v4 = math.clamp(a1 / 0.45, 0, 1) - 1
        local v5 = v4 * 2.70158 * v4 * v4 + 1 + v4 * 1.70158 * v4
        v4 = math.clamp(v5, 0, 1)
        local v6 = math.clamp((a1 - 0.1) / 0.45, 0, 1) - 1
        local v7 = math.clamp(v6 * 2.70158 * v6 * v6 + 1 + v6 * 1.70158 * v6, 0, 1)
        v6 = 1 - math.clamp((a1 - u410) / 0.15, 0, 1)
        local v8 = math.sin(a1 * 2.2) * 0.04 + 1
        if not u403 and a1 < u410 then
            u403 = true
            local u68 = Shaker:ShakePreset("Earthquake", u410 - a1, 0.6, {radius = 120, position = u378})
            a2(function() -- Line: 512 -- upvalues: u68 (val)
                if u68 then
                    u68:Stop(0.2)
                end
            end)
        end
        local v9 = math.max(0.02, (v5 * 0.6 + 0.4) * v6 * v8)
        u418.Size = Vector3.new(9.399999618530273, 9.399999618530273, 9.399999618530273) * v9
        u418.Position = u378
        u418.Transparency = if not (v6 > 0) then 1 else 0.05
        Highlight.OutlineTransparency = 1 - v4 * v6 * 0.85
        u426.Size = Vector3.new(10.527999877929688, 10.527999877929688, 10.527999877929688) * v9
        u426.Position = u378
        u426.Transparency = 1 - v4 * v6 * (math.sin(a1 * 5) * 0.1 + 0.35)
        u430.Size = Vector3.new(12.6899995803833, 12.6899995803833, 12.6899995803833) * v9
        u430.Position = u378
        u430.Transparency = 1 - v4 * v6 * 0.25
        PointLight.Range = v3 * 18 + 40
        PointLight.Brightness = v4 * v6 * (v3 * 4 + 1)
        local v10 = u410
        local v11 = math.min(a1, v10)
        local v12 = v11 * 0.9599310885968813 + v11 * v11 * 3.0543261909900767 / (v10 * 2)
        if v10 < a1 then
            v12 = v12 + (a1 - v10) * 4.014257279586958
        end
        v10 = (CFrame.new(u378)) * CFrame.Angles(0, v12, 0) * CFrame.Angles(0.4537856055185257, 0, 0)
        v11 = (CFrame.new(u378)) * CFrame.Angles(0, v12 * 0.82, 0) * CFrame.Angles(0.5235987755982988, 0, 0)
        local v13 = 1 - v7 * v6
        local v14 = u438
        local v15 = 1 - (1 - v13) * 0.97
        v14.instance.Size = if not v14.fromMesh then Vector3.new(1.5, 14.47599983215332, 14.47599983215332) else Vector3.new(14.47599983215332, 14.47599983215332, 1.5)
        v14.instance.CFrame = v10 * v14.offset
        v14.instance.Transparency = v15
        v14 = u442
        v15 = 1 - (1 - v13) * 0.35
        v14.instance.Size = if not v14.fromMesh then Vector3.new(1.2999999523162842, 26.31999969482422, 26.31999969482422) else Vector3.new(26.31999969482422, 26.31999969482422, 1.2999999523162842)
        v14.instance.CFrame = v11 * v14.offset
        v14.instance.Transparency = v15
        v14 = u446
        v15 = 1 - (1 - v13) * 0.16
        v14.instance.Size = if not v14.fromMesh then Vector3.new(1.2000000476837158, 35.53200149536133, 35.53200149536133) else Vector3.new(35.53200149536133, 35.53200149536133, 1.2000000476837158)
        v14.instance.CFrame = v11 * v14.offset
        v14.instance.Transparency = v15
        v14 = a1 < u410
        if v14 ~= u405 then
            for i, j in u450 do
                setEmittersEnabled(j, v14)
            end
        end
        for k, n in u450 do
            n.CFrame = v10
        end
        u454.Position = u378
        ParticleEmitter.Rate = (v3 * 31 + 14) * v4 * v6
        v15 = v4 * v6
        local v16 = nil
        local v17 = nil
        local v18 = a1
        for m, i5 in u248, v16, v17 do
            success, result = pcall(function() -- Line: 601 -- upvalues: i5 (val)
                return i5.model:GetPivot()
            end)
            v2 = success
            if v2 then
                v2 = false
                if i5.model.Parent ~= nil then
                    v2 = v15 > 0.01
                end
            end
            i5.beam.Enabled = v2
            i5.trail.Enabled = v2
            if v2 then
                i5.follower.CFrame = result
                i5.beam.Transparency = fadeSequence(0.35, 0.85, v15)
                i5.trail.Transparency = fadeSequence(0.3, 1, v15)
            end
        end
        ColorCorrectionEffect.Saturation = v3 * -0.08 * v6
        ColorCorrectionEffect.Brightness = v3 * -0.02 * v6
        ColorCorrectionEffect.TintColor = (Color3.new(1, 1, 1)):Lerp(Color3.fromRGB(235, 225, 255), v3 * 0.15)
        if not u404 and u463 <= v18 then
            u404 = true
            if v18 - u463 <= 0.25 then
                EmitterManager.Emit("VoidExplosion", CFrame.new(u378), 14, nil, nil, nil, {priority = "GameplayCritical"})
                Shaker:ShakePreset("Explosion", 0.4, 0.3, {radius = 120, position = u378})
            end
        end
        if not (u463 <= v18) then
            u364.Transparency = 1
            v1 = u383
            v16 = CFrame.new(u378)
            v1.instance.Size = if not v1.fromMesh then Vector3.new(0.4000000059604645, 7.895999908447266, 7.895999908447266) else Vector3.new(7.895999908447266, 7.895999908447266, 0.4000000059604645)
            v1.instance.CFrame = v16 * v1.offset
            v1.instance.Transparency = 1
            return
        end
        v1 = math.clamp((v18 - u463) / 0.35, 0, 1)
        u364.Size = Vector3.new(1, 1, 1) * (v1 * 26.32 + 3.7600000000000002)
        u364.Transparency = v1
        v16 = v1 * 30.268 + 3.948
        v17 = u383
        local v19 = CFrame.new(u378)
        local v20 = v16 * 2
        local instance_4 = v17.instance
        local v21 = if not v17.fromMesh then Vector3.new(0.4, v20, v20) else Vector3.new(v20, v20, 0.4)
        instance_4.Size = v21
        v17.instance.CFrame = v19 * v17.offset
        v17.instance.Transparency = v1
        ColorCorrectionEffect.Brightness = (1 - v1) * 0.4 * (1 - v1)
    end
end