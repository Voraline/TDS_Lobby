-- Script path: ReplicatedStorage.Shared.Modules.TowerDPS
-- Decompile time: 58.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ExecutionerTiming = require(ReplicatedStorage.Shared.Modules.ExecutionerTiming)
local u10 = {}
local u11 = nil
local u12 = nil
local u13 = nil
local u14 = {}
local u15 = {}
local u16 = {}
local u17 = {"Abilities", "AbilityUpgrades"}
local u20 = {"Ammo", "MaxAmmo"}
local u23 = {"Burst", "BurstSize", "Ammo", "MaxAmmo"}
local u28 = {"BurstCool", "BurstCooldown"}
local u31 = {"BurnDamage", "FireDamage"}
local u34 = {"Burn", "BurnStats", "FireStats", "BurnDebuff", "HeatWave"}
local u40 = {"BurnDamage", "Damage", "FireDamage"}
local u44 = {"BurnTick", "BurnTickRate", "Tick", "TickRate"}
local u49 = {"BurnTick", "BurnTickRate", "TickRate"}
local u53 = {"PoisonDamage", "PoisonDmg"}
local u56 = {"Poison", "PoisonStats"}
local u59 = {"PoisonDamage", "PoisonDmg", "Damage"}
local u63 = {"PoisonTick", "Tick", "TickRate"}
local u67 = {"PoisonTick", "PoisonTickRate"}
local u70 = {"BeeDamage", "StingDamage"}
local u73 = {"BeeTickRate", "BeeTick", "TickRate"}
local u77 = {"DebuffDamage", "FrostDamage", "ThornsDamage"}
local u81 = {"DebuffTick", "FrostTick", "ThornsTick", "TickRate"}
local u86 = {"Damage", "ExplosionDamage"}
local u89 = {"BurnTick", "BurnTickRate"}
local u92 = {"SpinTime", "SpinDuration"}
local u95 = {"HitCount", "MaxCombo"}
local u98 = {"FinalHitDamage", "FinalHitDmg"}
local u101 = {"FinalHitCooldown", "FinalHitCD"}
local u104 = {"CriticalDamage", "CritDamage"}
local u107 = {"Tick", "TickRate", "Cooldown"}
local u111 = {"WhirlwindHit", "MaxSwings"}
local u114 = {"WhirlwindDamage"}
local u116 = {"BulletCount", "ShotSize"}
local u119 = {"MissileCount", "BoomerangCount", "Count"}
local u123 = {"ClusterDamage"}
local u125 = {"ClusterCount"}
local u127 = {"BombDamage", "ExplosionDamage", "SplashDamage"}
local u131 = {"BombCooldown", "BombTime"}
local u134 = {"SplashDamage", "ExplosionDamage", "ExplosiveDamage", "MissileDamage"}
local u139 = {"MissileDamage", "ExplosionDamage", "ExplosiveDamage", "SplashDamage"}
local u144 = {"MissileCooldown", "MissileReload", "MissileTime", "AbilityCooldown"}
local u149 = {"MissileCooldown", "AbilityCooldown"}
local u152 = {"Damage"}
local u154 = {"MaxAmmo", "Ammo"}
local u157 = {"Cooldown", "Interval"}
local u160 = {"TimeBetweenMissiles", "BurstTime"}
local u163 = {"Cooldown", "Debounce"}
local u166 = {"FireStats"}
local u168 = {"PoisonStats"}
local u170 = {"FrozenDamageMultiplier", "FreezeDamageMultiplier"}

local function attributes(a1) -- Line: 61 -- upvalues: u16 (val) -- types: a1: table?
    if a1 and typeof(a1.Attributes) == "table" then
        return a1.Attributes
    end
    return u16
end

local function statNumber(a1, a2, a3) -- Line: 69 -- upvalues: u16 (val) -- types: a1: table?, a2: string, a3: number?
    if not a1 then
        return a3 or 0
    end
    local v1 = a1[a2]
    if typeof(v1) == "number" then
        return v1
    end
    v1 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes)[a2]
    if typeof(v1) == "number" then
        return v1
    end
    return a3 or 0
end

local function firstNumber(a1, a2, a3) -- Line: 88 -- upvalues: u16 (val) -- types: a1: table?, a2: table, a3: number?
    local v1
    local Attributes_2 = if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes
    local v2 = nil
    local v3 = nil
    for i, j in a2, v2, v3 do
        v1 = if not a1 then nil else a1[j]
        if typeof(v1) ~= "number" then
            v1 = Attributes_2[j]
        end
        if typeof(v1) == "number" and v1 ~= 0 then
            return v1
        end
    end
    return a3 or 0
end

local function nestedTable(a1, a2) -- Line: 105 -- upvalues: u16 (val) -- types: a1: table?, a2: string
    if not a1 then
        return nil
    end
    local v1 = a1[a2]
    if typeof(v1) == "table" then
        return v1
    end
    v1 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes)[a2]
    if typeof(v1) == "table" then
        return v1
    end
    return nil
end

local function nestedNumber(a1, a2, a3, a4) -- Line: 123
    -- upvalues: u16 (val)
    local v1, v2
    local Attributes_2 = if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes
    local v3 = nil
    local v4 = nil
    for i, j in a2, v3, v4 do
        v1 = if not a1 then nil else a1[j]
        if typeof(v1) ~= "table" then
            v1 = Attributes_2[j]
        end
        if typeof(v1) == "table" then
            for k, n in a3 do
                v2 = v1[n]
                if typeof(v2) == "number" then
                    return v2
                end
            end
        end
    end
    return a4 or 0
end

local function abilityNumber(a1, a2, a3, a4) -- Line: 152
    -- upvalues: u17 (val)
    local Stats, v1, v2, v3, v4, v5
    if not a1 then
        return a4 or 0
    end
    local v6 = nil
    local v7 = nil
    local v8, v9, v10, v11 = a4, a1, a2, a3
    for i, j in u17, v6, v7 do
        v5 = v9[j]
        if typeof(v5) == "table" then
            v1 = nil
            v2 = nil
            for k, n in v5, v1, v2 do
                if typeof(n) == "table" and n.Name == v10 then
                    for m, i5 in v11 do
                        v3 = n[i5]
                        if typeof(v3) == "number" then
                            return v3
                        end
                    end
                    Stats = n.Stats
                    if typeof(Stats) == "table" then
                        for i6, i7 in v11 do
                            v4 = Stats[i7]
                            if typeof(v4) == "number" then
                                return v4
                            end
                        end
                    end
                end
            end
        end
    end
    return v8 or 0
end

local function safeDivide(a1, a2) -- Line: 193 -- types: a1: number, a2: number
    if a2 <= 0 then
        return 0
    end
    return a1 / a2
end

local function positive(a1, a2) -- Line: 201 -- types: a1: number, a2: number
    if a1 > 0 then
        return a1
    end
    return a2
end

local function ammo(a1) -- Line: 209 -- upvalues: firstNumber (val), u20 (val) -- types: a1: table?
    return (firstNumber(a1, u20, 0))
end

local function reloadTime(a1, a2) -- Line: 213 -- upvalues: u16 (val) -- types: a1: table?, a2: number
    local v1, v2
    if a1 then
        local ReloadTime = a1.ReloadTime
        if typeof(ReloadTime) ~= "number" then
            local ReloadTime_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).ReloadTime
            v1 = if typeof(ReloadTime_2) ~= "number" then 0 else ReloadTime_2
        else
            v1 = ReloadTime
        end
    else
        v1 = 0
    end
    if v1 > 0 then
        return v1
    end
    if a1 then
        local ReloadSpeed = a1.ReloadSpeed
        if typeof(ReloadSpeed) ~= "number" then
            local ReloadSpeed_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).ReloadSpeed
            v2 = if typeof(ReloadSpeed_2) ~= "number" then 0 else ReloadSpeed_2
        else
            v2 = ReloadSpeed
        end
    else
        v2 = 0
    end
    if v2 > 0 then
        return a2 * v2
    end
    return 0
end

local function burstCount(a1) -- Line: 227 -- upvalues: firstNumber (val), u23 (val) -- types: a1: table?
    return (firstNumber(a1, u23, 1))
end

