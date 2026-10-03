-- Script path: ReplicatedStorage.Content.GlobalModifiers.Temperance
-- Decompile time: 1.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
return {
    displayName = "Temperance",
    description = "Towers gain stun immunity, enemies gain mutation modifier.",
    icon = 122644825025444,
    rewardMultiplier = 0,
    onEnableServer = function(a1, a2, a3) -- Line: 14 -- upvalues: ServerStorage (val), Maid (val), Enum (val)
        local GlobalModifierService = require(ServerStorage.Server.Services.Game.GlobalModifierService)
        local TowerService = require(ServerStorage.Server.Services.Game.TowerService)
        local u19 = Maid.new()
        a2:Mark(u19)

        local function runTowers() -- Line: 24 -- upvalues: u19 (val), TowerService (val), Enum (upval)
            u19:Mark((TowerService.TowerSpawnedEvent:Connect(function(a1) -- Line: 25 -- upvalues: Enum (upval)
                a1.StatusEffects:apply(Enum.StatusEffect.StunImmune, "Temperance")
            end)))
            for i, j in TowerService.GetAllTowers() do
                j.StatusEffects:apply(Enum.StatusEffect.StunImmune, "Temperance")
            end
        end

        local function cleanUpTowers() -- Line: 34 -- upvalues: TowerService (val), Enum (upval), u19 (val)
            for i, j in TowerService.GetAllTowers() do
                j.StatusEffects:removeBySource(Enum.StatusEffect.StunImmune, "Temperance")
                j:RefreshStats()
            end
            u19:Sweep()
        end

        a2:Mark(function() -- Line: 43 -- upvalues: cleanUpTowers (val), GlobalModifierService (val)
            cleanUpTowers()
            GlobalModifierService.setModifierEnabled("Mutation", false)
        end)
        runTowers()
        GlobalModifierService.toggleModifier("Mutation", 0.025, 0.025)
    end,
}