-- Script path: ReplicatedStorage.Content.Consumables.UAV.Controller
-- Decompile time: 1.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerService = require(ServerStorage.Server.Services.Game.TowerService)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)

local function applyBuff(a1, a2) -- Line: 16 -- upvalues: Enum (val) -- types: a2: number
    local u8 = a1.StatusEffects:has(Enum.StatusEffect.HiddenDetection)
    local u15 = a1.StatusEffects:has(Enum.StatusEffect.FlyingDetection)
    if not u8 then
        a1.StatusEffects:apply(Enum.StatusEffect.HiddenDetection, "UAV", a2)
    end
    if not u15 then
        a1.StatusEffects:apply(Enum.StatusEffect.FlyingDetection, "UAV", a2)
    end
    local u37 = {}
    if not u8 then
        table.insert(u37, {
            Type = "Hidden",
            Name = "UAV Hidden Buff",
            Stackable = false,
            Value = 100,
            Duration = a2,
        })
    end
    if not u15 then
        table.insert(u37, {
            Type = "Range",
            Name = "UAV Range Buff",
            Stackable = false,
            Value = 30,
            Duration = a2,
        })
    end
    for i, j in u37 do
        a1:Buff(j)
    end
    return function() -- Line: 54 -- upvalues: u8 (val), a1 (val), Enum (upval), u15 (val), u37 (val)
        if not u8 then
            a1.StatusEffects:removeBySource(Enum.StatusEffect.HiddenDetection, "UAV")
        end
        if not u15 then
            a1.StatusEffects:removeBySource(Enum.StatusEffect.FlyingDetection, "UAV")
        end
        for i, j in u37 do
            a1:CancelBuff(j)
        end
    end
end

return {
    CreateContext = function(a1) -- Line: 70
        a1.duration = 30
    end,
    OnUse = function(a1) -- Line: 74 -- upvalues: TypedPromise (val), RunService (val), TowerService (val), applyBuff (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 75 -- upvalues: a1 (val), RunService (upval), TowerService (upval), applyBuff (upval)
            local Context = a1.Context
            local u5 = nil
            local u6 = {}
            local u7 = 30

            local function cancelBuff() -- Line: 83 -- upvalues: u5 (ref), u6 (ref)
                if u5.Connected then
                    u5:Disconnect()
                end
                local v1 = u6
                u6 = {}
                for i, j in v1 do
                    j()
                end
            end

            local v1 = RunService.Stepped:Connect(function(a1, a2) -- Line: 96
                -- upvalues: u7 (ref), TowerService (upval), u6 (ref), applyBuff (upval), cancelBuff (val), a1_2 (val)
                u7 = u7 - a2
                for i, j in TowerService.GetAllTowers() do
                    if not u6[j] then
                        u6[j] = (applyBuff(j, u7))
                    end
                end
                if u7 <= 0 then
                    cancelBuff()
                    a1_2()
                end
            end)
            a3(cancelBuff)
        end)
    end,
}