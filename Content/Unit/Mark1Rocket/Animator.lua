-- Script path: ReplicatedStorage.Content.Unit.Mark1Rocket.Animator
-- Decompile time: 3.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
require(ReplicatedStorage.Shared.Modules.GameState)
local v1 = {}
v1.__index = v1

function v1:Face(a2, a3, a4, a5) -- Line: 15
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

function v1:FireMissile(a2, a3, a4) -- Line: 45 -- upvalues: EasySound (val), Projectile (val), EffectsController (val)
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local CFrame_2 = PrimaryPart.CFrame
    local Rocket1 = self.Model.Rockets.Rocket1
    self:Face(CFrame_2, self.Model.Waist.Pivot, "X")
    self:Face(CFrame_2, self.Model.Pivot.Torso, "Y", self.defaultCannon)
    local Fire = Rocket1.Fire
    EasySound.Play({
        destroyOnEnd = true,
        audioGroup = "Towers",
        id = Fire.SoundId,
        parent = Rocket1,
        volume = Fire.Volume,
        playbackSpeed = Random.new():NextNumber(0.8, 1.2),
    })
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

function v1:Fire(a2) -- Line: 85 -- upvalues: EasySound (val)
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local CFrame = PrimaryPart.CFrame
    local Gun1 = self.Model.Weapon.Gun1
    local Gun2 = self.Model.Weapon.Gun2
    local v1 = self.Left and Gun2 or Gun1
    local Start = v1.Start
    local Fire = v1.Fire
    self:Face(CFrame, self.Model.Waist.Pivot, "X")
    self:Face(CFrame, self.Model.Pivot.Torso, "Y", self.defaultCannon)
    EasySound.Play({
        destroyOnEnd = true,
        audioGroup = "Towers",
        id = Fire.SoundId,
        parent = v1,
        volume = Fire.Volume,
    })
    Start.Flash:Emit(1)
    Start.Spark:Emit(1)
    self.Left = not self.Left
    self:Delay(self.Cooldown)
end

function v1.Initialize(a1) -- Line: 116 -- upvalues: EffectsController (val)
    a1.defaultCannon = a1.Model.Pivot.Torso.C0
    a1.Replicator:Set("DisplayName", "Mark I")
    a1.Left = false
    local u17 = a1:Animate("Walk", {Priority = Enum.AnimationPriority.Core})
    u17:Play()
    a1.Connections:Mark(((a1.Replicator:GetStateChangedSignal("Speed")):Connect(function(a1) -- Line: 124 -- upvalues: u17 (val)
        if a1 == 0 then
            u17:Stop()
            return
        end
        u17:Play()
        u17:AdjustSpeed(a1 / (u17.Length * 3.5))
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
            local Assets = game.ReplicatedStorage:FindFirstChild("Assets")
            local Effects = Assets and Assets:FindFirstChild("Effects")
            local Particles = Effects and Effects:FindFirstChild("Particles")
            local Fire = Particles and Particles:FindFirstChild("Fire")
            if Fire then
                local v1 = Fire:Clone()
                v1.Parent = a1.Model.Torso
                v1.Enabled = true
            end
            a1.Model:BreakJoints()
        end,
    }
    a1:Thread(function() -- Line: 180 -- upvalues: a1 (val)
        local v1 = a1:FindTarget()
        if v1 and a1.Dead == false then
            a1:Fire(v1)
        end
    end)
end

return v1