local function postBurstCooldown(a1, a2) -- Line: 231
    -- upvalues: firstNumber (val), u28 (val), u16 (val)
    local v1, v2
    local v3 = firstNumber(a1, u28, 0)
    if v3 > 0 then
        return v3
    end
    if a1 then
        local ReloadTime = a1.ReloadTime
        if typeof(ReloadTime) ~= "number" then
            local ReloadTime_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).ReloadTime
            v1 = if typeof(ReloadTime_2) ~= "number" then 0 else ReloadTime_2
        else
            v1 = ReloadTime
        end
    else
        v1 = 0
    end
    if v1 > 0 then
        return v1
    end
    if a1 then
        local ReloadSpeed = a1.ReloadSpeed
        if typeof(ReloadSpeed) ~= "number" then
            local ReloadSpeed_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).ReloadSpeed
            v2 = if typeof(ReloadSpeed_2) ~= "number" then 0 else ReloadSpeed_2
        else
            v2 = ReloadSpeed
        end
    else
        v2 = 0
    end
    if v2 > 0 then
        return a2 * v2
    end
    return 0
end

local function burnDps(a1) -- Line: 240
    -- upvalues: firstNumber (val), u31 (val), nestedNumber (val), u34 (val), u40 (val), u49 (val), u44 (val)
    local v1 = firstNumber(a1, u31, 0)
    local v2 = nestedNumber(a1, u34, u40, 0)
    local v3 = if not (v1 > 0) then v2 else v1
    v2 = firstNumber(a1, u49, 0)
    local v4 = nestedNumber(a1, u34, u44, 1)
    if (if not (v2 > 0) then v4 else v2) <= 0 then
        return 0
    end
    return v3 / v1
end

local function poisonDps(a1) -- Line: 250
    -- upvalues: firstNumber (val), u53 (val), nestedNumber (val), u56 (val), u59 (val), u67 (val), u63 (val)
    local v1 = firstNumber(a1, u53, 0)
    local v2 = nestedNumber(a1, u56, u59, 0)
    local v3 = if not (v1 > 0) then v2 else v1
    v2 = firstNumber(a1, u67, 0)
    local v4 = nestedNumber(a1, u56, u63, 1)
    if (if not (v2 > 0) then v4 else v2) <= 0 then
        return 0
    end
    return v3 / v1
end

local function beeDps(a1) -- Line: 260 -- upvalues: firstNumber (val), u70 (val), u73 (val) -- types: a1: table?
    local v1 = firstNumber(a1, u70, 0)
    local v2 = firstNumber(a1, u73, 1)
    if v2 <= 0 then
        return 0
    end
    return v1 / v2
end

local function debuffDps(a1) -- Line: 264 -- upvalues: firstNumber (val), u77 (val), u81 (val) -- types: a1: table?
    local v1 = firstNumber(a1, u77, 0)
    local v2 = firstNumber(a1, u81, 1)
    if v2 <= 0 then
        return 0
    end
    return v1 / v2
end

local function dotDps(a1) -- Line: 271
    -- upvalues: burnDps (val), poisonDps (val), firstNumber (val), u70 (val), u73 (val), u77 (val), u81 (val)
    local v1 = (burnDps(a1)) + poisonDps(a1)
    local v2 = firstNumber(a1, u70, 0)
    local v3 = firstNumber(a1, u73, 1)
    local v4 = v1 + (if not (v3 <= 0) then v2 / v3 else 0)
    local v5 = firstNumber(a1, u77, 0)
    v2 = firstNumber(a1, u81, 1)
    return v4 + (if not (v2 <= 0) then v5 / v2 else 0)
end

local function namedTrapStats(a1, a2) -- Line: 275 -- upvalues: u16 (val) -- types: a1: table?, a2: string
    local v1
    if a1 then
        local Traps = a1.Traps
        if typeof(Traps) ~= "table" then
            local Traps_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Traps
            v1 = if typeof(Traps_2) ~= "table" then nil else Traps_2
        else
            v1 = Traps
        end
    else
        v1 = nil
    end
    if not v1 then
        return nil
    end
    local v2 = v1[a2]
    if typeof(v2) ~= "table" then
        return nil
    end
    return v2
end

local function trapDps(a1, a2) -- Line: 289
    -- upvalues: u16 (val), firstNumber (val), u86 (val)
    local v1, v2, v3, v4
    if a1 then
        local Traps = a1.Traps
        if typeof(Traps) ~= "table" then
            local Traps_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Traps
            v2 = if typeof(Traps_2) ~= "table" then nil else Traps_2
        else
            v2 = Traps
        end
    else
        v2 = nil
    end
    if v2 then
        v3 = v2[a2]
        v1 = if typeof(v3) == "table" then v3 else nil
    else
        v1 = nil
    end
    if not v1 then
        return 0
    end
    v3 = firstNumber(v1, u86, 0)
    if v1 then
        local Cooldown = v1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not v1 then u16 else if typeof(v1.Attributes) ~= "table" then u16 else v1.Attributes).Cooldown
            v4 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v4 = Cooldown
        end
    else
        v4 = 0
    end
    if v4 <= 0 then
        return 0
    end
    return v3 / v4
end

local function trapBurnDps(a1, a2) -- Line: 298
    -- upvalues: u16 (val), firstNumber (val), u31 (val), u89 (val)
    local v1, v2, v3
    if a1 then
        local Traps = a1.Traps
        if typeof(Traps) ~= "table" then
            local Traps_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Traps
            v2 = if typeof(Traps_2) ~= "table" then nil else Traps_2
        else
            v2 = Traps
        end
    else
        v2 = nil
    end
    if v2 then
        v3 = v2[a2]
        v1 = if typeof(v3) == "table" then v3 else nil
    else
        v1 = nil
    end
    if not v1 then
        return 0
    end
    v3 = firstNumber(v1, u31, 0)
    local v4 = firstNumber(v1, u89, 1)
    if v4 <= 0 then
        return 0
    end
    return v3 / v4
end

local function selectedOption(a1, a2, a3) -- Line: 310 -- types: a1: table?, a2: string
    if typeof(a1) == "table" and typeof(a1.Options) == "table" then
        local v1 = a1.Options[a2]
        if v1 ~= nil then
            return v1
        end
    end
    return a3
end

local function contextSourceStats(a1) -- Line: 321 -- types: a1: table?
    if typeof(a1) == "table" and typeof(a1.SourceStats) == "table" then
        return a1.SourceStats
    end
    return nil
end

local function activeUnitName(a1) -- Line: 329 -- upvalues: u16 (val) -- types: a1: table?
    local UnitToSend = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).UnitToSend
    if typeof(UnitToSend) == "string" and UnitToSend ~= "" then
        return UnitToSend
    end
    return nil
end

local function unitData() -- Line: 338 -- upvalues: u13 (ref), u11 (ref), ReplicatedStorage (val)
    if not u13 then
        u11 = u11 or require(ReplicatedStorage.Shared.Modules.Content)
        u13 = u11("Unit")
    end
    return u13
end

local function gameMode() -- Line: 347 -- upvalues: u12 (ref), ReplicatedStorage (val)
    if not u12 then
        u12 = require(ReplicatedStorage.Shared.Modules.GameState)
    end
    if typeof(u12.GameMode) == "string" then
        return u12.GameMode
    end
    return ""
end

local function unitStats(a1) -- Line: 359
    -- upvalues: u12 (ref), ReplicatedStorage (val), u14 (val), u15 (val), u13 (ref), u11 (ref)
    local GameMode_2
    if not a1 then
        return nil
    end
    if not u12 then
        u12 = require(ReplicatedStorage.Shared.Modules.GameState)
    end
    local v1 = ("%*:%*"):format(a1, if typeof(u12.GameMode) ~= "string" then "" else u12.GameMode)
    local v2 = u14[v1]
    if v2 ~= nil then
        if v2 == u15 then
            return nil
        end
        return v2
    end
    if not u13 then
        u11 = u11 or require(ReplicatedStorage.Shared.Modules.Content)
        u13 = u11("Unit")
    end
    local v3 = u13:FindFirstChild(a1)
    local Stats = v3 and v3:FindFirstChild("Stats")
    if GameMode_2 == "PVP" then
        local v4 = v3 and v3:FindFirstChild("Stats-PVP")
        if v4 then
            Stats = v4
        end
    end
    if not Stats then
        u14[v1] = u15
        return nil
    end
    local success, result = pcall(require, Stats)
    if success and typeof(result) == "table" and typeof(result.Default) == "table" then
        local Defaults = result.Default.Defaults
        if typeof(Defaults) ~= "table" then
            Defaults = result.Default
        end
        u14[v1] = Defaults
        return Defaults
    end
    u14[v1] = u15
    return nil
