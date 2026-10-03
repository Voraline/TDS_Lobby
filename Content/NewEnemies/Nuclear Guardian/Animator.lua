-- Script path: ReplicatedStorage.Content.NewEnemies.Nuclear Guardian.Animator
-- Decompile time: 2.47 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 12
    -- upvalues: Animation (val), TweenService (val), GameState (val), EffectsController (val)
    function a1.Face(a1_2) -- Line: 15 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        return CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    a1.Executables = {
        Stab = function(a1_2) -- Line: 25 -- upvalues: Animation (upval), a1 (val), TweenService (upval)
            Animation.new({
                Track = a1.Model.Animations.Attack,
                Target = a1.Model.AnimationController,
            }):Play()
            local v1 = a1.Face(a1_2)
            TweenService:Create(
                a1.Model.HumanoidRootPart,
                TweenInfo.new(0.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.In, 0, false, 0),
                {CFrame = v1}
            ):Play()
            a1:Delay(0.7)
            a1.Model.Head.Slash:Play()
        end,
        Death = function() -- Line: 49
            -- upvalues: Animation (upval), a1 (val), TweenService (upval), GameState (upval), EffectsController (upval)
            local v1, v2, v3, v4, v5
            local u10 = Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            })
            u10:Play()
            a1.Model.Head.Scream:Play()
            task.defer(function() -- Line: 59 -- upvalues: u10 (val), a1 (upval)
                while u10.Controller.Length == 0 do
                    task.wait()
                end
                a1:Delay(u10.Controller.Length * 0.98)
                u10.Controller:AdjustSpeed(0)
            end)
            local v6 = tick()
            for k, v in pairs(a1.Model:GetDescendants()) do
                if v:IsA("BasePart") and v.Material == Enum.Material.Neon then
                    v5 = TweenService
                    v1 = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
                    v2 = {Color = Color3.new(0.0823529, 0.0823529, 0.0823529)}
                    v5:Create(v, v1, v2):Play()
                end
            end
            for k2, i in pairs(a1.Model.Torso.DeathParticle:GetChildren()) do
                if i:IsA("ParticleEmitter") then
                    i.Enabled = true
                end
            end
            while true do
                if not ((tick() - v6) * GameState.TimeScale < 4.2) then
                    break
                end
                v3 = CFrame.new(Random.new():NextNumber(-2.5, 2.5), Random.new():NextNumber(-1.25, 1.25), Random.new():NextNumber(-1.25, 1.25))
                v4 = a1.Model.HumanoidRootPart.CFrame * v3
                EffectsController.Explosion({
                    Position = v4.Position,
                    Radius = Random.new():NextNumber(1.5, 3.5),
                    Color = BrickColor.new(Color3.new(1, 0.666667, 0)),
                    Sound = 5264403010,
                    Material = Enum.Material.Neon,
                    Particles = true,
                    Visible = true,
                })
                a1:Delay((Random.new():NextNumber(0.2, 0.4)))
            end
            for k3, j in pairs(a1.Model.Torso.DeathParticle:GetChildren()) do
                if j:IsA("ParticleEmitter") and j.Name ~= "Smoke" then
                    j.Enabled = false
                end
            end
        end,
    }
end

return v1