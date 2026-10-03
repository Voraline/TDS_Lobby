-- Script path: ReplicatedStorage.Content.GlobalModifiers.Justice
-- Decompile time: 1.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
return {
    displayName = "Justice",
    description = "Towers gain a 10% damage boost when the player has 25% of their total health left",
    icon = 135767587224524,
    rewardMultiplier = 0,
    onEnableServer = function(a1, a2, a3) -- Line: 15 -- upvalues: ServerStorage (val), Maid (val), GameState (val), Enum (val)
        local TowerService = require(ServerStorage.Server.Services.Game.TowerService)
        local u12 = Maid.new()
        a2:Mark(u12)

        local function runTowers() -- Line: 22 -- upvalues: u12 (val), TowerService (val)
            u12:Mark((TowerService.TowerSpawnedEvent:Connect(function(a1) -- Line: 23
                a1:Buff({
                    Type = "Damage",
                    Name = "JusticeModifier",
                    Stackable = false,
                    Value = 10,
                    Duration = (1 / 0),
                })
            end)))
            for i, j in TowerService.GetAllTowers() do
                j:Buff({
                    Type = "Damage",
                    Name = "JusticeModifier",
                    Stackable = false,
                    Value = 10,
                    Duration = (1 / 0),
                })
            end
        end

        local function cleanUpTowers() -- Line: 44 -- upvalues: TowerService (val), u12 (val)
            for i, j in TowerService.GetAllTowers() do
                j:CancelBuff({Type = "Damage", Name = "JusticeModifier"})
            end
            u12:Sweep()
        end

        a2:Mark(((GameState.Replicator:GetStateChangedSignal("HealthPerTeam")):Connect(function(a1) -- Line: 56 -- upvalues: Enum (upval), runTowers (val), cleanUpTowers (val)
            local v1 = a1[Enum.Team.Player]
            local Current = v1 and v1.Current or 0
            local v2 = math.max(4, v1 and v1.Max or 0)
            if v2 > 0 and Current / v2 <= 0.25 then
                runTowers()
                return
            end
            cleanUpTowers()
        end)))
    end,
}