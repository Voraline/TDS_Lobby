-- Script path: ReplicatedStorage.Content.NewEnemies.Builder.Animator
-- Decompile time: 2.25 ms

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
    -- upvalues: Animation (val), TimescaleUtilities (val), HttpService (val), ItemDrop (val), EmitterManager (val)
    -- upvalues: AreaIndicatorStore (val)
    local u10 = Animation.new({
        IgnorePriority = true,
        IsPersistent = true,
        Preload = true,
        Track = a1.Model.Animations.Attack,
        Target = a1.Model.AnimationController.Animator,
    })
    local u16 = a1.Model.BrickCube:QueryDescendants("Texture,Trail")
    a1.Executables = {
        PlayFire = function(a1_2) -- Line: 28 -- upvalues: a1 (val), u16 (val), u10 (val), TimescaleUtilities (upval)
            a1.Model.BrickCube.Transparency = 0
            for i, j in u16 do
                if not j:IsA("Texture") then
                    j.Enabled = true
                else
                    j.Transparency = 0
                end
            end
            a1:Face(a1_2, (TweenInfo.new(0.5)))
            u10:Play()
            TimescaleUtilities.Delay(1.1, function() -- Line: 42 -- upvalues: a1 (upval), u16 (upval)
                a1.Model.BrickCube.Transparency = 1
                for i, j in u16 do
                    if not j:IsA("Texture") then
                        j.Enabled = false
                    else
                        j.Transparency = 1
                    end
                end
            end)
        end,
        Fire = function(a1_2, a2, a3, a4) -- Line: 54
            -- upvalues: HttpService (upval), a1 (val), ItemDrop (upval), EmitterManager (upval)
            -- upvalues: TimescaleUtilities (upval), AreaIndicatorStore (upval)
            local v1 = HttpService:GenerateGUID(false)
            local WorldPosition = a3 or a1.Model.BrickBone.Value.WorldPosition
            local v2 = (ItemDrop.GetTimeToDestinationWithGV(WorldPosition, a2, a1_2.Gravity, a1_2.Speed)) / a1_2.DeltaTime
            local u32 = a1.Model.BrickCube:Clone()
            u32.Transparency = 0
            u32.RigidConstraint:Destroy()
            u32.Anchored = true
            u32.Parent = workspace.Trash
            u32.Position = WorldPosition
            for i, j in u32:GetDescendants() do
                if j:IsA("Texture") then
                    j.Transparency = 0
                elseif j:IsA("Trail") then
                    j.Enabled = true
                end
            end
            ;(ItemDrop.Drop(WorldPosition, a2, u32, a1_2.DeltaTime, a1_2.Gravity, a1_2.Speed, function(a1, a2, a3) -- Line: 88
                return ((CFrame.lookAt(a2, a3)) * CFrame.Angles(math.rad(a1 * 47), math.rad(a1 * 20), 0)).Rotation
            end)):andThen(function() -- Line: 93 -- upvalues: EmitterManager (upval), a2 (val), u32 (val), TimescaleUtilities (upval)
                EmitterManager.Emit("BuilderEmit", CFrame.new(a2), 2)
                for i, j in u32:GetDescendants() do
                    if j:IsA("ParticleEmitter") or j:IsA("Beam") then
                        j.Enabled = false
                    end
                end
                TimescaleUtilities.CleanUp(u32, 3)
            end)
            AreaIndicatorStore.create(v1, {
                type = "full",
                radius = 2,
                fadeInTime = 0.35,
                tweenInfo = TweenInfo.new(v2),
                lifeTime = v2,
                color3 = Color3.fromRGB(255, 0, 64),
                position = a2 + Vector3.new(0, 0.10000000149011612, 0),
            })
            TimescaleUtilities.Wait(v2 + 0.1)
            AreaIndicatorStore.remove(v1)
        end,
    }
end

return v1