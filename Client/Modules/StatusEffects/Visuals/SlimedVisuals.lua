-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.SlimedVisuals
-- Decompile time: 3.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Buffs = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Buffs")
return {
    onAdded = function(a1, a2) -- Line: 18 -- upvalues: Buffs (val)
        local Model = a1.Model
        if not Model then
            return nil
        end
        local PrimaryPart = Model.PrimaryPart
        if not PrimaryPart then
            return nil
        end
        local Slime = Buffs:FindFirstChild("Slime") or Buffs:FindFirstChild("Slowed")
        if not Slime then
            return nil
        end
        local Node = PrimaryPart:FindFirstChild("Node")
        local u36 = Slime:Clone()
        u36:ScaleTo((if not Node or not Node:IsA("Attachment") then 2 else math.abs(Node.Position.Y)) * 1)
        u36:PivotTo((Model:GetPivot()))
        local Part = u36:FindFirstChild("Part")
        if Part and Part:IsA("BasePart") then
            local FloorAttachment = Part:FindFirstChild("FloorAttachment")
            if FloorAttachment then
                local v1
                FloorAttachment.Position = Vector3.new(0, -v1, 0)
            end
            local WeldConstraint = Instance.new("WeldConstraint")
            WeldConstraint.Part0 = Part
            WeldConstraint.Part1 = PrimaryPart
            WeldConstraint.Parent = Part
        end
        u36.Parent = a1.Hitbox or Model
        local v2 = {}
        for i, j in u36:GetDescendants() do
            if j:IsA("ParticleEmitter") then
                table.insert(v2, j)
            end
        end
        local u112 = nil
        if a1.Replicator then
            u112 = (a1.Replicator:GetStateChangedSignal("Health")):Connect(function(a1) -- Line: 68 -- upvalues: u36 (val), u112 (ref)
                if a1 <= 0 then
                    u36:Destroy()
                    if u112 then
                        u112:Disconnect()
                        u112 = nil
                    end
                end
            end)
        end
        return {model = u36, emitters = v2, healthConn = u112}
    end,
    onUpdated = function(a1, a2, a3) -- Line: 86 -- upvalues: GameState (val)
        if a3 and a3.emitters then
            local v1 = math.max(GameState.TimeScale or 1, 0)
            for i, j in a3.emitters do
                if j.Parent then
                    j.TimeScale = v1
                end
            end
            return
        end
    end,
    onRemoved = function(a1, a2, a3) -- Line: 99
        if not a3 then
            return
        end
        if a3.model then
            a3.model:Destroy()
        end
        if a3.healthConn then
            a3.healthConn:Disconnect()
        end
    end,
}