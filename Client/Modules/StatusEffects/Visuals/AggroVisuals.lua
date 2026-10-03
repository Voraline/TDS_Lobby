-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.AggroVisuals
-- Decompile time: 1.00 ms

local Buffs = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Buffs")
return {
    onAdded = function(a1, a2) -- Line: 12 -- upvalues: Buffs (val)
        local Model = a1.Model
        if not Model then
            return nil
        end
        local PrimaryPart = Model.PrimaryPart
        if not PrimaryPart then
            return nil
        end
        local Aggro = Buffs:FindFirstChild("Aggro")
        if not Aggro then
            return nil
        end
        local v1 = math.abs(PrimaryPart.Node.Position.Y)
        local u19 = Aggro:Clone()
        u19:ScaleTo(v1 * 2)
        u19:PivotTo((Model:GetPivot()))
        u19.Part.FloorAttachment.Position = Vector3.new(0, -v1, 0)
        u19.Part.WeldConstraint.Part1 = PrimaryPart
        u19.Parent = workspace.CurrentCamera
        local u52 = nil
        if a1.Replicator then
            u52 = (a1.Replicator:GetStateChangedSignal("Health")):Connect(function(a1) -- Line: 42 -- upvalues: u19 (val), u52 (ref)
                if a1 <= 0 then
                    u19:Destroy()
                    if u52 then
                        u52:Disconnect()
                    end
                end
            end)
        end
        return {model = u19, healthConn = u52}
    end,
    onRemoved = function(a1, a2, a3) -- Line: 58
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