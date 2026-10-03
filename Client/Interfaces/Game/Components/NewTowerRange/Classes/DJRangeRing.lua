-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.Classes.DJRangeRing
-- Decompile time: 8.12 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local InstancePool = require(ReplicatedStorage.Shared.Modules.InstancePool)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local u20 = {}
u20.__index = u20
local Hz60 = Enum.StepFrequency.Hz60
local u23 = {}
local u24 = {}

local function configureWorldPart(a1) -- Line: 39 -- types: a1: userdata
    a1.Anchored = true
    a1.CanCollide = false
    a1.CanQuery = false
    a1.CanTouch = false
    a1.CastShadow = false
    a1.Massless = true
end

local function createVisualizerPart() -- Line: 48
    local Part = Instance.new("Part")
    Part.Name = "VisualizerBar"
    Part.Material = Enum.Material.Neon
    Part.Transparency = 0
    Part.Size = Vector3.new(0.5, 0.0010000000474974513, 0.05000000074505806)
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.CastShadow = false
    Part.Massless = true
    return Part
end

local function createFillCirclePart() -- Line: 59
    local Part = Instance.new("Part")
    Part.Name = "DJRangeFill"
    Part.Material = Enum.Material.Neon
    Part.Transparency = 0.85
    Part.Size = Vector3.new(0.0010000000474974513, 0, 0.0010000000474974513)
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
    SpecialMesh.Scale = Part.Size
    SpecialMesh.Parent = Part
    return Part
end

local new = InstancePool.new
local Part = Instance.new("Part")
Part.Name = "VisualizerBar"
Part.Material = Enum.Material.Neon
Part.Transparency = 0
Part.Size = Vector3.new(0.5, 0.0010000000474974513, 0.05000000074505806)
Part.Anchored = true
Part.CanCollide = false
Part.CanQuery = false
Part.CanTouch = false
Part.CastShadow = false
Part.Massless = true
local u43 = new(Part)

local function getWorldPartsParent() -- Line: 79
    return workspace.CurrentCamera or workspace
end

local function setPartSize(a1, a2) -- Line: 83 -- types: a1: userdata, a2: vector
    a1.Size = a2
    local Mesh = a1:FindFirstChild("Mesh")
    if Mesh and Mesh:IsA("SpecialMesh") then
        Mesh.Scale = a2
    end
end

local function acquireVisualizerPart(a1) -- Line: 92 -- upvalues: u43 (ref) -- types: a1: userdata
    local v1 = u43:Get()
    v1.Anchored = true
    v1.CanCollide = false
    v1.CanQuery = false
    v1.CanTouch = false
    v1.CastShadow = false
    v1.Massless = true
    v1.Parent = a1
    return v1
end

local function releaseVisualizerPart(a1) -- Line: 99 -- upvalues: u43 (ref) -- types: a1: userdata?
    if not a1 then
        return
    end
    u43:Return(a1)
    a1.Parent = nil
end

local function lerp(a1, a2, a3) -- Line: 108 -- types: a1: number, a2: number, a3: number
    return a2 * a3 + a1 * (1 - a3)
end