end

local function activeUnitStats(a1) -- Line: 405 -- upvalues: unitStats (val), u16 (val) -- types: a1: table?
    local UnitToSend = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).UnitToSend
    return (unitStats(if typeof(UnitToSend) ~= "string" then nil else if UnitToSend == "" then nil else UnitToSend))
end

function u10.Default(a1) -- Line: 409 -- upvalues: u16 (val) -- types: a1: table?
    local v1, v2
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v1 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v1 = Damage
        end
    else
        v1 = 0
    end
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v2 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v2 = Cooldown
        end
    else
        v2 = 0
    end
    if v2 <= 0 then
        return 0
    end
    return v1 / v2
end

function u10.ExecutionerThrowDamage(a1) -- Line: 413 -- upvalues: u16 (val) -- types: a1: table?
    local v1, v2
    if a1 then
        local MaxBounces = a1.MaxBounces
        if typeof(MaxBounces) ~= "number" then
            local MaxBounces_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).MaxBounces
            v1 = if typeof(MaxBounces_2) ~= "number" then 0 else MaxBounces_2
        else
            v1 = MaxBounces
        end
    else
        v1 = 0
    end
    local v3 = math.max(v1, 0)
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v1 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v1 = Damage
        end
    else
        v1 = 0
    end
    if a1 then
        local BounceDamage = a1.BounceDamage
        if typeof(BounceDamage) ~= "number" then
            local BounceDamage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).BounceDamage
            v2 = if typeof(BounceDamage_2) ~= "number" then 0 else BounceDamage_2
        else
            v2 = BounceDamage
        end
    else
        v2 = 0
    end
    return v3 * v1 + v2 * v3 * (v3 - 1) / 2
end

function u10.Executioner(a1) -- Line: 422
    -- upvalues: u16 (val), ExecutionerTiming (val), u10 (val)
    local v1, v2
    if a1 then
        local MaxBounces = a1.MaxBounces
        if typeof(MaxBounces) ~= "number" then
            local MaxBounces_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).MaxBounces
            v1 = if typeof(MaxBounces_2) ~= "number" then 0 else MaxBounces_2
        else
            v1 = MaxBounces
        end
    else
        v1 = 0
    end
    local v3 = ExecutionerTiming.Windup + (math.max(v1, 0)) * ExecutionerTiming.MaxFlightTime + ExecutionerTiming.MaxReturnTime + ExecutionerTiming.Catch
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v2 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v2 = Cooldown
        end
    else
        v2 = 0
    end
    v1 = v3 + math.max(v2, 0)
    local v4 = u10.ExecutionerThrowDamage(a1)
    if v1 <= 0 then
        return 0
    end
    return v4 / v1
end

function u10.Splash(a1) -- Line: 435 -- upvalues: firstNumber (val), u134 (val), u16 (val) -- types: a1: table?
    local v1
    local v2 = firstNumber(a1, u134, 0)
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v1 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v1 = Cooldown
        end
    else
        v1 = 0
    end
    if v1 <= 0 then
        return 0
    end
    return v2 / v1
end

function u10.Ammo(a1) -- Line: 441 -- upvalues: u16 (val), firstNumber (val), u20 (val), u10 (val) -- types: a1: table?
    local v1, v2, v3, v4, v5
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v1 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v1 = Damage
        end
    else
        v1 = 0
    end
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v2 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v2 = Cooldown
        end
    else
        v2 = 0
    end
    local v6 = firstNumber(a1, u20, 0)
    if a1 then
        local ReloadTime = a1.ReloadTime
        if typeof(ReloadTime) ~= "number" then
            local ReloadTime_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).ReloadTime
            v4 = if typeof(ReloadTime_2) ~= "number" then 0 else ReloadTime_2
        else
            v4 = ReloadTime
        end
    else
        v4 = 0
    end
    if not (v4 > 0) then
        if a1 then
            local ReloadSpeed = a1.ReloadSpeed
            if typeof(ReloadSpeed) ~= "number" then
                local ReloadSpeed_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).ReloadSpeed
                v5 = if typeof(ReloadSpeed_2) ~= "number" then 0 else ReloadSpeed_2
            else
                v5 = ReloadSpeed
            end
        else
            v5 = 0
        end
        v3 = if not (v5 > 0) then 0 else v2 * v5
    else
        v3 = v4
    end
    if a1 then
        local RevTime = a1.RevTime
        if typeof(RevTime) ~= "number" then
            local RevTime_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).RevTime
            v4 = if typeof(RevTime_2) ~= "number" then 0 else RevTime_2
        else
            v4 = RevTime
        end
    else
        v4 = 0
    end
    local v7 = v3 + v4
    if not (v6 <= 0) and not (v7 <= 0) then
        v4 = v1 * v6
        v5 = v2 * v6 + v7
        if v5 <= 0 then
            return 0
        end
        return v4 / v5
    end
    return u10.Default(a1)
end

function u10.SpinAmmo(a1) -- Line: 454
    -- upvalues: u16 (val), firstNumber (val), u20 (val), u92 (val), u10 (val)
    local v1, v2
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v1 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v1 = Damage
        end
    else
        v1 = 0
    end
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v2 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v2 = Cooldown
        end
    else
        v2 = 0
    end
    local v3 = firstNumber(a1, u20, 0)
    local v4 = firstNumber(a1, u92, 0)
    if not (v3 <= 0) and not (v4 <= 0) then
        local v5 = v1 * v3
        local v6 = v4 + v2 * math.max(v3 - 1, 0)
        if v6 <= 0 then
            return 0
        end
        return v5 / v6
    end
    return u10.Ammo(a1)
end

function u10.Burst(a1) -- Line: 467
    -- upvalues: u16 (val), firstNumber (val), u23 (val), u10 (val), u28 (val)
    local v1, v2, v3
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v1 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v1 = Damage
        end
    else
        v1 = 0
    end
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v2 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v2 = Cooldown
        end
    else
        v2 = 0
    end
    local v4 = firstNumber(a1, u23, 1)
    if v4 <= 1 then
        return u10.Default(a1)
    end
    local v5 = v1 * v4
    local v6 = v2 * v4
    local v7 = firstNumber(a1, u28, 0)
    if not (v7 > 0) then
        local v8
        if a1 then
            local ReloadTime = a1.ReloadTime
            if typeof(ReloadTime) ~= "number" then
                local ReloadTime_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).ReloadTime
                v8 = if typeof(ReloadTime_2) ~= "number" then 0 else ReloadTime_2
            else
                v8 = ReloadTime
            end
        else
            v8 = 0
        end
        if not (v8 > 0) then
            local v9
            if a1 then
                local ReloadSpeed = a1.ReloadSpeed
                if typeof(ReloadSpeed) ~= "number" then
                    local ReloadSpeed_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).ReloadSpeed
                    v9 = if typeof(ReloadSpeed_2) ~= "number" then 0 else ReloadSpeed_2
                else
                    v9 = ReloadSpeed
                end
            else
                v9 = 0
            end
            v3 = if not (v9 > 0) then 0 else v2 * v9
        else
            v3 = v8
        end
    else
        v3 = v7
    end
    local v10 = v6 + v3
    if v10 <= 0 then
        return 0
    end
    return v5 / v10
end

function u10.ApplyCoordinationBonus(a1, a2) -- Line: 479 -- types: a1: number, a2: number
    return a1 + math.floor(a1 * a2 / 100)
end

