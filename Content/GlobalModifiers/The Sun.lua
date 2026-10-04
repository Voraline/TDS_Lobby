-- Script path: ReplicatedStorage.Content.GlobalModifiers.The Sun
-- Decompile time: 2.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
return {
    displayName = "The Sun",
    description = "Enemies gain stun, freeze, fire immunities. Towers gain access to all detections at the start of the wave.",
    icon = 73052418180108,
    rewardMultiplier = 0,
    onEnableServer = function(a1, a2, a3) -- Line: 16
        -- upvalues: ServerStorage (val), Maid (val), TimescaleUtilities (val), LegacyMiddleware (val), Enum (val)
        local TowerService = require(ServerStorage.Server.Services.Game.TowerService)
        local u12 = Maid.new()
        a2:Mark(u12)
        local u17 = {"HiddenDetection", "LeadDetection", "FlyingDetection"}
        local u21 = {}

        local function timeOut(a1, a2) -- Line: 34 -- upvalues: u21 (val), TimescaleUtilities (upval)
            local v1 = u21[a1]
            v1[a2] = (TimescaleUtilities.Delay(300, function() -- Line: 35 -- upvalues: u21 (upval), a1 (val), a2 (val)
                if u21[a1] then
                    local v1 = u21[a1]
                    v1[a2] = nil
                    a1.StatusEffects:removeBySource(a2, "TheSun")
                    a1:RefreshStats()
                end
            end))
        end

        local function grantAllBuffs(a1) -- Line: 44 -- upvalues: u21 (val), u17 (val), TimescaleUtilities (upval)
            local v1
            if not u21[a1] then
                u21[a1] = {}
            end
            for i, j in u17 do
                if u21[a1][j] then
                    task.cancel(u21[a1][j])
                    a1.StatusEffects:apply(j, "TheSun", 300)
                    v1 = u21[a1]
                    v1[j] = (TimescaleUtilities.Delay(300, function() -- Line: 35 -- upvalues: u21 (upval), a1 (val), j (val)
                        if u21[a1] then
                            local v1 = u21[a1]
                            v1[j] = nil
                            a1.StatusEffects:removeBySource(j, "TheSun")
                            a1:RefreshStats()
                        end
                    end))
                elseif not a1.StatusEffects:hasBySource(j, "TheSun") and not u21[a1][j] then
                    a1.StatusEffects:apply(j, "TheSun", 300)
                    v1 = u21[a1]
                    v1[j] = (TimescaleUtilities.Delay(300, function() -- Line: 35 -- upvalues: u21 (upval), a1 (val), j (val)
                        if u21[a1] then
                            local v1 = u21[a1]
                            v1[j] = nil
                            a1.StatusEffects:removeBySource(j, "TheSun")
                            a1:RefreshStats()
                        end
                    end))
                end
            end
        end

        local function run(a1) -- Line: 68 -- upvalues: TowerService (val), grantAllBuffs (val)
            for i, j in TowerService.GetAllTowers() do
                grantAllBuffs(j)
            end
        end

        local function cleanUpTowers() -- Line: 74 -- upvalues: u21 (val), u12 (val)
            local v1 = nil
            local v2 = nil
            for i, j in u21, v1, v2 do
                for k, n in j do
                    task.cancel(n)
                    i.StatusEffects:removeBySource(k, "TheSun")
                end
                i:RefreshStats()
                u21[i] = nil
            end
            u12:Sweep()
        end

        a2:Mark(function() -- Line: 88 -- upvalues: cleanUpTowers (val)
            cleanUpTowers()
        end)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.OnNextWave, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 96 -- upvalues: TowerService (val), grantAllBuffs (val)
            for i, j in TowerService.GetAllTowers() do
                grantAllBuffs(j)
            end
        end))
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 106 -- upvalues: Enum (upval)
            a2.StatusEffects:apply(Enum.StatusEffect.FreezeImmune, "innate")
            a2.StatusEffects:apply(Enum.StatusEffect.FireImmune, "innate")
            a2.StatusEffects:apply(Enum.StatusEffect.StunImmune, "innate")
            return a2
        end))
    end,
}