local function getMappedBins(a1, a2, a3) -- Line: 112 -- types: a1: userdata, a2: userdata, a3: number
    local v1
    local Spectrum = a1:GetSpectrum()
    if Spectrum and #Spectrum ~= 0 then
        local v2, v3, v4, v5, v6, v7, v8
        v1 = {}
        for i = 1, a3 do
            v7 = math.pow(#Spectrum, i / a3)
            v8 = math.max(1, (math.floor(v7)))
            v2 = math.min(#Spectrum, (math.ceil(v7)))
            v3 = v7 - math.floor(v7)
            v5 = Spectrum[v8]
            v4 = math.pow(math.clamp((math.sqrt(Spectrum[v2] * v3 + v5 * (1 - v3))) * 2, 0, 10), 0.6666666666666666)
            v6 = i * 1 + a2.TimePosition
            v1[i] = v4 + math.sin(v6) * 0.05
        end
        return v1
    end
    v1 = {}
    for j = 1, a3 do
        v1[j] = 0
    end
    return v1
end

local function syncVisualizerPartCount(a1, a2) -- Line: 145 -- upvalues: u43 (ref) -- types: a2: number
    local container, v1, v2, v3
    while #a1.parts < a2 do
        container = a1.container
        v3 = u43:Get()
        v3.Anchored = true
        v3.CanCollide = false
        v3.CanQuery = false
        v3.CanTouch = false
        v3.CastShadow = false
        v3.Massless = true
        v3.Parent = container
        table.insert(a1.parts, v3)
    end
    while v2 < #v1.parts do
        v3 = table.remove(v1.parts)
        if v3 then
            u43:Return(v3)
            v3.Parent = nil
        end
    end
end

local function updateTrackColor(a1, a2) -- Line: 157 -- types: a2: number
    local v1 = a1.trackColors[a1.track:getValue()]
    if not v1 then
        return
    end
    local v2 = a1.lastColor ~= nil and a1.lastColor:lerp(v1, a2 * 5) or v1
    a1.lastColor = v2
    a1.pendingRangeColor = v2
    return v2
end

local function getThrottledAudioBins(a1, a2, a3) -- Line: 171
    -- upvalues: getMappedBins (val)
    a1.audioAnalyzerDt = a1.audioAnalyzerDt + a2
    if not a1.audioBins or 0.06666666666666667 <= a1.audioAnalyzerDt then
        a1.audioAnalyzerDt = a1.audioAnalyzerDt % 0.06666666666666667
        if not a1.audioAnalyzer or not a1.audioPlayer then
            a1.audioBins = {}
        else
            a1.audioBins = getMappedBins(a1.audioAnalyzer, a1.audioPlayer, a3)
        end
    end
    return a1.audioBins
end

local function stepVisualizer(a1, a2) -- Line: 188 -- upvalues: getThrottledAudioBins (val) -- types: a2: number
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
    local v12 = a1.trackColors[a1.track:getValue()]
    if v12 then
        v11 = a1.lastColor ~= nil and a1.lastColor:lerp(v12, a2 * 5) or v12
        a1.lastColor = v11
        a1.pendingRangeColor = v11
        v5 = v11
    else
        v5 = nil
    end
    local current = a1.rangeRef.current
    if not current then
        return
    end
    v11 = v5 or a1.rangeColor:getValue()
    local v13 = (a1.range:getValue()) * a1.rangeAnimation:getValue()
    local CFrame_2 = current.CFrame
    a1.desiredFillColor = v11
    a1.desiredFillCFrame = CFrame_2
    a1.desiredFillSize = Vector3.new(v13 * 2, 0, v13 * 2)
    a1.needsApply = true
    local maxBars = a1.maxBars
    if maxBars <= 0 then
        return
    end
    local v14 = getThrottledAudioBins(a1, a2, (math.ceil(maxBars / 2)))
    local v15 = 6.283185307179586 / maxBars
    a1.angleOffset = (a1.angleOffset + 6.283185307179586 * a2 * 0.025) % 6.283185307179586
    local v16 = v11:lerp(Color3.new(), 0.7)
    local v17 = v11:lerp(Color3.new(1, 1, 1), 0.25)
    for i = 1, maxBars do
        v1 = v14[if not ((maxBars + 1) / 2 < i) then i else maxBars - i + 1]
        v2 = v1 and v1 * 1.5 or 0
        v3 = 3 * v2
        v6 = a1.heights[i] or 0
        v7 = a2 * 10
        v4 = v3 * v7 + v6 * (1 - v7)
        v6 = math.max(v4, 0.001)
        a1.heights[i] = v4
        v7 = a1.colors[i]
        v8 = v16:lerp(v17, (math.clamp(v2, 0, 1)))
        v9 = v7 and v7:lerp(v8, a2 * 10) or v8
        a1.colors[i] = v9
        v10 = CFrame_2 * CFrame.Angles(0, (i - 1) * v15 + a1.angleOffset, 0) * CFrame.new(0, v4 / 2, v13)
        a1.desiredHeights[i] = v6
        a1.desiredColors[i] = v9
        a1.desiredCFrames[i] = v10
    end
end

local function applyVisualizer(a1) -- Line: 243 -- upvalues: stepVisualizer (val), u23 (val), u24 (val)
    local v1, v2, v3
    if a1.destroyed then
        return
    end
    local pendingStepDt = a1.pendingStepDt
    if pendingStepDt and pendingStepDt > 0 then
        a1.pendingStepDt = 0
        stepVisualizer(a1, pendingStepDt)
    end
    if a1.pendingRangeColor then
        a1.setRangeColor(a1.pendingRangeColor)
        a1.highlight.OutlineColor = a1.pendingRangeColor
        a1.pendingRangeColor = nil
    end
    if not a1.needsApply then
        return
    end
    table.clear(u23)
    table.clear(u24)
    local v4 = 1
    if a1.fillCircle and a1.desiredFillSize and a1.desiredFillCFrame then
        local fillCircle = a1.fillCircle
        local desiredFillSize = a1.desiredFillSize
        fillCircle.Size = desiredFillSize
        local Mesh = fillCircle:FindFirstChild("Mesh")
        if Mesh and Mesh:IsA("SpecialMesh") then
            Mesh.Scale = desiredFillSize
        end
        a1.fillCircle.Color = a1.desiredFillColor
        u23[v4] = a1.fillCircle
        u24[v4] = a1.desiredFillCFrame
        v4 = v4 + 1
    end
    for i, j in a1.parts do
        v2 = a1.desiredHeights[i]
        v3 = a1.desiredColors[i]
        v1 = a1.desiredCFrames[i]
        if v2 and v3 and v1 then
            j.Size = Vector3.new(0.5, v2, 0.05)
            j.Color = v3
            u23[v4] = j
            u24[v4] = v1
            v4 = v4 + 1
        end
    end
    if v4 > 1 then
        workspace:BulkMoveTo(u23, u24, Enum.BulkMoveMode.FireCFrameChanged)
    end
    a1.needsApply = false
end

local function queueVisualizerStep(a1, a2) -- Line: 305 -- types: a2: number
    if a1.destroyed then
        return
    end
    a1.pendingStepDt = (a1.pendingStepDt or 0) + a2
end

function u20:Destroy() -- Line: 313 -- upvalues: u43 (ref)
    if self.destroyed then
        return
    end
    self.destroyed = true
    self.simulationDisconnect()
    self.renderDisconnect()
    for i, j in self.parts do
        if j then
            u43:Return(j)
            j.Parent = nil
        end
    end
    table.clear(self.parts)
    table.clear(self.heights)
    table.clear(self.colors)
    table.clear(self.desiredHeights)
    table.clear(self.desiredColors)
    table.clear(self.desiredCFrames)
    self.container:Destroy()
end

function u20.new(a1) -- Line: 335
    -- upvalues: createFillCirclePart (val), u20 (val), syncVisualizerPartCount (val), Scheduler (val), Hz60 (val)
    -- upvalues: RunService (val), applyVisualizer (val)
    local v1 = a1.TrackColors[a1.Track:getValue()] or a1.RangeColor:getValue()
    local Model = Instance.new("Model")
    Model.Name = "Visualizers"
    local CurrentCamera = workspace.CurrentCamera or workspace
    Model.Parent = CurrentCamera
    local Highlight = Instance.new("Highlight")
    Highlight.FillTransparency = 1
    Highlight.OutlineColor = v1
    Highlight.OutlineTransparency = 0.5
    Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Highlight.Parent = Model
    local v2 = createFillCirclePart()
    v2.Color = v1
    v2.Parent = Model
    local PrimaryPart = a1.Model.PrimaryPart and a1.Model.PrimaryPart:FindFirstChild("AudioPlayer")
    local v3 = {
        angleOffset = 0,
        audioAnalyzerDt = 0.06666666666666667,
        destroyed = false,
        needsApply = false,
        pendingStepDt = 0,
        audioAnalyzer = PrimaryPart and PrimaryPart:FindFirstChild("AudioAnalyzer") or nil,
        audioPlayer = PrimaryPart,
        colors = {},
        container = Model,
        desiredCFrames = {},
        desiredColors = {},
        desiredFillColor = v1,
        desiredHeights = {},
        fillCircle = v2,
        heights = {},
        highlight = Highlight,
        lastColor = v1,
        maxBars = a1.MaxBars,
        parts = {},
        range = a1.Range,
        rangeAnimation = a1.RangeAnimation,
        rangeColor = a1.RangeColor,
        rangeRef = a1.RangeRef,
        setRangeColor = a1.SetRangeColor,
        track = a1.Track,
        trackColors = a1.TrackColors,
    }
    local u81 = setmetatable(v3, u20)
    syncVisualizerPartCount(u81, a1.MaxBars)
    u81.simulationDisconnect = Scheduler.bindToSimulationDynamic("DJRangeVisualizer", function(a1) -- Line: 397 -- upvalues: u81 (val)
        local v1 = u81
        if v1.destroyed then
            return
        end
        v1.pendingStepDt = (v1.pendingStepDt or 0) + a1
    end, Hz60)
    u81.renderDisconnect = Scheduler.addDynamic("DJRangeVisualizerRender", RunService.Heartbeat, function() -- Line: 405 -- upvalues: applyVisualizer (upval), u81 (val)
        applyVisualizer(u81)
    end)
    return u81
end

return u20