function u10.CoordinationBurst(a1) -- Line: 483
    -- upvalues: u10 (val), u16 (val), firstNumber (val), u23 (val), u28 (val)
    local v1, v2, v3
    local ApplyCoordinationBonus = u10.ApplyCoordinationBonus
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v1 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v1 = Damage
        end
    else
        v1 = 0
    end
    if a1 then
        local CoordinationDamageBonus = a1.CoordinationDamageBonus
        if typeof(CoordinationDamageBonus) ~= "number" then
            local CoordinationDamageBonus_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).CoordinationDamageBonus
            v2 = if typeof(CoordinationDamageBonus_2) ~= "number" then 0 else CoordinationDamageBonus_2
        else
            v2 = CoordinationDamageBonus
        end
    else
        v2 = 0
    end
    local v4 = ApplyCoordinationBonus(v1, v2)
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v1 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v1 = Cooldown
        end
    else
        v1 = 0
    end
    v2 = firstNumber(a1, u23, 1)
    if v2 <= 1 then
        if v1 <= 0 then
            return 0
        end
        return v4 / v1
    end
    local v5 = v4 * v2
    local v6 = v1 * v2
    local v7 = firstNumber(a1, u28, 0)
    if not (v7 > 0) then
        local v8
        if a1 then
            local ReloadTime = a1.ReloadTime
            if typeof(ReloadTime) ~= "number" then
                local ReloadTime_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).ReloadTime
                v8 = if typeof(ReloadTime_2) ~= "number" then 0 else ReloadTime_2
            else
                v8 = ReloadTime
            end
        else
            v8 = 0
        end
        if not (v8 > 0) then
            local v9
            if a1 then
                local ReloadSpeed = a1.ReloadSpeed
                if typeof(ReloadSpeed) ~= "number" then
                    local ReloadSpeed_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).ReloadSpeed
                    v9 = if typeof(ReloadSpeed_2) ~= "number" then 0 else ReloadSpeed_2
                else
                    v9 = ReloadSpeed
                end
            else
                v9 = 0
            end
            v3 = if not (v9 > 0) then 0 else v1 * v9
        else
            v3 = v8
        end
    else
        v3 = v7
    end
    local v10 = v6 + v3
    if v10 <= 0 then
        return 0
    end
    return v5 / v10
end

function u10.BurstWindow(a1) -- Line: 498
    -- upvalues: u16 (val), firstNumber (val), u23 (val), u10 (val), u28 (val)
    local v1, v2, v3
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v1 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v1 = Damage
        end
    else
        v1 = 0
    end
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v2 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v2 = Cooldown
        end
    else
        v2 = 0
    end
    local v4 = firstNumber(a1, u23, 1)
    if v4 <= 1 then
        return u10.Default(a1)
    end
    local v5 = v1 * v4
    local v6 = v2 * math.max(v4 - 1, 0)
    local v7 = firstNumber(a1, u28, 0)
    if not (v7 > 0) then
        local v8
        if a1 then
            local ReloadTime = a1.ReloadTime
            if typeof(ReloadTime) ~= "number" then
                local ReloadTime_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).ReloadTime
                v8 = if typeof(ReloadTime_2) ~= "number" then 0 else ReloadTime_2
            else
                v8 = ReloadTime
            end
        else
            v8 = 0
        end
        if not (v8 > 0) then
            local v9
            if a1 then
                local ReloadSpeed = a1.ReloadSpeed
                if typeof(ReloadSpeed) ~= "number" then
                    local ReloadSpeed_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).ReloadSpeed
                    v9 = if typeof(ReloadSpeed_2) ~= "number" then 0 else ReloadSpeed_2
                else
                    v9 = ReloadSpeed
                end
            else
                v9 = 0
            end
            v3 = if not (v9 > 0) then 0 else v2 * v9
        else
            v3 = v8
        end
    else
        v3 = v7
    end
    local v10 = v6 + v3
    if v10 <= 0 then
        return 0
    end
    return v5 / v10
end

function u10.BurstWithReload(a1) -- Line: 513 -- upvalues: u10 (val) -- types: a1: table?
    return u10.Ammo(a1)
end

function u10.InclusiveBurstWithReload(a1) -- Line: 517
    -- upvalues: u16 (val), firstNumber (val), u23 (val), u10 (val)
    local v1, v2, v3, v4, v5
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v1 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v1 = Damage
        end
    else
        v1 = 0
    end
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v2 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v2 = Cooldown
        end
    else
        v2 = 0
    end
    local v6 = firstNumber(a1, u23, 1) + 1
    if a1 then
        local ReloadTime = a1.ReloadTime
        if typeof(ReloadTime) ~= "number" then
            local ReloadTime_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).ReloadTime
            v4 = if typeof(ReloadTime_2) ~= "number" then 0 else ReloadTime_2
        else
            v4 = ReloadTime
        end
    else
        v4 = 0
    end
    if not (v4 > 0) then
        if a1 then
            local ReloadSpeed = a1.ReloadSpeed
            if typeof(ReloadSpeed) ~= "number" then
                local ReloadSpeed_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).ReloadSpeed
                v5 = if typeof(ReloadSpeed_2) ~= "number" then 0 else ReloadSpeed_2
            else
                v5 = ReloadSpeed
            end
        else
            v5 = 0
        end
        v3 = if not (v5 > 0) then 0 else v2 * v5
    else
        v3 = v4
    end
    if not (v6 <= 1) and not (v3 <= 0) then
        v5 = v1 * v6
        local v7 = v2 * v6 + v3
        if v7 <= 0 then
            return 0
        end
        return v5 / v7
    end
    return u10.Burst(a1)
end

function u10.Combo(a1) -- Line: 530
    -- upvalues: u16 (val), firstNumber (val), u95 (val), u98 (val), u101 (val), u10 (val)
    local v1, v2
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v1 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v1 = Damage
        end
    else
        v1 = 0
    end
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v2 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v2 = Cooldown
        end
    else
        v2 = 0
    end
    local v3 = firstNumber(a1, u95, 3)
    local v4 = firstNumber(a1, u98, v1)
    local v5 = firstNumber(a1, u101, v2)
    if v3 <= 1 then
        return u10.Default(a1)
    end
    local v6 = v1 * math.max(v3 - 1, 0) + v4
    local v7 = v5 + v2 * math.max(v3 - 1, 0)
    if v7 <= 0 then
        return 0
    end
    return v6 / v7
end

function u10.CriticalEveryThird(a1) -- Line: 547
    -- upvalues: u16 (val), firstNumber (val), u104 (val)
    local v1, v2
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v1 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v1 = Damage
        end
    else
        v1 = 0
    end
    local v3 = firstNumber(a1, u104, v1)
    local v4 = v1 * 2 + v3
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v2 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v2 = Cooldown
        end
    else
        v2 = 0
    end
    local v5 = v2 * 3
    if v5 <= 0 then
        return 0
    end
    return v4 / v5
end

function u10.CriticalChance(a1) -- Line: 554 -- upvalues: u16 (val), u10 (val) -- types: a1: table?
    local v1, v2, v3
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v1 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v1 = Damage
        end
    else
        v1 = 0
    end
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v2 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v2 = Cooldown
        end
    else
        v2 = 0
    end
    if a1 then
        local CritChance = a1.CritChance
        if typeof(CritChance) ~= "number" then
            local CritChance_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).CritChance
            v3 = if typeof(CritChance_2) ~= "number" then 0 else CritChance_2
        else
            v3 = CritChance
        end
    else
        v3 = 0
    end
    local v4 = v3 / 100
    if a1 then
        local CritMult = a1.CritMult
        if typeof(CritMult) ~= "number" then
            local CritMult_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).CritMult
            v3 = if typeof(CritMult_2) ~= "number" then 1 else CritMult_2
        else
            v3 = CritMult
        end
    else
        v3 = 1
    end
    if not (v4 <= 0) and not (v3 <= 1) then
        local v5 = v1 * (1 - v4) + v1 * v3 * v4
        if v2 <= 0 then
            return 0
        end
        return v5 / v2
    end
    return u10.Default(a1)
end

function u10.Burn(a1) -- Line: 567 -- upvalues: burnDps (val) -- types: a1: table?
    return (burnDps(a1))
end

function u10.Poison(a1) -- Line: 571 -- upvalues: poisonDps (val) -- types: a1: table?
    return (poisonDps(a1))
end

function u10.Bees(a1) -- Line: 575 -- upvalues: firstNumber (val), u70 (val), u73 (val) -- types: a1: table?
    local v1 = firstNumber(a1, u70, 0)
    local v2 = firstNumber(a1, u73, 1)
    if v2 <= 0 then
        return 0
    end
    return v1 / v2
end

function u10.Debuff(a1) -- Line: 579 -- upvalues: firstNumber (val), u77 (val), u81 (val) -- types: a1: table?
    local v1 = firstNumber(a1, u77, 0)
    local v2 = firstNumber(a1, u81, 1)
    if v2 <= 0 then
        return 0
    end
    return v1 / v2
end

