-- Script path: ReplicatedStorage.Content.Tower.EvolvedOperator.Animator
-- Decompile time: 63.23 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local Tags = require(ReplicatedStorage.Shared.Modules.StatusEffects.Tags)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local Sounds = require(script.Parent.Sounds)
local v1 = {}
v1.__index = v1
local u50 = Random.new()
local u51 = {"Head", "Helmet", "Mask"}
local u55 = {"HumanoidRootPart", "UpperTorso", "Torso"}
local u59 = nil
local u60 = nil
local u61 = nil
local u62 = nil
local u63 = {}
local u64 = {}
local u65 = {}
local u66 = {}
local u67 = nil
local u68 = nil
local u69 = 0.25

local function watchValue(a1, a2) -- Line: 57 -- upvalues: RunService (val)
    local u2 = nil
    local u3 = false
    local u4 = false
    local u5 = nil

    local function disconnect() -- Line: 63 -- upvalues: u4 (ref), u5 (ref)
        u4 = true
        if u5 then
            u5:Disconnect()
        end
    end

    local function update() -- Line: 70 -- upvalues: u4 (ref), a1 (val), u3 (ref), u2 (ref), a2 (val), disconnect (val)
        if u4 then
            return
        end
        local v1 = a1()
        if u3 and v1 == u2 then
            return
        end
        u3 = true
        u2 = v1
        a2(v1, disconnect)
    end

    task.defer(update)
    local v1 = RunService.Heartbeat:Connect(update)
    return disconnect
end

local function getOperatorEffects() -- Line: 91 -- upvalues: u59 (ref), ReplicatedStorage (val)
    if u59 and u59.Parent then
        return u59
    end
    u59 = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Misc")):WaitForChild("Operator")
    return u59
end

local function getParticleLODController() -- Line: 104 -- upvalues: u60 (ref), ReplicatedStorage (val)
    if not u60 then
        u60 = require(ReplicatedStorage.Client.Modules.ParticleLODController)
    end
    return u60
end

local function getPlayerReplicator() -- Line: 112 -- upvalues: u61 (ref), ReplicatedStorage (val)
    if not u61 then
        u61 = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
    end
    return u61
end

local function getTowerReplicator() -- Line: 120 -- upvalues: u62 (ref), ReplicatedStorage (val)
    if not u62 then
        u62 = require(ReplicatedStorage.Client.Modules.Replicators.TowerReplicator)
    end
    return u62
end

local function getTrashContainer() -- Line: 128
    return workspace:FindFirstChild("Trash") or workspace
end

local function prepareVFXRoot(a1) -- Line: 132 -- types: a1: userdata
    if a1:IsA("BasePart") then
        a1.Anchored = true
        a1.CanCollide = false
        a1.CanTouch = false
        a1.CanQuery = false
        a1.CastShadow = false
    end
    for i, j in a1:GetDescendants() do
        if j:IsA("BasePart") then
            j.Anchored = true
            j.CanCollide = false
            j.CanTouch = false
            j.CanQuery = false
            j.CastShadow = false
        end
    end
end

local function setVFXEnabled(a1, a2) -- Line: 152 -- types: a1: userdata, a2: boolean
    for i, j in a1:GetDescendants() do
        if j:IsA("ParticleEmitter") or j:IsA("Beam") or j:IsA("Trail") then
            j.Enabled = a2
        end
    end
end

local function getEffectPosition(a1) -- Line: 164 -- types: a1: userdata
    if a1:IsA("Attachment") then
        return a1.WorldPosition
    end
    if a1:IsA("BasePart") then
        return a1.Position
    end
    if a1:IsA("Model") then
        local PrimaryPart = a1.PrimaryPart or a1:FindFirstChildWhichIsA("BasePart", true)
        if PrimaryPart then
            return PrimaryPart.Position
        end
        return a1:GetPivot().Position
    end
    local Attachment = a1:FindFirstChildWhichIsA("Attachment", true)
    if Attachment then
        return Attachment.WorldPosition
    end
    local BasePart = a1:FindFirstChildWhichIsA("BasePart", true)
    if BasePart then
        return BasePart.Position
    end
    return (Vector3.new(0, 0, 0))
end

local function setEffectCFrame(a1, a2) -- Line: 187 -- types: a1: userdata, a2: userdata
    if a1:IsA("Model") then
        a1:PivotTo(a2)
        return
    end
    if a1:IsA("BasePart") or a1:IsA("Attachment") then
        a1.CFrame = a2
    end
end

local function getTowerValue(a1, a2) -- Line: 195 -- types: a2: string
    if not a1 then
        return nil
    end
    if a1[a2] ~= nil then
        return a1[a2]
    end
    if a1.State and a1.State[a2] ~= nil then
        return a1.State[a2]
    end
    if a1.Replicator then
        return a1.Replicator:Get(a2)
    end
    return nil
end

local function getTowerAttributes(a1) -- Line: 215
    return a1 and a1.Stats and a1.Stats.Attributes or {}
end

local function statusEffectRendererHasTag(a1, a2) -- Line: 219 -- types: a2: string
    if not a1 then
        return false
    end
    if a1.hasAnyWithTag then
        return a1:hasAnyWithTag(a2)
    end
    local _activeEffects = a1._activeEffects or {}
    local v1 = nil
    local v2 = nil
    for i, j in _activeEffects, v1, v2 do
        for k, n in j.tags or {} do
            if n == v3 then
                return true
            end
        end
    end
    return false
end

local function isTowerDisabled(a1) -- Line: 239 -- upvalues: statusEffectRendererHasTag (val), Tags (val)
    return statusEffectRendererHasTag(a1 and a1.StatusEffectRenderer, Tags.TowerDisabled)
end

local function getTowerName(a1) -- Line: 244
    return a1 and (a1.Name or a1.TowerName or a1.Type or a1.State and a1.State.Type)
end

local function isOperatorTower(a1) -- Line: 249
    local v1 = false
    if (a1 and (a1.Name or a1.TowerName or a1.Type or a1.State and a1.State.Type)) == "EvolvedOperator" then
        v1 = false
        if a1.Model ~= nil then
            v1 = a1.Model.Parent ~= nil
        end
    end
    return v1
end

local function getCoordinationRange(a1) -- Line: 253
    return (a1 and a1.Stats and a1.Stats.Attributes or {}).CoordinationRange or 0
end

local function getPlacementCoordinationRange(a1) -- Line: 258
    local v1 = (a1 and a1.Stats and a1.Stats.Attributes or {}).CoordinationRange or 0
    if v1 > 0 then
        return v1
    end
    local Asset = a1 and a1.Asset and a1.Asset.Stats and a1.Asset.Stats.Default and a1.Asset.Stats.Default.Upgrades
    if Asset then
        local CoordinationDamage, CoordinationRange, Stats
        local v2 = nil
        local v3 = nil
        for i, j in Asset, v2, v3 do
            Stats = j.Stats and j.Stats.Attributes
            CoordinationRange = Stats and Stats.CoordinationRange or 0
            CoordinationDamage = Stats and Stats.CoordinationDamage or 0
            if CoordinationRange > 0 and CoordinationDamage > 0 then
                return CoordinationRange
            end
        end
    end
    return 6.5
end

local function hasCoordination(a1) -- Line: 284 -- upvalues: statusEffectRendererHasTag (val), Tags (val)
    if statusEffectRendererHasTag(a1 and a1.StatusEffectRenderer, Tags.TowerDisabled) then
        return false
    end
    local Attributes = a1 and a1.Stats and a1.Stats.Attributes or {}
    local v1 = false
    if 0 < (Attributes.CoordinationDamage or 0) then
        v1 = 0 < (Attributes.CoordinationRange or 0)
    end
    return v1
end

local function hasSharedOptics(a1) -- Line: 294 -- upvalues: statusEffectRendererHasTag (val), Tags (val)
    if statusEffectRendererHasTag(a1 and a1.StatusEffectRenderer, Tags.TowerDisabled) then
        return false
    end
    local Upgrade = if a1 then if a1.Upgrade == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("Upgrade") else if a1.State.Upgrade == nil then if not a1.Replicator then nil else a1.Replicator:Get("Upgrade") else a1.State.Upgrade else a1.Upgrade else nil
    local v1 = true
    if (a1 and a1.Stats and a1.Stats.Attributes or {}).SharedOptics ~= true then
        v1 = false
        if typeof(Upgrade) == "number" then
            v1 = Upgrade >= 5
        end
    end
    return v1
end

local function getTowerTeam(a1) -- Line: 304 -- upvalues: getTowerValue (val)
    return getTowerValue(a1, "Team")
end

local function areAllied(a1, a2) -- Line: 308
    local Team = if a1 then if a1.Team == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("Team") else if a1.State.Team == nil then if not a1.Replicator then nil else a1.Replicator:Get("Team") else a1.State.Team else a1.Team else nil
    local Team_2 = if a2 then if a2.Team == nil then if not a2.State then if not a2.Replicator then nil else a2.Replicator:Get("Team") else if a2.State.Team == nil then if not a2.Replicator then nil else a2.Replicator:Get("Team") else a2.State.Team else a2.Team else nil
    if Team == nil and Team_2 == nil then
        local OwnerId = if a1 then if a1.OwnerId == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("OwnerId") else if a1.State.OwnerId == nil then if not a1.Replicator then nil else a1.Replicator:Get("OwnerId") else a1.State.OwnerId else a1.OwnerId else nil
        local v1 = false
        if OwnerId ~= nil then
            v1 = OwnerId == (if a2 then if a2.OwnerId == nil then if not a2.State then if not a2.Replicator then nil else a2.Replicator:Get("OwnerId") else if a2.State.OwnerId == nil then if not a2.Replicator then nil else a2.Replicator:Get("OwnerId") else a2.State.OwnerId else a2.OwnerId else nil)
        end
        return v1
    end
    return Team == Team_2
end

