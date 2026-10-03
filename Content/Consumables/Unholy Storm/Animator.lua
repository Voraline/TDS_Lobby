-- Script path: ReplicatedStorage.Content.Consumables.Unholy Storm.Animator
-- Decompile time: 3.49 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local UnholyStorm = ReplicatedStorage.Assets.Effects.Client.UnholyStorm
return {
    OnEquip = function(a1) -- Line: 15
        -- upvalues: TypedPromise (val), Players (val), UnholyStorm (val), PlayerCharacterReplicator (val)
        -- upvalues: Animation (val), TimescaleUtilities (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 16
            -- upvalues: Players (upval), a1 (val), UnholyStorm (upval), PlayerCharacterReplicator (upval)
            -- upvalues: Animation (upval), TimescaleUtilities (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local UnholyStorm_2 = UnholyStorm.UnholyStorm
            ;(PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)):AddAccessories({UnholyStorm_2})
            local HumanoidRootPart = PlayerByUserId.Character:WaitForChild("HumanoidRootPart")
            local UnholyStorm_3 = PlayerByUserId.Character:FindFirstChild("UnholyStorm")
            if UnholyStorm_3 and HumanoidRootPart then
                local StormCore = UnholyStorm_3:WaitForChild("StormCore")
                local Motor6D = Instance.new("Motor6D")
                Motor6D.Name = "StormCore"
                Motor6D.C0 = CFrame.new(0, -0.111915112, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                Motor6D.C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                Motor6D.Parent = StormCore
                Motor6D.Part0 = HumanoidRootPart
                Motor6D.Part1 = StormCore
                a1.effectMotor = Motor6D
            end
            if a1.Executor == Players.LocalPlayer and not a1.currentAnimations then
                a1.currentAnimations = {
                    activate = Animation.new({
                        IsPersistent = true,
                        Preload = true,
                        Track = UnholyStorm_2.Animations.Activate,
                        Target = PlayerByUserId.Character.Humanoid.Animator,
                    }),
                    equip = Animation.new({
                        IsPersistent = true,
                        Preload = true,
                        Track = UnholyStorm_2.Animations.Equip,
                        Target = PlayerByUserId.Character.Humanoid.Animator,
                    }),
                    loop = Animation.new({
                        IsPersistent = true,
                        IgnorePriority = true,
                        Preload = true,
                        Track = UnholyStorm_2.Animations.Loop,
                        Target = PlayerByUserId.Character.Humanoid.Animator,
                    }),
                }
                a1.currentAnimations.equip:Play()
                TimescaleUtilities.Wait(1)
                a1.currentAnimations.loop:Play()
            end
            a1_2()
        end)
    end,
    OnUnequip = function(a1) -- Line: 73 -- upvalues: TypedPromise (val), Players (val), PlayerCharacterReplicator (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 74 -- upvalues: Players (upval), a1 (val), PlayerCharacterReplicator (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            if not a1.activated then
                PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character):RemoveAccessories(true)
                if a1.effectMotor then
                    a1.effectMotor:Destroy()
                end
                if a1.Executor == Players.LocalPlayer then
                    for i, j in a1.currentAnimations do
                        j:Stop()
                    end
                end
            end
            a1_2()
        end)
    end,
    OnUse = function(a1) -- Line: 97
        -- upvalues: TypedPromise (val), Players (val), PlayerCharacterReplicator (val), UnholyStorm (val)
        -- upvalues: EmitterManager (val), TimescaleUtilities (val)
        return TypedPromise.new(function(a1_2, a2) -- Line: 98
            -- upvalues: Players (upval), a1 (val), PlayerCharacterReplicator (upval), UnholyStorm (upval)
            -- upvalues: EmitterManager (upval), TimescaleUtilities (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            a1.activated = true
            local v1 = PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)
            local v2 = nil
            if a1.currentAnimations then
                a1.currentAnimations.loop:Stop()
                a1.currentAnimations.activate:Play()
                v2 = UnholyStorm.UnholyStormVFX:Clone()
                v2.Parent = workspace
                local v3 = RaycastParams.new()
                v3.FilterType = Enum.RaycastFilterType.Exclude
                v3.FilterDescendantsInstances = {PlayerByUserId.Character}
                local v4 = workspace:Raycast(PlayerByUserId.Character.HumanoidRootPart.Position, Vector3.new(0, -15, 0), v3)
                if not v4 then
                    v2:PivotTo(PlayerByUserId.Character.HumanoidRootPart.CFrame - Vector3.new(0, 3, 0))
                else
                    v2:PivotTo((CFrame.new(v4.Position)))
                end
                EmitterManager.toggle(v2, true)
            end
            TimescaleUtilities.Wait(2.67)
            v1:RemoveAccessories(true)
            if a1.effectMotor then
                a1.effectMotor:Destroy()
            end
            if v2 then
                EmitterManager.toggle(v2, false)
                task.wait(0.5)
                v2:Destroy()
            end
            a1_2()
        end)
    end,
}