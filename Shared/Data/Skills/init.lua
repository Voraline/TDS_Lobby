-- Script path: ReplicatedStorage.Shared.Data.Skills
-- Decompile time: 13.74 ms

local v1, v2
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)

local function cost(a1, a2) -- Line: 29 -- types: a1: string, a2: number
    return {currency = a1, amount = a2}
end

local function costPerEV(a1, a2, a3) -- Line: 36 -- upvalues: math (val) -- types: a1: string, a2: number, a3: number
    return function(a1_2) -- Line: 37 -- upvalues: a2 (val), a3 (val), math (upval), a1 (val) -- types: a1_2: number
        local v1 = math.floor((a2 * a1_2) ^ a3)
        return {currency = a1, amount = math.roundToNearest(v1, 5)}
    end
end

local function playerCount() -- Line: 44 -- upvalues: ReplicatedStorage (val)
    return require(ReplicatedStorage.Shared.Modules.GameState).PlayerCount or 4
end

local function valuePerEV(a1, a2, a3) -- Line: 49 -- upvalues: math (val) -- types: a1: number, a2: number, a3: number?
    return function(a1_2) -- Line: 50 -- upvalues: math (upval), a1 (val), a2 (val), a3 (val) -- types: a1_2: number
        return math.round((a1 * a1_2) ^ a2, a3 or 3)
    end
end

local function valuePerLinear(a1, a2, a3) -- Line: 55
    -- upvalues: math (val)
    return function(a1_2) -- Line: 56 -- upvalues: math (upval), a1 (val), a2 (val), a3 (val) -- types: a1_2: number
        return math.round(a1 + a2 * a1_2, a3 or 3)
    end
end

local function formatter(a1) -- Line: 61 -- upvalues: Enum (val), math (val)
    if a1 == Enum.SkillTreeFormat.Percentage then
        return function(a1) -- Line: 63 -- upvalues: math (upval) -- types: a1: number
            return (("%*%%"):format((math.round(a1, 3))))
        end
    end
    if a1 == Enum.SkillTreeFormat.Number then
        return function(a1) -- Line: 67 -- upvalues: math (upval) -- types: a1: number
            return (("%*"):format((math.round(a1, 3))))
        end
    end
    if a1 == Enum.SkillTreeFormat.Integer then
        return function(a1) -- Line: 71 -- types: a1: number
            return (("%*"):format((math.floor(a1))))
        end
    end
    if a1 == Enum.SkillTreeFormat.Currency then
        return function(a1) -- Line: 75 -- upvalues: math (upval) -- types: a1: number
            return (("$%*"):format((math.round(a1, 2))))
        end
    end
    if a1 == Enum.SkillTreeFormat.Enemies then
        return function(a1) -- Line: 79 -- types: a1: number
            return (("%* Enemies"):format((math.floor(a1))))
        end
    end
    error("Invalid format type: " .. tostring(a1))
end

local function makeDescription(a1) -- Line: 87 -- types: a1: string
    return function(a1_2, a2) -- Line: 88 -- upvalues: a1 (val) -- types: a2: number
        if a2 == 0 then
            a2 = a2 + 1
        end
        return a1:gsub("X", (a1_2.displayText((a1_2.valuePerLevel(a2))):gsub("%%", "%%%%")))
    end
end

local v3 = {}
local v4 = {}
local EnhancedOptics = Enum.SkillTreeNode.EnhancedOptics
local v5 = {
    displayName = "Enhanced Optics",
    skillLevelCap = 20,
    playerLevelUnlocked = 1,
    icon = Icons.EnhancedOptics,
    category = Enum.SkillTreeCategory.Offense,
}
local u37 = "Tower range is increased by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u37 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u37:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

local u39 = 6
local u40 = 1.73
local u41 = "coins"

