-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.Classes.RangeRing
-- Decompile time: 11.01 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local InstancePool = require(ReplicatedStorage.Shared.Modules.InstancePool)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local u20 = {}
u20.__index = u20
u20.DefaultLineSize = Vector3.new(0.800000011920929, 0, 0.10000000149011612)
u20.DefaultLineOffset = 1
local u25 = {}
local u26 = 0
local u27 = {}
local u28 = {}
local u29 = nil

local function countLinesOnCircumference(a1, a2, a3) -- Line: 39 -- types: a1: number, a2: number, a3: number
    local v1 = 6.283185307179586 * a1
    if not (a2 <= 0) and not (a3 < 0) then
        return (math.floor(v1 / (a2 + a3)))
    end
    return 0
end

local function configureWorldPart(a1) -- Line: 49 -- types: a1: userdata
    a1.Anchored = true
    a1.CanCollide = false
    a1.CanQuery = false
    a1.CanTouch = false
    a1.CastShadow = false
    a1.Massless = true
end

local function createCirclePart() -- Line: 58
    local Part = Instance.new("Part")
    Part.Name = "RangeCircle"
    Part.Transparency = 0.85
    Part.Material = Enum.Material.Neon
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.CastShadow = false
    Part.Massless = true
    local SpecialMesh = Instance.new("SpecialMesh")
    SpecialMesh.Name = "Mesh"
    SpecialMesh.MeshType = Enum.MeshType.FileMesh
    SpecialMesh.MeshId = "rbxassetid://3746001467"
    SpecialMesh.Parent = Part
    return Part
end

local function createLinePart() -- Line: 74
    local Part = Instance.new("Part")
    Part.Name = "RangeLine"
    Part.Transparency = 0
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.CastShadow = false
    Part.Massless = true
    local SpecialMesh = Instance.new("SpecialMesh")
    SpecialMesh.Name = "Mesh"
    SpecialMesh.MeshType = Enum.MeshType.FileMesh
    SpecialMesh.MeshId = "rbxassetid://17118103950"
    SpecialMesh.Parent = Part
    return Part
end

local u38 = InstancePool.new((createCirclePart()))
local new = InstancePool.new
local Part = Instance.new("Part")
Part.Name = "RangeLine"
Part.Transparency = 0
Part.Anchored = true
Part.CanCollide = false
Part.CanQuery = false
Part.CanTouch = false
Part.CastShadow = false
Part.Massless = true
local SpecialMesh = Instance.new("SpecialMesh")
SpecialMesh.Name = "Mesh"
SpecialMesh.MeshType = Enum.MeshType.FileMesh
SpecialMesh.MeshId = "rbxassetid://17118103950"
SpecialMesh.Parent = Part
local u58 = new(Part)

local function getWorldPartsParent() -- Line: 92
    return workspace.CurrentCamera or workspace
end

local function setPartSize(a1, a2) -- Line: 96 -- types: a1: userdata, a2: vector
    a1.Size = a2
    local Mesh = a1:FindFirstChild("Mesh")
    if Mesh and Mesh:IsA("SpecialMesh") then
        Mesh.Scale = a2
    end
end

local function acquireCirclePart(a1) -- Line: 105 -- upvalues: u38 (ref) -- types: a1: userdata
    local v1 = u38:Get()
    v1.Anchored = true
    v1.CanCollide = false
    v1.CanQuery = false
    v1.CanTouch = false
    v1.CastShadow = false
    v1.Massless = true
    v1.Parent = a1
    return v1
end

local function acquireLinePart(a1) -- Line: 112 -- upvalues: u58 (ref) -- types: a1: userdata
    local v1 = u58:Get()
    v1.Anchored = true
    v1.CanCollide = false
    v1.CanQuery = false
    v1.CanTouch = false
    v1.CastShadow = false
    v1.Massless = true
    v1.Parent = a1
    return v1
end

local function releaseCirclePart(a1) -- Line: 119 -- upvalues: u38 (ref) -- types: a1: userdata?
    if not a1 then
        return
    end
    u38:Return(a1)
    a1.Parent = nil
end

local function releaseLinePart(a1) -- Line: 128 -- upvalues: u58 (ref) -- types: a1: userdata?
    if not a1 then
        return
    end
    u58:Return(a1)
    a1.Parent = nil
end

