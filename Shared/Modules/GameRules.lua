-- Script path: ReplicatedStorage.Shared.Modules.GameRules
-- Decompile time: 2.65 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local u22 = RunService:IsServer()
local v1 = workspace:WaitForChild("Type").Value == "Game"
local u31 = {
    Invincible = false,
    InfiniteCash = false,
    InfiniteTowers = false,
    InfiniteConsumables = false,
    NoConsumableCooldowns = false,
    GoldenPerks = true,
    ProgressionDisabled = false,
    NoBumPenalty = false,
    GroupTax = true,
    EconomyOnHit = false,
    MusicEnabled = true,
    VoteSkipEnabled = true,
    HiddenWave = false,
    PVPEcoOnQueue = true,
    SkillsEnabled = true,
    UpgradeCostMultiplier = 1,
    TowerRangeMultiplier = 1,
    Skills = {},
}
local u33 = {}
local u34 = nil
local u35 = {}

function u35.Get(a1) -- Line: 75 -- upvalues: u31 (val) -- types: a1: string
    return u31[a1]
end

function u35.GetAll() -- Line: 80 -- upvalues: u31 (val)
    local v1
    local v2 = {}
    local v3 = nil
    local v4 = nil
    for i, j in u31, v3, v4 do
        v1 = if i ~= "Skills" then j else table.clone(j)
        v2[i] = v1
    end
    table.freeze(v2)
    return v2
end

function u35.GetSkill(a1) -- Line: 92 -- upvalues: u31 (val), Enum (val)
    return u31.SkillsEnabled and u31.Skills[Enum.SkillTreeNode.ToString(a1)]
end

function u35.SetSkill(a1, a2) -- Line: 98 -- upvalues: u31 (val), Enum (val), u22 (val), u34 (ref) -- types: a2: boolean
    local Skills = u31.Skills
    local v1 = Enum.SkillTreeNode.ToString(a1)
    if not Skills then
        u31.Skills = {}
        Skills = u31.Skills
    end
    if Skills[v1] == a2 then
        return
    end
    Skills[v1] = a2
    if u22 and u34 then
        u34:Set("Skills", Skills)
    end
end

function u35.Set(a1, a2) -- Line: 121 -- upvalues: u33 (val), u31 (val), u22 (val), u34 (ref) -- types: a1: string
    assert(a1 ~= "Skills", "Use GameRules.SetSkill to set skills")
    u33[a1] = (u33[a1] or 0) + 1
    u31[a1] = a2
    if u22 and u34 then
        u34:Set(a1, a2)
    end
end

function u35.Override(a1, a2) -- Line: 132 -- upvalues: u35 (val), u33 (val) -- types: a1: string
    local u5 = u35.Get(a1)
    u35.Set(a1, a2)
    local u12 = u33[a1]
    return function() -- Line: 136 -- upvalues: u33 (upval), a1 (val), u12 (val), u35 (upval), u5 (val)
        if u33[a1] == u12 then
            u35.Set(a1, u5)
        end
    end
end

function u35.HasSkill(a1) -- Line: 145 -- upvalues: u31 (val), Enum (val)
    return u31.SkillsEnabled and u31.Skills and u31.Skills[Enum.SkillTreeNode.ToString(a1)] == true
end

function u35.Has(a1) -- Line: 153 -- upvalues: u31 (val) -- types: a1: string
    return u31[a1] == true
end

function u35.Changed() -- Line: 158 -- upvalues: u34 (ref)
    return u34.Changed
end

function u35.GetRuleChangedEvent(a1) -- Line: 163 -- upvalues: u34 (ref) -- types: a1: string
    return u34:GetStateChangedSignal(a1)
end

if RunService:IsRunning() and v1 then
    if not u22 then
        u34 = (require(ReplicatedStorage.Client.Modules.TagReplicator)).getReplicatorEntityFromFolder(((ReplicatedStorage:WaitForChild("StateReplicators")):WaitForChild("GameRulesReplicator")))
        u34:Hook(u31)
    else
        local ServerTagReplicator = require(ServerStorage.Server.Modules.ServerTagReplicator)
        for i, j in Enum.SkillTreeNode do
            u31.Skills[i] = true
        end
        u34 = ServerTagReplicator.new("GameRules", u31)
        u34.ReplicationFolder.Name = "GameRulesReplicator"
    end
    return u35
end
return u35