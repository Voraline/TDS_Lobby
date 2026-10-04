-- Script path: ReplicatedStorage.Shared.Modules.CatRom.Squad
-- Decompile time: 4.03 ms

local function InverseLogProduct(a1, a2, a3, a4, a5, a6, a7, a8) -- Line: 7
    local v1 = a1 * a5 + a2 * a6 + a3 * a7 + a4 * a8
    local v2 = a1 * a6 - a2 * a5 + a3 * a8 - a4 * a7
    local v3 = a1 * a7 - a2 * a8 - a3 * a5 + a4 * a6
    local v4 = a1 * a8 + a2 * a7 - a3 * a6 - a4 * a5
    local v5 = math.sqrt(v2 ^ 2 + v3 ^ 2 + v4 ^ 2)
    local v6 = v5 > 0.0001 and (math.atan2(v5, v1)) / (v5 * 4) or 0.38095238095238093 + v1 * (-0.19285714285714287 + v1 * (0.0761904761904762 - v1 / 70))
    return v2 * v6, v3 * v6, v4 * v6
end

local function GetControlRotation(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12) -- Line: 19
    -- upvalues: InverseLogProduct (val)
    local v1, v2, v3, v4
    if a1 * a5 + a2 * a6 + a3 * a7 + a4 * a8 < 0 then
        a1 = -a1
        a2 = -a2
        a3 = -a3
        a4 = -a4
    end
    if not (a9 * a5 + a10 * a6 + a11 * a7 + a12 * a8 < 0) then
        v3, v4, v1, v2 = a9, a10, a11, a12
    else
        v3 = -a9
        v4 = -a10
        v1 = -a11
        v2 = -a12
    end
    local v5, v6, v7 = InverseLogProduct(a1, a2, a3, a4, a5, a6, a7, a8)
    local v8, v9, v10 = InverseLogProduct(v3, v4, v1, v2, a5, a6, a7, a8)
    local v11 = v5 + v8
    local v12 = v6 + v9
    local v13 = v7 + v10
    local v14 = math.sqrt(v11 * v11 + v12 * v12 + v13 * v13)
    local v15 = v14 > 0.0001 and math.sin(v14) / v14 or v14 * v14 * (v14 * v14 / 120 - 0.16666666666666666) + 1
    local v16 = math.cos(v14)
    local v17 = v15 * v11
    local v18 = v15 * v12
    local v19 = v15 * v13
    return v16 * a5 - v17 * a6 - v18 * a7 - v19 * a8, v17 * a5 + v16 * a6 - v19 * a7 + v18 * a8, v18 * a5 + v19 * a6 + v16 * a7 - v17 * a8, v19 * a5 - v18 * a6 + v17 * a7 + v16 * a8
end

local function Slerp(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10) -- Line: 48
    local v1, v2
    if not (a10 < 0.9999) then
        v1 = 1 - a1
        v2 = a1
    else
        local v3 = a4 * a7 + a2 * a9 - a3 * a8 - a5 * a6
        local v4 = a4 * a6 - a2 * a8 + a5 * a7 - a3 * a9
        local v5 = a4 * a9 - a2 * a7 - a5 * a8 + a3 * a6
        local v6 = math.atan2(math.sqrt(v3 ^ 2 + v4 ^ 2 + v5 ^ 2), a10)
        local v7 = math.sqrt(1 - a10 * a10)
        v1 = math.sin((1 - a1) * v6) / v7
        v2 = math.sin(a1 * v6) / v7
    end
    return a2 * v1 + a6 * v2, a3 * v1 + a7 * v2, a4 * v1 + a8 * v2, a5 * v1 + a9 * v2
end

return function(a1, a2, a3, a4, a5) -- Line: 63 -- upvalues: GetControlRotation (val), Slerp (val)
    local v1 = a2[1]
    local v2 = a2[2]
    local v3 = a2[3]
    local v4 = a2[4]
    local v5 = a3[1]
    local v6 = a3[2]
    local v7 = a3[3]
    local v8 = a3[4]
    local v9, v10, v11, v12 = GetControlRotation(a1[1], a1[2], a1[3], a1[4], v1, v2, v3, v4, v5, v6, v7, v8)
    local v13, v14, v15, v16 = GetControlRotation(v1, v2, v3, v4, v5, v6, v7, v8, a4[1], a4[2], a4[3], a4[4])
    local v17 = v1 * v5 + v2 * v6 + v3 * v7 + v4 * v8
    local v18 = math.abs(v9 * v13 + v10 * v14 + v11 * v15 + v12 * v16)
    if v17 < 0 then
        v13 = -v13
        v14 = -v14
        v15 = -v15
        v16 = -v16
        v5 = -v5
        v6 = -v6
        v7 = -v7
        v8 = -v8
        v17 = -v17
    end
    local v19, v20, v21, v22 = Slerp(a5, v1, v2, v3, v4, v5, v6, v7, v8, v17)
    local v23, v24, v25, v26 = Slerp(a5, v9, v10, v11, v12, v13, v14, v15, v16, v18)
    return Slerp(2 * a5 * (1 - a5), v19, v20, v21, v22, v23, v24, v25, v26, v19 * v23 + v20 * v24 + v21 * v25 + v22 * v26)
end