-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.MoltenCorpseVisuals
-- Decompile time: 2.34 ms

return {
    onAdded = function(a1, a2) -- Line: 8
        if not a1.Replicator then
            return nil
        end
        local u4 = nil
        u4 = (a1.Replicator:GetStateChangedSignal("Revived")):Connect(function(a1_2) -- Line: 16 -- upvalues: u4 (ref), a1 (val) -- types: a1_2: boolean
            local Color, WeldConstraint, v1
            if not a1_2 then
                return
            end
            u4:Disconnect()
            local Model = a1.Model
            if not Model then
                return
            end
            for i, j in Model:GetDescendants() do
                if j:IsA("BasePart") then
                    Color = j.Color
                    v1 = Color3.fromRGB(27, 42, 53)
                    j.Color = Color:Lerp(v1, 0.9)
                    j.Material = Enum.Material.Basalt
                    if j.Transparency < 1 then
                        j.Transparency = 0
                    end
                    if j:IsA("MeshPart") then
                        j.TextureID = ""
                    end
                elseif j:IsA("SurfaceAppearance") then
                    j:Destroy()
                elseif j:IsA("Motor6D") then
                    WeldConstraint = Instance.new("WeldConstraint")
                    WeldConstraint.Part0 = j.Part0
                    WeldConstraint.Part1 = j.Part1
                    WeldConstraint.Name = j.Name
                    WeldConstraint.Parent = j.Parent
                    j:Destroy()
                elseif j:IsA("Beam") or j:IsA("ParticleEmitter") or j:IsA("Trail") then
                    j.Enabled = false
                end
            end
        end)
        return {reviveConn = u4}
    end,
    onRemoved = function(a1, a2, a3) -- Line: 58
        if not a3 then
            return
        end
        if a3.reviveConn then
            a3.reviveConn:Disconnect()
        end
    end,
}