-- Script path: ReplicatedStorage.Content.MapItems.BunnySentry.Controller
-- Decompile time: 2.09 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local CashAwardService = require(ServerStorage.Server.Services.Game.CashAwardService)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local PlayerService = require(ServerStorage.Server.Services.Shared.PlayerService)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
return {
    new = function(a1, a2) -- Line: 11
        -- upvalues: TimescaleUtilities (val), Enum (val), ItemDrop (val), GameState (val), PlayerService (val)
        -- upvalues: CashAwardService (val)
        local v1 = {
            Destroy = function(a1) -- Line: 14
                a1:ResetState()
            end,
            GetRange = function(a1) -- Line: 19 -- upvalues: a2 (val)
                return a2.Range
            end,
            ResetState = function(self) -- Line: 23
                self.replicator:Set("State", "Reset")
                warn("reseted")
            end,
            Initialize = function(a1_2) -- Line: 28 -- upvalues: TimescaleUtilities (upval), a1 (val), Enum (upval), a2 (val)
                warn("BunnyInitialize")
                a1_2.canCheck = false
                TimescaleUtilities.Delay(1, function() -- Line: 33 -- upvalues: a1_2 (val)
                    a1_2.canCheck = true
                end)
                a1_2.replicator:Set("State", "Normal")
                a1_2.position = a1:GetPivot().Position
                a1_2.team = Enum.Team.Player
                a1_2.targetingMode = a2.TargetingMode
            end,
            LaunchAttack = function(a1, a2) -- Line: 43 -- upvalues: ItemDrop (upval), TimescaleUtilities (upval)
                a1.sacrificing = true
                a1.dead = true
                local v1 = {
                    velocity = 30,
                    gravity = -14,
                    dtMultiplier = 3,
                    startPosition = a1.position,
                    endPosition = a2 - Vector3.new(0, 1.5, 0),
                }
                local v2 = (ItemDrop.GetTimeToDestinationWithGV(v1.startPosition, v1.endPosition, v1.gravity, v1.velocity)) / v1.dtMultiplier
                a1:ReplicateAction("LaunchAttack", v1)
                local v3 = TimescaleUtilities.DelayPromise(v2)
                TimescaleUtilities.Delay(v2 + 0.1, function() -- Line: 66 -- upvalues: a1 (val)
                    a1.replicator:Set("State", "Death")
                end)
                return v3
            end,
        }
        local Difficulty = GameState.Difficulty

        function v1.Step(a1, a2_2) -- Line: 75
            -- upvalues: a2 (val), Enum (upval), PlayerService (upval), Difficulty (val), CashAwardService (upval)
            -- upvalues: TimescaleUtilities (upval)
            if not a1.canCheck then
                return
            end
            if a1.sacrificing then
                a1:ResetTarget()
                return
            end
            local v1 = a1:FindTarget()
            if not v1 or not v1:IsAlive() then
                a1:ResetTarget()
            else
                v1:Damage(a2.Damage, Enum.DamageType.Normal)
                if not v1:IsAlive() then
                    local DefaultCashReward, v2
                    local v3 = PlayerService.GetPlayerCount()
                    for i, j in PlayerService.GetPlayers() do
                        DefaultCashReward = v1.Stats.Reward[Difficulty] or a2.DefaultCashReward
                        v2 = if not a2.SplitAmount then v1.Stats.Reward[Difficulty] else math.floor(DefaultCashReward / v3)
                        CashAwardService.AwardCashFromNPC(v1, j, v2)
                    end
                end
            end
            TimescaleUtilities.Wait(a2.Cooldown)
        end

        return v1
    end,
}