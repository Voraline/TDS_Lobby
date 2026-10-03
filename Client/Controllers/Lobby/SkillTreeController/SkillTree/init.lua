-- Script path: ReplicatedStorage.Client.Controllers.Lobby.SkillTreeController.SkillTree
-- Decompile time: 19.03 ms

local Density, deepAssign, getDeltaTable
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local CameraPan = require(script.Parent.CameraPan)
local Charm = require(ReplicatedStorage.Packages.Charm)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local EvolvedTowerUnlocksUtil = require(ReplicatedStorage.Shared.Modules.EvolvedTowerUnlocksUtil)
require(ReplicatedStorage.Shared.Modules.FastSignal)
local HexCoordinate = require(script.HexTree.HexTile.HexCoordinate)
local HexTree = require(script.HexTree)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local Skills = require(ReplicatedStorage.Shared.Data.Skills)
local TowerExpUtil = require(ReplicatedStorage.Shared.Modules.TowerExpUtil)
local WorldCursor = require(ReplicatedStorage.Client.Controllers.Lobby.SkillTreeController.WorldCursor)
local atom = Charm.atom
local subscribe = Charm.subscribe
local untracked = Charm.untracked
local Atmosphere = game.Lighting:FindFirstChild("Atmosphere")
if not Atmosphere then
    Density = 0
else
    Density = Atmosphere.Density
    if not Density then
        Density = 0
    end
end
local v1 = {
    PreviousMusic = "",
    NextResearchTreeIndex = 2,
    Enabled = false,
    RequestedTree = 1,
    Atoms = {
        CurrentTree = atom(0),
        SelectedTile = atom(nil),
        Mode = atom("Skills"),
        ResearchTower = atom(nil),
    },
    Connections = {},
    BackgroundPart = Instance.new("Part"),
    Trees = {},
    ResearchTreeIndices = {},
    ResearchNodeData = {},
}

local function toAssetId(a1) -- Line: 95
    if typeof(a1) == "number" then
        return (("rbxassetid://%*"):format(a1))
    end
    return a1
end

local function getPathLaneCoordinate(a1, a2, a3) -- Line: 103
    -- upvalues: HexCoordinate (val)
    local v1 = math.max(a2 - a1, 0)
    if a3 == 1 then
        return HexCoordinate.new(a1 + v1, -1)
    end
    if a3 == 2 then
        return HexCoordinate.new(a1 - 1 + v1, 1)
    end
    return HexCoordinate.new(a1 + v1, a3 - 1)
end

local function getResearchCoordinate(a1, a2, a3, a4) -- Line: 119
    -- upvalues: HexCoordinate (val), getPathLaneCoordinate (val)
    local Coordinate = a4 and (a4.Coordinate or a4.Coordinates or a4.HexCoordinate)
    if typeof(Coordinate) == "table" then
        local q = Coordinate.q or Coordinate.Q or Coordinate[1]
        local r = Coordinate.r or Coordinate.R or Coordinate[2]
        if typeof(q) == "number" and typeof(r) == "number" then
            return HexCoordinate.new(q, r)
        end
    end
    if a3 and a3 > 0 then
        return getPathLaneCoordinate(a1, a2, a3)
    end
    return HexCoordinate.new(a2, 0)
end

local function getDefaultResearchNodeId(a1, a2) -- Line: 142
    -- upvalues: EvolvedTowerUnlocksUtil (val)
    return (("__DefaultUpgrade%*"):format((EvolvedTowerUnlocksUtil.getUpgradeId(a1, a2))))
end

local function getUpgradePathCount(a1, a2) -- Line: 148
    -- upvalues: EvolvedTowerUnlocksUtil (val)
    local v1 = EvolvedTowerUnlocksUtil.getUpgradeStats(a1, a2)
    if typeof(v1) ~= "table" then
        return 0
    end
    local v2 = 0
    local v3 = nil
    local v4 = nil
    for i, j in v1, v3, v4 do
        if typeof(i) == "number" and typeof(j) == "table" then
            if j.Title ~= nil or j.Stats ~= nil then
                v2 = math.max(v2, i)
            end
        end
    end
    if v2 > 0 then
        return v2
    end
    return 1
