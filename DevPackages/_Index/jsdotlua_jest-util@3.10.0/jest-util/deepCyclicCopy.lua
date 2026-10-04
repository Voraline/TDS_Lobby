-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-util@3.10.0.jest-util.deepCyclicCopy
-- Decompile time: 4.37 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Object = v1.Object
local Set = v1.Set
local WeakMap = v1.WeakMap
local v2 = {}
local deepCyclicCopyObject = nil
local deepCyclicCopyArray = nil
local u18 = Set.new()

local function deepCyclicCopy(a1, a2, a3) -- Line: 29
    -- upvalues: u18 (val), WeakMap (val), Array (val), deepCyclicCopyArray (ref), deepCyclicCopyObject (ref)
    local v1 = a2 or {keepPrototype = false, blacklist = u18}
    local v2 = if not a3 then WeakMap.new() else a3
    if typeof(a1) ~= "table" then
        return a1
    end
    if v2:has(a1) then
        return v2:get(a1)
    end
    if Array.isArray(a1) then
        return (deepCyclicCopyArray(a1, v1, v2))
    end
    return deepCyclicCopyObject(a1, v1, v2)
end

v2.default = deepCyclicCopy

function deepCyclicCopyObject(a1, a2, a3) -- Line: 45
    -- upvalues: Array (val), Object (val), deepCyclicCopy (ref), u18 (val)
    local v1 = {}
    if a2.keepPrototype then
        warn("Prototype copying is not supported")
    end
    local u17 = Array.reduce(Object.keys(a1), function(a1_2, a2) -- Line: 54 -- upvalues: a1 (val)
        a1_2[a2] = {value = a1[a2]}
        return a1_2
    end, {})
    a3:set(a1, v1)
    Array.forEach(Object.keys(u17), function(a1) -- Line: 64 -- upvalues: a2 (val), u17 (val), deepCyclicCopy (upval), u18 (upval), a3 (val)
        if a2.blacklist ~= nil and a2.blacklist:has(a1) then
            u17[a1] = nil
            return
        end
        local v1 = u17[a1]
        if typeof(v1.value) ~= "nil" then
            v1.value = deepCyclicCopy(v1.value, {blacklist = u18, keepPrototype = a2.keepPrototype}, a3)
        end
        v1.configurable = true
    end)
    return Object.assign(v1, Array.reduce(Object.keys(u17), function(a1, a2) -- Line: 81 -- upvalues: u17 (val)
        a1[a2] = u17[a2].value
        return a1
    end, {}))
end

function deepCyclicCopyArray(a1, a2, a3) -- Line: 89 -- upvalues: deepCyclicCopy (ref), u18 (val) -- types: a2: table
    local v1, v2, v3
    local v4 = {}
    if a2.keepPrototype then
        warn("Prototype copying is not supported")
    end
    local v5 = #a1
    a3:set(a1, v4)
    for i = 1, v5 do
        v2 = deepCyclicCopy
        v3 = a1[i]
        v1 = {blacklist = u18, keepPrototype = a2.keepPrototype}
        v4[i] = (v2(v3, v1, a3))
    end
    return v4
end

return v2