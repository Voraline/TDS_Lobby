-- Script path: ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Size
-- Decompile time: 6.44 ms

local ParseDescendants

function ParseDescendants(a1, a2, ...) -- Line: 1 -- upvalues: ParseDescendants (val)
    local v1, v2, v3
    local v4 = {...}
    local Children = a1:GetChildren()
    local v5 = #Children
    for i = 1, v5 do
        v2 = Children[i]
        if not v2:IsA("BasePart") then
            v3 = #v4
            for j = 1, v3 do
                v1 = v4[j]
                if v2.ClassName == v1 then
                    if not a2[v1] then
                        a2[v1] = {v2}
                    else
                        a2[v1][#a2[v1] + 1] = v2
                    end
                end
            end
        elseif not a2.Part then
            a2.Part = {v2}
        else
            a2.Part[#a2.Part + 1] = v2
        end
        ParseDescendants(v2, a2, ...)
    end
    return a2
end

return function(a1, a2) -- Line: 35 -- upvalues: ParseDescendants (val)
    local v1, v2, v3, v4, v5, v6
    local v7 = ParseDescendants(a1, {}, "SpecialMesh", "Weld", "WeldConstraint", "Motor6D", "Attachment")
    local v8 = a2 - 1
    local Position = nil
    if a1.ClassName == "Model" then
        Position = if typeof(a1.PrimaryPart) ~= "Instance" then a1:GetPivot().Position else if not a1.PrimaryPart:IsA("BasePart") then a1:GetPivot().Position else a1.PrimaryPart.Position
    elseif a1:IsA("BasePart") then
        Position = a1.Position
    end
    local WeldConstraint = v7.WeldConstraint
    if WeldConstraint then
        local v9 = #WeldConstraint
        for i = 1, v9 do
            v6 = WeldConstraint[i]
            v1 = {Object = v6, Part0 = v6.Part0, Part1 = v6.Part1}
            v6.Part1 = nil
            v6.Part0 = nil
            WeldConstraint[i] = v1
        end
    end
    local Weld = v7.Weld
    if Weld then
        local v10 = #Weld
        for j = 1, v10 do
            v1 = Weld[j]
            v2 = {
                Parent = v1.Parent,
                Part0 = v1.Part0,
                Part1 = v1.Part1,
                C0 = v1.C0 + v1.C0.p * v8,
                C1 = v1.C1 + v1.C1.p * v8,
            }
            v1.Part1 = nil
            v1.Part0 = nil
            v1:Destroy()
            Weld[j] = v2
        end
    end
    local SpecialMesh = v7.SpecialMesh
    if SpecialMesh then
        local v11 = #SpecialMesh
        for k = 1, v11 do
            v2 = SpecialMesh[k]
            if v2.MeshType == Enum.MeshType.FileMesh then
                v2.Scale = v2.Scale * a2
                v2.Offset = v2.Offset * a2
            end
        end
    end
    local Attachment = v7.Attachment
    if Attachment then
        v6 = #Attachment
        for n = 1, v6 do
            v3 = Attachment[n]
            v3.Position = v3.Position * a2
        end
    end
    v6 = {}
    local Part = v7.Part
    if Part then
        v2 = #Part
        for m = 1, v2 do
            v4 = Part[m]
            v6[v4] = v4.Anchored
            v4.Anchored = true
            v4.Size = v4.Size * a2
        end
    end
    local Motor6D = v7.Motor6D
    if Motor6D then
        v3 = #Motor6D
        for i5 = 1, v3 do
            v5 = Motor6D[i5]
            v5.C0 = v5.C0 + v5.C0.p * v8
            v5.C1 = v5.C1 + v5.C1.p * v8
        end
    end
    if Part then
        v3 = #Part
        for i6 = 1, v3 do
            v5 = Part[i6]
            v5.CFrame = v5.CFrame + (v5.Position - Position) * v8
            v5.Anchored = false
            v5.Anchored = v6[v5]
        end
    end
    local Weld_2 = v7.Weld
    if Weld_2 then
        local Weld_3, v12
        local v13 = #Weld_2
        for i7 = 1, v13 do
            v12 = Weld_2[i7]
            Weld_3 = Instance.new("Weld")
            Weld_3.Parent = v12.Parent
            Weld_3.Part0 = v12.Part0
            Weld_3.Part1 = v12.Part1
            Weld_3.C0 = v12.C0
            Weld_3.C1 = v12.C1
        end
    end
    local WeldConstraint_2 = v7.WeldConstraint
    if WeldConstraint_2 then
        local Object, v14
        v4 = #WeldConstraint_2
        for i8 = 1, v4 do
            v14 = WeldConstraint_2[i8]
            Object = v14.Object
            Object.Part0 = v14.Part0
            Object.Part1 = v14.Part1
        end
    end
end