end

function deepAssign(a1, a2) -- Line: 168 -- upvalues: deepAssign (val) -- types: a1: table, a2: table
    local v1
    local v2 = nil
    local v3 = nil
    local v4 = a1
    for i, j in a2, v2, v3 do
        if type(j) ~= "table" then
            v4[i] = j
        else
            v1 = v4[i]
            if not v1 then
                v4[i] = {}
            end
            deepAssign(v1, j)
        end
    end
end

function getDeltaTable(a1, a2) -- Line: 184 -- upvalues: getDeltaTable (val) -- types: a1: table, a2: table
    local v1, v2
    local v3 = {}
    for i, j in a2 do
        if type(j) == "table" then
            v1 = a1[i]
            if type(v1) == "table" then
                v2 = getDeltaTable(v1, j)
                if next(v2) then
                    v3[i] = v2
                end
            else
                v3[i] = j
            end
        elseif a1[i] ~= j then
            v3[i] = j
        end
    end
    return v3
end

local function getPathStats(a1, a2, a3) -- Line: 210
    -- upvalues: deepAssign (val)
    local v1
    local v2 = {}
    deepAssign(v2, a1.Defaults)
    if a2 < 1 then
        return v2, nil, false
    end
    local v3 = nil
    local v4 = false
    local v5, v6 = a1, a3
    for i = 1, a2 do
        v1 = v5.Upgrades[i]
        if v1 and v1[1] then
            v1 = if not v6 then nil else v1[v6]
            v4 = true
        end
        if not v1 then
            return nil, nil, v4
        end
        deepAssign(v2, v1.Stats)
        v3 = v1
    end
    return v2, v3, v4
end

local function processUpgradeText(a1) -- Line: 248 -- types: a1: string
    return (((a1:gsub("<[^>]+>", "")):gsub("%-%>", "→")):gsub(">", "→"))
end

local function getResearchUpgradeStats(a1, a2, a3) -- Line: 252
    -- upvalues: EvolvedTowerUnlocksUtil (val), getPathStats (val), getDeltaTable (val), Enum (val), Icons (val)
    local v1, v2
    local v3 = EvolvedTowerUnlocksUtil.getTowerStats(a1)
    local Stats = v3 and v3.Stats and v3.Stats.Default
    if typeof(Stats) ~= "table" then
        return {}
    end
    v1, _, v2 = getPathStats(Stats, a2 - 1, a3)
    local v4, v5, v6 = getPathStats(Stats, a2, a3)
    if a3 and a3 > 1 and not v2 and not v6 then
        return {}
    end
    if v1 and v4 and v5 then
        local v7, v8, v9
        local v10 = getDeltaTable(v1, v4)
        local v11 = {}
        if v10.Detections and next(v10.Detections) then
            for i, j in v10.Detections do
                v7 = Enum.Modifier.ToString(i) or ""
                v8 = Icons[v7]
                if j == true and v8 then
                    table.insert(v11, {Icon = v8, Text = ("%* Detection"):format(v7)})
                end
            end
        end
        local v12 = nil
        local v13 = nil
        for k, n in v10, v12, v13 do
            v7 = typeof(n)
            if v7 ~= "table" and v7 ~= "boolean" then
                v8 = Icons[k]
                if v8 then
                    v9 = v1[k]
                    table.insert(v11, {
                        Icon = v8,
                        Text = (((if v9 == nil then tostring(n) else ("%* → %*"):format(v9, n)):gsub("<[^>]+>", "")):gsub("%-%>", "→")):gsub(
                            ">",
                            "→"
                        ),
                    })
                end
            end
        end
        if v4.Extras then
            for m, i5 in v4.Extras do
                table.insert(v11, {Text = ((i5:gsub("<[^>]+>", "")):gsub("%-%>", "→")):gsub(">", "→")})
            end
        end
        if v5.Tooltips then
            v12 = nil
            v13 = nil
            for i6, i7 in v5.Tooltips, v12, v13 do
                v7 = {
                    Text = ((i7.ButtonText:gsub("<[^>]+>", "")):gsub("%-%>", "→")):gsub(">", "→"),
                    Expand = {},
                }
                for i8, i9 in i7.Content do
                    if i9.Text then
                        table.insert(v7.Expand, (((i9.Text:gsub("<[^>]+>", "")):gsub("%-%>", "→")):gsub(">", "→")))
                    end
                end
                table.insert(v11, v7)
            end
        end
        return v11
    end
    return {}
