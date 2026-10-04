-- Script path: ReplicatedStorage.Client.Modules.ParticleLODController
-- Decompile time: 18.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local SettingsController = require(ReplicatedStorage.Client.Controllers.Shared.SettingsController)
local u26 = {}
local u27 = {
    {maxDist = 18, rateMultiplier = 1, beamsEnabled = true},
    {maxDist = 32, rateMultiplier = 0.55, beamsEnabled = true},
    {maxDist = 48, rateMultiplier = 0.2, beamsEnabled = false},
    {maxDist = (1 / 0), rateMultiplier = 0, beamsEnabled = false},
}
local u32 = {}
local u39 = SettingsController.Game:Get("Particle LOD") ~= false
local u40 = {
    registeredRoots = 0,
    tier1 = 0,
    tier2 = 0,
    tier3 = 0,
    tier4 = 0,
}

local function applyTier(a1, a2) -- Line: 45 -- upvalues: u27 (val) -- types: a1: table, a2: number
    local Rate, v1
    local v2 = u27[a2]
    if not v2 then
        return
    end
    local v3 = a2 == #u27
    local v4 = a1
    for i = #a1.emitters, 1, -1 do
        v1 = v4.emitters[i]
        if not v1 then
            v4.lodDisabled[v1] = nil
            table.remove(v4.emitters, i)
        elseif v1.Parent then
            Rate = v4.originalRates[v1]
            if Rate == nil then
                Rate = v1.Rate
                v4.originalRates[v1] = Rate
            end
            v1.Rate = Rate * v2.rateMultiplier
            if not v3 then
                if not v3 and v4.lodDisabled[v1] then
                    v1.Enabled = true
                    v4.lodDisabled[v1] = nil
                end
            elseif v1.Enabled then
                v1.Enabled = false
                v4.lodDisabled[v1] = true
            elseif not v3 and v4.lodDisabled[v1] then
                v1.Enabled = true
                v4.lodDisabled[v1] = nil
            end
        else
            v4.lodDisabled[v1] = nil
            table.remove(v4.emitters, i)
        end
    end
    for j = #v4.beams, 1, -1 do
        v1 = v4.beams[j]
        if not v1 or not v1.Parent then
            v4.lodDisabled[v1] = nil
            table.remove(v4.beams, j)
        elseif v2.beamsEnabled then
            if v2.beamsEnabled and v4.lodDisabled[v1] then
                v1.Enabled = true
                v4.lodDisabled[v1] = nil
            end
        elseif v1.Enabled then
            v1.Enabled = false
            v4.lodDisabled[v1] = true
        elseif v2.beamsEnabled and v4.lodDisabled[v1] then
            v1.Enabled = true
            v4.lodDisabled[v1] = nil
        end
    end
    for k = #v4.trails, 1, -1 do
        v1 = v4.trails[k]
        if not v1 or not v1.Parent then
            v4.lodDisabled[v1] = nil
            table.remove(v4.trails, k)
        elseif v2.beamsEnabled then
            if v2.beamsEnabled and v4.lodDisabled[v1] then
                v1.Enabled = true
                v4.lodDisabled[v1] = nil
            end
        elseif v1.Enabled then
            v1.Enabled = false
            v4.lodDisabled[v1] = true
        elseif v2.beamsEnabled and v4.lodDisabled[v1] then
            v1.Enabled = true
            v4.lodDisabled[v1] = nil
        end
    end
end

SettingsController.Game:On("Particle LOD", function(a1) -- Line: 108 -- upvalues: u39 (ref), u32 (val), applyTier (val)
    u39 = a1
    if not a1 then
        for i, j in u32 do
            applyTier(j, 1)
            j.currentTier = 1
        end
    end
end)

local function computeTier(a1) -- Line: 118 -- upvalues: u27 (val) -- types: a1: number
    for i, j in u27 do
        if a1 <= j.maxDist then
            return i
        end
    end
    return #u27
end

