-- Script path: ReplicatedStorage.Content.NewEnemies.Toilet Boss.Animator
-- Decompile time: 3.81 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)

function v1.Initialize(a1) -- Line: 21
    -- upvalues: Animation (val), TweenService (val), Shaker (val), EmitterManager (val), GameState (val)
    a1.barrageState = false
    a1.targetPosition = Vector3.new(0, 0, 0)
    a1.laserStarted = workspace:GetServerTimeNow()
    a1.dead = false
    local Cannons = a1.Model:WaitForChild("Cannons")
    a1.laserAnimation = Animation.new({
        Track = a1.Model.Animations.Laser,
        Target = a1.Model.AnimationController,
    })

    function a1.Face(a1_2) -- Line: 37 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        return CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    a1.Executables = {
        Barrage = function(a1_2, a2, a3, a4) -- Line: 47 -- upvalues: a1 (val), TweenService (upval), Shaker (upval), Cannons (val)
            local v1, v2
            local HumanoidRootPart = a1.Model.HumanoidRootPart
            if not a1_2 then
                a1.laserAnimation:Stop()
                a1.Model.Head.Laser:Stop()
            else
                a1.targetPosition = a2
                a1.laserStarted = a3
                local v3 = a1.Face(a2)
                TweenService:Create(
                    a1.Model.HumanoidRootPart,
                    TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.In, 0, false, 0),
                    {CFrame = v3}
                ):Play()
                a1.laserAnimation:Play()
                a1.Model.Head.Laser:Play()
                Shaker:Shake({1.5, 20, 0.1, 1}, a4, 0.5)
            end
            a1.barrageState = a1_2
            for i = 1, a1.ControllerStats.laserCount do
                v1 = Cannons:FindFirstChild("Cannon" .. i)
                v2 = HumanoidRootPart:FindFirstChild("BeamEnd" .. i)
                if v1 and v2 then
                    for k, v in pairs(v2:GetChildren()) do
                        if v:IsA("ParticleEmitter") or v:IsA("Beam") then
                            v.Enabled = a1_2
                        end
                    end
                end
            end
        end,
        Summon = function() -- Line: 82 -- upvalues: Animation (upval), a1 (val), Shaker (upval)
            Animation.new({
                Track = a1.Model.Animations.Summon,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Taunt:Play()
            Shaker:Shake({1.5, 20, 0.1, 1}, 0.2, 0.5)
        end,
        Death = function() -- Line: 93 -- upvalues: Animation (upval), a1 (val), EmitterManager (upval), Shaker (upval)
            local v1
            local u10 = Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            })
            u10:Play()
            a1.Model.Head.Died:Play()
            task.defer(function() -- Line: 102 -- upvalues: u10 (val)
                while u10.Controller.Length == 0 do
                    task.wait()
                end
                task.wait(u10.Controller.Length * 0.98)
                u10.Controller:AdjustSpeed(0)
            end)
            for i = 1, 6 do
                v1 = Vector3.new(Random.new():NextNumber(-4, 4), Random.new():NextNumber(-4, 4), (Random.new():NextNumber(-4, 4)))
                EmitterManager.Emit("ImpactExplosion", CFrame.new(a1.Model.HumanoidRootPart.Position + v1), 3)
                Shaker:Shake({1.5, 20, 0.1, 1}, 0.2, 0.5)
                a1:Delay(0.2)
            end
        end,
    }
    a1.Model.Head.Taunt:Play()

    function a1.OnStepFunction(a1_2) -- Line: 134 -- upvalues: a1 (val), GameState (upval), Cannons (val)
        if a1.barrageState and not a1.dead then
            local v1, v2, v3, v4
            local HumanoidRootPart = a1.Model.HumanoidRootPart
            local v5 = workspace:GetServerTimeNow() - a1.laserStarted
            local v6 = math.sin(v5 * 2 * GameState.TimeScale) * 0.7853981633974483
            for i = 1, a1.ControllerStats.laserCount do
                v3 = Cannons:FindFirstChild("Cannon" .. i)
                v4 = HumanoidRootPart:FindFirstChild("BeamEnd" .. i)
                if v3 and v4 then
                    v1 = (math.noise(v5 * 4 * GameState.TimeScale + i * 2342 * 0.01)) * a1.ControllerStats.laserRadius
                    v2 = (math.noise(v5 * 4 * GameState.TimeScale + i * 2345931 * 0.01)) * a1.ControllerStats.laserRadius
                    v4.WorldCFrame = v4.WorldCFrame:Lerp(
                        CFrame.new((HumanoidRootPart.CFrame * CFrame.Angles(0, v6, 0) * CFrame.new(0, 0, -a1.ControllerStats.laserRange) + Vector3.new(v1, 0, v2)).Position),
                        a1_2 * 6
                    )
                end
            end
        end
    end
end

return v1