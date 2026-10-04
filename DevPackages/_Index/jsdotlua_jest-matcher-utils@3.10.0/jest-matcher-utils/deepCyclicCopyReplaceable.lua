-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-matcher-utils@3.10.0.jest-matcher-utils.deepCyclicCopyReplaceable
-- Decompile time: 1.23 ms

local deepCyclicCopyReplaceable = nil

local function deepCyclicCopyTable(a1, a2) -- Line: 16
    -- upvalues: deepCyclicCopyReplaceable (ref)
    local v1 = {}
    a2[a1] = v1
    for k, v in pairs(a1) do
        v1[k] = (deepCyclicCopyReplaceable(v, a2))
    end
    return v1
end

function deepCyclicCopyReplaceable(a1, a2) -- Line: 28 -- upvalues: deepCyclicCopyTable (ref) -- types: a2: table
    if typeof(a1) ~= "table" then
        return a1
    end
    if a2[a1] then
        return a2[a1]
    end
    local v1 = deepCyclicCopyTable(a1, a2)
    local v2 = getmetatable(a1)
    if v2 and typeof(v2) == "table" then
        setmetatable(v1, v2)
    end
    return v1
end

return function(a1, a2) -- Line: 43 -- upvalues: deepCyclicCopyReplaceable (ref) -- types: a2: table?
    local v1 = a2 or {}
    setmetatable(v1, {_mode = "kv"})
    return deepCyclicCopyReplaceable(a1, v1)
end