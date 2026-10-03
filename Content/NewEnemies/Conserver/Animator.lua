-- Script path: ReplicatedStorage.Content.NewEnemies.Conserver.Animator
-- Decompile time: 4.81 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
local Conserver = ReplicatedStorage.Assets.Effects.Mob.Conserver
v1.__index = v1

function v1.Initialize(a1) -- Line: 13
    -- upvalues: Animation (val), TimescaleUtilities (val), Conserver (val), EmitterManager (val), TweenService (val)
    -- upvalues: EffectsController (val)
    a1._animations = {}
    a1._animationFunctions = {}
    local Animator = a1.Model.AnimationController.Animator
    for i, j in a1.Model.Animations:GetChildren() do
        a1._animations[j.Name] = (Animation.new({
            IgnorePriority = true,
            IsPersistent = true,
            Preload = true,
            Track = j,
            Target = Animator,
        }))
    end
    a1.Maid:Mark((task.spawn(function() -- Line: 30 -- upvalues: a1 (val)
        while a1:IsAlive() do
            a1.Model.HumanoidRootPart[("Conserver Noise %*"):format((math.random(1, 5)))]:Play()
            task.wait(math.random(10, 20))
        end
    end)))
    a1.Executables = {
        PlaySound = function(a1_2) -- Line: 41 -- upvalues: a1 (val)
            if a1.Model.HumanoidRootPart:FindFirstChild(a1_2) then
                a1.Model.HumanoidRootPart[a1_2]:Play()
            end
        end,
        ScreamEffect = function() -- Line: 47 -- upvalues: a1 (val), TimescaleUtilities (upval)
            for i, j in a1.Model.Head.Scream:GetChildren() do
                j.Enabled = true
                TimescaleUtilities.Delay(1, function() -- Line: 50 -- upvalues: j (val)
                    j.Enabled = false
                end)
            end
        end,
        Spirit = function(a1, a2, a3) -- Line: 56 -- upvalues: Conserver (upval), EmitterManager (upval)
            local u4 = CFrame.new()
            local u9 = Conserver.Trail:Clone()
            u9.Parent = workspace
            u9:PivotTo((CFrame.new(Vector3.new(), a3)))
            local u19 = nil
            local u20 = 0
            local v1 = (game:GetService("RunService")).RenderStepped:Connect(function(a1_2) -- Line: 65
                -- upvalues: u20 (ref), a1 (val), u9 (val), EmitterManager (upval), a3 (val), u19 (ref), a2 (val)
                -- upvalues: u4 (ref)
                u20 = u20 + a1_2 / a1
                if u9 and u9.Parent and not (u20 >= 1) then
                    local v1 = CFrame.new(math.noise(u20) * 25, math.noise(u20 * 2) * 12, 0)
                    local v2 = CFrame.new((a2:Lerp(a3, u20))) * v1
                    u9:PivotTo((CFrame.new(v2.Position, v2.Position - (u4.Position - v2.Position).Unit * 2)))
                    u4 = v2
                    return
                end
                if u9 and u9.Parent then
                    EmitterManager.Emit("ConserverImpact", CFrame.new(a3), 10)
                    u9:Destroy()
                end
                u19:Disconnect()
            end)
        end,
        Thorn = function(a1_2, a2, a3, a4, a5) -- Line: 91
            -- upvalues: Conserver (upval), TweenService (upval), TimescaleUtilities (upval), EffectsController (upval)
            -- upvalues: a1 (val)
            local v1, v2
            local v3 = a3 - Vector3.new(0, 1.25, 0)
            local v4 = a4 - Vector3.new(0, 1.25, 0)
            local u13 = Conserver.VineProjectile:Clone()
            u13.Parent = workspace
            u13:PivotTo((CFrame.new(v4, v3)))
            u13.Part.Position = v3
            local v5 = {Position = v4}
            TweenService:Create(u13.Part, TweenInfo.new(a2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), v5):Play()
            TimescaleUtilities.CleanUp(u13, a2 + 1)
            TimescaleUtilities.Delay(1, function() -- Line: 109 -- upvalues: u13 (val)
                for i, j in u13:GetDescendants() do
                    if j:IsA("ParticleEmitter") or j:IsA("Beam") then
                        j.Enabled = false
                    end
                end
            end)
            for i = 0, 100, 10 do
                v2 = v3:Lerp(v4, i / 100)
                v5 = (Color3.fromRGB(255, 136, 0)):Lerp(Color3.fromRGB(0, 0, 0), i / 100)
                v1 = {
                    radius = 4,
                    growthTime = 0.25,
                    cframe = CFrame.new(v2, v2 + a5),
                    baseColor = v5,
                    thornsColor = v5,
                    brightness = (1 - i / 100) * 5,
                    material = Enum.Material.Neon,
                }
                u87, u88 = EffectsController.CreateVines(v1)
                TimescaleUtilities.Delay(0.5, function() -- Line: 131 -- upvalues: u87 (val), TweenService (upval), u88 (val), TimescaleUtilities (upval)
                    local v1, v2
                    for i, j in u87:GetDescendants() do
                        if j:IsA("BasePart") then
                            v1 = TweenService
                            v2 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
                            v1:Create(j, v2, {Transparency = 1}):Play()
                        end
                    end
                    u88(0.25)
                    TimescaleUtilities.Wait(0.25)
                    u87:Destroy()
                end)
                a1:Delay(0.075)
            end
        end,
        HealthGain = function() -- Line: 155 -- upvalues: a1 (val), TimescaleUtilities (upval)
            for i, j in a1.Model.HumanoidRootPart.BossHeal:GetDescendants() do
                if j:IsA("Beam") or j:IsA("ParticleEmitter") then
                    j.Enabled = true
                    TimescaleUtilities.Delay(3, function() -- Line: 159 -- upvalues: j (val)
                        j.Enabled = false
                    end)
                end
            end
        end,
        Death = function() -- Line: 166 -- upvalues: a1 (val)
            for i, j in a1.Model.HumanoidRootPart:GetChildren() do
                if j:IsA("Sound") then
                    j:Stop()
                end
            end
            for k, n in a1._animations do
                n:Stop()
            end
            a1._animations.Death:Play()
        end,
        Face = function(a1_2, a2) -- Line: 178 -- upvalues: a1 (val), TweenService (upval)
            local v1 = CFrame.new(a1.Model.HumanoidRootPart.Position, (Vector3.new(a2.X, a1.Model.HumanoidRootPart.Position.Y, a2.Z)))
            TweenService:Create(
                a1.Model.HumanoidRootPart,
                TweenInfo.new(a1_2 or 1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                {CFrame = v1}
            ):Play()
        end,
        Animation = function(a1_2) -- Line: 191 -- upvalues: a1 (val)
            if a1._animationFunctions[a1_2] then
                a1._animationFunctions[a1_2]()
                return
            end
            a1._animations[a1_2]:Play()
        end,
    }
end

return v1