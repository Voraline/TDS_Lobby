-- Script path: ReplicatedStorage.Client.Controllers.Lobby.SkillTreeController
-- Decompile time: 2.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Cache = require(ReplicatedStorage.Client.Modules.Cache)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local EvolvedTowerUnlocksUtil = require(ReplicatedStorage.Shared.Modules.EvolvedTowerUnlocksUtil)
local SkillTree = require(script.SkillTree)
local Skills = require(ReplicatedStorage.Shared.Data.Skills)
local TowerExpUtil = require(ReplicatedStorage.Shared.Modules.TowerExpUtil)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local WorldCursor = require(script.WorldCursor)
local v1 = {}
local u51 = nil

local function _updateResearch(a1, a2) -- Line: 17
    -- upvalues: TowerExpUtil (val), EvolvedTowerUnlocksUtil (val), SkillTree (val)
    if not a1 then
        return
    end
    local v1 = {TowerExp = a2 or {}}
    local v2 = TowerExpUtil.getExp(v1, a1)
    SkillTree:UpdateResearchNodeStats(a1, EvolvedTowerUnlocksUtil.getNodeLevels(v1, a1), v2)
end

local function _updateSkills(a1) -- Line: 31 -- upvalues: Enum (val), Skills (val), SkillTree (val)
    local Locked, Unlocked, Unlocked_2, previousNode, v1, v2, v3, v4, v5, v6
    for i, j in Enum.SkillTreeNode do
        v4 = Skills.nodes[j]
        if v4 then
            v5 = a1[i] or 0
            SkillTree:UpdateNodeStats(i, v5)
            previousNode = v4.previousNode
            if not previousNode then
                v6 = SkillTree
                Unlocked_2 = Enum.SkillTileState.Unlocked
                v6:UpdateNodeState(i, Unlocked_2)
            else
                v1 = a1[Enum.SkillTreeNode.ToString(previousNode)] or 0
                v2 = v4.previousNodeLevel or 1
                if v1 == 0 then
                    v3 = SkillTree
                    Locked = Enum.SkillTileState.Locked
                    v3:UpdateNodeState(i, Locked)
                    SkillTree:UpdateNodeLevelsNeeded(i, 0)
                elseif v2 <= v1 then
                    v3 = SkillTree
                    Unlocked = Enum.SkillTileState.Unlocked
                    v3:UpdateNodeState(i, Unlocked)
                elseif v1 < v2 and v1 > 0 then
                    SkillTree:UpdateNodeLevelsNeeded(i, v1)
                end
            end
        end
    end
end

function v1.reset() -- Line: 67 -- upvalues: Cache (val), _updateSkills (val)
    (Cache("MigratedSkills.Data"):Get()):andThen(_updateSkills)
end

function v1.openResearch(a1) -- Line: 72
    -- upvalues: u51 (ref), Cache (val), SkillTree (val), ViewController (val), _updateResearch (val)
    u51 = u51 or Cache("TowerExp")
    local v1, v2 = SkillTree:OpenResearch(a1)
    if not v1 then
        ViewController:notifyError(v2 or "Unable to open tower research.")
        return
    end
    ;(u51:Get()):andThen(function(a1_2) -- Line: 81 -- upvalues: _updateResearch (upval), a1 (val)
        _updateResearch(a1, a1_2)
    end)
    ViewController:setView("TowerResearch")
end

function v1.init() -- Line: 88
    -- upvalues: WorldCursor (val), SkillTree (val), RunService (val), Cache (val), u51 (ref), _updateSkills (val)
    -- upvalues: _updateResearch (val), ViewController (val)
    WorldCursor:Init()
    SkillTree:Init()
    RunService.RenderStepped:Connect(function(a1) -- Line: 92 -- upvalues: SkillTree (upval) -- types: a1: number
        SkillTree:Render(a1)
    end)
    local v1 = Cache("MigratedSkills.Data")
    u51 = Cache("TowerExp")
    v1.Updated:Connect(_updateSkills)
    ;(v1:Get()):andThen(_updateSkills)
    u51.Updated:Connect(function(a1) -- Line: 101 -- upvalues: SkillTree (upval), _updateResearch (upval)
        local v1 = SkillTree.Atoms.ResearchTower()
        if v1 then
            _updateResearch(v1, a1)
        end
    end)
    ViewController:onViewChange(function(a1) -- Line: 108 -- upvalues: SkillTree (upval) -- types: a1: string
        if a1 == "Skills" then
            SkillTree:OpenSkills()
            SkillTree:Enable()
            return
        end
        if a1 == "TowerResearch" then
            SkillTree:Enable()
            return
        end
        SkillTree:Disable()
    end)
end

task.spawn(v1.init)
return v1