-- Script path: ReplicatedStorage.Client.Modules.LiveEventVisuals.Explosion
-- Decompile time: 19.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")

local function toVector3(a1) -- Line: 41
    return (Vector3.new(a1.x, a1.y, a1.z))
end

local function flatDisc(a1, a2, a3, a4, a5) -- Line: 47
    local Part = Instance.new("Part")
    Part.Name = a2
    Part.Shape = Enum.PartType.Cylinder
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanTouch = false
    Part.CanQuery = false
    Part.CastShadow = false
    Part.Material = a3
    Part.Color = a4
    Part.Size = Vector3.new(a5, 1, 1)
    Part.Orientation = Vector3.new(0, 0, 90)
    Part.Parent = a1
    return Part
end

local function ball(a1, a2, a3) -- Line: 64
    local Part = Instance.new("Part")
    Part.Name = a2
    Part.Shape = Enum.PartType.Ball
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanTouch = false
    Part.CanQuery = false
    Part.CastShadow = false
    Part.Material = Enum.Material.Neon
    Part.Color = a3
    Part.Size = Vector3.new(1, 1, 1)
    Part.Parent = a1
    return Part
end

local function block(a1, a2, a3, a4) -- Line: 80
    local Part = Instance.new("Part")
    Part.Name = a2
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanTouch = false
    Part.CanQuery = false
    Part.CastShadow = false
    Part.Material = a4 or Enum.Material.Slate
    Part.Color = a3
    Part.Size = Vector3.new(1, 1, 1)
    Part.Parent = a1
    return Part
end

local function ring(a1, a2, a3, a4) -- Line: 97
    local v1
    if not a4 then
        local Neon = Enum.Material.Neon
        v1 = Instance.new("Part")
        v1.Name = a2
        v1.Shape = Enum.PartType.Cylinder
        v1.Anchored = true
        v1.CanCollide = false
        v1.CanTouch = false
        v1.CanQuery = false
        v1.CastShadow = false
        v1.Material = Neon
        v1.Color = a3
        v1.Size = Vector3.new(0.15000000596046448, 1, 1)
        v1.Orientation = Vector3.new(0, 0, 90)
        v1.Parent = a1
        v1.Transparency = 1
        return {isMesh = false, part = v1}
    end
    v1 = a4:Clone()
    local v2, v3, v4 = a2, a3, a1
    for i, j in v1:GetDescendants() do
        if j:IsA("ParticleEmitter") or j:IsA("Decal") then
            j:Destroy()
        end
    end
    v1.Name = v2
    v1.Anchored = true
    v1.CanCollide = false
    v1.CanTouch = false
    v1.CanQuery = false
    v1.CastShadow = false
    v1.Material = Enum.Material.Neon
    v1.Color = v3
    v1.Transparency = 1
    v1.Parent = v4
    return {isMesh = true, part = v1}
end

local function updateRing(a1, a2, a3, a4) -- Line: 126
    local v1 = math.clamp(a3 * 0.08, 0.6, 1.5)
    local part = a1.part
    if a1.isMesh then
        part.Size = Vector3.new(a3, a3, v1)
        part.CFrame = (CFrame.new(a2)) * CFrame.Angles(1.5707963267948966, 0, 0)
        part.Transparency = a4
        return
    end
    part.Size = Vector3.new(v1, a3, a3)
    part.CFrame = (CFrame.new(a2)) * CFrame.Angles(0, 0, 1.5707963267948966)
    part.Transparency = math.max(a4, 0.7)
end

local function updateShockwave(a1, a2, a3, a4, a5) -- Line: 144
    local v1 = math.clamp(a4 * 0.05, 0.3, 0.8)
    local part = a1.part
    if a1.isMesh then
        part.Size = Vector3.new(a4, a4, v1)
        part.CFrame = CFrame.lookAt(a2, a3)
        part.Transparency = a5
        return
    end
    part.Size = Vector3.new(v1, a4, a4)
    part.CFrame = (CFrame.new(a2)) * CFrame.Angles(0, 0, 1.5707963267948966)
    part.Transparency = math.max(a5, 0.7)
