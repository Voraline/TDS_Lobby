-- Script path: ReplicatedStorage.Shared.Data.Skills.Versions.SkillsV0
-- Decompile time: 3.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)

local function costPerEV(a1, a2, a3) -- Line: 6 -- upvalues: math (val) -- types: a1: string, a2: number, a3: number
    return {
        currency = a1,
        calculate = function(a1) -- Line: 9 -- upvalues: a2 (val), a3 (val), math (upval) -- types: a1: number
            return (math.roundToNearest(math.floor((a2 * a1) ^ a3), 5))
        end,
    }
end

local v1 = {}
local EnhancedOptics = Enum.SkillTreeNode.EnhancedOptics
local v2 = {currency = "coins"}
local u21 = 9
local u22 = 1.78

function v2.calculate(a1) -- Line: 9 -- upvalues: u21 (val), u22 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u21 * a1) ^ u22), 5))
end

v1[EnhancedOptics] = v2
local ResellValue = Enum.SkillTreeNode.ResellValue
v2 = {currency = "coins"}
local u27 = 7
local u28 = 1.74

function v2.calculate(a1) -- Line: 9 -- upvalues: u27 (val), u28 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u27 * a1) ^ u28), 5))
end

v1[ResellValue] = v2
local Scholar = Enum.SkillTreeNode.Scholar
v2 = {currency = "coins"}
local u33 = 9
local u34 = 1.85

function v2.calculate(a1) -- Line: 9 -- upvalues: u33 (val), u34 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u33 * a1) ^ u34), 5))
end

v1[Scholar] = v2
local Fortify = Enum.SkillTreeNode.Fortify
v2 = {currency = "coins"}
local u39 = 5
local u40 = 1.425

function v2.calculate(a1) -- Line: 9 -- upvalues: u39 (val), u40 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u39 * a1) ^ u40), 5))
end

v1[Fortify] = v2
local Overhealing = Enum.SkillTreeNode.Overhealing
v2 = {currency = "coins"}
local u45 = 8
local u46 = 1.65

function v2.calculate(a1) -- Line: 9 -- upvalues: u45 (val), u46 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u45 * a1) ^ u46), 5))
end

v1[Overhealing] = v2
local FightDirty = Enum.SkillTreeNode.FightDirty
v2 = {currency = "coins"}
local u51 = 8
local u52 = 1.78

function v2.calculate(a1) -- Line: 9 -- upvalues: u51 (val), u52 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u51 * a1) ^ u52), 5))
end

v1[FightDirty] = v2
local ExtremeConditioning = Enum.SkillTreeNode.ExtremeConditioning
v2 = {currency = "coins"}
local u57 = 8
local u58 = 1.7

function v2.calculate(a1) -- Line: 9 -- upvalues: u57 (val), u58 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u57 * a1) ^ u58), 5))
end

v1[ExtremeConditioning] = v2
local Stonks = Enum.SkillTreeNode.Stonks
v2 = {currency = "coins"}
local u63 = 10
local u64 = 1.8

function v2.calculate(a1) -- Line: 9 -- upvalues: u63 (val), u64 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u63 * a1) ^ u64), 5))
end

v1[Stonks] = v2
local ExpandedBarracks = Enum.SkillTreeNode.ExpandedBarracks
v2 = {currency = "coins"}
local u69 = 9
local u70 = 1.85

function v2.calculate(a1) -- Line: 9 -- upvalues: u69 (val), u70 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u69 * a1) ^ u70), 5))
end

v1[ExpandedBarracks] = v2
local SplashDamage = Enum.SkillTreeNode.SplashDamage
v2 = {currency = "coins"}
local u75 = 7
local u76 = 1.78

function v2.calculate(a1) -- Line: 9 -- upvalues: u75 (val), u76 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u75 * a1) ^ u76), 5))
end

v1[SplashDamage] = v2
local BeefedUpMinions = Enum.SkillTreeNode.BeefedUpMinions
v2 = {currency = "coins"}
local u81 = 9
local u82 = 1.7

function v2.calculate(a1) -- Line: 9 -- upvalues: u81 (val), u82 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u81 * a1) ^ u82), 5))
end

v1[BeefedUpMinions] = v2
local Precision = Enum.SkillTreeNode.Precision
v2 = {currency = "coins"}
local u87 = 11
local u88 = 1.98

function v2.calculate(a1) -- Line: 9 -- upvalues: u87 (val), u88 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u87 * a1) ^ u88), 5))
end

v1[Precision] = v2
local Scavenger = Enum.SkillTreeNode.Scavenger
v2 = {currency = "coins"}
local u93 = 10
local u94 = 1.85

function v2.calculate(a1) -- Line: 9 -- upvalues: u93 (val), u94 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u93 * a1) ^ u94), 5))
end

v1[Scavenger] = v2
local SkillAccelerator = Enum.SkillTreeNode.SkillAccelerator
v2 = {currency = "coins"}
local u99 = 6
local u100 = 1.8

function v2.calculate(a1) -- Line: 9 -- upvalues: u99 (val), u100 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u99 * a1) ^ u100), 5))
end

v1[SkillAccelerator] = v2
local Reenforcements = Enum.SkillTreeNode.Reenforcements
v2 = {currency = "coins"}
local u105 = 100
local u106 = 1.5

function v2.calculate(a1) -- Line: 9 -- upvalues: u105 (val), u106 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u105 * a1) ^ u106), 5))
end

v1[Reenforcements] = v2
local BiggerBudget = Enum.SkillTreeNode.BiggerBudget
v2 = {currency = "coins"}
local u111 = 7
local u112 = 1.775

function v2.calculate(a1) -- Line: 9 -- upvalues: u111 (val), u112 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u111 * a1) ^ u112), 5))
end

v1[BiggerBudget] = v2
local Bandages = Enum.SkillTreeNode.Bandages
v2 = {currency = "coins"}
local u117 = 8
local u118 = 1.685

function v2.calculate(a1) -- Line: 9 -- upvalues: u117 (val), u118 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u117 * a1) ^ u118), 5))
end

v1[Bandages] = v2
return v1