function u10.Trap(a1) -- Line: 583 -- upvalues: u16 (val), firstNumber (val), u86 (val) -- types: a1: string
    return function(a1_2) -- Line: 584 -- upvalues: a1 (val), u16 (upval), firstNumber (upval), u86 (upval) -- types: a1_2: table?
        local v1, v2, v3
        if a1_2 then
            local Traps = a1_2.Traps
            if typeof(Traps) ~= "table" then
                local Traps_2 = (if not a1_2 then u16 else if typeof(a1_2.Attributes) ~= "table" then u16 else a1_2.Attributes).Traps
                v2 = if typeof(Traps_2) ~= "table" then nil else Traps_2
            else
                v2 = Traps
            end
        else
            v2 = nil
        end
        if v2 then
            v3 = v2[a1]
            v1 = if typeof(v3) == "table" then v3 else nil
        else
            v1 = nil
        end
        if not v1 then
            return 0
        end
        v2 = firstNumber(v1, u86, 0)
        if v1 then
            local Cooldown = v1.Cooldown
            if typeof(Cooldown) ~= "number" then
                local Cooldown_2 = (if not v1 then u16 else if typeof(v1.Attributes) ~= "table" then u16 else v1.Attributes).Cooldown
                v3 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
            else
                v3 = Cooldown
            end
        else
            v3 = 0
        end
        if v3 <= 0 then
            return 0
        end
        return v2 / v3
    end
end

function u10.TrapBurn(a1) -- Line: 589
    -- upvalues: u16 (val), firstNumber (val), u31 (val), u89 (val)
    return function(a1_2) -- Line: 590
        -- upvalues: a1 (val), u16 (upval), firstNumber (upval), u31 (upval), u89 (upval)
        local v1, v2, v3
        if a1_2 then
            local Traps = a1_2.Traps
            if typeof(Traps) ~= "table" then
                local Traps_2 = (if not a1_2 then u16 else if typeof(a1_2.Attributes) ~= "table" then u16 else a1_2.Attributes).Traps
                v2 = if typeof(Traps_2) ~= "table" then nil else Traps_2
            else
                v2 = Traps
            end
        else
            v2 = nil
        end
        if v2 then
            v3 = v2[a1]
            v1 = if typeof(v3) == "table" then v3 else nil
        else
            v1 = nil
        end
        if not v1 then
            return 0
        end
        v2 = firstNumber(v1, u31, 0)
        v3 = firstNumber(v1, u89, 1)
        if v3 <= 0 then
            return 0
        end
        return v2 / v3
    end
end

function u10.TrapDamageOverTime(a1) -- Line: 595
    -- upvalues: u16 (val), firstNumber (val), u86 (val), u31 (val), u89 (val)
    return function(a1_2) -- Line: 596
        -- upvalues: a1 (val), u16 (upval), firstNumber (upval), u86 (upval), u31 (upval), u89 (upval)
        local v1, v2, v3, v4, v5
        local v6 = a1
        if a1_2 then
            local Traps = a1_2.Traps
            if typeof(Traps) ~= "table" then
                local Traps_2 = (if not a1_2 then u16 else if typeof(a1_2.Attributes) ~= "table" then u16 else a1_2.Attributes).Traps
                v3 = if typeof(Traps_2) ~= "table" then nil else Traps_2
            else
                v3 = Traps
            end
        else
            v3 = nil
        end
        if v3 then
            v4 = v3[v6]
            v2 = if typeof(v4) == "table" then v4 else nil
        else
            v2 = nil
        end
        if v2 then
            v3 = firstNumber(v2, u86, 0)
            if v2 then
                local Cooldown = v2.Cooldown
                if typeof(Cooldown) ~= "number" then
                    local Cooldown_2 = (if not v2 then u16 else if typeof(v2.Attributes) ~= "table" then u16 else v2.Attributes).Cooldown
                    v4 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
                else
                    v4 = Cooldown
                end
            else
                v4 = 0
            end
            v1 = if not (v4 <= 0) then v3 / v4 else 0
        else
            v1 = 0
        end
        if a1_2 then
            local Traps_3 = a1_2.Traps
            if typeof(Traps_3) ~= "table" then
                local Traps_4 = (if not a1_2 then u16 else if typeof(a1_2.Attributes) ~= "table" then u16 else a1_2.Attributes).Traps
                v4 = if typeof(Traps_4) ~= "table" then nil else Traps_4
            else
                v4 = Traps_3
            end
        else
            v4 = nil
        end
        if v4 then
            v5 = v4[a1]
            v3 = if typeof(v5) == "table" then v5 else nil
        else
            v3 = nil
        end
        if v3 then
            v4 = firstNumber(v3, u31, 0)
            v5 = firstNumber(v3, u89, 1)
            v6 = if not (v5 <= 0) then v4 / v5 else 0
        else
            v6 = 0
        end
        return v1 + v6
    end
end

function u10.SelectedTrap(a1, a2) -- Line: 601
    -- upvalues: u16 (val), firstNumber (val), u86 (val)
    local v1, v2, v3, v4
    if typeof(a2) ~= "table" or typeof(a2.Options) ~= "table" then
        v1 = "Spike"
    else
        local Trap = a2.Options.Trap
        v1 = if Trap == nil then "Spike" else Trap
    end
    if a1 then
        local Traps = a1.Traps
        if typeof(Traps) ~= "table" then
            local Traps_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Traps
            v3 = if typeof(Traps_2) ~= "table" then nil else Traps_2
        else
            v3 = Traps
        end
    else
        v3 = nil
    end
    if v3 then
        v4 = v3[v1]
        v2 = if typeof(v4) == "table" then v4 else nil
    else
        v2 = nil
    end
    if not v2 then
        return 0
    end
    v3 = firstNumber(v2, u86, 0)
    if v2 then
        local Cooldown = v2.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not v2 then u16 else if typeof(v2.Attributes) ~= "table" then u16 else v2.Attributes).Cooldown
            v4 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v4 = Cooldown
        end
    else
        v4 = 0
    end
    if v4 <= 0 then
        return 0
    end
    return v3 / v4
end

function u10.DamageOverTime(a1) -- Line: 605
    -- upvalues: u10 (val), burnDps (val), poisonDps (val), firstNumber (val), u70 (val), u73 (val), u77 (val)
    -- upvalues: u81 (val)
    local v1 = u10.Default(a1)
    local v2 = (burnDps(a1)) + poisonDps(a1)
    local v3 = firstNumber(a1, u70, 0)
    local v4 = firstNumber(a1, u73, 1)
    local v5 = v2 + (if not (v4 <= 0) then v3 / v4 else 0)
    local v6 = firstNumber(a1, u77, 0)
    v3 = firstNumber(a1, u81, 1)
    return v1 + (v5 + (if not (v3 <= 0) then v6 / v3 else 0))
end

function u10.AmmoDamageOverTime(a1) -- Line: 609
    -- upvalues: u10 (val), burnDps (val), poisonDps (val), firstNumber (val), u70 (val), u73 (val), u77 (val)
    -- upvalues: u81 (val)
    local v1 = u10.Ammo(a1)
    local v2 = (burnDps(a1)) + poisonDps(a1)
    local v3 = firstNumber(a1, u70, 0)
    local v4 = firstNumber(a1, u73, 1)
    local v5 = v2 + (if not (v4 <= 0) then v3 / v4 else 0)
    local v6 = firstNumber(a1, u77, 0)
    v3 = firstNumber(a1, u81, 1)
    return v1 + (v5 + (if not (v3 <= 0) then v6 / v3 else 0))
end

function u10.BurstDamageOverTime(a1) -- Line: 613
    -- upvalues: u10 (val), burnDps (val), poisonDps (val), firstNumber (val), u70 (val), u73 (val), u77 (val)
    -- upvalues: u81 (val)
    local v1 = u10.Burst(a1)
    local v2 = (burnDps(a1)) + poisonDps(a1)
    local v3 = firstNumber(a1, u70, 0)
    local v4 = firstNumber(a1, u73, 1)
    local v5 = v2 + (if not (v4 <= 0) then v3 / v4 else 0)
    local v6 = firstNumber(a1, u77, 0)
    v3 = firstNumber(a1, u81, 1)
    return v1 + (v5 + (if not (v3 <= 0) then v6 / v3 else 0))
end

function u10.BurstWindowDamageOverTime(a1) -- Line: 617
    -- upvalues: u10 (val), burnDps (val), poisonDps (val), firstNumber (val), u70 (val), u73 (val), u77 (val)
    -- upvalues: u81 (val)
    local v1 = u10.BurstWindow(a1)
    local v2 = (burnDps(a1)) + poisonDps(a1)
    local v3 = firstNumber(a1, u70, 0)
    local v4 = firstNumber(a1, u73, 1)
    local v5 = v2 + (if not (v4 <= 0) then v3 / v4 else 0)
    local v6 = firstNumber(a1, u77, 0)
    v3 = firstNumber(a1, u81, 1)
    return v1 + (v5 + (if not (v3 <= 0) then v6 / v3 else 0))
