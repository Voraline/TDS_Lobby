-- Script path: ReplicatedStorage.Shared.Modules.EmitterManager
-- Decompile time: 18.14 ms

local Name, v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterUtil = require(ReplicatedStorage.Shared.Modules.EmitterUtil)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v2 = {}
local u31 = {}
local u33 = Random.new()
local u79 = true
local u35 = {Critical = true, GameplayCritical = true, Telegraph = true}
local u36 = {
    FlashBang = true,
    Freeze = true,
    HandDie = true,
    HandKill = true,
    Nuke = true,
}
local u37 = {"boss", "indicator", "range", "reticle", "stun", "target", "targeting", "telegraph", "warning"}
local u47 = {
    emitRequests = 0,
    emitFired = 0,
    emitSkipped = 0,
    emitMerged = 0,
    emitCapped = 0,
    manualRequests = 0,
    manualSkipped = 0,
    manualParticlesRequested = 0,
    manualParticlesEmitted = 0,
    pendingPeak = 0,
}
local u50 = table.clone(u47)

local function bumpStat(a1, a2) -- Line: 90 -- upvalues: u47 (val) -- types: a1: string, a2: number?
    u47[a1] = (u47[a1] or 0) + (a2 or 1)
end

local function publishStats() -- Line: 94 -- upvalues: u50 (ref), u47 (val), Scheduler (val)
    u50 = table.clone(u47)
    Scheduler.customProfile("VFX Emit Requests", u47.emitRequests)
    Scheduler.customProfile("VFX Emit Fired", u47.emitFired)
    Scheduler.customProfile("VFX Emit Skipped", u47.emitSkipped)
    Scheduler.customProfile("VFX Cluster Merged", u47.emitMerged)
    Scheduler.customProfile("VFX Cluster Capped", u47.emitCapped)
    Scheduler.customProfile("VFX Manual Requests", u47.manualRequests)
    Scheduler.customProfile("VFX Manual Particles", u47.manualParticlesEmitted)
    Scheduler.customProfile("VFX Pending Peak", u47.pendingPeak)
    for i in u47 do
        u47[i] = 0
    end
end

local u53 = 0
Scheduler.add("VFXEmitterStats", RunService.Heartbeat, function(a1) -- Line: 112 -- upvalues: u53 (ref), publishStats (val) -- types: a1: number
    u53 = u53 + a1
    if u53 < 0.5 then
        return
    end
    u53 = 0
    publishStats()
end)

function v2.getDebugStats() -- Line: 122 -- upvalues: u50 (ref)
    return table.clone(u50)
end

local u60 = nil
local u61 = nil

function v2.setManualEmitFilter(a1) -- Line: 132 -- upvalues: u60 (ref) -- types: a1: function
    u60 = a1
end

function v2.setOneShotEmitFilter(a1) -- Line: 136 -- upvalues: u61 (ref) -- types: a1: function
    u61 = a1
end

local function getManualEmitMultiplier(a1) -- Line: 140 -- upvalues: u60 (ref) -- types: a1: userdata
    if u60 then
        return (u60(a1))
    end
    return 1
end

if not RunService:IsServer() then
    local SettingsController = require(ReplicatedStorage.Client.Controllers.Shared.SettingsController)
    u79 = SettingsController.Game:Get("HQ Effects")
    SettingsController.Game:On("HQ Effects", function(a1) -- Line: 148 -- upvalues: u79 (ref)
        u79 = a1
    end)
end

local function getEmitterWorldPos(a1) -- Line: 154 -- types: a1: userdata
    local Parent = a1.Parent
    if Parent then
        if Parent:IsA("Attachment") then
            return Parent.WorldPosition
        end
        if Parent:IsA("BasePart") then
            return Parent.Position
        end
    end
    return (Vector3.new(0, 0, 0))
end

local u87 = {}
local u88 = {ParticleEmitter = true, Beam = true, Trail = true, Sound = true}