local function applyFillState(a1) -- Line: 137
    a1.circle.Transparency = if not a1.disableFill then a1.fillTransparency else 1
end

local function applyColorState(a1) -- Line: 141
    a1.circle.Color = a1.color
    a1.highlight.FillColor = a1.color
    a1.highlight.OutlineColor = a1.color
    for i, j in a1.lines do
        j.Color = a1.color
    end
    a1.lastColor = a1.color
end

local function syncLineCount(a1, a2, a3) -- Line: 153 -- upvalues: u58 (ref) -- types: a2: number, a3: vector
    local Mesh, lineContainer, v1
    local lines = a1.lines
    local v2, v3, v4 = a2, a1, a3
    while #lines < v2 do
        lineContainer = v3.lineContainer
        v1 = u58:Get()
        v1.Anchored = true
        v1.CanCollide = false
        v1.CanQuery = false
        v1.CanTouch = false
        v1.CastShadow = false
        v1.Massless = true
        v1.Parent = lineContainer
        v1.Color = v3.color
        v1.Transparency = v3.lineTransparency
        v1.Size = v4
        Mesh = v1:FindFirstChild("Mesh")
        if Mesh and Mesh:IsA("SpecialMesh") then
            Mesh.Scale = v4
        end
        table.insert(lines, v1)
        v3.dirty = true
    end
    while v2 < #lines do
        v1 = table.remove(lines)
        if v1 then
            u58:Return(v1)
            v1.Parent = nil
        end
        v3.dirty = true
    end
    if v3.lineSize ~= v4 then
        local Mesh_2
        for i, j in lines do
            j.Size = v4
            Mesh_2 = j:FindFirstChild("Mesh")
            if Mesh_2 and Mesh_2:IsA("SpecialMesh") then
                Mesh_2.Scale = v4
            end
        end
        v3.lineSize = v4
    end
end

local function updateRangeRings() -- Line: 180 -- upvalues: u26 (ref), u27 (val), u28 (val), u25 (val)
    local Mesh, circle, current, dirty, radius, v1, v2, v3, v4
    if u26 == 0 then
        return
    end
    table.clear(u27)
    table.clear(u28)
    local v5 = 1
    local v6 = nil
    local v7 = nil
    for i in u25, v6, v7 do
        current = i.parentRef.current
        if current then
            radius = i.radius
            v4 = current.CFrame * CFrame.new(i.offset)
            dirty = i.dirty
            if not dirty then
                dirty = true
                if i.lastBaseCFrame == v4 then
                    dirty = i.lastRadius ~= radius
                end
            end
            if i.lastColor ~= i.color then
                i.circle.Color = i.color
                i.highlight.FillColor = i.color
                i.highlight.OutlineColor = i.color
                for j, k in i.lines do
                    k.Color = i.color
                end
                i.lastColor = i.color
            end
            if dirty then
                v1 = Vector3.new(radius * 2, 0, radius * 2)
                circle = i.circle
                circle.Size = v1
                Mesh = circle:FindFirstChild("Mesh")
                if Mesh and Mesh:IsA("SpecialMesh") then
                    Mesh.Scale = v1
                end
                u27[v5] = i.circle
                u28[v5] = v4
                v5 = v5 + 1
                v2 = #i.lines
                for n, m in i.lines do
                    v3 = v4 * CFrame.Angles(0, 6.283185307179586 / v2 * n, 0) * CFrame.new(0, 0, -radius)
                    u27[v5] = m
                    u28[v5] = v3
                    v5 = v5 + 1
                end
                i.lastBaseCFrame = v4
                i.lastRadius = radius
                i.dirty = false
            end
        end
    end
    if v5 > 1 then
        workspace:BulkMoveTo(u27, u28, Enum.BulkMoveMode.FireCFrameChanged)
    end
end

local function startRangeRingUpdater() -- Line: 241
    -- upvalues: u29 (ref), Scheduler (val), RunService (val), updateRangeRings (val)
    if u29 then
        return
    end
    u29 = Scheduler.add("SegmentedRangeRingParts", RunService.RenderStepped, updateRangeRings)
end

local function stopRangeRingUpdater() -- Line: 250 -- upvalues: u26 (ref), u29 (ref)
    if not (u26 > 0) and u29 then
        u29()
        u29 = nil
        return
    end
end

