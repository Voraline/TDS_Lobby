-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_diff-sequences@3.10.0.diff-sequences
-- Decompile time: 31.37 ms

local findSubsequences
local Number = (require((script.Parent:WaitForChild("luau-polyfill")))).Number

local function countCommonItemsF(a1, a2, a3, a4, a5) -- Line: 115
    -- upvalues: 
    local v1 = 0
    local v2, v3 = a1, a3
    while v2 < a2 do
        if not (v3 < a4) or not a5(v2, v3) then
            break
        end
        v2 = v2 + 1
        v3 = v3 + 1
        v1 = v1 + 1
    end
    return v1
end

local function countCommonItemsR(a1, a2, a3, a4, a5) -- Line: 127
    -- upvalues: 
    local v1 = 0
    local v2, v3 = a2, a4
    while a1 <= v2 do
        if not (a3 <= v3) or not a5(v2, v3) then
            break
        end
        v2 = v2 - 1
        v3 = v3 - 1
        v1 = v1 + 1
    end
    return v1
end

local function extendPathsF(a1, a2, a3, a4, a5, a6, a7) -- Line: 145
    -- upvalues: countCommonItemsF (val)
    local v1
    local v2 = 0
    local v3 = -a1
    local v4 = a6[v2 + 1]
    local v5 = v4
    local v6 = v2 + 1
    a6[v6] = a6[v6] + countCommonItemsF(v4 + 1, a2, a4 + v4 - v3 + 1, a3, a5)
    v6 = a1 < a7 and a1 or a7
    v2 = v2 + 1
    v3 = v3 + 2
    while v2 <= v6 do
        if v2 ~= a1 and v5 < a6[v2 + 1] then
            v4 = a6[v2 + 1]
            v5 = a6[v2 + 1]
            v1 = v2 + 1
            a6[v1] = v4 + countCommonItemsF(v4 + 1, a2, a4 + v4 - v3 + 1, a3, a5)
            v2 = v2 + 1
            v3 = v3 + 2
            continue
        end
        v4 = v5 + 1
        if a2 <= v4 then
            return v2 - 1
        end
        v5 = a6[v2 + 1]
        v1 = v2 + 1
        a6[v1] = v4 + countCommonItemsF(v4 + 1, a2, a4 + v4 - v3 + 1, a3, a5)
        v2 = v2 + 1
        v3 = v3 + 2
    end
    return a7
end

local function extendPathsR(a1, a2, a3, a4, a5, a6, a7) -- Line: 198
    -- upvalues: countCommonItemsR (val)
    local v1
    local v2 = 0
    local v3 = a1
    local v4 = a6[v2 + 1]
    local v5 = v4
    local v6 = v2 + 1
    a6[v6] = a6[v6] - countCommonItemsR(a2, v4 - 1, a3, a4 + v4 - v3 - 1, a5)
    v6 = a1 < a7 and a1 or a7
    v2 = v2 + 1
    v3 = v3 - 2
    while v2 <= v6 do
        if v2 ~= a1 and a6[v2 + 1] < v5 then
            v4 = a6[v2 + 1]
            v5 = a6[v2 + 1]
            v1 = v2 + 1
            a6[v1] = v4 - countCommonItemsR(a2, v4 - 1, a3, a4 + v4 - v3 - 1, a5)
            v2 = v2 + 1
            v3 = v3 - 2
            continue
        end
        v4 = v5 - 1
        if v4 < a2 then
            return v2 - 1
        end
        v5 = a6[v2 + 1]
        v1 = v2 + 1
        a6[v1] = v4 - countCommonItemsR(a2, v4 - 1, a3, a4 + v4 - v3 - 1, a5)
        v2 = v2 + 1
        v3 = v3 - 2
    end
    return a7
end