local function buildManualEmitData(a1) -- Line: 183 -- upvalues: u88 (val) -- types: a1: userdata
    local v1
    local v2 = {}
    local v3 = {}
    local Descendants = a1:GetDescendants()
    v3[1] = a1
    v3[2] = unpack(Descendants)
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        if u88[j.ClassName] then
            v1 = if not j:IsA("Sound") then "EmitDelay" else "Delay"
            table.insert(v2, {
                obj = j,
                emitDelay = j:GetAttribute(v1) or 0,
                emitCount = j:GetAttribute("EmitCount") or 0,
                emitDuration = j:GetAttribute("EmitDuration") or 0,
            })
        end
    end
    return v2
end

local function getManualEmitData(a1) -- Line: 200
    -- upvalues: u87 (val), buildManualEmitData (val)
    local v1 = u87[a1]
    if v1 then
        return v1.instances
    end
    local v2 = buildManualEmitData(a1)
    local v3 = {instances = v2, conns = {}}

    local function invalidate() -- Line: 210 -- upvalues: u87 (upval), a1 (val)
        if u87[a1] then
            for i, j in u87[a1].conns do
                j:Disconnect()
            end
            u87[a1] = nil
        end
    end

    table.insert(v3.conns, (a1.Destroying:Once(invalidate)))
    table.insert(v3.conns, (a1.DescendantAdded:Connect(invalidate)))
    table.insert(v3.conns, (a1.DescendantRemoving:Connect(invalidate)))
    u87[a1] = v3
    return v2
end

function v2.emitParticle(a1, a2, a3) -- Line: 230
    -- upvalues: u47 (val), u79 (ref), u60 (ref)
    local v1
    u47.manualRequests = (u47.manualRequests or 0) + 1
    u47.manualParticlesRequested = (u47.manualParticlesRequested or 0) + (a2 or 1)
    if not u79 then
        u47.manualSkipped = (u47.manualSkipped or 0) + 1
        return
    end
    if (if not u60 then 1 else u60(a3 or a1)) <= 0 then
        u47.manualSkipped = (u47.manualSkipped or 0) + 1
        return
    end
    local v2 = math.round(a2 * v1)
    u47.manualParticlesEmitted = (u47.manualParticlesEmitted or 0) + (v2 or 1)
    if v2 <= 0 then
        u47.manualSkipped = (u47.manualSkipped or 0) + 1
        return
    end
    a1:Emit(v2)
end