local function getTowerPosition(a1) -- Line: 320
    local Model = a1 and a1.Model
    if Model and Model.Parent then
        local PrimaryPart = Model.PrimaryPart
        if not PrimaryPart then
            return Model:GetPivot().Position
        end
        local HeightOffset = PrimaryPart:FindFirstChild("HeightOffset")
        if HeightOffset and HeightOffset:IsA("Attachment") then
            return HeightOffset.WorldPosition
        end
        return PrimaryPart.Position
    end
    return nil
end

local function getModelPosition(a1) -- Line: 339 -- types: a1: userdata
    if a1 and a1.Parent then
        local PrimaryPart = a1.PrimaryPart
        if not PrimaryPart then
            return a1:GetPivot().Position
        end
        local HeightOffset = PrimaryPart:FindFirstChild("HeightOffset")
        if HeightOffset and HeightOffset:IsA("Attachment") then
            return HeightOffset.WorldPosition
        end
        return PrimaryPart.Position
    end
    return nil
end

local function getModelEffectCFrame(a1) -- Line: 357 -- types: a1: userdata
    local WorldPosition
    if not a1 then
        WorldPosition = nil
    elseif a1.Parent then
        local PrimaryPart = a1.PrimaryPart
        if not PrimaryPart then
            WorldPosition = a1:GetPivot().Position
        else
            local HeightOffset = PrimaryPart:FindFirstChild("HeightOffset")
            WorldPosition = if not HeightOffset then PrimaryPart.Position else if not HeightOffset:IsA("Attachment") then PrimaryPart.Position else HeightOffset.WorldPosition
        end
    else
        WorldPosition = nil
    end
    if not WorldPosition then
        return nil
    end
    local PrimaryPart_2 = a1.PrimaryPart
    if PrimaryPart_2 then
        return (CFrame.new(WorldPosition)) * (PrimaryPart_2.CFrame - PrimaryPart_2.CFrame.Position)
    end
    return CFrame.new(WorldPosition)
end

local function getModelRootPart(a1) -- Line: 371 -- types: a1: userdata
    return a1.PrimaryPart or a1:FindFirstChild("HumanoidRootPart") or a1:FindFirstChild("RootPart") or a1:FindFirstChildWhichIsA("BasePart")
end

local function getModelRootCFrame(a1) -- Line: 378 -- types: a1: userdata
    if a1 and a1.Parent then
        local PrimaryPart = a1.PrimaryPart or a1:FindFirstChild("HumanoidRootPart") or a1:FindFirstChild("RootPart") or a1:FindFirstChildWhichIsA("BasePart")
        return PrimaryPart and PrimaryPart.CFrame or a1:GetPivot()
    end
    return nil
end

local function getModelRootPosition(a1) -- Line: 387 -- types: a1: userdata
    local CFrame
    if not a1 then
        CFrame = nil
    elseif a1.Parent then
        local PrimaryPart = a1.PrimaryPart or a1:FindFirstChild("HumanoidRootPart") or a1:FindFirstChild("RootPart") or a1:FindFirstChildWhichIsA("BasePart")
        CFrame = PrimaryPart and PrimaryPart.CFrame or a1:GetPivot()
    else
        CFrame = nil
    end
    return CFrame and CFrame.Position
end

local function getTowerRootPosition(a1) -- Line: 392
    local Model = a1 and a1.Model
    if Model and Model.Parent then
        local CFrame
        if not Model then
            CFrame = nil
        elseif Model.Parent then
            local PrimaryPart = Model.PrimaryPart or Model:FindFirstChild("HumanoidRootPart") or Model:FindFirstChild("RootPart") or Model:FindFirstChildWhichIsA("BasePart")
            CFrame = PrimaryPart and PrimaryPart.CFrame or Model:GetPivot()
        else
            CFrame = nil
        end
        return CFrame and CFrame.Position
    end
    return nil
end

local function getTowerAttackRange(a1) -- Line: 401
    if a1 and type(a1.GetRange) == "function" then
        local success, result = pcall(function() -- Line: 403 -- upvalues: a1 (val)
            return a1:GetRange()
        end)
        if success and typeof(result) == "number" then
            return result
        end
    end
    local Range = if a1 then if a1.Range == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("Range") else if a1.State.Range == nil then if not a1.Replicator then nil else a1.Replicator:Get("Range") else a1.State.Range else a1.Range else nil
    if typeof(Range) == "number" then
        return Range
    end
    return 0
end

local function planarDistanceSquared(a1, a2) -- Line: 416 -- types: a1: vector, a2: vector
    local v1 = a1.X - a2.X
    local v2 = a1.Z - a2.Z
    return v1 * v1 + v2 * v2
end

local function getTowerUID(a1) -- Line: 423
    local UID = if a1 then if a1.UID == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("UID") else if a1.State.UID == nil then if not a1.Replicator then nil else a1.Replicator:Get("UID") else a1.State.UID else a1.UID else nil
    if UID ~= nil then
        return (tostring(UID))
    end
    return (tostring(a1.Model))
end

local function getMuzzleFromModel(a1) -- Line: 432 -- types: a1: userdata
    local Weapon = a1:FindFirstChild("Weapon")
    local Gun = Weapon and Weapon:FindFirstChild("Gun")
    local Configuration = Gun and Gun:FindFirstChild("Configuration")
    local Attachments = Configuration and Configuration:FindFirstChild("Attachments")
    local Muzzle = Attachments and Attachments:FindFirstChild("Muzzle")
    if Muzzle and Muzzle:IsA("ObjectValue") and Muzzle.Value and Muzzle.Value:IsA("Attachment") then
        return Muzzle.Value
    end
    return nil
end

local function getSharedOpticsAnchorParent(a1) -- Line: 451
    -- upvalues: u55 (val), getMuzzleFromModel (val)
    local v1
    if a1.PrimaryPart then
        return a1.PrimaryPart
    end
    for i, j in u55 do
        v1 = a1:FindFirstChild(j, true)
        if v1 and v1:IsA("BasePart") then
            return v1
        end
    end
    local v2 = getMuzzleFromModel(a1)
    if v2 and v2.Parent and v2.Parent:IsA("BasePart") then
        return v2.Parent
    end
    return a1:FindFirstChildWhichIsA("BasePart", true)
end

local function getSharedOpticsWorldPosition(a1) -- Line: 471 -- upvalues: u51 (val) -- types: a1: userdata
    local v1
    for i, j in u51 do
        v1 = a1:FindFirstChild(j, true)
        if v1 and v1:IsA("BasePart") then
            return v1.Position + Vector3.new(0, 1, 0) * (v1.Size.Y * 0.5 + 0.8)
        end
    end
    local BoundingBox, BoundingBox_2 = a1:GetBoundingBox()
    return BoundingBox.Position + Vector3.new(0, 1, 0) * (BoundingBox_2.Y * 0.5 + 0.35)
end

local function getSharedOpticsParent(a1) -- Line: 484
    -- upvalues: getSharedOpticsAnchorParent (val), getSharedOpticsWorldPosition (val)
    local v1 = getSharedOpticsAnchorParent(a1)
    local v2 = getSharedOpticsWorldPosition(a1)
    if v1 and v2 then
        return v1, v1.CFrame:ToObjectSpace((CFrame.new(v2)))
    end
    return nil, nil
end

local function shouldSwapTowerOrder(a1, a2) -- Line: 494
    local UID = if a1 then if a1.UID == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("UID") else if a1.State.UID == nil then if not a1.Replicator then nil else a1.Replicator:Get("UID") else a1.State.UID else a1.UID else nil
    local UID_2 = if a2 then if a2.UID == nil then if not a2.State then if not a2.Replicator then nil else a2.Replicator:Get("UID") else if a2.State.UID == nil then if not a2.Replicator then nil else a2.Replicator:Get("UID") else a2.State.UID else a2.UID else nil
    if typeof(UID) == "number" and typeof(UID_2) == "number" then
        return UID_2 < UID
    end
    local v1 = tostring(UID or a1.Model)
    return tostring(UID_2 or a2.Model) < v1
end

local function getPairKey(a1, a2) -- Line: 505 -- upvalues: shouldSwapTowerOrder (val)
    if shouldSwapTowerOrder(a1, a2) then
        local v1 = a2
        a2 = a1
        a1 = v1
    end
    local UID = if a1 then if a1.UID == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("UID") else if a1.State.UID == nil then if not a1.Replicator then nil else a1.Replicator:Get("UID") else a1.State.UID else a1.UID else nil
    local v2 = if UID == nil then tostring(a1.Model) else tostring(UID)
    local UID_2 = if a2 then if a2.UID == nil then if not a2.State then if not a2.Replicator then nil else a2.Replicator:Get("UID") else if a2.State.UID == nil then if not a2.Replicator then nil else a2.Replicator:Get("UID") else a2.State.UID else a2.UID else nil
    return (("%*:%*"):format(v2, if UID_2 == nil then tostring(a2.Model) else tostring(UID_2))), a1, a2
end

