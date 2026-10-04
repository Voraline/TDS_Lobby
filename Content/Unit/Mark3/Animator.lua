-- Script path: ReplicatedStorage.Content.Unit.Mark3.Animator
-- Decompile time: 4.19 ms

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
    if self.MissileLeft then
        Rocket1 = self.Model.Rockets.Rocket2
    end
    self.MissileLeft = not self.MissileLeft
    local u36 = Rocket1.Fire:Clone()
    u36.Parent = Rocket1
    u36.PlaybackSpeed = Random.new():NextNumber(0.8, 1.2)
    u36:Play()
    delay(u36.TimeLength, function() -- Line: 63 -- upvalues: u36 (val)
        u36:Destroy()
    end)
    Rocket1.Start.Flash:Emit(1)
    a3.Start = CFrame.new(Rocket1.Start.WorldPosition)
    local v1 = Projectile:CalcDuration(a3)
    Projectile:Throw(a3)
    wait(v1)
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

function v1:Fire(a2) -- Line: 84
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    self:Face(PrimaryPart.CFrame, self.Model.Waist.Pivot, "X")
    self:Face(PrimaryPart.CFrame, self.Model.Pivot.Torso, "Y", self.defaultCannon)
    local Start1 = self.Model.Torso.Start1
    if self.Left then
        Start1 = self.Model.Torso.Start2
    end
    self.Left = not self.Left
    local u35 = Start1.Parent.Fire:Clone()
    u35.Parent = Start1.Parent
    u35:Play()
    delay(u35.TimeLength, function() -- Line: 102 -- upvalues: u35 (val)
        u35:Destroy()
    end)
    Start1.Flash:Emit(1)
    Start1.Spark:Emit(1)
    self:Delay(self.Cooldown)
end

function v1.Initialize(a1) -- Line: 112 -- upvalues: EffectsController (val), TweenService (val)
    a1.defaultCannon = a1.Model.Pivot.Torso.C0
    a1.lastFire = tick()
    a1.slowing = true
    a1.Replicator:Set("DisplayName", "Mark III")
    a1.Left = false
    a1.MissileLeft = false
    local u21 = a1:Animate("Walk", {Priority = Enum.AnimationPriority.Core})
    u21:Play()
    a1.Connections:Mark(((a1.Replicator:GetStateChangedSignal("Speed")):Connect(function(a1) -- Line: 124 -- upvalues: u21 (val)
        if a1 == 0 then
            u21:Stop()
            return
        end
        u21:Play()
        u21:AdjustSpeed(a1 / (u21.Length * 3.5))
    end)))
    a1.Executables = {
        Missile = function(a1_2, a2, a3) -- Line: 136 -- upvalues: a1 (val)
            a1:FireMissile(a1_2, a2, a3)
        end,
        Death = function(a1_2, a2) -- Line: 140 -- upvalues: a1 (val), EffectsController (upval)
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
    a1:Thread(function() -- Line: 174 -- upvalues: a1 (val), TweenService (upval)
        local v1 = a1:FindTarget()
        if v1 and a1.Dead == false then
            if a1.slowing then
                a1.slowing = false
                TweenService:Create(
                    a1.Model.Torso.Barrel1,
                    TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                    {MaxVelocity = 0.3}
                ):Play()
                TweenService:Create(
                    a1.Model.Torso.Barrel2,
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
                a1.Model.Torso.Barrel1,
                TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                {MaxVelocity = 0}
            ):Play()
            TweenService:Create(
                a1.Model.Torso.Barrel2,
                TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                {MaxVelocity = 0}
            ):Play()
        end
    end)
end

return v1