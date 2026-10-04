-- Script path: ReplicatedStorage.Content.GlobalModifiers.The Moon
-- Decompile time: 1.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "The Moon",
    description = "Enemies all gain hidden modifier, towers gain a 10% boost to range",
    icon = 96803756919916,
    rewardMultiplier = 0,
    onEnableServer = function(a1, a2, a3) -- Line: 15 -- upvalues: ServerStorage (val), Maid (val), LegacyMiddleware (val), Enum (val)
        local TowerService = require(ServerStorage.Server.Services.Game.TowerService)
        local u12 = Maid.new()
        a2:Mark(u12)

        local function runTowers() -- Line: 22 -- upvalues: u12 (val), TowerService (val)
            u12:Mark((TowerService.TowerSpawnedEvent:Connect(function(a1) -- Line: 23
                a1:Buff({
                    Type = "Range",
                    Name = "TheMoonModifier",
                    Stackable = false,
                    Value = 10,
                    Duration = (1 / 0),
                })
            end)))
            for i, j in TowerService.GetAllTowers() do
                j:Buff({
                    Type = "Range",
                    Name = "TheMoonModifier",
                    Stackable = false,
                    Value = 10,
                    Duration = (1 / 0),
                })
            end
        end

        local function cleanUpTowers() -- Line: 44 -- upvalues: TowerService (val), u12 (val)
            for i, j in TowerService.GetAllTowers() do
                j:CancelBuff({Type = "Range", Name = "TheMoonModifier"})
            end
            u12:Sweep()
        end

        a2:Mark(function() -- Line: 55 -- upvalues: cleanUpTowers (val)
            cleanUpTowers()
        end)
        runTowers()
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 65 -- upvalues: Enum (upval)
            a2.StatusEffects:apply(Enum.StatusEffect.Hidden, "innate")
            return a2
        end))
    end,
}