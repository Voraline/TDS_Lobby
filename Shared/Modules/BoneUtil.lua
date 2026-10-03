-- Script path: ReplicatedStorage.Shared.Modules.BoneUtil
-- Decompile time: 7.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local u11 = {HeightOffset = true, Pivot = true}
local u12 = {"ParticleEmitter", "Trail", "Beam"}

local function isVFX(a1) -- Line: 15 -- upvalues: u12 (val) -- types: a1: userdata
    return table.find(u12, a1.ClassName) ~= nil
end

local function containsVFX(a1) -- Line: 19 -- upvalues: u12 (val) -- types: a1: userdata
    for i, j in a1:GetDescendants() do
        if table.find(u12, j.ClassName) ~= nil then
            return true
        end
    end
    return false
end

local function mapBonesToParts(a1) -- Line: 29 -- upvalues: Create (val) -- types: a1: userdata
    local v1, v2
    local v3 = {}
    local v4 = Create("Folder", {Name = "BoneTree"})
    v3[a1] = v4
    for i, j in a1:GetDescendants() do
        if j:IsA("Bone") and not v3[j] then
            v1 = v3[j.Parent]
            if v1 and not v1:FindFirstChild(j.Name) then
                v2 = Create("Part", {
                    Name = j.Name,
                    Size = Vector3.new(0.25, 0.25, 0.25),
                    Locked = true,
                    CanCollide = false,
                    CanTouch = false,
                    CanQuery = false,
                    CastShadow = false,
                    Transparency = 1,
                    Color = Color3.new(1, 0, 0),
                    Material = Enum.Material.Neon,
                    Shape = Enum.PartType.Ball,
                    Anchored = false,
                    (Create("Attachment", {Name = "_BoneAttachment", CFrame = CFrame.identity})),
                })
                Create("RigidConstraint", {
                    Name = "_BoneConstraint",
                    Attachment0 = v2._BoneAttachment,
                    Attachment1 = j,
                    Parent = v2,
                })
                v3[j] = v2
                v2.Parent = v1
            end
        end
    end
    return v4, v3
end

local function getParentWorldCF(a1) -- Line: 176 -- types: a1: userdata
    if a1.Parent and a1.Parent:IsA("Bone") then
        return a1.Parent.WorldCFrame
    end
    return a1.Parent.CFrame
end