end

local function makeResearchSkillData(a1, a2, a3) -- Line: 340
    -- upvalues: EvolvedTowerUnlocksUtil (val), getResearchUpgradeStats (val), Enum (val)
    local v1 = EvolvedTowerUnlocksUtil.getUpgradeStats(a1, a3.Level, a3.Path)
    local RequiredTowerLevel = a3.RequiredTowerLevel
    if not RequiredTowerLevel then
        RequiredTowerLevel = a3.Level
    end
    local u15 = EvolvedTowerUnlocksUtil.getTowerDisplayName(a1)
    local u21 = EvolvedTowerUnlocksUtil.getUpgradeId(a3.Level, a3.Path)
    local v2 = {
        mode = "Research",
        skillLevelCap = 1,
        nodeId = a2,
        towerName = a1,
        upgradeLevel = a3.Level,
        upgradePath = a3.Path,
        requiredTowerLevel = RequiredTowerLevel,
        upgradeStats = getResearchUpgradeStats(a1, a3.Level, a3.Path),
    }
    local Icon = a3.Icon or v1 and v1.Image
    v2.icon = if typeof(Icon) ~= "number" then Icon else ("rbxassetid://%*"):format(Icon)
    local DisplayName = a3.DisplayName or v1 and v1.Title or u21
    v2.displayName = DisplayName
    v2.category = Enum.SkillTreeCategory.Strategy
    v2.previousNode = a3.PreviousNode
    v2.previousNodeLevel = RequiredTowerLevel

    function v2.costPerLevel() -- Line: 360 -- upvalues: RequiredTowerLevel (val)
        return {currency = "coins", amount = RequiredTowerLevel}
    end

    function v2.valuePerLevel(a1) -- Line: 366 -- types: a1: number
        return a1
    end

    function v2.displayText(a1) -- Line: 369 -- types: a1: number
        return (tostring(a1))
    end

    function v2.description() -- Line: 372 -- upvalues: u21 (val), u15 (val), RequiredTowerLevel (val)
        return (("Unlocks %* for %*. Earn Tower EXP to reach Level %*."):format(u21, u15, RequiredTowerLevel))
    end

    return v2
end

local function makeDefaultResearchSkillData(a1, a2, a3, a4) -- Line: 378
    -- upvalues: EvolvedTowerUnlocksUtil (val), getResearchUpgradeStats (val)
    local v1 = EvolvedTowerUnlocksUtil.getUpgradeStats(a1, a3, a4)
    local u13 = EvolvedTowerUnlocksUtil.getTowerDisplayName(a1)
    local u18 = EvolvedTowerUnlocksUtil.getUpgradeId(a3, a4)
    local v2 = {
        mode = "Research",
        requiredTowerLevel = 0,
        defaultUnlocked = true,
        category = -1,
        skillLevelCap = 1,
        previousNodeLevel = 1,
        nodeId = a2,
        towerName = a1,
        upgradeLevel = a3,
        upgradePath = a4,
        upgradeStats = getResearchUpgradeStats(a1, a3, a4),
    }
    local Image = v1 and v1.Image
    v2.icon = if typeof(Image) ~= "number" then Image else ("rbxassetid://%*"):format(Image)
    local Title = v1 and v1.Title or ("Upgrade %*"):format(u18)
    v2.displayName = Title

    function v2.costPerLevel() -- Line: 402
        return {currency = "coins", amount = 0}
    end

    function v2.valuePerLevel(a1) -- Line: 408 -- types: a1: number
        return a1
    end

    function v2.displayText(a1) -- Line: 411 -- types: a1: number
        return (tostring(a1))
    end

    function v2.description() -- Line: 414 -- upvalues: u13 (val), u18 (val)
        return (("%* upgrade %* is available by default."):format(u13, u18))
    end

    return v2