local function canShowCoordinationAura(a1, a2) -- Line: 513
    -- upvalues: statusEffectRendererHasTag (val), Tags (val), getTowerPosition (val)
    local v1 = false
    if (a1 and (a1.Name or a1.TowerName or a1.Type or a1.State and a1.State.Type)) == "EvolvedOperator" then
        v1 = false
        if a1.Model ~= nil then
            v1 = a1.Model.Parent ~= nil
        end
    end
    if v1 then
        v1 = false
        if (a2 and (a2.Name or a2.TowerName or a2.Type or a2.State and a2.State.Type)) == "EvolvedOperator" then
            v1 = false
            if a2.Model ~= nil then
                v1 = a2.Model.Parent ~= nil
            end
        end
        if v1 then
            if not statusEffectRendererHasTag(a1 and a1.StatusEffectRenderer, Tags.TowerDisabled) then
                local Attributes = a1 and a1.Stats and a1.Stats.Attributes or {}
                v1 = false
                if 0 < (Attributes.CoordinationDamage or 0) then
                    v1 = 0 < (Attributes.CoordinationRange or 0)
                end
            else
                v1 = false
            end
            if v1 then
                if not statusEffectRendererHasTag(a2 and a2.StatusEffectRenderer, Tags.TowerDisabled) then
                    local Attributes_2 = a2 and a2.Stats and a2.Stats.Attributes or {}
                    v1 = false
                    if 0 < (Attributes_2.CoordinationDamage or 0) then
                        v1 = 0 < (Attributes_2.CoordinationRange or 0)
                    end
                else
                    v1 = false
                end
                if v1 then
                    local Team = if a1 then if a1.Team == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("Team") else if a1.State.Team == nil then if not a1.Replicator then nil else a1.Replicator:Get("Team") else a1.State.Team else a1.Team else nil
                    local Team_2 = if a2 then if a2.Team == nil then if not a2.State then if not a2.Replicator then nil else a2.Replicator:Get("Team") else if a2.State.Team == nil then if not a2.Replicator then nil else a2.Replicator:Get("Team") else a2.State.Team else a2.Team else nil
                    if Team ~= nil then
                        v1 = Team == Team_2
                    elseif Team_2 == nil then
                        local OwnerId = if a1 then if a1.OwnerId == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("OwnerId") else if a1.State.OwnerId == nil then if not a1.Replicator then nil else a1.Replicator:Get("OwnerId") else a1.State.OwnerId else a1.OwnerId else nil
                        v1 = false
                        if OwnerId ~= nil then
                            v1 = OwnerId == (if a2 then if a2.OwnerId == nil then if not a2.State then if not a2.Replicator then nil else a2.Replicator:Get("OwnerId") else if a2.State.OwnerId == nil then if not a2.Replicator then nil else a2.Replicator:Get("OwnerId") else a2.State.OwnerId else a2.OwnerId else nil)
                        end
                    else
                        v1 = Team == Team_2
                    end
                    if v1 then
                        v1 = getTowerPosition(a1)
                        local v2 = getTowerPosition(a2)
                        if v1 and v2 then
                            local v3 = v1.X - v2.X
                            local v4 = v1.Z - v2.Z
                            local v5 = v3 * v3 + v4 * v4
                            v3 = (a1 and a1.Stats and a1.Stats.Attributes or {}).CoordinationRange or 0
                            v4 = (a2 and a2.Stats and a2.Stats.Attributes or {}).CoordinationRange or 0
                            local v6 = true
                            if not (v5 <= v3 * v3) then
                                v6 = v5 <= v4 * v4
                            end
                            return v6
                        end
                        return false
                    end
                end
            end
            return false
        end
    end
    return false
end

local function isInAttackRange(a1, a2) -- Line: 535 -- upvalues: getTowerPosition (val), getTowerAttackRange (val)
    local v1 = getTowerPosition(a1)
    local v2 = getTowerPosition(a2)
    if v1 and v2 then
        local v3 = getTowerAttackRange(a1)
        local v4 = false
        if v3 > 0 then
            local v5 = v1.X - v2.X
            local v6 = v1.Z - v2.Z
            v4 = v5 * v5 + v6 * v6 <= v3 * v3
        end
        return v4
    end
    return false
end

local function canLinkSharedOptics(a1, a2) -- Line: 548
    -- upvalues: statusEffectRendererHasTag (val), Tags (val), getTowerPosition (val), getTowerAttackRange (val)
    local v1 = false
    if (a1 and (a1.Name or a1.TowerName or a1.Type or a1.State and a1.State.Type)) == "EvolvedOperator" then
        v1 = false
        if a1.Model ~= nil then
            v1 = a1.Model.Parent ~= nil
        end
    end
    if v1 then
        v1 = false
        if (a2 and (a2.Name or a2.TowerName or a2.Type or a2.State and a2.State.Type)) == "EvolvedOperator" then
            v1 = false
            if a2.Model ~= nil then
                v1 = a2.Model.Parent ~= nil
            end
        end
        if v1 then
            if not statusEffectRendererHasTag(a1 and a1.StatusEffectRenderer, Tags.TowerDisabled) then
                local Upgrade = if a1 then if a1.Upgrade == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("Upgrade") else if a1.State.Upgrade == nil then if not a1.Replicator then nil else a1.Replicator:Get("Upgrade") else a1.State.Upgrade else a1.Upgrade else nil
                v1 = true
                if (a1 and a1.Stats and a1.Stats.Attributes or {}).SharedOptics ~= true then
                    v1 = false
                    if typeof(Upgrade) == "number" then
                        v1 = Upgrade >= 5
                    end
                end
            else
                v1 = false
            end
            if v1 then
                if not statusEffectRendererHasTag(a2 and a2.StatusEffectRenderer, Tags.TowerDisabled) then
                    local Upgrade_2 = if a2 then if a2.Upgrade == nil then if not a2.State then if not a2.Replicator then nil else a2.Replicator:Get("Upgrade") else if a2.State.Upgrade == nil then if not a2.Replicator then nil else a2.Replicator:Get("Upgrade") else a2.State.Upgrade else a2.Upgrade else nil
                    v1 = true
                    if (a2 and a2.Stats and a2.Stats.Attributes or {}).SharedOptics ~= true then
                        v1 = false
                        if typeof(Upgrade_2) == "number" then
                            v1 = Upgrade_2 >= 5
                        end
                    end
                else
                    v1 = false
                end
                if v1 then
                    local Team = if a1 then if a1.Team == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("Team") else if a1.State.Team == nil then if not a1.Replicator then nil else a1.Replicator:Get("Team") else a1.State.Team else a1.Team else nil
                    local Team_2 = if a2 then if a2.Team == nil then if not a2.State then if not a2.Replicator then nil else a2.Replicator:Get("Team") else if a2.State.Team == nil then if not a2.Replicator then nil else a2.Replicator:Get("Team") else a2.State.Team else a2.Team else nil
                    if Team ~= nil then
                        v1 = Team == Team_2
                    elseif Team_2 == nil then
                        local OwnerId = if a1 then if a1.OwnerId == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("OwnerId") else if a1.State.OwnerId == nil then if not a1.Replicator then nil else a1.Replicator:Get("OwnerId") else a1.State.OwnerId else a1.OwnerId else nil
                        v1 = false
                        if OwnerId ~= nil then
                            v1 = OwnerId == (if a2 then if a2.OwnerId == nil then if not a2.State then if not a2.Replicator then nil else a2.Replicator:Get("OwnerId") else if a2.State.OwnerId == nil then if not a2.Replicator then nil else a2.Replicator:Get("OwnerId") else a2.State.OwnerId else a2.OwnerId else nil)
                        end
                    else
                        v1 = Team == Team_2
                    end
                    if v1 then
                        local v2, v3, v4
                        local v5 = getTowerPosition(a1)
                        local v6 = getTowerPosition(a2)
                        if not v5 then
                            v1 = false
                        elseif v6 then
                            v2 = getTowerAttackRange(a1)
                            v1 = false
                            if v2 > 0 then
                                v3 = v5.X - v6.X
                                v4 = v5.Z - v6.Z
                                v1 = v3 * v3 + v4 * v4 <= v2 * v2
                            end
                        else
                            v1 = false
                        end
                        if not v1 then
                            v5 = getTowerPosition(a2)
                            v6 = getTowerPosition(a1)
                            if v5 and v6 then
                                v2 = getTowerAttackRange(a2)
                                v1 = false
                                if v2 > 0 then
                                    v3 = v5.X - v6.X
                                    v4 = v5.Z - v6.Z
                                    v1 = v3 * v3 + v4 * v4 <= v2 * v2
                                end
                                return v1
                            end
                            return false
                        end
                    end
                end
            end
            return v1
        end
    end
    return false
end

local function getLinkEndpointParts(a1) -- Line: 559 -- types: a1: userdata
    local v1 = a1:FindFirstChild("1", true) or a1:FindFirstChild("Link.1", true)
    local v2 = a1:FindFirstChild("2", true) or a1:FindFirstChild("Link.2", true)
    local v3 = {}
    for i, j in a1:GetDescendants() do
        if j:IsA("BasePart") then
            table.insert(v3, j)
        end
    end
    if not v1 or not v1:IsA("BasePart") then
        v1 = v3[1]
    end
    if v2 and v2:IsA("BasePart") then
        return v1, v2
    end
    if v3[1] == v1 then
        return v1, v3[2]
    end
    v2 = v3[1]
    return v1, v2
end

local function wireLinkBeams(a1, a2, a3) -- Line: 581 -- types: a1: userdata, a2: userdata, a3: userdata
    local Attachment = a2:FindFirstChildWhichIsA("Attachment", true)
    local Attachment_2 = a3:FindFirstChildWhichIsA("Attachment", true)
    if Attachment and Attachment_2 then
        for i, j in a1:GetDescendants() do
            if j:IsA("Beam") then
                j.Attachment0 = Attachment
                j.Attachment1 = Attachment_2
                j.Enabled = true
            elseif j:IsA("ParticleEmitter") or j:IsA("Trail") then
                j.Enabled = true
            end
        end
        return
    end
end

local function destroyLinkRecord(a1) -- Line: 599 -- upvalues: u64 (val) -- types: a1: string
    local v1 = u64[a1]
    if not v1 then
        return
    end
    u64[a1] = nil
    if v1.unregisterLOD then
        v1.unregisterLOD()
    end
    if v1.model then
        v1.model:Destroy()
    end
end

local function destroySharedOpticsBuffAura(a1) -- Line: 616 -- upvalues: u66 (val) -- types: a1: string
    local v1 = u66[a1]
    if not v1 then
        return
    end
    u66[a1] = nil
    if v1.attachment then
        v1.attachment:Destroy()
    end
end

local function destroyCoordinationAura(a1) -- Line: 629 -- upvalues: u65 (val) -- types: a1: string
    local v1 = u65[a1]
    if not v1 then
        return
    end
    u65[a1] = nil
    if v1.unregisterLOD then
        v1.unregisterLOD()
    end
    if v1.aura then
        v1.aura:Destroy()
    end
