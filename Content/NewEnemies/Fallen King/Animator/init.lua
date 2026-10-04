-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen King.Animator
-- Decompile time: 14.72 ms

local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local BlackOut = require(ReplicatedStorage.Client.Interfaces.Stores.Game.BlackOut)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local FakeKickStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.FakeKickStore)
local GlitchScreenStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.GlitchScreenStore)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local Effects = require(script.Effects)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TVStatic = require(ReplicatedStorage.Client.Interfaces.Stores.Game.TVStatic)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local VignetteStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.VignetteStore)
local LocalPlayer = Players.LocalPlayer
local Shards = ReplicatedStorage.Assets.Effects.Mob.FallenKing.Shards
local v1 = {}
v1.__index = v1
local u125 = {}
local v2 = Color3.fromRGB(255, 50, 238)
local v3 = Color3.fromRGB(0, 16, 22)
u125[1] = v2
u125[2] = v3
u125[3] = Color3.new(1, 1, 1)
local u145 = TweenInfo.new(1.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.In)
local Animation_2 = Instance.new("Animation")
Animation_2.AnimationId = "rbxassetid://15633504956"
local Animation_3 = Instance.new("Animation")
Animation_3.AnimationId = "rbxassetid://15633509599"
local u154 = nil
local u155 = nil
local u156 = {"Walk", "RageWalk"}

function v1:_playSound(a2) -- Line: 60 -- upvalues: EasySound (val) -- types: self: table, a2: string
    local v1 = self.Model.HumanoidRootPart:FindFirstChild(a2)
    if v1 and v1:IsA("Sound") then
        if not v1.Looped then
            EasySound.Play({
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                id = v1.SoundId,
                volume = v1.Volume,
                playbackSpeed = v1.PlaybackSpeed,
                parent = self.Model.HumanoidRootPart,
            })
            return
        end
        v1:Play()
        return
    end
    warn((("sound %* not found!"):format(a2)))
end

function v1:_playAnimation(a2) -- Line: 84 -- types: self: table, a2: string
    for i, j in self.Animations do
        j:Stop()
    end
    local v1 = self._animationCallbacks[a2]
    if v1 then
        v1.Start()
    end
    self.Animations[a2]:Play()
end

function v1._emit(a1, a2) -- Line: 98
    local Attribute
    for i, j in a2:GetChildren() do
        Attribute = j:GetAttribute("EmitCount")
        j:Emit(Attribute)
    end
end

function v1:_getPosition() -- Line: 104
    return self.Model.HumanoidRootPart.Node.WorldPosition
end

