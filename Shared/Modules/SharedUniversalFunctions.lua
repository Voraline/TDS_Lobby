-- Script path: ReplicatedStorage.Shared.Modules.SharedUniversalFunctions
-- Decompile time: 2.89 ms

local v1 = {
    getBoundingBox = function(a1, a2, a3) -- Line: 3 -- types: a1: userdata, a2: function?, a3: boolean?
        local CFrame, Size, X, Y, Z, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15
        local abs = math.abs
        local v16 = (1 / 0)
        local v17 = (1 / 0)
        local v18 = (1 / 0)
        local v19 = (-1 / 0)
        local v20 = (-1 / 0)
        local v21 = (-1 / 0)
        local v22, v23 = a3, a2
        for k, v in pairs(a1:GetDescendants()) do
            if v:IsA("BasePart") then
                if v22 == true or v.Transparency < 1 then
                    if not v23 or v23(v) then
                        CFrame = v.CFrame
                        Size = v.Size
                        X = Size.X
                        Y = Size.Y
                        Z = Size.Z
                        v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12 = CFrame:components()
                        v13 = 0.5 * (abs(v4) * X + abs(v5) * Y + abs(v6) * Z)
                        v14 = 0.5 * (abs(v7) * X + abs(v8) * Y + abs(v9) * Z)
                        v15 = 0.5 * (abs(v10) * X + abs(v11) * Y + abs(v12) * Z)
                        if v1 - v13 < v16 then
                            v16 = v1 - v13
                        end
                        if v2 - v14 < v17 then
                            v17 = v2 - v14
                        end
                        if v3 - v15 < v18 then
                            v18 = v3 - v15
                        end
                        if v19 < v1 + v13 then
                            v19 = v1 + v13
                        end
                        if v20 < v2 + v14 then
                            v20 = v2 + v14
                        end
                        if v21 < v3 + v15 then
                            v21 = v3 + v15
                        end
                    end
                end
            end
        end
        local v24 = Region3.new(Vector3.new(v16, v17, v18), (Vector3.new(v19, v20, v21)))
        return v24.CFrame, v24.Size
    end,
}
table.freeze(v1)
return v1