end

local function updateCoordinationAuraRecord(a1) -- Line: 646
    local tower = a1.tower
    local Model = tower and tower.Model
    if Model and Model.Parent then
        local WorldPosition, v1
        if not Model then
            WorldPosition = nil
        elseif Model.Parent then
            local PrimaryPart = Model.PrimaryPart
            if not PrimaryPart then
                WorldPosition = Model:GetPivot().Position
            else
                local HeightOffset = PrimaryPart:FindFirstChild("HeightOffset")
                WorldPosition = if not HeightOffset then PrimaryPart.Position else if not HeightOffset:IsA("Attachment") then PrimaryPart.Position else HeightOffset.WorldPosition
            end
        else
            WorldPosition = nil
        end
        if WorldPosition then
            local PrimaryPart_2 = Model.PrimaryPart
            v1 = if not PrimaryPart_2 then CFrame.new(WorldPosition) else (CFrame.new(WorldPosition)) * (PrimaryPart_2.CFrame - PrimaryPart_2.CFrame.Position)
        else
            v1 = nil
        end
        if not v1 then
            return false
        end
        if a1.aura and a1.aura.Parent then
            local aura = a1.aura
            if aura:IsA("Model") then
                aura:PivotTo(v1)
            elseif aura:IsA("BasePart") or aura:IsA("Attachment") then
                aura.CFrame = v1
            end
            return true
        end
        return false
    end
    return false
end

local function createCoordinationAura(a1, a2) -- Line: 666
    -- upvalues: u59 (ref), ReplicatedStorage (val), prepareVFXRoot (val), setVFXEnabled (val), u60 (ref)
    -- upvalues: getEffectPosition (val), u65 (val)
    if not u59 or not u59.Parent then
        u59 = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Misc")):WaitForChild("Operator")
    end
    local PlacementAura = u59:FindFirstChild("PlacementAura")
    if not PlacementAura then
        return nil
    end
    local Model = a2 and a2.Model
    if Model and Model.Parent then
        local WorldPosition, v1
        if not Model then
            WorldPosition = nil
        elseif Model.Parent then
            local PrimaryPart = Model.PrimaryPart
            if not PrimaryPart then
                WorldPosition = Model:GetPivot().Position
            else
                local HeightOffset = PrimaryPart:FindFirstChild("HeightOffset")
                WorldPosition = if not HeightOffset then PrimaryPart.Position else if not HeightOffset:IsA("Attachment") then PrimaryPart.Position else HeightOffset.WorldPosition
            end
        else
            WorldPosition = nil
        end
        if WorldPosition then
            local PrimaryPart_2 = Model.PrimaryPart
            v1 = if not PrimaryPart_2 then CFrame.new(WorldPosition) else (CFrame.new(WorldPosition)) * (PrimaryPart_2.CFrame - PrimaryPart_2.CFrame.Position)
        else
            v1 = nil
        end
        if not v1 then
            return nil
        end
        local u82 = PlacementAura:Clone()
        u82.Name = "OperatorCoordinationAuraVFX"
        prepareVFXRoot(u82)
        setVFXEnabled(u82, true)
        if u82:IsA("Model") then
            u82:PivotTo(v1)
        elseif u82:IsA("BasePart") or u82:IsA("Attachment") then
            u82.CFrame = v1
        end
        local Trash = workspace:FindFirstChild("Trash") or workspace
        u82.Parent = Trash
        local v2 = {aura = u82, tower = a2}
        if not u60 then
            u60 = require(ReplicatedStorage.Client.Modules.ParticleLODController)
        end
        v2.unregisterLOD = u60.registerRoot(u82, function() -- Line: 695 -- upvalues: getEffectPosition (upval), u82 (val)
            return (getEffectPosition(u82))
        end)
        u65[a1] = v2
        return v2
    end
    return nil
end

local function updateSharedOpticsBuffAuraRecord(a1) -- Line: 703
    -- upvalues: statusEffectRendererHasTag (val), Tags (val), getSharedOpticsAnchorParent (val)
    -- upvalues: getSharedOpticsWorldPosition (val)
    local v1
    local tower = a1.tower
    if not statusEffectRendererHasTag(tower and tower.StatusEffectRenderer, Tags.TowerDisabled) then
        local Upgrade = if tower then if tower.Upgrade == nil then if not tower.State then if not tower.Replicator then nil else tower.Replicator:Get("Upgrade") else if tower.State.Upgrade == nil then if not tower.Replicator then nil else tower.Replicator:Get("Upgrade") else tower.State.Upgrade else tower.Upgrade else nil
        v1 = true
        if (tower and tower.Stats and tower.Stats.Attributes or {}).SharedOptics ~= true then
            v1 = false
            if typeof(Upgrade) == "number" then
                v1 = Upgrade >= 5
            end
        end
    else
        v1 = false
    end
    if not v1 then
        return false
    end
    local Model = tower and tower.Model
    if Model and Model.Parent then
        local v2, v3
        local v4 = getSharedOpticsAnchorParent(Model)
        local v5 = getSharedOpticsWorldPosition(Model)
        if not v4 then
            v2 = nil
            v3 = nil
        elseif v5 then
            v2 = v4
            v3 = v4.CFrame:ToObjectSpace((CFrame.new(v5)))
        else
            v2 = nil
            v3 = nil
        end
        if v2 and v3 then
            if a1.attachment and a1.attachment.Parent then
                if a1.attachment.Parent ~= v2 then
                    a1.attachment.Parent = v2
                end
                a1.attachment.CFrame = v3
                return true
            end
            return false
        end
        return false
    end
    return false
end

local function createSharedOpticsBuffAura(a1, a2) -- Line: 731
    -- upvalues: statusEffectRendererHasTag (val), Tags (val), u59 (ref), ReplicatedStorage (val)
    -- upvalues: getSharedOpticsAnchorParent (val), getSharedOpticsWorldPosition (val), setVFXEnabled (val), u66 (val)
    local v1
    if not statusEffectRendererHasTag(a2 and a2.StatusEffectRenderer, Tags.TowerDisabled) then
        local Upgrade = if a2 then if a2.Upgrade == nil then if not a2.State then if not a2.Replicator then nil else a2.Replicator:Get("Upgrade") else if a2.State.Upgrade == nil then if not a2.Replicator then nil else a2.Replicator:Get("Upgrade") else a2.State.Upgrade else a2.Upgrade else nil
        v1 = true
        if (a2 and a2.Stats and a2.Stats.Attributes or {}).SharedOptics ~= true then
            v1 = false
            if typeof(Upgrade) == "number" then
                v1 = Upgrade >= 5
            end
        end
    else
        v1 = false
    end
    if not v1 then
        return nil
    end
    if not u59 or not u59.Parent then
        u59 = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Misc")):WaitForChild("Operator")
    end
    local SharedOptics = u59:FindFirstChild("SharedOptics")
    if SharedOptics and SharedOptics:IsA("Attachment") then
        local Model = a2 and a2.Model
        if Model and Model.Parent then
            local v2, v3
            local v4 = getSharedOpticsAnchorParent(Model)
            local v5 = getSharedOpticsWorldPosition(Model)
            if not v4 then
                v2 = nil
                v3 = nil
            elseif v5 then
                v2 = v4
                v3 = v4.CFrame:ToObjectSpace((CFrame.new(v5)))
            else
                v2 = nil
                v3 = nil
            end
            if v2 and v3 then
                v4 = SharedOptics:Clone()
                v4.Name = "OperatorSharedOpticsBuffVFX"
                setVFXEnabled(v4, true)
                v4.CFrame = v3
                v4.Parent = v2
                v5 = {attachment = v4, tower = a2}
                u66[a1] = v5
                return v5
            end
            return nil
        end
        return nil
    end
    return nil
end

