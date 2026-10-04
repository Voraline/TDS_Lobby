-- Script path: ReplicatedStorage.Content.Enemies.The Umbra.Animator
-- Decompile time: 9.24 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1
local Mob = ((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Mob")

function v1.Initialize(a1) -- Line: 20
    -- upvalues: Animation (val), TweenService (val), TimescaleUtilities (val), Shaker (val), EffectsController (val)
    -- upvalues: Mob (val), Lighting (val)
    a1.Bruh = false
    a1.StunConnection = nil
    local UmbraProp = workspace:WaitForChild("Map"):WaitForChild("Environment"):FindFirstChild("UmbraProp")
    if UmbraProp then
        UmbraProp:Destroy()
    end
    a1.Executables = {
        ShootBase = function(a1_2, a2, a3) -- Line: 36
            -- upvalues: Animation (upval), a1 (val), TweenService (upval), TimescaleUtilities (upval), Shaker (upval)
            -- upvalues: EffectsController (upval)
            local u13 = Animation.new({
                Track = a1.Model.Animations.fShoot,
                Target = a1.Model.AnimationController,
            })
            u13:Play()
            a1.Model.Head.Draw:Play()
            local Arrow = a1.Model:WaitForChild("Arrow")
            Arrow.Transparency = 0
            local u31 = nil
            local v1 = (u13.Controller:GetMarkerReachedSignal("Action")):Connect(function(a1_3) -- Line: 51
                -- upvalues: u13 (val), a1 (upval), Arrow (val), u31 (ref), a1_2 (val), TweenService (upval), a3 (val)
                -- upvalues: TimescaleUtilities (upval), Shaker (upval), EffectsController (upval)
                if a1_3 == "Freeze" then
                    u13.Controller:AdjustSpeed(0)
                    a1.Model.Head.Warning:Play()
                    for k4, k5 in pairs(Arrow.Effect:GetChildren()) do
                        if k5:IsA("ParticleEmitter") then
                            k5.Enabled = true
                        end
                    end
                    return
                end
                if a1_3 == "Fire" then
                    Arrow.Transparency = 1
                    a1.Model.Head.Fire:Play()
                    for k, v in pairs(Arrow.Effect:GetChildren()) do
                        if v:IsA("ParticleEmitter") then
                            v.Enabled = false
                            v:Clear()
                        end
                    end
                    u31 = Arrow:Clone()
                    u31.Effect:Destroy()
                    for k2, i in pairs(u31:GetChildren()) do
                        if not i:IsA("Attachment") then
                            i:Destroy()
                        end
                    end
                    for k3, j in pairs(u31.Flame:GetChildren()) do
                        if j:IsA("ParticleEmitter") then
                            j.Enabled = true
                        end
                    end
                    u31.Anchored = true
                    u31.Parent = workspace.CurrentCamera
                    u31.Transparency = 0
                    local v1 = (CFrame.new(u31.Position, a1_2)) * CFrame.Angles(1.5707963267948966, 0, 0)
                    local v2 = (CFrame.new(u31.Position, a1_2)) * CFrame.Angles(1.5707963267948966, 0, 0)
                    u31.CFrame = v2
                    local v3 = v2 - u31.Position
                    TweenService:Create(
                        u31,
                        TweenInfo.new(a3, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),
                        {CFrame = CFrame.new(a1_2) * v3}
                    ):Play()
                    game.Debris:AddItem(u31, a3)
                    TimescaleUtilities.Delay(a3, function() -- Line: 118 -- upvalues: Shaker (upval), EffectsController (upval), a1_2 (upval)
                        Shaker:Shake({2, 5, 0.25, 0.5}, 1.25, 0.5)
                        EffectsController.Explosion({
                            Position = a1_2,
                            Radius = 30,
                            Color = BrickColor.new("Bright orange"),
                            Sound = 560084389,
                            Material = Enum.Material.Neon,
                            Particles = true,
                            Visible = true,
                        })
                    end)
                end
            end)
            a1:Delay(a2)
            if not a1.Bruh then
                u13.Controller:AdjustSpeed(1)
            else
                u13:Stop(0.5)
                if u31 then
                    u31:Destroy()
                end
                for k, v in pairs(Arrow.Effect:GetChildren()) do
                    if v:IsA("ParticleEmitter") then
                        v.Enabled = false
                    end
                end
            end
        end,
        ShootUp = function(a1_2) -- Line: 152 -- upvalues: Animation (upval), a1 (val), TimescaleUtilities (upval)
            local u11 = Animation.new({
                Track = a1.Model.Animations.uShoot,
                Target = a1.Model.AnimationController,
            })
            u11:Play()
            a1.Model.Head.Draw:Play()
            local Arrow = a1.Model:WaitForChild("Arrow")
            Arrow.Transparency = 0
            local v1 = (u11.Controller:GetMarkerReachedSignal("Action")):Connect(function(a1_2) -- Line: 166 -- upvalues: u11 (val), Arrow (val), a1 (upval)
                if a1_2 == "Freeze" then
                    u11.Controller:AdjustSpeed(0)
                    for k2, i in pairs(Arrow.Effect:GetChildren()) do
                        if i:IsA("ParticleEmitter") then
                            i.Enabled = true
                        end
                    end
                    return
                end
                if a1_2 == "Fire" then
                    Arrow.Transparency = 1
                    a1.Model.Head.Fire:Play()
                    for k, v in pairs(Arrow.Effect:GetChildren()) do
                        if v:IsA("ParticleEmitter") then
                            v.Enabled = false
                        end
                    end
                end
            end)
            a1:Delay(a1_2)
            if not a1.Bruh then
                u11.Controller:AdjustSpeed(1)
                TimescaleUtilities.Delay(1.5, function() -- Line: 202 -- upvalues: u11 (val)
                    u11:Stop()
                end)
                return
            end
            u11:Stop(0.5)
            for k, v in pairs(Arrow.Effect:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    v.Enabled = false
                    v:Clear()
                end
            end
        end,
        Impact = function(a1, a2, a3) -- Line: 208 -- upvalues: Mob (upval), TweenService (upval), TimescaleUtilities (upval)
            local u170 = Mob:WaitForChild("ArrowRain"):Clone()
            local Arrow = u170:WaitForChild("Arrow")
            local Spike = u170:WaitForChild("Spike")
            local Warn = u170:WaitForChild("Warn")
            local SonicBoom = u170:WaitForChild("SonicBoom")
            local v1 = a1
            for k, v in pairs(u170:GetChildren()) do
                if v.Name == "SonicBoom" or v.Name == "Spike" or v.Name == "Warn" then
                    v.Size = Vector3.new(0, 0, 0)
                    v.Transparency = 1
                end
            end
            u170:SetPrimaryPartCFrame((CFrame.new(v1)) * (CFrame.Angles(0, math.rad((Random.new():NextNumber(0, 360))), 0)))
            u170:SetPrimaryPartCFrame((CFrame.new(v1)) * (CFrame.Angles(0, math.rad((Random.new():NextNumber(0, 360))), 0)))
            u170.Parent = workspace.CurrentCamera
            local u86 = a2 * 1.75
            Spike.CFrame = CFrame.new(v1)
            SonicBoom.CFrame = (CFrame.new(v1)) + Vector3.new(0, u86 / 3, 0)
            SonicBoom.Orientation = Vector3.new(90, -90, 0)
            Arrow.CFrame = Arrow.CFrame + Vector3.new(0, 200, 0)
            TweenService:Create(
                Arrow,
                TweenInfo.new(a3, Enum.EasingStyle.Cubic, Enum.EasingDirection.In, 0, false, 0),
                {CFrame = CFrame.new(v1)}
            ):Play()
            Warn.Transparency = 0
            TweenService:Create(
                Warn,
                TweenInfo.new(a3, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),
                {Size = Vector3.new(a2 * 2, a2 * 2, a2 * 2)}
            ):Play()
            TimescaleUtilities.Delay(a3, function() -- Line: 266 -- upvalues: Warn (val)
                Warn:Destroy()
            end)
            TimescaleUtilities.Delay(a3, function() -- Line: 270
                -- upvalues: Spike (val), TweenService (upval), a2 (val), u86 (val), SonicBoom (val), Arrow (val)
                -- upvalues: TimescaleUtilities (upval), a3 (val), u170 (val)
                Spike.Transparency = 0
                TweenService:Create(Spike, TweenInfo.new(0.35, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {
                    Transparency = 1,
                    Size = Vector3.new(a2 * 2, u86, a2 * 2),
                    CFrame = Spike.CFrame + Vector3.new(0, u86 / 2, 0),
                }):Play()
                SonicBoom.Transparency = 0
                TweenService:Create(
                    SonicBoom,
                    TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0),
                    {Transparency = 1, Size = Vector3.new(a2 * 2.35, a2 * 2.35, 0.4)}
                ):Play()
                TweenService:Create(
                    Arrow,
                    TweenInfo.new(6, Enum.EasingStyle.Cubic, Enum.EasingDirection.In, 0, false, 0),
                    {Transparency = 1}
                ):Play()
                Arrow.Hit:Play()
                TimescaleUtilities.Delay(a3 + 6, function() -- Line: 315 -- upvalues: u170 (upval)
                    u170:Destroy()
                end)
            end)
        end,
        Stun = function(a1_2) -- Line: 321 -- upvalues: a1 (val), Animation (upval)
            a1.Bruh = true
            local u13 = Animation.new({
                Track = a1.Model.Animations.Stun,
                Target = a1.Model.AnimationController,
            })
            u13:Play()
            a1.Model.Head.Stun:Play()
            a1.Model.Head.Sparks.Enabled = true
            a1.Model.Head.Stars.Enabled = true
            local v1 = (u13.Controller:GetMarkerReachedSignal("Action")):Connect(function(a1) -- Line: 336 -- upvalues: u13 (val)
                if a1 == "Freeze" then
                    u13.Controller:AdjustSpeed(0)
                end
            end)
            a1:Delay(a1_2)
            u13:Stop(0.5)
            a1.Model.Head.Sparks.Enabled = false
            a1.Model.Head.Stars.Enabled = false
            a1.Bruh = false
        end,
        Rage = function() -- Line: 351 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Rage,
                Target = a1.Model.AnimationController,
            }):Play()
            for k, v in pairs(a1.Model:GetDescendants()) do
                if v.Name == "Rage" and v:IsA("ParticleEmitter") then
                    v.Enabled = true
                end
            end
        end,
        Death = function() -- Line: 365
            -- upvalues: Animation (upval), a1 (val), TimescaleUtilities (upval), TweenService (upval), Lighting (upval)
            if game.ReplicatedStorage.State.Health.Current.Value <= 0 then
                print("is below 0")
                return
            end
            local u20 = Animation.new({
                Track = a1.Model.Animations.Stun,
                Target = a1.Model.AnimationController,
            })
            u20:Play()
            local v1 = (u20.Controller:GetMarkerReachedSignal("Action")):Connect(function(a1) -- Line: 379 -- upvalues: u20 (val)
                if a1 == "Freeze" then
                    u20.Controller:AdjustSpeed(0)
                end
            end)
            for k, v in pairs(a1.Model:GetDescendants()) do
                if v.Name ~= "Glitch" then
                    if v.Name == "Rage" and v:IsA("ParticleEmitter") then
                        v.Enabled = false
                    end
                elseif v:IsA("ParticleEmitter") then
                    v.Enabled = true
                elseif v.Name == "Rage" and v:IsA("ParticleEmitter") then
                    v.Enabled = false
                end
            end
            local Abyss = workspace:WaitForChild("Map"):WaitForChild("Environment"):FindFirstChild("Abyss")
            if Abyss then
                TimescaleUtilities.Delay(8, function() -- Line: 400 -- upvalues: Abyss (val), TweenService (upval), a1 (upval), Lighting (upval)
                    local v1, v2, v3
                    Abyss.Size = Vector3.new(200, 400, 200)
                    Abyss.Transparency = 1
                    TweenService:Create(
                        Abyss,
                        TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0),
                        {Transparency = 0}
                    ):Play()
                    a1:Delay(1)
                    Lighting.Sky:Destroy()
                    Lighting.ClockTime = 14
                    a1:Delay(2)
                    TweenService:Create(
                        Abyss,
                        TweenInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {Transparency = 1}
                    ):Play()
                    for k, v in pairs(a1.Model:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.Anchored = true
                            v1 = TweenService
                            v2 = TweenInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
                            v3 = {
                                Transparency = 1,
                                CFrame = v.CFrame * CFrame.new(Random.new():NextNumber(-3, 3), Random.new():NextNumber(-3, 3), Random.new():NextNumber(-3, 3)) * CFrame.Angles(
                                    math.rad((Random.new():NextNumber(-25, 25))),
                                    math.rad((Random.new():NextNumber(-25, 25))),
                                    (math.rad((Random.new():NextNumber(-25, 25))))
                                ),
                            }
                            v1:Create(v, v2, v3):Play()
                            v1 = TweenService
                            v2 = TweenInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
                            v3 = {
                                Transparency = 1,
                                CFrame = v.CFrame * CFrame.new(Random.new():NextNumber(-3, 3), Random.new():NextNumber(-3, 3), Random.new():NextNumber(-3, 3)) * CFrame.Angles(
                                    math.rad((Random.new():NextNumber(-25, 25))),
                                    math.rad((Random.new():NextNumber(-25, 25))),
                                    (math.rad((Random.new():NextNumber(-25, 25))))
                                ),
                            }
                            v1:Create(v, v2, v3):Play()
                        end
                    end
                    a1:Delay(10)
                    for k2, i in pairs(a1.Model:GetDescendants()) do
                        if i.Name == "Glitch" and i:IsA("ParticleEmitter") then
                            i.Enabled = false
                        end
                    end
                end)
            end
        end,
    }
end

return v1