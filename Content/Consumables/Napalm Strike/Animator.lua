-- Script path: ReplicatedStorage.Content.Consumables.Napalm Strike.Animator
-- Decompile time: 6.12 ms

game:GetService("DataStoreService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local CatRom = require(ReplicatedStorage.Shared.Modules.CatRom)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local DebugController = require(ReplicatedStorage.Client.Controllers.Shared.DebugController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local PlaneBomb = (ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects"):WaitForChild("Projectile"):WaitForChild("PlaneBomb")
local NapalmEffect = ReplicatedStorage.Assets.Effects.Client.NapalmEffect
local u92 = {}
DebugController.createGizmo("Napalm Bombs", function() -- Line: 37 -- upvalues: DebugController (val), u92 (val)
    DebugController.Gizmo.SetStyle(Color3.fromRGB(0, 255, 0))
    for i, j in u92 do
        DebugController.Gizmo.Cylinder:Draw(j[1], j[2] / 2, 1, 15)
    end
end)

local function airStrike(a1) -- Line: 65
    -- upvalues: CatRom (val), ReplicatedStorage (val), GameState (val), TypedPromise (val), RunService (val)
    local u4 = CatRom.new(a1.positions)
    local u12 = ReplicatedStorage.Assets.Effects.Client.Tomcat:Clone()
    u12.Parent = workspace.Terrain
    u12.PrimaryPart.Passby.PlaybackSpeed = 1 * GameState.TimeScale
    u12.PrimaryPart.Passby:Play()
    local v1 = TypedPromise.new(function(a1_2, a2, a3) -- Line: 73 -- upvalues: a1 (val), RunService (upval), GameState (upval), u4 (val), u12 (val)
        local u9 = (workspace:GetServerTimeNow()) - a1.started
        local u10 = nil
        u10 = RunService.Stepped:Connect(function(a1_3, a2) -- Line: 77
            -- upvalues: u9 (ref), GameState (upval), a1 (upval), u10 (ref), a1_2 (val), u4 (upval), u12 (upval)
            u9 = u9 + a2 * GameState.TimeScale
            local v1 = u9
            if a1.duration < v1 then
                u10:Disconnect()
                a1_2()
                return
            end
            v1 = u9 / a1.duration
            local v2 = u4:SolveUniformRotCFrame(v1)
            u12:PivotTo(v2 * (CFrame.Angles(0, 3.141592653589793, 3.141592653589793)))
            if a1.updated then
                a1.updated(u9, v2)
            end
        end)
        a3(function() -- Line: 96 -- upvalues: u10 (ref)
            if u10.Connected then
                u10:Disconnect()
            end
        end)
    end)
    v1:finally(function() -- Line: 103 -- upvalues: u12 (val), u4 (val)
        u12:Destroy()
        u4:Destroy()
    end)
    return v1
end

local function dropBomb(a1) -- Line: 111
    -- upvalues: PlaneBomb (val), TypedPromise (val), TweenService (val)
    local u11 = CFrame.Angles(Random.new():NextInteger(-2, 2), 0, 0)
    local u14 = CFrame.new(a1.startPosition)
    local u31 = (CFrame.new(a1.endPosition)) * CFrame.Angles(-1.5707963267948966, 0, 0) + Vector3.new(0, PlaneBomb.Size.X, 0)
    local u35 = PlaneBomb:Clone()
    local Mesh = u35.Mesh
    Mesh.Scale = Mesh.Scale * 1.5
    u35.CFrame = u14
    u35.Parent = workspace.Terrain
    local v1 = TypedPromise.new(function(a1_2, a2, a3) -- Line: 123
        -- upvalues: TweenService (upval), u35 (val), a1 (val), u14 (val), u31 (val), u11 (val)
        local u13 = TweenService:Create(u35, TweenInfo.new(a1.duration, Enum.EasingStyle.Linear), function(a1) -- Line: 127 -- upvalues: u35 (upval), u14 (upval), u31 (upval), u11 (upval) -- types: a1: number
            u35.CFrame = (u14:Lerp(u31, a1 ^ 2)) * CFrame.identity:Lerp(u11, a1 / 2)
        end)
        u13._time = (workspace:GetServerTimeNow()) - a1.started
        u13.PlaybackState = Enum.PlaybackState.Paused
        u13:Play()
        u13.Completed:Connect(function() -- Line: 137 -- upvalues: a1_2 (val)
            a1_2()
        end)
        a3(function() -- Line: 141 -- upvalues: u13 (val)
            u13:Cancel()
        end)
    end)
    v1:finally(function() -- Line: 146 -- upvalues: u35 (val)
        u35:Destroy()
    end)
    return v1