end

function u10.InclusiveBurstDamageOverTime(a1) -- Line: 621
    -- upvalues: u10 (val), burnDps (val), poisonDps (val), firstNumber (val), u70 (val), u73 (val), u77 (val)
    -- upvalues: u81 (val)
    local v1 = u10.InclusiveBurstWithReload(a1)
    local v2 = (burnDps(a1)) + poisonDps(a1)
    local v3 = firstNumber(a1, u70, 0)
    local v4 = firstNumber(a1, u73, 1)
    local v5 = v2 + (if not (v4 <= 0) then v3 / v4 else 0)
    local v6 = firstNumber(a1, u77, 0)
    v3 = firstNumber(a1, u81, 1)
    return v1 + (v5 + (if not (v3 <= 0) then v6 / v3 else 0))
end

function u10.Accelerator(a1) -- Line: 625
    -- upvalues: u16 (val), firstNumber (val), u107 (val), u10 (val)
    local v1, v2, v3, v4
    if a1 then
        local MaxAmmo = a1.MaxAmmo
        if typeof(MaxAmmo) ~= "number" then
            local MaxAmmo_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).MaxAmmo
            v2 = if typeof(MaxAmmo_2) ~= "number" then 0 else MaxAmmo_2
        else
            v2 = MaxAmmo
        end
    else
        v2 = 0
    end
    if a1 then
        local Overcharge = a1.Overcharge
        if typeof(Overcharge) ~= "number" then
            local Overcharge_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Overcharge
            v1 = if typeof(Overcharge_2) ~= "number" then v2 or 0 else Overcharge_2
        else
            v1 = Overcharge
        end
    else
        v1 = v2 or 0
    end
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v2 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v2 = Damage
        end
    else
        v2 = 0
    end
    local v5 = firstNumber(a1, u107, 0)
    if a1 then
        local ChargeTime = a1.ChargeTime
        if typeof(ChargeTime) ~= "number" then
            local ChargeTime_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).ChargeTime
            v3 = if typeof(ChargeTime_2) ~= "number" then 0 else ChargeTime_2
        else
            v3 = ChargeTime
        end
    else
        v3 = 0
    end
    if a1 then
        local LaserCooldown = a1.LaserCooldown
        if typeof(LaserCooldown) ~= "number" then
            local LaserCooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).LaserCooldown
            v4 = if typeof(LaserCooldown_2) ~= "number" then 0 else LaserCooldown_2
        else
            v4 = LaserCooldown
        end
    else
        v4 = 0
    end
    if not (v1 <= 0) and not (v2 <= 0) and not (v5 <= 0) then
        local v6 = v3 + v4 + v1 / v2 * v5
        if v6 <= 0 then
            return 0
        end
        return v1 / v6
    end
    return u10.Default(a1)
end

function u10.Melee(a1) -- Line: 639 -- upvalues: u16 (val) -- types: a1: table?
    local v1, v2
    if a1 then
        local MeleeDamage = a1.MeleeDamage
        if typeof(MeleeDamage) ~= "number" then
            local MeleeDamage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).MeleeDamage
            v1 = if typeof(MeleeDamage_2) ~= "number" then 0 else MeleeDamage_2
        else
            v1 = MeleeDamage
        end
    else
        v1 = 0
    end
    if a1 then
        local MeleeCooldown = a1.MeleeCooldown
        if typeof(MeleeCooldown) ~= "number" then
            local MeleeCooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).MeleeCooldown
            v2 = if typeof(MeleeCooldown_2) ~= "number" then 0 else MeleeCooldown_2
        else
            v2 = MeleeCooldown
        end
    else
        v2 = 0
    end
    if v2 <= 0 then
        return 0
    end
    return v1 / v2
end

function u10.MultiHit(a1) -- Line: 643 -- upvalues: u10 (val), u16 (val) -- types: a1: table?
    local v1
    local v2 = u10.Default(a1)
    if a1 then
        local MaxHits = a1.MaxHits
        if typeof(MaxHits) ~= "number" then
            local MaxHits_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).MaxHits
            v1 = if typeof(MaxHits_2) ~= "number" then 1 else MaxHits_2
        else
            v1 = MaxHits
        end
    else
        v1 = 1
    end
    return v2 * math.max(v1, 1)
end

function u10.MultiSwing(a1) -- Line: 647 -- upvalues: u10 (val), u16 (val) -- types: a1: table?
    local v1
    local v2 = u10.Default(a1)
    if a1 then
        local MaxSwings = a1.MaxSwings
        if typeof(MaxSwings) ~= "number" then
            local MaxSwings_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).MaxSwings
            v1 = if typeof(MaxSwings_2) ~= "number" then 1 else MaxSwings_2
        else
            v1 = MaxSwings
        end
    else
        v1 = 1
    end
    return v2 * math.max(v1, 1)
end

function u10.Whirlwind(a1) -- Line: 651
    -- upvalues: u16 (val), firstNumber (val), u111 (val), u114 (val), u10 (val)
    local v1, v2, v3
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v1 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v1 = Damage
        end
    else
        v1 = 0
    end
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v2 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v2 = Cooldown
        end
    else
        v2 = 0
    end
    local v4 = math.max(firstNumber(a1, u111, 1), 1)
    if a1 then
        local WhirlwindDamageMultiplier = a1.WhirlwindDamageMultiplier
        if typeof(WhirlwindDamageMultiplier) ~= "number" then
            local WhirlwindDamageMultiplier_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).WhirlwindDamageMultiplier
            v3 = if typeof(WhirlwindDamageMultiplier_2) ~= "number" then 1 else WhirlwindDamageMultiplier_2
        else
            v3 = WhirlwindDamageMultiplier
        end
    else
        v3 = 1
    end
    local v5 = firstNumber(a1, u114, v1 * v3)
    if v4 <= 1 then
        return u10.Default(a1)
    end
    local v6 = v1 * math.max(v4 - 1, 0) + v5
    local v7 = v2 * v4
    if v7 <= 0 then
        return 0
    end
    return v6 / v7
end

function u10.Shotgun(a1) -- Line: 668 -- upvalues: u10 (val), firstNumber (val), u116 (val) -- types: a1: table?
    return (u10.Default(a1)) * math.max(firstNumber(a1, u116, 1), 1)
end

function u10.ShotgunDamageOverTime(a1) -- Line: 672
    -- upvalues: u10 (val), burnDps (val), poisonDps (val), firstNumber (val), u70 (val), u73 (val), u77 (val)
    -- upvalues: u81 (val)
    local v1 = u10.Shotgun(a1)
    local v2 = (burnDps(a1)) + poisonDps(a1)
    local v3 = firstNumber(a1, u70, 0)
    local v4 = firstNumber(a1, u73, 1)
    local v5 = v2 + (if not (v4 <= 0) then v3 / v4 else 0)
    local v6 = firstNumber(a1, u77, 0)
    v3 = firstNumber(a1, u81, 1)
    return v1 + (v5 + (if not (v3 <= 0) then v6 / v3 else 0))
end

function u10.Enforcer(a1) -- Line: 676 -- upvalues: u16 (val), firstNumber (val), u20 (val) -- types: a1: table?
    local v1, v2, v3, v4, v5, v6
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v1 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v1 = Damage
        end
    else
        v1 = 0
    end
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v2 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v2 = Cooldown
        end
    else
        v2 = 0
    end
    if a1 then
        local ProjectileCount = a1.ProjectileCount
        if typeof(ProjectileCount) ~= "number" then
            local ProjectileCount_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).ProjectileCount
            v3 = if typeof(ProjectileCount_2) ~= "number" then 1 else ProjectileCount_2
        else
            v3 = ProjectileCount
        end
    else
        v3 = 1
    end
    local v7 = math.max(v3, 1)
    v3 = math.max(firstNumber(a1, u20, 0), 0)
    if v3 > 0 then
        if a1 then
            local ReloadTime = a1.ReloadTime
            if typeof(ReloadTime) ~= "number" then
                local ReloadTime_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).ReloadTime
                v4 = if typeof(ReloadTime_2) ~= "number" then 0 else ReloadTime_2
            else
                v4 = ReloadTime
            end
        else
            v4 = 0
        end
        v5 = v1 * v7 * v3
        v6 = v4 + v2 * v3
        if v6 <= 0 then
            return 0
        end
        return v5 / v6
    end
    if a1 then
        local PumpTime = a1.PumpTime
        if typeof(PumpTime) ~= "number" then
            local PumpTime_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).PumpTime
            v4 = if typeof(PumpTime_2) ~= "number" then 0 else PumpTime_2
        else
            v4 = PumpTime
        end
    else
        v4 = 0
    end
    v5 = v1 * v7
    v6 = v4 + v2
    if v6 <= 0 then
        return 0
    end
    return v5 / v6
