-- Script path: ReplicatedStorage.Shared.Modules.WindShake.VectorMap
-- Decompile time: 7.87 ms

local u0 = {}
u0.__index = u0

function u0.new(a1) -- Line: 6 -- upvalues: u0 (val) -- types: a1: number?
    return (setmetatable({_voxelSize = a1 or 50, _voxels = {}}, u0))
end

function u0._debugDrawVoxel(a1, a2) -- Line: 13 -- types: a1: table, a2: vector
    local Part = Instance.new("Part")
    Part.Name = tostring(a2)
    Part.Anchored = true
    Part.CanCollide = false
    Part.Transparency = 1
    Part.Size = Vector3.new(1, 1, 1) * a1._voxelSize
    Part.Position = a2 * a1._voxelSize + Vector3.new(1, 1, 1) * (a1._voxelSize / 2)
    Part.Parent = workspace
    local SelectionBox = Instance.new("SelectionBox")
    SelectionBox.Color3 = Color3.new(0, 0, 1)
    SelectionBox.Adornee = Part
    SelectionBox.Parent = Part
    task.delay(0.03333333333333333, Part.Destroy, Part)
end

function u0.AddObject(a1, a2, a3) -- Line: 31 -- types: a1: table, a2: vector
    local ClassName = a3.ClassName
    local _voxelSize = a1._voxelSize
    local v1 = Vector3.new(math.floor(a2.X / _voxelSize), math.floor(a2.Y / _voxelSize), (math.floor(a2.Z / _voxelSize)))
    local v2 = a1._voxels[v1]
    if v2 == nil then
        a1._voxels[v1] = {[ClassName] = {a3}}
        return v1
    end
    if v2[ClassName] == nil then
        v2[ClassName] = {a3}
        return v1
    end
    table.insert(v2[ClassName], a3)
    return v1
end

function u0.RemoveObject(a1, a2, a3) -- Line: 56 -- types: a1: table, a2: vector
    local v1
    local v2 = a1._voxels[a2]
    if v2 == nil then
        return
    end
    local ClassName = a3.ClassName
    if v2[ClassName] == nil then
        return
    end
    local v3 = v2[ClassName]
    for i, j in v3 do
        if j == a3 then
            v1 = #v3
            v3[i] = v3[v1]
            v3[v1] = nil
            break
        end
    end
    if #v3 == 0 then
        v2[ClassName] = nil
        if next(v2) == nil then
            a1._voxels[a2] = nil
        end
    end
end

function u0.GetVoxel(a1, a2) -- Line: 90 -- types: a1: table, a2: vector
    return a1._voxels[a2]
end

function u0.ForEachObjectInRegion(a1, a2, a3, a4) -- Line: 94 -- types: a1: table, a2: vector, a3: vector, a4: function
    local v1, v2, v3
    local _voxelSize = a1._voxelSize
    local v4 = math.min(a3.X, a2.X)
    local v5 = math.min(a3.Y, a2.Y)
    local v6 = math.min(a3.Z, a2.Z)
    local v7 = math.max(a3.X, a2.X)
    local v8 = math.max(a3.Y, a2.Y)
    local v9 = math.max(a3.Z, a2.Z)
    local v10, v11 = a1, a4
    for i = (math.floor(v4 / _voxelSize)), (math.floor(v7 / _voxelSize)) do
        for j = (math.floor(v6 / _voxelSize)), (math.floor(v9 / _voxelSize)) do
            for k = (math.floor(v5 / _voxelSize)), (math.floor(v8 / _voxelSize)) do
                v1 = v10._voxels[Vector3.new(i, k, j)]
                if v1 then
                    v2 = nil
                    v3 = nil
                    for n, m in v1, v2, v3 do
                        for i5, i6 in m do
                            v11(n, i6)
                        end
                    end
                end
            end
        end
    end
end