function v2.manualEmit(a1, a2) -- Line: 256
    -- upvalues: u47 (val), u79 (ref), u60 (ref), getManualEmitData (val), EasySound (val), u33 (val)
    local Parent, Texture, WorldPosition, emitDelay, obj, v1
    u47.manualRequests = (u47.manualRequests or 0) + 1
    if not u79 then
        u47.manualSkipped = (u47.manualSkipped or 0) + 1
        return
    end
    local u175 = if not u60 then 1 else u60(a1)
    if u175 <= 0 then
        u47.manualSkipped = (u47.manualSkipped or 0) + 1
        return
    end
    local v2 = getManualEmitData(a1)
    local v3 = {}

    local function emit(a1) -- Line: 286
        -- upvalues: u175 (val), u47 (upval), EasySound (upval), u33 (upval)
        local obj = a1.obj
        local emitDelay = a1.emitDelay
        local u7 = math.round(a1.emitCount * u175)
        local emitDuration = a1.emitDuration
        u47.manualParticlesRequested = (u47.manualParticlesRequested or 0) + (a1.emitCount or 1)
        u47.manualParticlesEmitted = (u47.manualParticlesEmitted or 0) + (u7 or 1)

        local function doEmit() -- Line: 299
            -- upvalues: obj (val), u7 (val), EasySound (upval), u33 (upval), emitDuration (val)
            if obj:IsA("ParticleEmitter") then
                obj:Emit(u7)
            end
            if obj:IsA("Sound") then
                EasySound.Play({
                    soundGroupName = "Towers",
                    destroyOnEnd = true,
                    id = obj.SoundId,
                    parent = obj.Parent,
                    volume = obj.Volume,
                    playbackSpeed = obj.PlaybackSpeed * u33:NextNumber(0.9, 1.1),
                })
                return
            end
            if emitDuration > 0 then
                task.defer(function() -- Line: 315 -- upvalues: obj (upval), emitDuration (upval)
                    obj.Enabled = true
                    task.wait(emitDuration)
                    obj.Enabled = false
                end)
            end
        end

        if not (emitDelay > 0) then
            doEmit()
            return
        end
        task.delay(emitDelay, doEmit)
    end

    local v4 = nil
    local v5 = nil
    local v6 = a2
    for i, j in v2, v4, v5 do
        obj = j.obj
        if not v6 then
            if obj:IsA("ParticleEmitter") then
                Parent = obj.Parent
                WorldPosition = if not Parent then Vector3.new(0, 0, 0) else if not Parent:IsA("Attachment") then if not Parent:IsA("BasePart") then Vector3.new(0, 0, 0) else Parent.Position else Parent.WorldPosition
                Texture = obj.Texture
                v1 = false
                for k, n in v3 do
                    if n.texture == Texture and (n.pos - WorldPosition).Magnitude < 3 then
                        n.emitCount = n.emitCount + j.emitCount
                        v1 = true
                        break
                    end
                end
                if not v1 then
                    table.insert(v3, {
                        emitter = obj,
                        pos = WorldPosition,
                        texture = Texture,
                        emitCount = j.emitCount,
                        emitDelay = j.emitDelay,
                        emitDuration = j.emitDuration,
                    })
                end
            else
                emit(j)
            end
        elseif obj:IsA(v6) then
            if obj:IsA("ParticleEmitter") then
                Parent = obj.Parent
                WorldPosition = if not Parent then Vector3.new(0, 0, 0) else if not Parent:IsA("Attachment") then if not Parent:IsA("BasePart") then Vector3.new(0, 0, 0) else Parent.Position else Parent.WorldPosition
                Texture = obj.Texture
                v1 = false
                for m, i5 in v3 do
                    if i5.texture == Texture and (i5.pos - WorldPosition).Magnitude < 3 then
                        i5.emitCount = i5.emitCount + j.emitCount
                        v1 = true
                        break
                    end
                end
                if not v1 then
                    table.insert(v3, {
                        emitter = obj,
                        pos = WorldPosition,
                        texture = Texture,
                        emitCount = j.emitCount,
                        emitDelay = j.emitDelay,
                        emitDuration = j.emitDuration,
                    })
                end
            else
                emit(j)
            end
        end
    end
    for i6, i7 in v3 do
        local u56 = math.round(i7.emitCount * u175)
        local emitter = i7.emitter
        emitDelay = i7.emitDelay
        local emitDuration = i7.emitDuration
        u47.manualParticlesRequested = (u47.manualParticlesRequested or 0) + (i7.emitCount or 1)
        u47.manualParticlesEmitted = (u47.manualParticlesEmitted or 0) + (u56 or 1)
        if not (emitDelay > 0) then
            emitter:Emit(u56)
            if emitDuration > 0 then
                task.defer(function() -- Line: 379 -- upvalues: emitter (val), emitDuration (val)
                    emitter.Enabled = true
                    task.wait(emitDuration)
                    emitter.Enabled = false
                end)
            end
        else
            task.delay(emitDelay, function() -- Line: 376 -- upvalues: emitter (val), u56 (val), emitDuration (val)
                emitter:Emit(u56)
                if emitDuration > 0 then
                    task.defer(function() -- Line: 379 -- upvalues: emitter (upval), emitDuration (upval)
                        emitter.Enabled = true
                        task.wait(emitDuration)
                        emitter.Enabled = false
                    end)
                end
            end)
        end
    end
end

