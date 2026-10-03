-- Script path: ReplicatedStorage.Shared.Modules.Utils.table
-- Decompile time: 4.93 ms

local u2 = newproxy(true)
local v1 = {none = u2, NONE = u2}
local v2 = {__index = table}
local u7 = setmetatable(v1, v2)

function u7.reconcile(a1, a2) -- Line: 9 -- upvalues: u7 (val)
    for k, v in pairs(a1) do
        if type(k) == "string" then
            if a2[k] ~= nil then
                if type(a2[k]) == "table" and type(v) == "table" then
                    u7.reconcile(v, a2[k])
                end
            elseif type(v) ~= "table" then
                a2[k] = v
            else
                a2[k] = (u7.deepClone(v))
            end
        end
    end
    return a2
end

function u7.index(a1, a2) -- Line: 27
    for k, v in pairs(a1) do
        if v == a2 then
            return k
        end
    end
    return nil
end

function u7.merge(...) -- Line: 37 -- upvalues: u2 (val)
    local v1, v2, v3, v4
    local v5 = {}
    for i = 1, (select("#", ...)) do
        v2 = select(i, ...)
        if type(v2) == "table" then
            v3 = nil
            v4 = nil
            for j, k in v2, v3, v4 do
                v1 = if k ~= u2 then k else nil
                v5[j] = v1
            end
        end
    end
    return v5
end

function u7.mergeList(...) -- Line: 55 -- upvalues: u7 (val)
    local v1 = {}
    local v2 = {...}
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        for k, n in j do
            u7.insert(v1, n)
        end
    end
    return v1
end

function u7.reverse(a1) -- Line: 67 -- upvalues: u7 (val)
    local v1 = {}
    for i = #a1, 1, -1 do
        u7.insert(v1, a1[i])
    end
    return v1
end

function u7.pull(a1, a2) -- Line: 77 -- upvalues: u7 (val)
    u7.remove(a1, u7.index(a1, a2))
end

function u7.deepClone(a1) -- Line: 81 -- upvalues: u7 (val)
    local v1 = {}
    if getmetatable(a1) then
        return a1
    end
    for k, v in pairs(a1) do
        if type(v) == "table" then
            v = u7.deepClone(v)
        end
        v1[k] = v
    end
    return v1
end

function u7.deepCompare(a1, a2) -- Line: 101 -- upvalues: u7 (val) -- types: a1: table, a2: table
    if a1 == a2 then
        return true
    end
    if a1 and a2 then
        if next(a1) == nil and next(a2) == nil then
            return true
        end
        if next(a1) ~= nil and next(a2) ~= nil then
            local v1, v2 = a2, a1
            for k, v in pairs(a1) do
                if type(v) == "table" and not getmetatable(v) then
                    if u7.deepCompare(v, v1[k]) then
                        continue
                    end
                    return false
                end
                if v ~= v1[k] then
                    return false
                end
            end
            for k2, i in pairs(v1) do
                if type(i) == "table" and not getmetatable(i) then
                    if u7.deepCompare(i, v2[k2]) then
                        continue
                    end
                    return false
                end
                if i ~= v2[k2] then
                    return false
                end
            end
            return true
        end
        return false
    end
    return false
end

function u7.shallowCompare(a1, a2) -- Line: 142
    for k, v in pairs(a1) do
        if a2[k] ~= v then
            return false
        end
    end
    for k2, i in pairs(a2) do
        if a1[k2] ~= i then
            return false
        end
    end
    return true
end

function u7.move(a1, a2, a3) -- Line: 158 -- upvalues: u7 (val)
    local v1 = a1[a2]
    if a2 < a3 then
        a3 = a3 - 1
    end
    u7.remove(a1, a2)
    u7.insert(a1, a3, v1)
end

function u7.flatMap(a1, a2) -- Line: 169 -- upvalues: u7 (val)
    local v1
    local v2 = {}
    for k, v in pairs(a1) do
        v1 = a2(v, k)
        if v1 then
            for k2, i in pairs(v1) do
                u7.insert(v2, i)
            end
        end
    end
    return v2
end

function u7.map(a1, a2) -- Line: 185 -- upvalues: u7 (val)
    local v1
    local v2 = {}
    for k, v in pairs(a1) do
        v1 = a2(v, k)
        if v1 then
            u7.insert(v2, v1)
        end
    end
    return v2
end

function u7.flatten(a1) -- Line: 199 -- upvalues: u7 (val)
    local v1 = {}
    for k, v in pairs(a1) do
        if type(v) ~= "table" then
            u7.insert(v1, v)
        else
            for k2, i in pairs(u7.flatten(v)) do
                u7.insert(v1, i)
            end
        end
    end
    return v1
end

function u7.count(a1) -- Line: 215
    local v1 = 0
    for i in a1 do
        v1 = v1 + 1
    end
    return v1
end

function u7.keys(a1) -- Line: 225 -- upvalues: u7 (val)
    local v1 = {}
    for i in a1 do
        u7.insert(v1, i)
    end
    return v1
end

function u7.values(a1) -- Line: 234 -- upvalues: u7 (val)
    local v1 = {}
    for i, j in a1 do
        u7.insert(v1, j)
    end
    return v1
end

function u7.random(a1) -- Line: 243
    if #a1 == 0 then
        return nil, nil
    end
    local v1 = (Random.new()):NextInteger(1, #a1)
    return a1[v1], v1
end

function u7.weightedRandom(a1, a2) -- Line: 252 -- upvalues: u7 (val) -- types: a1: table, a2: userdata?
    local weight
    local v1 = 0
    local v2 = {}
    for i, j in a1 do
        weight = j.weight
        u7.insert(v2, {value = j.value, min = v1, max = v1 + weight})
        v1 = v1 + weight
    end
    local v3 = a2 or Random.new()
    local v4 = v3:NextNumber(0, v1)
    v3:NextNumber()
    for k, n in v2 do
        if n.min <= v4 and v4 < n.max then
            return n.value
        end
    end
    return nil
end

function u7.filter(a1, a2) -- Line: 279
    local v1 = {}
    for i, j in a1 do
        if a2(j, i) then
            v1[i] = j
        end
    end
    return v1
end

function u7.filterList(a1, a2) -- Line: 291 -- upvalues: u7 (val)
    local v1 = {}
    for i, j in a1 do
        if a2(j, i) then
            u7.insert(v1, j)
        end
    end
    return v1
end

function u7.shuffle(a1) -- Line: 303
    local v1, v2, v3
    local v4 = Random.new()
    for i = #a1, 2, -1 do
        v1 = v4:NextInteger(1, i)
        v2 = a1[v1]
        v3 = a1[i]
        a1[i] = v2
        a1[v1] = v3
    end
    return a1
end

function u7.reduce(a1, a2, a3) -- Line: 314
    local v1 = a3
    for k, v in pairs(a1) do
        v1 = a2(v1, v, k)
    end
    return v1
end

return u7