function u0.ForEachObjectInView(a1, a2, a3, a4) -- Line: 123 -- types: a1: table, a2: userdata, a3: number, a4: function
    local Y_3, Y_4, Z_3, Z_4, Z_6, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12
    local _voxelSize = a1._voxelSize
    local CFrame_2 = a2.CFrame
    local Position = CFrame_2.Position
    local RightVector = CFrame_2.RightVector
    local UpVector = CFrame_2.UpVector
    local u9 = a3 / 2
    local u17 = math.tan((math.rad((a2.FieldOfView + 5) / 2))) * a3
    local u23 = u17 * (a2.ViewportSize.X / a2.ViewportSize.Y)
    local v13 = CFrame_2 * CFrame.new(0, 0, -a3)
    local v14 = v13 * Vector3.new(-u23, u17, 0)
    local v15 = v13 * Vector3.new(u23, u17, 0)
    local v16 = v13 * Vector3.new(-u23, -u17, 0)
    local v17 = v13 * Vector3.new(u23, -u17, 0)
    local u62 = (CFrame_2 * CFrame.new(0, 0, -u9)):Inverse()
    local Unit = UpVector:Cross(v17 - Position).Unit
    local Unit_2 = UpVector:Cross(v16 - Position).Unit
    local Unit_3 = RightVector:Cross(Position - v15).Unit
    local Unit_4 = RightVector:Cross(Position - v17).Unit
    local v18 = (((Position:Min(v14)):Min(v15)):Min(v16)):Min(v17)
    local v19 = (((Position:Max(v14)):Max(v15)):Max(v16)):Max(v17)
    v18 = Vector3.new(math.floor(v18.X / _voxelSize), math.floor(v18.Y / _voxelSize), (math.floor(v18.Z / _voxelSize)))
    v19 = Vector3.new(math.floor(v19.X / _voxelSize), math.floor(v19.Y / _voxelSize), (math.floor(v19.Z / _voxelSize)))

    local function isPointInView(a1) -- Line: 171
        -- upvalues: u62 (val), u23 (val), u17 (val), u9 (val), Position (val), Unit (val), Unit_2 (val), Unit_3 (val)
        -- upvalues: Unit_4 (val)
        local v1 = u62 * a1
        if not (u23 < v1.X)
            and not (v1.X < -u23)
            and not (u17 < v1.Y)
            and not (v1.Y < -u17)
            and not (u9 < v1.Z)
            and not (v1.Z < -u9) then
            local v2 = a1 - Position
            if not ((Unit:Dot(v2)) < 0)
                and not (0 < (Unit_2:Dot(v2)))
                and not ((Unit_3:Dot(v2)) < 0)
                and not (0 < (Unit_4:Dot(v2))) then
                return true
            end
            return false
        end
        return false
    end

    local X_3 = v18.X
    local X_4 = v19.X
    local v20, v21 = a1, a4
    for i = X_3, X_4 do
        v1 = i * _voxelSize
        v2 = math.clamp(v13.X, v1, v1 + _voxelSize)
        Y_3 = v18.Y
        Y_4 = v19.Y
        for j = Y_3, Y_4 do
            v3 = j * _voxelSize
            v4 = math.clamp(v13.Y, v3, v3 + _voxelSize)
            Z_3 = v18.Z
            Z_4 = v19.Z
            for k = Z_3, Z_4 do
                v5 = k * _voxelSize
                if isPointInView((Vector3.new(v2, v4, (math.clamp(v13.Z, v5, v5 + _voxelSize))))) then
                    v6 = k
                    v7 = v18.Z - 1
                    v8 = k
                    Z_6 = v19.Z
                    while v8 <= Z_6 do
                        v9 = math.floor((v8 + Z_6) / 2)
                        if not isPointInView((Vector3.new(v2, v4, (math.clamp(v13.Z, v9 * _voxelSize, v9 * _voxelSize + _voxelSize))))) then
                            Z_6 = v9 - 1
                        else
                            v7 = v9
                            v8 = v9 + 1
                        end
                    end
                    for n = v6, v7 do
                        v10 = v20._voxels[Vector3.new(i, j, n)]
                        if v10 then
                            v11 = nil
                            v12 = nil
                            for m, i5 in v10, v11, v12 do
                                for i6, i7 in i5 do
                                    v21(m, i7)
                                end
                            end
                        end
                    end
                    break
                end
            end
        end
    end
end

function u0.ClearAll(a1) -- Line: 259
    a1._voxels = {}
end

return u0