return {
    mapBonesToParts = mapBonesToParts,
    mapBoneVFXToParts = function(a1, a2) -- Line: 90
        -- upvalues: mapBonesToParts (val), u11 (val), u12 (val)
        local Parent, v1, v2, v3
        local v4, v5 = mapBonesToParts(a1)
        local v6 = {[v4] = true}
        local v7 = nil
        local v8 = nil
        local v9, v10 = a1, a2
        for i, j in v5, v7, v8 do
            v1 = false
            for k, n in i:GetChildren() do
                if not u11[n.Name] and not n:IsA("Bone") then
                    v2 = table.find(u12, n.ClassName) ~= nil
                    if v2 then
                        if n.Parent ~= v9 then
                            if not v10 then
                                v3 = n:Clone()
                                v2 = v3
                                v3.Parent = j
                            else
                                v2 = n
                                n.Parent = j
                            end
                            if v2:IsA("Beam") or v2:IsA("Trail") then
                                if v2.Attachment0 and v2.Attachment0.Parent == i then
                                    if not v10 then
                                        v3 = v2.Attachment0:Clone()
                                        v3.Parent = j
                                        v2.Attachment0 = v3
                                    else
                                        v2.Attachment0.Parent = j
                                    end
                                end
                                if v2.Attachment1 and v2.Attachment1.Parent == i then
                                    if not v10 then
                                        v3 = v2.Attachment1:Clone()
                                        v3.Parent = j
                                        v2.Attachment1 = v3
                                    else
                                        v2.Attachment1.Parent = j
                                    end
                                end
                            end
                            v1 = true
                        end
                    elseif n:IsA("Attachment") then
                        if n:IsA("Attachment") then
                            for m, i5 in n:GetDescendants() do
                                if table.find(u12, i5.ClassName) ~= nil then
                                    v2 = true
                                    if v2 and n.Parent ~= v9 then
                                        if not v10 then
                                            v3 = n:Clone()
                                            v2 = v3
                                            v3.Parent = j
                                        else
                                            v2 = n
                                            n.Parent = j
                                        end
                                        if v2:IsA("Beam") or v2:IsA("Trail") then
                                            if v2.Attachment0 and v2.Attachment0.Parent == i then
                                                if not v10 then
                                                    v3 = v2.Attachment0:Clone()
                                                    v3.Parent = j
                                                    v2.Attachment0 = v3
                                                else
                                                    v2.Attachment0.Parent = j
                                                end
                                            end
                                            if v2.Attachment1 and v2.Attachment1.Parent == i then
                                                if not v10 then
                                                    v3 = v2.Attachment1:Clone()
                                                    v3.Parent = j
                                                    v2.Attachment1 = v3
                                                else
                                                    v2.Attachment1.Parent = j
                                                end
                                            end
                                        end
                                        v1 = true
                                    end
                                    break
                                end
                            end
                            v2 = false
                            if v2 and n.Parent ~= v9 then
                                if not v10 then
                                    v3 = n:Clone()
                                    v2 = v3
                                    v3.Parent = j
                                else
                                    v2 = n
                                    n.Parent = j
                                end
                                if v2:IsA("Beam") or v2:IsA("Trail") then
                                    if v2.Attachment0 and v2.Attachment0.Parent == i then
                                        if not v10 then
                                            v3 = v2.Attachment0:Clone()
                                            v3.Parent = j
                                            v2.Attachment0 = v3
                                        else
                                            v2.Attachment0.Parent = j
                                        end
                                    end
                                    if v2.Attachment1 and v2.Attachment1.Parent == i then
                                        if not v10 then
                                            v3 = v2.Attachment1:Clone()
                                            v3.Parent = j
                                            v2.Attachment1 = v3
                                        else
                                            v2.Attachment1.Parent = j
                                        end
                                    end
                                end
                                v1 = true
                            end
                        elseif n.Parent ~= v9 then
                            if not v10 then
                                v3 = n:Clone()
                                v2 = v3
                                v3.Parent = j
                            else
                                v2 = n
                                n.Parent = j
                            end
                            if v2:IsA("Beam") or v2:IsA("Trail") then
                                if v2.Attachment0 and v2.Attachment0.Parent == i then
                                    if not v10 then
                                        v3 = v2.Attachment0:Clone()
                                        v3.Parent = j
                                        v2.Attachment0 = v3
                                    else
                                        v2.Attachment0.Parent = j
                                    end
                                end
                                if v2.Attachment1 and v2.Attachment1.Parent == i then
                                    if not v10 then
                                        v3 = v2.Attachment1:Clone()
                                        v3.Parent = j
                                        v2.Attachment1 = v3
                                    else
                                        v2.Attachment1.Parent = j
                                    end
                                end
                            end
                            v1 = true
                        end
                    end
                end
            end
            if v1 then
                Parent = i
                repeat
                    v6[Parent] = true
                    Parent = Parent.Parent
                until not Parent
            end
        end
        for i6, i7 in v5 do
            if not v6[i6] and i7 ~= v4 then
                i7:Destroy()
            end
        end
        return v4
    end,
    faceWorldPositionLocal = function(a1, a2, a3, a4) -- Line: 186 -- types: a1: userdata, a2: vector, a3: vector?, a4: userdata?
        local WorldCFrame
        local v1 = a3 or Vector3.new(0, 1, 0)
        local v2 = a4 or CFrame.identity
        local v3 = (if not a1.Parent then a1.Parent.CFrame else if not a1.Parent:IsA("Bone") then a1.Parent.CFrame else a1.Parent.WorldCFrame):PointToObjectSpace(a2)
        local Position = a1.CFrame.Position
        if (v3 - Position).Magnitude < 1e-06 then
            return
        end
        return CFrame.lookAt(Position, v3, (WorldCFrame:VectorToObjectSpace(v1)).Unit) * v2
    end,
    faceWorldPositionLockAxis = function(a1, a2, a3, a4) -- Line: 211 -- types: a1: userdata, a2: vector, a3: vector, a4: userdata?
        local v1 = a4 or CFrame.identity
        local WorldCFrame = if not a1.Parent then a1.Parent.CFrame else if not a1.Parent:IsA("Bone") then a1.Parent.CFrame else a1.Parent.WorldCFrame
        local Position = a1.CFrame.Position
        local v2 = WorldCFrame:PointToObjectSpace(a2)
        local Unit = a3.Unit
        local v3 = v2 - Position
        if v3.Magnitude < 1e-06 then
            return
        end
        local v4 = v3 - Unit * v3:Dot(Unit)
        if v4.Magnitude < 1e-06 then
            return
        end
        return CFrame.lookAt(Position, Position + v4.Unit, Unit) * v1
    end,
}