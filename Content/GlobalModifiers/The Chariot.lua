-- Script path: ReplicatedStorage.Content.GlobalModifiers.The Chariot
-- Decompile time: 1.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "The Chariot",
    description = "Towers gain a 10% cooldown debuff. On the last wave towers gain a 10% damage and cooldown buff.",
    icon = 114594145502572,
    rewardMultiplier = 0,
    onEnableServer = function(a1, a2, a3) -- Line: 15 -- upvalues: ServerStorage (val), Maid (val), LegacyMiddleware (val), GameState (val)
        local TowerService = require(ServerStorage.Server.Services.Game.TowerService)
        local u12 = Maid.new()
        a2:Mark(u12)

        local function runTowers(a1) -- Line: 22 -- upvalues: u12 (val), TowerService (val)
            local u2 = if not a1 then 0 else 10
            local u5 = if not a1 then -10 else 7.5
            u12:Mark((TowerService.TowerSpawnedEvent:Connect(function(a1) -- Line: 26 -- upvalues: u5 (val), u2 (val)
                a1:Buff({
                    Type = "Cooldown",
                    Name = "TheChariotModifier",
                    Stackable = false,
                    Duration = (1 / 0),
                    Value = u5,
                })
                a1:Buff({
                    Type = "Damage",
                    Name = "TheChariotModifier",
                    Stackable = false,
                    Duration = (1 / 0),
                    Value = u2,
                })
            end)))
            for i, j in TowerService.GetAllTowers() do
                j:Buff({
                    Type = "Cooldown",
                    Name = "TheChariotModifier",
                    Stackable = false,
                    Duration = (1 / 0),
                    Value = u5,
                })
                j:Buff({
                    Type = "Damage",
                    Name = "TheChariotModifier",
                    Stackable = false,
                    Duration = (1 / 0),
                    Value = u2,
                })
            end
        end

        local function cleanUpTowers() -- Line: 61 -- upvalues: TowerService (val), u12 (val)
            for i, j in TowerService.GetAllTowers() do
                j:CancelBuff({Type = "Cooldown", Name = "TheChariotModifier"})
                j:CancelBuff({Type = "Damage", Name = "TheChariotModifier"})
            end
            u12:Sweep()
        end

        a2:Mark(function() -- Line: 76 -- upvalues: cleanUpTowers (val)
            cleanUpTowers()
        end)
        runTowers()
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.OnNextWave, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 86 -- upvalues: GameState (upval), cleanUpTowers (val), runTowers (val)
            if a2 == GameState.LastWaveNumber then
                cleanUpTowers()
                runTowers(true)
            end
        end))
    end,
}