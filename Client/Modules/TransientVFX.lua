-- Script path: ReplicatedStorage.Client.Modules.TransientVFX
-- Decompile time: 4.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ParticleLODController = require(ReplicatedStorage.Client.Modules.ParticleLODController)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local u20 = {}
local u21 = {}
local u22 = 0
local u23 = 0
local u24 = 0

local function getEffectPosition(a1) -- Line: 31 -- types: a1: userdata
    if a1:IsA("Model") then
        return a1:GetPivot().Position
    end
    if a1:IsA("BasePart") then
        return a1.Position
    end
    if a1:IsA("Attachment") then
        return a1.WorldPosition
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

local function sanitizeInstance(a1) -- Line: 49 -- types: a1: userdata
    if not a1:IsA("BasePart") then
        return
    end
    a1.CanCollide = false
    a1.CanTouch = false
    a1.CanQuery = false
    a1.CastShadow = false
end

function u20.sanitize(a1) -- Line: 60 -- types: a1: userdata
    if a1:IsA("BasePart") then
        a1.CanCollide = false
        a1.CanTouch = false
        a1.CanQuery = false
        a1.CastShadow = false
    end
    for i, j in a1:GetDescendants() do
        if j:IsA("BasePart") then
            j.CanCollide = false
            j.CanTouch = false
            j.CanQuery = false
            j.CastShadow = false
        end
    end
end

local function finishRecord(a1) -- Line: 67 -- upvalues: u21 (val), u22 (ref), u24 (ref) -- types: a1: table
    if a1.destroyed then
        return
    end
    a1.destroyed = true
    u21[a1.root] = nil
    u22 = math.max(0, u22 - 1)
    u24 = u24 + 1
    if a1.destroyingConnection then
        a1.destroyingConnection:Disconnect()
        a1.destroyingConnection = nil
    end
    if a1.unregisterLOD then
        a1.unregisterLOD()
        a1.unregisterLOD = nil
    end
end

local function destroyRoot(a1) -- Line: 88 -- upvalues: u21 (val), u22 (ref), u24 (ref) -- types: a1: table
    if a1.destroyed then
        return
    end
    a1.root:Destroy()
    if not a1.destroyed then
        if a1.destroyed then
            return
        end
        a1.destroyed = true
        u21[a1.root] = nil
        u22 = math.max(0, u22 - 1)
        u24 = u24 + 1
        if a1.destroyingConnection then
            a1.destroyingConnection:Disconnect()
            a1.destroyingConnection = nil
        end
        if a1.unregisterLOD then
            a1.unregisterLOD()
            a1.unregisterLOD = nil
        end
    end
end