local function extendOverlappablePathsF(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11) -- Line: 248
    -- upvalues: countCommonItemsF (val), countCommonItemsR (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15
    local v16 = a4 - a2
    local v17 = a3 - a2
    local v18 = a5 - a4 - v17
    local v19 = -v18 - (a1 - 1)
    local v20 = -v18 + (a1 - 1)
    local v21 = 0
    local v22 = a1 < a8 and a1 or a8
    local v23 = 0
    local v24 = -a1
    while v23 <= v22 do
        v1 = true
        if v23 ~= 0 then
            v1 = false
            if v23 ~= a1 then
                v1 = v21 < a7[v23 + 1]
            end
        end
        v2 = v1 and a7[v23 + 1] or v21
        v3 = v1 and v2 or v2 + 1
        v4 = v16 + v3 - v24
        v5 = countCommonItemsF(v3 + 1, a3, v4 + 1, a5, a6)
        v6 = v3 + v5
        v21 = a7[v23 + 1]
        a7[v23 + 1] = v6
        if v19 <= v24 and v24 <= v20 then
            v7 = (a1 - 1 - (v24 + v18)) / 2
            if v7 <= a10 and a9[v7 + 1] - 1 <= v6 then
                v9 = v16 + v2
                v10 = v1 and v24 + 1 or v24 - 1
                v8 = v9 - v10
                v9 = countCommonItemsR(a2, v2, a4, v8, a6)
                v10 = v2 - v9
                v11 = v8 - v9
                v12 = v10 + 1
                v13 = v11 + 1
                a11.nChangePreceding = a1 - 1
                if a1 - 1 ~= v12 + v13 - a2 - a4 then
                    a11.aEndPreceding = v12
                    a11.bEndPreceding = v13
                else
                    a11.aEndPreceding = a2
                    a11.bEndPreceding = a4
                end
                a11.nCommonPreceding = v9
                if v9 ~= 0 then
                    a11.aCommonPreceding = v12
                    a11.bCommonPreceding = v13
                end
                a11.nCommonFollowing = v5
                if v5 ~= 0 then
                    a11.aCommonFollowing = v3 + 1
                    a11.bCommonFollowing = v4 + 1
                end
                v14 = v6 + 1
                v15 = v4 + v5 + 1
                a11.nChangeFollowing = a1 - 1
                if a1 - 1 ~= a3 + a5 - v14 - v15 then
                    a11.aStartFollowing = v14
                    a11.bStartFollowing = v15
                else
                    a11.aStartFollowing = a3
                    a11.bStartFollowing = a5
                end
                return true
            end
        end
        v23 = v23 + 1
        v24 = v24 + 2
    end
    return false
end

local function extendOverlappablePathsR(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11) -- Line: 374
    -- upvalues: countCommonItemsR (val), countCommonItemsF (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12
    local v13 = a5 - a3
    local v14 = a3 - a2
    local v15 = a5 - a4 - v14
    local v16 = v15 - a1
    local v17 = v15 + a1
    local v18 = 0
    local v19 = a1 < a10 and a1 or a10
    local v20 = 0
    local v21 = a1
    while v20 <= v19 do
        v1 = true
        if v20 ~= 0 then
            v1 = false
            if v20 ~= a1 then
                v1 = a9[v20 + 1] < v18
            end
        end
        v2 = v1 and a9[v20 + 1] or v18
        v3 = v1 and v2 or v2 - 1
        v4 = v13 + v3 - v21
        v5 = countCommonItemsR(a2, v3 - 1, a4, v4 - 1, a6)
        v6 = v3 - v5
        v18 = a9[v20 + 1]
        a9[v20 + 1] = v6
        if v16 <= v21 and v21 <= v17 then
            v7 = (a1 + (v21 - v15)) / 2
            if v7 <= a8 and v6 - 1 <= a7[v7 + 1] then
                v8 = v4 - v5
                a11.nChangePreceding = a1
                if a1 ~= v6 + v8 - a2 - a4 then
                    a11.aEndPreceding = v6
                    a11.bEndPreceding = v8
                else
                    a11.aEndPreceding = a2
                    a11.bEndPreceding = a4
                end
                a11.nCommonPreceding = v5
                if v5 ~= 0 then
                    a11.aCommonPreceding = v6
                    a11.bCommonPreceding = v8
                end
                a11.nChangeFollowing = a1 - 1
                if a1 ~= 1 then
                    v10 = v13 + v2
                    v11 = v1 and v21 - 1 or v21 + 1
                    v9 = v10 - v11
                    v10 = countCommonItemsF(v2, a3, v9, a5, a6)
                    a11.nCommonFollowing = v10
                    if v10 ~= 0 then
                        a11.aCommonFollowing = v2
                        a11.bCommonFollowing = v9
                    end
                    v11 = v2 + v10
                    v12 = v9 + v10
                    if a1 - 1 ~= a3 + a5 - v11 - v12 then
                        a11.aStartFollowing = v11
                        a11.bStartFollowing = v12
                    else
                        a11.aStartFollowing = a3
                        a11.bStartFollowing = a5
                    end
                else
                    a11.nCommonFollowing = 0
                    a11.aStartFollowing = a3
                    a11.bStartFollowing = a5
                end
                return true
            end
        end
        v20 = v20 + 1
        v21 = v21 - 2
    end
    return false
end

local function divide(a1, a2, a3, a4, a5, a6, a7, a8, a9) -- Line: 507
    -- upvalues: extendPathsF (val), extendPathsR (val), extendOverlappablePathsR (val), extendOverlappablePathsF (val)
    local v1, v2
    local v3 = a4 - a2
    local v4 = a5 - a3
    local v5 = a3 - a2
    local v6 = a5 - a4
    local v7 = v6 - v5
    local v8 = v5
    local v9 = v5
    a7[1] = a2 - 1
    a8[1] = a3
    if v7 % 2 == 0 then
        v1 = (not (a1 == 0) and a1 or v7) / 2
        v2 = (v5 + v6) / 2
        for i = 1, v2 do
            v8 = extendPathsF(i, a3, a5, v3, a6, a7, v8)
            if i < v1 then
                v9 = extendPathsR(i, a2, a4, v4, a6, a8, v9)
            elseif extendOverlappablePathsR(i, a2, a3, a4, a5, a6, a7, v8, a8, v9, a9) then
                return
            end
        end
        error(string.format("%s: no overlap aStart=%i aEnd=%i bStart=%i bEnd=%i", "diff-sequences", a2, a3, a4, a5))
        return
    end
    v1 = ((not (a1 == 0) and a1 or v7) + 1) / 2
    local v10 = (v5 + v6 + 1) / 2
    v2 = 1
    v8 = extendPathsF(v2, a3, a5, v3, a6, a7, v8)
    v2 = v2 + 1
    while v2 <= v10 do
        v9 = extendPathsR(v2 - 1, a2, a4, v4, a6, a8, v9)
        if not (v2 < v1) then
            if extendOverlappablePathsF(v2, a2, a3, a4, a5, a6, a7, v8, a8, v9, a9) then
                return
            end
        else
            v8 = extendPathsF(v2, a3, a5, v3, a6, a7, v8)
        end
        v2 = v2 + 1
    end
    error(string.format("%s: no overlap aStart=%i aEnd=%i bStart=%i bEnd=%i", "diff-sequences", a2, a3, a4, a5))
end

function findSubsequences(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10) -- Line: 622
    -- upvalues: divide (val), findSubsequences (val)
    local v1, v2
    if a5 - a4 < a3 - a2 then
        a6 = not a6
        if a6 and #a7 == 1 then
            v2 = a7[1]
            local u16, u17 = unpack(v2)
            a7[2] = {
                function(a1, a2, a3) -- Line: 642 -- upvalues: u16 (val)
                    return u16(a1, a3, a2)
                end,
                function(a1, a2) -- Line: 645 -- upvalues: u17 (val)
                    return u17(a2, a1)
                end,
            }
        end
        v1 = a2
        v2 = a3
        a2 = a4
        a3 = a5
        a4 = v1
        a5 = v2
    end
    v2 = a7[if not a6 then 1 else 2]
    v1, v2 = unpack(v2)
    divide(a1, a2, a3, a4, a5, v2, a8, a9, a10)
    local nChangePreceding = a10.nChangePreceding
    local aEndPreceding = a10.aEndPreceding
    local bEndPreceding = a10.bEndPreceding
    local nCommonPreceding = a10.nCommonPreceding
    local aCommonPreceding = a10.aCommonPreceding
    local bCommonPreceding = a10.bCommonPreceding
    local nCommonFollowing = a10.nCommonFollowing
    local aCommonFollowing = a10.aCommonFollowing
    local bCommonFollowing = a10.bCommonFollowing
    local nChangeFollowing = a10.nChangeFollowing
    local aStartFollowing = a10.aStartFollowing
    local bStartFollowing = a10.bStartFollowing
    if a2 < aEndPreceding and a4 < bEndPreceding then
        findSubsequences(nChangePreceding, a2, aEndPreceding, a4, bEndPreceding, a6, a7, a8, a9, a10)
    end
    if nCommonPreceding ~= 0 then
        v1(nCommonPreceding, aCommonPreceding, bCommonPreceding)
    end
    if nCommonFollowing ~= 0 then
        v1(nCommonFollowing, aCommonFollowing, bCommonFollowing)
    end
    if aStartFollowing < a3 and bStartFollowing < a5 then
        findSubsequences(nChangeFollowing, aStartFollowing, a3, bStartFollowing, a5, a6, a7, a8, a9, a10)
    end
end

local function validateLength(a1, a2) -- Line: 718 -- upvalues: Number (val) -- types: a1: string
    if typeof(a2) ~= "number" then
        error(string.format("%s: %s type %s is not a number", "diff-sequences", a1, (type(a2))))
    end
    if not Number.isSafeInteger(a2) then
        error(string.format("%s: %s type %s is not a safe integer", "diff-sequences", a1, (type(a2))))
    end
    if a2 < 0 then
        error(string.format("%s: %s type %s is a negative integer", "diff-sequences", a1, (type(a2))))
    end
end

local function validateCallback(a1, a2) -- Line: 730 -- types: a1: string
    if typeof(a2) ~= "function" then
        error(string.format("%s: %s type %s is not a function", "diff-sequences", a1, (type(a2))))
    end
end

return function(a1, a2, a3, a4) -- Line: 740
    -- upvalues: validateLength (val), countCommonItemsF (val), countCommonItemsR (val), findSubsequences (val)
    validateLength("aLength", a1)
    validateLength("bLength", a2)
    if typeof(a3) ~= "function" then
        error(string.format("%s: %s type %s is not a function", "diff-sequences", "isCommon", (type(a3))))
    end
    if typeof(a4) ~= "function" then
        error(string.format("%s: %s type %s is not a function", "diff-sequences", "foundSubsequence", (type(a4))))
    end
    local v1 = countCommonItemsF(0, a1, 0, a2, a3)
    if v1 ~= 0 then
        a4(v1, 0, 0)
    end
    if a1 ~= v1 or a2 ~= v1 then
        local v2 = countCommonItemsR(v1, a1 - 1, v1, a2 - 1, a3)
        local v3 = a1 - v2
        local v4 = a2 - v2
        local v5 = v1 + v2
        if a1 ~= v5 and a2 ~= v5 then
            findSubsequences(0, v1, v3, v1, v4, false, {{a4, a3}}, {0}, {0}, {
                aCommonFollowing = 0,
                aCommonPreceding = 0,
                aEndPreceding = 0,
                aStartFollowing = 0,
                bCommonFollowing = 0,
                bCommonPreceding = 0,
                bEndPreceding = 0,
                bStartFollowing = 0,
                nChangeFollowing = 0,
                nChangePreceding = 0,
                nCommonFollowing = 0,
                nCommonPreceding = 0,
            })
        end
        if v2 ~= 0 then
            a4(v2, v3, v4)
        end
    end
end