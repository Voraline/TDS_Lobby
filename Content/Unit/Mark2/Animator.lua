-- Script path: ReplicatedStorage.Content.Unit.Mark2.Animator
-- Decompile time: 4.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1:Face(a2, a3, a4, a5) -- Line: 14
    if a4 == "X" then
        local lookVector = a3.Part1.CFrame.lookVector
        local Unit = (a2.p - a3.Part1.Position).Unit
        a3.C0 = a3.C0 * CFrame.Angles(0, (math.deg((math.atan2(lookVector.Z, lookVector.X)) - (math.atan2(Unit.Z, Unit.X)))) * 0.017453292519943295, 0)
        return
    end
    if a4 == "Y" then
        local v1 = CFrame.new(self.Model.Torso.Position) * a5
        local v2 = -v1.ZVector
        local YVector = v1.YVector
        local p = v1:toObjectSpace(a2).p
        local v3 = p:Dot(v2)
        a3.C0 = a5 * CFrame.Angles(math.clamp(math.atan2(p:Dot(YVector), v3), -0.15, 0.35) / 2, 0, 0)
    end
end

function v1:FireMissile(a2, a3, a4) -- Line: 44 -- upvalues: Projectile (val), EffectsController (val)
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    self:Face(PrimaryPart.CFrame, self.Model.Waist.Pivot, "X")
    self:Face(PrimaryPart.CFrame, self.Model.Pivot.Torso, "Y", self.defaultCannon)
    local Rocket1 = self.Model.Rockets.Rocket1
    local u28 = Rocket1.Fire:Clone()
    u28.Parent = Rocket1
    u28.PlaybackSpeed = Random.new():NextNumber(0.8, 1.2)
    u28:Play()
    task.delay(u28.TimeLength, function() -- Line: 59 -- upvalues: u28 (val)
        u28:Destroy()
    end)
    Rocket1.Start.Flash:Emit(1)
    a3.Start = CFrame.new(Rocket1.Start.WorldPosition)
    local v1 = Projectile:CalcDuration(a3)
    Projectile:Throw(a3)
    task.wait(v1)
    EffectsController.Explosion({
        Position = a3.End,
        Radius = a4 or 6,
        Color = BrickColor.new("Pastel blue-green"),
        Sound = 440145223,
        Material = Enum.Material.Neon,
        Particles = false,
        Visible = true,
    })
end

function v1:Fire(a2) -- Line: 80
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    self:Face(PrimaryPart.CFrame, self.Model.Waist.Pivot, "X")
    self:Face(PrimaryPart.CFrame, self.Model.Pivot.Torso, "Y", self.defaultCannon)
    local Torso_2 = self.Model.Torso
    local u25 = Torso_2.Fire:Clone()
    u25.Parent = Torso_2
    u25:Play()
    task.delay(u25.TimeLength, function() -- Line: 94 -- upvalues: u25 (val)
        u25:Destroy()
    end)
    Torso_2.Start.Flash:Emit(1)
    Torso_2.Start.Spark:Emit(1)
    self:Delay(self.Cooldown)
end

function v1.Initialize(a1) -- Line: 104 -- upvalues: EffectsController (val), TweenService (val)
    a1.defaultCannon = a1.Model.Pivot.Torso.C0
    a1.lastFire = tick()
    a1.slowing = true
    a1.Replicator:Set("DisplayName", "Mark II")
    a1.Left = false
    local u20 = a1:Animate("Walk", {Priority = Enum.AnimationPriority.Core})
    u20:Play()
    a1.Connections:Mark(((a1.Replicator:GetStateChangedSignal("Speed")):Connect(function(a1) -- Line: 114 -- upvalues: u20 (val)
        if a1 == 0 then
            u20:Stop()
            return
        end
        u20:Play()
        u20:AdjustSpeed(a1 / (u20.Length * 3.5))
    end)))
    a1.Executables = {
        Missile = function(a1_2, a2, a3) -- Line: 126 -- upvalues: a1 (val)
            a1:FireMissile(a1_2, a2, a3)
        end,
        Death = function(a1_2, a2) -- Line: 130 -- upvalues: a1 (val), EffectsController (upval)
            a1.Dead = true
            EffectsController.Explosion({
                Position = a1.Model.HumanoidRootPart.Position,
                Radius = a1.ExplosionRadius or 6,
                Color = BrickColor.new("Br. yellowish orange"),
                Sound = 4725504496,
                Material = Enum.Material.Neon,
                Particles = true,
                Visible = true,
            })
            for k, v in pairs(a1.Model:GetDescendants()) do
                if v:IsA("SpecialMesh") then
                    v.TextureId = ""
                elseif v:IsA("BasePart") then
                    v.BrickColor = BrickColor.new("Black")
                    v.Material = Enum.Material.CorrodedMetal
                    v.CollisionGroupId = 1
                    v.CanCollide = true
                    if v:IsA("MeshPart") then
                        v.TextureID = ""
                    end
                end
            end
            local v1 = game.ReplicatedStorage.Assets.Effects.Particles.Fire:Clone()
            v1.Parent = a1.Model.Torso
            v1.Enabled = true
            a1.Model:BreakJoints()
        end,
    }
    a1:Thread(function() -- Line: 164 -- upvalues: a1 (val), TweenService (upval)
        local v1 = a1:FindTarget()
        if v1 and a1.Dead == false then
            if a1.slowing then
                a1.slowing = false
                TweenService:Create(
                    a1.Model.Torso.Barrel,
                    TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                    {MaxVelocity = 0.3}
                ):Play()
            end
            a1:Fire(v1)
            return
        end
        if a1.Dead == false and a1.slowing == false and 0.5 <= tick() - a1.lastFire then
            a1.slowing = true
            TweenService:Create(
                a1.Model.Torso.Barrel,
                TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                {MaxVelocity = 0}
            ):Play()
        end
    end)
end

return v1