end

local function scaleNumberSequence(a1, a2) -- Line: 159
    local v1 = {}
    for i, j in a1.Keypoints do
        table.insert(v1, (NumberSequenceKeypoint.new(j.Time, j.Value * a2, j.Envelope)))
    end
    return NumberSequence.new(v1)
end

local function randomizeSpin(a1) -- Line: 172
    if a1.Rotation.Min == 0 and a1.Rotation.Max == 0 then
        a1.Rotation = NumberRange.new(-180, 180)
    end
    if a1.RotSpeed.Min == 0 and a1.RotSpeed.Max == 0 then
        a1.RotSpeed = NumberRange.new(-40, 40)
    end
end

return function(a1, a2, a3) -- Line: 181
    -- upvalues: ReplicatedStorage (val), ring (val), SoundService (val), scaleNumberSequence (val), randomizeSpin (val)
    -- upvalues: updateRing (val), updateShockwave (val)
    local BillboardGui, Frame, Highlight, PointLight, SmoothPlastic, TextLabel, UICorner, UIStroke, new_2, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16
    local data = a1.data or {}
    local positions = data.positions or {data.position}
    local u528 = data.fuse or 0
    local u531 = {}
    for i, j in positions do
        if i > 20 then
            break
        end
        if j then
            table.insert(u531, (Vector3.new(j.x, j.y, j.z)))
        end
    end
    if #u531 == 0 then
        return function() end
    end
    local v17 = {}
    local success, result = pcall(require, ReplicatedStorage.Client.Modules.Replicators.TowerReplicator)
    if success then
        v1 = pcall(result.getTowers)
    end
    local v18 = nil
    local Assets = ReplicatedStorage:FindFirstChild("Assets")
    local Effects = Assets and Assets:FindFirstChild("Effects")
    local Mob = Effects and Effects:FindFirstChild("Mob")
    local SonicBoom = Mob and Mob:FindFirstChild("SonicBoom")
    if SonicBoom and SonicBoom:IsA("MeshPart") then
        v18 = SonicBoom
    end
    local u493 = {}
    local v19 = nil
    v1 = nil
    for k, n in u531, v19, v1 do
        v2 = n + Vector3.new(0, 1.5, 0)
        v3 = {position = n, groundPosition = n, flashPosition = v2}
        v3.seed = (math.floor(n.X * 73 + n.Z * 131)) + k * 997
        v4 = v17[k]
        if v4 then
            Highlight = Instance.new("Highlight")
            Highlight.Name = "FuseHighlight"
            Highlight.FillColor = Color3.fromRGB(255, 70, 30)
            Highlight.OutlineColor = Color3.fromRGB(255, 220, 120)
            Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            Highlight.Adornee = v4
            Highlight.Parent = a3
            v3.highlight = Highlight
        end
        v3.warnRing = ring(a3, "WarnRing", Color3.fromRGB(255, 90, 40), v18)
        BillboardGui = Instance.new("BillboardGui")
        BillboardGui.Name = "FuseBadge"
        BillboardGui.Adornee = v3.warnRing.part
        BillboardGui.AlwaysOnTop = true
        BillboardGui.Size = UDim2.fromScale(2.2, 2.2)
        BillboardGui.StudsOffset = Vector3.new(0, 6, 0)
        BillboardGui.Parent = a3
        Frame = Instance.new("Frame")
        Frame.Name = "Circle"
        Frame.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame.Position = UDim2.fromScale(0.5, 0.5)
        Frame.Size = UDim2.fromScale(1, 1)
        Frame.BackgroundColor3 = Color3.fromRGB(220, 60, 30)
        Frame.BorderSizePixel = 0
        Frame.Parent = BillboardGui
        UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0.5, 0)
        UICorner.Parent = Frame
        UIStroke = Instance.new("UIStroke")
        UIStroke.Color = Color3.new(1, 1, 1)
        UIStroke.Thickness = 2
        UIStroke.Parent = Frame
        TextLabel = Instance.new("TextLabel")
        TextLabel.Name = "Mark"
        TextLabel.BackgroundTransparency = 1
        TextLabel.Size = UDim2.fromScale(1, 1)
        TextLabel.Text = "!"
        TextLabel.TextColor3 = Color3.new(1, 1, 1)
        TextLabel.TextScaled = true
        TextLabel.Font = Enum.Font.GothamBlack
        TextLabel.Parent = Frame
        v3.fuseBadge = {billboard = BillboardGui, circle = Frame, stroke = UIStroke, label = TextLabel}
        v6 = Color3.fromRGB(255, 230, 120)
        v5 = Instance.new("Part")
        v5.Name = "Flash"
        v5.Shape = Enum.PartType.Ball
        v5.Anchored = true
        v5.CanCollide = false
        v5.CanTouch = false
        v5.CanQuery = false
        v5.CastShadow = false
        v5.Material = Enum.Material.Neon
        v5.Color = v6
        v5.Size = Vector3.new(1, 1, 1)
        v5.Parent = a3
        v5.Size = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612)
        v5.Transparency = 1
        v3.flash = v5
        PointLight = Instance.new("PointLight")
        PointLight.Color = Color3.fromRGB(255, 150, 60)
        PointLight.Range = 30
        PointLight.Brightness = 0
        PointLight.Shadows = false
        PointLight.Parent = v5
        v3.light = PointLight
        v3.shockRing = ring(a3, "Shockwave", Color3.fromRGB(255, 250, 220), v18)
        SmoothPlastic = Enum.Material.SmoothPlastic
        v9 = Color3.fromRGB(8, 6, 5)
        v7 = Instance.new("Part")
        v7.Name = "Scorch"
        v7.Shape = Enum.PartType.Cylinder
        v7.Anchored = true
        v7.CanCollide = false
        v7.CanTouch = false
        v7.CanQuery = false
        v7.CastShadow = false
        v7.Material = SmoothPlastic
        v7.Color = v9
        v7.Size = Vector3.new(0.05999999865889549, 1, 1)
        v7.Orientation = Vector3.new(0, 0, 90)
        v7.Parent = a3
        v7.Transparency = 1
        v3.scorch = v7
        v8 = {}
        for m = 1, 12 do
            v10 = Random.new(v3.seed + 900 + m)
            v11 = v10:NextNumber(0, 6.283185307179586)
            v12 = v10:NextNumber(0.7, 1.05) * 7.15
            v14 = Color3.fromRGB(255, 120, 40)
            v13 = Instance.new("Part")
            v13.Name = "Ember"
            v13.Shape = Enum.PartType.Ball
            v13.Anchored = true
            v13.CanCollide = false
            v13.CanTouch = false
            v13.CanQuery = false
            v13.CastShadow = false
            v13.Material = Enum.Material.Neon
            v13.Color = v14
            v13.Size = Vector3.new(1, 1, 1)
            v13.Parent = a3
            v13.Size = Vector3.new(1, 1, 1) * v10:NextNumber(0.3, 0.6)
            v13.Transparency = 1
            new_2 = CFrame.new
            v15 = math.cos(v11) * v12
            v16 = (math.sin(v11)) * v12
            v13.CFrame = new_2(n + Vector3.new(v15, 0.15, v16))
            table.insert(v8, {
                part = v13,
                flickerRate = v10:NextNumber(5, 12),
                flickerPhase = v10:NextNumber(0, 6.283185307179586),
            })
        end
        v3.embers = v8
        u493[k] = v3
    end
    local u193 = nil
    local success_2, result_2 = pcall(function() -- Line: 366 -- upvalues: ReplicatedStorage (upval)
        return ReplicatedStorage.Assets.Effects.Particles.ExplosionTrail.Center.Smoke2
    end)
    if success_2 and result_2 and result_2:IsA("ParticleEmitter") then
        u193 = result_2
    end
    local u200 = nil
    local success_3, result_3 = pcall(function() -- Line: 378 -- upvalues: ReplicatedStorage (upval)
        local BigExplosion = ReplicatedStorage.Assets.Effects.SingleEmit.BigExplosion
        local Smoke1 = BigExplosion:FindFirstChild("Smoke1", true) or BigExplosion:FindFirstChild("Smoke2", true)
        if Smoke1 and Smoke1:IsA("ParticleEmitter") then
            return Smoke1
        end
        return nil
    end)
    if success_3 and result_3 then
        u200 = result_3
    end
    local u175 = nil
    local u141 = u531[1]
    local CurrentCamera = workspace.CurrentCamera
    if CurrentCamera then
        local Magnitude
        v3 = nil
        v5 = nil
        v6 = nil
        for i5, i6 in u531, v5, v6 do
            Magnitude = (CurrentCamera.CFrame.Position - i6).Magnitude
            if not v3 or Magnitude < v3 then
                u141 = i6
            end
        end
    end
    local success_4, result_4 = pcall(require, ReplicatedStorage.Shared.Data.Sounds)
    local Beep = success_4
    if Beep then
        Beep = result_4.Beep
        if Beep then
            Beep = result_4.Beep.Properties
        end
    end
    if Beep and Beep.SoundId then
        pcall(function() -- Line: 412 -- upvalues: u141 (ref), a2 (val), Beep (val), SoundService (upval), u175 (ref)
            local Attachment = Instance.new("Attachment")
            Attachment.Position = u141
            Attachment.Parent = workspace.Terrain
            a2(function() -- Line: 416 -- upvalues: Attachment (val)
                Attachment:Destroy()
            end)
            local Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://" .. tostring(Beep.SoundId)
            Sound.Volume = Beep.Volume or 1
            Sound.SoundGroup = SoundService.Towers
            Sound.Parent = Attachment
            u175 = Sound
        end)
    end

    local function buildDebris(a1) -- Line: 430 -- upvalues: a3 (val)
        local Neon, v1, v2, v3, v4, v5, v6, v7, v8, v9
        local v10 = {}
        for i = 1, 7 do
            v5 = Random.new(a1.seed + i)
            v6 = v5:NextNumber(0, 6.283185307179586)
            v7 = v5:NextNumber(6, 14)
            v8 = v5:NextNumber(14, 24)
            v9 = v5:NextNumber()
            v2 = if not (i <= 2) then Color3.fromRGB(25 + v9 * 35, 22 + v9 * 20, 18 + v9 * 12) else Color3.fromRGB(255, 80 + v9 * 30, 15 + v9 * 15)
            Neon = if not v1 then if i % 2 ~= 0 then nil else Enum.Material.SmoothPlastic else Enum.Material.Neon
            v3 = Instance.new("Part")
            v3.Name = "Debris"
            v3.Anchored = true
            v3.CanCollide = false
            v3.CanTouch = false
            v3.CanQuery = false
            v3.CastShadow = false
            v3.Material = Neon or Enum.Material.Slate
            v3.Color = v2
            v3.Size = Vector3.new(1, 1, 1)
            v3.Parent = a3
            v3.Transparency = 1
            v4 = Vector3.new(1, 1, 1) * v5:NextNumber(0.7, 1.3)
            v3.Size = v4
            table.insert(v10, {
                part = v3,
                baseSize = v4,
                velocity = Vector3.new(math.cos(v6) * v7, v8, (math.sin(v6)) * v7),
                spin = Vector3.new(v5:NextNumber(3, 8), v5:NextNumber(3, 8), (v5:NextNumber(3, 8))),
                settleTime = if not v1 then 1 else 0.5,
                fadeTime = if not v1 then 0.4 else 0.24,
            })
        end
        a1.debris = v10
    end

    local function buildSmoke(a1) -- Line: 472
        -- upvalues: u193 (ref), a2 (val), scaleNumberSequence (upval), randomizeSpin (upval), u200 (ref)
        if not u193 then
            return
        end
        if not pcall(function() -- Line: 476
            -- upvalues: a1 (val), a2 (upval), u193 (upval), scaleNumberSequence (upval), randomizeSpin (upval)
            -- upvalues: u200 (upval)
            local Attachment, v1, v2, v3
            Attachment = Instance.new("Attachment")
            Attachment.Position = a1.flashPosition
            Attachment.Parent = workspace.Terrain
            v1 = a2
            v1(function() -- Line: 480 -- upvalues: Attachment (val)
                local v0, v1
                Attachment:Destroy()
                return
            end)
            v1 = u193:Clone()
            v1.Enabled = true
            v1.Rate = v1.Rate * 1.6
            v1.Size = scaleNumberSequence(v1.Size, 1.4)
            randomizeSpin(v1)
            v1.Parent = Attachment
            a1.smoke = v1
            if u200 then
                v2 = u200:Clone()
                v2.Enabled = true
                v2.Rate = v2.Rate * 1.1
                v2.Size = scaleNumberSequence(v2.Size, 1.9)
                randomizeSpin(v2)
                v2.Parent = Attachment
                a1.smokeSecondary = v2
            end
            return
        end) then
            a1.smoke = nil
            a1.smokeSecondary = nil
        end
    end

    local function playSound(a1, a2_2) -- Line: 510 -- upvalues: a2 (val), SoundService (upval)
        local Attachment = Instance.new("Attachment")
        Attachment.Position = a1
        Attachment.Parent = workspace.Terrain
        a2(function() -- Line: 514 -- upvalues: Attachment (val)
            Attachment:Destroy()
        end)
        local Sound = Instance.new("Sound")
        Sound.SoundId = "rbxassetid://" .. a2_2
        Sound.SoundGroup = SoundService.Towers
        Sound.Parent = Attachment
        Sound:Play()
        Sound.Ended:Connect(function() -- Line: 522 -- upvalues: Attachment (val)
            Attachment:Destroy()
        end)
    end

    local function triggerDetonation(a1) -- Line: 529
        -- upvalues: u531 (val), ReplicatedStorage (upval), u493 (val), buildDebris (val), u193 (ref), a2 (val)
        -- upvalues: scaleNumberSequence (upval), randomizeSpin (upval), u200 (ref), playSound (val)
        local Magnitude
        local CurrentCamera = workspace.CurrentCamera
        local Position = CurrentCamera and CurrentCamera.CFrame.Position
        local u105 = {}
        local v1 = nil
        local v2 = nil
        for i, j in u531, v1, v2 do
            Magnitude = if not Position then i else (Position - j).Magnitude
            table.insert(u105, {index = i, distance = Magnitude})
        end
        table.sort(u105, function(a1, a2) -- Line: 538
            return a1.distance < a2.distance
        end)
        if not a1 then
            return
        end
        local success, result_2 = pcall(require, ReplicatedStorage.Shared.Modules.EmitterManager)
        for k = 1, (math.min(8, #u105)) do
            local u45 = u493[u105[k].index]
            if success then
                pcall(result_2.Emit, "BigExplosion", CFrame.new(u45.flashPosition), 7.8, 2.5, false, nil, {priority = "GameplayCritical"})
                pcall(result_2.Emit, "FireExplosion", CFrame.new(u45.flashPosition), 7.8, 1.5, false, nil, {priority = "GameplayCritical"})
                pcall(result_2.Emit, "GroundImpact", CFrame.new(u45.groundPosition), 6.5, nil, false, nil, {priority = "GameplayCritical"})
            end
            buildDebris(u45)
            if u193
                and not pcall(function() -- Line: 476
                    -- upvalues: u45 (val), a2 (upval), u193 (upval), scaleNumberSequence (upval), randomizeSpin (upval)
                    -- upvalues: u200 (upval)
                    local Attachment, v1, v2, v3
                    Attachment = Instance.new("Attachment")
                    Attachment.Position = u45.flashPosition
                    Attachment.Parent = workspace.Terrain
                    v1 = a2
                    v1(function() -- Line: 480 -- upvalues: Attachment (val)
                        local v0, v1
                        Attachment:Destroy()
                        return
                    end)
                    v1 = u193:Clone()
                    v1.Enabled = true
                    v1.Rate = v1.Rate * 1.6
                    v1.Size = scaleNumberSequence(v1.Size, 1.4)
                    randomizeSpin(v1)
                    v1.Parent = Attachment
                    u45.smoke = v1
                    if u200 then
                        v2 = u200:Clone()
                        v2.Enabled = true
                        v2.Rate = v2.Rate * 1.1
                        v2.Size = scaleNumberSequence(v2.Size, 1.9)
                        randomizeSpin(v2)
                        v2.Parent = Attachment
                        u45.smokeSecondary = v2
                    end
                    return
                end) then
                u45.smoke = nil
                u45.smokeSecondary = nil
            end
        end
        if u105[1] then
            local success_2, result = pcall(require, ReplicatedStorage.Client.Modules.Shaker)
            if success_2 then
                pcall(function() -- Line: 592 -- upvalues: result (val), u531 (upval), u105 (val)
                    result:ShakePreset("Explosion", 0.6, 0.3, {radius = 70, position = u531[u105[1].index]})
                end)
            end
            pcall(playSound, u531[u105[1].index], 2814354338)
            pcall(playSound, u531[u105[1].index], 1452071798)
        end
        if u105[2] then
            pcall(playSound, u531[u105[2].index], 2814354338)
        end
    end

    local u216 = false
    local u217 = false
    local u218 = false
    local u219 = false
    local u220 = -1
    return function(a1) -- Line: 614
        -- upvalues: u217 (ref), u218 (ref), u528 (val), u219 (ref), u216 (ref), triggerDetonation (val), u175 (ref)
        -- upvalues: u220 (ref), u493 (val), updateRing (upval), updateShockwave (upval)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
        if not u217 then
            u217 = true
            u218 = a1 <= u528 + 0.25
            u219 = a1 < u528
        end
        local v11 = a1 - u528
        if v11 >= 0 and not u216 then
            u216 = true
            local success, result = pcall(triggerDetonation, u218)
            if not success then
                warn((("Explosion live event detonation failed: %*"):format(result)))
            end
        end
        if not v9 and u219 and u175 then
            local v12 = math.floor((if not (u528 > 0) then 75.39822368615503 * a1 else 6.283185307179586 * (3 * a1 + 9 / (2 * u528) * a1 * a1)) / 6.283185307179586)
            if u220 < v12 then
                u220 = v12
                u175.PlaybackSpeed = math.clamp(a1 / u528, 0, 1) * 0.35 + 1
                u175:Play()
            end
        end
        local CurrentCamera = workspace.CurrentCamera
        local Position = if not CurrentCamera then nil else CurrentCamera.CFrame.Position
        local v13 = nil
        local v14 = nil
        for i, j in u493, v13, v14 do
            if j.highlight then
                j.highlight.Enabled = not v9
            end
            j.fuseBadge.billboard.Enabled = not v9
            if v9 then
                j.warnRing.part.Transparency = 1
            else
                v1 = if not (u528 > 0) then 75.39822368615503 * a1 else 6.283185307179586 * (3 * a1 + 9 / (2 * u528) * a1 * a1)
                v2 = (math.sin(v1) + 1) / 2
                v3 = if not (u528 > 0) then 1 else math.clamp(a1 / u528, 0, 1)
                if j.highlight then
                    j.highlight.FillTransparency = 0.85 - v2 * 0.65
                    j.highlight.OutlineTransparency = 0.6 - v2 * 0.5
                end
                v4 = 14.3 - v3 * 3.9
                updateRing(j.warnRing, j.groundPosition + Vector3.new(0, 0.30000001192092896, 0), v4, 0.55 - v2 * 0.35)
                v5 = (v2 * 0.2 + 0.9) * 2.2
                j.fuseBadge.billboard.Size = UDim2.fromScale(v5, v5)
                j.fuseBadge.circle.BackgroundColor3 = (Color3.fromRGB(180, 40, 20)):Lerp(Color3.fromRGB(255, 130, 40), v2)
                j.fuseBadge.stroke.Transparency = 0.6 - v2 * 0.5
                j.fuseBadge.label.TextTransparency = 0.3 - v2 * 0.25
            end
            if not v9 or not (v11 <= 0.12) then
                j.flash.Transparency = 1
                j.light.Brightness = 0
            else
                v1 = math.clamp(v11 / 0.04, 0, 1)
                v2 = math.clamp((v11 - 0.04) / 0.07999999999999999, 0, 1)
                v3 = v1 * 4.35 + 0.2
                j.flash.Size = Vector3.new(1, 1, 1) * v3
                j.flash.CFrame = CFrame.new(j.flashPosition)
                j.flash.Transparency = v2 * 0.8 + 0.2
                j.flash.Color = (Color3.fromRGB(255, 230, 120)):Lerp(Color3.fromRGB(255, 120, 40), v2)
                j.light.Brightness = (1 - math.clamp(v11 / 0.5, 0, 1)) * 6
            end
            if not v9 or not (v11 <= 0.3) then
                j.shockRing.part.Transparency = 1
            else
                v1 = v11 / 0.3
                updateShockwave(
                    j.shockRing,
                    j.flashPosition,
                    Position or j.flashPosition + Vector3.new(0, 0, 1),
                    6.5 * (0.6 + 2.4 * v1),
                    v1
                )
            end
            if not v9 then
                j.scorch.Transparency = 1
                for k, n in j.embers do
                    n.part.Transparency = 1
                end
            else
                v1 = math.clamp(v11 / 0.3, 0, 1)
                v2 = math.clamp((a1 - 3.2) / 0.5999999999999996, 0, 1)
                v3 = v1 * 14.3
                j.scorch.Size = Vector3.new(j.scorch.Size.X, v3, v3)
                j.scorch.CFrame = (CFrame.new(j.groundPosition + Vector3.new(0, 0.05000000074505806, 0))) * CFrame.Angles(0, 0, 1.5707963267948966)
                j.scorch.Transparency = math.max(1 - v1, v2)
                v4 = math.clamp(v11 / 2, 0, 1)
                v5 = (Color3.fromRGB(255, 120, 40)):Lerp(Color3.fromRGB(90, 20, 15), v4)
                for m, i5 in j.embers do
                    v10 = (math.sin(v11 * i5.flickerRate + i5.flickerPhase) + 1) / 2
                    i5.part.Color = v5
                    i5.part.Transparency = math.max(v4, v2, (1 - v10) * 0.5)
                end
            end
            if j.debris then
                v2 = nil
                v3 = nil
                for i6, i7 in j.debris, v2, v3 do
                    if not (v11 < 0) then
                        v6 = math.clamp((v11 - i7.settleTime) / i7.fadeTime, 0, 1)
                        if not (v6 >= 1) then
                            v7 = i7.velocity * v11 + Vector3.new(0, -45 * v11 * v11, 0)
                            v8 = j.flashPosition + v7
                            if v8.Y < j.groundPosition.Y + 0.3 then
                                v8 = Vector3.new(v8.X, j.groundPosition.Y + 0.3, v8.Z)
                            end
                            i7.part.CFrame = (CFrame.new(v8)) * CFrame.Angles(i7.spin.X * v11, i7.spin.Y * v11, i7.spin.Z * v11)
                            i7.part.Size = i7.baseSize * (1 - v6 * 0.3)
                            i7.part.Transparency = v6 * 0.9
                        else
                            i7.part.Transparency = 1
                        end
                    else
                        i7.part.Transparency = 1
                    end
                end
            end
            v1 = v9 and v11 < 1.5
            if j.smoke then
                j.smoke.Enabled = v1
            end
            if j.smokeSecondary then
                j.smokeSecondary.Enabled = v1
            end
        end
    end
end