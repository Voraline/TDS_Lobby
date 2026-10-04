-- Script path: ReplicatedStorage.Shared.Modules.RobloxPhysics
-- Decompile time: 2.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Signal = require(script.Parent.Signal)
return {
    new = function(a1) -- Line: 20 -- upvalues: Maid (val), Signal (val), RunService (val) -- types: a1: table
        local v1 = {
            startPosition = a1.startPosition,
            Position = a1.startPosition,
            velocity = a1.velocity,
            gravity = a1.gravity,
            object = a1.object:Clone(),
        }
        v1.object.Name = a1.UID
        local onHit = a1.onHit or function() -- Line: 29
            return
        end
        v1.onHit = onHit
        v1.ID = a1.UID
        v1.object.Anchored = false
        v1._maid = Maid.new()
        v1.events = {onDestroy = Signal.new()}
        for k, v in pairs(v1.events) do
            v1._maid:Mark(v)
        end
        local Attachment = Instance.new("Attachment")
        Attachment.Parent = v1.object
        if v1.gravity then
            local VectorForce = Instance.new("VectorForce")
            VectorForce.Attachment0 = Attachment
            VectorForce.RelativeTo = Enum.ActuatorRelativeTo.World
            VectorForce.Force = (Vector3.new(0, workspace.Gravity, 0)) * v1.object.AssemblyMass - v1.gravity * v1.object.AssemblyMass
            VectorForce.Parent = v1.object
        end
        if a1.noRotation then
            local AlignOrientation = Instance.new("AlignOrientation")
            AlignOrientation.MaxTorque = (1 / 0)
            AlignOrientation.Attachment0 = Attachment
            AlignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
            AlignOrientation.Parent = v1.object
        end

        function v1.Bounce(a1, a2) -- Line: 62 -- types: a1: table, a2: table
            local hitData = a1.hitData
            if hitData then
                local v1 = (a1.object.Velocity - 2 * a1.object.Velocity:Dot(hitData.Normal) * hitData.Normal) * a2.bounceFactor
                a1.object.Velocity = v1
            end
        end

        function v1.Initialize(a1_2) -- Line: 72 -- upvalues: a1 (val), RunService (upval)
            a1_2.object.Position = a1_2.startPosition
            a1_2.object.Velocity = a1_2.velocity
            a1_2.object.Parent = workspace.CurrentCamera
            a1_2._lastUpdate = tick()
            a1_2._start = workspace:GetServerTimeNow()
            a1_2.Position = a1_2.object.Position
            local u17 = RaycastParams.new()
            u17.FilterType = Enum.RaycastFilterType.Include
            u17.CollisionGroup = "Projectile"
            local whiteList = a1.whiteList or {}
            u17.FilterDescendantsInstances = whiteList
            a1_2.params = u17
            local startPosition = a1_2.startPosition
            a1_2.lastPosition = startPosition
            a1_2.elapsed = 0
            a1_2._maid:Mark((RunService.Stepped:Connect(function(a1_3, a2) -- Line: 92 -- upvalues: a1_2 (val), startPosition (ref), u17 (val), a1 (upval)
                debug.profilebegin("RobloxPhysics:Stepped")
                a1_2.elapsed = a1_2.elapsed + a2
                local Position = a1_2.object.Position
                local v1 = Position - startPosition
                if v1 ~= v1 then
                    debug.profileend()
                    return
                end
                a1_2.Position = Position
                local v2 = workspace:Spherecast(startPosition, a1_2.object.Size.X / 1.2, v1, u17)
                if v2 then
                    a1_2.Position = v2.Position
                    a1_2.hitData = v2
                    a1_2.onHit(a1_2, v2.Instance)
                end
                if a1.lifeTime then
                    local v3 = (workspace:GetServerTimeNow()) - a1_2._start
                    if a1.lifeTime <= v3 then
                        if a1_2.onDestroy then
                            a1_2.onDestroy()
                        end
                        a1_2:Destroy()
                        debug.profileend()
                        return
                    end
                end
                if a1.onStep then
                    a1.onStep(a1_2, a2)
                end
                a1_2.lastPosition = Position
                debug.profileend()
            end)))
        end

        function v1:Destroy() -- Line: 135 -- upvalues: a1 (val)
            self.events.onDestroy:Fire()
            self._maid:Destroy()
            self.object:Destroy()
            if a1.onDestroy then
                a1.onDestroy()
            end
        end

        return v1
    end,
}