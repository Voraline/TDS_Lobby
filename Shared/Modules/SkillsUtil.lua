-- Script path: ReplicatedStorage.Shared.Modules.SkillsUtil
-- Decompile time: 4.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Skills = require(ReplicatedStorage.Shared.Data.Skills)
local u15 = nil

local function getGameState() -- Line: 14 -- upvalues: u15 (ref), ReplicatedStorage (val)
    if not u15 then
        u15 = require(ReplicatedStorage.Shared.Modules.GameState)
    end
    return u15
end

local function setReplicatedGameState(a1, a2) -- Line: 22
    -- upvalues: u15 (ref), ReplicatedStorage (val)
    if not u15 then
        u15 = require(ReplicatedStorage.Shared.Modules.GameState)
    end
    local v1 = u15
    v1[a1] = a2
    if v1.Replicator then
        v1.Replicator:Set(a1, a2)
    end
end

local function getPlayerSkill(a1, a2) -- Line: 31
    -- upvalues: u15 (ref), ReplicatedStorage (val), Skills (val), Enum (val)
    if not u15 then
        u15 = require(ReplicatedStorage.Shared.Modules.GameState)
    end
    local Skills_2 = u15.Skills or {}
    local v1 = Skills_2[tostring(a1.UserId)] or {}
    local v2 = Skills.nodes[a2]
    local v3 = math.max(0, v1[(Enum.SkillTreeNode.ToString(a2))] or 0)
    if v2.skillLevelCap then
        v3 = math.min(v3, v2.skillLevelCap)
    end
    return v3
end

local function getAveragePlayerSkill(a1) -- Line: 46
    -- upvalues: Skills (val), u15 (ref), ReplicatedStorage (val), Enum (val)
    local v1
    local v2 = 0
    local v3 = 0
    local v4 = Skills.nodes[a1]
    if not u15 then
        u15 = require(ReplicatedStorage.Shared.Modules.GameState)
    end
    local Skills_2 = u15.Skills or {}
    local v5 = nil
    local v6 = nil
    for i, j in Skills_2, v5, v6 do
        v1 = j[Enum.SkillTreeNode.ToString(a1)]
        if v1 then
            if v4.skillLevelCap then
                v1 = math.min(v1, v4.skillLevelCap)
            end
            v2 = v2 + v1
            v3 = v3 + 1
        end
    end
    local v7 = math.max(0, (math.round(v3 > 0 and v2 / v3 or 0)))
    if v4.skillLevelCap then
        v7 = math.min(v7, v4.skillLevelCap)
    end
    return v7
end

local function getTotalCost(a1, a2) -- Line: 103 -- upvalues: Skills (val) -- types: a2: number
    local v1
    local v2 = Skills.nodes[a1]
    local v3 = 0
    local currency = nil
    if not v2 then
        return currency, 0
    end
    if v2.skillLevelCap then
        a2 = math.min(a2, v2.skillLevelCap)
    end
    for i = 1, a2 do
        v1 = v2.costPerLevel(i)
        currency = v1.currency
        v3 = v3 + math.floor(v1.amount)
    end
    return currency, v3
end

local function evaluateSkill(a1, a2) -- Line: 156 -- upvalues: Skills (val) -- types: a2: number
    local v1 = Skills.nodes[a1]
    if not v1 then
        return 0
    end
    if v1.skillLevelCap then
        a2 = math.min(a2, v1.skillLevelCap)
    end
    return v1.valuePerLevel((math.max(0, a2)))
end

return {
    skill = getPlayerSkill,
    avgSkill = getAveragePlayerSkill,
    skillEval = function(a1, a2) -- Line: 170 -- upvalues: getPlayerSkill (val), evaluateSkill (val) -- types: a1: userdata
        return evaluateSkill(a2, (getPlayerSkill(a1, a2)))
    end,
    avgSkillEval = function(a1) -- Line: 175 -- upvalues: getAveragePlayerSkill (val), evaluateSkill (val)
        return evaluateSkill(a1, (getAveragePlayerSkill(a1)))
    end,
    evaluate = evaluateSkill,
    getSkillState = function(a1, a2) -- Line: 180 -- upvalues: u15 (ref), ReplicatedStorage (val) -- types: a1: userdata
        if not u15 then
            u15 = require(ReplicatedStorage.Shared.Modules.GameState)
        end
        local SkillStates = u15.SkillStates or {}
        local v1 = SkillStates[tostring(a1.UserId)]
        if not v1 then
            return nil
        end
        return v1[tostring(a2)]
    end,
    setSkillState = function(a1, a2, a3) -- Line: 190 -- upvalues: u15 (ref), ReplicatedStorage (val) -- types: a1: userdata
        local v1 = tostring(a1.UserId)
        local v2 = tostring(a2)
        if not u15 then
            u15 = require(ReplicatedStorage.Shared.Modules.GameState)
        end
        local v3 = table.clone(u15.SkillStates or {})
        local v4 = table.clone(v3[v1] or {})
        v4[v2] = a3
        v3[v1] = v4
        if not u15 then
            u15 = require(ReplicatedStorage.Shared.Modules.GameState)
        end
        local v5 = u15
        v5.SkillStates = v3
        if v5.Replicator then
            v5.Replicator:Set("SkillStates", v3)
        end
    end,
    resetSkillStates = function() -- Line: 203 -- upvalues: u15 (ref), ReplicatedStorage (val)
        local v1 = {}
        if not u15 then
            u15 = require(ReplicatedStorage.Shared.Modules.GameState)
        end
        local v2 = u15
        v2.SkillStates = v1
        if v2.Replicator then
            v2.Replicator:Set("SkillStates", v1)
        end
    end,
    getVersionedTotalCost = function(a1, a2, a3) -- Line: 76 -- upvalues: Skills (val) -- types: a2: number, a3: number
        local v1 = Skills.previousVersions[a2]
        local v2 = v1 and v1[a1]
        local v3 = Skills.nodes[a1]
        if v2 and v3 then
            local v4 = 0
            for i = 1, if not v3.skillLevelCap then a3 else math.min(a3, v3.skillLevelCap) do
                v4 = v4 + v2.calculate(i, a2)
            end
            return v2.currency, v4
        end
        return nil, 0
    end,
    getRefundUpfrontCost = function(a1) -- Line: 152 -- types: a1: number
        return (math.min(5000, a1 * 200 + 200))
    end,
    getRefund = function(a1) -- Line: 136 -- upvalues: Enum (val), getTotalCost (val) -- types: a1: table
        local v1, v2, v3, v4
        local v5 = 0
        local v6 = nil
        local v7 = nil
        for i, j in a1, v6, v7 do
            v2 = Enum.SkillTreeNode[i]
            if v2 and not (j < 1) then
                v4, v1 = getTotalCost(v2, j)
                if v4 ~= "coins" then
                    assert(false, (("Expected currency to be \"coins\", got %*"):format(v4)))
                    v3 = nil
                else
                    v3 = v1
                end
                v5 = v5 + v3 * 0.95
            end
        end
        return v5
    end,
    getTotalSkillCreditCost = function(a1, a2) -- Line: 127 -- upvalues: getTotalCost (val) -- types: a2: number
        local v1, v2 = getTotalCost(a1, a2)
        if v1 == "coins" then
            return v2
        end
        assert(false, (("Expected currency to be \"coins\", got %*"):format(v1)))
    end,
    getTotalCost = getTotalCost,
}