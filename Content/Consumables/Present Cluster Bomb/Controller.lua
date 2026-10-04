-- Script path: ReplicatedStorage.Content.Consumables.Present Cluster Bomb.Controller
-- Decompile time: 3.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("ServerStorage")
local CatRom = require(ReplicatedStorage.Shared.Modules.CatRom)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)

local function handleDamage(a1, a2, a3) -- Line: 16 -- upvalues: TeamOctrees (val), Enum (val) -- types: a1: vector
    for i, v in ipairs((TeamOctrees.getTargets(Enum.Team.Player, a1, a2))) do
        v:Damage(a3)
    end
end

local function handleStuns(a1, a2, a3) -- Line: 24 -- upvalues: TeamOctrees (val), Enum (val) -- types: a1: vector
    for i, j in (TeamOctrees.getTeammates(Enum.Team.Player, a1, a2)) do
        if j.Type ~= "Units" then
            j:Stun(a3)
        end
    end
end

local function cluster(a1) -- Line: 34
    -- upvalues: ItemDrop (val), TimescaleUtilities (val), handleDamage (val), handleStuns (val)
    local v1
    for i, j in a1.Context.ClusterData do
        v1 = {
            dtMultiplier = 7,
            gravity = -1,
            velocity = 3,
            start = a1.Context.position,
            goal = j,
        }
        TimescaleUtilities.Delay((ItemDrop.GetTimeToDestinationWithGV(v1.start, v1.goal, v1.gravity, v1.velocity)) / v1.dtMultiplier, function() -- Line: 51 -- upvalues: handleDamage (upval), j (val), a1 (val), handleStuns (upval)
            handleDamage(j, a1.Context.BombData.ClusterExplosionRadius, a1.Context.BombData.Damage)
            handleStuns(j, a1.Context.BombData.ClusterExplosionRadius, a1.Context.BombData.StunTime)
        end)
    end
end

local function bomb(a1, a2) -- Line: 67
    -- upvalues: ItemDrop (val), TimescaleUtilities (val), cluster (val), handleDamage (val)
    local v1 = {
        dtMultiplier = 6,
        gravity = -2,
        velocity = 0,
        start = a2,
        goal = a1.Context.position,
    }
    TimescaleUtilities.Delay((ItemDrop.GetTimeToDestinationWithGV(v1.start, v1.goal, v1.gravity, v1.velocity)) / v1.dtMultiplier, function() -- Line: 83 -- upvalues: cluster (upval), a1 (val), handleDamage (upval)
        cluster(a1)
        handleDamage(a1.Context.position, a1.Context.BombData.ExplosionRadius, a1.Context.BombData.Damage)
    end)
end

local function airStrike(a1) -- Line: 93
    -- upvalues: TypedPromise (val), CatRom (val), RunService (val), GameState (val), bomb (val)
    return (TypedPromise.new(function(a1_2, a2, a3) -- Line: 94
        -- upvalues: CatRom (upval), a1 (val), RunService (upval), GameState (upval), bomb (upval)
        local u8 = CatRom.new(a1.Context.positionData)
        local u15 = (u8:SolveLength()) / a1.Context.duration
        local started = a1.Context.started
        local u19 = false
        local u20 = 0
        local u21 = nil
        u21 = RunService.Heartbeat:Connect(function() -- Line: 105
            -- upvalues: u20 (ref), started (ref), GameState (upval), u15 (val), u8 (val), u21 (ref), a1_2 (val)
            -- upvalues: a1 (upval), u19 (ref), bomb (upval)
            u20 = u20 + ((workspace:GetServerTimeNow()) - started) * GameState.TimeScale
            if 1 < u20 / u15 then
                u8:Destroy()
                u21:Disconnect()
                a1_2()
                return
            end
            local v1 = u20 / u15
            if a1.Context.bombDropTime <= v1 and not u19 then
                bomb(a1, u8:SolveUniformPosition(v1))
                u19 = true
            end
            started = workspace:GetServerTimeNow()
        end)
        a3(function() -- Line: 125 -- upvalues: u8 (val), u21 (ref)
            u8:Destroy()
            u21:Disconnect()
        end)
    end))
end

return {
    CreateContext = function(a1) -- Line: 135
        local v1 = (CFrame.new(a1.position, a1.position - a1.direction * Vector3.new(1, 0, 1))) * CFrame.new(0, 15, 0)
        local v2 = a1.position + Vector3.new(0, 15, 0)
        local v3 = v1 * CFrame.new(0, 30, 120) * CFrame.new(130, 0, 30)
        v2 = (CFrame.new(v2, v3.Position)) * CFrame.Angles(-0.03490658503988659, -0.17453292519943295, 0.3490658503988659)
        local v4 = (CFrame.new((v1 * CFrame.new(0, 30, -120)).Position, v2.Position)) * CFrame.Angles(-0.08726646259971647, -0.3490658503988659, 0.7853981633974483)
        v3 = (CFrame.new(v3.Position, v2.Position)) * CFrame.Angles(-0.10471975511965978, 3.141592653589793, 0.5235987755982988)
        a1.duration = 90
        a1.ClusterData = {}
        for i = 1, 6 do
            table.insert(a1.ClusterData, a1.position + Vector3.new(math.random(-12, 12), 0, (math.random(-12, 12))))
        end
        a1.positionData = {v4, v2, v3}
        a1.BombData = {
            Amount = 6,
            Radius = 9.5,
            ExplosionRadius = 14,
            ClusterExplosionRadius = 6,
            StunTime = 3,
            Damage = 100,
        }
        a1.bombDropTime = 0.28
    end,
    OnUse = function(a1) -- Line: 184 -- upvalues: TypedPromise (val), CatRom (val), RunService (val), GameState (val), bomb (val)
        return TypedPromise.new(function(a1_2) -- Line: 185
            -- upvalues: a1 (val), TypedPromise (upval), CatRom (upval), RunService (upval), GameState (upval)
            -- upvalues: bomb (upval)
            local u1 = a1
            ;(TypedPromise.new(function(a1, a2, a3) -- Line: 94
                -- upvalues: CatRom (upval), u1 (val), RunService (upval), GameState (upval), bomb (upval)
                local u8 = CatRom.new(u1.Context.positionData)
                local u15 = (u8:SolveLength()) / u1.Context.duration
                local started = u1.Context.started
                local u19 = false
                local u20 = 0
                local u21 = nil
                u21 = RunService.Heartbeat:Connect(function() -- Line: 105
                    -- upvalues: u20 (ref), started (ref), GameState (upval), u15 (val), u8 (val), u21 (ref), a1 (val)
                    -- upvalues: u1 (upval), u19 (ref), bomb (upval)
                    u20 = u20 + ((workspace:GetServerTimeNow()) - started) * GameState.TimeScale
                    if 1 < u20 / u15 then
                        u8:Destroy()
                        u21:Disconnect()
                        a1()
                        return
                    end
                    local v1 = u20 / u15
                    if u1.Context.bombDropTime <= v1 and not u19 then
                        bomb(u1, u8:SolveUniformPosition(v1))
                        u19 = true
                    end
                    started = workspace:GetServerTimeNow()
                end)
                a3(function() -- Line: 125 -- upvalues: u8 (val), u21 (ref)
                    u8:Destroy()
                    u21:Disconnect()
                end)
            end)):andThen(function() -- Line: 186 -- upvalues: a1_2 (val)
                a1_2()
            end)
        end)
    end,
}