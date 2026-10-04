-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.HiddenVisuals
-- Decompile time: 1.19 ms

return {
    onAdded = function(a1, a2) -- Line: 8
        local Model = a1.Model
        if not Model then
            return nil
        end
        local v1 = {}
        for i, j in Model:GetDescendants() do
            if j:IsA("BasePart") or j:IsA("Decal") or j:IsA("Texture") then
                v1[j] = j.Transparency
                j.Transparency = j.Transparency + (1 - j.Transparency) * 0.5
            end
        end
        return {originals = v1}
    end,
    onRemoved = function(a1, a2, a3) -- Line: 26
        if a3 and a3.originals then
            for i, j in a3.originals do
                if i and i.Parent then
                    i.Transparency = j
                end
            end
            return
        end
    end,
}