local function mergeEmitterProperties(a1, a2, a3) -- Line: 397
    -- upvalues: EmitterUtil (val)
    local u3 = 1 / a3

    local function blendNumberSequence(a1_2) -- Line: 404
        -- upvalues: a1 (val), a2 (val), EmitterUtil (upval), u3 (val)
        local v1 = a1[a1_2]
        local v2 = a2[a1_2]
        a1[a1_2] = (EmitterUtil.averageNumberSequence(v1, v2, u3))
    end

    local function blendColorSequence(a1_2) -- Line: 410
        -- upvalues: a1 (val), a2 (val), EmitterUtil (upval), u3 (val)
        local v1 = a1[a1_2]
        local v2 = a2[a1_2]
        a1[a1_2] = (EmitterUtil.averageColorSequence(v1, v2, u3))
    end

    local function blendNumberRange(a1_2) -- Line: 416 -- upvalues: a1 (val), a2 (val), u3 (val) -- types: a1_2: string
        local v1 = a1[a1_2]
        local v2 = a2[a1_2]
        a1[a1_2] = (NumberRange.new(v1.Min + (v2.Min - v1.Min) * u3, v1.Max + (v2.Max - v1.Max) * u3))
    end

    local function blendNumber(a1_2) -- Line: 423 -- upvalues: a1 (val), a2 (val), u3 (val) -- types: a1_2: string
        local v1 = a1[a1_2]
        a1[a1_2] = v1 + (a2[a1_2] - v1) * u3
    end

    a1.Size = EmitterUtil.averageNumberSequence(a1.Size, a2.Size, u3)
    a1.Color = EmitterUtil.averageColorSequence(a1.Color, a2.Color, u3)
    a1.Transparency = EmitterUtil.averageNumberSequence(a1.Transparency, a2.Transparency, u3)
    local Lifetime = a1.Lifetime
    local Lifetime_2 = a2.Lifetime
    a1.Lifetime = NumberRange.new(Lifetime.Min + (Lifetime_2.Min - Lifetime.Min) * u3, Lifetime.Max + (Lifetime_2.Max - Lifetime.Max) * u3)
    local Speed = a1.Speed
    local Speed_2 = a2.Speed
    a1.Speed = NumberRange.new(Speed.Min + (Speed_2.Min - Speed.Min) * u3, Speed.Max + (Speed_2.Max - Speed.Max) * u3)
    local LightEmission = a1.LightEmission
    a1.LightEmission = LightEmission + (a2.LightEmission - LightEmission) * u3
    local LightInfluence = a1.LightInfluence
    a1.LightInfluence = LightInfluence + (a2.LightInfluence - LightInfluence) * u3
    local RotSpeed = a1.RotSpeed
    local RotSpeed_2 = a2.RotSpeed
    a1.RotSpeed = NumberRange.new(RotSpeed.Min + (RotSpeed_2.Min - RotSpeed.Min) * u3, RotSpeed.Max + (RotSpeed_2.Max - RotSpeed.Max) * u3)
    local Rotation = a1.Rotation
    local Rotation_2 = a2.Rotation
    a1.Rotation = NumberRange.new(Rotation.Min + (Rotation_2.Min - Rotation.Min) * u3, Rotation.Max + (Rotation_2.Max - Rotation.Max) * u3)
end

local function readAttribute(a1, a2, a3) -- Line: 440 -- types: a1: userdata?, a2: table, a3: string
    local Attribute_2
    if a1 then
        local Attribute = a1:GetAttribute(a3)
        if Attribute ~= nil then
            return Attribute
        end
    end
    for i, j in a2 do
        Attribute_2 = j:GetAttribute(a3)
        if Attribute_2 ~= nil then
            return Attribute_2
        end
    end
    return nil
end