function u20.SetRadius(a1, a2) -- Line: 259 -- upvalues: syncLineCount (val) -- types: a1: table, a2: number
    if a1.destroyed then
        return
    end
    a1.radius = a2
    local X = a1.lineSize.X
    local lineOffset = a1.lineOffset
    local v1 = 6.283185307179586 * a2
    syncLineCount(a1, if X <= 0 then 0 else if not (lineOffset < 0) then math.floor(v1 / (X + lineOffset)) else 0, a1.lineSize)
    a1.dirty = true
end

function u20.SetColor(a1, a2) -- Line: 273 -- types: a1: table, a2: userdata
    if a1.destroyed then
        return
    end
    a1.color = a2
end

function u20:Destroy() -- Line: 281 -- upvalues: u25 (val), u26 (ref), u38 (ref), u58 (ref), u29 (ref)
    if self.destroyed then
        return
    end
    self.destroyed = true
    if u25[self] then
        u25[self] = nil
        u26 = u26 - 1
    end
    local circle = self.circle
    if circle then
        u38:Return(circle)
        circle.Parent = nil
    end
    for i, j in self.lines do
        if j then
            u58:Return(j)
            j.Parent = nil
        end
    end
    table.clear(self.lines)
    self.container:Destroy()
    if not (u26 > 0) then
        if not u29 then
            return
        end
        u29()
        u29 = nil
    end
end

function u20.new(a1) -- Line: 304
    -- upvalues: u38 (ref), u20 (val), u25 (val), u26 (ref), u29 (ref), Scheduler (val), RunService (val)
    -- upvalues: updateRangeRings (val), syncLineCount (val)
    local v1 = a1.LineSize or Vector3.new(0.800000011920929, 0, 0.10000000149011612)
    local v2 = a1.LineOffset or 1
    local Color = a1.Color
    local Radius = a1.Radius
    local v3 = a1.DisableFill == true
    local v4 = a1.FillTransparency or 0.85
    local v5 = a1.LineTransparency or 0
    local Model = Instance.new("Model")
    Model.Name = "Range"
    local CurrentCamera = workspace.CurrentCamera or workspace
    Model.Parent = CurrentCamera
    local Model_2 = Instance.new("Model")
    Model_2.Name = "Lines"
    Model_2.Parent = Model
    local Highlight = Instance.new("Highlight")
    Highlight.OutlineColor = Color
    Highlight.FillColor = Color
    Highlight.OutlineTransparency = 1
    Highlight.FillTransparency = 0.6
    Highlight.Parent = Model_2
    local v6 = {dirty = true, destroyed = false}
    local v7 = u38:Get()
    v7.Anchored = true
    v7.CanCollide = false
    v7.CanQuery = false
    v7.CanTouch = false
    v7.CastShadow = false
    v7.Massless = true
    v7.Parent = Model
    v6.circle = v7
    v6.color = Color
    v6.container = Model
    v6.disableFill = v3
    v6.fillTransparency = v4
    v6.highlight = Highlight
    v6.lineTransparency = v5
    v6.lineContainer = Model_2
    v6.lineOffset = v2
    v6.lineSize = v1
    v6.lines = {}
    v6.offset = a1.Offset or Vector3.new(0, 0, 0)
    v6.parentRef = a1.ParentRef
    v6.radius = Radius
    local v8 = setmetatable(v6, u20)
    u25[v8] = true
    u26 = u26 + 1
    if not u29 then
        u29 = Scheduler.add("SegmentedRangeRingParts", RunService.RenderStepped, updateRangeRings)
    end
    v8.circle.Transparency = if not v8.disableFill then v8.fillTransparency else 1
    v8.circle.Color = v8.color
    v8.highlight.FillColor = v8.color
    v8.highlight.OutlineColor = v8.color
    for i, j in v8.lines do
        j.Color = v8.color
    end
    v8.lastColor = v8.color
    local circle_2 = v8.circle
    v7 = Vector3.new(Radius * 2, 0, Radius * 2)
    circle_2.Size = v7
    local Mesh = circle_2:FindFirstChild("Mesh")
    if Mesh and Mesh:IsA("SpecialMesh") then
        Mesh.Scale = v7
    end
    local X = v1.X
    local v9 = 6.283185307179586 * Radius
    syncLineCount(v8, if X <= 0 then 0 else if not (v2 < 0) then math.floor(v9 / (X + v2)) else 0, v1)
    return v8
end

return u20