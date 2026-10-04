-- Script path: ReplicatedStorage.Content.MapItems.StarCannon.Controller
-- Decompile time: 3.03 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local EnemyService = require(ServerStorage.Server.Services.Game.EnemyService)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemPickupService = require(ServerStorage.Server.Services.Game.ItemPickupService)
require(ReplicatedStorage.Shared.Modules.Network)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
return {
    new = function(a1, a2) -- Line: 12
        -- upvalues: Signal (val), GameState (val), EnemyService (val), TimescaleUtilities (val), Enum (val)
        -- upvalues: ItemPickupService (val)
        local u2 = {}
        u2.onShoot = Signal.new()
        u2.onFire = Signal.new()

        function u2.Destroy(a1) end

        function u2.Activate(a1) -- Line: 21 -- upvalues: u2 (val)
            u2.replicator:Set("Enabled", true)
        end

        function u2.Reset(a1) -- Line: 25 -- upvalues: u2 (val)
            u2.replicator:Set("Batteries", 0)
            u2.replicator:Set("Enabled", false)
        end

        function u2.TogglePrompt(a1_2, a2) -- Line: 30 -- upvalues: a1 (val)
            a1.Prompt.ProximityPrompt.Enabled = a2
        end

        function u2.Initialize(a1_2) -- Line: 34
            -- upvalues: u2 (val), a2 (val), a1 (val), GameState (upval), EnemyService (upval)
            -- upvalues: TimescaleUtilities (upval), Enum (upval)
            u2._lastTick = 0
            u2._randomTime = math.random(a2.RandomSpawnTimes.Min, a2.RandomSpawnTimes.Max)
            a1.Prompt.ProximityPrompt.Triggered:Connect(function(a1_3) -- Line: 38
                -- upvalues: u2 (upval), a2 (upval), GameState (upval), EnemyService (upval), a1 (upval), a1_2 (val)
                -- upvalues: TimescaleUtilities (upval), Enum (upval)
                if (u2.replicator:Get("Batteries")) < a2.MaxBatteries then
                    return
                end
                local v1 = u2.replicator:Get("Batteries")
                if a2.MaxBatteries <= v1 then
                    u2.replicator:Set("Batteries", 0)
                    u2:TogglePrompt(false)
                end
                if GameState.Replicator:Get("LordExoActive") then
                    u2.onFire:Fire(a1_3)
                    a1_2:ReplicateAction("Shoot", nil)
                    TimescaleUtilities.Delay(1.1, function() -- Line: 83 -- upvalues: u2 (upval), a1_3 (val)
                        u2.onShoot:Fire(a1_3)
                    end)
                    return
                end
                local u80 = nil
                local Health = 0
                for i, j in EnemyService.GetEnemies() do
                    if Health < j.Health then
                        Health = j.Health
                        u80 = j
                    end
                end
                if u80 then
                    print("Firing at ", u80.Name)
                    local Position = (a1:GetPivot()).Position
                    a1_2:ReplicateAction("Shoot", (u80:PredictMovement(u80, Position, 999, 1.1, false)))
                    TimescaleUtilities.Delay(1.1, function() -- Line: 68 -- upvalues: u80 (ref), a2 (upval), Enum (upval)
                        u80:Damage(a2.Damage, Enum.DamageType.Explosion)
                    end)
                end
            end)
        end

        function u2.Step(a1_2, a2_2) -- Line: 89
            -- upvalues: u2 (val), a2 (val), ItemPickupService (upval), Enum (upval), a1 (val)
            if u2.replicator:Get("Enabled") then
                local v1 = u2
                v1._lastTick = v1._lastTick + a2_2
                local _lastTick = u2._lastTick
                if u2._randomTime <= _lastTick and (u2.replicator:Get("Batteries")) < a2.MaxBatteries then
                    u2._lastTick = 0
                    u2._randomTime = math.random(a2.RandomSpawnTimes.Min, a2.RandomSpawnTimes.Max)
                    ;(ItemPickupService.new(
                        Enum.ItemPickupType.StarBattery,
                        (workspace.Map.BatterySpawns:GetChildren())[(math.random(1, #(workspace.Map.BatterySpawns:GetChildren())))].Position,
                        nil,
                        1,
                        nil,
                        nil,
                        nil,
                        true
                    )).Collected:Once(function() -- Line: 113 -- upvalues: u2 (upval), a2 (upval), a1 (upval)
                        u2.replicator:Set("Batteries", (math.clamp(u2.replicator:Get("Batteries") + 1, 0, a2.MaxBatteries)))
                        local v1 = u2.replicator:Get("Batteries")
                        if a2.MaxBatteries <= v1 then
                            a1.Prompt.ProximityPrompt.Enabled = true
                        end
                    end)
                end
            end
        end

        return u2
    end,
}