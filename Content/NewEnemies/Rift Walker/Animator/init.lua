-- Script path: ReplicatedStorage.Content.NewEnemies.Rift Walker.Animator
-- Decompile time: 7.74 ms

local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local Bezier = require(ReplicatedStorage.Shared.Modules.Bezier)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local VignetteStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.VignetteStore)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local Death2 = ReplicatedStorage.Assets.Effects.Mob.FallenKing.Death2
local u109 = ReplicatedStorage.Assets.Effects.Mob["Rift Walker"]
local u110 = {}
u110.__index = u110
local u111 = {
    ["NullBeam Part1"] = 71514402882000,
    ["NullBeam Part2"] = 111728440432469,
    ["Dimensional Shift Part2"] = 114756846070566,
    ["Dimensional Shift Part1"] = 125291422027143,
    ["Null Invasion Part2"] = 104667911030054,
    ["Null Invasion Part1"] = 138517591771282,
    ["Dimensional Discharge Boom"] = 77202367836813,
    ["Dimensional Discharge Part3"] = 99730488724237,
    ["Dimensional Discharge Part2"] = 133047156486987,
    ["Dimensional Discharge Part1"] = 128846094594271,
    MumbleLoop = 94527264236708,
    BubbleLoop = 102792775961064,
    BubbleAttack = 88419329428080,
    BubbleExplosion = 91473316323773,
    TrailLoop = 104509335480882,
    Exo = 126161369679113,
    Rage = 97163080605746,
    Dead = 81703029573794,
}