local function createLinkRecord(a1, a2, a3) -- Line: 766
    -- upvalues: u59 (ref), ReplicatedStorage (val), getLinkEndpointParts (val), prepareVFXRoot (val)
    -- upvalues: wireLinkBeams (val), u60 (ref), getEffectPosition (val), u64 (val)
    if not u59 or not u59.Parent then
        u59 = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Misc")):WaitForChild("Operator")
    end
    local Link = u59:FindFirstChild("Link")
    if Link and Link:IsA("Model") then
        local u36 = Link:Clone()
        local v1, v2 = getLinkEndpointParts(u36)
        if v1 and v2 then
            local Position, Position_2
            prepareVFXRoot(u36)
            wireLinkBeams(u36, v1, v2)
            local u49 = {
                model = u36,
                partA = v1,
                partB = v2,
                towerA = a2,
                towerB = a3,
            }
            local Model = a2 and a2.Model
            if not Model then
                Position = nil
            elseif Model.Parent then
                local CFrame_2
                if not Model then
                    CFrame_2 = nil
                elseif Model.Parent then
                    local PrimaryPart = Model.PrimaryPart or Model:FindFirstChild("HumanoidRootPart") or Model:FindFirstChild("RootPart") or Model:FindFirstChildWhichIsA("BasePart")
                    CFrame_2 = PrimaryPart and PrimaryPart.CFrame or Model:GetPivot()
                else
                    CFrame_2 = nil
                end
                Position = CFrame_2 and CFrame_2.Position
            else
                Position = nil
            end
            local Model_2 = a3 and a3.Model
            if not Model_2 then
                Position_2 = nil
            elseif Model_2.Parent then
                local CFrame_3
                if not Model_2 then
                    CFrame_3 = nil
                elseif Model_2.Parent then
                    local PrimaryPart_2 = Model_2.PrimaryPart or Model_2:FindFirstChild("HumanoidRootPart") or Model_2:FindFirstChild("RootPart") or Model_2:FindFirstChildWhichIsA("BasePart")
                    CFrame_3 = PrimaryPart_2 and PrimaryPart_2.CFrame or Model_2:GetPivot()
                else
                    CFrame_3 = nil
                end
                Position_2 = CFrame_3 and CFrame_3.Position
            else
                Position_2 = nil
            end
            if Position and Position_2 then
                v1.CFrame = CFrame.new(Position)
                v2.CFrame = CFrame.new(Position_2)
            end
            local Trash = workspace:FindFirstChild("Trash") or workspace
            u36.Parent = Trash
            if not u60 then
                u60 = require(ReplicatedStorage.Client.Modules.ParticleLODController)
            end
            u49.unregisterLOD = u60.registerRoot(u36, function() -- Line: 799 -- upvalues: u49 (val), getEffectPosition (upval), u36 (val)
                local Position, Position_2
                local towerA = u49.towerA
                local Model = towerA and towerA.Model
                if not Model then
                    Position = nil
                elseif Model.Parent then
                    local CFrame
                    if not Model then
                        CFrame = nil
                    elseif Model.Parent then
                        local PrimaryPart = Model.PrimaryPart or Model:FindFirstChild("HumanoidRootPart") or Model:FindFirstChild("RootPart") or Model:FindFirstChildWhichIsA("BasePart")
                        CFrame = PrimaryPart and PrimaryPart.CFrame or Model:GetPivot()
                    else
                        CFrame = nil
                    end
                    Position = CFrame and CFrame.Position
                else
                    Position = nil
                end
                local towerB = u49.towerB
                local Model_2 = towerB and towerB.Model
                if not Model_2 then
                    Position_2 = nil
                elseif Model_2.Parent then
                    local CFrame_2
                    if not Model_2 then
                        CFrame_2 = nil
                    elseif Model_2.Parent then
                        local PrimaryPart_2 = Model_2.PrimaryPart or Model_2:FindFirstChild("HumanoidRootPart") or Model_2:FindFirstChild("RootPart") or Model_2:FindFirstChildWhichIsA("BasePart")
                        CFrame_2 = PrimaryPart_2 and PrimaryPart_2.CFrame or Model_2:GetPivot()
                    else
                        CFrame_2 = nil
                    end
                    Position_2 = CFrame_2 and CFrame_2.Position
                else
                    Position_2 = nil
                end
                if Position and Position_2 then
                    return (Position + Position_2) * 0.5
                end
                return (getEffectPosition(u36))
            end)
            u64[a1] = u49
            return u49
        end
        u36:Destroy()
        return nil
    end
    return nil
end

local function getOperatorTowers() -- Line: 814
    -- upvalues: u62 (ref), ReplicatedStorage (val), shouldSwapTowerOrder (val)
    local v1
    if not u62 then
        u62 = require(ReplicatedStorage.Client.Modules.Replicators.TowerReplicator)
    end
    local v2 = {}
    local v3 = u62.getTowers()
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v1 = false
        if (j and (j.Name or j.TowerName or j.Type or j.State and j.State.Type)) == "EvolvedOperator" then
            v1 = false
            if j.Model ~= nil then
                v1 = j.Model.Parent ~= nil
            end
        end
        if v1 then
            table.insert(v2, j)
        end
    end
    table.sort(v2, function(a1, a2) -- Line: 824 -- upvalues: shouldSwapTowerOrder (upval)
        return not shouldSwapTowerOrder(a1, a2)
    end)
    return v2
end

local function getSelectedOperatorTower(a1) -- Line: 831 -- upvalues: UpgradesStore (val)
    local v1 = UpgradesStore.getState()
    local model = v1 and v1.model
    if typeof(model) == "Instance" and model:IsA("Model") then
        for i, j in a1 do
            if j.Model == model then
                return j
            end
        end
        return nil
    end
    return nil
end

local function getSharedOpticsEdges(a1, a2) -- Line: 848
    -- upvalues: statusEffectRendererHasTag (val), Tags (val), canLinkSharedOptics (val)
    local v1 = {}
    local v2 = {}
    if a1 then
        local v3
        if not statusEffectRendererHasTag(a1 and a1.StatusEffectRenderer, Tags.TowerDisabled) then
            local Upgrade = if a1 then if a1.Upgrade == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("Upgrade") else if a1.State.Upgrade == nil then if not a1.Replicator then nil else a1.Replicator:Get("Upgrade") else a1.State.Upgrade else a1.Upgrade else nil
            v3 = true
            if (a1 and a1.Stats and a1.Stats.Attributes or {}).SharedOptics ~= true then
                v3 = false
                if typeof(Upgrade) == "number" then
                    v3 = Upgrade >= 5
                end
            end
        else
            v3 = false
        end
        if v3 then
            local v4
            v3 = {a1}
            v1[a1] = true
            local v5 = 1
            while v5 <= #v3 do
                v4 = v3[v5]
                v5 = v5 + 1
                for i, j in a2 do
                    if not v1[j] and canLinkSharedOptics(v4, j) then
                        v1[j] = true
                        table.insert(v2, {towerA = v4, towerB = j})
                        table.insert(v3, j)
                    end
                end
            end
            return v2
        end
    end
    return v2
end

local function refreshCoordinationLinks() -- Line: 879
    -- upvalues: getOperatorTowers (val), getSharedOpticsEdges (val), getSelectedOperatorTower (val)
    -- upvalues: canShowCoordinationAura (val), shouldSwapTowerOrder (val), u64 (val), createLinkRecord (val), u65 (val)
    -- upvalues: createCoordinationAura (val), u66 (val), updateSharedOpticsBuffAuraRecord (val)
    -- upvalues: createSharedOpticsBuffAura (val)
    local HeightOffset, Model_3, PrimaryPart, PrimaryPart_2, UID, UID_2, UID_3, UID_4, UID_5, UID_6, WorldPosition, aura, tower, towerA, towerB, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
    local v11 = {}
    local v12 = {}
    local v13 = {}
    local v14 = getOperatorTowers()
    local v15 = getSharedOpticsEdges(getSelectedOperatorTower(v14), v14)
    local v16 = #v14
    for i = 1, v16 do
        v1 = i + 1
        v10 = #v14
        for j = v1, v10 do
            v2 = v14[i]
            v3 = v14[j]
            if canShowCoordinationAura(v2, v3) then
                UID = if v2 then if v2.UID == nil then if not v2.State then if not v2.Replicator then nil else v2.Replicator:Get("UID") else if v2.State.UID == nil then if not v2.Replicator then nil else v2.Replicator:Get("UID") else v2.State.UID else v2.UID else nil
                v12[if UID == nil then tostring(v2.Model) else tostring(UID)] = v2
                UID_2 = if v3 then if v3.UID == nil then if not v3.State then if not v3.Replicator then nil else v3.Replicator:Get("UID") else if v3.State.UID == nil then if not v3.Replicator then nil else v3.Replicator:Get("UID") else v3.State.UID else v3.UID else nil
                v12[if UID_2 == nil then tostring(v3.Model) else tostring(UID_2)] = v3
            end
        end
    end
    local v17 = nil
    local v18 = nil
    for k, n in v15, v17, v18 do
        towerA = n.towerA
        towerB = n.towerB
        UID_3 = if towerA then if towerA.UID == nil then if not towerA.State then if not towerA.Replicator then nil else towerA.Replicator:Get("UID") else if towerA.State.UID == nil then if not towerA.Replicator then nil else towerA.Replicator:Get("UID") else towerA.State.UID else towerA.UID else nil
        v13[if UID_3 == nil then tostring(towerA.Model) else tostring(UID_3)] = towerA
        UID_4 = if towerB then if towerB.UID == nil then if not towerB.State then if not towerB.Replicator then nil else towerB.Replicator:Get("UID") else if towerB.State.UID == nil then if not towerB.Replicator then nil else towerB.Replicator:Get("UID") else towerB.State.UID else towerB.UID else nil
        v13[if UID_4 == nil then tostring(towerB.Model) else tostring(UID_4)] = towerB
        v6 = towerA
        v7 = towerB
        if shouldSwapTowerOrder(v6, v7) then
            v8 = v7
            v7 = v6
            v6 = v8
        end
        UID_5 = if v6 then if v6.UID == nil then if not v6.State then if not v6.Replicator then nil else v6.Replicator:Get("UID") else if v6.State.UID == nil then if not v6.Replicator then nil else v6.Replicator:Get("UID") else v6.State.UID else v6.UID else nil
        UID_6 = if v7 then if v7.UID == nil then if not v7.State then if not v7.Replicator then nil else v7.Replicator:Get("UID") else if v7.State.UID == nil then if not v7.Replicator then nil else v7.Replicator:Get("UID") else v7.State.UID else v7.UID else nil
        v9 = if UID_6 == nil then tostring(v7.Model) else tostring(UID_6)
        v3 = ("%*:%*"):format(if UID_5 == nil then tostring(v6.Model) else tostring(UID_5), v9)
        v4 = v6
        v5 = v7
        v11[v3] = true
        v6 = u64[v3]
        if not v6 then
            createLinkRecord(v3, v4, v5)
        else
            v6.towerA = v4
            v6.towerB = v5
        end
    end
    v17 = nil
    v18 = nil
    for m in u64, v17, v18 do
        if not v11[m] then
            v1 = u64[m]
            if v1 then
                u64[m] = nil
                if v1.unregisterLOD then
                    v1.unregisterLOD()
                end
                if v1.model then
                    v1.model:Destroy()
                end
            end
        end
    end
    v17 = nil
    v18 = nil
    for i5, i6 in v12, v17, v18 do
        v1 = u65[i5]
        if not v1 then
            createCoordinationAura(i5, i6)
        else
            v1.tower = i6
            tower = v1.tower
            Model_3 = tower and tower.Model
            if not Model_3 then
                v2 = false
            elseif Model_3.Parent then
                if not Model_3 then
                    WorldPosition = nil
                elseif Model_3.Parent then
                    PrimaryPart = Model_3.PrimaryPart
                    if not PrimaryPart then
                        WorldPosition = Model_3:GetPivot().Position
                    else
                        HeightOffset = PrimaryPart:FindFirstChild("HeightOffset")
                        WorldPosition = if not HeightOffset then PrimaryPart.Position else if not HeightOffset:IsA("Attachment") then PrimaryPart.Position else HeightOffset.WorldPosition
                    end
                else
                    WorldPosition = nil
                end
                if WorldPosition then
                    PrimaryPart_2 = Model_3.PrimaryPart
                    v5 = if not PrimaryPart_2 then CFrame.new(WorldPosition) else (CFrame.new(WorldPosition)) * (PrimaryPart_2.CFrame - PrimaryPart_2.CFrame.Position)
                else
                    v5 = nil
                end
                if not v5 or not v1.aura then
                    v2 = false
                elseif v1.aura.Parent then
                    aura = v1.aura
                    if aura:IsA("Model") then
                        aura:PivotTo(v5)
                    elseif aura:IsA("BasePart") or aura:IsA("Attachment") then
                        aura.CFrame = v5
                    end
                    v2 = true
                else
                    v2 = false
                end
            else
                v2 = false
            end
            if not v2 then
                v2 = u65[i5]
                if v2 then
                    u65[i5] = nil
                    if v2.unregisterLOD then
                        v2.unregisterLOD()
                    end
                    if v2.aura then
                        v2.aura:Destroy()
                    end
                end
                createCoordinationAura(i5, i6)
            end
        end
    end
    v17 = nil
    v18 = nil
    for i7 in u65, v17, v18 do
        if not v12[i7] then
            v1 = u65[i7]
            if v1 then
                u65[i7] = nil
                if v1.unregisterLOD then
                    v1.unregisterLOD()
                end
                if v1.aura then
                    v1.aura:Destroy()
                end
            end
        end
    end
    v17 = nil
    v18 = nil
    for i8, i9 in v13, v17, v18 do
        v1 = u66[i8]
        if not v1 then
            createSharedOpticsBuffAura(i8, i9)
        else
            v1.tower = i9
            if not updateSharedOpticsBuffAuraRecord(v1) then
                v2 = u66[i8]
                if v2 then
                    u66[i8] = nil
                    if v2.attachment then
                        v2.attachment:Destroy()
                    end
                end
                createSharedOpticsBuffAura(i8, i9)
            end
        end
    end
    for i10 in u66 do
        if not v13[i10] then
            v1 = u66[i10]
            if v1 then
                u66[i10] = nil
                if v1.attachment then
                    v1.attachment:Destroy()
                end
            end
        end
    end
