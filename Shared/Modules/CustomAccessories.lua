-- Script path: ReplicatedStorage.Shared.Modules.CustomAccessories
-- Decompile time: 2.75 ms

return {
    AddAccessories = function(a1, a2) -- Line: 3 -- types: a1: userdata, a2: table
        local Model, Motor6D, v1, v2
        local u274 = {}
        local v3 = {}
        local Scale = a1:GetScale()
        local v4, v5 = a1, a2
        for i, j in a1:GetChildren() do
            if j:IsA("BasePart") then
                for k, n in j:GetChildren() do
                    if n:IsA("Attachment") and not v3[n.Name] then
                        if n.Name ~= "RootRigAttachment" or n.Parent.Name ~= "LowerTorso" then
                            v3[n.Name] = n
                        end
                    end
                end
            end
        end
        v4:ScaleTo(1)
        local v6 = nil
        local v7 = nil
        for m, i5 in v5, v6, v7 do
            v1 = i5:Clone()
            Model = Instance.new("Model")
            Model.Name = i5.Name
            Model:AddTag("CustomAccessory")
            for k2, v in pairs(v1:GetChildren()) do
                v.Parent = Model
            end
            v1:Destroy()
            for i6, i7 in Model:GetDescendants() do
                if i7:IsA("BasePart") then
                    i7.CanCollide = false
                    i7.CanTouch = false
                    i7.CanQuery = false
                elseif not i7:IsA("Attachment") then
                    if i7:IsA("Motor6D") then
                        if i7.Part0 == nil or i7.Part1 == nil then
                            v2 = v4:FindFirstChild(i7.Name)
                            if v2 and v2:IsA("BasePart") then
                                if i7.Part0 == nil then
                                    i7.Part0 = v2
                                elseif i7.Part1 == nil then
                                    i7.Part1 = v2
                                end
                            end
                        end
                    end
                elseif i7.Name ~= "Attachment" and i7.Name:match("Attachment$") then
                    v2 = v3[i7.Name]
                    if v2 then
                        Motor6D = Instance.new("Motor6D")
                        Motor6D.Name = "AccessoryWeld"
                        Motor6D.C0 = i7.CFrame
                        Motor6D.C1 = v2.CFrame
                        Motor6D.Part0 = i7.Parent
                        Motor6D.Part1 = v2.Parent
                        i7.Parent.CFrame = v2.Parent.CFrame * (Motor6D.C1 * Motor6D.C0:Inverse())
                        Motor6D.Parent = i7.Parent
                    end
                end
            end
            for k3, i8 in pairs(Model:GetDescendants()) do
                if i8:IsA("JointInstance") and i8.Part0 and i8.Part1 then
                    if not i8.Part0 then
                        if i8.Part1 and i8.Part1:IsDescendantOf(v4) then
                            i8.Part0.CFrame = i8.Part1.CFrame * i8.C1
                        end
                    elseif i8.Part0:IsDescendantOf(v4) then
                        i8.Part1.CFrame = i8.Part0.CFrame * i8.C0
                    elseif i8.Part1 and i8.Part1:IsDescendantOf(v4) then
                        i8.Part0.CFrame = i8.Part1.CFrame * i8.C1
                    end
                end
            end
            table.insert(u274, Model)
            Model.Parent = v4
        end
        v4:ScaleTo(Scale)
        return function() -- Line: 105 -- upvalues: u274 (val)
            for i, j in u274 do
                j:Destroy()
            end
            table.clear(u274)
        end
    end,
    RemoveAccessories = function(a1) -- Line: 114 -- types: a1: userdata
        for i, j in a1:GetChildren() do
            if j:HasTag("CustomAccessory") then
                j:Destroy()
            end
        end
    end,
}