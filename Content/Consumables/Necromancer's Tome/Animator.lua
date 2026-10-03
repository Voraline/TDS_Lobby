-- Script path: ReplicatedStorage.Content.Consumables.Necromancer's Tome.Animator
-- Decompile time: 3.52 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local NecromancersTome = ReplicatedStorage.Assets.Effects.Client.NecromancersTome
return {
    OnEquip = function(a1) -- Line: 15
        -- upvalues: TypedPromise (val), Players (val), PlayerCharacterReplicator (val), NecromancersTome (val)
        -- upvalues: Animation (val), TimescaleUtilities (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 16
            -- upvalues: Players (upval), a1 (val), PlayerCharacterReplicator (upval), NecromancersTome (upval)
            -- upvalues: Animation (upval), TimescaleUtilities (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            ;(PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)):AddAccessories({NecromancersTome})
            local HumanoidRootPart = PlayerByUserId.Character:WaitForChild("HumanoidRootPart")
            local NecromancersTome_2 = PlayerByUserId.Character:FindFirstChild("NecromancersTome")
            if NecromancersTome_2 and HumanoidRootPart then
                local tomebookfinal = NecromancersTome_2:WaitForChild("tomebookfinal")
                local Motor6D = Instance.new("Motor6D")
                Motor6D.Name = "tomebookfinal"
                Motor6D.C0 = CFrame.new(-0.0535962433, -0.0678377151, -0.317826807, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                Motor6D.C1 = CFrame.new(0, 0, 0.0199999958, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                Motor6D.Parent = tomebookfinal
                Motor6D.Part0 = HumanoidRootPart
                Motor6D.Part1 = tomebookfinal
                a1.tomeMotor = Motor6D
                a1.model = NecromancersTome_2
            end
            if a1.Executor == Players.LocalPlayer and not a1.currentAnimations then
                a1.currentAnimations = {
                    activate = Animation.new({
                        IsPersistent = true,
                        Preload = true,
                        Track = NecromancersTome.Animations.Activate,
                        Target = PlayerByUserId.Character.Humanoid.Animator,
                    }),
                    equip = Animation.new({
                        IsPersistent = true,
                        Preload = true,
                        Track = NecromancersTome.Animations.Equip,
                        Target = PlayerByUserId.Character.Humanoid.Animator,
                    }),
                    loop = Animation.new({
                        IsPersistent = true,
                        IgnorePriority = true,
                        Preload = true,
                        Track = NecromancersTome.Animations.Loop,
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
    OnUnequip = function(a1) -- Line: 86 -- upvalues: TypedPromise (val), Players (val), PlayerCharacterReplicator (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 87 -- upvalues: Players (upval), a1 (val), PlayerCharacterReplicator (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            if not a1.activated then
                PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character):RemoveAccessories(true)
                if a1.tomeMotor then
                    a1.tomeMotor:Destroy()
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
    OnUse = function(a1) -- Line: 110
        -- upvalues: TypedPromise (val), Players (val), PlayerCharacterReplicator (val), EmitterManager (val)
        -- upvalues: TimescaleUtilities (val)
        return TypedPromise.new(function(a1_2, a2) -- Line: 111
            -- upvalues: Players (upval), a1 (val), PlayerCharacterReplicator (upval), EmitterManager (upval)
            -- upvalues: TimescaleUtilities (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            a1.activated = true
            local v1 = PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)
            local CurseUse = a1.model:FindFirstChild("CurseUse")
            local CurseOutline = a1.model:FindFirstChild("CurseOutline")
            if a1.currentAnimations and CurseUse and CurseOutline then
                a1.currentAnimations.loop:Stop()
                a1.currentAnimations.activate:Play()
                local HumanoidRootPart = PlayerByUserId.Character:WaitForChild("HumanoidRootPart")
                local v2 = RaycastParams.new()
                v2.FilterType = Enum.RaycastFilterType.Exclude
                v2.FilterDescendantsInstances = {PlayerByUserId.Character}
                local v3 = workspace:Raycast(HumanoidRootPart.Position, Vector3.new(0, -15, 0), v2)
                if v3 then
                    CurseUse:PivotTo((CFrame.new(v3.Position + Vector3.new(0, 0.5, 0))))
                    CurseOutline:PivotTo((CFrame.new(v3.Position)))
                end
            end
            local v4 = a1.Context.Duration - 1.97
            EmitterManager.toggle(CurseUse, true)
            TimescaleUtilities.Wait(1.97)
            EmitterManager.toggle(CurseUse, false)
            EmitterManager.toggle(CurseOutline, true)
            if a1.tomeMotor then
                a1.tomeMotor:Destroy()
            end
            TimescaleUtilities.Wait(v4)
            v1:RemoveAccessories(true)
            a1_2()
        end)
    end,
}