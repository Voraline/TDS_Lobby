-- Script path: ReplicatedStorage.Content.Consumables.Cooldown Flag.Controller
-- Decompile time: 1.95 ms

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Player = require(ServerStorage.Server.Modules.Player)
local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)
local TimerClass = require(ReplicatedStorage.Shared.Modules.TimerClass)
local TowerService = require(ServerStorage.Server.Services.Game.TowerService)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
return {
    CreateContext = function(a1) -- Line: 19
        a1.lifeTime = 45
        a1.radius = 16
        a1.buff = 20
    end,
    OnUse = function(a1) -- Line: 25
        -- upvalues: TypedPromise (val), HttpService (val), Players (val), Player (val), Enum (val), TeamOctrees (val)
        -- upvalues: TowerService (val), TimerClass (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 26
            -- upvalues: a1 (val), HttpService (upval), Players (upval), Player (upval), Enum (upval)
            -- upvalues: TeamOctrees (upval), TowerService (upval), TimerClass (upval)
            local Context = a1.Context
            local u5 = {}
            local playerId = Context.playerId
            local u16 = (HttpService:GenerateGUID(false)):gsub("-", "")
            local PlayerByUserId = Players:GetPlayerByUserId(playerId)
            local u26 = PlayerByUserId
            if u26 then
                u26 = Player.GetEntityFromPlayer(PlayerByUserId)
            end
            if not PlayerByUserId then
                a2("Invalid player")
                return
            end

            local function buffTower(a1) -- Line: 40 -- upvalues: Context (val), u16 (val), Enum (upval), u5 (val)
                a1:Buff({
                    Type = "Cooldown",
                    Name = "Cooldown Flag",
                    Stackable = false,
                    Value = Context.buff,
                    UID = u16,
                })
                a1.AbilityEffects:AddTimed(Enum.BuffType.Cooldown, Context.lifeTime)
                u5[a1] = a1
            end

            local function buffNearbyTowers() -- Line: 52
                -- upvalues: TeamOctrees (upval), u26 (val), Context (val), u5 (val), buffTower (val)
                local v1 = TeamOctrees.getTeammates(u26.Team, Context.position, Context.radius)
                if v1 and #v1 > 0 then
                    for i, v in ipairs(v1) do
                        if v.Type == "Towers" and not u5[v] then
                            buffTower(v)
                        end
                    end
                end
            end

            local u43 = TowerService.TowerSpawnedEvent:Connect(buffNearbyTowers)
            buffNearbyTowers()
            a1.Replicator:Set("Position", Context.position)
            a1.Replicator:Set("TimeLeft", Context.lifeTime)
            a1.Replicator:Set("LifeTime", Context.lifeTime)

            local function cleanUp() -- Line: 72 -- upvalues: u43 (val), u5 (val), u16 (val)
                u43:Disconnect()
                for k, v in pairs(u5) do
                    v:UpdateBuff("Cooldown", "Cooldown Flag", 0, u16)
                end
            end

            local u75 = TimerClass.new("CooldownFlag", Context.lifeTime, nil, nil, true)
            u75.OnFinish:Connect(function() -- Line: 80 -- upvalues: cleanUp (val), a1_2 (val)
                cleanUp()
                a1_2()
            end)
            u75.OnSecond:Connect(function() -- Line: 85 -- upvalues: u75 (val), a1 (upval)
                local TimeLeft = u75:GetTimeLeft()
                a1.Replicator:Set("TimeLeft", TimeLeft)
            end)
            a3(function() -- Line: 90 -- upvalues: cleanUp (val), u75 (val)
                cleanUp()
                u75:Destroy()
            end)
        end)
    end,
}