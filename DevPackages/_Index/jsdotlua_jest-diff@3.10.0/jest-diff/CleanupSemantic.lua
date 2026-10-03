-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-diff@3.10.0.jest-diff.CleanupSemantic
-- Decompile time: 12.31 ms

require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local u9 = nil
local u10 = nil
local sub = string.sub
local byte = string.byte
local match = string.match
local find = string.find
local max = math.max
local min = math.min
local floor = math.floor
local insert = table.insert
local remove = table.remove
local u20 = {}
u20.__index = u20

function u20.new(a1, a2) -- Line: 68 -- upvalues: u20 (val) -- types: a1: number, a2: string
    return (setmetatable({a1, a2}, u20))
end

local function _diff_commonPrefix(a1, a2) -- Line: 79
    -- upvalues: byte (val), min (val), sub (val), floor (val)
    if #a1 ~= 0 and #a2 ~= 0 then
        local v1 = byte(a1, 1, 1)
        if v1 == byte(a2, 1, 1) then
            v1 = 1
            local v2 = min(#a1, #a2)
            local v3 = v2
            local v4 = 1
            local v5, v6 = a1, a2
            while v1 < v3 do
                if (sub(v5, v4, v3)) ~= sub(v6, v4, v3) then
                    v2 = v3
                end
                v3 = floor(v1 + (v2 - v1) / 2)
            end
            return v3
        end
    end
    return 0
end

local function _diff_commonSuffix(a1, a2) -- Line: 108
    -- upvalues: byte (val), min (val), sub (val), floor (val)
    if #a1 ~= 0 and #a2 ~= 0 then
        local v1 = byte(a1, -1)
        if v1 == byte(a2, -1) then
            v1 = 1
            local v2 = min(#a1, #a2)
            local v3 = v2
            local v4 = 1
            local v5, v6 = a1, a2
            while v1 < v3 do
                if (sub(v5, -v3, -v4)) ~= sub(v6, -v3, -v4) then
                    v2 = v3
                end
                v3 = floor(v1 + (v2 - v1) / 2)
            end
            return v3
        end
    end
    return 0
end

local function _diff_commonOverlap(a1, a2) -- Line: 139
    -- upvalues: sub (val), min (val), find (val)
    local v1 = #a1
    local v2 = #a2
    if v1 ~= 0 and v2 ~= 0 then
        local v3
        if v2 < v1 then
            a1 = sub(a1, v1 - v2 + 1)
        elseif v1 < v2 then
            a2 = sub(a2, 1, v1)
        end
        local v4 = min(v1, v2)
        if a1 == a2 then
            return v4
        end
        local v5 = 0
        local v6 = 1
        while true do
            v3 = find(a2, sub(a1, v4 - v6 + 1), 1, true)
            if v3 == nil then
                break
            end
            v6 = v6 + (v3 - 1)
            if v3 == 1 or (sub(a1, v4 - v6 + 1)) == sub(a2, 1, v6) then
                v5 = v6
                v6 = v6 + 1
            end
        end
        return v5
    end
    return 0
end

local function _diff_cleanupSemanticScore(a1, a2) -- Line: 290
    -- upvalues: sub (val), match (val)
    if #a1 ~= 0 and #a2 ~= 0 then
        local v1 = sub(a1, -1)
        local v2 = sub(a2, 1, 1)
        local v3 = match(v1, "%W")
        local v4 = match(v2, "%W")
        local v5 = v3 and match(v1, "%s")
        local v6 = v4 and match(v2, "%s")
        local v7 = v5 and match(v1, "%c")
        local v8 = v6 and match(v2, "%c")
        local v9 = v7 and match(a1, "\n\r?\n$")
        local v10 = v8 and match(a2, "^\r?\n\r?\n")
        if not v9 and not v10 then
            if not v7 and not v8 then
                if v3 and not v5 and v6 then
                    return 3
                end
                if not v5 and not v6 then
                    if not v3 and not v4 then
                        return 0
                    end
                    return 1
                end
                return 2
            end
            return 4
        end
        return 5
    end
    return 6
end

function u9(a1) -- Line: 337
    -- upvalues: _diff_commonSuffix (val), sub (val), _diff_cleanupSemanticScore (val), byte (val), remove (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12
    local v13 = 2
    local v14 = a1
    while v14[v13 + 1] do
        v5 = v14[v13 - 1]
        v6 = v14[v13 + 1]
        if v5[1] == 0 and v6[1] == 0 then
            v7 = v14[v13]
            v8 = v5[2]
            v9 = v7[2]
            v10 = v6[2]
            v11 = _diff_commonSuffix(v8, v9)
            if v11 > 0 then
                v12 = sub(v9, -v11)
                v8 = sub(v8, 1, -v11 - 1)
                v9 = v12 .. sub(v9, 1, -v11 - 1)
                v10 = v12 .. v10
            end
            v12 = v8
            v1 = v9
            v2 = v10
            v3 = (_diff_cleanupSemanticScore(v8, v9)) + _diff_cleanupSemanticScore(v9, v10)
            while true do
                if (byte(v9, 1)) ~= byte(v10, 1) then
                    break
                end
                v8 = v8 .. sub(v9, 1, 1)
                v9 = (sub(v9, 2)) .. sub(v10, 1, 1)
                v10 = sub(v10, 2)
                v4 = (_diff_cleanupSemanticScore(v8, v9)) + _diff_cleanupSemanticScore(v9, v10)
                if v3 <= v4 then
                    v12 = v8
                    v1 = v9
                    v2 = v10
                end
            end
            if v5[2] ~= v12 then
                if not (#v12 > 0) then
                    remove(v14, v13 - 1)
                    v13 = v13 - 1
                else
                    v14[v13 - 1][2] = v12
                end
                v14[v13][2] = v1
                if not (#v2 > 0) then
                    remove(v14, v13 + 1)
                    v13 = v13 - 1
                else
                    v14[v13 + 1][2] = v2
                end
            end
        end
        v13 = v13 + 1
    end
end

function u10(a1) -- Line: 401
    -- upvalues: u20 (val), _diff_commonPrefix (val), sub (val), insert (val), _diff_commonSuffix (val), remove (val)
    -- upvalues: u10 (ref)
    local v1, v2, v3, v4, v5, v6, v7, v8
    a1[#a1 + 1] = (u20.new(0, ""))
    local v9 = 1
    local v10 = 0
    local v11 = 0
    local v12 = ""
    local v13 = ""
    local v14 = a1
    while v14[v9] do
        v6 = v14[v9][1]
        if v6 == 1 then
            v11 = v11 + 1
            v13 = v13 .. v14[v9][2]
            v9 = v9 + 1
        elseif v6 == -1 then
            v10 = v10 + 1
            v12 = v12 .. v14[v9][2]
            v9 = v9 + 1
        elseif v6 == 0 then
            if 1 < v10 + v11 then
                if v10 > 0 and v11 > 0 then
                    v5 = _diff_commonPrefix(v13, v12)
                    if v5 > 0 then
                        v7 = v9 - v10 - v11
                        if not (v7 > 1) or v14[v7 - 1][1] ~= 0 then
                            insert(v14, 1, (u20.new(0, (sub(v13, 1, v5)))))
                            v9 = v9 + 1
                        else
                            v8 = v14[v7 - 1]
                            v8[2] = v14[v7 - 1][2] .. sub(v13, 1, v5)
                        end
                        v13 = sub(v13, v5 + 1)
                        v12 = sub(v12, v5 + 1)
                    end
                    v5 = _diff_commonSuffix(v13, v12)
                    if v5 ~= 0 then
                        v7 = v14[v9]
                        v7[2] = (sub(v13, -v5)) .. v14[v9][2]
                        v13 = sub(v13, 1, -v5 - 1)
                        v12 = sub(v12, 1, -v5 - 1)
                    end
                end
                v9 = v9 - v10 - v11
                v7 = v10 + v11
                for i = 1, v7 do
                    remove(v14, v9)
                end
                if #v12 > 0 then
                    insert(v14, v9, (u20.new(-1, v12)))
                    v9 = v9 + 1
                end
                if #v13 > 0 then
                    insert(v14, v9, (u20.new(1, v13)))
                    v9 = v9 + 1
                end
                v9 = v9 + 1
            elseif not (v9 > 1) or v14[v9 - 1][1] ~= 0 then
                v9 = v9 + 1
            else
                v7 = v14[v9 - 1]
                v7[2] = v14[v9 - 1][2] .. v14[v9][2]
                remove(v14, v9)
            end
        end
    end
    if v14[#v14][2] == "" then
        v14[#v14] = nil
    end
    v6 = false
    v9 = 2
    while v9 < #v14 do
        v7 = v14[v9 - 1]
        v8 = v14[v9 + 1]
        if v7[1] == 0 and v8[1] == 0 then
            v1 = v14[v9]
            v2 = v1[2]
            v3 = v7[2]
            v4 = v8[2]
            if #v3 == 0 then
                remove(v14, v9 - 1)
                v6 = true
            elseif sub(v2, -#v3) == v3 then
                v1[2] = v3 .. sub(v2, 1, -#v3 - 1)
                v8[2] = v3 .. v8[2]
                remove(v14, v9 - 1)
                v6 = true
            elseif sub(v2, 1, #v4) == v4 then
                v7[2] = v3 .. v4
                v1[2] = (sub(v2, #v4 + 1)) .. v4
                remove(v14, v9 + 1)
                v6 = true
            end
        end
        v9 = v9 + 1
    end
    if v6 then
        return u10(v14)
    end
end

return {
    DIFF_EQUAL = 0,
    DIFF_DELETE = -1,
    DIFF_INSERT = 1,
    Diff = u20,
    cleanupSemantic = function(a1) -- Line: 184
        -- upvalues: max (val), u20 (val), insert (val), u10 (ref), u9 (ref), _diff_commonOverlap (val), sub (val)
        local v1, v2, v3, v4, v5
        local v6 = false
        local v7 = {}
        local v8 = 0
        local v9 = nil
        local v10 = 1
        local v11 = 0
        local v12 = 0
        local v13 = 0
        local v14 = 0
        local v15 = a1
        while v15[v10] do
            if v15[v10][1] ~= 0 then
                if v15[v10][1] ~= 1 then
                    v14 = v14 + #v15[v10][2]
                else
                    v13 = v13 + #v15[v10][2]
                end
                if v9 and #v9 <= max(v11, v12) and #v9 <= max(v13, v14) then
                    insert(v15, v7[v8], (u20.new(-1, v9)))
                    v1 = v15[v7[v8] + 1]
                    v1[1] = 1
                    v8 = v8 - 1 - 1
                    v10 = v8 > 0 and v7[v8] or 0
                    v6 = true
                end
            else
                v8 = v8 + 1
                v7[v8] = v10
                v9 = v15[v10][2]
            end
            v10 = v10 + 1
        end
        if v6 then
            u10(v15)
        end
        u9(v15)
        v10 = 2
        while v15[v10] do
            if v15[v10 - 1][1] == -1 and v15[v10][1] == 1 then
                v1 = v15[v10 - 1][2]
                v2 = v15[v10][2]
                v3 = _diff_commonOverlap(v1, v2)
                v4 = _diff_commonOverlap(v2, v1)
                if not (v4 <= v3) then
                    if #v1 / 2 <= v4 or #v2 / 2 <= v4 then
                        insert(v15, v10, (u20.new(0, (sub(v1, 1, v4)))))
                        v5 = v10 - 1
                        v15[v5] = {1, (sub(v2, 1, #v2 - v4))}
                        v5 = v10 + 1
                        v15[v5] = {-1, (sub(v1, v4 + 1))}
                        v10 = v10 + 1
                    end
                elseif #v1 / 2 <= v3 or #v2 / 2 <= v3 then
                    insert(v15, v10, (u20.new(0, (sub(v2, 1, v3)))))
                    v5 = v15[v10 - 1]
                    v5[2] = (sub(v1, 1, #v1 - v3))
                    v5 = v15[v10 + 1]
                    v5[2] = (sub(v2, v3 + 1))
                    v10 = v10 + 1
                end
                v10 = v10 + 1
            end
            v10 = v10 + 1
        end
    end,
    _diff_commonPrefix = _diff_commonPrefix,
    _diff_commonSuffix = _diff_commonSuffix,
    _diff_commonOverlap = _diff_commonOverlap,
    _diff_cleanupMerge = u10,
    _diff_cleanupSemanticLossless = u9,
}