function u110.Initialize(a1) -- Line: 64
    -- upvalues: StateManager (val), Maid (val), Animation (val), u111 (val), Create (val), TimescaleUtilities (val)
    -- upvalues: Death2 (val), u110 (val), Lighting (val), TweenService (val), VignetteStore (val)
    -- upvalues: EffectsController (val), u109 (val), EmitterManager (val), Bezier (val), RunService (val)
    -- upvalues: GameState (val), spr (val)
    local v1
    local u121 = Random.new()
    local Animations = a1.Model.Animations
    a1.stateManager = StateManager.new()
    a1.stateManager:addStates((require(script:WaitForChild("RiftWalkerAnimatorStates"))))
    a1.animations = {}
    a1.sounds = {}
    a1._portalMaid = Maid.new()
    a1.Maid:Mark(a1._portalMaid)
    task.defer(function() -- Line: 79 -- upvalues: a1 (val)
        (a1.WalkTrack:GetMarkerReachedSignal("Stomp")):Connect(function() -- Line: 80 -- upvalues: a1 (upval)
            local v1 = a1.sounds["Stomp" .. math.random(1, 2)]
            if v1 then
                v1:Play()
            end
        end)
    end)
    for i, j in Animations:GetChildren() do
        v1 = Animation.new({
            IgnorePriority = true,
            Preload = true,
            Track = j,
            Target = a1.Model.AnimationController.Animator,
        })
        a1.animations[j.Name] = v1
    end
    local v2 = nil
    local v3 = nil
    for k, n in u111, v2, v3 do
        v1 = Create("Sound", {
            Name = k,
            SoundId = "rbxassetid://" .. tostring(n),
            Volume = if k ~= "Exo" then 3.5 else 0.7,
            Looped = string.match(k, "Loop$"),
        })
        v1.Parent = a1.Model.PrimaryPart
        if k == "Exo" then
            v1.Parent = workspace
        end
        a1.sounds[k] = v1
    end

    function a1._waitForAnimation(a1, a2, a3) -- Line: 113
        -- upvalues: TimescaleUtilities (upval)
        if not a1.Replicator:Get("RageWalk") then
            if a3 then
                TimescaleUtilities.Delay(a2, a3)
                return
            end
            TimescaleUtilities.Wait(a2)
        end
    end

    function a1._playAnimation(a1, a2, a3) -- Line: 123
        local v1 = a1.animations[a2]
        if v1 then
            if not a1.Replicator:Get("RageWalk") then
                local WalkEnd = a1.animations.WalkEnd
                WalkEnd:Play()
                WalkEnd.Controller.Stopped:Wait()
            end
            a1.animations.standingStill:Play()
            v1:Play()
        end
    end

    function a1._continueWalk(a1) -- Line: 137
        if not a1.Replicator:Get("RageWalk") then
            a1.animations.WalkIntro:Play(0)
        end
        a1.animations.standingStill:Stop(1)
    end

    function u110._createBeam(a1, a2, a3) -- Line: 153 -- upvalues: Death2 (upval)
        local v1 = Death2:Clone()
        v1.Cylinder.Size = Vector3.new(a3, 400, a3)
        v1.Cylinder.Transparency = 0.5
        v1.flip.Transparency = 0.8
        v1.flip.Size = Vector3.new(a3 + 5, 400, a3 + 5)
        v1:PivotTo(a2 * (v1:GetPivot()).Rotation)
        return v1
    end

    function u110._flash(a1) -- Line: 166
        -- upvalues: Lighting (upval), TweenService (upval), TimescaleUtilities (upval)
        local ExposureCompensation = Lighting.ExposureCompensation
        TweenService:Create(Lighting, TweenInfo.new(0.06), {ExposureCompensation = 2}):Play()
        TimescaleUtilities.Delay(0.06, function() -- Line: 170 -- upvalues: TweenService (upval), Lighting (upval), ExposureCompensation (val)
            TweenService:Create(
                Lighting,
                TweenInfo.new(6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {ExposureCompensation = ExposureCompensation}
            ):Play()
        end)
    end

    function u110._animateVignette(a1, a2) -- Line: 179 -- upvalues: VignetteStore (upval)
        VignetteStore.setAnimationData({
            transparency = a2.transparency,
            tweenInfo = a2.tweenInfo,
            color = a2.color,
        })
    end

    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Parent = Lighting
    ColorCorrectionEffect.Name = "RiftWalkerCC"
    a1.Maid:Mark(function() -- Line: 191 -- upvalues: ColorCorrectionEffect (val)
        ColorCorrectionEffect:Destroy()
    end)

    function u110._animateCC(a1, a2) -- Line: 195 -- upvalues: TweenService (upval), ColorCorrectionEffect (val)
        TweenService:Create(ColorCorrectionEffect, a2.tweenInfo, a2.data):Play()
    end

    a1.Executables = {
        LordExoFire = function() -- Line: 200 -- upvalues: a1 (val)
            a1.sounds.Exo:Stop()
        end,
        PathChange = function(a1_2, a2) -- Line: 204
            -- upvalues: a1 (val), EffectsController (upval), TweenService (upval), u109 (upval), EmitterManager (upval)
            -- upvalues: TimescaleUtilities (upval)
            local v1, v2, v3
            a1.PathDistance = a2
            a1.PathName = a1_2
            a1:RefreshPath(nil, nil, true)
            local Position = a1.Position
            local Scalar = a1.Path:GetScalar(a2 + 1)
            a1.LastPosition = Scalar
            local v4 = (CFrame.new(Position, Scalar)) * CFrame.new(0, a1.Height + 1, 0)
            EffectsController.GroundSmash(CFrame.new(Position), 50)
            local v5 = a1:_createBeam(CFrame.new(Position), 50)
            v5.Parent = workspace.Trash
            for i, j in v5:GetDescendants() do
                if j:IsA("BasePart") then
                    v1 = TweenService
                    v2 = TweenInfo.new(0.3)
                    v3 = {Size = Vector3.new(0, 400, 0)}
                    v1:Create(j, v2, v3):Play()
                end
            end
            a1:_flash()
            local v6 = u109.LaneSwitch:Clone()
            v6.Parent = workspace.Trash
            v6:PivotTo(a1.Model.PrimaryPart.CFrame)
            EmitterManager.manualEmit(v6)
            TimescaleUtilities.CleanUp(v6, 3)
            a1.Model.PrimaryPart.CFrame = v4
            TimescaleUtilities.CleanUp(v5, 0.5)
        end,
        SpawnPortal = function(a1_2) -- Line: 243
            -- upvalues: a1 (val), u121 (val), Bezier (upval), u109 (upval), RunService (upval), GameState (upval)
            -- upvalues: TimescaleUtilities (upval), spr (upval), TweenService (upval), EmitterManager (upval)
            task.spawn(function() -- Line: 244
                -- upvalues: a1 (upval), a1_2 (val), u121 (upval), Bezier (upval), u109 (upval), RunService (upval)
                -- upvalues: GameState (upval), TimescaleUtilities (upval)
                local WorldPosition, v1, v2, v3, v4
                for i = 1, 4 do
                    WorldPosition = a1.Model.StaffGlow.Value.WorldPosition
                    v2 = a1_2.position + Vector3.new(u121:NextNumber(-20, 20), 10, (u121:NextNumber(-20, 20)))
                    v3 = (a1_2.position + v2) / 2 + Vector3.new(u121:NextNumber(-12, 12), 15, (u121:NextNumber(-12, 12)))
                    v4 = a1_2.position + Vector3.new(0, 4, 0)
                    local u58 = Bezier.new(WorldPosition, v2, v3, v4)
                    local u63 = u109.Trail:Clone()
                    u63.Position = u58:Get(0)
                    u63.Parent = workspace.Trash
                    local u70 = 0
                    local u71 = nil
                    v1 = RunService.Heartbeat:Connect(function(a1) -- Line: 265
                        -- upvalues: u70 (ref), GameState (upval), u63 (val), u58 (val), u71 (ref)
                        -- upvalues: TimescaleUtilities (upval)
                        u70 = u70 + a1 * 2 * GameState.TimeScale
                        local v1 = math.clamp(u70, 0, 1)
                        u63.Position = u58:Get(v1)
                        if v1 >= 1 then
                            u71:Disconnect()
                            TimescaleUtilities.CleanUp(u63, 2)
                        end
                    end)
                    TimescaleUtilities.Wait(u121:NextNumber(0.1, 0.2))
                end
            end)
            local u9 = u109.PortalEffects.BeforeSpawn:Clone()
            local u15 = u109.PortalEffects.Portal:Clone()
            u9:ScaleTo(0.01)
            u9.Parent = workspace.Trash
            local v1 = CFrame.new(0, 4, 0)
            local u31 = CFrame.new(a1_2.position, a1_2.lookAt) * v1
            u9:PivotTo(u31)
            local u36 = {size = 0.01}
            local u37 = {size = 0.01}
            spr.target(u36, 0.58, 2, {size = 1})
            a1._portalMaid:Mark((RunService.Heartbeat:Connect(function(a1) -- Line: 303 -- upvalues: u9 (val), u36 (val), u15 (val), u37 (val) -- types: a1: number
                u9:ScaleTo((math.max(u36.size, 0.01)))
                u15:ScaleTo((math.max(u37.size, 0.01)))
            end)))
            a1:Delay(1.3, function() -- Line: 308
                -- upvalues: TweenService (upval), u9 (val), TimescaleUtilities (upval), a1 (upval), u109 (upval)
                -- upvalues: u31 (val), EmitterManager (upval), u15 (val), spr (upval), u37 (val), u36 (val)
                TweenService:Create(u9.BeforeSpawn.Attachment.PointLight, TweenInfo.new(0.05), {Brightness = 10}):Play()
                TimescaleUtilities.Delay(0.05, function() -- Line: 315 -- upvalues: TweenService (upval), u9 (upval)
                    TweenService:Create(
                        u9.BeforeSpawn.Attachment.PointLight,
                        TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        {Brightness = 1}
                    ):Play()
                end)
                a1:CameraShake(1)
                for i, j in u9:GetDescendants() do
                    if j:IsA("ParticleEmitter") then
                        j.Enabled = false
                    end
                end
                local v1 = u109.ExplosionEffect:Clone()
                v1.Parent = workspace.Trash
                v1:PivotTo(u31)
                EmitterManager.manualEmit(v1)
                u15:PivotTo(u31)
                u15.Parent = workspace.Trash
                spr.target(u37, 0.2, 1, {size = 1})
                TimescaleUtilities.Wait(6)
                spr.target(u37, 0.2, 1, {size = 0})
                spr.target(u36, 0.58, 2, {size = 0})
                TimescaleUtilities.Delay(2, function() -- Line: 355 -- upvalues: u15 (upval), a1 (upval)
                    u15:Destroy()
                    a1._portalMaid:Sweep()
                end)
            end)
        end,
        ChangeState = function(a1_2, ...) -- Line: 362 -- upvalues: a1 (val) -- types: a1_2: string
            if a1._currentStateName == a1_2 then
                return
            end
            warn("changing state", a1_2)
            a1.stateManager:changeState(a1_2, a1, ...)
            a1._currentStateName = a1_2
        end,
    }
    a1.stateManager:changeState("Walk", a1)
    a1._currentStateName = "Walk"
end

function u110.CameraShake(a1, a2) -- Line: 376 -- upvalues: Shaker (val) -- types: a1: table, a2: number
    Shaker:Shake({a2, 10, 0.1, 1}, 0.2, 0.5)
end

function u110.CreateAreaIndicator(a1, a2) -- Line: 380
    -- upvalues: HttpService (val), AreaIndicatorStore (val), TimescaleUtilities (val)
    local u6 = HttpService:GenerateGUID(false)
    local create = AreaIndicatorStore.create
    local v1 = {type = if not (a2.angle < 360) then "full" else "normal", radius = a2.radius}
    local v2 = false
    if a2.angle < 360 then
        v2 = 0
    end
    v1.initialAngle = v2
    local angle = false
    if a2.angle < 360 then
        angle = a2.angle
    end
    v1.desiredAngle = angle
    v1.color3 = Color3.fromRGB(255, 0, 64)
    local cframe = false
    if a2.angle < 360 then
        cframe = a2.cframe
    end
    v1.cframe = cframe
    local Position = false
    if a2.angle == 360 then
        Position = a2.cframe.Position
    end
    v1.position = Position
    v1.tweenInfo = TweenInfo.new(0.25)
    v1.lifeTime = a2.openTime
    create(u6, v1)
    TimescaleUtilities.Delay(a2.openTime + 1, function() -- Line: 393 -- upvalues: AreaIndicatorStore (upval), u6 (val)
        AreaIndicatorStore.remove(u6)
    end)
    return u6
end

return u110