end

function u10.Counted(a1) -- Line: 691 -- upvalues: firstNumber (val), u119 (val), u16 (val) -- types: a1: table?
    local v1
    local v2 = math.max(firstNumber(a1, u119, 1), 1)
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v1 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v1 = Damage
        end
    else
        v1 = 0
    end
    local v3 = v1 * v2
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v1 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v1 = Cooldown
        end
    else
        v1 = 0
    end
    if v1 <= 0 then
        return 0
    end
    return v3 / v1
end

function u10.Cluster(a1) -- Line: 697
    -- upvalues: u16 (val), firstNumber (val), u123 (val), u125 (val)
    local v1
    if (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).CanCluster == false then
        return 0
    end
    local v2 = (firstNumber(a1, u123, 0)) * math.max(firstNumber(a1, u125, 0), 0)
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v1 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v1 = Cooldown
        end
    else
        v1 = 0
    end
    if v1 <= 0 then
        return 0
    end
    return v2 / v1
end

function u10.SplashMaxHits(a1) -- Line: 708 -- upvalues: u10 (val), u16 (val) -- types: a1: table?
    local v1
    local v2 = u10.Splash(a1)
    if a1 then
        local MaxHits = a1.MaxHits
        if typeof(MaxHits) ~= "number" then
            local MaxHits_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).MaxHits
            v1 = if typeof(MaxHits_2) ~= "number" then 1 else MaxHits_2
        else
            v1 = MaxHits
        end
    else
        v1 = 1
    end
    return v2 * math.max(v1, 1)
end

function u10.Bomb(a1) -- Line: 712
    -- upvalues: firstNumber (val), u127 (val), u131 (val), u16 (val)
    local v1
    local v2 = firstNumber(a1, u127, 0)
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v1 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v1 = Cooldown
        end
    else
        v1 = 0
    end
    local v3 = firstNumber(a1, u131, v1)
    if v3 <= 0 then
        return 0
    end
    return v2 / v3
end

function u10.HasBombDropping(a1) -- Line: 719 -- upvalues: u16 (val) -- types: a1: table?
    local SourceStats_2 = if typeof(a1) ~= "table" then nil else if typeof(a1.SourceStats) ~= "table" then nil else a1.SourceStats
    return (if not SourceStats_2 then u16 else if typeof(SourceStats_2.Attributes) ~= "table" then u16 else SourceStats_2.Attributes).BombDropping == true
end

function u10.GunAndBomb(a1) -- Line: 723 -- upvalues: u10 (val) -- types: a1: table?
    return (u10.Default(a1)) + u10.Bomb(a1)
end

function u10.NormalAndSplash(a1) -- Line: 727 -- upvalues: u10 (val) -- types: a1: table?
    return (u10.Default(a1)) + u10.Splash(a1)
end

function u10.Missile(a1) -- Line: 731
    -- upvalues: firstNumber (val), u139 (val), u119 (val), u160 (val), u144 (val), abilityNumber (val), u157 (val)
    -- upvalues: u16 (val)
    local v1 = firstNumber(a1, u139, 0)
    local v2 = math.max(firstNumber(a1, u119, 1), 1)
    local v3 = firstNumber(a1, u160, 0)
    local v4 = firstNumber(a1, u144, 0)
    if v4 <= 0 then
        local v5
        if a1 then
            local Cooldown = a1.Cooldown
            if typeof(Cooldown) ~= "number" then
                local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
                v5 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
            else
                v5 = Cooldown
            end
        else
            v5 = 0
        end
        v4 = abilityNumber(a1, "Missile", u157, v5)
    end
    local v6 = v1 * v2
    local v7 = v4 + v3 * v2
    if v7 <= 0 then
        return 0
    end
    return v6 / v7
end

function u10.MissileAbility(a1) -- Line: 749
    -- upvalues: abilityNumber (val), u152 (val), firstNumber (val), u139 (val), u154 (val), u119 (val), u157 (val)
    -- upvalues: u149 (val)
    local v1 = firstNumber(a1, u139, (abilityNumber(a1, "Missile", u152, 0)))
    local v2 = math.max(abilityNumber(a1, "Missile", u154, (firstNumber(a1, u119, 1))), 1)
    local v3 = abilityNumber(a1, "Missile", u157, (firstNumber(a1, u149, 0)))
    local v4 = v1 * v2
    if v3 <= 0 then
        return 0
    end
    return v4 / v3
end

function u10.HasMissile(a1) -- Line: 771 -- upvalues: u10 (val) -- types: a1: table?
    return 0 < (u10.Missile(if typeof(a1) ~= "table" or a1.SourceStats == nil then a1 else if typeof(a1) ~= "table" then nil else if typeof(a1.SourceStats) ~= "table" then nil else a1.SourceStats))
end

function u10.ActiveUnitGun(a1) -- Line: 780 -- upvalues: u10 (val), unitStats (val), u16 (val) -- types: a1: table?
    local Default = u10.Default
    local UnitToSend = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).UnitToSend
    return Default((unitStats(if typeof(UnitToSend) ~= "string" then nil else if UnitToSend == "" then nil else UnitToSend)))
end

function u10.ActiveUnitMissile(a1) -- Line: 784 -- upvalues: u10 (val), unitStats (val), u16 (val) -- types: a1: table?
    local Missile = u10.Missile
    local UnitToSend = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).UnitToSend
    return Missile((unitStats(if typeof(UnitToSend) ~= "string" then nil else if UnitToSend == "" then nil else UnitToSend)))
end

function u10.ActiveUnitTotal(a1) -- Line: 788 -- upvalues: unitStats (val), u16 (val), u10 (val) -- types: a1: table?
    local UnitToSend = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).UnitToSend
    local v1 = unitStats(if typeof(UnitToSend) ~= "string" then nil else if UnitToSend == "" then nil else UnitToSend)
    return (u10.Default(v1)) + u10.Missile(v1)
end

function u10.HasActiveUnitGun(a1) -- Line: 794 -- upvalues: u10 (val) -- types: a1: table?
    local ActiveUnitGun = u10.ActiveUnitGun
    return 0 < (ActiveUnitGun(if typeof(a1) ~= "table" then nil else if typeof(a1.SourceStats) ~= "table" then nil else a1.SourceStats))
end

function u10.HasActiveUnitMissile(a1) -- Line: 798 -- upvalues: u10 (val) -- types: a1: table?
    local ActiveUnitMissile = u10.ActiveUnitMissile
    return 0 < (ActiveUnitMissile(if typeof(a1) ~= "table" then nil else if typeof(a1.SourceStats) ~= "table" then nil else a1.SourceStats))
end

function u10.HasActiveUnitTotal(a1) -- Line: 802 -- upvalues: unitStats (val), u16 (val), u10 (val) -- types: a1: table?
    local SourceStats_2 = if typeof(a1) ~= "table" then nil else if typeof(a1.SourceStats) ~= "table" then nil else a1.SourceStats
    local UnitToSend = (if not SourceStats_2 then u16 else if typeof(SourceStats_2.Attributes) ~= "table" then u16 else SourceStats_2.Attributes).UnitToSend
    local v1 = unitStats(if typeof(UnitToSend) ~= "string" then nil else if UnitToSend == "" then nil else UnitToSend)
    local v2 = false
    if 0 < (u10.Default(v1)) then
        v2 = 0 < (u10.Missile(v1))
    end
    return v2
end

function u10.GunAndMissile(a1) -- Line: 808 -- upvalues: u10 (val) -- types: a1: table?
    return (u10.Default(a1)) + u10.Missile(a1)
end

function u10.AmmoAndMissile(a1) -- Line: 812 -- upvalues: u10 (val) -- types: a1: table?
    return (u10.Ammo(a1)) + u10.Missile(a1)
