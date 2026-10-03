-- Script path: ReplicatedStorage.Content.Consumables.Santa’s Air Strike.Animator
-- Decompile time: 5.39 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local CatRom = require(ReplicatedStorage.Shared.Modules.CatRom)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
;(ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")
local IceEffect = ReplicatedStorage.Assets.Effects.Client.IceEffect
local ChristmasConsumables = ReplicatedStorage.Assets.Effects.Client.ChristmasConsumables
local u77 = {}

local function airStrike(a1) -- Line: 53
    -- upvalues: CatRom (val), ChristmasConsumables (val), TypedPromise (val), RunService (val), GameState (val)
    local u4 = CatRom.new(a1.positions)
    local u9 = ChristmasConsumables.Sleigh:Clone()
    u9.Parent = workspace.Terrain
    local v1 = TypedPromise.new(function(a1_2, a2, a3) -- Line: 61 -- upvalues: a1 (val), RunService (upval), GameState (upval), u4 (val), u9 (val)
        local u9_2 = (workspace:GetServerTimeNow()) - a1.started
        local u10 = nil
        u10 = RunService.Stepped:Connect(function(a1_3, a2) -- Line: 65
            -- upvalues: u9_2 (ref), GameState (upval), a1 (upval), u10 (ref), a1_2 (val), u4 (upval), u9 (upval)
            u9_2 = u9_2 + a2 * GameState.TimeScale
            local v1 = u9_2
            if a1.duration < v1 then
                u10:Disconnect()
                a1_2()
                return
            end
            v1 = u9_2 / a1.duration
            local v2 = u4:SolveUniformRotCFrame(v1)
            u9:PivotTo(v2)
            if a1.updated then
                a1.updated(u9_2, v2)
            end
        end)
        a3(function() -- Line: 84 -- upvalues: u10 (ref)
            if u10.Connected then
                u10:Disconnect()
            end
        end)
    end)
    v1:finally(function() -- Line: 91 -- upvalues: u9 (val), u4 (val)
        u9:Destroy()
        u4:Destroy()
    end)
    return v1
end

local function dropBomb(a1) -- Line: 99
    -- upvalues: ChristmasConsumables (val), TypedPromise (val), TweenService (val)
    local u11 = CFrame.Angles(Random.new():NextInteger(-2, 2), 0, 0)
    local u14 = CFrame.new(a1.startPosition)
    local u23 = (CFrame.new(a1.endPosition)) * CFrame.Angles(-1.5707963267948966, 0, 0)
    local u43 = (ChristmasConsumables.Gifts.Small:GetChildren())[math.random(1, #ChristmasConsumables.Gifts.Small:GetChildren())]:Clone()
    u43.CFrame = u14
    u43.Parent = workspace.Terrain
    local v1 = TypedPromise.new(function(a1_2, a2, a3) -- Line: 110
        -- upvalues: TweenService (upval), u43 (val), a1 (val), u14 (val), u23 (val), u11 (val)
        local u13 = TweenService:Create(u43, TweenInfo.new(a1.duration, Enum.EasingStyle.Linear), function(a1) -- Line: 114 -- upvalues: u43 (upval), u14 (upval), u23 (upval), u11 (upval) -- types: a1: number
            u43.CFrame = (u14:Lerp(u23, a1 ^ 2)) * CFrame.identity:Lerp(u11, a1 / 2)
        end)
        u13._time = (workspace:GetServerTimeNow()) - a1.started
        u13.PlaybackState = Enum.PlaybackState.Paused
        u13:Play()
        u13.Completed:Connect(function() -- Line: 124 -- upvalues: a1_2 (val)
            a1_2()
        end)
        a3(function() -- Line: 128 -- upvalues: u13 (val)
            u13:Cancel()
        end)
    end)
    v1:finally(function() -- Line: 133 -- upvalues: u43 (val)
        u43:Destroy()
    end)
    return v1
end

local function napalm(a1) -- Line: 140
    -- upvalues: IceEffect (val), u77 (val), EmitterManager (val), TypedPromise (val), TimescaleUtilities (val)
    local u4 = IceEffect:Clone()
    u4.Anchored = true
    u4.Size = Vector3.new(0.156, a1.radius, a1.radius)
    u4.CFrame = a1.cframe * CFrame.Angles(0, 0, 1.5707963267948966)
    u4.Parent = workspace.Terrain
    u77[u4] = {a1.cframe, a1.radius}
    EmitterManager.Emit("SnowballAoeBlast", a1.cframe, a1.radius / 4)
    local v1 = TypedPromise.new(function(a1_2, a2, a3) -- Line: 154 -- upvalues: TimescaleUtilities (upval), a1 (val), u77 (upval), u4 (val)
        local u3 = nil
        TimescaleUtilities.Delay(a1.duration, function() -- Line: 157 -- upvalues: u3 (ref), u77 (upval), u4 (upval), a1_2 (val)
            u3 = nil
            u77[u4] = nil
            a1_2()
        end)
        a3(function() -- Line: 164 -- upvalues: u3 (ref)
            if u3 then
                task.cancel(u3)
            end
        end)
    end)
    v1:finally(function() -- Line: 171 -- upvalues: u77 (upval), u4 (val)
        u77[u4] = nil
        u4:Destroy()
    end)
    return v1
end

local function createSound(a1) -- Line: 179 -- upvalues: GameState (val)
    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://17410058393"
    if not Sound.Loaded then
        Sound.Loaded:Wait()
    end
    Sound.PlaybackSpeed = 1 * GameState.TimeScale
    Sound.Parent = a1
    Sound:Play()
    Sound.Ended:Connect(function() -- Line: 188 -- upvalues: Sound (val)
        Sound:Destroy()
    end)
end

return {
    OnEquip = function(a1) -- Line: 194
        -- upvalues: TypedPromise (val), Players (val), ReplicatedStorage (val), PlayerCharacterReplicator (val)
        -- upvalues: Animation (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 195
            -- upvalues: Players (upval), a1 (val), ReplicatedStorage (upval), PlayerCharacterReplicator (upval)
            -- upvalues: Animation (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local v1 = ReplicatedStorage.Assets.Effects.Client.FestiveRadio:Clone()
            ;(PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)):AddAccessories({v1})
            if a1.Executor == Players.LocalPlayer then
                local v2 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = v1.Animations.Equip,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                local v3 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = v1.Animations.Idle,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v3:Play(0)
                v2:Play(0)
                a1.currentAnimations = {v3, v2}
            end
            a1_2()
        end)
    end,
    OnUnequip = function(a1) -- Line: 228 -- upvalues: TypedPromise (val), Players (val), PlayerCharacterReplicator (val)
        return TypedPromise.new(function(a1_2) -- Line: 229 -- upvalues: Players (upval), a1 (val), PlayerCharacterReplicator (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character):RemoveAccessories(true)
            if a1.Executor == Players.LocalPlayer then
                for i, j in a1.currentAnimations do
                    j:Stop(0)
                end
            end
            a1_2()
        end)
    end,
    OnUse = function(a1) -- Line: 247
        -- upvalues: Players (val), createSound (val), TypedPromise (val), airStrike (val), TimescaleUtilities (val)
        -- upvalues: dropBomb (val), napalm (val)
        task.spawn(function() -- Line: 248 -- upvalues: Players (upval), a1 (val), createSound (upval)
            local Character = Players:GetPlayerByUserId(a1.PlayerId).Character
            if Character and Character:FindFirstChild("HumanoidRootPart") then
                createSound(Character.HumanoidRootPart)
            end
        end)
        return TypedPromise.new(function(a1_2, a2) -- Line: 255
            -- upvalues: a1 (val), airStrike (upval), TypedPromise (upval), TimescaleUtilities (upval), dropBomb (upval)
            -- upvalues: napalm (upval)
            local v1
            local Context = a1.Context
            local u9 = (workspace:GetServerTimeNow()) - Context.started
            local v2 = table.clone(Context.bombs)
            local identity = CFrame.identity
            local v3 = {
                ((airStrike({
                    positions = Context.airstrikePositions,
                    duration = Context.airstrikeDuration,
                    started = Context.started,
                    updated = function(a1, a2) -- Line: 265 -- upvalues: identity (ref)
                        identity = a2
                    end,
                })):catch(warn)),
            }
            for i, j in v2 do
                v1 = ((TypedPromise.new(function(a1, a2, a3) -- Line: 276 -- upvalues: TimescaleUtilities (upval), j (val), u9 (val)
                    local u3 = false
                    a3(function() -- Line: 278 -- upvalues: u3 (ref)
                        u3 = true
                    end)
                    TimescaleUtilities.Wait(j.startsAt - u9 - 0.4)
                    if not u3 then
                        a1()
                    end
                end)):andThen(function() -- Line: 288 -- upvalues: identity (ref), dropBomb (upval), j (val)
                    return (dropBomb({
                        duration = 0.4,
                        startPosition = identity.Position,
                        endPosition = j.endPosition,
                        started = workspace:GetServerTimeNow(),
                    }))
                end)):andThen(function() -- Line: 298 -- upvalues: napalm (upval), j (val), Context (val)
                    return (napalm({
                        radius = j.radius,
                        cframe = CFrame.new(j.endPosition),
                        duration = Context.bombDuration,
                    }))
                end)
                v1:catch(warn)
                table.insert(v3, v1)
            end
            ;(TypedPromise.all(v3):andThen(a1_2)):catch(a2)
        end)
    end,
}