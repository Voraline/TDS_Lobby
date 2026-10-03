-- Script path: ReplicatedStorage.Content.Consumables.Supply Drop.Animator
-- Decompile time: 5.07 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Network = require(ReplicatedStorage.Shared.UI.Network)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
;(Network.Channel("ConsumableEvent")):On("SupplyDropEffect", function(a1) -- Line: 19 -- upvalues: EmitterManager (val) -- types: a1: vector
    EmitterManager.Emit("SellEffect", CFrame.new(a1), 2.5)
end)

local function createSound(a1) -- Line: 23 -- upvalues: GameState (val)
    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://17410058052"
    if not Sound.Loaded then
        Sound.Loaded:Wait()
    end
    Sound.PlaybackSpeed = 1 * GameState.TimeScale
    Sound.Parent = a1
    Sound:Play()
    Sound.Ended:Connect(function() -- Line: 32 -- upvalues: Sound (val)
        Sound:Destroy()
    end)
end

return {
    OnEquip = function(a1) -- Line: 38
        -- upvalues: TypedPromise (val), Players (val), ReplicatedStorage (val), PlayerCharacterReplicator (val)
        -- upvalues: Animation (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 39
            -- upvalues: Players (upval), a1 (val), ReplicatedStorage (upval), PlayerCharacterReplicator (upval)
            -- upvalues: Animation (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local Radio = ReplicatedStorage.Assets.Effects.Client.Radio
            a1.clearAccessories = (PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)):AddAccessories({Radio})
            if a1.Executor == Players.LocalPlayer then
                local v1 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = Radio.Animations.Equip,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                local v2 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = Radio.Animations.Idle,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v2:Play(0)
                v1:Play(0)
                a1.currentAnimations = {v2, v1}
            end
            a1_2()
        end)
    end,
    OnUnequip = function(a1) -- Line: 72 -- upvalues: TypedPromise (val), Players (val)
        return TypedPromise.new(function(a1_2) -- Line: 73 -- upvalues: Players (upval), a1 (val)
            if not Players:GetPlayerByUserId(a1.PlayerId).Character then
                return
            end
            if a1.clearAccessories then
                a1.clearAccessories()
                a1.clearAccessories = nil
            end
            if a1.Executor == Players.LocalPlayer then
                for i, j in a1.currentAnimations do
                    j:Stop(0)
                end
            end
            a1_2()
        end)
    end,
    OnUse = function(a1) -- Line: 94
        -- upvalues: Players (val), createSound (val), TypedPromise (val), ReplicatedStorage (val), GameState (val)
        -- upvalues: RunService (val), TweenService (val), TimescaleUtilities (val), Create (val), Shaker (val)
        -- upvalues: Animation (val)
        task.spawn(function() -- Line: 95 -- upvalues: Players (upval), a1 (val), createSound (upval)
            local Character = Players:GetPlayerByUserId(a1.PlayerId).Character
            if Character and Character:FindFirstChild("HumanoidRootPart") then
                createSound(Character.HumanoidRootPart)
            end
        end)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 102
            -- upvalues: ReplicatedStorage (upval), a1 (val), GameState (upval), RunService (upval)
            -- upvalues: TweenService (upval), TimescaleUtilities (upval), Create (upval), Players (upval)
            -- upvalues: Shaker (upval), Animation (upval)
            local u15 = ReplicatedStorage.Assets.Effects.Misc.C130:FindFirstChild("Default", true):Clone()
            u15.Parent = workspace.Terrain
            local u18 = true
            local u19 = nil
            u15.PrimaryPart.Anchored = true
            u15:PivotTo(a1.Context.startPosition)
            local Rotation = u15.PrimaryPart.CFrame.Rotation
            local u32 = {}
            for i, j in u15.PrimaryPart:GetChildren() do
                if j:IsA("Motor6D") and string.match(j.Name, "^turbine") then
                    table.insert(u32, j)
                end
            end
            u15.PrimaryPart.Passby.PlaybackSpeed = GameState.TimeScale
            u15.PrimaryPart.Passby:Play()
            local u63 = RunService.Heartbeat:Connect(function(a1) -- Line: 129 -- upvalues: GameState (upval), u32 (val)
                local TimeScale = GameState.TimeScale
                for i, v in ipairs(u32) do
                    v.C0 = v.C0 * CFrame.Angles(0, 0, 15.707963267948966 * a1 * TimeScale)
                end
            end)
            TweenService:Create(u15.PrimaryPart, TweenInfo.new(a1.Context.tweenTime, Enum.EasingStyle.Linear), {
                CFrame = CFrame.new(a1.Context.endPosition.Position) * Rotation,
            }):Play()
            TimescaleUtilities.Delay(a1.Context.tweenTime / 2, function() -- Line: 145
                -- upvalues: u18 (ref), Create (upval), u19 (ref), ReplicatedStorage (upval), a1 (upval)
                -- upvalues: TimescaleUtilities (upval), Players (upval), TweenService (upval), Shaker (upval)
                -- upvalues: Animation (upval)
                if not u18 then
                    return
                end
                local v1 = Create("Sound", {SoundId = "rbxassetid://17431361400", Volume = 1, Looped = true})
                v1:Play()
                u19 = ReplicatedStorage.Assets.Effects.Client["Supply Drop"]:Clone()
                u19.PrimaryPart.UI.BillboardGui:Destroy()
                v1.Parent = u19.PrimaryPart
                u19:PivotTo((CFrame.new(a1.Context.position)) * (CFrame.new(0, 60, 0)))
                TimescaleUtilities.Delay(4.1, function() -- Line: 167 -- upvalues: u19 (upval), Players (upval), a1 (upval)
                    u19.PrimaryPart.CanTouch = true
                    u19.PrimaryPart.Touched:Connect(function(a1_2) -- Line: 170 -- upvalues: Players (upval), a1 (upval)
                        local PlayerFromCharacter = Players:GetPlayerFromCharacter(a1_2.Parent)
                        if PlayerFromCharacter and PlayerFromCharacter.UserId ~= a1.Context.playerId then
                            return
                        end
                        if a1_2.Parent:FindFirstChild("Humanoid") then
                            a1_2.Parent.Humanoid.Health = 0
                        end
                    end)
                end)
                u19.Parent = workspace.Terrain
                local Y = u19.PrimaryPart.Size.Y
                local v2 = TweenService:Create(u19.PrimaryPart, TweenInfo.new(5.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                    CFrame = (CFrame.new(a1.Context.position)) * CFrame.new(0, Y + 0.5, 0),
                })
                v2:Play()
                v2.Completed:Connect(function() -- Line: 195 -- upvalues: Shaker (upval), u18 (upval), u19 (upval)
                    Shaker:Shake({1, 30, 0.1, 1}, 0.1, 0.5)
                    if u18 then
                        u19:Destroy()
                    end
                end)
                Animation.new({Track = u19.Animations.Loop, Target = u19.AnimationController}):Play()
            end)
            TimescaleUtilities.Delay(a1.Context.tweenTime, function() -- Line: 208 -- upvalues: u18 (ref), u15 (val), u63 (ref), a1_2 (val)
                if not u18 then
                    return
                end
                u15:Destroy()
                u63:Disconnect()
                a1_2()
            end)
            a3(function() -- Line: 218 -- upvalues: u63 (ref), u19 (ref), u18 (ref), u15 (val)
                u63:Disconnect()
                if u19 then
                    u19:Destroy()
                end
                u18 = false
                u15:Destroy()
            end)
        end)
    end,
}