end

local function updateCoordinationAuraPositions() -- Line: 963 -- upvalues: u65 (val)
    local HeightOffset, Model, PrimaryPart, PrimaryPart_2, WorldPosition, aura, tower, v1, v2
    local v3 = nil
    local v4 = nil
    for i, j in u65, v3, v4 do
        tower = j.tower
        Model = tower and tower.Model
        if not Model then
            v1 = false
        elseif Model.Parent then
            if not Model then
                WorldPosition = nil
            elseif Model.Parent then
                PrimaryPart = Model.PrimaryPart
                if not PrimaryPart then
                    WorldPosition = Model:GetPivot().Position
                else
                    HeightOffset = PrimaryPart:FindFirstChild("HeightOffset")
                    WorldPosition = if not HeightOffset then PrimaryPart.Position else if not HeightOffset:IsA("Attachment") then PrimaryPart.Position else HeightOffset.WorldPosition
                end
            else
                WorldPosition = nil
            end
            if WorldPosition then
                PrimaryPart_2 = Model.PrimaryPart
                v2 = if not PrimaryPart_2 then CFrame.new(WorldPosition) else (CFrame.new(WorldPosition)) * (PrimaryPart_2.CFrame - PrimaryPart_2.CFrame.Position)
            else
                v2 = nil
            end
            if not v2 or not j.aura then
                v1 = false
            elseif j.aura.Parent then
                aura = j.aura
                if aura:IsA("Model") then
                    aura:PivotTo(v2)
                elseif aura:IsA("BasePart") or aura:IsA("Attachment") then
                    aura.CFrame = v2
                end
                v1 = true
            else
                v1 = false
            end
        else
            v1 = false
        end
        if not v1 then
            v1 = u65[i]
            if v1 then
                u65[i] = nil
                if v1.unregisterLOD then
                    v1.unregisterLOD()
                end
                if v1.aura then
                    v1.aura:Destroy()
                end
            end
        end
    end
end

local function updateCoordinationLinkPositions() -- Line: 971 -- upvalues: u64 (val)
    local CFrame_2, CFrame_3, Model, Model_2, Position, Position_2, PrimaryPart, PrimaryPart_2, towerA, towerB, v1
    local v2 = {}
    local v3 = {}
    local v4 = nil
    local v5 = nil
    for i, j in u64, v4, v5 do
        towerA = j.towerA
        Model = towerA and towerA.Model
        if not Model then
            Position = nil
        elseif Model.Parent then
            if not Model then
                CFrame_2 = nil
            elseif Model.Parent then
                PrimaryPart = Model.PrimaryPart or Model:FindFirstChild("HumanoidRootPart") or Model:FindFirstChild("RootPart") or Model:FindFirstChildWhichIsA("BasePart")
                CFrame_2 = PrimaryPart and PrimaryPart.CFrame or Model:GetPivot()
            else
                CFrame_2 = nil
            end
            Position = CFrame_2 and CFrame_2.Position
        else
            Position = nil
        end
        towerB = j.towerB
        Model_2 = towerB and towerB.Model
        if not Model_2 then
            Position_2 = nil
        elseif Model_2.Parent then
            if not Model_2 then
                CFrame_3 = nil
            elseif Model_2.Parent then
                PrimaryPart_2 = Model_2.PrimaryPart or Model_2:FindFirstChild("HumanoidRootPart") or Model_2:FindFirstChild("RootPart") or Model_2:FindFirstChildWhichIsA("BasePart")
                CFrame_3 = PrimaryPart_2 and PrimaryPart_2.CFrame or Model_2:GetPivot()
            else
                CFrame_3 = nil
            end
            Position_2 = CFrame_3 and CFrame_3.Position
        else
            Position_2 = nil
        end
        if not Position or not Position_2 or not j.partA.Parent then
            v1 = u64[i]
            if v1 then
                u64[i] = nil
                if v1.unregisterLOD then
                    v1.unregisterLOD()
                end
                if v1.model then
                    v1.model:Destroy()
                end
            end
        elseif j.partB.Parent then
            table.insert(v2, j.partA)
            table.insert(v3, (CFrame.new(Position)))
            table.insert(v2, j.partB)
            table.insert(v3, (CFrame.new(Position_2)))
        else
            v1 = u64[i]
            if v1 then
                u64[i] = nil
                if v1.unregisterLOD then
                    v1.unregisterLOD()
                end
                if v1.model then
                    v1.model:Destroy()
                end
            end
        end
    end
    if #v2 > 0 then
        workspace:BulkMoveTo(v2, v3, Enum.BulkMoveMode.FireCFrameChanged)
    end
end

local function updateSharedOpticsBuffAuraPositions() -- Line: 995
    -- upvalues: u66 (val), updateSharedOpticsBuffAuraRecord (val)
    local v1
    for i, j in u66 do
        if not updateSharedOpticsBuffAuraRecord(j) then
            v1 = u66[i]
            if v1 then
                u66[i] = nil
                if v1.attachment then
                    v1.attachment:Destroy()
                end
            end
        end
    end
end

local function stepCoordinationLinks(a1) -- Line: 1003
    -- upvalues: u69 (ref), refreshCoordinationLinks (val), updateCoordinationLinkPositions (val)
    -- upvalues: updateCoordinationAuraPositions (val), updateSharedOpticsBuffAuraPositions (val)
    u69 = u69 + a1
    if u69 >= 0.25 then
        u69 = 0
        refreshCoordinationLinks()
    end
    updateCoordinationLinkPositions()
    updateCoordinationAuraPositions()
    updateSharedOpticsBuffAuraPositions()
end

local function stopCoordinationLinkManager() -- Line: 1016
    -- upvalues: u67 (ref), u68 (ref), u64 (val), u65 (val), u66 (val)
    local v1
    if u67 then
        u67:Disconnect()
        u67 = nil
    end
    if u68 then
        u68()
        u68 = nil
    end
    local v2 = nil
    local v3 = nil
    for i in u64, v2, v3 do
        v1 = u64[i]
        if v1 then
            u64[i] = nil
            if v1.unregisterLOD then
                v1.unregisterLOD()
            end
            if v1.model then
                v1.model:Destroy()
            end
        end
    end
    v2 = nil
    v3 = nil
    for j in u65, v2, v3 do
        v1 = u65[j]
        if v1 then
            u65[j] = nil
            if v1.unregisterLOD then
                v1.unregisterLOD()
            end
            if v1.aura then
                v1.aura:Destroy()
            end
        end
    end
    for k in u66 do
        v1 = u66[k]
        if v1 then
            u66[k] = nil
            if v1.attachment then
                v1.attachment:Destroy()
            end
        end
    end
end

local function startCoordinationLinkManager() -- Line: 1040
    -- upvalues: u67 (ref), u69 (ref), RunService (val), stepCoordinationLinks (val), u68 (ref), watchValue (val)
    -- upvalues: UpgradesStore (val), refreshCoordinationLinks (val)
    if u67 then
        return
    end
    u69 = 0.25
    u67 = RunService.Heartbeat:Connect(stepCoordinationLinks)
    u68 = watchValue(function() -- Line: 1047 -- upvalues: UpgradesStore (upval)
        return UpgradesStore.getState().model
    end, function() -- Line: 1049 -- upvalues: u69 (upval), refreshCoordinationLinks (upval)
        u69 = 0.25
        refreshCoordinationLinks()
    end)
end