end

local function makeResearchRootSkillData(a1, a2) -- Line: 420
    -- upvalues: EvolvedTowerUnlocksUtil (val)
    local u5 = EvolvedTowerUnlocksUtil.getTowerDisplayName(a1)
    return {
        mode = "Research",
        nodeId = "__ResearchRoot",
        requiredTowerLevel = 0,
        defaultUnlocked = true,
        displayName = "Base Tower",
        category = -1,
        skillLevelCap = 1,
        previousNodeLevel = 1,
        towerName = a1,
        costPerLevel = function() -- Line: 433
            return {currency = "coins", amount = 0}
        end,
        valuePerLevel = function(a1) -- Line: 439 -- types: a1: number
            return a1
        end,
        displayText = function(a1) -- Line: 442 -- types: a1: number
            return (tostring(a1))
        end,
        description = function() -- Line: 445 -- upvalues: u5 (val), a2 (val)
            return (("%* upgrade tiers 0-%* are available by default."):format(u5, a2))
        end,
    }
end

local function getResearchUnlockProgress(a1, a2, a3) -- Line: 451
    -- upvalues: TowerExpUtil (val)
    if a3 <= 0 then
        return 1
    end
    local v1 = TowerExpUtil.getTotalExpForLevel(a1, a3)
    if v1 and not (v1 <= 0) then
        return (math.clamp(a2 / v1, 0, 1))
    end
    return 0
end

function v1.Init(a1) -- Line: 468
    a1:_generateTree()
    a1:_initializeBackground()
    a1:_initializeSubscriptions()
    a1:_initializeUserInput()
end