function u20.track(a1, a2) -- Line: 99
    -- upvalues: u20 (val), u21 (val), u22 (ref), u23 (ref), u24 (ref), ParticleLODController (val)
    -- upvalues: getEffectPosition (val)
    local v1 = a2 or {}
    u20.sanitize(a1)
    local u12 = u21[a1]
    if not u12 then
        u12 = {destroyed = false, root = a1, profileName = v1.profileName}
        u21[a1] = u12
        u22 = u22 + 1
        u23 = u23 + 1
        u12.destroyingConnection = a1.Destroying:Once(function() -- Line: 117 -- upvalues: u12 (ref), u21 (upval), u22 (upval), u24 (upval)
            local v1 = u12
            if v1.destroyed then
                return
            end
            v1.destroyed = true
            u21[v1.root] = nil
            u22 = math.max(0, u22 - 1)
            u24 = u24 + 1
            if v1.destroyingConnection then
                v1.destroyingConnection:Disconnect()
                v1.destroyingConnection = nil
            end
            if v1.unregisterLOD then
                v1.unregisterLOD()
                v1.unregisterLOD = nil
            end
        end)
    elseif v1.profileName then
        u12.profileName = v1.profileName
    end
    if v1.registerLOD ~= false and not u12.unregisterLOD then
        u12.unregisterLOD = ParticleLODController.registerRoot(a1, function() -- Line: 125 -- upvalues: getEffectPosition (upval), a1 (val)
            return (getEffectPosition(a1))
        end)
    end
    if v1.ttl then
        task.delay(math.max(0, v1.ttl), function() -- Line: 132 -- upvalues: u12 (ref), u21 (upval), u22 (upval), u24 (upval)
            local v1 = u12
            if v1.destroyed then
                return
            end
            v1.root:Destroy()
            if not v1.destroyed then
                if v1.destroyed then
                    return
                end
                v1.destroyed = true
                u21[v1.root] = nil
                u22 = math.max(0, u22 - 1)
                u24 = u24 + 1
                if v1.destroyingConnection then
                    v1.destroyingConnection:Disconnect()
                    v1.destroyingConnection = nil
                end
                if v1.unregisterLOD then
                    v1.unregisterLOD()
                    v1.unregisterLOD = nil
                end
            end
        end)
    end
    return function() -- Line: 137 -- upvalues: u12 (ref), u21 (upval), u22 (upval), u24 (upval)
        local v1 = u12
        if v1.destroyed then
            return
        end
        v1.root:Destroy()
        if not v1.destroyed then
            if v1.destroyed then
                return
            end
            v1.destroyed = true
            u21[v1.root] = nil
            u22 = math.max(0, u22 - 1)
            u24 = u24 + 1
            if v1.destroyingConnection then
                v1.destroyingConnection:Disconnect()
                v1.destroyingConnection = nil
            end
            if v1.unregisterLOD then
                v1.unregisterLOD()
                v1.unregisterLOD = nil
            end
        end
    end
end

function u20.getDebugStats() -- Line: 142 -- upvalues: u22 (ref), u23 (ref), u24 (ref)
    return {active = u22, created = u23, destroyed = u24}
end

local function countContainer(a1) -- Line: 150 -- types: a1: userdata?
    if not a1 then
        return 0, 0, 0, 0
    end
    local v1 = #a1:GetChildren()
    local v2 = 0
    local v3 = 0
    local v4 = 0
    for i, j in a1:GetDescendants() do
        if j:IsA("BasePart") then
            v2 = v2 + 1
            if j.CastShadow then
                v3 = v3 + 1
            end
        elseif j:IsA("ParticleEmitter") then
            v4 = v4 + 1
        end
    end
    return v1, v2, v3, v4
end

local function countTrackedTerrainRoots() -- Line: 174 -- upvalues: u21 (val)
    local Terrain = workspace:FindFirstChildOfClass("Terrain")
    if not Terrain then
        return 0
    end
    local v1 = 0
    for i in u21 do
        if i:IsDescendantOf(Terrain) then
            v1 = v1 + 1
        end
    end
    return v1
end

local u34 = 0
Scheduler.add("TransientVFXDiagnostics", RunService.Heartbeat, function(a1) -- Line: 191
    -- upvalues: u34 (ref), countContainer (val), Scheduler (val), countTrackedTerrainRoots (val), u22 (ref), u23 (ref)
    -- upvalues: u24 (ref)
    local v1, v2
    u34 = u34 + a1
    if u34 < 2 then
        return
    end
    u34 = 0
    local v3, v4, v5, v6 = countContainer(workspace:FindFirstChild("Trash"))
    _, v1, _, v2 = countContainer(workspace.CurrentCamera)
    Scheduler.customProfile("PerfDiag_TrashChildren", v3)
    Scheduler.customProfile("PerfDiag_TrashBaseParts", v4)
    Scheduler.customProfile("PerfDiag_TrashShadowCasters", v5)
    Scheduler.customProfile("PerfDiag_TrashParticles", v6)
    Scheduler.customProfile("PerfDiag_CameraBaseParts", v1)
    Scheduler.customProfile("PerfDiag_CameraParticles", v2)
    Scheduler.customProfile("PerfDiag_TerrainTransientRoots", (countTrackedTerrainRoots()))
    Scheduler.customProfile("PerfDiag_TransientVFXActive", u22)
    Scheduler.customProfile("PerfDiag_TransientVFXCreated", u23)
    Scheduler.customProfile("PerfDiag_TransientVFXDestroyed", u24)
end)
return u20