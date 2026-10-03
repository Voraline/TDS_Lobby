-- Script path: ReplicatedStorage.Shared.Modules.AliasTable
-- Decompile time: 1.00 ms

local u0 = {}
u0.__index = u0

function u0.new(a1, a2) -- Line: 4 -- upvalues: u0 (val) -- types: a1: table?, a2: userdata?
    local v1 = setmetatable({}, u0)
    v1._probabilities = a1 or {}
    v1._rng = a2 or Random.new()
    v1._sum = 0
    return v1
end

function u0:_refreshSum() -- Line: 15
    local v1 = 0
    for i, v in ipairs(self._probabilities) do
        v1 = v1 + v.probability
    end
    self._sum = v1
end

function u0.Add(a1, a2, a3) -- Line: 23 -- types: a1: table, a3: number
    table.insert(a1._probabilities, {id = a2, probability = a3})
    a1:_refreshSum()
end

function u0.Remove(a1, a2) -- Line: 29
    for i, v in ipairs(a1._probabilities) do
        if v.id == a2 then
            table.remove(a1._probabilities, i)
            break
        end
    end
    a1:_refreshSum()
end

function u0.Update(a1, a2, a3) -- Line: 40 -- types: a1: table, a3: number
    for i, v in ipairs(a1._probabilities) do
        if v.id == a2 then
            a1._probabilities[i].probability = a3
            break
        end
    end
    a1:_refreshSum()
end

function u0.Roll(a1) -- Line: 51
    local v1 = a1._rng:NextNumber(0, a1._sum)
    local v2 = 0
    for i, v in ipairs(a1._probabilities) do
        v2 = v2 + v.probability
        if v1 <= v2 then
            return v.id
        end
    end
end

return u0