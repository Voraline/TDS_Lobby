-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.Classes.RangeRingPositioner
-- Decompile time: 2.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local u15 = {}
u15.__index = u15

local function getBoundaryTarget(a1) -- Line: 12 -- types: a1: userdata
    local HeightOffset = a1:FindFirstChild("HeightOffset")
    if not HeightOffset then
        return a1
    end
    if not HeightOffset:IsA("BasePart") and not HeightOffset:IsA("Attachment") then
        return a1
    end
    return HeightOffset
end

local function getTargetPositionAndRotation(a1, a2) -- Line: 19 -- types: a1: userdata, a2: userdata
    local v1 = CFrame.new()
    if a1:IsA("Attachment") then
        return a1.WorldPosition, v1
    end
    local v2 = a1.Position + Vector3.new(0, 0.20000000298023224, 0)
    if a2.Shape == Enum.PartType.Cylinder then
        v1 = CFrame.Angles(-1.5707963267948966, 1.5707963267948966, 0)
    end
    return v2, v1
end

function u15.new() -- Line: 36 -- upvalues: u15 (val)
    local v1 = {
        _boundaries = {},
        _bulkMoveCFs = {},
        _bulkMoveParts = {},
        _groundFilter = {},
        _rangeRaycastParams = RaycastParams.new(),
        _rings = {},
    }
    local v2 = setmetatable(v1, u15)
    v2._rangeRaycastParams.FilterType = Enum.RaycastFilterType.Include
    v2._rangeRaycastParams.IgnoreWater = true
    v2._rangeRaycastParams.RespectCanCollide = false
    return v2
end

function u15:_start() -- Line: 55 -- upvalues: Scheduler (val), RunService (val)
    if self._disconnect then
        return
    end
    self._disconnect = Scheduler.add("UpdateRangeRings", RunService.Heartbeat, function(a1) -- Line: 60 -- upvalues: self (val)
        self:_update(a1)
    end)
end

function u15:_stopIfIdle() -- Line: 65
    if self._disconnect and next(self._rings) == nil and next(self._boundaries) == nil then
        self._disconnect()
        self._disconnect = nil
        return
    end
end

function u15:_updateGroundFilter() -- Line: 74
    local Ground = workspace:FindFirstChild("Ground")
    if Ground == self._currentGround then
        return
    end
    self._currentGround = Ground
    table.clear(self._groundFilter)
    if Ground then
        self._groundFilter[1] = Ground
    end
    self._rangeRaycastParams.FilterDescendantsInstances = self._groundFilter
end

function u15:_updateRangeRing(a2, a3, a4) -- Line: 90
    -- upvalues: getTargetPositionAndRotation (val)
    local current = a2.current
    if not current then
        return a4
    end
    local v1, v2 = getTargetPositionAndRotation(a3, current)
    local Attribute = current:GetAttribute("TargetY")
    if not Attribute then
        local v3 = workspace
        local _rangeRaycastParams = self._rangeRaycastParams
        v3 = v3:Raycast(v1, Vector3.new(0, -100, 0), _rangeRaycastParams)
        Attribute = if not v3 then v1.Y else v3.Position.Y + 0.2
    end
    self._bulkMoveCFs[a4] = CFrame.new(v1.X, Attribute, v1.Z) * v2
    self._bulkMoveParts[a4] = current
    return a4 + 1
end

function u15:_updateBoundary(a2, a3, a4) -- Line: 112
    -- upvalues: getTargetPositionAndRotation (val)
    local current = a2.current
    if not current then
        return a4
    end
    local v1, v2 = getTargetPositionAndRotation(a3, current)
    self._bulkMoveCFs[a4] = CFrame.new(v1) * v2
    self._bulkMoveParts[a4] = current
    return a4 + 1
end

function u15:_update(a2) -- Line: 126 -- types: self: table, a2: number
    if next(self._rings) == nil and next(self._boundaries) == nil then
        return
    end
    table.clear(self._bulkMoveParts)
    table.clear(self._bulkMoveCFs)
    self:_updateGroundFilter()
    local v1 = 1
    for i, j in self._rings do
        v1 = self:_updateRangeRing(i, j, v1)
    end
    for k, n in self._boundaries do
        v1 = self:_updateBoundary(k, n, v1)
    end
    if v1 > 1 then
        workspace:BulkMoveTo(self._bulkMoveParts, self._bulkMoveCFs, Enum.BulkMoveMode.FireCFrameChanged)
    end
end

function u15.Register(a1, a2, a3, a4) -- Line: 154 -- types: a1: table, a2: table, a3: table, a4: userdata
    a1._rings[a2] = a4
    local _boundaries = a1._boundaries
    local HeightOffset = a4:FindFirstChild("HeightOffset")
    _boundaries[a3] = if not HeightOffset then a4 else if HeightOffset:IsA("BasePart") then HeightOffset else if not HeightOffset:IsA("Attachment") then a4 else HeightOffset
    a1:_start()
end

function u15.Unregister(a1, a2, a3) -- Line: 160 -- types: a1: table, a2: table, a3: table
    a1._rings[a2] = nil
    a1._boundaries[a3] = nil
    a1:_stopIfIdle()
end

function u15.Destroy(a1) -- Line: 166
    if a1._disconnect then
        a1._disconnect()
        a1._disconnect = nil
    end
    table.clear(a1._rings)
    table.clear(a1._boundaries)
end

return u15