function v2.register(a1, a2, a3) -- Line: 458
    -- upvalues: readAttribute (val), mergeEmitterProperties (val), u31 (val)
    local Attachment_2, Attribute, Texture, emitter_2, v1, v2
    local Attachment = Instance.new("Attachment")
    local v3 = readAttribute(a3, a2, "AllowCluster")
    local v4 = readAttribute(a3, a2, "NoCluster")
    local v5 = readAttribute(a3, a2, "ClusterRadius")
    local v6 = readAttribute(a3, a2, "MaxClusterAmount")
    local v7 = readAttribute(a3, a2, "VFXPriority") or readAttribute(a3, a2, "Priority")
    if v3 == nil and typeof(v4) == "boolean" then
        v3 = not v4
    end
    local v8 = {originalRadius = 1, attachment = Attachment}
    v8.allowCluster = if typeof(v3) ~= "boolean" then nil else v3
    v8.clusterRadius = if typeof(v5) ~= "number" then nil else v5
    v8.maxClusterAmount = if typeof(v6) ~= "number" then nil else v6
    v8.priority = if typeof(v7) ~= "string" then nil else v7
    v8.emitters = {}
    v8.emitterData = {}
    v8.soundData = {}
    local v9 = {}
    local v10 = nil
    local v11 = nil
    for i, j in a2, v10, v11 do
        Attribute = j:GetAttribute("Radius")
        Attachment_2 = Instance.new("Attachment")
        Attachment_2.CFrame = j.CFrame
        if Attribute then
            v8.originalRadius = Attribute
        end
        for k, n in j:GetChildren() do
            if n:IsA("ParticleEmitter") then
                v2 = n:Clone()
                v2.Enabled = false
                v2.Parent = Attachment_2
                table.insert(v9, {
                    emitter = v2,
                    emitDelay = n:GetAttribute("EmitDelay"),
                    emitDuration = n:GetAttribute("EmitDuration"),
                    emitCount = n:GetAttribute("EmitCount") or 1,
                    attachment = Attachment_2,
                })
            elseif n:IsA("Sound") then
                table.insert(v8.soundData, {sound = n, attachment = Attachment_2})
            end
        end
        Attachment_2.Parent = Attachment
    end
    local v12 = {}
    for m, i5 in v9 do
        Texture = i5.emitter.Texture
        if v12[Texture] then
            v1 = v12[Texture]
            v1.mergeCount = v1.mergeCount + 1
            v1.emitCount = v1.emitCount + i5.emitCount
            emitter_2 = v1.emitter
            emitter_2.Rate = emitter_2.Rate + i5.emitter.Rate
            mergeEmitterProperties(v1.emitter, i5.emitter, v1.mergeCount)
            i5.emitter:Destroy()
        else
            v12[Texture] = {
                mergeCount = 1,
                emitter = i5.emitter,
                emitCount = i5.emitCount,
                emitDelay = i5.emitDelay,
                emitDuration = i5.emitDuration,
            }
        end
    end
    for i6, i7 in v12 do
        table.insert(v8.emitters, i7.emitter)
        table.insert(v8.emitterData, {
            emitter = i7.emitter,
            emitDelay = i7.emitDelay,
            emitDuration = i7.emitDuration,
            emitCount = i7.emitCount,
        })
    end
    Attachment.Name = ("%*Effect"):format(v13)
    Attachment.Parent = workspace.Terrain
    u31[v13] = v8
end

local u104 = {}
local u105 = false

local function fireEmitDirect(a1, a2, a3, a4, a5, a6) -- Line: 597
    -- upvalues: u31 (val), EmitterUtil (val), TimescaleUtilities (val), EasySound (val), u33 (val)
    local v1 = u31[a1]
    if not v1 then
        warn("EmitterManager: Emitter " .. a1 .. " does not exist")
        return
    end
    if a3 and v1.originalRadius ~= nil then
        EmitterUtil:scaleEmitter(v1.emitters, a3 / v1.originalRadius, true)
    end
    v1.attachment.WorldCFrame = a2
    for i, v in ipairs(v1.emitterData) do
        local u66 = v.emitCount * (a4 or 1)
        local u68 = v.emitDuration or 0
        if not (0 < (v.emitDelay or 0)) then
            v.emitter:Emit(u66)
            if u68 > 0 then
                v.emitter.Enabled = true
                TimescaleUtilities.Delay(v.emitDuration, function() -- Line: 627 -- upvalues: v (val)
                    v.emitter.Enabled = false
                end)
            end
        else
            TimescaleUtilities.Delay(v.emitDelay, function() -- Line: 621 -- upvalues: v (val), u66 (val), u68 (val), TimescaleUtilities (upval)
                v.emitter:Emit(u66)
                if u68 > 0 then
                    v.emitter.Enabled = true
                    TimescaleUtilities.Delay(v.emitDuration, function() -- Line: 627 -- upvalues: v (upval)
                        v.emitter.Enabled = false
                    end)
                end
            end)
        end
    end
    if not a5 and a5 ~= nil then
        return
    end
    for i2, i3 in ipairs(v1.soundData) do
        EasySound.Play({
            destroyOnEnd = true,
            audioGroup = "Towers",
            id = i3.sound.SoundId,
            parent = i3.attachment,
            volume = i3.sound.Volume,
            playbackSpeed = u33:NextNumber(0.9, 1.1),
        })
    end
end

