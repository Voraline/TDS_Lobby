-- Script path: ReplicatedStorage.Shared.Modules.Lightning.PartCache.Table
-- Decompile time: 1.23 ms

local u1 = Random.new()
local u2 = {}
for k, v in pairs(table) do
    u2[k] = v
end

function u2.contains(a1, a2) -- Line: 30 -- upvalues: u2 (val)
    return u2.indexOf(a1, a2) ~= nil
end

function u2.indexOf(a1, a2) -- Line: 35 -- upvalues: u2 (val)
    local v1 = table.find(a1, a2)
    if v1 then
        return v1
    end
    return u2.keyOf(a1, a2)
end

function u2.keyOf(a1, a2) -- Line: 46
    for k, v in pairs(a1) do
        if v == a2 then
            return k
        end
    end
    return nil
end

function u2.skip(a1, a2) -- Line: 56
    return table.move(a1, a2 + 1, #a1, 1, table.create(#a1 - a2))
end

function u2.take(a1, a2) -- Line: 61
    return table.move(a1, 1, a2, 1, table.create(a2))
end

function u2.range(a1, a2, a3) -- Line: 66
    return table.move(a1, a2, a3, 1, table.create(a3 - a2 + 1))
end

function u2.skipAndTake(a1, a2, a3) -- Line: 71
    return table.move(a1, a2 + 1, a2 + a3, 1, table.create(a3))
end

function u2.random(a1) -- Line: 76 -- upvalues: u1 (val)
    return a1[u1:NextInteger(1, #a1)]
end

function u2.join(a1, a2) -- Line: 81
    return table.move(a2, 1, #a2, #a1 + 1, (table.create(#a1 + #a2)))
end

function u2.removeObject(a1, a2) -- Line: 88 -- upvalues: u2 (val)
    local v1 = u2.indexOf(a1, a2)
    if v1 then
        table.remove(a1, v1)
    end
end

function u2.expand(a1, a2) -- Line: 97
    if a2 < 0 then
        error("Cannot expand a table by a negative amount of objects.")
    end
    local v1 = table.create(#a1 + a2)
    local v2 = #a1
    for i = 1, v2 do
        v1[i] = a1[i]
    end
    return v1
end

return u2