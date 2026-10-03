-- Script path: ReplicatedStorage.Client.Controllers.Lobby.LiveEventEffectsController.old
-- Decompile time: 18.29 ms

local CollectionService = game:GetService("CollectionService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local CatRom = require(ReplicatedStorage.Shared.Modules.CatRom)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local LightingController = require(ReplicatedStorage.Client.Controllers.Shared.LightingController)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local MusicController = require(ReplicatedStorage.Client.Controllers.Shared.MusicController)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TowerPetsController = require(script.Parent.TowerPetsController)
local u88 = Maid.new()
local LocalPlayer = game:GetService("Players").LocalPlayer
local Animation = Instance.new("Animation")
Animation.AnimationId = "rbxassetid://15633504956"
local Animation_2 = Instance.new("Animation")
Animation_2.AnimationId = "rbxassetid://15633509599"
local Sound = Instance.new("Sound")
Sound.SoundId = "rbxassetid://85772790444280"
local Sound_2 = Instance.new("Sound")
Sound_2.SoundId = "rbxassetid://84409020127285"
local u111 = {93869978440702, 136466284570865, 102370030378314}
local u115 = false

local function toggleColissions(a1) -- Line: 45
    for i, j in workspace.Halloween2025EventArea:GetDescendants() do
        if j:IsA("BasePart") then
            j.CanCollide = a1
        end
    end
end

local function createDing(a1) -- Line: 53 -- upvalues: TweenService (val), TimescaleUtilities (val)
    local Part = Instance.new("Part")
    Part.Name = "Ding"
    Part.BottomSurface = Enum.SurfaceType.Smooth
    Part.CFrame = CFrame.new(0, 500, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.Size = Vector3.new(1, 1, 1)
    Part.TopSurface = Enum.SurfaceType.Smooth
    Part.Transparency = 1
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Name = "BillboardGui"
    BillboardGui.Active = true
    BillboardGui.Brightness = 12
    BillboardGui.Size = UDim2.new(10, 100, 10, 100)
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Name = "ImageLabel"
    ImageLabel.Image = "rbxassetid://8120666025"
    ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel.BorderSizePixel = 0
    ImageLabel.Position = UDim2.fromScale(0.5, 0.5)
    ImageLabel.Size = UDim2.fromScale(1, 1)
    local UIScale = Instance.new("UIScale")
    UIScale.Name = "UIScale"
    UIScale.Scale = 1e-07
    UIScale.Parent = ImageLabel
    ImageLabel.Parent = BillboardGui
    BillboardGui.Parent = Part
    local u75 = Part:Clone()
    u75.Parent = workspace
    u75.Anchored = true
    u75.Position = a1
    TweenService:Create(u75.BillboardGui.ImageLabel, TweenInfo.new(5, Enum.EasingStyle.Linear), {Rotation = 720}):Play()
    TweenService:Create(u75.BillboardGui.ImageLabel.UIScale, TweenInfo.new(0.08, Enum.EasingStyle.Linear), {Scale = 2}):Play()
    task.delay(0.09, function() -- Line: 106 -- upvalues: TweenService (upval), u75 (val)
        TweenService:Create(u75.BillboardGui.ImageLabel.UIScale, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {Scale = 0}):Play()
    end)
    TimescaleUtilities.CleanUp(u75, 5)
end

local function projectiles() -- Line: 117
    -- upvalues: u115 (ref), CatRom (val), EmitterManager (val), TimescaleUtilities (val), EasySound (val)
    -- upvalues: Sound_2 (val), Sound (val), RunService (val), GameState (val), u111 (val), Shaker (val)
    -- upvalues: createDing (val), TweenService (val)
    local Part, v1, v2, v3, v4, v5, v6
    local Projectile1 = workspace.Halloween2025EventArea:WaitForChild("Projectile1")
    local Projectile2 = workspace.Halloween2025EventArea:WaitForChild("Projectile2")
    local RiftCrack = workspace.Halloween2025EventArea:WaitForChild("RiftCrack")
    local Points = workspace.Halloween2025EventArea:WaitForChild("Points")
    local u25 = Random.new()
    for i, j in Points:GetChildren() do
        for k = 1, 30 do
            if not u115 then
                break
            end
            v1 = {}
            v2 = #j:GetChildren()
            for n = 1, v2 do
                v5 = tostring(n)
                v4 = j:FindFirstChild(v5)
                if v4 and v4:IsA("BasePart") then
                    if n == #j:GetChildren() then
                        table.insert(v1, v4.Position)
                    else
                        table.insert(
                            v1,
                            v4.Position + (Vector3.new(u25:NextNumber(-80, 80) * 2, u25:NextNumber(-80, 80), (u25:NextNumber(-80, 80)) * 2))
                        )
                    end
                end
            end
            local u117 = u25:NextNumber(5, 7) * 1.8
            local u124 = CatRom.new(v1, 0.5, 0)
            v3 = RiftCrack:Clone()
            v3:ScaleTo((v3:GetScale()) * 0.5)
            v3:PivotTo((CFrame.new((u124:SolvePosition(0)))))
            v3.Parent = workspace
            EmitterManager.manualEmit(v3)
            TimescaleUtilities.CleanUp(v3, 4)
            Part = Instance.new("Part")
            Part.Size = Vector3.new(1, 1, 1)
            Part.Position = u124:SolvePosition(0)
            Part.Anchored = true
            Part.CanCollide = false
            Part.Parent = workspace
            Part.Transparency = 1
            EasySound.Play({
                id = 100215186043603,
                parent = Part,
                volume = if not u115 then 0 else 0.58,
                playbackspeed = Random.new():NextNumber(0.8, 1.2),
            })
            TimescaleUtilities.CleanUp(Part, 9)
            if not ((math.random(1, 2)) <= 1) then
                u214 = Projectile2:Clone()
            else
                local u214 = Projectile1:Clone()
                if not u214 then
                    u214 = Projectile2:Clone()
                end
            end
            local u218 = Sound_2:Clone()
            u218.Volume = if not u115 then 0 else 1
            u218.Parent = u214.Skull
            u218:Play()
            u218.PlaybackSpeed = Random.new():NextNumber(0.8, 0.9)
            u214.Parent = workspace
            local u238 = 0
            local u239 = nil
            local PointLight = Instance.new("PointLight")
            PointLight.Brightness = 3
            PointLight.Range = 60
            PointLight.Parent = u214.Skull
            PointLight.Color = u214:GetAttribute("Color")
            local u253 = Sound:Clone()
            u253.Parent = u214.Skull
            u253:Play()
            u253.Looped = true
            u253.RollOffMinDistance = 50
            u253.RollOffMaxDistance = 180
            u253.RollOffMode = Enum.RollOffMode.InverseTapered
            u253.Volume = if not u115 then 0 else 1
            local Position = Vector3.new(0, 0, 0)
            local u268 = Vector3.new(0, 0, 0)
            local u270 = tick()
            local u271 = false
            v6 = RunService.Heartbeat:Connect(function(a1) -- Line: 218
                -- upvalues: GameState (upval), u214 (val), Position (ref), u268 (ref), u115 (upval), u253 (val)
                -- upvalues: Sound_2 (upval), u218 (val), u270 (val), u238 (ref), u117 (val), u271 (ref)
                -- upvalues: EasySound (upval), u111 (upval), u25 (val), TimescaleUtilities (upval), Shaker (upval)
                -- upvalues: createDing (upval), TweenService (upval), RiftCrack (val), u124 (val)
                -- upvalues: EmitterManager (upval), PointLight (val), u239 (ref)
                local v1 = a1 * GameState.TimeScale
                local v2 = (u214.Skull.Position - Position) / v1
                u268 = u268:Lerp(v2, (math.clamp(v1 * 5, 0, 1)))
                local v3 = math.clamp(u268.Magnitude / 20, 0.5, 1.6)
                if not u115 then
                    u253.Volume = 0
                    Sound_2.Volume = 0
                    u218:Stop()
                end
                u253.PlaybackSpeed = math.lerp(v3 + math.sin(((tick()) - u270) * 2) / 2.5, u253.PlaybackSpeed, v1 * 4) * 0.7 * GameState.TimeScale
                u238 = u238 + v1 / u117
                local v4 = math.clamp(u238, 0, 1)
                if v4 >= 0.95 and not u271 then
                    u271 = true
                    local Part = Instance.new("Part")
                    Part.Size = Vector3.new(1, 1, 1)
                    Part.Position = u214.Skull.Position
                    Part.Anchored = true
                    Part.CanCollide = false
                    Part.Parent = workspace
                    Part.Transparency = 1
                    EasySound.Play({
                        parent = Part,
                        volume = if not u115 then 0 else 0.78,
                        id = u111[u25:NextInteger(1, #u111)],
                        playbackspeed = Random.new():NextNumber(0.8, 1.2),
                    })
                    TimescaleUtilities.CleanUp(Part, 9)
                end
                if not (v4 >= 1) then
                    u214:PivotTo((CFrame.new(u124:SolvePosition(v4), (u124:SolvePosition((math.clamp(v4 + 0.1, 0, 1)))))))
                    return
                end
                Shaker:Shake({1, 10, 0.01, 1}, 0.2, 0.5)
                createDing(u214.Skull.Position)
                local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
                ColorCorrectionEffect.Parent = game.Lighting
                if u115 then
                    TweenService:Create(ColorCorrectionEffect, TweenInfo.new(0.01), {Brightness = 0.4}):Play()
                    TimescaleUtilities.Delay(0.01, function() -- Line: 277 -- upvalues: TweenService (upval), ColorCorrectionEffect (val)
                        TweenService:Create(
                            ColorCorrectionEffect,
                            TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                            {Brightness = 0}
                        ):Play()
                    end)
                end
                TimescaleUtilities.CleanUp(ColorCorrectionEffect, 3)
                local v5 = RiftCrack:Clone()
                v5:ScaleTo((v5:GetScale()) * 2)
                v5:PivotTo((CFrame.new((u124:SolvePosition(1)))))
                v5.Parent = workspace
                EmitterManager.manualEmit(v5)
                TweenService:Create(
                    PointLight,
                    TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Brightness = 10}
                ):Play()
                TimescaleUtilities.Delay(0.1, function() -- Line: 312 -- upvalues: TweenService (upval), PointLight (upval)
                    TweenService:Create(
                        PointLight,
                        TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        {Brightness = 0}
                    ):Play()
                end)
                u239:Disconnect()
                for i, j in u214:GetDescendants() do
                    if j:IsA("ParticleEmitter") or j:IsA("Trail") or j:IsA("Beam") then
                        j.Enabled = false
                    end
                    if j:IsA("BasePart") then
                        j.Transparency = 1
                    end
                    if j:IsA("Sound") then
                        j.PlayOnRemove = false
                    end
                end
                TimescaleUtilities.CleanUp(v5, 4)
                TimescaleUtilities.CleanUp(u214, 4)
            end)
            Position = u214.Skull.Position
            TimescaleUtilities.Wait(u25:NextNumber(0.5, 1))
        end
    end
end

local function rockFloat() -- Line: 361 -- upvalues: RunService (val), CollectionService (val)
    local u0 = {}
    local u1 = {}
    local u2 = {}
    RunService:BindToRenderStep("ROCKS", Enum.RenderPriority.Camera.Value + 1, function(a1) -- Line: 367 -- upvalues: CollectionService (upval), u0 (val), u2 (val), u1 (val)
        local Angles, CFrame_2, Position, v1, v2
        local v3 = CollectionService:GetTagged("FLOATING_ROCK")
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            if not u0[j] then
                u0[j] = 0
                u2[j] = Random.new():NextNumber(0.8, 1.5) * 3.8
                u1[j] = (Random.new():NextUnitVector())
            end
            v2 = u0
            v2[j] = v2[j] + v6 * u2[j]
            CFrame_2 = j.CFrame
            Angles = CFrame.Angles
            v1 = v6 * u2[j] / 2
            j.CFrame = CFrame_2 * Angles(0, v1, 0)
            Position = j.Position
            v1 = u1[j] * v6
            j.Position = Position + v1 * u2[j] * 3.8
        end
    end)
end

local function screenEffects() -- Line: 385
    -- upvalues: u88 (val), RunService (val), Shaker (val), TweenService (val), Lighting (val)
    task.spawn(function() -- Line: 386
        -- upvalues: u88 (upval), RunService (upval), Shaker (upval), TweenService (upval), Lighting (upval)
        local SCREEN_EFFECT = workspace:WaitForChild("SCREEN_EFFECT")
        u88:Mark((RunService.Heartbeat:Connect(function(a1) -- Line: 389
            local SCREEN_EFFECT = workspace:FindFirstChild("SCREEN_EFFECT")
            if SCREEN_EFFECT then
                SCREEN_EFFECT.CFrame = workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -3)
            end
        end)))
        task.delay(6, function() -- Line: 396 -- upvalues: SCREEN_EFFECT (val), Shaker (upval), TweenService (upval), Lighting (upval)
            for i, j in SCREEN_EFFECT:GetChildren() do
                if j:IsA("ParticleEmitter") then
                    j.Enabled = true
                end
            end
            Shaker:Shake({0.6, 20, 5, 7, 4}, 12, 12)
            TweenService:Create(
                SCREEN_EFFECT.Lightning,
                TweenInfo.new(8, Enum.EasingStyle.Exponential, Enum.EasingDirection.In),
                {Rate = 12}
            ):Play()
            task.delay(3, function() -- Line: 414 -- upvalues: TweenService (upval), SCREEN_EFFECT (upval), Lighting (upval)
                TweenService:Create(
                    SCREEN_EFFECT.Lines,
                    TweenInfo.new(8, Enum.EasingStyle.Exponential, Enum.EasingDirection.In),
                    {Rate = 300}
                ):Play()
                TweenService:Create(
                    Lighting,
                    TweenInfo.new(8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                    {ExposureCompensation = 2}
                ):Play()
                TweenService:Create(
                    workspace.CurrentCamera,
                    TweenInfo.new(12, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                    {FieldOfView = 90}
                ):Play()
            end)
        end)
    end)
end

local function zoomOutEffect(a1) -- Line: 443 -- upvalues: RunService (val)
    local function v1(...) -- Line: 444
        (game:GetService("TweenService")):Create(...):Play()
    end

    local Camera = game.Workspace.Camera
    local NumberValue = Instance.new("NumberValue")
    local NumberValue_2 = Instance.new("NumberValue")
    local NumberValue_3 = Instance.new("NumberValue")
    local NumberValue_4 = Instance.new("NumberValue")
    local NumberValue_5 = Instance.new("NumberValue")
    local NumberValue_6 = Instance.new("NumberValue")
    local NumberValue_7 = Instance.new("NumberValue")
    local NumberValue_8 = Instance.new("NumberValue")
    local NumberValue_9 = Instance.new("NumberValue")
    NumberValue.Value = 1
    NumberValue_5.Value = 1
    NumberValue_9.Value = 1
    RunService.RenderStepped:Connect(function() -- Line: 465
        -- upvalues: Camera (val), NumberValue (val), NumberValue_2 (val), NumberValue_3 (val), NumberValue_4 (val)
        -- upvalues: NumberValue_5 (val), NumberValue_6 (val), NumberValue_7 (val), NumberValue_8 (val)
        -- upvalues: NumberValue_9 (val)
        Camera.CFrame = Camera.CFrame * CFrame.new(
            0,
            0,
            0,
            NumberValue.Value,
            NumberValue_2.Value,
            NumberValue_3.Value,
            NumberValue_4.Value,
            NumberValue_5.Value,
            NumberValue_6.Value,
            NumberValue_7.Value,
            NumberValue_8.Value,
            NumberValue_9.Value
        )
    end)
    v1(workspace.CurrentCamera, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {FieldOfView = 120})
    v1(NumberValue_2, TweenInfo.new(a1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Value = 0.1})
    v1(NumberValue, TweenInfo.new(a1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Value = 0})
    v1(NumberValue_5, TweenInfo.new(a1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Value = 0.4})
end

local function floatEffect() -- Line: 502
    -- upvalues: CollectionService (val), TweenService (val), toggleColissions (val), LocalPlayer (val), Lighting (val)
    -- upvalues: zoomOutEffect (val), u115 (ref), GameState (val), u88 (val), RunService (val)
    for i, j in CollectionService:GetTagged("LOCAL_PORTAL") do
        j.CanTouch = false
    end
    task.delay(0.02, function() -- Line: 507 -- upvalues: TweenService (upval)
        TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.01), {FieldOfView = 120}):Play()
        task.delay(0.01, function() -- Line: 511 -- upvalues: TweenService (upval)
            TweenService:Create(
                workspace.CurrentCamera,
                TweenInfo.new(12, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
                {FieldOfView = 62}
            ):Play()
        end)
    end)
    toggleColissions(false)
    local v1 = Random.new()
    local Size = workspace.Teleport.PrimaryPart.Size
    local u50 = workspace.Teleport.PrimaryPart.Position + Vector3.new(v1:NextNumber(-Size.X / 2, Size.X / 2), 5, (v1:NextNumber(-Size.Z / 2, Size.Z / 2)))
    task.spawn(function() -- Line: 531 -- upvalues: LocalPlayer (upval), u50 (val)
        LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(u50, workspace.Teleport.Center.Position)
    end)
    local Attachment = Instance.new("Attachment")
    Attachment.Parent = LocalPlayer.Character.PrimaryPart
    local u72 = (LocalPlayer.Character.PrimaryPart.Position - workspace.Teleport.Center.Position).Unit * Vector3.new(1, 0, 1) * 20
    local u83 = (workspace.Teleport.Center.Position - LocalPlayer.Character.PrimaryPart.Position).Unit * 50
    local NumberValue = Instance.new("NumberValue")
    local NumberValue_2 = Instance.new("NumberValue")
    NumberValue_2.Value = 100
    TweenService:Create(NumberValue_2, TweenInfo.new(8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Value = 1}):Play()
    task.delay(15.7, function() -- Line: 562 -- upvalues: Lighting (upval), TweenService (upval)
        local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect.Enabled = true
        ColorCorrectionEffect:AddTag("DONT_TOUCH")
        ColorCorrectionEffect.Parent = Lighting
        TweenService:Create(ColorCorrectionEffect, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
            Brightness = 26,
            Contrast = 111,
            Saturation = -0.98,
            TintColor = Color3.fromRGB(255, 61, 106),
        }):Play()
    end)
    task.delay(13, function() -- Line: 580
        -- upvalues: TweenService (upval), NumberValue (val), Lighting (upval), zoomOutEffect (upval), u115 (upval)
        -- upvalues: LocalPlayer (upval), GameState (upval)
        TweenService:Create(NumberValue, TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {Value = 1}):Play()
        TweenService:Create(Lighting, TweenInfo.new(7, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {ExposureCompensation = 6}):Play()
        task.delay(2.8, function() -- Line: 592 -- upvalues: zoomOutEffect (upval), u115 (upval), LocalPlayer (upval), GameState (upval)
            zoomOutEffect(4)
            task.wait(4)
            u115 = false
            LocalPlayer.Character.PrimaryPart.Anchored = true
            workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
            workspace.CurrentCamera.CFrame = CFrame.new(0, 50000, 0)
            task.wait(5)
            GameState.Replicator:Set("TextGlitchEffectEvent", "EVENT_START")
        end)
    end)
    u88:Mark((RunService.Stepped:Connect(function(a1, a2) -- Line: 607
        -- upvalues: Lighting (upval), NumberValue_2 (val), u72 (ref), LocalPlayer (upval), u83 (val), NumberValue (val)
        -- upvalues: toggleColissions (upval)
        local Sky = Lighting.Sky
        Sky.SkyboxOrientation = Sky.SkyboxOrientation + Vector3.new(0, a2 * NumberValue_2.Value, 0)
        local v1 = u72
        local v2 = a2 / 5
        u72 = v1:Lerp(Vector3.new(0, 0, 0), v2)
        LocalPlayer.Character.PrimaryPart.AssemblyLinearVelocity = u72 + u83 * NumberValue.Value + Vector3.new(0, 2, 0)
        toggleColissions(false)
    end)))
    task.delay(4, function() -- Line: 619 -- upvalues: TweenService (upval), NumberValue_2 (val)
        TweenService:Create(NumberValue_2, TweenInfo.new(24, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Value = 50}):Play()
    end)
end

local function runEffects() -- Line: 628
    -- upvalues: u115 (ref), LocalPlayer (val), u88 (val), MusicController (val), Animation (val), Animation_2 (val)
    -- upvalues: EasySound (val), SoundService (val), GameState (val), TowerPetsController (val)
    -- upvalues: LightingController (val), TweenService (val), Lighting (val), floatEffect (val), Shaker (val)
    -- upvalues: rockFloat (val), RunService (val), projectiles (val)
    u115 = true
    for i, j in LocalPlayer.PlayerGui:GetChildren() do
        if j:IsA("ScreenGui")
            and not string.find(string.lower(j.Name), "glitcheffect")
            and not string.find(string.lower(j.Name), "loading") then
            local Enabled = j.Enabled
            j.Enabled = false
            u88:Mark(function() -- Line: 643 -- upvalues: j (val), Enabled (val)
                j.Enabled = Enabled
            end)
        end
    end
    MusicController.Disabled = true
    MusicController.Global:Stop()
    local v1 = LocalPlayer.Character.Humanoid:LoadAnimation(Animation)
    local u35 = LocalPlayer.Character.Humanoid:LoadAnimation(Animation_2)
    local ControlModule = require(LocalPlayer.PlayerScripts.PlayerModule.ControlModule)
    EasySound.Play({id = 111012858411668, volume = 0.7, parent = SoundService})
    GameState.Replicator:Set("GlitchEffect", true)
    task.spawn(function() -- Line: 666 -- upvalues: TowerPetsController (upval)
        TowerPetsController.SetEnabled(false)
    end)
    if LightingController.GetCurrentProfile() ~= "NilZone" then
        task.delay(3, function() -- Line: 671 -- upvalues: GameState (upval)
            GameState.Replicator:Set("GlitchEffect", false)
        end)
        TweenService:Create(
            workspace.CurrentCamera,
            TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.In),
            {FieldOfView = 110}
        ):Play()
        TweenService:Create(Lighting, TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {ExposureCompensation = 10}):Play()
        task.wait(4)
        LightingController.ApplyProfile("NilZone")
        floatEffect()
        TweenService:Create(
            workspace.CurrentCamera,
            TweenInfo.new(4.23, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            {FieldOfView = 70}
        ):Play()
        TweenService:Create(
            Lighting,
            TweenInfo.new(3.23, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            {ExposureCompensation = 0}
        ):Play()
    end
    ControlModule:Disable()
    v1:Play(0)
    v1.Stopped:Connect(function() -- Line: 720 -- upvalues: u35 (val)
        u35:Play()
    end)
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect:AddTag("DONT_TOUCH")
    ColorCorrectionEffect.Name = "ColorCorrection"
    ColorCorrectionEffect.Parent = Lighting
    TweenService:Create(
        ColorCorrectionEffect,
        TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true, 0),
        {Saturation = 0.6}
    ):Play()
    TweenService:Create(Lighting, TweenInfo.new(13, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {ClockTime = 18.5}):Play()
    Shaker:Shake({0.6, 30, 0, 4, 4}, 3, 3)
    rockFloat()
    task.spawn(function() -- Line: 386
        -- upvalues: u88 (upval), RunService (upval), Shaker (upval), TweenService (upval), Lighting (upval)
        local SCREEN_EFFECT = workspace:WaitForChild("SCREEN_EFFECT")
        u88:Mark((RunService.Heartbeat:Connect(function(a1) -- Line: 389
            local SCREEN_EFFECT = workspace:FindFirstChild("SCREEN_EFFECT")
            if SCREEN_EFFECT then
                SCREEN_EFFECT.CFrame = workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -3)
            end
        end)))
        task.delay(6, function() -- Line: 396 -- upvalues: SCREEN_EFFECT (val), Shaker (upval), TweenService (upval), Lighting (upval)
            for i, j in SCREEN_EFFECT:GetChildren() do
                if j:IsA("ParticleEmitter") then
                    j.Enabled = true
                end
            end
            Shaker:Shake({0.6, 20, 5, 7, 4}, 12, 12)
            TweenService:Create(
                SCREEN_EFFECT.Lightning,
                TweenInfo.new(8, Enum.EasingStyle.Exponential, Enum.EasingDirection.In),
                {Rate = 12}
            ):Play()
            task.delay(3, function() -- Line: 414 -- upvalues: TweenService (upval), SCREEN_EFFECT (upval), Lighting (upval)
                TweenService:Create(
                    SCREEN_EFFECT.Lines,
                    TweenInfo.new(8, Enum.EasingStyle.Exponential, Enum.EasingDirection.In),
                    {Rate = 300}
                ):Play()
                TweenService:Create(
                    Lighting,
                    TweenInfo.new(8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                    {ExposureCompensation = 2}
                ):Play()
                TweenService:Create(
                    workspace.CurrentCamera,
                    TweenInfo.new(12, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                    {FieldOfView = 90}
                ):Play()
            end)
        end)
    end)
    task.delay(2, function() -- Line: 748 -- upvalues: projectiles (upval)
        projectiles()
    end)
end

task.spawn(function() -- Line: 755 -- upvalues: runEffects (val), u88 (val)
    local function update(a1) -- Line: 756 -- upvalues: runEffects (upval), u88 (upval) -- types: a1: boolean
        if a1 then
            runEffects()
            return
        end
        u88:Sweep()
    end

    ;(workspace:GetAttributeChangedSignal("HalloweenEventEffects2025")):Connect(function() -- Line: 764 -- upvalues: runEffects (upval), u88 (upval)
        if workspace:GetAttribute("HalloweenEventEffects2025") == true then
            runEffects()
            return
        end
        u88:Sweep()
    end)
    if workspace:GetAttribute("HalloweenEventEffects2025") == true then
        runEffects()
        return
    end
    u88:Sweep()
end)
local v1 = {}
local LiveEvent = NewNetwork.Channel("LiveEvent")

function v1.TextFinished() -- Line: 776 -- upvalues: LiveEvent (val)
    LiveEvent:fireServer("OnTextComplete")
end

return v1