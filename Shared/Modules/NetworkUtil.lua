-- Script path: ReplicatedStorage.Shared.Modules.NetworkUtil
-- Decompile time: 1.23 ms

local v1 = {}
local u1 = {}

local function getQueue(a1, a2) -- Line: 5 -- upvalues: u1 (val) -- types: a1: string, a2: string
    if not u1[a1] then
        u1[a1] = {}
    end
    local v1 = u1[a1][a2]
    if not v1 then
        u1[a1][a2] = {head = 1, tail = 0, items = {}}
    end
    return v1
end

function v1.batch(a1, a2, ...) -- Line: 23 -- upvalues: getQueue (val) -- types: a1: string, a2: string
    local v1 = getQueue(a1, a2)
    v1.tail = v1.tail + 1
    v1.items[v1.tail] = {...}
end

function v1.count(a1, a2) -- Line: 31 -- upvalues: u1 (val) -- types: a1: string, a2: string
    local v1 = u1[a1] and u1[a1][a2]
    if not v1 then
        return 0
    end
    local v2 = v1.tail - v1.head + 1
    if v2 > 0 then
        return v2
    end
    return 0
end

function v1.flush(a1, a2, a3) -- Line: 41 -- upvalues: u1 (val) -- types: a1: string, a2: string, a3: number?
    local v1
    local v2 = u1[a1] and u1[a1][a2]
    if not v2 then
        return
    end
    local v3 = v2.tail - v2.head + 1
    if v3 <= 0 then
        return
    end
    local v4 = if not a3 then v3 else math.min(a3, v3)
    local v5 = {}
    local v6 = v2.head + v4 - 1
    for i = v2.head, v6 do
        v1 = i - v2.head + 1
        v5[v1] = v2.items[i]
        v2.items[i] = nil
    end
    if not (v2.tail <= v6) then
        v2.head = v6 + 1
        return v5
    end
    local v7 = u1[a1]
    v7[a2] = nil
    return v5
end

return v1