function v1:Enable() -- Line: 475
    -- upvalues: WorldCursor (val), CameraPan (val), Atmosphere (ref), TweenService (val), untracked (val)
    if self.Enabled then
        return
    end
    self.Enabled = true
    WorldCursor:Enable()
    CameraPan:Enable()
    self:_setLevel(self.RequestedTree)
    self.PreviousMusic = workspace.Music.Value
    workspace.Music.Value = "Matchmaking"
    Atmosphere = game.Lighting:FindFirstChild("Atmosphere")
    if Atmosphere then
        TweenService:Create(Atmosphere, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Density = 0}):Play()
    end

    local function fetchTile(a1) -- Line: 495 -- upvalues: untracked (upval), self (val) -- types: a1: userdata?
        if not a1 then
            return nil
        end
        local Name = a1.Name
        local v1 = self.Trees[(untracked(self.Atoms.CurrentTree))]
        local v2 = v1.Tiles[Name]
        if not v2 then
            return nil
        end
        return v2, v1
    end

    self.Connections.MouseEnter = WorldCursor.Events.MouseEnter:Connect(function(a1) -- Line: 512 -- upvalues: untracked (upval), self (val) -- types: a1: userdata?
        local v1
        if a1 then
            local Name = a1.Name
            local v2 = self.Trees[(untracked(self.Atoms.CurrentTree))].Tiles[Name]
            v1 = if v2 then v2 else nil
        else
            v1 = nil
        end
        if not v1 then
            return
        end
        v1:SetHovering(true)
    end)
    self.Connections.MouseLeave = WorldCursor.Events.MouseLeave:Connect(function(a1) -- Line: 521 -- upvalues: untracked (upval), self (val) -- types: a1: userdata?
        local v1
        if a1 then
            local Name = a1.Name
            local v2 = self.Trees[(untracked(self.Atoms.CurrentTree))].Tiles[Name]
            v1 = if v2 then v2 else nil
        else
            v1 = nil
        end
        if not v1 then
            return
        end
        v1:SetHovering(false)
    end)
    self.Connections.MouseDown = WorldCursor.Events.MouseDown:Connect(function(a1) -- Line: 530 -- upvalues: untracked (upval), self (val) -- types: a1: userdata?
        local v1
        if a1 then
            local Name = a1.Name
            local v2 = self.Trees[(untracked(self.Atoms.CurrentTree))].Tiles[Name]
            v1 = if v2 then v2 else nil
        else
            v1 = nil
        end
        if not v1 then
            return
        end
        v1:SetHeldDown(true)
    end)
    self.Connections.MouseUp = WorldCursor.Events.MouseUp:Connect(function(a1) -- Line: 539 -- upvalues: untracked (upval), self (val) -- types: a1: userdata?
        local v1
        if a1 then
            local Name = a1.Name
            local v2 = self.Trees[(untracked(self.Atoms.CurrentTree))].Tiles[Name]
            v1 = if v2 then v2 else nil
        else
            v1 = nil
        end
        if not v1 then
            return
        end
        v1:SetHeldDown(false)
    end)
    local u75 = nil
    self.Connections.Activated = WorldCursor.Events.Activated:Connect(function(a1) -- Line: 549
        -- upvalues: untracked (upval), self (val), CameraPan (upval), u75 (ref)
        local v1

        local function unselectTile() -- Line: 550
            -- upvalues: untracked (upval), self (upval), CameraPan (upval), u75 (upval)
            local v1 = untracked(self.Atoms.SelectedTile)
            local v2 = untracked(CameraPan.Atoms.LastDragTick)
            local v3 = untracked(CameraPan.Atoms.DownInputTick)
            local v4 = untracked(CameraPan.Atoms.UpInputTick)
            local v5 = 0.15 < tick() - v2
            local v6 = v4 - v3 < 0.1
            if v5 and not v6 then
                return
            end
            if v1 then
                local HexTileFromMesh = self:GetHexTileFromMesh(v1)
                if HexTileFromMesh then
                    HexTileFromMesh:SetSelected(false)
                end
            end
            self.Atoms.SelectedTile(nil)
            u75 = nil
        end

        if a1 then
            local Name = a1.Name
            local v2 = untracked(self.Atoms.CurrentTree)
            local v3 = self.Trees[v2]
            local v4 = v3.Tiles[Name]
            v1 = if v4 then v4 else nil
        else
            v1 = nil
        end
        if not v1 or not v1:IsHovering() then
            unselectTile()
            return
        end
        if v1:Select() then
            u75 = nil
            self.Atoms.SelectedTile(nil)
            return
        end
        if u75 then
            u75:SetSelected(false)
        end
        self.Atoms.SelectedTile(v1.Mesh)
        u75 = v1
    end)
end

function v1:Disable() -- Line: 602
    -- upvalues: untracked (val), WorldCursor (val), CameraPan (val), TweenService (val), Density (val)
    if not self.Enabled then
        return
    end
    self.Enabled = false
    local v1 = untracked(self.Atoms.SelectedTile)
    if v1 then
        self:GetHexTileFromMesh(v1):SetSelected(false)
    end
    self.Atoms.SelectedTile(nil)
    WorldCursor:Disable()
    CameraPan:Disable()
    self:_setLevel(0)
    workspace.Music.Value = self.PreviousMusic
    local Atmosphere = game.Lighting:FindFirstChild("Atmosphere")
    if Atmosphere then
        TweenService:Create(Atmosphere, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Density = Density}):Play()
    end
    for i, j in self.Connections do
        j:Disconnect()
    end
end

function v1:Render(...) -- Line: 635
    debug.profilebegin("SkillTree")
    for i, j in self.Trees do
        j:Render(...)
    end
    debug.profileend()
