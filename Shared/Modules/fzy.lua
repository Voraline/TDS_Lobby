-- Script path: ReplicatedStorage.Shared.Modules.fzy
-- Decompile time: 5.06 ms

local u0 = {}

function u0.has_match(a1, a2, a3) -- Line: 28
    if not a3 then
        a1 = string.lower(a1)
        a2 = string.lower(a2)
    end
    local v1 = 1
    for i = 1, (string.len(a1)) do
        v1 = string.find(a2, a1:sub(i, i), v1, true)
        if not v1 then
            return false
        end
        v1 = v1 + 1
    end
    return true
end

local function is_lower(a1) -- Line: 47
    return a1:match("%l")
end

local function is_upper(a1) -- Line: 51
    return a1:match("%u")
end

local function precompute_bonus(a1) -- Line: 55
    local v1
    local v2 = {}
    local v3 = "/"
    for i = 1, (string.len(a1)) do
        v1 = a1:sub(i, i)
        if v3 == "/" or v3 == "\\" then
            v2[i] = 0.9
        elseif v3 == "-" or v3 == "_" or v3 == " " then
            v2[i] = 0.8
        elseif v3 == "." then
            v2[i] = 0.6
        elseif not v3:match("%l") or not v1:match("%u") then
            v2[i] = 0
        else
            v2[i] = 0.7
        end
    end
    return v2
end

local function compute(a1, a2, a3, a4, a5) -- Line: 79 -- upvalues: precompute_bonus (val)
    local v1, v2, v3, v4
    local v5 = precompute_bonus(a2)
    local v6 = string.len(a1)
    local v7 = string.len(a2)
    if not a5 then
        a1 = string.lower(a1)
        a2 = string.lower(a2)
    end
    local v8 = {}
    for i = 1, v7 do
        v8[i] = (a2:sub(i, i))
    end
    local v9, v10 = a3, a4
    for j = 1, v6 do
        v9[j] = {}
        v10[j] = {}
        v1 = (-1 / 0)
        v2 = if j ~= v6 then -0.01 else -0.005
        v3 = a1:sub(j, j)
        for k = 1, v7 do
            if v3 ~= v8[k] then
                v9[j][k] = (-1 / 0)
                v1 = v1 + v2
            else
                v4 = (-1 / 0)
                if j == 1 then
                    v4 = (k - 1) * -0.005 + v5[k]
                elseif k > 1 then
                    v4 = math.max(v10[j - 1][k - 1] + v5[k], v9[j - 1][k - 1] + 1)
                end
                v9[j][k] = v4
                v1 = math.max(v4, v1 + v2)
            end
            v10[j][k] = v1
        end
    end
end

function u0.score(a1, a2, a3) -- Line: 139 -- upvalues: compute (val)
    local v1 = string.len(a1)
    local v2 = string.len(a2)
    if v1 ~= 0 and v2 ~= 0 and not (v2 > 1024) and not (v2 < v1) then
        if v1 == v2 then
            return (1 / 0)
        end
        local v3 = {}
        compute(a1, a2, {}, v3, a3)
        return v3[v1][v2]
    end
    return (-1 / 0)
end

function u0.positions(a1, a2, a3) -- Line: 170 -- upvalues: compute (val)
    local v1 = string.len(a1)
    local v2 = string.len(a2)
    if v1 ~= 0 and v2 ~= 0 and not (v2 > 1024) and not (v2 < v1) then
        local v3, v4
        if v1 == v2 then
            v4 = {}
            for j = 1, v1 do
                v4[j] = j
            end
            return v4, (1 / 0)
        end
        v4 = {}
        local v5 = {}
        compute(a1, a2, v4, v5, a3)
        local v6 = {}
        local v7 = false
        local v8 = v2
        for i = v1, 1, -1 do
            while v8 >= 1 do
                if v4[i][v8] ~= (-1 / 0) then
                    if not v7 and v4[i][v8] ~= v5[i][v8] then
                        v8 = v8 - 1
                        continue
                    end
                    v3 = false
                    if i ~= 1 then
                        v3 = false
                        if v8 ~= 1 then
                            v3 = v5[i][v8] == v4[i - 1][v8 - 1] + 1
                        end
                    end
                    v6[i] = v8
                    v8 = v8 - 1
                    break
                end
                v8 = v8 - 1
            end
        end
        return v6, v5[v1][v2]
    end
    return {}, (-1 / 0)
end

function u0.filter(a1, a2, a3, a4) -- Line: 221 -- upvalues: u0 (val)
    local v1, v2
    local v3 = {}
    for i, v in ipairs(a2) do
        if u0.has_match(a1, v, a3) then
            v1, v2 = u0.positions(a1, v, a3)
            table.insert(v3, {i, v1, v2})
        elseif not a4 then
            table.insert(v3, {i, false, (-1 / 0)})
        end
    end
    return v3
end

function u0.get_score_min() -- Line: 243
    return (-1 / 0)
end

function u0.get_score_max() -- Line: 248
    return (1 / 0)
end

function u0.get_max_length() -- Line: 253
    return 1024
end

function u0.get_score_floor() -- Line: 261
    return -10.24
end

function u0.get_score_ceiling() -- Line: 269
    return 1024
end

return u0