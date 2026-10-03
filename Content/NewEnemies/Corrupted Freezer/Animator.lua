-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Freezer.Animator
-- Decompile time: 1.79 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 14
    -- upvalues: Animation (val), HttpService (val), ItemDrop (val), ReplicatedStorage (val), EmitterManager (val)
    -- upvalues: TimescaleUtilities (val), AreaIndicatorStore (val)
    local u10 = Animation.new({
        IgnorePriority = true,
        IsPersistent = true,
        Preload = true,
        Track = a1.Model.Animations.Attack,
        Target = a1.Model.AnimationController.Animator,
    })
    for i, j in {
        Fire = function() -- Line: 26
            return
        end,
    } do
        (u10.Controller:GetMarkerReachedSignal(i)):Connect(j)
    end
    a1.Executables = {
        PlayFire = function(a1_2) -- Line: 34 -- upvalues: a1 (val), u10 (val)
            a1:Face(a1_2, (TweenInfo.new(0.5)))
            u10:Play()
        end,
        Fire = function(a1_2) -- Line: 39
            -- upvalues: HttpService (upval), ItemDrop (upval), a1 (val), ReplicatedStorage (upval)
            -- upvalues: EmitterManager (upval), TimescaleUtilities (upval), AreaIndicatorStore (upval)
            local v1 = HttpService:GenerateGUID(false)
            local v2 = (ItemDrop.GetTimeToDestinationWithGV(
                a1.Model.BulletAttachment.Value.WorldPosition,
                a1_2,
                a1.Stats.ProjectileData.Gravity,
                a1.Stats.ProjectileData.Speed
            )) / a1.Stats.ProjectileData.DeltaTime
            local u36 = ReplicatedStorage.Assets.Effects.Mob.CorruptedFreezer.Bullet:Clone()
            u36.Parent = workspace.Trash
            u36.CFrame = a1.Model.BulletAttachment.Value.WorldCFrame
            ;(ItemDrop.Drop(a1.Model.BulletAttachment.Value.WorldPosition + Vector3.new(0, 1, 0), a1_2, u36, a1.Stats.ProjectileData.DeltaTime, a1.Stats.ProjectileData.Gravity, a1.Stats.ProjectileData.Speed, function(a1, a2, a3) -- Line: 60
                return ((CFrame.lookAt(a2, a3)) * CFrame.Angles(0, 3.141592653589793, 0)).Rotation
            end)):andThen(function() -- Line: 64 -- upvalues: EmitterManager (upval), a1_2 (val), u36 (val), TimescaleUtilities (upval)
                EmitterManager.Emit("Freeze", CFrame.new(a1_2), 5, nil, nil, nil, {priority = "GameplayCritical"})
                for i, j in u36:GetDescendants() do
                    if j:IsA("ParticleEmitter") or j:IsA("Beam") then
                        j.Enabled = false
                    end
                end
                TimescaleUtilities.CleanUp(u36, 3)
            end)
            AreaIndicatorStore.create(v1, {
                type = "full",
                radius = 2,
                fadeInTime = 0.35,
                tweenInfo = TweenInfo.new(v2),
                lifeTime = v2,
                color3 = Color3.fromRGB(255, 0, 64),
                position = a1_2 + Vector3.new(0, 0.10000000149011612, 0),
            })
            TimescaleUtilities.Wait(v2 + 0.1)
            AreaIndicatorStore.remove(v1)
        end,
    }
end

return v1