local function registerOperatorAnimator(a1) -- Line: 1055 -- upvalues: u63 (val), startCoordinationLinkManager (val)
    u63[a1] = true
    startCoordinationLinkManager()
end

local function unregisterOperatorAnimator(a1) -- Line: 1060 -- upvalues: u63 (val), stopCoordinationLinkManager (val)
    u63[a1] = nil
    if next(u63) == nil then
        stopCoordinationLinkManager()
    end
end

local function getLocalPlacementTeam() -- Line: 1068 -- upvalues: u61 (ref), ReplicatedStorage (val)
    local success, result = pcall(function() -- Line: 1069 -- upvalues: u61 (upval), ReplicatedStorage (upval)
        if not u61 then
            u61 = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
        end
        return u61.GetLocalPlayerRaw()
    end)
    if success and result then
        return result.Team
    end
    return nil
end

local function isAlliedPlacementProvider(a1, a2) -- Line: 1076
    -- upvalues: statusEffectRendererHasTag (val), Tags (val), Players (val)
    local v1 = false
    if (a1 and (a1.Name or a1.TowerName or a1.Type or a1.State and a1.State.Type)) == "EvolvedOperator" then
        v1 = false
        if a1.Model ~= nil then
            v1 = a1.Model.Parent ~= nil
        end
    end
    if v1 and not statusEffectRendererHasTag(a1 and a1.StatusEffectRenderer, Tags.TowerDisabled) then
        if a2 ~= nil then
            return (if a1 then if a1.Team == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("Team") else if a1.State.Team == nil then if not a1.Replicator then nil else a1.Replicator:Get("Team") else a1.State.Team else a1.Team else nil) == a2
        end
        return (if a1 then if a1.OwnerId == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("OwnerId") else if a1.State.OwnerId == nil then if not a1.Replicator then nil else a1.Replicator:Get("OwnerId") else a1.State.OwnerId else a1.OwnerId else nil) == Players.LocalPlayer.UserId
    end
    return false
end

local function isPlacementNearCoordinationProvider(a1, a2) -- Line: 1088
    -- upvalues: u61 (ref), ReplicatedStorage (val), u62 (ref), statusEffectRendererHasTag (val), Tags (val)
    -- upvalues: Players (val), getTowerPosition (val), getPlacementCoordinationRange (val)
    local v1, v2, v3, v4
    local success, result = pcall(function() -- Line: 1069 -- upvalues: u61 (upval), ReplicatedStorage (upval)
        if not u61 then
            u61 = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
        end
        return u61.GetLocalPlayerRaw()
    end)
    local Team = if not success then nil else if not result then nil else result.Team
    if not u62 then
        u62 = require(ReplicatedStorage.Client.Modules.Replicators.TowerReplicator)
    end
    local v5 = u62.getTowers()
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        if a2 and j.Model == a2 then
            continue
        end
        v1 = false
        if (j and (j.Name or j.TowerName or j.Type or j.State and j.State.Type)) == "EvolvedOperator" then
            v1 = false
            if j.Model ~= nil then
                v1 = j.Model.Parent ~= nil
            end
        end
        v4 = if not v1 or statusEffectRendererHasTag(j and j.StatusEffectRenderer, Tags.TowerDisabled) then false else if Team == nil then (if j then if j.OwnerId == nil then if not j.State then if not j.Replicator then nil else j.Replicator:Get("OwnerId") else if j.State.OwnerId == nil then if not j.Replicator then nil else j.Replicator:Get("OwnerId") else j.State.OwnerId else j.OwnerId else nil) == Players.LocalPlayer.UserId else (if j then if j.Team == nil then if not j.State then if not j.Replicator then nil else j.Replicator:Get("Team") else if j.State.Team == nil then if not j.Replicator then nil else j.Replicator:Get("Team") else j.State.Team else j.Team else nil) == Team
        if v4 then
            v4 = getTowerPosition(j)
            v1 = getPlacementCoordinationRange(j)
            if v4 and v1 > 0 then
                v2 = a1.X - v4.X
                v3 = a1.Z - v4.Z
                if v2 * v2 + v3 * v3 <= v1 * v1 then
                    return true
                end
            end
        end
    end
    return false
end

local function createPlacementAura(a1) -- Line: 1119
    -- upvalues: u59 (ref), ReplicatedStorage (val), prepareVFXRoot (val), setVFXEnabled (val), u60 (ref)
    -- upvalues: getEffectPosition (val)
    if not u59 or not u59.Parent then
        u59 = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Misc")):WaitForChild("Operator")
    end
    local PlacementAura = u59:FindFirstChild("PlacementAura")
    if not PlacementAura then
        return nil, nil
    end
    local u32 = PlacementAura:Clone()
    prepareVFXRoot(u32)
    setVFXEnabled(u32, true)
    if u32:IsA("Model") then
        u32:PivotTo(a1)
    elseif u32:IsA("BasePart") or u32:IsA("Attachment") then
        u32.CFrame = a1
    end
    local Trash = workspace:FindFirstChild("Trash") or workspace
    u32.Parent = Trash
    if not u60 then
        u60 = require(ReplicatedStorage.Client.Modules.ParticleLODController)
    end
    return u32, (u60.registerRoot(u32, function() -- Line: 1131 -- upvalues: getEffectPosition (upval), u32 (val)
        return (getEffectPosition(u32))
    end))
end

local function emitPlacementTrigger(a1, a2) -- Line: 1138
    -- upvalues: u59 (ref), ReplicatedStorage (val), prepareVFXRoot (val), u60 (ref), getEffectPosition (val)
    -- upvalues: EmitterManager (val)
    if not u59 or not u59.Parent then
        u59 = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Misc")):WaitForChild("Operator")
    end
    local PlacementTrigger = u59:FindFirstChild("PlacementTrigger")
    if not PlacementTrigger then
        return
    end
    local u31 = PlacementTrigger:Clone()
    prepareVFXRoot(u31)
    if u31:IsA("Model") then
        u31:PivotTo(a1)
    elseif u31:IsA("BasePart") or u31:IsA("Attachment") then
        u31.CFrame = a1
    end
    local Trash = workspace:FindFirstChild("Trash") or workspace
    u31.Parent = Trash
    if not u60 then
        u60 = require(ReplicatedStorage.Client.Modules.ParticleLODController)
    end
    local u76 = u60.registerRoot(u31, function() -- Line: 1149 -- upvalues: getEffectPosition (upval), u31 (val)
        return (getEffectPosition(u31))
    end)
    local u77 = false

    local function cleanup() -- Line: 1154 -- upvalues: u77 (ref), u76 (val), u31 (val)
        if u77 then
            return
        end
        u77 = true
        if u76 then
            u76()
        end
        u31:Destroy()
    end

    if a2 then
        a2:Mark(cleanup)
    end
    EmitterManager.manualEmit(u31)
    task.delay(2, cleanup)
end

function v1:_isAutomaticFire() -- Line: 1175
    local Attributes = self.Stats and self.Stats.Attributes or {}
    local v1 = Attributes.Burst or 1
    local BurstCool = Attributes.BurstCool or Attributes.BurstCooldown or 0
    local v2 = false
    if v1 <= 1 then
        v2 = BurstCool <= 0
    end
    return v2
end

function v1:_getOutroDelay() -- Line: 1183
    if self:_isAutomaticFire() then
        return 1.2
    end
    local Attributes = self.Stats and self.Stats.Attributes or {}
    return (math.max((self.State.Cooldown or 0) * 1.35 + (Attributes.BurstCool or Attributes.BurstCooldown or 0), 0.3))
end

function v1:_getAnimationKey(a2) -- Line: 1195 -- types: self: table, a2: string
    local v1
    local Animations = self.Animations and self.Animations[a2]
    if not Animations then
        return nil
    end
    local v2 = if not self.Path or not (0 < self.Path) then nil else string.char(96 + self.Path)
    local v3 = nil
    local Upgrade = self.Upgrade
    for i = 0, Upgrade do
        v1 = v2 and ("%*%*"):format(i, v2) or nil
        if not v1 then
            if Animations[tostring(i)] then
                v3 = tostring(i)
            end
        elseif Animations[v1] then
            v3 = v1
        elseif Animations[tostring(i)] then
            v3 = tostring(i)
        end
    end
    return v3
end

function v1:_playADS() -- Line: 1216 -- upvalues: GameState (val)
    local v1 = self:_getAnimationKey("ADS")
    if self._adsTrack and self._adsTrack.IsPlaying and self._adsAnimationKey == v1 then
        self._adsTrack:AdjustSpeed(GameState.TimeScale)
        return
    end
    self:_stopADS()
    self._adsTrack = self:Animate("ADS", nil, {0.08})
    self._adsAnimationKey = v1
    if self._adsTrack then
        self._adsTrack.Looped = true
        self._adsTrack:AdjustSpeed(GameState.TimeScale)
    end
end

function v1:_stopADS() -- Line: 1234 -- upvalues: GameState (val)
    if self._adsTrack then
        self._adsTrack:Stop(0.08 * GameState.TimeScale)
        self._adsTrack = nil
        self._adsAnimationKey = nil
    end
end

function v1:_playOutro() -- Line: 1242 -- upvalues: GameState (val)
    self:_stopADS()
    self._outroTrack = self:Animate("Outro", nil, {0.08})
    if self._outroTrack then
        self._outroTrack.Looped = false
        self._outroTrack:AdjustSpeed(GameState.TimeScale)
    end
end

function v1:_queueOutro() -- Line: 1253
    self._outroToken = self._outroToken + 1
    local _outroToken = self._outroToken
    self:Delay(self:_getOutroDelay(), function() -- Line: 1257 -- upvalues: _outroToken (val), self (val)
        if _outroToken ~= self._outroToken then
            return
        end
        if self:FindTarget() then
            self:_queueOutro()
            return
        end
        self:_playOutro()
    end)
end

function v1:_getMuzzle() -- Line: 1271 -- upvalues: getMuzzleFromModel (val)
    return (getMuzzleFromModel(self.Model))
