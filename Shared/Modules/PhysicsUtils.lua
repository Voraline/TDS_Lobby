-- Script path: ReplicatedStorage.Shared.Modules.PhysicsUtils
-- Decompile time: 1.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)

local function createLinearVelocity(a1) -- Line: 40 -- upvalues: Create (val)
    local v1 = {}
    local forceLimitMode = a1.forceLimitMode or Enum.ForceLimitMode.PerAxis
    v1.ForceLimitMode = forceLimitMode
    local velocityConstraintMode = a1.velocityConstraintMode or Enum.VelocityConstraintMode.Vector
    v1.VelocityConstraintMode = velocityConstraintMode
    v1.MaxAxesForce = a1.maxAxesForce or Vector3.new((1 / 0), (1 / 0), (1 / 0))
    v1.MaxForce = a1.maxForce or (1 / 0)
    v1.Attachment0 = a1.attachment0
    v1.Attachment1 = a1.attachment1
    v1.RelativeTo = a1.relativeTo
    v1.VectorVelocity = a1.vectorVelocity
    v1.PrimaryTangentAxis = a1.primaryTangentAxis
    v1.SecondaryTangentAxis = a1.secondaryTangentAxis
    v1.PlaneVelocity = a1.planeVelocity
    return (Create("LinearVelocity", v1))
end

return {
    createLinearVelocity = createLinearVelocity,
    createAlignOrientation = function(a1) -- Line: 56 -- upvalues: Create (val)
        local v1 = {}
        local alignType = a1.alignType or Enum.AlignType.AllAxes
        v1.AlignType = alignType
        local mode = a1.mode or Enum.OrientationAlignmentMode.OneAttachment
        v1.Mode = mode
        v1.MaxTorque = a1.maxTorque or (1 / 0)
        v1.MaxAngularVelocity = a1.maxAngularVelocity or (1 / 0)
        v1.Responsiveness = a1.responsiveness or 200
        v1.RigidityEnabled = a1.rigidityEnabled or false
        v1.ReactionTorqueEnabled = a1.reactionTorqueEnabled
        v1.PrimaryAxis = a1.primaryAxis
        v1.SecondaryAxis = a1.secondaryAxis
        v1.Attachment0 = a1.attachment0
        v1.Attachment1 = a1.attachment1
        return (Create("AlignOrientation", v1))
    end,
    createBodyGyro = function(a1) -- Line: 72 -- upvalues: Create (val) -- types: a1: table
        local v1 = {MaxTorque = a1.maxTorque or Vector3.new(0, 0, 0)}
        local cframe = a1.cframe or CFrame.identity
        v1.CFrame = cframe
        v1.P = a1.p or 10000
        v1.D = a1.d or 100
        return (Create("BodyGyro", v1))
    end,
    antiGravity = function(a1, a2) -- Line: 81 -- upvalues: Create (val), createLinearVelocity (val) -- types: a1: userdata, a2: number?
        local v1 = Create("Attachment", {Parent = a1})
        local v2 = createLinearVelocity({
            maxAxesForce = Vector3.new(0, (1 / 0), 0),
            attachment0 = v1,
            relativeTo = Enum.ActuatorRelativeTo.World,
            vectorVelocity = Vector3.new(0, workspace.Gravity * a1.AssemblyMass * (a2 or 1), 0),
        })
        v2.Parent = a1
        return v2
    end,
}