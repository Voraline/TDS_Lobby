-- Script path: ReplicatedStorage.Shared.Modules.TowerExpUtil
-- Decompile time: 3.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local GlobalBus = require(ReplicatedStorage.Shared.Modules.GlobalBus)
local Tower = Content("Tower")
local u18 = {}

local function getProperties(a1) -- Line: 10 -- upvalues: Tower (val) -- types: a1: string
    local v1 = Tower:FindFirstChild(a1)
    local Stats = v1 and v1:FindFirstChild("Stats")
    if not Stats then
        return nil
    end
    return require(Stats).Properties
end

local function getProgression(a1) -- Line: 21 -- upvalues: Tower (val) -- types: a1: string
    local v1 = Tower:FindFirstChild(a1)
    local Stats = v1 and v1:FindFirstChild("Stats")
    local Properties = if Stats then require(Stats).Properties else nil
    return Properties and Properties.Progression
end

function u18.getMaxLevel(a1) -- Line: 28 -- upvalues: Tower (val) -- types: a1: string
    local v1 = Tower:FindFirstChild(a1)
    local Stats = v1 and v1:FindFirstChild("Stats")
    local Properties = if Stats then require(Stats).Properties else nil
    local Progression = Properties and Properties.Progression
    return Progression and Progression.MaxLevel
end

function u18.getBuyAllLevelsProductId(a1) -- Line: 33 -- upvalues: Tower (val) -- types: a1: string
    local v1 = Tower:FindFirstChild(a1)
    local Stats = v1 and v1:FindFirstChild("Stats")
    local Properties = if Stats then require(Stats).Properties else nil
    return Properties and Properties.BuyAllLevelsProductId
end

function u18.getExpForLevel(a1, a2) -- Line: 39 -- upvalues: Tower (val) -- types: a1: string, a2: number
    local v1 = Tower:FindFirstChild(a1)
    local Stats = v1 and v1:FindFirstChild("Stats")
    local Properties = if Stats then require(Stats).Properties else nil
    local Progression = Properties and Properties.Progression
    if not Progression then
        return nil
    end
    return (math.floor(Progression.BaseExp * Progression.GrowthRate ^ (a2 - 1)))
end

function u18.getTotalExpForLevel(a1, a2) -- Line: 49 -- upvalues: Tower (val) -- types: a1: string, a2: number
    local v1 = Tower:FindFirstChild(a1)
    local Stats = v1 and v1:FindFirstChild("Stats")
    local Properties = if Stats then require(Stats).Properties else nil
    local Progression = Properties and Properties.Progression
    if not Progression then
        return nil
    end
    local v2 = 0
    for i = 1, a2 do
        v2 = v2 + math.floor(Progression.BaseExp * Progression.GrowthRate ^ (i - 1))
    end
    return v2
end

function u18.getLevel(a1, a2) -- Line: 63 -- upvalues: Tower (val) -- types: a1: table, a2: string
    local v1 = Tower:FindFirstChild(a2)
    local Stats = v1 and v1:FindFirstChild("Stats")
    local Properties = if Stats then require(Stats).Properties else nil
    local Progression = Properties and Properties.Progression
    if not Progression then
        return 0
    end
    local v2 = a1.TowerExp[a2] or 0
    v1 = 0
    local v3 = 0
    local MaxLevel = Progression.MaxLevel
    for i = 1, MaxLevel do
        v3 = v3 + math.floor(Progression.BaseExp * Progression.GrowthRate ^ (i - 1))
        if v2 < v3 then
            break
        end
        v1 = i
    end
    return v1
end

function u18.getExp(a1, a2) -- Line: 84 -- types: a1: table, a2: string
    return a1.TowerExp[a2] or 0
end

function u18.addExp(a1, a2, a3, a4) -- Line: 88
    -- upvalues: Tower (val), GlobalBus (val)
    local v1 = Tower:FindFirstChild(a3)
    local Stats = v1 and v1:FindFirstChild("Stats")
    local Properties = if Stats then require(Stats).Properties else nil
    if not Properties or not Properties.Progression then
        return 0
    end
    local TowerExp = a1.TowerExp or {}
    a1.TowerExp = TowerExp
    v1 = (a1.TowerExp[a3] or 0) + a4
    a1.TowerExp[a3] = v1
    GlobalBus.Fire("tower_exp_gained", a2, a3, a4, v1)
    return v1
end

function u18.getEvolvedTo(a1) -- Line: 110 -- upvalues: Tower (val) -- types: a1: string
    local v1 = Tower:FindFirstChild(a1)
    local Stats = v1 and v1:FindFirstChild("Stats")
    if not Stats then
        return nil
    end
    local v2 = require(Stats)
    return v2.Properties and v2.Properties.EvolvedTo
end

function u18.getEvolutionLevel(a1) -- Line: 122 -- upvalues: u18 (val), Tower (val) -- types: a1: string
    local v1 = u18.getEvolvedTo(a1)
    if not v1 then
        return nil
    end
    local v2 = Tower:FindFirstChild(v1)
    local Stats = v2 and v2:FindFirstChild("Stats")
    if not Stats then
        return nil
    end
    local v3 = require(Stats)
    return v3.Properties and v3.Properties.EvolutionLevel
end

function u18.getEvolutionPrice(a1) -- Line: 139 -- upvalues: u18 (val), Tower (val) -- types: a1: string
    local v1 = u18.getEvolvedTo(a1)
    if not v1 then
        return nil
    end
    local v2 = Tower:FindFirstChild(v1)
    local Stats = v2 and v2:FindFirstChild("Stats")
    if not Stats then
        return nil
    end
    local v3 = require(Stats)
    return v3.Properties and v3.Properties.Price
end

function u18.canEvolve(a1, a2) -- Line: 156 -- upvalues: u18 (val), Tower (val) -- types: a1: table, a2: string
    local v1 = u18.getEvolvedTo(a2)
    if not v1 then
        return false
    end
    local v2 = Tower:FindFirstChild(v1)
    local Stats = v2 and v2:FindFirstChild("Stats")
    if not Stats then
        return false
    end
    local v3 = require(Stats)
    local Properties = v3.Properties and v3.Properties.EvolutionLevel
    if not Properties then
        return false
    end
    return Properties <= u18.getLevel(a1, a2)
end

return u18