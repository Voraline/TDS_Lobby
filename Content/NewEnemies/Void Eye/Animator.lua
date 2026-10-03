-- Script path: ReplicatedStorage.Content.NewEnemies.Void Eye.Animator
-- Decompile time: 4.01 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 14
    -- upvalues: SpringClass (val), spr (val), TweenService (val), RunService (val), TimescaleUtilities (val)
    -- upvalues: ReplicatedStorage (val), ItemDrop (val), EmitterManager (val)
    local Scalar = a1.Path:GetScalar(a1.PathDistance + 0.1)
    local u12 = SpringClass.new(0, 0.5, 9.5)
    local u18 = SpringClass.new(0, 0.2, 7)
    local u19 = Scalar
    local NumberValue = Instance.new("NumberValue")
    NumberValue.Value = 1206
    local Scale = a1.Model:GetScale()
    a1.Model:ScaleTo(0.01)
    local u33 = {value = 0.01}
    spr.target(u33, 0.3, 0.7, {value = Scale})
    TweenService:Create(NumberValue, TweenInfo.new(4.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Value = 0}):Play()
    a1.Maid:Mark((RunService.RenderStepped:Connect(function(a1_2) -- Line: 40
        -- upvalues: a1 (val), u33 (val), u19 (ref), Scalar (ref), u12 (val), u18 (val), NumberValue (val)
        a1.Model:ScaleTo(u33.value)
        local v1 = math.sin((os.clock()) * 3.25) * 0.3
        local v2 = math.sin((os.clock()) * 4.25) * 0
        local v3 = math.sin((os.clock()) * 2.25) * 0.3
        u19 = u19:Lerp(Scalar, a1_2 * 4)
        local v4 = (CFrame.new(a1.Position, u19)) * CFrame.new(0, 4, u12.p) * CFrame.new(0, math.sin((os.clock()) * 4.25) * 0.15, math.sin((os.clock()) * 3.25) * 0.3) * CFrame.Angles(math.rad((math.cos((os.clock()) * 3.3)) * 10), 0, 0) * CFrame.Angles(math.rad(u18.p * 20), 0, 0) * CFrame.Angles(math.rad(NumberValue.Value), 0, 0) + Vector3.new(v1, v2, v3)
        a1.Model.Eye.CFrame = v4
    end)))
    a1.Executables = {
        Face = function(a1) -- Line: 65 -- upvalues: Scalar (ref)
            Scalar = a1
        end,
        Fire = function(a1_2) -- Line: 68
            -- upvalues: TweenService (upval), a1 (val), TimescaleUtilities (upval), u12 (val), u18 (val)
            -- upvalues: ReplicatedStorage (upval), ItemDrop (upval), EmitterManager (upval)
            TweenService:Create(a1.Model.Eye.SurfaceAppearance, TweenInfo.new(0.02), {EmissiveStrength = 120}):Play()
            TimescaleUtilities.Delay(0.02, function() -- Line: 72 -- upvalues: a1 (upval), TweenService (upval)
                if not a1:IsAlive() then
                    return
                end
                TweenService:Create(
                    a1.Model.Eye.SurfaceAppearance,
                    TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {EmissiveStrength = 3.5}
                ):Play()
            end)
            local v1 = u12
            v1.v = v1.v + 50
            v1 = u18
            v1.v = v1.v + 50
            local u35 = ReplicatedStorage.Assets.Effects.Mob.VoidReaver.EyeExplosion:Clone()
            local u44 = ReplicatedStorage.Assets.Effects.Mob.VoidReaver.Projectile:Clone()
            u44.Parent = workspace.Trash
            u44.CFrame = CFrame.new(a1.Model.Eye.Position, a1_2)
            ;(ItemDrop.Drop(a1.Model.Eye.Position, a1_2, u44, a1.Stats.ProjectileData.dtMultiplier, a1.Stats.ProjectileData.gravity, a1.Stats.ProjectileData.velocity, function(a1, a2, a3) -- Line: 103
                return CFrame.lookAt(a3, a2).Rotation
            end)):andThen(function() -- Line: 106
                -- upvalues: u44 (val), TimescaleUtilities (upval), u35 (val), a1 (upval), a1_2 (val)
                -- upvalues: EmitterManager (upval)
                for i, j in u44:GetDescendants() do
                    if j:IsA("ParticleEmitter") or j:IsA("Beam") then
                        j.Enabled = false
                    end
                end
                TimescaleUtilities.CleanUp(u44, 3)
                u35:ScaleTo(a1.Stats.ExplosionRadius)
                u35:PivotTo((CFrame.new(a1_2)))
                u35.Parent = workspace
                EmitterManager.manualEmit(u35)
                TimescaleUtilities.CleanUp(u35, 3)
            end)
        end,
        Death = function() -- Line: 122
            warn("should play death anim")
        end,
    }
    a1.Maid:Mark(NumberValue)
end

return v1