-- Script path: ReplicatedStorage.Content.Consumables.AirStrike.Animator
-- Decompile time: 4.95 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local CatRom = require(ReplicatedStorage.Shared.Modules.CatRom)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)

local function bomb(a1, a2, a3) -- Line: 15 -- upvalues: ItemDrop (val), EffectsController (val)
    local v1 = (Random.new()):NextNumber(-a1.Context.BombData.Radius, a1.Context.BombData.Radius)
    local u15 = {dtMultiplier = 6, gravity = -3, velocity = 0, start = a2}
    u15.goal = a1.Context.position + Vector3.new(v1, 0, v1)
    local v2 = {}
    for i, j in a3:GetChildren() do
        if j.Name == "Bomb" then
            table.insert(v2, j)
        end
    end
    local u42 = v2[math.random(1, #v2)]
    for k, n in u42:GetChildren() do
        if n:IsA("ParticleEmitter") then
            n.Enabled = true
        end
    end
    u42.Weld:Destroy()
    u15.start = u42.CFrame.Position
    u42.CFrame = CFrame.new(u15.start)
    u42.Parent = workspace
    ;(ItemDrop.Drop(u15.start, u15.goal, u42, u15.dtMultiplier, u15.gravity, u15.velocity, function(a1, a2, a3) -- Line: 58
        return CFrame.new(a3, a2).Rotation
    end)):andThen(function() -- Line: 61 -- upvalues: u15 (val), u42 (val), EffectsController (upval), a1 (val)
        local goal = u15.goal
        u42:Destroy()
        EffectsController.Explosion({Position = goal, Radius = a1.Context.BombData.ExplosionRadius / 2})
    end)
end

local function airStrike(a1) -- Line: 73
    -- upvalues: TypedPromise (val), CatRom (val), ReplicatedStorage (val), GameState (val), RunService (val)
    -- upvalues: bomb (val), TimescaleUtilities (val)
    return (TypedPromise.new(function(a1_2, a2, a3) -- Line: 74
        -- upvalues: a1 (val), CatRom (upval), ReplicatedStorage (upval), GameState (upval), RunService (upval)
        -- upvalues: bomb (upval), TimescaleUtilities (upval)
        local started = a1.Context.started
        local u11 = CatRom.new(a1.Context.positionData)
        local u12 = false
        local u20 = ReplicatedStorage.Assets.Effects.Client.Tomcat:Clone()
        u20.Parent = workspace
        u20.PrimaryPart.Passby.PlaybackSpeed = GameState.TimeScale
        u20.PrimaryPart.Passby:Play()
        local u37 = (u11:SolveLength()) / a1.Context.duration
        local u38 = 0
        local u39 = nil
        local v1 = RunService.Heartbeat:Connect(function() -- Line: 90
            -- upvalues: u38 (ref), started (ref), GameState (upval), u37 (val), u11 (val), u39 (ref), u20 (val)
            -- upvalues: a1_2 (val), a1 (upval), u12 (ref), bomb (upval), TimescaleUtilities (upval)
            u38 = u38 + ((workspace:GetServerTimeNow()) - started) * GameState.TimeScale
            if 1 < u38 / u37 then
                u11:Destroy()
                u39:Disconnect()
                u20:Destroy()
                a1_2()
                return
            end
            local v1 = u38 / u37
            local u36 = u11:SolveUniformRotCFrame(v1)
            if a1.Context.bombDropTime <= v1 and not u12 then
                u12 = true
                task.spawn(function() -- Line: 106 -- upvalues: a1 (upval), bomb (upval), u36 (val), u20 (upval), TimescaleUtilities (upval)
                    local Amount = a1.Context.BombData.Amount
                    for i = 1, Amount do
                        bomb(a1, u36.Position, u20)
                        TimescaleUtilities.Wait(0.045)
                    end
                end)
            end
            u20:PivotTo(u36 * (CFrame.Angles(0, 3.141592653589793, 3.141592653589793)))
            started = workspace:GetServerTimeNow()
        end)
    end))
end

local function createSound(a1) -- Line: 123 -- upvalues: GameState (val)
    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://17410058179"
    if not Sound.Loaded then
        Sound.Loaded:Wait()
    end
    Sound.PlaybackSpeed = 1 * GameState.TimeScale
    Sound.Parent = a1
    Sound:Play()
    Sound.Ended:Connect(function() -- Line: 132 -- upvalues: Sound (val)
        Sound:Destroy()
    end)
end

return {
    OnEquip = function(a1) -- Line: 138
        -- upvalues: TypedPromise (val), Players (val), ReplicatedStorage (val), PlayerCharacterReplicator (val)
        -- upvalues: Animation (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 139
            -- upvalues: Players (upval), a1 (val), ReplicatedStorage (upval), PlayerCharacterReplicator (upval)
            -- upvalues: Animation (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local Radio = ReplicatedStorage.Assets.Effects.Client.Radio
            ;(PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)):AddAccessories({Radio})
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
    OnUnequip = function(a1) -- Line: 172 -- upvalues: TypedPromise (val), Players (val), PlayerCharacterReplicator (val)
        return TypedPromise.new(function(a1_2) -- Line: 173 -- upvalues: Players (upval), a1 (val), PlayerCharacterReplicator (upval)
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
    OnUse = function(a1) -- Line: 191
        -- upvalues: Players (val), createSound (val), TypedPromise (val), CatRom (val), ReplicatedStorage (val)
        -- upvalues: GameState (val), RunService (val), bomb (val), TimescaleUtilities (val)
        task.spawn(function() -- Line: 192 -- upvalues: Players (upval), a1 (val), createSound (upval)
            local Character = Players:GetPlayerByUserId(a1.PlayerId).Character
            if Character and Character:FindFirstChild("HumanoidRootPart") then
                createSound(Character.HumanoidRootPart)
            end
        end)
        return TypedPromise.new(function(a1_2) -- Line: 199
            -- upvalues: a1 (val), TypedPromise (upval), CatRom (upval), ReplicatedStorage (upval), GameState (upval)
            -- upvalues: RunService (upval), bomb (upval), TimescaleUtilities (upval)
            local u1 = a1
            ;(TypedPromise.new(function(a1, a2, a3) -- Line: 74
                -- upvalues: u1 (val), CatRom (upval), ReplicatedStorage (upval), GameState (upval), RunService (upval)
                -- upvalues: bomb (upval), TimescaleUtilities (upval)
                local started = u1.Context.started
                local u11 = CatRom.new(u1.Context.positionData)
                local u12 = false
                local u20 = ReplicatedStorage.Assets.Effects.Client.Tomcat:Clone()
                u20.Parent = workspace
                u20.PrimaryPart.Passby.PlaybackSpeed = GameState.TimeScale
                u20.PrimaryPart.Passby:Play()
                local u37 = (u11:SolveLength()) / u1.Context.duration
                local u38 = 0
                local u39 = nil
                local v1 = RunService.Heartbeat:Connect(function() -- Line: 90
                    -- upvalues: u38 (ref), started (ref), GameState (upval), u37 (val), u11 (val), u39 (ref), u20 (val)
                    -- upvalues: a1 (val), u1 (upval), u12 (ref), bomb (upval), TimescaleUtilities (upval)
                    u38 = u38 + ((workspace:GetServerTimeNow()) - started) * GameState.TimeScale
                    if 1 < u38 / u37 then
                        u11:Destroy()
                        u39:Disconnect()
                        u20:Destroy()
                        a1()
                        return
                    end
                    local v1 = u38 / u37
                    local u36 = u11:SolveUniformRotCFrame(v1)
                    if u1.Context.bombDropTime <= v1 and not u12 then
                        u12 = true
                        task.spawn(function() -- Line: 106 -- upvalues: u1 (upval), bomb (upval), u36 (val), u20 (upval), TimescaleUtilities (upval)
                            local Amount = u1.Context.BombData.Amount
                            for i = 1, Amount do
                                bomb(u1, u36.Position, u20)
                                TimescaleUtilities.Wait(0.045)
                            end
                        end)
                    end
                    u20:PivotTo(u36 * (CFrame.Angles(0, 3.141592653589793, 3.141592653589793)))
                    started = workspace:GetServerTimeNow()
                end)
            end)):andThen(function() -- Line: 200 -- upvalues: a1_2 (val)
                a1_2()
            end)
        end):catch(function(a1) -- Line: 203
            warn(a1)
        end)
    end,
}