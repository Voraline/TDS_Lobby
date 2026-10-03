-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.NeuralyzedVisuals
-- Decompile time: 3.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Buffs = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Buffs")
local ParticleLODController = require(ReplicatedStorage.Client.Modules.ParticleLODController)

local function log(...) -- Line: 25 -- upvalues: RunService (val)
    if RunService:IsStudio() then
        warn("[NeuralyzedVisuals]", ...)
    end
end

local function validateTemplate(a1) -- Line: 31 -- types: a1: userdata
    if not a1:IsA("Model") then
        return false, (("template must be a Model, got %*"):format(a1.ClassName))
    end
    local Part = a1:FindFirstChild("Part")
    if Part and Part:IsA("BasePart") then
        local WeldConstraint = Part:FindFirstChild("WeldConstraint")
        if WeldConstraint and WeldConstraint:IsA("WeldConstraint") then
            return true, nil
        end
        return false, "Part missing \"WeldConstraint\""
    end
    return false, "missing direct child BasePart named \"Part\""
end

local function getEnemyHeightMetric(a1, a2) -- Line: 46 -- types: a1: userdata, a2: userdata
    local Hitbox = a1:FindFirstChild("Hitbox")
    if Hitbox and Hitbox:IsA("BasePart") then
        return Hitbox.Size.Y
    end
    local Node = a2:FindFirstChild("Node")
    if Node and Node:IsA("Attachment") then
        return (math.abs(Node.Position.Y))
    end
    return (math.max(a2.Size.Y * 0.5, 2))
end

local function getScaleRatio(a1, a2) -- Line: 60
    -- upvalues: getEnemyHeightMetric (val)
    local Hitbox = a1:FindFirstChild("Hitbox")
    if Hitbox and Hitbox:IsA("BasePart") then
        return Hitbox.Size.Y / 2.5
    end
    local Node = a2:FindFirstChild("Node")
    if Node and Node:IsA("Attachment") then
        return math.abs(Node.Position.Y) / 2
    end
    return getEnemyHeightMetric(a1, a2) / 2
end

local function getFloorOffsetY(a1, a2) -- Line: 74 -- types: a1: userdata, a2: userdata
    local Hitbox = a1:FindFirstChild("Hitbox")
    if Hitbox and Hitbox:IsA("BasePart") then
        return Hitbox.Size.Y * 0.5
    end
    local Node = a2:FindFirstChild("Node")
    if Node and Node:IsA("Attachment") then
        return (math.abs(Node.Position.Y))
    end
    return (math.max(a2.Size.Y * 0.5, 2))
end

local function emitBigPuffOnce(a1, a2) -- Line: 88
    -- upvalues: ParticleLODController (val)
    local Part = a1:FindFirstChild("Part")
    if Part and Part:IsA("BasePart") then
        local BigPuff = Part:FindFirstChild("BigPuff")
        if BigPuff and BigPuff:IsA("ParticleEmitter") then
            BigPuff.Enabled = true
            local v1 = ParticleLODController.scaleEmitCount(1, a2)
            if v1 > 0 then
                BigPuff:Emit(v1)
            end
            return
        end
        return
    end
end

return {
    onAdded = function(a1, a2) -- Line: 106
        -- upvalues: log (val), Buffs (val), validateTemplate (val), getScaleRatio (val), getFloorOffsetY (val)
        -- upvalues: ParticleLODController (val), emitBigPuffOnce (val)
        local Model = a1.Model
        if not Model then
            return nil
        end
        local PrimaryPart = Model.PrimaryPart
        if not PrimaryPart then
            log("Enemy has no PrimaryPart:", Model:GetFullName())
            return nil
        end
        local Neuralyzed = Buffs:FindFirstChild("Neuralyzed")
        if not Neuralyzed then
            log("No Neuralyzed template at Assets.Effects.Buffs.Neuralyzed — place your Model there")
            return nil
        end
        local v1, v2 = validateTemplate(Neuralyzed)
        if not v1 then
            log("Invalid Neuralyzed VFX template:", v2)
            return nil
        end
        local success, result = pcall(function() -- Line: 132
            -- upvalues: Neuralyzed (val), getScaleRatio (upval), Model (val), PrimaryPart (val)
            -- upvalues: getFloorOffsetY (upval)
            local v1 = Neuralyzed:Clone()
            v1:ScaleTo(1)
            v1:ScaleTo((math.clamp(getScaleRatio(Model, PrimaryPart), 0.25, 6)))
            v1:PivotTo((Model:GetPivot()))
            local Part = v1:FindFirstChild("Part")
            if not Part or not Part:IsA("BasePart") then
                error("Neuralyzed clone missing Part BasePart")
            end
            local FloorAttachment = Part:FindFirstChild("FloorAttachment")
            if FloorAttachment and FloorAttachment:IsA("Attachment") then
                FloorAttachment.Position = Vector3.new(0, -getFloorOffsetY(Model, PrimaryPart), 0)
            end
            local WeldConstraint = Part:FindFirstChildOfClass("WeldConstraint")
            if WeldConstraint then
                WeldConstraint.Part0 = Part
                WeldConstraint.Part1 = PrimaryPart
            end
            v1.Parent = workspace.CurrentCamera
            return v1
        end)
        if not success then
            log("Failed to setup Neuralyzed VFX:", result)
            return nil
        end
        local v3 = ParticleLODController.registerRoot(result, function() -- Line: 165 -- upvalues: PrimaryPart (val)
            return PrimaryPart.Position
        end)
        emitBigPuffOnce(result, ParticleLODController.getOneShotMultiplier(PrimaryPart.Position))
        local u62 = nil
        if a1.Replicator then
            u62 = (a1.Replicator:GetStateChangedSignal("Health")):Connect(function(a1) -- Line: 174 -- upvalues: result (val), u62 (ref)
                if a1 <= 0 then
                    result:Destroy()
                    if u62 then
                        u62:Disconnect()
                        u62 = nil
                    end
                end
            end)
        end
        return {model = result, healthConn = u62, unregisterLOD = v3}
    end,
    onRemoved = function(a1, a2, a3) -- Line: 192
        if not a3 then
            return
        end
        if a3.model then
            if a3.unregisterLOD then
                a3.unregisterLOD()
            end
            a3.model:Destroy()
        end
        if a3.healthConn then
            a3.healthConn:Disconnect()
        end
    end,
}