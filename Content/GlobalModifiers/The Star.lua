-- Script path: ReplicatedStorage.Content.GlobalModifiers.The Star
-- Decompile time: 0.98 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "The Star",
    description = "Towers have 5% less range and slower attack cooldown. Players have their total tower limit increased by 10",
    icon = 73064828913494,
    rewardMultiplier = 0,
    onEnableServer = function(a1, a2, a3) -- Line: 14 -- upvalues: ServerStorage (val), Maid (val)
        local TowerService = require(ServerStorage.Server.Services.Game.TowerService)
        local u12 = Maid.new()
        a2:Mark(u12)

        local function runTowers(a1) -- Line: 21 -- upvalues: u12 (val), TowerService (val)
            local function addDebuff(a1) -- Line: 22
                a1:Buff({Type = "Range", Name = "TheStarModifier", Stackable = false, Value = -5})
                a1:Buff({
                    Type = "Cooldown",
                    Name = "TheStarModifier",
                    Stackable = false,
                    Value = -5,
                    Duration = (1 / 0),
                })
            end

            u12:Mark((TowerService.TowerSpawnedEvent:Connect(function(a1) -- Line: 38 -- upvalues: addDebuff (val)
                addDebuff(a1)
            end)))
            for i, j in TowerService.GetAllTowers() do
                addDebuff(j)
            end
        end

        local function cleanUpTowers() -- Line: 47 -- upvalues: TowerService (val), u12 (val)
            for i, j in TowerService.GetAllTowers() do
                j:CancelBuff({Type = "Range", Name = "TheStarModifier"})
                j:CancelBuff({Type = "Cooldown", Name = "TheStarModifier"})
            end
            u12:Sweep()
        end

        a2:Mark(function() -- Line: 62 -- upvalues: cleanUpTowers (val)
            cleanUpTowers()
        end)
        runTowers()
    end,
}