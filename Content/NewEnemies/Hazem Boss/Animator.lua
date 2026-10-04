-- Script path: ReplicatedStorage.Content.NewEnemies.Hazem Boss.Animator
-- Decompile time: 3.06 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
require(ReplicatedStorage.Shared.Modules.spr)
local PlsDonate = ReplicatedStorage.Assets.Effects.Mob.PlsDonate
local v1 = {}
v1.__index = v1

function v1:_playAnimation(a2) -- Line: 23 -- types: self: table, a2: string
    self._animations[a2]:Play()
end

function v1._cameraShake(a1, a2) -- Line: 27 -- upvalues: Shaker (val) -- types: a1: table, a2: number
    Shaker:Shake({a2, 10, 0.1, 1}, 0.2, 0.5)
end

function v1:_toggleDragEffect(a2) -- Line: 31 -- types: self: table, a2: boolean
    for i, j in self.Model.Handle.Attachment:GetChildren() do
        j.Enabled = a2
    end
end

function v1._bright(a1) -- Line: 37 -- upvalues: TweenService (val), TimescaleUtilities (val)
    TweenService:Create(
        game.Lighting,
        TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        {ExposureCompensation = 1.25}
    ):Play()
    TimescaleUtilities.Delay(0.1, function() -- Line: 44 -- upvalues: TweenService (upval)
        TweenService:Create(
            game.Lighting,
            TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            {ExposureCompensation = 0}
        ):Play()
    end)
end

function v1.Initialize(a1) -- Line: 53
    -- upvalues: Animation (val), TweenService (val), PlsDonate (val), EmitterManager (val), ItemDrop (val)
    -- upvalues: TimescaleUtilities (val)
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._animations = {
        eurekaRain = Animation.new({
            Preload = true,
            Track = a1.Model.Animations.Rain,
            Target = AnimationController,
        }),
        death = Animation.new({
            Preload = true,
            Track = a1.Model.Animations.Death,
            Target = AnimationController,
        }),
        hammerSlam = Animation.new({
            Preload = true,
            Track = a1.Model.Animations.HammerSlam,
            Target = AnimationController,
        }),
        catSummon = Animation.new({
            Preload = true,
            Track = a1.Model.Animations.CatSummon,
            Target = AnimationController,
        }),
    }
    a1.Executables = {
        Death = function() -- Line: 80 -- upvalues: a1 (val)
            a1:_playAnimation("death")
            a1.Model.HumanoidRootPart.Death:Play()
        end,
        hammerSlam = function() -- Line: 84 -- upvalues: a1 (val), TweenService (upval), PlsDonate (upval), EmitterManager (upval)
            a1:_toggleDragEffect(false)
            a1.Model.HumanoidRootPart.HammerStun:Play()
            a1:_playAnimation("hammerSlam")
            a1:Delay(1.5)
            a1.Model.Handle.Effect.PointLight.Brightness = 15
            TweenService:Create(
                a1.Model.Handle.Effect.PointLight,
                TweenInfo.new(6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {Brightness = 0}
            ):Play()
            a1:_cameraShake(4)
            local v1 = PlsDonate.HammerSlam:Clone()
            v1.Parent = workspace
            a1:_bright()
            v1.CFrame = a1.Model.HumanoidRootPart.CFrame * CFrame.new(-1, -3, -6.7)
            EmitterManager.manualEmit(v1.Attachment)
            a1:Delay(1)
            a1:_toggleDragEffect(true)
        end,
        catSummon = function() -- Line: 109 -- upvalues: a1 (val)
            a1:_playAnimation("catSummon")
            a1.Model.HumanoidRootPart.CatSummon:Play()
            a1:Delay(2)
        end,
        playRain = function() -- Line: 115 -- upvalues: a1 (val), TweenService (upval), EmitterManager (upval)
            a1:_toggleDragEffect(false)
            a1.Model.HumanoidRootPart.RobuxSummon:Play()
            a1:_playAnimation("eurekaRain")
            a1:Delay(1)
            a1.Model.Handle.Effect.PointLight.Brightness = 15
            TweenService:Create(
                a1.Model.Handle.Effect.PointLight,
                TweenInfo.new(6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {Brightness = 0}
            ):Play()
            EmitterManager.manualEmit(a1.Model.Handle.Effect)
            a1:_cameraShake(2)
            a1:Delay(1)
            a1:_toggleDragEffect(true)
        end,
        rainVisalize = function(a1) -- Line: 134
            -- upvalues: PlsDonate (upval), ItemDrop (upval), EmitterManager (upval), TweenService (upval)
            -- upvalues: TimescaleUtilities (upval)
            local u5 = PlsDonate.Coin:Clone()
            u5.Position = a1.startPosition
            u5.Parent = workspace.Trash
            u5.Spawn:Play()
            ;(ItemDrop.Drop(a1.startPosition, a1.endPosition, u5, a1.dt, a1.gravity, a1.velocity, function(a1, a2, a3) -- Line: 147
                return ((CFrame.lookAt(a3, a2)) * CFrame.Angles(0, math.rad(a1) * 80, -math.rad(a1) * 20)).Rotation
            end)):andThen(function() -- Line: 153
                -- upvalues: u5 (val), PlsDonate (upval), a1 (val), EmitterManager (upval), TweenService (upval)
                -- upvalues: TimescaleUtilities (upval)
                u5.Impact:Play()
                local v1 = PlsDonate.CoinImpact:Clone()
                v1.Position = a1.endPosition
                v1.Parent = workspace.Trash
                EmitterManager.manualEmit(v1)
                u5["1"].PointLight.Brightness = 12
                TweenService:Create(
                    u5["1"].PointLight,
                    TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Brightness = 0}
                ):Play()
                u5.Transparency = 1
                for i, j in u5:GetDescendants() do
                    if j:IsA("ParticleEmitter") or j:IsA("Trail") then
                        j.Enabled = false
                    end
                end
                TimescaleUtilities.CleanUp(u5, 3)
                TimescaleUtilities.CleanUp(v1, 3)
            end)
        end,
    }
end

return v1