end

function u10.BurstAndMissileAbility(a1) -- Line: 816 -- upvalues: u10 (val) -- types: a1: table?
    return (u10.BurstWithReload(a1)) + u10.MissileAbility(a1)
end

function u10.Smite(a1) -- Line: 820 -- upvalues: u16 (val), u10 (val) -- types: a1: table?
    local v1, v2, v3, v4
    if a1 then
        local MaxAmmo = a1.MaxAmmo
        if typeof(MaxAmmo) ~= "number" then
            local MaxAmmo_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).MaxAmmo
            v2 = if typeof(MaxAmmo_2) ~= "number" then 0 else MaxAmmo_2
        else
            v2 = MaxAmmo
        end
    else
        v2 = 0
    end
    if a1 then
        local SmiteMeter = a1.SmiteMeter
        if typeof(SmiteMeter) ~= "number" then
            local SmiteMeter_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).SmiteMeter
            v1 = if typeof(SmiteMeter_2) ~= "number" then v2 or 0 else SmiteMeter_2
        else
            v1 = SmiteMeter
        end
    else
        v1 = v2 or 0
    end
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v2 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v2 = Damage
        end
    else
        v2 = 0
    end
    if a1 then
        local SmiteDamage = a1.SmiteDamage
        if typeof(SmiteDamage) ~= "number" then
            local SmiteDamage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).SmiteDamage
            v3 = if typeof(SmiteDamage_2) ~= "number" then 0 else SmiteDamage_2
        else
            v3 = SmiteDamage
        end
    else
        v3 = 0
    end
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v4 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v4 = Cooldown
        end
    else
        v4 = 0
    end
    if not (v1 <= 0) and not (v3 <= 0) then
        local v5 = v1 * v2 + v3
        local v6 = v4 * v1
        if v6 <= 0 then
            return 0
        end
        return v5 / v6
    end
    return u10.Default(a1)
end

function u10.SplashDamageOverTime(a1) -- Line: 833
    -- upvalues: u10 (val), burnDps (val), poisonDps (val), firstNumber (val), u70 (val), u73 (val), u77 (val)
    -- upvalues: u81 (val)
    local v1 = (u10.Default(a1)) + u10.Splash(a1)
    local v2 = (burnDps(a1)) + poisonDps(a1)
    local v3 = firstNumber(a1, u70, 0)
    local v4 = firstNumber(a1, u73, 1)
    local v5 = v2 + (if not (v4 <= 0) then v3 / v4 else 0)
    local v6 = firstNumber(a1, u77, 0)
    v3 = firstNumber(a1, u81, 1)
    return v1 + (v5 + (if not (v3 <= 0) then v6 / v3 else 0))
end

function u10.Impact(a1) -- Line: 837 -- upvalues: u16 (val), firstNumber (val), u139 (val) -- types: a1: table?
    local v1, v2
    if (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).CanExplode ~= true then
        return 0
    end
    local v3 = firstNumber(a1, u139, 0)
    if a1 then
        local MaxHits = a1.MaxHits
        if typeof(MaxHits) ~= "number" then
            local MaxHits_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).MaxHits
            v1 = if typeof(MaxHits_2) ~= "number" then 1 else MaxHits_2
        else
            v1 = MaxHits
        end
    else
        v1 = 1
    end
    local v4 = v3 * math.max(v1, 1)
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v2 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v2 = Cooldown
        end
    else
        v2 = 0
    end
    if v2 <= 0 then
        return 0
    end
    return v4 / v2
end

function u10.HasImpact(a1) -- Line: 848 -- upvalues: u16 (val) -- types: a1: table?
    local SourceStats_2 = if typeof(a1) ~= "table" then nil else if typeof(a1.SourceStats) ~= "table" then nil else a1.SourceStats
    return (if not SourceStats_2 then u16 else if typeof(SourceStats_2.Attributes) ~= "table" then u16 else SourceStats_2.Attributes).CanExplode == true
end

function u10.DefaultAndImpact(a1) -- Line: 852 -- upvalues: u10 (val) -- types: a1: table?
    return (u10.Default(a1)) + u10.Impact(a1)
end

function u10.Sweeper(a1) -- Line: 856 -- upvalues: u16 (val), abilityNumber (val), u163 (val) -- types: a1: table?
    local v1
    if (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).SweeperUnlocked ~= true then
        return 0
    end
    if a1 then
        local SweeperDamage = a1.SweeperDamage
        if typeof(SweeperDamage) ~= "number" then
            local SweeperDamage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).SweeperDamage
            v1 = if typeof(SweeperDamage_2) ~= "number" then 0 else SweeperDamage_2
        else
            v1 = SweeperDamage
        end
    else
        v1 = 0
    end
    local v2 = abilityNumber(a1, "Sweeper", u163, 0)
    local v3 = v1 * 2
    if v2 <= 0 then
        return 0
    end
    return v3 / v2
end

function u10.JesterBurn(a1) -- Line: 868
    -- upvalues: u16 (val), nestedNumber (val), u166 (val), u49 (val)
    local v1
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v1 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v1 = Damage
        end
    else
        v1 = 0
    end
    local v2 = math.max(1, v1 * 0.3)
    local v3 = nestedNumber(a1, u166, u49, 1)
    if v3 <= 0 then
        return 0
    end
    return v2 / v3
end

function u10.JesterPoison(a1) -- Line: 875
    -- upvalues: u16 (val), nestedNumber (val), u168 (val), u63 (val)
    local v1, v2
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v1 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v1 = Damage
        end
    else
        v1 = 0
    end
    if v1 < 30 then
        return 0
    end
    if a1 then
        local Damage_3 = a1.Damage
        if typeof(Damage_3) ~= "number" then
            local Damage_4 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v2 = if typeof(Damage_4) ~= "number" then 0 else Damage_4
        else
            v2 = Damage_3
        end
    else
        v2 = 0
    end
    v1 = math.max(1, v2 * 0.1)
    local v3 = nestedNumber(a1, u168, u63, 1)
    if v3 <= 0 then
        return 0
    end
    return v1 / v3
end

function u10.JesterCombined(a1) -- Line: 887 -- upvalues: u10 (val) -- types: a1: table?
    return (u10.Default(a1)) + u10.JesterBurn(a1) + u10.JesterPoison(a1)
end

function u10.Aftershock(a1) -- Line: 891 -- upvalues: u16 (val) -- types: a1: table?
    local v1, v2
    if (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Aftershock ~= true then
        return 0
    end
    if a1 then
        local Damage = a1.Damage
        if typeof(Damage) ~= "number" then
            local Damage_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Damage
            v1 = if typeof(Damage_2) ~= "number" then 0 else Damage_2
        else
            v1 = Damage
        end
    else
        v1 = 0
    end
    if a1 then
        local AftershockDamageMult = a1.AftershockDamageMult
        if typeof(AftershockDamageMult) ~= "number" then
            local AftershockDamageMult_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).AftershockDamageMult
            v2 = if typeof(AftershockDamageMult_2) ~= "number" then 0 else AftershockDamageMult_2
        else
            v2 = AftershockDamageMult
        end
    else
        v2 = 0
    end
    local v3 = v1 * v2
    if a1 then
        local Cooldown = a1.Cooldown
        if typeof(Cooldown) ~= "number" then
            local Cooldown_2 = (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).Cooldown
            v1 = if typeof(Cooldown_2) ~= "number" then 0 else Cooldown_2
        else
            v1 = Cooldown
        end
    else
        v1 = 0
    end
    if v1 <= 0 then
        return 0
    end
    return v3 / v1
end

function u10.Frozen(a1) -- Line: 902
    -- upvalues: u16 (val), u10 (val), firstNumber (val), u170 (val)
    if (if not a1 then u16 else if typeof(a1.Attributes) ~= "table" then u16 else a1.Attributes).FreezeBonus ~= true then
        return u10.Default(a1)
    end
    return (u10.Default(a1)) * firstNumber(a1, u170, 2)
end

function u10.SledgerTotal(a1) -- Line: 910 -- upvalues: u10 (val) -- types: a1: table?
    return (u10.Default(a1)) + u10.Aftershock(a1)
end

function u10.SledgerFrozenTotal(a1) -- Line: 914 -- upvalues: u10 (val) -- types: a1: table?
    return (u10.Frozen(a1)) + u10.Aftershock(a1)
end

return u10