end

function v1.OpenSkills(a1) -- Line: 643
    a1.Atoms.Mode("Skills")
    a1.Atoms.ResearchTower(nil)
    a1.RequestedTree = 1
    a1:DeselectTile()
    if a1.Enabled then
        a1:_setLevel(1)
    end
end

function v1.OpenResearch(a1, a2) -- Line: 654 -- types: a1: table, a2: string
    local v1, v2 = a1:_generateResearchTree(a2)
    if not v1 then
        return false, v2
    end
    a1.Atoms.Mode("Research")
    a1.Atoms.ResearchTower(a2)
    a1.RequestedTree = v1
    a1:DeselectTile()
    if a1.Enabled then
        a1:_setLevel(v1)
    end
    return true, nil
end

function v1.UpdateNodeState(a1, a2, a3) -- Line: 672 -- upvalues: Enum (val) -- types: a1: table, a2: string
    local v1 = a1.Trees[1].Tiles[Enum.SkillTreeNode[a2]]
    if not v1 then
        warn("Tried to update state for missing tile:", a2)
        return
    end
    v1:SetState(a3)
end

function v1.UpdateNodeLevelsNeeded(a1, a2, a3) -- Line: 684
    -- upvalues: Enum (val)
    local v1 = a1.Trees[1].Tiles[Enum.SkillTreeNode[a2]]
    if not v1 then
        warn("Tried to update levels needed for missing tile:", a2)
        return
    end
    v1:SetLevelsNeeded(a3)
end

function v1.UpdateNodeStats(a1, a2, a3) -- Line: 696
    -- upvalues: Enum (val), Skills (val)
    local v1 = a1.Trees[1]
    local v2 = Enum.SkillTreeNode[a2]
    local v3 = v1.Tiles[v2]
    if not v3 then
        warn("Tried to update stats for missing tile:", a2)
        return
    end
    local v4 = Skills.nodes[v2]
    local v5 = v4.costPerLevel(a3 + 1)
    v3:SetSkillcap(v4.skillLevelCap)
    v3:SetLevel(a3)
    v3:SetPrice((math.floor(v5.amount)))
    v3:SetSkillPointCost((math.floor(v5.amount)))
    v3:SetSkillPriceNumber((math.floor(v5.amount)))
end

function v1.UpdateResearchNodeStats(a1, a2, a3, a4) -- Line: 717
    -- upvalues: TowerExpUtil (val), Enum (val)
    local v1 = a1.ResearchTreeIndices[a2]
    local v2 = v1 and a1.Trees[v1]
    local v3 = a1.ResearchNodeData[a2]
    if v2 and v3 then
        local v4, v5, v6, v7, v8, v9
        local v10 = nil
        local v11 = nil
        local v12, v13, v14 = a3, a2, a4
        for i, j in v3, v10, v11 do
            v4 = v2.Tiles[i]
            if v4 then
                v5 = j.requiredTowerLevel or 1
                if 0 < (if not j.defaultUnlocked then v12[i] or 0 else 1) then
                    v8 = 1
                elseif not (v5 <= 0) then
                    v9 = TowerExpUtil.getTotalExpForLevel(v13, v5)
                    v8 = if not v9 then 0 else if not (v9 <= 0) then math.clamp(v14 / v9, 0, 1) else 0
                else
                    v8 = 1
                end
                v4:SetSkillcap(j.skillLevelCap or 1)
                v4:SetPrice(v5)
                v4:SetSkillPointCost(0)
                v4:SetSkillPriceNumber(v5)
                v4:SetLevelsNeeded(v8)
                v4:SetLevel(v6)
                v4:SetState(if not v7 then Enum.SkillTileState.Locked else Enum.SkillTileState.Unlocked)
            end
        end
        return
    end
end

function v1:GetHexTileFromMesh(a2) -- Line: 757 -- upvalues: untracked (val) -- types: self: table, a2: userdata
    local v1 = self.Trees[(untracked(self.Atoms.CurrentTree))]
    if not v1 then
        return nil
    end
    return v1.Tiles[(v1:GetTileIndexFromMesh(a2))]