local function priorityIsCritical(a1) -- Line: 657 -- upvalues: u35 (val) -- types: a1: string?
    local v1 = false
    if a1 ~= nil then
        v1 = u35[a1] == true
    end
    return v1
end

local function nameLooksCritical(a1) -- Line: 661 -- upvalues: u36 (val), u37 (val) -- types: a1: string
    if u36[a1] then
        return true
    end
    local v1 = string.lower(a1)
    for i, j in u37 do
        if string.find(v1, j, 1, true) then
            return true
        end
    end
    return false
end

local function isCriticalEmit(a1, a2) -- Line: 676
    -- upvalues: u31 (val), u35 (val), nameLooksCritical (val)
    local v1 = u31[a1]
    local priority = if not a2 then nil else a2.priority
    local priority_2 = if not v1 then nil else v1.priority
    local v2 = false
    if priority ~= nil then
        v2 = u35[priority] == true
    end
    if not v2 then
        v2 = false
        if priority_2 ~= nil then
            v2 = u35[priority_2] == true
        end
        if not v2 then
            if a2 and a2.allowCluster == false then
                return true
            end
            if v1 and v1.allowCluster == false then
                return true
            end
            if a2 and a2.allowCluster == true then
                return false
            end
            if v1 and v1.allowCluster == true then
                return false
            end
            return (nameLooksCritical(a1))
        end
    end
    return true
end

local function getClusterPolicy(a1, a2, a3) -- Line: 702
    -- upvalues: isCriticalEmit (val), u31 (val)
    if isCriticalEmit(a1, a3) then
        return {canMerge = false, radius = 0, maxAmount = (1 / 0)}
    end
    local v1 = u31[a1]
    local maxClusterAmount = if not a3 then if not v1 then nil else v1.maxClusterAmount else if a3.maxClusterAmount == nil then if not v1 then nil else v1.maxClusterAmount else a3.maxClusterAmount
    if a3 and a3.clusterRadius then
        return {canMerge = true, radius = a3.clusterRadius, maxAmount = maxClusterAmount or (1 / 0)}
    end
    if v1 and v1.clusterRadius then
        return {canMerge = true, radius = v1.clusterRadius, maxAmount = maxClusterAmount or (1 / 0)}
    end
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        return {canMerge = true, radius = 2.5, maxAmount = maxClusterAmount or 5}
    end
    local Magnitude = (CurrentCamera.CFrame.Position - a2.Position).Magnitude
    if Magnitude <= 16 then
        return {canMerge = true, radius = 0.5, maxAmount = maxClusterAmount or (1 / 0)}
    end
    if Magnitude <= 32 then
        return {canMerge = true, radius = 2.5, maxAmount = maxClusterAmount or 5}
    end
    return {canMerge = true, radius = 5, maxAmount = maxClusterAmount or 2}
end

local function radiiCompatible(a1, a2) -- Line: 762 -- types: a1: number?, a2: number?
    if a1 == a2 then
        return true
    end
    if a1 ~= nil and a2 ~= nil then
        return (math.abs(a1 - a2)) <= math.max(0.5, (math.max(a1, a2)) * 0.15)
    end
    return false
end

local function canMergePending(a1, a2) -- Line: 773
    -- upvalues: isCriticalEmit (val), getClusterPolicy (val)
    if a1.name ~= a2.name then
        return false
    end
    if a1.playSound == a2.playSound and a1.soundGroupName == a2.soundGroupName then
        local radius = a1.radius
        local radius_2 = a2.radius
        if not (if radius == radius_2 then true else if radius == nil then false else if radius_2 ~= nil then (math.abs(radius - radius_2)) <= math.max(0.5, (math.max(radius, radius_2)) * 0.15) else false) then
            return false
        end
        if not isCriticalEmit(a1.name, a1.options) and not isCriticalEmit(a2.name, a2.options) then
            local v1 = getClusterPolicy(a1.name, a1.cframe, a1.options)
            local v2 = getClusterPolicy(a2.name, a2.cframe, a2.options)
            if v1.canMerge and v2.canMerge then
                local v3 = math.min(v1.radius, v2.radius)
                return (a1.cframe.Position - a2.cframe.Position).Magnitude <= v3
            end
            return false
        end
        return false
    end
    return false
end

