-- Script path: ReplicatedStorage.Content.NewEnemies.Narrator.Animator
-- Decompile time: 13.21 ms

local ContentProvider = game:GetService("ContentProvider")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local GlobalBus = require(ReplicatedStorage.Shared.Modules.GlobalBus)
local HandClientClass = require(script.HandClientClass)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local VignetteStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.VignetteStore)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local Narrator = ReplicatedStorage.Assets.Effects.Mob.Narrator
local Producer = ReplicatedStorage.Assets.Effects.Mob.Producer
local LocalPlayer = Players.LocalPlayer
local u124 = {Stomp = {Volume = 0.5}}
local u126 = {Shoot = 93704949210035, SummonAPCs = 137078319439767, CallToWar = 74891254412445, Stomp = 17284713381}
local u131 = {
    HandSlam = 120554272138045,
    HandLaser = 125580591230947,
    MiniHandSummon = 75756328963396,
    BaseAttackCharge = 76206944707143,
    BaseAttackShoot = 87216640217606,
    BaseAttackHit = 124617607903379,
    BaseAttackFlameBall = 118051745175595,
    RageMode = 70630697760549,
    Stun = 112811207906968,
    Death = 104888589162594,
}
local u142 = {BaseAttackCharge = true, BaseAttackShoot = true, BaseAttackHit = true}
local v1 = {}
v1.__index = v1
local u150 = Create("ColorCorrectionEffect", {Parent = Lighting})

local function curvedProgress(a1, a2, a3) -- Line: 72 -- types: a1: number, a2: number, a3: number?
    if a2 <= 0 then
        return 0
    end
    return math.clamp(a1 / a2, 0, 1) ^ (a3 or 0.75)
end

