-- Script path: ReplicatedStorage.Packages.LyraLegacy.Tables
-- Decompile time: 3.36 ms

local copyDeep, equalsDeep, freezeDeep, mergeDeep, reconcileDeep

function copyDeep(a1) -- Line: 1 -- upvalues: copyDeep (val)
    local v1
    if typeof(a1) ~= "table" then
        return a1
    end
    local v2 = table.clone(a1)
    for i, j in a1 do
        if typeof(j) == "table" then
            v2[i] = (copyDeep(j))
        elseif typeof(j) == "buffer" then
            v1 = buffer.create(buffer.len(j))
            v2[i] = (buffer.copy(j, 0, v1))
        end
    end
    return v2
end

function mergeDeep(...) -- Line: 20 -- upvalues: copyDeep (val), mergeDeep (val)
    local v1, v2, v3, v4
    local v5 = {}
    for i = 1, (select("#", ...)) do
        v2 = select(i, ...)
        if typeof(v2) == "table" then
            v3 = nil
            v4 = nil
            for j, k in v2, v3, v4 do
                if typeof(k) ~= "table" then
                    if typeof(k) ~= "buffer" then
                        v5[j] = k
                    else
                        v1 = buffer.create(buffer.len(k))
                        v5[j] = (buffer.copy(k, 0, v1))
                    end
                elseif v5[j] == nil then
                    v5[j] = (copyDeep(k))
                elseif typeof(v5[j]) == "table" then
                    v5[j] = (mergeDeep(v5[j], k))
                else
                    v5[j] = (copyDeep(k))
                end
            end
        end
    end
    return v5
end

function equalsDeep(a1, a2) -- Line: 81 -- upvalues: equalsDeep (val) -- types: a1: table, a2: table
    if typeof(a1) == "table" and typeof(a2) == "table" then
        for i, j in a1 do
            if not equalsDeep(j, a2[i]) then
                return false
            end
        end
        for k, n in a2 do
            if not equalsDeep(n, a1[k]) then
                return false
            end
        end
        return true
    end
    return a1 == a2
end

function freezeDeep(a1) -- Line: 101 -- upvalues: freezeDeep (val)
    if typeof(a1) ~= "table" then
        return
    end
    if table.isfrozen(a1) == false then
        table.freeze(a1)
    end
    for i, j in a1 do
        if typeof(j) == "table" then
            freezeDeep(j)
        end
    end
end

function reconcileDeep(a1, a2) -- Line: 129 -- upvalues: reconcileDeep (val)
    local v1, v2
    if next(a2) == nil then
        if next(a1) == nil then
            return a1
        end
        return a2
    end
    local v3 = a1
    local v4 = false
    local v5 = nil
    local v6 = nil
    local v7, v8 = a1, a2
    for i, j in a2, v5, v6 do
        v2 = v7[i]
        if typeof(j) ~= "table" then
            if v2 ~= j then
                if not v4 then
                    v3 = table.clone(v7)
                    v4 = true
                end
                v3[i] = j
            end
        elseif typeof(v2) ~= "table" then
            if not v4 then
                v3 = table.clone(v7)
                v4 = true
            end
            v3[i] = j
        else
            v1 = reconcileDeep(v2, j)
            if v1 ~= v2 then
                if not v4 then
                    v3 = table.clone(v7)
                    v4 = true
                end
                v3[i] = v1
            end
        end
    end
    v5 = nil
    v6 = nil
    for k in v7, v5, v6 do
        if v8[k] == nil then
            if not v4 then
                v3 = table.clone(v7)
            end
            v3[k] = nil
        end
    end
    return v3
end

return {
    copyDeep = copyDeep,
    mergeDeep = mergeDeep,
    mergeShallow = function(...) -- Line: 49
        local v1
        local v2 = {}
        for i = 1, (select("#", ...)) do
            v1 = select(i, ...)
            if typeof(v1) == "table" then
                for j, k in v1 do
                    v2[j] = k
                end
            end
        end
        return v2
    end,
    equalsDeep = equalsDeep,
    freezeDeep = freezeDeep,
    map = function(a1, a2) -- Line: 67 -- types: a1: table, a2: function
        local v1
        local v2 = {}
        for i, j in a1 do
            v1 = a2(j, i, a1)
            if v1 ~= nil then
                table.insert(v2, v1)
            end
        end
        return v2
    end,
    reconcileDeep = reconcileDeep,
}