local function flushPendingEmits() -- Line: 814
    -- upvalues: u105 (ref), u104 (val), canMergePending (val), u47 (val), getClusterPolicy (val), u61 (ref)
    -- upvalues: isCriticalEmit (val), fireEmitDirect (val)
    local amountMultiplier, v1, v2
    u105 = false
    if #u104 == 0 then
        return
    end
    local v3 = {}
    local v4 = nil
    local v5 = nil
    for i, j in u104, v4, v5 do
        v1 = false
        for k, n in v3 do
            if canMergePending(n, j) then
                n.amountMultiplier = n.amountMultiplier + j.amountMultiplier
                v1 = true
                u47.emitMerged = (u47.emitMerged or 0) + 1
                break
            end
        end
        if not v1 then
            table.insert(v3, {
                name = j.name,
                cframe = j.cframe,
                radius = j.radius,
                amountMultiplier = j.amountMultiplier,
                playSound = j.playSound,
                soundGroupName = j.soundGroupName,
                options = j.options,
            })
        end
    end
    table.clear(u104)
    v4 = nil
    v5 = nil
    for m, i5 in v3, v4, v5 do
        amountMultiplier = i5.amountMultiplier
        v2 = getClusterPolicy(i5.name, i5.cframe, i5.options)
        if v2.maxAmount < amountMultiplier then
            amountMultiplier = v2.maxAmount
            u47.emitCapped = (u47.emitCapped or 0) + 1
        end
        if u61 and not isCriticalEmit(i5.name, i5.options) then
            amountMultiplier = amountMultiplier * u61(i5.cframe.Position)
        end
        if not (amountMultiplier <= 0) then
            u47.emitFired = (u47.emitFired or 0) + 1
            fireEmitDirect(i5.name, i5.cframe, i5.radius, amountMultiplier, i5.playSound, i5.soundGroupName)
        else
            u47.emitSkipped = (u47.emitSkipped or 0) + 1
        end
    end
end

function v2.Emit(a1, a2, a3, a4, a5, a6, a7) -- Line: 877
    -- upvalues: u47 (val), u79 (ref), RunService (val), fireEmitDirect (val), u104 (val), u105 (ref)
    -- upvalues: flushPendingEmits (val)
    u47.emitRequests = (u47.emitRequests or 0) + 1
    if not u79 then
        u47.emitSkipped = (u47.emitSkipped or 0) + 1
        return
    end
    local v1 = a4 or 1
    if RunService:IsServer() then
        u47.emitFired = (u47.emitFired or 0) + 1
        fireEmitDirect(a1, a2, a3, v1, a5, a6)
        return
    end
    table.insert(u104, {
        name = a1,
        cframe = a2,
        radius = a3,
        amountMultiplier = v1,
        playSound = a5,
        soundGroupName = a6,
        options = a7,
    })
    if u47.pendingPeak < #u104 then
        u47.pendingPeak = #u104
    end
    if not u105 then
        u105 = true
        task.defer(flushPendingEmits)
    end
end

function v2.toggle(a1, a2, a3) -- Line: 922
    -- upvalues: TimescaleUtilities (val)
    local function toggleInstance(a1) -- Line: 923
        -- upvalues: a3 (val), a2 (val), TimescaleUtilities (upval)
        if a3 and not a1:IsA(a3) then
            return
        end
        if not a1:IsA("ParticleEmitter") and not a1:IsA("Beam") and not a1:IsA("Trail") then
            return
        end
        local Attribute = a1:GetAttribute("Delay")
        if a2 and Attribute and Attribute > 0 then
            TimescaleUtilities.Delay(Attribute, function() -- Line: 934 -- upvalues: a1 (val), a2 (upval)
                a1.Enabled = a2
            end)
            return
        end
        a1.Enabled = a2
    end

    toggleInstance(a1)
    for i, j in a1:GetDescendants() do
        toggleInstance(j)
    end
end

for i, j in ReplicatedStorage.Assets.Effects.SingleEmit:GetChildren() do
    Name = j.Name
    v1 = {}
    for k, n in j:GetChildren() do
        if n:IsA("Attachment") then
            table.insert(v1, n)
        end
    end
    v2.register(Name, v1, j)
end
return v2