end

function v1.GetSkillDataForNode(a1, a2) -- Line: 770 -- upvalues: untracked (val), Skills (val)
    local v1 = a1.Trees[(untracked(a1.Atoms.CurrentTree))]
    local v2 = v1 and v1.Tiles[a2]
    return v2 and v2.SkillData or Skills.nodes[a2]
end

function v1:DeselectTile() -- Line: 778 -- upvalues: untracked (val)
    local v1 = untracked(self.Atoms.SelectedTile)
    if v1 then
        local HexTileFromMesh = self:GetHexTileFromMesh(v1)
        if HexTileFromMesh then
            HexTileFromMesh:SetSelected(false)
        end
    end
    self.Atoms.SelectedTile(nil)
end

function v1:_setLevel(a2) -- Line: 790 -- types: self: table, a2: number
    self.Atoms.CurrentTree(a2)
end

function v1:_generateTree() -- Line: 794 -- upvalues: Enum (val), HexCoordinate (val), HexTree (val), Skills (val)
    local SkillTreeNode = Enum.SkillTreeNode
    local v1 = {}
    v1[SkillTreeNode.EnhancedOptics] = (HexCoordinate.new(-1, 1))
    v1[SkillTreeNode.SplashDamage] = (HexCoordinate.new(-2, 2))
    v1[SkillTreeNode.FightDirty] = (HexCoordinate.new(-3, 2))
    v1[SkillTreeNode.Precision] = (HexCoordinate.new(-3, 3))
    v1[SkillTreeNode.ResellValue] = (HexCoordinate.new(-1, 0))
    v1[SkillTreeNode.BiggerBudget] = (HexCoordinate.new(-1, -1))
    v1[SkillTreeNode.Stonks] = (HexCoordinate.new(-2, -1))
    v1[SkillTreeNode.Scavenger] = (HexCoordinate.new(-2, -2))
    v1[SkillTreeNode.SkillAccelerator] = (HexCoordinate.new(0, 0))
    v1[SkillTreeNode.Scholar] = (HexCoordinate.new(1, 0))
    v1[SkillTreeNode.ExpandedBarracks] = (HexCoordinate.new(0, 1))
    v1[SkillTreeNode.Reenforcements] = (HexCoordinate.new(0, 2))
    v1[SkillTreeNode.Fortify] = (HexCoordinate.new(0, -1))
    v1[SkillTreeNode.Overhealing] = (HexCoordinate.new(1, -1))
    v1[SkillTreeNode.Bandages] = (HexCoordinate.new(2, -2))
    v1[SkillTreeNode.ExtremeConditioning] = (HexCoordinate.new(3, -2))
    v1[SkillTreeNode.BeefedUpMinions] = (HexCoordinate.new(4, -3))
    local v2 = HexCoordinate.new(0, 0)
    local v3 = HexTree.new(self.Atoms, v2.q, v2.r, v1)
    self.Trees[1] = v3
    local v4 = nil
    local v5 = nil
    for i, j in v1, v4, v5 do
        v3.Tiles[i]:SetState(Skills.nodes[i].previousNode == nil and Enum.SkillTileState.Unlocked or Enum.SkillTileState.Locked)
    end
end