end

function v1:_getFireSoundName() -- Line: 1275
    if 3 <= (self:GetLevel()) then
        return "FireSMG"
    end
    return "FirePistol"
end

function v1:_getSoundParent(a2) -- Line: 1279 -- types: self: table, a2: userdata?
    return a2 or self.Model.PrimaryPart
end

function v1:_getSoundPool(a2, a3, a4) -- Line: 1283
    -- upvalues: Sounds (val), SoundPool (val)
    local v1 = Sounds[a2]
    if not v1 then
        return nil
    end
    if self._soundPoolParents[a2] ~= a3 then
        if self._soundPools[a2] then
            self._soundPools[a2]:destroy()
        end
        self._soundPools[a2] = (SoundPool.new({
            timeScaled = true,
            id = v1.id,
            parent = a3,
            volume = v1.volume,
            size = a4,
            audioGroup = v1.audioGroup,
        }))
        self._soundPoolParents[a2] = a3
    end
    return self._soundPools[a2]
end

function v1:_playPooledSound(a2, a3, a4) -- Line: 1308
    -- upvalues: Sounds (val), u50 (val)
    local v1 = Sounds[a2]
    local v2 = self:_getSoundPool(a2, self:_getSoundParent(a3), a4)
    if v1 and v2 then
        v2:play({playbackSpeed = u50:NextNumber(0.95, 1.05), volume = v1.volume})
        return
    end
end

function v1:_playFireSound(a2) -- Line: 1321 -- types: self: table, a2: userdata?
    self:_playPooledSound(self:_getFireSoundName(), a2, 6)
end

function v1:_destroySoundPools() -- Line: 1325
    for i, j in self._soundPools do
        j:destroy()
    end
    table.clear(self._soundPools)
    table.clear(self._soundPoolParents)
end

function v1._getSharedOpticsParent(a1) -- Line: 1334 -- upvalues: getSharedOpticsParent (val)
    return getSharedOpticsParent(a1.Model)
end

function v1:_playFireAnimation() -- Line: 1338 -- upvalues: GameState (val)
    if self._fireTrack and self._fireTrack.IsPlaying then
        self._fireTrack:Stop(0)
    end
    self._fireTrack = self:Animate("Fire", nil, {0.02})
    self._fireAnimationKey = self:_getAnimationKey("Fire")
    if self._fireTrack then
        self._fireTrack.Looped = false
        self._fireTrack:AdjustSpeed(GameState.TimeScale)
    end
end

function v1:_resetAnimationState() -- Line: 1352
    self._outroToken = self._outroToken + 1
    self:_stopADS()
    if self._fireTrack then
        self._fireTrack:Stop(0)
        self._fireTrack = nil
        self._fireAnimationKey = nil
    end
    if self._outroTrack then
        self._outroTrack:Stop(0)
        self._outroTrack = nil
    end
end

function v1:Fire(a2) -- Line: 1368 -- upvalues: EmitterManager (val) -- types: self: table, a2: userdata?
    if not a2 or not a2:IsA("Model") then
        a2 = self:FindTarget()
    end
    if a2 and a2.PrimaryPart then
        local PrimaryPart = a2.PrimaryPart
        local Torso = a2:FindFirstChild("Torso")
        local Position = Torso and Torso.Position or PrimaryPart.Position
        local v1 = self:_getMuzzle()
        local WorldPosition = v1 and v1.WorldPosition or self.Model.PrimaryPart.Position
        self._outroToken = self._outroToken + 1
        self:_playADS()
        self:_playFireAnimation()
        self:Face(Position)
        if v1 then
            EmitterManager.manualEmit(v1)
        end
        self:_playFireSound(v1)
        self:Bullet({
            Spread = 35,
            Speed = 140,
            Bullet = "Normal",
            Start = WorldPosition,
            End = Position,
        })
        self:_queueOutro()
        return
    end
end

function v1.PreviewPlacement(a1, a2) -- Line: 1405
    -- upvalues: RunService (val), isPlacementNearCoordinationProvider (val), createPlacementAura (val)
    local u2 = nil
    local u3 = nil
    local u4 = false
    local u5 = 0.25
    a2.maid:Mark(function() -- Line: 1411 -- upvalues: u3 (ref), u2 (ref)
        if u3 then
            u3()
            u3 = nil
        end
        if u2 then
            u2:Destroy()
            u2 = nil
        end
    end)
    a2.maid:Mark((RunService.Heartbeat:Connect(function(a1) -- Line: 1425
        -- upvalues: a2 (val), u3 (ref), u2 (ref), u5 (ref), u4 (ref), isPlacementNearCoordinationProvider (upval)
        -- upvalues: createPlacementAura (upval)
        if a2.model and a2.model.Parent then
            local CFrame, CFrame_2
            local model = a2.model
            if not model then
                CFrame = nil
            elseif model.Parent then
                local PrimaryPart = model.PrimaryPart or model:FindFirstChild("HumanoidRootPart") or model:FindFirstChild("RootPart") or model:FindFirstChildWhichIsA("BasePart")
                CFrame = PrimaryPart and PrimaryPart.CFrame or model:GetPivot()
            else
                CFrame = nil
            end
            local model_2 = a2.model
            if not model_2 then
                CFrame_2 = nil
            elseif model_2.Parent then
                local PrimaryPart_2 = model_2.PrimaryPart or model_2:FindFirstChild("HumanoidRootPart") or model_2:FindFirstChild("RootPart") or model_2:FindFirstChildWhichIsA("BasePart")
                CFrame_2 = PrimaryPart_2 and PrimaryPart_2.CFrame or model_2:GetPivot()
            else
                CFrame_2 = nil
            end
            local Position = CFrame_2 and CFrame_2.Position
            if CFrame and Position then
                local v1
                u5 = u5 + a1
                if u5 >= 0.25 then
                    u5 = 0
                    u4 = isPlacementNearCoordinationProvider(Position, a2.model)
                    if not u4 then
                        if u3 then
                            u3()
                            u3 = nil
                        end
                        if u2 then
                            u2:Destroy()
                            u2 = nil
                        end
                    end
                end
                if not u4 then
                    return
                end
                if not u2 or not u2.Parent then
                    local v2
                    if u3 then
                        u3()
                        u3 = nil
                    end
                    if u2 then
                        u2:Destroy()
                        u2 = nil
                    end
                    v1, v2 = createPlacementAura(CFrame)
                    u2 = v1
                    u3 = v2
                end
                if u2 then
                    v1 = u2
                    if v1:IsA("Model") then
                        v1:PivotTo(CFrame)
                        return
                    end
                    if v1:IsA("BasePart") or v1:IsA("Attachment") then
                        v1.CFrame = CFrame
                    end
                end
                return
            end
            if u3 then
                u3()
                u3 = nil
            end
            if u2 then
                u2:Destroy()
                u2 = nil
            end
            return
        end
        if u3 then
            u3()
            u3 = nil
        end
        if u2 then
            u2:Destroy()
            u2 = nil
        end
    end)))
end

function v1.Placed(a1, a2) -- Line: 1463
    -- upvalues: isPlacementNearCoordinationProvider (val), emitPlacementTrigger (val)
    local Position
    local model = a2.model
    if not model then
        Position = a2.position
    else
        local CFrame_2
        if not model then
            CFrame_2 = nil
        elseif model.Parent then
            local PrimaryPart = model.PrimaryPart or model:FindFirstChild("HumanoidRootPart") or model:FindFirstChild("RootPart") or model:FindFirstChildWhichIsA("BasePart")
            CFrame_2 = PrimaryPart and PrimaryPart.CFrame or model:GetPivot()
        else
            CFrame_2 = nil
        end
        Position = CFrame_2 and CFrame_2.Position or a2.position
    end
    if not Position or not isPlacementNearCoordinationProvider(Position, model) then
        return
    end
    local CFrame_3 = model
    if CFrame_3 then
        if not model then
            CFrame_3 = nil
        elseif model.Parent then
            local PrimaryPart_2 = model.PrimaryPart or model:FindFirstChild("HumanoidRootPart") or model:FindFirstChild("RootPart") or model:FindFirstChildWhichIsA("BasePart")
            CFrame_3 = PrimaryPart_2 and PrimaryPart_2.CFrame or model:GetPivot()
        else
            CFrame_3 = nil
        end
    end
    if not CFrame_3 then
        local v1 = CFrame.new(Position)
        local rotation = a2.rotation or CFrame.new()
        CFrame_3 = v1 * rotation
    end
    emitPlacementTrigger(CFrame_3, nil)
end

function v1.Initialize(a1) -- Line: 1482
    -- upvalues: u63 (val), startCoordinationLinkManager (val), stopCoordinationLinkManager (val)
    a1._adsTrack = nil
    a1._fireTrack = nil
    a1._outroTrack = nil
    a1._adsAnimationKey = nil
    a1._fireAnimationKey = nil
    a1._outroToken = 0
    a1._soundPools = {}
    a1._soundPoolParents = {}
    u63[a1] = true
    startCoordinationLinkManager()
    a1.OnUpgrade:Connect(function() -- Line: 1494 -- upvalues: a1 (val)
        a1:_resetAnimationState()
        a1:_destroySoundPools()
    end)
    a1.Executables = {
        Fire = function(a1_2) -- Line: 1500 -- upvalues: a1 (val)
            a1:Fire(a1_2)
        end,
        Reloading = function(a1_2) -- Line: 1503 -- upvalues: a1 (val) -- types: a1_2: boolean
            if a1_2 then
                a1:_playPooledSound("Reload", a1.Model.PrimaryPart, 2)
            end
        end,
    }
    a1.Maid:Mark(function() -- Line: 1510 -- upvalues: a1 (val), u63 (upval), stopCoordinationLinkManager (upval)
        u63[a1] = nil
        if next(u63) == nil then
            stopCoordinationLinkManager()
        end
        a1:_resetAnimationState()
        a1:_destroySoundPools()
    end)
end

return v1