local function countStats() -- Line: 127 -- upvalues: u27 (val), u32 (val), u40 (ref), Scheduler (val)
    local v1
    local v2 = 0
    local v3 = table.create(#u27, 0)
    for i, j in u32 do
        v2 = v2 + 1
        v1 = math.clamp(j.currentTier, 1, #u27)
        v3[v1] = (v3[v1] or 0) + 1
    end
    u40 = {
        registeredRoots = v2,
        tier1 = v3[1] or 0,
        tier2 = v3[2] or 0,
        tier3 = v3[3] or 0,
        tier4 = v3[4] or 0,
    }
    Scheduler.customProfile("VFX LOD Roots", u40.registeredRoots)
    Scheduler.customProfile("VFX LOD Tier 1", u40.tier1)
    Scheduler.customProfile("VFX LOD Tier 2", u40.tier2)
    Scheduler.customProfile("VFX LOD Tier 3", u40.tier3)
    Scheduler.customProfile("VFX LOD Tier 4", u40.tier4)
end

function u26.getDebugStats() -- Line: 152 -- upvalues: u40 (ref)
    return table.clone(u40)
end

local function trackInstance(a1, a2) -- Line: 156 -- upvalues: u39 (ref), u27 (val) -- types: a1: table, a2: userdata
    local v1
    if a2:IsA("ParticleEmitter") then
        table.insert(a1.emitters, a2)
        a1.originalRates[a2] = a2.Rate
        if u39 and 1 < a1.currentTier then
            v1 = u27[a1.currentTier]
            if v1 then
                a2.Rate = a2.Rate * v1.rateMultiplier
                if a1.currentTier == #u27 and a2.Enabled then
                    a2.Enabled = false
                    a1.lodDisabled[a2] = true
                    return
                end
            end
        end
        return
    end
    if a2:IsA("Beam") then
        table.insert(a1.beams, a2)
        if u39 and 1 < a1.currentTier then
            v1 = u27[a1.currentTier]
            if v1 and not v1.beamsEnabled and a2.Enabled then
                a2.Enabled = false
                a1.lodDisabled[a2] = true
                return
            end
        end
        return
    end
    if a2:IsA("Trail") then
        table.insert(a1.trails, a2)
        if u39 and 1 < a1.currentTier then
            v1 = u27[a1.currentTier]
            if v1 and not v1.beamsEnabled and a2.Enabled then
                a2.Enabled = false
                a1.lodDisabled[a2] = true
            end
        end
    end
end

function u26.registerRoot(a1, a2) -- Line: 191
    -- upvalues: u32 (val), u26 (val), trackInstance (val), u39 (ref), u27 (val), applyTier (val)
    if u32[a1] then
        return function() -- Line: 193 -- upvalues: u26 (upval), a1 (val)
            u26.unregisterRoot(a1)
        end
    end
    local u5 = {currentTier = -1, destroyed = false, root = a1, getRefPos = a2}
    u5.emitters = {}
    u5.beams = {}
    u5.trails = {}
    u5.originalRates = {}
    u5.lodDisabled = {}
    u5.conns = {}
    trackInstance(u5, a1)
    for i, j in a1:GetDescendants() do
        trackInstance(u5, j)
    end
    table.insert(u5.conns, (a1.DescendantAdded:Connect(function(a1) -- Line: 218 -- upvalues: trackInstance (upval), u5 (val)
        trackInstance(u5, a1)
    end)))
    table.insert(u5.conns, (a1.Destroying:Once(function() -- Line: 225 -- upvalues: u5 (val), u32 (upval), a1 (val)
        u5.destroyed = true
        for i, j in u5.conns do
            j:Disconnect()
        end
        u32[a1] = nil
    end)))
    u32[a1] = u5
    if u39 and workspace.CurrentCamera then
        local v1
        local Magnitude = (workspace.CurrentCamera.CFrame.Position - a2()).Magnitude
        for k, n in u27 do
            if Magnitude <= n.maxDist then
                u5.currentTier = k
                applyTier(u5, v1)
                return function() -- Line: 243 -- upvalues: u26 (upval), a1 (val)
                    u26.unregisterRoot(a1)
                end
            end
        end
        v1 = #u27
        u5.currentTier = v1
        applyTier(u5, v1)
    end
    return function() -- Line: 243 -- upvalues: u26 (upval), a1 (val)
        u26.unregisterRoot(a1)
    end
end

function u26.unregisterRoot(a1) -- Line: 248 -- upvalues: u32 (val), applyTier (val) -- types: a1: userdata
    local v1 = u32[a1]
    if not v1 then
        return
    end
    v1.destroyed = true
    applyTier(v1, 1)
    for i, j in v1.conns do
        j:Disconnect()
    end
    u32[a1] = nil
end

function u26.registerModel(a1, a2) -- Line: 261 -- upvalues: u26 (val) -- types: a1: userdata, a2: function
    return u26.registerRoot(a1, a2)
end

function u26.unregisterModel(a1) -- Line: 265 -- upvalues: u26 (val) -- types: a1: userdata
    return u26.unregisterRoot(a1)
end

function u26.getOneShotMultiplier(a1) -- Line: 270 -- upvalues: u39 (ref), u27 (val) -- types: a1: vector
    if not u39 or not workspace.CurrentCamera then
        return 1
    end
    local Magnitude = (workspace.CurrentCamera.CFrame.Position - a1).Magnitude
    for i, j in u27 do
        if Magnitude <= j.maxDist then
            return u27[i].rateMultiplier
        end
    end
    local v1 = #u27
    return u27[v1].rateMultiplier
end

local function getRootWorldPos(a1) -- Line: 282 -- types: a1: userdata
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
    return nil
end

function u26.getRootMultiplier(a1) -- Line: 302 -- upvalues: getRootWorldPos (val), u26 (val) -- types: a1: userdata
    local v1 = getRootWorldPos(a1)
    if not v1 then
        return 1
    end
    return u26.getOneShotMultiplier(v1)
end

function u26.scaleEmitCount(a1, a2) -- Line: 311 -- types: a1: number, a2: number
    if not (a2 <= 0) and not (a1 <= 0) then
        return (math.max(1, (math.round(a1 * a2))))
    end
    return 0
end

EmitterManager.setManualEmitFilter(function(a1) -- Line: 320 -- upvalues: u26 (val) -- types: a1: userdata
    return u26.getRootMultiplier(a1)
end)
EmitterManager.setOneShotEmitFilter(function(a1) -- Line: 325 -- upvalues: u39 (ref), u27 (val) -- types: a1: vector
    if not u39 or not workspace.CurrentCamera then
        return 1
    end
    local Magnitude = (workspace.CurrentCamera.CFrame.Position - a1).Magnitude
    for i, j in u27 do
        if Magnitude <= j.maxDist then
            return u27[i].rateMultiplier
        end
    end
    local v1 = #u27
    return u27[v1].rateMultiplier
end)
local u73 = 0
Scheduler.add("ParticleLOD", RunService.Heartbeat, function(a1) -- Line: 340
    -- upvalues: u39 (ref), u73 (ref), u32 (val), u27 (val), applyTier (val), countStats (val)
    local Magnitude, v1
    if not u39 then
        return
    end
    u73 = u73 + a1
    if u73 < 0.25 then
        return
    end
    u73 = 0
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    local v2 = nil
    local v3 = nil
    for i, j in u32, v2, v3 do
        if not j.destroyed then
            Magnitude = (CurrentCamera.CFrame.Position - j.getRefPos()).Magnitude
            for k, n in u27 do
                if Magnitude <= n.maxDist then
                    v1 = k
                    if v1 ~= j.currentTier then
                        j.currentTier = v1
                        applyTier(j, v1)
                    end
                    break
                end
            end
            v1 = #u27
            if v1 ~= j.currentTier then
                j.currentTier = v1
                applyTier(j, v1)
            end
        else
            u32[i] = nil
        end
    end
    countStats()
end)
return u26