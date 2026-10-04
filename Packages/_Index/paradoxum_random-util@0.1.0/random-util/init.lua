-- Script path: ReplicatedStorage.Packages._Index.paradoxum_random-util@0.1.0.random-util
-- Decompile time: 1.58 ms

local CustomRandom = require(script.CustomRandom)
local u5 = Random.new()
local v1 = {}

local function resolveRandom(a1) -- Line: 14 -- upvalues: u5 (val)
    return a1 or u5
end

function v1.new(a1, a2) -- Line: 18 -- upvalues: CustomRandom (val) -- types: a1: number, a2: number?
    return CustomRandom.new(a1, a2)
end

function v1.choice(a1, a2) -- Line: 22 -- upvalues: u5 (val) -- types: a1: table
    if #a1 == 0 then
        error("cannot choose from an empty array", 2)
    end
    return a1[(a2 or u5):NextInteger(1, #a1)]
end

function v1.weightedChoice(a1, a2) -- Line: 30 -- upvalues: u5 (val) -- types: a1: table
    local v1, v2, weight
    if #a1 == 0 then
        error("cannot choose from an empty weighted array", 2)
    end
    local v3 = 0
    local v4 = #a1
    local v5 = a1
    for i = 1, v4 do
        v1 = v5[i]
        if type(v1) ~= "table" then
            error(("weighted entry at index %* must be a table"):format(i), 2)
        end
        if v1.value == nil then
            error(("weighted entry at index %* must include a non-nil value"):format(i), 2)
        end
        weight = v1.weight
        if type(weight) ~= "number" then
            error(("weight at index %* must be a number"):format(i), 2)
        end
        if weight ~= weight or weight == (1 / 0) or weight == (-1 / 0) then
            error(("weight at index %* must be finite"):format(i), 2)
        end
        if weight < 0 then
            error(("weight at index %* cannot be negative"):format(i), 2)
        end
        v3 = v3 + weight
        if v3 == (1 / 0) then
            error("weighted array total weight must be finite", 2)
        end
    end
    if v3 == 0 then
        error("weighted array must have a positive total weight", 2)
    end
    v4 = (v6 or u5):NextNumber(0, v3)
    local v7 = 0
    local value = nil
    v1 = #v5
    for j = 1, v1 do
        v2 = v5[j]
        if 0 < v2.weight then
            value = v2.value
            v7 = v7 + v2.weight
            if v4 < v7 then
                return v2.value
            end
        end
    end
    return value
end

function v1.shuffle(a1, a2) -- Line: 84 -- upvalues: u5 (val) -- types: a1: table
    local v1 = table.clone(a1)
    ;(a2 or u5):Shuffle(v1)
    return v1
end

v1.CustomRandom = CustomRandom
return table.freeze(v1)