function v1:_generateResearchTree(a2) -- Line: 839
    -- upvalues: EvolvedTowerUnlocksUtil (val), HexCoordinate (val), makeResearchRootSkillData (val)
    -- upvalues: getUpgradePathCount (val), makeDefaultResearchSkillData (val), getResearchCoordinate (val)
    -- upvalues: makeResearchSkillData (val), HexTree (val), Enum (val)
    local v1, v2, v3, v4, v5
    local v6 = self.ResearchTreeIndices[a2]
    if v6 then
        return v6, nil
    end
    local v7 = EvolvedTowerUnlocksUtil.getUnlockTree(a2)
    if not v7 then
        return nil, "This tower does not have a research tree."
    end
    local v8 = v7.DefaultUnlockedThrough or 0
    local v9 = {__ResearchRoot = HexCoordinate.new(0, 0)}
    local v10 = {__ResearchRoot = makeResearchRootSkillData(a2, v8)}
    for i = 1, v8 do
        v1 = getUpgradePathCount(a2, i)
        if v1 ~= 0 then
            if v1 ~= 1 then
                for j = 1, v1 do
                    v3 = ("__DefaultUpgrade%*"):format((EvolvedTowerUnlocksUtil.getUpgradeId(i, j)))
                    if not j or j <= 0 then
                        v4 = HexCoordinate.new(i, 0)
                    else
                        v5 = math.max(i - v8, 0)
                        v4 = if j == 1 then HexCoordinate.new(v8 + v5, -1) else if j ~= 2 then HexCoordinate.new(v8 + v5, j - 1) else HexCoordinate.new(v8 - 1 + v5, 1)
                    end
                    v9[v3] = v4
                    v10[v3] = (makeDefaultResearchSkillData(a2, v3, i, j))
                end
            else
                v2 = ("__DefaultUpgrade%*"):format((EvolvedTowerUnlocksUtil.getUpgradeId(i, nil)))
                v9[v2] = (HexCoordinate.new(i, 0))
                v10[v2] = (makeDefaultResearchSkillData(a2, v2, i, nil))
            end
        end
    end
    for k, n in v7.Nodes do
        v9[k] = (getResearchCoordinate(v8, n.Level, n.Path, n))
        v10[k] = (makeResearchSkillData(a2, k, n))
    end
    local NextResearchTreeIndex = self.NextResearchTreeIndex
    self.NextResearchTreeIndex = self.NextResearchTreeIndex + 1
    local v11 = HexTree.new(self.Atoms, 0, 0, v9, v10)
    self.Trees[NextResearchTreeIndex] = v11
    self.ResearchTreeIndices[a2] = NextResearchTreeIndex
    self.ResearchNodeData[a2] = v10
    v1 = nil
    v2 = nil
    for m, i5 in v10, v1, v2 do
        v3 = v11.Tiles[m]
        if v3 then
            v3:SetSkillcap(i5.skillLevelCap or 1)
            v3:SetPrice(i5.requiredTowerLevel or 0)
            v3:SetSkillPointCost(0)
            v3:SetSkillPriceNumber(i5.requiredTowerLevel or 0)
            v3:SetState(if not i5.defaultUnlocked then Enum.SkillTileState.Locked else Enum.SkillTileState.Unlocked)
            v3:SetLevel(if not i5.defaultUnlocked then 0 else 1)
        end
    end
    return NextResearchTreeIndex, nil
end

function v1:_initializeBackground() -- Line: 915 -- upvalues: ReplicatedStorage (val)
    self.BackgroundPart.Size = Vector3.new(2048, 1, 2048)
    self.BackgroundPart.Material = Enum.Material.Neon
    self.BackgroundPart.Color = Color3.fromRGB(50, 50, 50)
    self.BackgroundPart.Position = Vector3.new(0, -1100, 0)
    self.BackgroundPart.Anchored = true
    self.BackgroundPart.Parent = workspace
    self.BackgroundPart.Name = "SkillTreeBackground"
    local v1 = ReplicatedStorage.Assets.Effects.Client.SkillTreeBackgroundVFX:Clone()
    v1.Parent = self.BackgroundPart
end

function v1:_initializeSubscriptions() -- Line: 928 -- upvalues: subscribe (val)
    subscribe(self.Atoms.CurrentTree, function(a1, a2) -- Line: 931 -- upvalues: self (val)
        if a1 > 0 then
            self.Trees[a1]:SetActive(true)
        end
        if a2 and a2 > 0 then
            self.Trees[a2]:SetActive(false)
        end
    end)
end

function v1._initializeUserInput(a1) end

return v1