function v1.Initialize(a1) -- Line: 82
    -- upvalues: RunService (val), GlobalBus (val), StateManager (val), u126 (val), EasySound (val), u124 (val)
    -- upvalues: u131 (val), u142 (val), LocalPlayer (val), Create (val), SoundService (val), Animation (val)
    -- upvalues: ContentProvider (val), table (val), Shaker (val), Narrator (val), EmitterManager (val)
    -- upvalues: TimescaleUtilities (val), spr (val), TweenService (val), u150 (val), ItemDrop (val), HttpService (val)
    -- upvalues: AreaIndicatorStore (val), HandClientClass (val)
    local Create_2, PlayerGui, v1, v2, v3, v4, v5
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1:Delay(2, function() -- Line: 86 -- upvalues: a1 (val), RunService (upval), GlobalBus (upval)
        a1._spotlight = a1:createSpotlight(a1.Model.PrimaryPart.Node.WorldPosition, 10, false)
        a1.Maid:Mark((RunService.Heartbeat:Connect(function(a1_2) -- Line: 89 -- upvalues: a1 (upval)
            a1._spotlight:PivotTo((CFrame.new(a1.Model.PrimaryPart.Node.WorldPosition)))
        end)))
        GlobalBus.Fire("ToggleMapLights", false)
        a1.Maid:Mark(function() -- Line: 94 -- upvalues: GlobalBus (upval)
            GlobalBus.Fire("ToggleMapLights", true)
        end)
    end)
    a1.stateManager = StateManager.new()
    a1.animations = {}
    a1.legacySounds = {}
    a1.sounds = {}
    local v6 = nil
    local v7 = nil
    for i, j in u126, v6, v7 do
        Create_2 = EasySound.Create
        v5 = {volume = 2.8, id = j, name = i, parent = a1.Model.PrimaryPart}
        v1 = true
        if i ~= "Walk" then
            v1 = string.match(i, "Loop$")
        end
        v5.looped = v1
        v4 = Create_2(v5)
        if u124[i] then
            for k, n in u124[i] do
                v4[k] = n
            end
        end
        a1.sounds[i] = v4
    end
    v6 = nil
    v7 = nil
    for m, i5 in u131, v6, v7 do
        v4 = u142[m]
        PlayerGui = if not v4 then a1.Model.PrimaryPart else LocalPlayer:WaitForChild("PlayerGui")
        v2 = {
            Volume = 2.8,
            RollOffMinDistance = 1,
            RollOffMaxDistance = 300,
            Name = m,
            SoundId = ("rbxassetid://%*"):format(i5),
        }
        v3 = true
        if m ~= "Walk" then
            v3 = string.match(m, "Loop$")
        end
        v2.Looped = v3
        v2.Parent = PlayerGui
        v2.SoundGroup = SoundService.Enemies
        v2.RollOffMode = Enum.RollOffMode.Linear
        v1 = Create("Sound", v2)
        EasySound.bindTimeScale(v1)
        if v4 then
            a1.Maid:Mark(v1)
        end
        a1.legacySounds[m] = v1
    end
    for i6, i7 in (Animations:GetChildren()) do
        v4 = Animation.new({IgnorePriority = true, Preload = true, Track = i7, Target = AnimationController})
        a1.animations[i7.Name] = v4
    end
    task.spawn(function() -- Line: 158 -- upvalues: ContentProvider (upval), table (upval), a1 (val)
        ContentProvider:PreloadAsync((table.values(a1.legacySounds)))
    end)
    a1.Maid:Mark(a1.stateManager)
    local u79 = Create("Highlight", {
        Enabled = true,
        OutlineTransparency = 1,
        FillTransparency = 1,
        Parent = a1.Model,
        FillColor = Color3.fromRGB(255, 238, 0),
        OutlineColor = Color3.fromRGB(0, 0, 0),
    })
    local u80 = nil
    ;(a1.Replicator:GetStateChangedSignal("SpotLightsOnBoss")):Connect(function(a1) -- Line: 175 -- upvalues: u80 (ref)
        u80 = a1
    end)
    local u90 = 0
    a1.Maid:Mark((RunService.Heartbeat:Connect(function(a1_2) -- Line: 181 -- upvalues: u80 (ref), u90 (ref), a1 (val), Shaker (upval), u79 (val)
        local v1 = math.noise(os.clock() * 30) * 0.1
        local v2 = math.noise(os.clock() * 40) * 0.4
        local v3 = math.noise(os.clock() * 25) * 12
        if not u80 then
            u79.FillTransparency = math.lerp(u79.FillTransparency, 1, a1_2 * 1)
            u79.OutlineTransparency = math.lerp(u79.OutlineTransparency, 1, a1_2 * 1)
            return
        end
        local AmountOn = u80.AmountOn
        local Total = u80.Total
        local v4 = if not (Total <= 0) then math.clamp(AmountOn / Total, 0, 1) ^ 1.5 else 0
        local v5 = a1_2 * 2.5
        u90 = math.lerp(u90, v4, v5)
        a1:_animateVignette({
            transparency = 1 - (u90 + v2 * u90) * 0.4,
            tweenInfo = TweenInfo.new(a1_2 * 6, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
            color = (Color3.new(1, 1, 1)):Lerp(Color3.fromRGB(255, 166, 0), u90),
        })
        Shaker:Shake({u90 * 0.65, 55, 0, 7, 4}, 0, 1)
        local CurrentCamera = workspace.CurrentCamera
        CurrentCamera.FieldOfView = math.lerp(workspace.CurrentCamera.FieldOfView, 70 - (u90 * 20 + v3 * u90), a1_2 * 2)
        u79.FillTransparency = math.lerp(u79.FillTransparency, 1 - u90 + v1, a1_2 * 25)
        u79.OutlineTransparency = math.lerp(u79.OutlineTransparency, 1 - u90 + v1, a1_2 * 25)
    end)))
    a1.Executables = {
        ChangeState = function(a1_2, ...) -- Line: 222 -- upvalues: a1 (val) -- types: a1_2: string
            a1.stateManager:changeState(a1_2, a1, ...)
        end,
        SummonEffect = function(a1_2) -- Line: 226 -- upvalues: a1 (val), Narrator (upval), EmitterManager (upval), TimescaleUtilities (upval)
            a1.legacySounds.MiniHandSummon:Play()
            local v1 = (Narrator.SpawnEffects:GetChildren())[math.random(1, #Narrator.SpawnEffects:GetChildren())]:Clone()
            v1.Parent = workspace.Trash
            v1.CFrame = CFrame.new(a1_2)
            EmitterManager.manualEmit(v1)
            v1.Parent = workspace
            TimescaleUtilities.CleanUp(v1, 5)
        end,
        StunEffect = function(a1, a2) -- Line: 239 -- upvalues: Narrator (upval), spr (upval), RunService (upval), TimescaleUtilities (upval)
            local u6 = Narrator.HandLaserStun:Clone()
            u6.Parent = workspace.Trash
            u6.HandLaserStun.Position = a1
            u6:ScaleTo(0.01)
            local u14 = {progress = 0}
            spr.target(u14, 0.75, 10, {progress = 1})
            local u27 = RunService.RenderStepped:Connect(function(a1) -- Line: 253 -- upvalues: u6 (val), u14 (val)
                u6:ScaleTo((math.clamp(u14.progress, 0.01, 10)))
            end)
            TimescaleUtilities.CleanUp(u6, a2)
            task.delay(6, function() -- Line: 258 -- upvalues: u27 (ref)
                u27:Disconnect()
                u27 = nil
            end)
        end,
        Stunned = function(a1_2) -- Line: 264 -- upvalues: a1 (val), TweenService (upval), u150 (upval), TimescaleUtilities (upval)
            local v1 = a1_2 - workspace:GetServerTimeNow()
            a1._baseMaid:Sweep()
            a1.legacySounds.BaseAttackCharge:Stop()
            a1.legacySounds.Stun:Play()
            TweenService:Create(u150, TweenInfo.new(0.01), {Contrast = -10, TintColor = Color3.fromRGB(82, 229, 255)}):Play()
            TimescaleUtilities.Delay(0.012, function() -- Line: 277 -- upvalues: a1 (upval), TimescaleUtilities (upval), TweenService (upval), u150 (upval)
                a1:_animateVignette({
                    transparency = 0,
                    tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    color = Color3.fromRGB(64, 179, 255),
                })
                TimescaleUtilities.Delay(0.1, function() -- Line: 288 -- upvalues: a1 (upval)
                    a1:_animateVignette({
                        transparency = 1,
                        tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        color = Color3.fromRGB(0, 0, 0),
                    })
                end)
                TweenService:Create(
                    u150,
                    TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Contrast = 0, TintColor = Color3.fromRGB(255, 255, 255)}
                ):Play()
            end)
            TweenService:Create(
                workspace.CurrentCamera,
                TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {FieldOfView = 70}
            ):Play()
            a1:_flash()
            for i, j in {"left", "right"} do
                local u112 = a1._hands[j]
                u112:PlayAnimation("Stun")
                TimescaleUtilities.Delay(v1, function() -- Line: 324 -- upvalues: u112 (val)
                    u112:PlayAnimation("StunEnd")
                    u112:StopAnimation("Stun")
                end)
                u112.handModel.Mesh.Material = Enum.Material.Neon
                TweenService:Create(
                    u112.handModel.Mesh,
                    TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Color = Color3.fromRGB(72, 182, 255)}
                ):Play()
                TimescaleUtilities.Delay(0.17, function() -- Line: 338 -- upvalues: u112 (val), TweenService (upval)
                    u112.handModel.Mesh.Material = Enum.Material.Plastic
                    TweenService:Create(
                        u112.handModel.Mesh,
                        TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        {Color = Color3.fromRGB(252, 250, 255)}
                    ):Play()
                end)
            end
            a1:_cancelAnimateLoop(0)
            local v2 = a1:animate("StunIntro")
            local v3 = a1:animate("StunLoop")
            a1:Wait(v1)
            v2:Stop(0)
            v3:Stop(0)
            a1:animate("StunOutro")
        end,
        ShootBase = function(a1_2) -- Line: 360
            -- upvalues: u80 (ref), a1 (val), TweenService (upval), TimescaleUtilities (upval), Narrator (upval)
            -- upvalues: ItemDrop (upval), EmitterManager (upval)
            local v1
            u80 = nil
            a1.legacySounds.BaseAttackShoot:Play()
            a1.animations.BaseAttackIntro:Stop(0)
            a1:animate("BaseAttack")
            local Position = nil
            if a1._flingBall then
                Position = a1._flingBall.Part.Position
                a1._flingBall:Destroy()
                a1._flingBall = nil
            end
            task.defer(function() -- Line: 375 -- upvalues: TweenService (upval), TimescaleUtilities (upval), a1 (upval)
                TweenService:Create(
                    workspace.CurrentCamera,
                    TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {FieldOfView = 90}
                ):Play()
                TimescaleUtilities.Delay(0.1, function() -- Line: 384 -- upvalues: TweenService (upval)
                    TweenService:Create(
                        workspace.CurrentCamera,
                        TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        {FieldOfView = 70}
                    ):Play()
                end)
                a1:_animateVignette({
                    transparency = 0,
                    tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    color = Color3.fromRGB(218, 33, 33),
                })
                TimescaleUtilities.Delay(0.1, function() -- Line: 404 -- upvalues: a1 (upval)
                    a1:_animateVignette({
                        transparency = 1,
                        tweenInfo = TweenInfo.new(12, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        color = Color3.fromRGB(0, 0, 0),
                    })
                end)
            end)
            a1:_flash()
            a1:Shake(2, 1.2)
            local v2 = {
                goal = a1_2.goal,
                dtMultiplier = a1_2.dtMultiplier,
                gravity = a1_2.gravity,
                velocity = a1_2.velocity,
            }
            local u58 = Narrator.FlingBall.Part:Clone()
            u58.Parent = workspace.Trash
            u58.Position = Position
            v2.start = u58.CFrame.Position
            ;(ItemDrop.Drop(v2.start, v2.goal, u58, v2.dtMultiplier * Random.new():NextNumber(0.95, 1.05), v2.gravity, v2.velocity, function(a1, a2, a3) -- Line: 441
                return CFrame.lookAt(a3, a2).Rotation
            end)):andThen(function() -- Line: 444
                -- upvalues: a1 (upval), Narrator (upval), a1_2 (val), EmitterManager (upval), u58 (val)
                -- upvalues: TimescaleUtilities (upval)
                a1.legacySounds.BaseAttackHit:Play()
                local v1 = Narrator.BaseExplosion:Clone()
                v1.Parent = workspace.Trash
                v1.Position = a1_2.goal
                EmitterManager.manualEmit(v1)
                a1:Shake(1, 0.3)
                u58:Destroy()
                TimescaleUtilities.CleanUp(v1, 5)
            end)
            for i, j in {"left", "right"} do
                local u100 = a1._hands[j]
                v1 = a1[u100.handName .. "spring"]
                v1.v = v1.v + 7
                EmitterManager.manualEmit(u100.handModel.ParticleRef.MuzzleFlash.Value)
                u100:StopAnimation("ShootStart")
                u100:PlayAnimation("Shoot")
                u100.handModel.Mesh.Material = Enum.Material.Neon
                TweenService:Create(
                    u100.handModel.Mesh,
                    TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Color = Color3.fromRGB(255, 72, 133)}
                ):Play()
                TimescaleUtilities.Delay(0.17, function() -- Line: 474 -- upvalues: u100 (val), TweenService (upval)
                    u100.handModel.Mesh.Material = Enum.Material.Plastic
                    TweenService:Create(
                        u100.handModel.Mesh,
                        TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        {Color = Color3.fromRGB(252, 250, 255)}
                    ):Play()
                end)
            end
        end,
        AreaIndicator = function(a1_2, a2, a3, a4) -- Line: 488
            -- upvalues: HttpService (upval), AreaIndicatorStore (upval), a1 (val)
            local v1 = HttpService:GenerateGUID(false)
            local create = AreaIndicatorStore.create
            local v2 = {type = if not (a1_2 > 0) then "full" else "normal", radius = a2}
            local v3 = false
            if a1_2 > 0 then
                v3 = 0
            end
            v2.initialAngle = v3
            v3 = false
            if a1_2 > 0 then
                v3 = a1_2
            end
            v2.desiredAngle = v3
            v2.color3 = Color3.fromRGB(255, 0, 64)
            v3 = false
            if a1_2 > 0 then
                v3 = a3
            end
            v2.cframe = v3
            local Position = false
            if a1_2 == 0 then
                Position = a3.Position
            end
            v2.position = Position
            v2.tweenInfo = TweenInfo.new(0.25)
            v2.lifeTime = a4
            create(v1, v2)
            a1:Wait(a4 + 1)
            AreaIndicatorStore.remove(v1)
        end,
    }
    a1.stateManager:addStates((require(script:WaitForChild("NarratorAnimatorStates"))))
    a1.stateManager:changeState("Walk", a1)
    a1._hands = {
        left = HandClientClass.new(a1, "Left"),
        right = HandClientClass.new(a1, "Right"),
    }
    a1:BindToStep("HandStep", function(a1_2) -- Line: 515 -- upvalues: a1 (val)
        for i, j in a1._hands do
            j:Step(a1_2)
        end
    end)
    a1.Maid:Mark(function() -- Line: 521 -- upvalues: a1 (val)
        for i, j in a1._hands do
            j:Destroy()
        end
    end)
end

function v1._animateVignette(a1, a2) -- Line: 528 -- upvalues: VignetteStore (val)
    VignetteStore.setAnimationData({transparency = a2.transparency, tweenInfo = a2.tweenInfo, color = a2.color})
end

function v1._animateLoop(a1, a2) -- Line: 536 -- upvalues: TimescaleUtilities (val)
    local u5 = a1:animate("Intro")
    local u9 = a1:animate("Loop")
    a1._delay = TimescaleUtilities.Delay(a2, function() -- Line: 540 -- upvalues: u5 (val), u9 (val), a1 (val)
        u5:Stop()
        u9:Stop()
        a1:animate("Outro")
    end)
end

function v1:_cancelAnimateLoop(a2) -- Line: 547
    if self._delay then
        task.cancel(self._delay)
        self._delay = nil
    end
    self:StopAnimation("Intro", a2)
    self:StopAnimation("Loop", a2)
end

function v1._flash(a1) -- Line: 557 -- upvalues: Lighting (val), TweenService (val), TimescaleUtilities (val)
    local ExposureCompensation = Lighting.ExposureCompensation
    TweenService:Create(Lighting, TweenInfo.new(0.06), {ExposureCompensation = 2}):Play()
    TimescaleUtilities.Delay(0.06, function() -- Line: 561 -- upvalues: TweenService (upval), Lighting (upval), ExposureCompensation (val)
        TweenService:Create(
            Lighting,
            TweenInfo.new(6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            {ExposureCompensation = ExposureCompensation}
        ):Play()
    end)
end

function v1:StopAnimation(a2, a3) -- Line: 570 -- types: self: table, a2: string
    local v1 = self.animations[a2]
    if v1 then
        v1:Stop(a3)
    end
end

function v1:animate(a2, a3) -- Line: 577 -- types: self: table, a2: string, a3: number?
    local v1 = self.animations[a2]
    if v1 then
        v1:Play(a3 or 0.2, 1, 1)
    end
    return v1.Controller
end

function v1.playSound(a1, a2) -- Line: 586 -- types: a1: table, a2: string
    local v1 = a1.sounds[a2]
    if v1 then
        v1:Play()
    end
end

function v1.Shake(a1, a2, a3) -- Line: 593 -- upvalues: Shaker (val) -- types: a1: table, a2: number, a3: number
    Shaker:Shake({a2, 10, 0.1, 1}, a3, 0.25)
end

function v1:createSpotlight(a2, a3, a4) -- Line: 597
    -- upvalues: Producer (val), TweenService (val)
    local v1 = a3 * 2 * 1.33
    local v2 = Vector3.new(0.001, v1, v1)
    local v3 = if not a4 then Producer.ProducerSpotlight:Clone() else Producer.DebuffSpotlight:Clone()
    v3.Size = Vector3.new(0.0010000000474974513, 0.0010000000474974513, 0.0010000000474974513)
    local LightRay = v3.LightRay
    local Width0 = LightRay.Width0
    LightRay.Width0 = 0
    LightRay.Width1 = 0
    v3.Parent = workspace.CurrentCamera
    v3.CFrame = (CFrame.new(a2 + Vector3.new(0, 0.10000000149011612, 0))) * CFrame.Angles(0, 0, 1.5707963267948966)
    TweenService:Create(v3, TweenInfo.new(1), {Size = v2}):Play()
    TweenService:Create(LightRay, TweenInfo.new(1), {Width0 = Width0, Width1 = v1}):Play()
    local CanvasGroup = v3.SurfaceGui.CanvasGroup
    CanvasGroup.Transparency = 1
    TweenService:Create(CanvasGroup, TweenInfo.new(3), {GroupTransparency = 0}):Play()
    self.Maid:Mark(v3)
    return v3
end

function v1.CameraShakeFromEnemy(a1, a2) -- Line: 634 -- upvalues: Shaker (val) -- types: a1: table, a2: number
    Shaker:Shake({a2, 10, 0.1, 1}, 0.1, 0.25, {radius = 30, position = a1.Model.PrimaryPart.Position})
end

return v1