end

local function napalm(a1) -- Line: 153
    -- upvalues: NapalmEffect (val), u92 (val), EmitterManager (val), TypedPromise (val), TimescaleUtilities (val)
    local u4 = NapalmEffect:Clone()
    u4.Anchored = true
    u4.Size = Vector3.new(0.156, a1.radius, a1.radius)
    u4.CFrame = a1.cframe * CFrame.Angles(0, 0, 1.5707963267948966)
    u4.Parent = workspace.Terrain
    u92[u4] = {a1.cframe, a1.radius}
    EmitterManager.Emit("NapalmStrike", a1.cframe, a1.radius / 8)
    local v1 = TypedPromise.new(function(a1_2, a2, a3) -- Line: 167 -- upvalues: TimescaleUtilities (upval), a1 (val), u92 (upval), u4 (val)
        local u3 = nil
        TimescaleUtilities.Delay(a1.duration, function() -- Line: 170 -- upvalues: u3 (ref), u92 (upval), u4 (upval), a1_2 (val)
            u3 = nil
            u92[u4] = nil
            a1_2()
        end)
        a3(function() -- Line: 177 -- upvalues: u3 (ref)
            if u3 then
                task.cancel(u3)
            end
        end)
    end)
    v1:finally(function() -- Line: 184 -- upvalues: u92 (upval), u4 (val)
        u92[u4] = nil
        u4:Destroy()
    end)
    return v1
end

local function createSound(a1) -- Line: 192 -- upvalues: GameState (val)
    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://17410058393"
    if not Sound.Loaded then
        Sound.Loaded:Wait()
    end
    Sound.PlaybackSpeed = 1 * GameState.TimeScale
    Sound.Parent = a1
    Sound:Play()
    Sound.Ended:Connect(function() -- Line: 201 -- upvalues: Sound (val)
        Sound:Destroy()
    end)
end

return {
    OnEquip = function(a1) -- Line: 207
        -- upvalues: TypedPromise (val), Players (val), ReplicatedStorage (val), PlayerCharacterReplicator (val)
        -- upvalues: Animation (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 208
            -- upvalues: Players (upval), a1 (val), ReplicatedStorage (upval), PlayerCharacterReplicator (upval)
            -- upvalues: Animation (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local v1 = ReplicatedStorage.Assets.Effects.Client.Radio:Clone()
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
    OnUnequip = function(a1) -- Line: 241 -- upvalues: TypedPromise (val), Players (val), PlayerCharacterReplicator (val)
        return TypedPromise.new(function(a1_2) -- Line: 242 -- upvalues: Players (upval), a1 (val), PlayerCharacterReplicator (upval)
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
    OnUse = function(a1) -- Line: 260
        -- upvalues: Players (val), createSound (val), TypedPromise (val), airStrike (val), TimescaleUtilities (val)
        -- upvalues: dropBomb (val), napalm (val)
        task.spawn(function() -- Line: 261 -- upvalues: Players (upval), a1 (val), createSound (upval)
            local Character = Players:GetPlayerByUserId(a1.PlayerId).Character
            if Character and Character:FindFirstChild("HumanoidRootPart") then
                createSound(Character.HumanoidRootPart)
            end
        end)
        return TypedPromise.new(function(a1_2, a2) -- Line: 268
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
                    updated = function(a1, a2) -- Line: 278 -- upvalues: identity (ref)
                        identity = a2
                    end,
                })):catch(warn)),
            }
            for i, j in v2 do
                v1 = ((TypedPromise.new(function(a1, a2, a3) -- Line: 289 -- upvalues: TimescaleUtilities (upval), j (val), u9 (val)
                    local u3 = false
                    a3(function() -- Line: 291 -- upvalues: u3 (ref)
                        u3 = true
                    end)
                    TimescaleUtilities.Wait(j.startsAt - u9 - 0.4)
                    if not u3 then
                        a1()
                    end
                end)):andThen(function() -- Line: 301 -- upvalues: identity (ref), dropBomb (upval), j (val)
                    return (dropBomb({
                        duration = 0.4,
                        startPosition = identity.Position,
                        endPosition = j.endPosition,
                        started = workspace:GetServerTimeNow(),
                    }))
                end)):andThen(function() -- Line: 311 -- upvalues: napalm (upval), j (val), Context (val)
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