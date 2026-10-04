-- Script path: ReplicatedStorage.Shared.Modules.EvolvedTowerUnlocksUtil
-- Decompile time: 2.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local TowerExpUtil = require(ReplicatedStorage.Shared.Modules.TowerExpUtil)
local Tower = Content("Tower")
local u18 = {}

local function getTowerProperties(a1) -- Line: 26 -- upvalues: Tower (val) -- types: a1: string
    local v1 = Tower:FindFirstChild(a1)
    local Stats = v1 and v1:FindFirstChild("Stats")
    if not Stats then
        return nil
    end
    return require(Stats).Properties
end

local function getTowerStats(a1) -- Line: 37 -- upvalues: Tower (val) -- types: a1: string
    local v1 = Tower:FindFirstChild(a1)
    local Stats = v1 and v1:FindFirstChild("Stats")
    if not Stats then
        return nil
    end
    return require(Stats)
end

function u18.getTowerStats(a1) -- Line: 47 -- upvalues: getTowerStats (val) -- types: a1: string
    return getTowerStats(a1)
end

function u18.getUnlockTree(a1) -- Line: 51 -- upvalues: Tower (val) -- types: a1: string
    local v1 = Tower:FindFirstChild(a1)
    local Stats = v1 and v1:FindFirstChild("Stats")
    local Properties = if Stats then require(Stats).Properties else nil
    return Properties and Properties.UpgradeUnlockTree
end

function u18.getUpgradeId(a1, a2) -- Line: 56 -- types: a1: number, a2: number?
    if a2 and a2 > 0 then
        return (("%*%*"):format(a1, (string.char(64 + a2))))
    end
    return (tostring(a1))
end

local function normalizeUpgradePath(a1, a2, a3) -- Line: 64
    -- upvalues: u18 (val)
    if a3 and a3 > 0 then
        local v1 = u18.getUpgradeStats(a1, a2, nil)
        if v1 and v1[1] then
            return a3
        end
        return nil
    end
    return nil
end

function u18.getUpgradeStats(a1, a2, a3) -- Line: 77
    -- upvalues: Tower (val)
    local v1 = Tower:FindFirstChild(a1)
    local Stats = v1 and v1:FindFirstChild("Stats")
    local v2 = if Stats then require(Stats) else nil
    local Stats_2 = v2 and v2.Stats and v2.Stats.Default.Upgrades
    local v3 = Stats_2 and Stats_2[a2]
    if typeof(v3) ~= "table" then
        return nil
    end
    if a3 and a3 > 0 then
        return v3[a3]
    end
    return v3
end

function u18.getTowerDisplayName(a1) -- Line: 97 -- upvalues: Tower (val) -- types: a1: string
    local v1 = Tower:FindFirstChild(a1)
    local Stats = v1 and v1:FindFirstChild("Stats")
    local Properties = if Stats then require(Stats).Properties else nil
    return Properties and Properties.DisplayName or a1
end

function u18.getNodeForUpgrade(a1, a2, a3) -- Line: 102
    -- upvalues: u18 (val)
    local v1
    local v2 = u18.getUnlockTree(a1)
    if not v2 then
        return nil, nil
    end
    local v3 = a3
    if not v3 then
        v1 = nil
    elseif v3 > 0 then
        local v4 = u18.getUpgradeStats(a1, a2, nil)
        v1 = if not v4 then nil else if not v4[1] then nil else v3
    else
        v1 = nil
    end
    v3 = u18.getUpgradeId(a2, v1)
    for i, j in v2.Nodes do
        if u18.getUpgradeId(j.Level, j.Path) == v3 then
            return i, j
        end
    end
    return nil, nil
end

function u18.getTowerLevel(a1, a2) -- Line: 124 -- upvalues: TowerExpUtil (val) -- types: a1: table?, a2: string
    if a1 and a1.TowerExp then
        return TowerExpUtil.getLevel(a1, a2)
    end
    return 0
end

function u18.canAccessUpgrade(a1, a2, a3, a4) -- Line: 135
    -- upvalues: u18 (val)
    local v1
    local v2 = u18.getUnlockTree(a2)
    if not v2 or a3 <= (v2.DefaultUnlockedThrough or 0) then
        return true
    end
    _, v1 = u18.getNodeForUpgrade(a2, a3, a4)
    if not v1 then
        return false
    end
    local v3 = u18.getTowerLevel(a1, a2)
    local RequiredTowerLevel = v1.RequiredTowerLevel or v1.Level
    return RequiredTowerLevel <= v3
end

function u18.getNodeLevel(a1, a2, a3) -- Line: 162 -- upvalues: u18 (val) -- types: a1: table?, a2: string, a3: table
    local v1 = u18.getTowerLevel(a1, a2)
    local RequiredTowerLevel = a3.RequiredTowerLevel or a3.Level
    if RequiredTowerLevel <= v1 then
        return 1
    end
    return 0
end

function u18.getNodeLevels(a1, a2) -- Line: 173 -- upvalues: u18 (val) -- types: a1: table?, a2: string
    local v1 = u18.getUnlockTree(a2)
    local v2 = {}
    if not v1 then
        return v2
    end
    for i, j in v1.Nodes do
        v2[i] = (u18.getNodeLevel(a1, a2, j))
    end
    return v2
end

function u18.getUpgradeLockMessage(a1, a2, a3, a4) -- Line: 191
    -- upvalues: u18 (val)
    local v1
    _, v1 = u18.getNodeForUpgrade(a2, a3, a4)
    if not v1 then
        return "This upgrade is locked!"
    end
    local v2 = u18.getTowerLevel(a1, a2)
    local RequiredTowerLevel = v1.RequiredTowerLevel or v1.Level
    return (("Requires %* Level %* (currently %*)"):format(u18.getTowerDisplayName(a2), RequiredTowerLevel, v2))
end

return u18