function v1._lighting(a1) -- Line: 108 -- upvalues: u125 (val), Laser (val), TimescaleUtilities (val)
    task.spawn(function() -- Line: 109 -- upvalues: a1 (val), u125 (upval), Laser (upval), TimescaleUtilities (upval)
        local v1, v2, v3, v4
        local v5 = a1:_getPosition()
        for i = 1, 12 do
            v1 = math.random(-15, 15)
            v2 = v5 + Vector3.new(v1, 50, v1)
            v3 = v5 + Vector3.new(v1, 0, v1)
            v4 = {
                Lifetime = 0.75,
                minWidth = 0.15000000000000002,
                maxWidth = 0.30000000000000004,
                Bursts = 2,
                Color = u125[math.random(1, #u125)],
                Start = v2,
                End = v3,
                Offset = Random.new():NextNumber(0.25, 0.5),
            }
            Laser:Lightning(v4)
            TimescaleUtilities.Wait(0.25)
        end
    end)
end

function v1:_rageEffects(a2) -- Line: 131
    -- upvalues: TimescaleUtilities (val), EffectsController (val), Shaker (val), TweenService (val)
    self:_animateVignette({
        transparency = 0.6,
        tweenInfo = TweenInfo.new(0.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        color = Color3.fromRGB(255, 126, 244),
    })
    TimescaleUtilities.Delay(0.7, function() -- Line: 138 -- upvalues: self (val)
        self:_animateVignette({
            transparency = 1,
            tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            color = Color3.fromRGB(255, 126, 244),
        })
    end)
    EffectsController.GroundSmash(CFrame.new((self:_getPosition())), a2)
    self:_emit(self.Model.HumanoidRootPart[self.phase])
    Shaker:Shake({3, 10, 0, 1.5}, 0.1, 1)
    TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {FieldOfView = 65}):Play()
    self:Delay(0.18, function() -- Line: 157 -- upvalues: TweenService (upval)
        TweenService:Create(
            workspace.CurrentCamera,
            TweenInfo.new(6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            {FieldOfView = 70}
        ):Play()
    end)
end

function v1:_setUpAnimations() -- Line: 166 -- upvalues: u156 (val), Animation (val)
    self.Animations = {}
    for i, j in self.Model.Animations:GetChildren() do
        if j:IsA("Animation") and not table.find(u156, j.Name) then
            self.Animations[j.Name] = (Animation.new({
                IgnorePriority = true,
                IsPersistent = true,
                Preload = true,
                Track = j,
                Target = self.Model.AnimationController.Animator,
                Callback = function() -- Line: 171 -- upvalues: self (val), j (val)
                    if not self._animationCallbacks[j.Name] then
                        return
                    end
                    self._animationCallbacks[j.Name].End()
                end,
            }))
        end
    end
end

function v1:_displayComets(a2) -- Line: 191
    -- upvalues: EmitterManager (val), TimescaleUtilities (val), Shards (val), u125 (val), HttpService (val)
    -- upvalues: AreaIndicatorStore (val), u145 (val), TweenService (val), Shaker (val), EasySound (val)
    local v1
    EmitterManager.Emit("SnowExplosionSmall", (CFrame.new(self:_getPosition())) * CFrame.new(0, 30, 0), 10)
    EmitterManager.Emit("Storm", (CFrame.new(self:_getPosition())) * CFrame.new(0, 30, 0), 10, nil, nil, nil, {priority = "Telegraph"})
    for i, j in a2 do
        TimescaleUtilities.Wait(Random.new():NextNumber(0.05, 0.1))
        local u73 = (Shards:GetChildren())[math.random(1, #Shards:GetChildren())]:Clone()
        u73.Color = u125[math.random(1, #u125)]
        v1 = CFrame.new(j + Vector3.new(0, 1, 0) * math.random(35, 45))
        local u92 = CFrame.new(j)
        u73.CFrame = v1
        task.spawn(function() -- Line: 220
            -- upvalues: HttpService (upval), AreaIndicatorStore (upval), u145 (upval), u92 (val)
            -- upvalues: TimescaleUtilities (upval)
            local v1 = HttpService:GenerateGUID(false)
            AreaIndicatorStore.create(v1, {
                type = "full",
                radius = 2,
                fadeInTime = 0.35,
                tweenInfo = u145,
                lifeTime = u145.Time,
                color3 = Color3.fromRGB(255, 0, 64),
                position = u92.Position,
            })
            TimescaleUtilities.Wait(u145.Time + 1)
            AreaIndicatorStore.remove(v1)
        end)
        TweenService:Create(u73, u145, {
            CFrame = u92 * CFrame.Angles(0, math.rad((math.random(0, 360))), 0),
            Size = u73.Size * 0.4,
        }):Play()
        u73.Parent = workspace
        TimescaleUtilities.Delay(1.5, function() -- Line: 245 -- upvalues: u73 (val), Shaker (upval), EasySound (upval)
            local Attribute
            for i, j in u73.Center:GetChildren() do
                Attribute = j:GetAttribute("EmitCount")
                j:Emit(Attribute)
            end
            Shaker:Shake({1.3, 20.5, 0.1, 1}, 0.3, 0.2)
            u73.Transparency = 1
            if u73:FindFirstChild("Impact") and u73.Impact:IsA("Sound") then
                local Play = EasySound.Play
                local v1 = {
                    destroyOnEnd = true,
                    id = u73.Impact.SoundId,
                    volume = u73.Impact.Volume,
                    playbackSpeed = u73.Impact.PlaybackSpeed,
                    parent = u73,
                }
                v1.soundGroupName = u73.Impact.SoundGroup and u73.Impact.SoundGroup.Name or nil
                Play(v1)
            end
            task.delay(4, function() -- Line: 265 -- upvalues: u73 (upval)
                u73:Destroy()
            end)
        end)
    end
end

function v1._animateVignette(a1, a2) -- Line: 272 -- upvalues: VignetteStore (val)
    VignetteStore.setAnimationData({transparency = a2.transparency, tweenInfo = a2.tweenInfo, color = a2.color})
end

function v1:_toggleSounds(a2) -- Line: 280 -- upvalues: SoundService (val) -- types: self: table, a2: boolean
    if not a2 then
        self._volumes = {}
        for i, j in SoundService:GetChildren() do
            pcall(function() -- Line: 293 -- upvalues: self (val), j (val)
                self._volumes[j] = j.Volume
                j.Volume = 0
            end)
        end
        return
    end
    if not self._volumes then
        return
    end
    for k, n in SoundService:GetChildren() do
        pcall(function() -- Line: 286 -- upvalues: n (val), self (val)
            n.Volume = self._volumes[n]
        end)
    end
end

function v1.Initialize(a1) -- Line: 301
    -- upvalues: Lighting (val), TVStatic (val), LocalPlayer (val), TweenService (val), u154 (ref), Animation_2 (val)
    -- upvalues: u155 (ref), Animation_3 (val), FakeKickStore (val), EasySound (val), BlackOut (val), Create (val)
    -- upvalues: GlitchScreenStore (val), TimescaleUtilities (val), Effects (val), EffectsController (val), Shaker (val)
    -- upvalues: HttpService (val), AreaIndicatorStore (val)
    a1:_setUpAnimations()
    a1._effect = a1.Model.Torso
    a1.phase = 1
    a1._time = Lighting.ClockTime
    a1._animationCallbacks = {
        SwordSpin = {
            Start = function() -- Line: 311 -- upvalues: a1 (val)
                if a1.phase == 2 then
                    a1.Model.model2.Sword.Trail1.Enabled = true
                    a1.Model.model2.Sword.Trail2.Enabled = true
                    return
                end
                a1.Model.Sword.Trail1.Enabled = true
                a1.Model.Sword.Trail2.Enabled = true
            end,
            End = function() -- Line: 320 -- upvalues: a1 (val)
                if a1.phase == 2 then
                    a1.Model.model2.Sword.Trail1.Enabled = false
                    a1.Model.model2.Sword.Trail2.Enabled = false
                    return
                end
                a1.Model.Sword.Trail1.Enabled = false
                a1.Model.Sword.Trail2.Enabled = false
            end,
        },
    }
    if a1.Replicator:Get("RageWalk") then
        a1.Model.model2.Shield.Transparency = 1
        a1.Model.model2.Shield["Shield.001"].Transparency = 1
    end
    a1.Executables = {
        PlaySound = function(a1_2) -- Line: 337 -- upvalues: a1 (val) -- types: a1_2: string
            a1:_playSound(a1_2)
        end,
        ClearEffects = function() -- Line: 341 -- upvalues: TVStatic (upval)
            TVStatic.setEnabled(false)
        end,
        CharacterAnimate = function(a1) -- Line: 345
            -- upvalues: LocalPlayer (upval), TweenService (upval), u154 (upval), Animation_2 (upval), u155 (upval)
            -- upvalues: Animation_3 (upval)
            local Character = LocalPlayer.Character
            if Character then
                local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                if HumanoidRootPart then
                    HumanoidRootPart.Anchored = true
                    local v1 = TweenService:Create(HumanoidRootPart, TweenInfo.new(8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0), {
                        CFrame = HumanoidRootPart.CFrame + Vector3.new(0, 12 * -a1, 0),
                    })
                    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                    local Animator = Humanoid and Humanoid:FindFirstChildOfClass("Animator")
                    if not u154 then
                        u154 = Animator and Animator:LoadAnimation(Animation_2)
                    end
                    if not u155 then
                        u155 = Animator and Animator:LoadAnimation(Animation_3)
                    end
                    if u154 and u155 and a1 == -1 then
                        u154:Play()
                        u154.Stopped:Connect(function() -- Line: 379 -- upvalues: u155 (upval)
                            u155:Play()
                        end)
                        v1:Play()
                    end
                    if a1 == 1 then
                        HumanoidRootPart.Anchored = false
                        if u154 then
                            u154:Stop()
                            u154 = nil
                        end
                        if u155 then
                            u155:Stop()
                            u155 = nil
                        end
                    end
                end
            end
        end,
        Blackout = function() -- Line: 401 -- upvalues: a1 (val), FakeKickStore (upval), EasySound (upval), BlackOut (upval)
            a1:_toggleSounds(false)
            FakeKickStore.setEnabled(true, "You were kicked from this experience: Defeating the Fallen King\n(Error Code: 267)")
            task.delay(5, function() -- Line: 409 -- upvalues: EasySound (upval), a1 (upval)
                EasySound.Play({
                    id = 18726498624,
                    volume = 0.75,
                    destroyOnEnd = true,
                    soundGroupName = "Enemies",
                    parent = a1.Model.HumanoidRootPart,
                })
            end)
            if a1._effects then
                task.cancel(a1._randomBrightness)
                for i, j in a1._effects do
                    j:Destroy()
                end
            end
            BlackOut.setEnabled(true)
        end,
        ["Hidden Wave Intro"] = function() -- Line: 429
            -- upvalues: EasySound (upval), a1 (val), TVStatic (upval), Create (upval), Lighting (upval)
            -- upvalues: GlitchScreenStore (upval), TimescaleUtilities (upval), TweenService (upval)
            EasySound.Play({
                id = 18726499158,
                volume = 0.75,
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                parent = a1.Model.HumanoidRootPart,
            })
            TVStatic.setEnabled(true)
            local v1 = Create("ColorCorrectionEffect", {Name = "HiddenWave", Parent = Lighting})
            v1:AddTag("DONT_TOUCH")
            local v2 = Create("ColorCorrectionEffect", {Name = "HiddenWave2", Parent = Lighting})
            v2:AddTag("DONT_TOUCH")
            local u33 = Create("ColorCorrectionEffect", {Name = "HiddenWave3", Parent = Lighting})
            u33:AddTag("DONT_TOUCH")
            local v3 = task.spawn(function() -- Line: 458 -- upvalues: u33 (val)
                while task.wait(Random.new():NextNumber(0.1, 0.2)) do
                    u33.Brightness = 0.02
                    task.wait(0.01)
                    u33.Brightness = 0
                end
            end)
            GlitchScreenStore.setEnabled(true)
            TimescaleUtilities.Delay(1, function() -- Line: 468 -- upvalues: GlitchScreenStore (upval)
                GlitchScreenStore.setEnabled(false)
            end)
            a1._effects = {v1, v2, u33}
            a1._randomBrightness = v3
            TweenService:Create(
                v2,
                TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                {Saturation = -1, Brightness = -0.1, TintColor = Color3.fromRGB(222, 90, 255)}
            ):Play()
            TweenService:Create(v1, TweenInfo.new(26, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Contrast = 15}):Play()
            TweenService:Create(
                workspace.CurrentCamera,
                TweenInfo.new(26, Enum.EasingStyle.Linear, Enum.EasingDirection.In),
                {FieldOfView = 120}
            ):Play()
        end,
        Death = function() -- Line: 507
            -- upvalues: a1 (val), TimescaleUtilities (upval), Effects (upval), TVStatic (upval), Lighting (upval)
            -- upvalues: TweenService (upval)
            local v1, v2
            a1:_playAnimation("Death")
            a1:_playSound("DeathFull")
            TimescaleUtilities.Delay(3, function() -- Line: 511 -- upvalues: Effects (upval), a1 (upval)
                Effects.DeathEffect(a1)
            end)
            a1:Delay(3)
            TVStatic.setEnabled(false)
            if Lighting:FindFirstChild("FallenAtmosphere") then
                TweenService:Create(Lighting.FallenAtmosphere, TweenInfo.new(5), {Density = 0, Glare = 0, Haze = 0}):Play()
                TweenService:Create(Lighting, TweenInfo.new(5), {ClockTime = a1._time}):Play()
                local FallenVFX = workspace.CurrentCamera:FindFirstChild("FallenVFX")
                if FallenVFX then
                    for i, j in FallenVFX:GetChildren() do
                        j.Enabled = false
                    end
                end
            end
            for k, n in a1.Model:GetDescendants() do
                if n:IsA("ParticleEmitter") or n:IsA("Light") then
                    n.Enabled = false
                end
            end
            for m, i5 in a1.Model:GetDescendants() do
                if i5:IsA("BasePart") and i5.Transparency ~= 1 then
                    v1 = TweenService
                    v2 = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
                    v1:Create(i5, v2, {Transparency = 1}):Play()
                end
            end
            for i6, i7 in a1.Model.HumanoidRootPart.Vanish:GetChildren() do
                a1:Delay(2, function() -- Line: 555 -- upvalues: i7 (val), a1 (upval)
                    i7.Enabled = true
                    a1:Delay(1)
                    i7.Enabled = false
                end)
            end
            for i8, i9 in a1.Model.Sword.Vanish:GetChildren() do
                a1:Delay(2, function() -- Line: 563 -- upvalues: i9 (val), a1 (upval)
                    i9.Enabled = true
                    a1:Delay(1)
                    i9.Enabled = false
                end)
            end
        end,
        Revive = function() -- Line: 571
            -- upvalues: a1 (val), BlackOut (upval), FakeKickStore (upval), Effects (upval), TimescaleUtilities (upval)
            -- upvalues: TweenService (upval)
            local v1, v2
            a1:_toggleSounds(true)
            BlackOut.setEnabled(false)
            FakeKickStore.setEnabled(false)
            a1.phase = 2
            a1._effect = a1.Model.model2.Torso
            Effects.phase2(a1)
            Effects.splines(a1)
            local v3 = (a1.Path:GetScalar(a1.PathDistance - 1)) + Vector3.new(0, a1.PositionOffset.Y, 0)
            local Scalar_2 = a1.Path:GetScalar(a1.PathDistance + 1)
            local v4 = CFrame.new(v3, (Vector3.new(Scalar_2.X, v3.Y, Scalar_2.Z)))
            a1.Model:PivotTo(v4)
            a1.Rotation = v4.Rotation
            a1:_playAnimation("SpawnIn")
            a1:_playSound("Intro")
            TimescaleUtilities.Delay(1, function() -- Line: 596 -- upvalues: a1 (upval)
                a1:_rageEffects(60)
            end)
            TimescaleUtilities.Delay(2, function() -- Line: 600 -- upvalues: a1 (upval)
                for i, j in a1.Model.model2.Outfit.Eyes:GetChildren() do
                    if j:FindFirstChild("Shine") then
                        j.Shine.Enabled = true
                    end
                    if j:FindFirstChild("Flare_Flash") then
                        j.Flare_Flash:Emit(1)
                    end
                end
            end)
            for i, j in a1.Model.HumanoidRootPart.Aura_PhaseTwo:GetChildren() do
                j.Enabled = true
            end
            for k, n in a1.Model.model2:GetDescendants() do
                if n:IsA("BasePart") then
                    v2 = TweenService
                    v1 = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                    v2:Create(n, v1, {Transparency = 0}):Play()
                end
            end
        end,
        FadeAway = function() -- Line: 626
            -- upvalues: a1 (val), TimescaleUtilities (upval), EffectsController (upval), Shaker (upval)
            -- upvalues: TweenService (upval)
            a1:_playAnimation("FadeAway")
            a1:_playSound("Phase1Death")
            for i, j in a1.Model.HumanoidRootPart.Vanish:GetChildren() do
                a1:Delay(2, function() -- Line: 631 -- upvalues: j (val), a1 (upval)
                    j.Enabled = true
                    a1:Delay(1)
                    j.Enabled = false
                end)
            end
            for k, n in a1.Model.Sword.Vanish:GetChildren() do
                a1:Delay(2, function() -- Line: 639 -- upvalues: n (val), a1 (upval)
                    n.Enabled = true
                    a1:Delay(1)
                    n.Enabled = false
                end)
            end
            a1:Delay(1.25, function() -- Line: 646
                -- upvalues: a1 (upval), TimescaleUtilities (upval), EffectsController (upval), Shaker (upval)
                -- upvalues: TweenService (upval)
                local v1, v2
                a1:_animateVignette({
                    transparency = 0.6,
                    tweenInfo = TweenInfo.new(0.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    color = Color3.fromRGB(126, 236, 255),
                })
                TimescaleUtilities.Delay(0.7, function() -- Line: 657 -- upvalues: a1 (upval)
                    a1:_animateVignette({
                        transparency = 1,
                        tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                        color = Color3.fromRGB(126, 236, 255),
                    })
                end)
                local v3 = a1:_getPosition()
                EffectsController.GroundSmash(CFrame.new(v3), 20)
                a1:_emit(a1.Model.HumanoidRootPart[a1.phase])
                Shaker:Shake({3, 10, 0, 1.5}, 0.1, 1)
                TweenService:Create(
                    workspace.CurrentCamera,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {FieldOfView = 65}
                ):Play()
                a1:Delay(0.18, function() -- Line: 680 -- upvalues: TweenService (upval)
                    TweenService:Create(
                        workspace.CurrentCamera,
                        TweenInfo.new(6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        {FieldOfView = 70}
                    ):Play()
                end)
                for i, j in a1.Model:GetDescendants() do
                    if j:IsA("BasePart") and j.Transparency ~= 1 then
                        v1 = TweenService
                        v2 = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
                        v1:Create(j, v2, {Transparency = 1}):Play()
                    end
                end
            end)
            a1:Delay(20)
        end,
        SwingVFX = function() -- Line: 702 -- upvalues: a1 (val)
            a1:_playSound((("SwordSwing%*"):format(a1.phase)))
            a1:Wait(0.73)
            a1:_emit(a1._effect[1])
            a1:Wait(0.7)
            a1:_emit(a1._effect[2])
            a1:Wait(1)
            a1:_emit(a1._effect[3])
        end,
        FallenComet = function(a1_2) -- Line: 713 -- upvalues: a1 (val), Shaker (upval)
            a1:_playAnimation("CometSummon")
            a1:_playSound("ShardAttack")
            a1:Delay(0.75)
            a1:_lighting()
            task.spawn(function() -- Line: 718 -- upvalues: a1 (upval), a1_2 (val)
                a1:_displayComets(a1_2)
            end)
            local Ground = a1.Model.Sword.Ground
            if a1.phase == 2 then
                Ground = a1.Model.model2.Sword.Ground
            end
            a1:_emit(Ground)
            Shaker:Shake({2, 30, 0.1, 1}, 0.1, 0.5)
            a1:Delay(2.7)
            a1:_emit(Ground)
            Shaker:Shake({2, 30, 0.1, 1}, 0.1, 0.5)
        end,
        AreaIndicator = function(a1, a2, a3, a4) -- Line: 735
            -- upvalues: HttpService (upval), AreaIndicatorStore (upval), TimescaleUtilities (upval)
            local v1 = HttpService:GenerateGUID(false)
            AreaIndicatorStore.create(v1, {
                type = "normal",
                initialAngle = 0,
                radius = a1,
                desiredAngle = a2,
                color3 = Color3.fromRGB(255, 0, 64),
                cframe = a3 * CFrame.new(0, -3.5, 0),
                tweenInfo = TweenInfo.new(0.25),
                lifeTime = a4,
            })
            TimescaleUtilities.Wait(a4 + 1)
            AreaIndicatorStore.remove(v1)
        end,
        PlayAnimation = function(a1_2) -- Line: 754 -- upvalues: a1 (val) -- types: a1_2: string
            a1:_playAnimation(a1_2)
        end,
        Rage = function(a1_2) -- Line: 758 -- upvalues: a1 (val), TweenService (upval) -- types: a1_2: number
            task.spawn(function() -- Line: 759 -- upvalues: a1 (upval), a1_2 (val)
                a1:Delay(1.25)
                a1:_rageEffects(a1_2)
            end)
            a1:_playAnimation("Rage")
            a1:_playSound("RageStomp")
            a1:Delay(1)
            TweenService:Create(
                a1.Model.model2.Shield,
                TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                {Transparency = 1}
            ):Play()
            TweenService:Create(
                a1.Model.model2.Shield["Shield.001"],
                TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                {Transparency = 1}
            ):Play()
        end,
        LookAt = function(a1_2) -- Line: 778 -- upvalues: a1 (val), TweenService (upval) -- types: a1_2: vector
            local Position = a1.Model.PrimaryPart.Position
            TweenService:Create(a1.Model.PrimaryPart, TweenInfo.new(0.85, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                CFrame = CFrame.new(Position, (Vector3.new(a1_2.X, Position.Y, a1_2.Z))),
            }):Play()
        end,
    }
end

return v1