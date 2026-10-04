-- Script path: ReplicatedStorage.Content.Consumables.Present Cluster Bomb.Animator
-- Decompile time: 6.31 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local CatRom = require(ReplicatedStorage.Shared.Modules.CatRom)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Network = require(ReplicatedStorage.Shared.UI.Network)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
;(Network.Channel("ConsumableEvent")):On("SupplyDropEffect", function(a1) -- Line: 21 -- upvalues: EmitterManager (val) -- types: a1: vector
    EmitterManager.Emit("SellEffect", CFrame.new(a1), 2.5)
end)
local ChristmasConsumables = ReplicatedStorage.Assets.Effects.Client.ChristmasConsumables

local function createSound(a1) end

local function cluster(a1) -- Line: 41
    -- upvalues: ChristmasConsumables (val), ItemDrop (val), EasySound (val), TimescaleUtilities (val)
    -- upvalues: EmitterManager (val)
    for i, j in a1.Context.ClusterData do
        local u12 = {
            dtMultiplier = 7,
            gravity = -1,
            velocity = 3,
            start = a1.Context.position,
            goal = j,
        }
        local u35 = (ChristmasConsumables.Gifts.Small:GetChildren())[math.random(1, #ChristmasConsumables.Gifts.Small:GetChildren())]:Clone()
        u35.Position = a1.Context.position
        u35.Parent = workspace.Trash
        local u44 = math.random(45, 95)
        local u49 = math.random(5, 12)
        local u53 = math.random(30, 56)
        ;(ItemDrop.Drop(u12.start, u12.goal, u35, u12.dtMultiplier, u12.gravity, u12.velocity, function(a1, a2, a3) -- Line: 67 -- upvalues: u44 (val), u49 (val), u53 (val)
            return CFrame.Angles(math.rad(a1 * u44), -math.rad(a1 * u49), (math.rad(a1 * u53)))
        end)):andThen(function() -- Line: 70
            -- upvalues: u12 (val), EasySound (upval), u35 (val), TimescaleUtilities (upval), EmitterManager (upval)
            local goal = u12.goal
            EasySound.Create({
                id = 115146935131644,
                volume = 0.4,
                soundGroupName = "Towers",
                timeScaled = true,
                parent = u35,
                playbackSpeed = Random.new():NextNumber(0.9, 1.1),
            }):Play()
            u35.Transparency = 1
            TimescaleUtilities.CleanUp(u35, 3)
            EmitterManager.Emit(("PresentExplosion%*Small"):format(if math.random(1, 2) ~= 1 then "Green" else "Red"), CFrame.new(goal), 1)
        end)
        TimescaleUtilities.Wait(0.06)
    end
end

local function bomb(a1, a2) -- Line: 95
    -- upvalues: ChristmasConsumables (val), ItemDrop (val), cluster (val), TimescaleUtilities (val), EasySound (val)
    -- upvalues: EmitterManager (val)
    local u2 = {
        dtMultiplier = 6,
        gravity = -2,
        velocity = 0,
        start = a2,
        goal = a1.Context.position,
    }
    local u25 = (ChristmasConsumables.Gifts.Big:GetChildren())[math.random(1, #ChristmasConsumables.Gifts.Big:GetChildren())].Mesh:Clone()
    u25.Position = a2
    u2.start = u25.CFrame.Position
    u25.CFrame = CFrame.new(u2.start)
    u25.Parent = workspace
    ;(ItemDrop.Drop(u2.start, u2.goal, u25, u2.dtMultiplier, u2.gravity, u2.velocity, function(a1, a2, a3) -- Line: 121
        return CFrame.Angles(math.rad(a1 * 20), 0, 0)
    end)):andThen(function() -- Line: 124
        -- upvalues: cluster (upval), a1 (val), u2 (val), u25 (val), TimescaleUtilities (upval), EasySound (upval)
        -- upvalues: EmitterManager (upval)
        task.spawn(function() -- Line: 125 -- upvalues: cluster (upval), a1 (upval)
            cluster(a1)
        end)
        local goal = u2.goal
        u25.Transparency = 1
        TimescaleUtilities.CleanUp(u25, 3)
        EasySound.Create({
            id = 115146935131644,
            volume = 0.6,
            playbackSpeed = 0.6,
            soundGroupName = "Towers",
            timeScaled = true,
            parent = u25,
        }):Play()
        EmitterManager.Emit(("PresentExplosion%*"):format(if math.random(1, 2) ~= 1 then "Green" else "Red"), CFrame.new(goal), 1)
    end)
end

local function airStrike(a1) -- Line: 149
    -- upvalues: TypedPromise (val), CatRom (val), ChristmasConsumables (val), GameState (val), RunService (val)
    -- upvalues: bomb (val)
    return (TypedPromise.new(function(a1_2, a2, a3) -- Line: 150
        -- upvalues: a1 (val), CatRom (upval), ChristmasConsumables (upval), GameState (upval), RunService (upval)
        -- upvalues: bomb (upval)
        local started = a1.Context.started
        local u11 = CatRom.new(a1.Context.positionData)
        local u12 = false
        local u17 = ChristmasConsumables.SantaSleigh:Clone()
        u17.Parent = workspace
        u17.Sleigh.Passby.PlaybackSpeed = GameState.TimeScale
        u17.Sleigh.Passby:Play()
        local u34 = (u11:SolveLength()) / a1.Context.duration
        local u35 = 0
        local u36 = nil
        local v1 = RunService.Heartbeat:Connect(function() -- Line: 166
            -- upvalues: u35 (ref), started (ref), GameState (upval), u34 (val), u11 (val), u36 (ref), u17 (val)
            -- upvalues: a1_2 (val), a1 (upval), u12 (ref), bomb (upval)
            u35 = u35 + ((workspace:GetServerTimeNow()) - started) * GameState.TimeScale
            if 1 < u35 / u34 then
                u11:Destroy()
                u36:Disconnect()
                u17:Destroy()
                a1_2()
                return
            end
            local v1 = u35 / u34
            local u36_2 = u11:SolveUniformRotCFrame(v1)
            if a1.Context.bombDropTime <= v1 and not u12 then
                u12 = true
                task.spawn(function() -- Line: 182 -- upvalues: bomb (upval), a1 (upval), u36_2 (val)
                    bomb(a1, u36_2.Position)
                end)
            end
            u17:PivotTo(u36_2)
            started = workspace:GetServerTimeNow()
        end)
    end))
end

return {
    OnEquip = function(a1) -- Line: 197
        -- upvalues: TypedPromise (val), Players (val), ReplicatedStorage (val), PlayerCharacterReplicator (val)
        -- upvalues: Animation (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 198
            -- upvalues: Players (upval), a1 (val), ReplicatedStorage (upval), PlayerCharacterReplicator (upval)
            -- upvalues: Animation (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local FestiveRadio = ReplicatedStorage.Assets.Effects.Client.FestiveRadio
            a1.clearAccessories = (PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)):AddAccessories({FestiveRadio})
            if a1.Executor == Players.LocalPlayer then
                local v1 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = FestiveRadio.Animations.Equip,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                local v2 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = FestiveRadio.Animations.Idle,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v2:Play(0)
                v1:Play(0)
                a1.currentAnimations = {v2, v1}
            end
            a1_2()
        end)
    end,
    OnUnequip = function(a1) -- Line: 231 -- upvalues: TypedPromise (val), Players (val)
        return TypedPromise.new(function(a1_2) -- Line: 232 -- upvalues: Players (upval), a1 (val)
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
    OnUse = function(a1) -- Line: 253
        -- upvalues: Players (val), TypedPromise (val), CatRom (val), ChristmasConsumables (val), GameState (val)
        -- upvalues: RunService (val), bomb (val)
        task.spawn(function() -- Line: 254 -- upvalues: Players (upval), a1 (val)
            local Character = Players:GetPlayerByUserId(a1.PlayerId).Character
            if Character and Character:FindFirstChild("HumanoidRootPart") then
                local HumanoidRootPart = Character.HumanoidRootPart
            end
        end)
        return TypedPromise.new(function(a1_2) -- Line: 261
            -- upvalues: a1 (val), TypedPromise (upval), CatRom (upval), ChristmasConsumables (upval), GameState (upval)
            -- upvalues: RunService (upval), bomb (upval)
            local u1 = a1
            ;(TypedPromise.new(function(a1, a2, a3) -- Line: 150
                -- upvalues: u1 (val), CatRom (upval), ChristmasConsumables (upval), GameState (upval)
                -- upvalues: RunService (upval), bomb (upval)
                local started = u1.Context.started
                local u11 = CatRom.new(u1.Context.positionData)
                local u12 = false
                local u17 = ChristmasConsumables.SantaSleigh:Clone()
                u17.Parent = workspace
                u17.Sleigh.Passby.PlaybackSpeed = GameState.TimeScale
                u17.Sleigh.Passby:Play()
                local u34 = (u11:SolveLength()) / u1.Context.duration
                local u35 = 0
                local u36 = nil
                local v1 = RunService.Heartbeat:Connect(function() -- Line: 166
                    -- upvalues: u35 (ref), started (ref), GameState (upval), u34 (val), u11 (val), u36 (ref), u17 (val)
                    -- upvalues: a1 (val), u1 (upval), u12 (ref), bomb (upval)
                    u35 = u35 + ((workspace:GetServerTimeNow()) - started) * GameState.TimeScale
                    if 1 < u35 / u34 then
                        u11:Destroy()
                        u36:Disconnect()
                        u17:Destroy()
                        a1()
                        return
                    end
                    local v1 = u35 / u34
                    local u36_2 = u11:SolveUniformRotCFrame(v1)
                    if u1.Context.bombDropTime <= v1 and not u12 then
                        u12 = true
                        task.spawn(function() -- Line: 182 -- upvalues: bomb (upval), u1 (upval), u36_2 (val)
                            bomb(u1, u36_2.Position)
                        end)
                    end
                    u17:PivotTo(u36_2)
                    started = workspace:GetServerTimeNow()
                end)
            end)):andThen(function() -- Line: 262 -- upvalues: a1_2 (val)
                a1_2()
            end)
        end):catch(function(a1) -- Line: 265
            warn(a1)
        end)
    end,
}