function v5.costPerLevel(a1) -- Line: 37 -- upvalues: u39 (val), u40 (val), math (val), u41 (val) -- types: a1: number
    return {
        currency = u41,
        amount = math.roundToNearest(math.floor((u39 * a1) ^ u40), 5),
    }
end

local u43 = 0.5
local u44 = 1
local u45 = nil

function v5.valuePerLevel(a1) -- Line: 50 -- upvalues: math (val), u43 (val), u44 (val), u45 (val) -- types: a1: number
    return math.round((u43 * a1) ^ u44, u45 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[EnhancedOptics] = v5
local ResellValue = Enum.SkillTreeNode.ResellValue
v5 = {
    displayName = "Resourcefulness",
    skillLevelCap = 25,
    playerLevelUnlocked = 1,
    icon = Icons.ResellValue,
    category = Enum.SkillTreeCategory.Economy,
}
local u57 = "Selling towers returns <b><font color=\"#fff344\">X</font></b> more money."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u57 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u57:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

local u59 = 4
local u60 = 1.75
local u61 = "coins"

function v5.costPerLevel(a1) -- Line: 37 -- upvalues: u59 (val), u60 (val), math (val), u61 (val) -- types: a1: number
    return {
        currency = u61,
        amount = math.roundToNearest(math.floor((u59 * a1) ^ u60), 5),
    }
end

local u63 = 1.2
local u64 = 1
local u65 = nil

function v5.valuePerLevel(a1) -- Line: 50 -- upvalues: math (val), u63 (val), u64 (val), u65 (val) -- types: a1: number
    return math.round((u63 * a1) ^ u64, u65 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[ResellValue] = v5
local Scholar = Enum.SkillTreeNode.Scholar
v5 = {
    displayName = "Scholar",
    skillLevelCap = 20,
    previousNodeLevel = 10,
    icon = Icons.Scholar,
    category = Enum.SkillTreeCategory.Strategy,
}
local u77 = "Logbook drop rate is increased by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u77 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u77:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.SkillAccelerator
local u81 = 5
local u82 = 1.83
local u83 = "coins"

function v5.costPerLevel(a1) -- Line: 37 -- upvalues: u81 (val), u82 (val), math (val), u83 (val) -- types: a1: number
    return {
        currency = u83,
        amount = math.roundToNearest(math.floor((u81 * a1) ^ u82), 5),
    }
end

local u85 = 1
local u86 = 1
local u87 = nil

function v5.valuePerLevel(a1) -- Line: 50 -- upvalues: math (val), u85 (val), u86 (val), u87 (val) -- types: a1: number
    return math.round((u85 * a1) ^ u86, u87 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Number)
v4[Scholar] = v5
local Fortify = Enum.SkillTreeNode.Fortify
v5 = {
    displayName = "Fortify",
    skillLevelCap = 40,
    playerLevelUnlocked = 1,
    icon = Icons.Fortify,
    category = Enum.SkillTreeCategory.Defense,
}
local u99 = "Increases the player’s health pool by <b><font color=\"#fff344\">X</font></b>. (In groups, the highest HP is used.)"

function v5.description(a1, a2) -- Line: 88 -- upvalues: u99 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u99:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

local u101 = 3
local u102 = 1.4
local u103 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u101 (val), u102 (val), math (val), u103 (val)
    return {
        currency = u103,
        amount = math.roundToNearest(math.floor((u101 * a1) ^ u102), 5),
    }
end

local u105 = 5
local u106 = 1
local u107 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u105 (val), u106 (val), u107 (val)
    return math.round((u105 * a1) ^ u106, u107 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Number)
v4[Fortify] = v5
local Overhealing = Enum.SkillTreeNode.Overhealing
v5 = {
    displayName = "Over-Heal",
    skillLevelCap = 25,
    previousNodeLevel = 10,
    icon = Icons.Overhealing,
    category = Enum.SkillTreeCategory.Defense,
}
local u119 = "Increases how much extra HP can be kept from over-healing by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u119 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u119:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.Fortify
local u123 = 5
local u124 = 1.7
local u125 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u123 (val), u124 (val), math (val), u125 (val)
    return {
        currency = u125,
        amount = math.roundToNearest(math.floor((u123 * a1) ^ u124), 5),
    }
end

local u127 = 8
local u128 = 1
local u129 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u127 (val), u128 (val), u129 (val)
    return math.round((u127 * a1) ^ u128, u129 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Number)
v4[Overhealing] = v5
local FightDirty = Enum.SkillTreeNode.FightDirty
v5 = {
    displayName = "Fight Dirty",
    skillLevelCap = 25,
    previousNodeLevel = 10,
    icon = Icons.FightDirty,
    category = Enum.SkillTreeCategory.Offense,
}
local u141 = "Debuff durations applied to enemies are increased by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u141 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u141:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.SplashDamage
local u145 = 5
local u146 = 1.77
local u147 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u145 (val), u146 (val), math (val), u147 (val)
    return {
        currency = u147,
        amount = math.roundToNearest(math.floor((u145 * a1) ^ u146), 5),
    }
end

local u149 = 1
local u150 = 1
local u151 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u149 (val), u150 (val), u151 (val)
    return math.round((u149 * a1) ^ u150, u151 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[FightDirty] = v5
local ExtremeConditioning = Enum.SkillTreeNode.ExtremeConditioning
v5 = {
    displayName = "Extreme Conditioning",
    skillLevelCap = 25,
    previousNodeLevel = 10,
    icon = Icons.ExtremeConditioning,
    category = Enum.SkillTreeCategory.Defense,
}
local u163 = "Reduces stun and debuff durations from enemies by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u163 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u163:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.Bandages
local u167 = 5
local u168 = 1.725
local u169 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u167 (val), u168 (val), math (val), u169 (val)
    return {
        currency = u169,
        amount = math.roundToNearest(math.floor((u167 * a1) ^ u168), 5),
    }
end

local u171 = 0.8
local u172 = 1
local u173 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u171 (val), u172 (val), u173 (val)
    return math.round((u171 * a1) ^ u172, u173 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[ExtremeConditioning] = v5
local Stonks = Enum.SkillTreeNode.Stonks
v5 = {
    displayName = "Stonks",
    skillLevelCap = 20,
    previousNodeLevel = 10,
    icon = Icons.Stonks,
    category = Enum.SkillTreeCategory.Economy,
}
local u185 = "Wave rewards are increased by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u185 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u185:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.BiggerBudget
local u189 = 7
local u190 = 1.78
local u191 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u189 (val), u190 (val), math (val), u191 (val)
    return {
        currency = u191,
        amount = math.roundToNearest(math.floor((u189 * a1) ^ u190), 5),
    }
end

local u193 = 0.5
local u194 = 1
local u195 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u193 (val), u194 (val), u195 (val)
    return math.round((u193 * a1) ^ u194, u195 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[Stonks] = v5
local ExpandedBarracks = Enum.SkillTreeNode.ExpandedBarracks
v5 = {
    displayName = "Expanded Barracks",
    skillLevelCap = 20,
    previousNodeLevel = 10,
    icon = Icons.ExpandedBarracks,
    category = Enum.SkillTreeCategory.Strategy,
}
local u207 = "Cooldown for spawning units is reduced by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u207 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u207:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.SkillAccelerator
local u211 = 6
local u212 = 1.86
local u213 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u211 (val), u212 (val), math (val), u213 (val)
    return {
        currency = u213,
        amount = math.roundToNearest(math.floor((u211 * a1) ^ u212), 5),
    }
end

local u215 = 0.75
local u216 = 1
local u217 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u215 (val), u216 (val), u217 (val)
    return math.round((u215 * a1) ^ u216, u217 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[ExpandedBarracks] = v5
local SplashDamage = Enum.SkillTreeNode.SplashDamage
v5 = {
    displayName = "Improved Gunpowder",
    skillLevelCap = 25,
    previousNodeLevel = 10,
    icon = Icons.SplashDamage,
    category = Enum.SkillTreeCategory.Offense,
}
local u229 = "AOE explosion radius is increased by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u229 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u229:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.EnhancedOptics
local u233 = 5
local u234 = 1.725
local u235 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u233 (val), u234 (val), math (val), u235 (val)
    return {
        currency = u235,
        amount = math.roundToNearest(math.floor((u233 * a1) ^ u234), 5),
    }
end

local u237 = 0.5
local u238 = 1
local u239 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u237 (val), u238 (val), u239 (val)
    return math.round((u237 * a1) ^ u238, u239 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[SplashDamage] = v5
local BeefedUpMinions = Enum.SkillTreeNode.BeefedUpMinions
v5 = {
    displayName = "Beefed Up Minions",
    skillLevelCap = 25,
    previousNodeLevel = 10,
    icon = Icons.BeefedUpMinions,
    category = Enum.SkillTreeCategory.Defense,
}
local u251 = "Health of summoned units is increased by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u251 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u251:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.ExtremeConditioning
local u255 = 6
local u256 = 1.68
local u257 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u255 (val), u256 (val), math (val), u257 (val)
    return {
        currency = u257,
        amount = math.roundToNearest(math.floor((u255 * a1) ^ u256), 5),
    }
end

local u259 = 0.6
local u260 = 1
local u261 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u259 (val), u260 (val), u261 (val)
    return math.round((u259 * a1) ^ u260, u261 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[BeefedUpMinions] = v5
local Precision = Enum.SkillTreeNode.Precision
v5 = {
    displayName = "Precision",
    skillLevelCap = 15,
    previousNodeLevel = 10,
    icon = Icons.Precision,
    category = Enum.SkillTreeCategory.Offense,
}
local u273 = "Every <b><font color=\"#fff344\">X</font></b> shots, towers deal a critical hit (1.25x damage). Cannot stack with other critical hit towers."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u273 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u273:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.FightDirty
local u277 = 7
local u278 = 2.035
local u279 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u277 (val), u278 (val), math (val), u279 (val)
    return {
        currency = u279,
        amount = math.roundToNearest(math.floor((u277 * a1) ^ u278), 5),
    }
end

local u281 = 30
local u282 = -1
local u283 = nil

function v5.valuePerLevel(a1) -- Line: 56
    -- upvalues: math (val), u281 (val), u282 (val), u283 (val)
    return math.round(u281 + u282 * a1, u283 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Enemies)
v4[Precision] = v5
local Scavenger = Enum.SkillTreeNode.Scavenger
v5 = {
    displayName = "Scavenger",
    skillLevelCap = 20,
    previousNodeLevel = 10,
    icon = Icons.Scavenger,
    category = Enum.SkillTreeCategory.Economy,
}
local u295 = "Every <b><font color=\"#fff344\">X</font></b> kills grants 1.5x rewards from enemies."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u295 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u295:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.Stonks
local u299 = 7
local u300 = 1.865
local u301 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u299 (val), u300 (val), math (val), u301 (val)
    return {
        currency = u301,
        amount = math.roundToNearest(math.floor((u299 * a1) ^ u300), 5),
    }
end

local u303 = 30
local u304 = -1
local u305 = nil

function v5.valuePerLevel(a1) -- Line: 56
    -- upvalues: math (val), u303 (val), u304 (val), u305 (val)
    return math.round(u303 + u304 * a1, u305 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Enemies)
v4[Scavenger] = v5
local SkillAccelerator = Enum.SkillTreeNode.SkillAccelerator
v5 = {
    displayName = "Accelerator",
    skillLevelCap = 25,
    playerLevelUnlocked = 1,
    icon = Icons.SkillAccelerator,
    category = Enum.SkillTreeCategory.Strategy,
}
local u317 = "Reduces cooldown of active abilities by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u317 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u317:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

local u319 = 4
local u320 = 1.77
local u321 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u319 (val), u320 (val), math (val), u321 (val)
    return {
        currency = u321,
        amount = math.roundToNearest(math.floor((u319 * a1) ^ u320), 5),
    }
end

local u323 = 0.5
local u324 = 1
local u325 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u323 (val), u324 (val), u325 (val)
    return math.round((u323 * a1) ^ u324, u325 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[SkillAccelerator] = v5
local Reenforcements = Enum.SkillTreeNode.Reenforcements
v5 = {
    displayName = "Re-enforcements",
    skillLevelCap = 10,
    previousNodeLevel = 10,
    icon = Icons.Reenforcements,
    category = Enum.SkillTreeCategory.Strategy,
}
local u337 = "Increases the tower placement limit by <b><font color=\"#fff344\">X</font></b>. (Scales with number of players.)"

function v5.description(a1, a2) -- Line: 88 -- upvalues: u337 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u337:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.ExpandedBarracks
local u341 = 100
local u342 = 1.5
local u343 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u341 (val), u342 (val), math (val), u343 (val)
    return {
        currency = u343,
        amount = math.roundToNearest(math.floor((u341 * a1) ^ u342), 5),
    }
end

function v5.valuePerLevel(a1) -- Line: 328 -- upvalues: ReplicatedStorage (val) -- types: a1: number
    local v1 = require(ReplicatedStorage.Shared.Modules.GameState).PlayerCount or 4
    local v2 = 1
    if workspace.Type.Value ~= "Lobby" then
        if v1 >= 3 then
            v2 = 0.5
        elseif v1 >= 2 then
            v2 = 0.8
        end
    end
    return (math.floor(a1 * v2))
end

v5.displayText = formatter(Enum.SkillTreeFormat.Number)
v4[Reenforcements] = v5
local BiggerBudget = Enum.SkillTreeNode.BiggerBudget
v5 = {
    displayName = "Bigger Budget",
    skillLevelCap = 25,
    previousNodeLevel = 10,
    icon = Icons.BiggerBudget,
    category = Enum.SkillTreeCategory.Economy,
}
local u356 = "Starting cash is increased by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u356 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u356:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.ResellValue
local u360 = 4
local u361 = 1.82
local u362 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u360 (val), u361 (val), math (val), u362 (val)
    return {
        currency = u362,
        amount = math.roundToNearest(math.floor((u360 * a1) ^ u361), 5),
    }
end

local u364 = 1
local u365 = 1
local u366 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u364 (val), u365 (val), u366 (val)
    return math.round((u364 * a1) ^ u365, u366 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[BiggerBudget] = v5
local Bandages = Enum.SkillTreeNode.Bandages
v5 = {
    displayName = "Bandages",
    skillLevelCap = 25,
    previousNodeLevel = 10,
    icon = Icons.Bandages,
    category = Enum.SkillTreeCategory.Defense,
}
local u378 = "Regenerates <b><font color=\"#fff344\">X</font></b> health at the start of every wave."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u378 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u378:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.Overhealing
local u382 = 5
local u383 = 1.7
local u384 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u382 (val), u383 (val), math (val), u384 (val)
    return {
        currency = u384,
        amount = math.roundToNearest(math.floor((u382 * a1) ^ u383), 5),
    }
end

local u386 = 1
local u387 = 1
local u388 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u386 (val), u387 (val), u388 (val)
    return math.round((u386 * a1) ^ u387, u388 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Integer)
v4[Bandages] = v5
for i, j in script.Versions:GetChildren() do
    v1 = j.Name:match("^SkillsV(%d+)$")
    if v1 then
        v2 = tonumber(v1)
        v3[v2] = (require(j))
    else
        warn("Invalid version name, please ensure it matches \"SkillsV<number>\"")
    end
end
return {level = 15, version = 1, nodes = v4, previousVersions = v3}