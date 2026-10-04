-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Map.Map
-- Decompile time: 2.81 ms

local __DEV__ = _G.__DEV__
local forEach = require((script.Parent.Parent:WaitForChild("Array")):WaitForChild("forEach"))
local map = require((script.Parent.Parent:WaitForChild("Array")):WaitForChild("map"))
local isArray = require((script.Parent.Parent:WaitForChild("Array")):WaitForChild("isArray"))
local u50 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local u61 = {}

function u61.new(a1) -- Line: 22 -- upvalues: isArray (val), __DEV__ (val), u50 (val), u61 (val)
    local v1 = nil
    local v2 = nil
    if a1 == nil then
        v1 = {}
        v2 = {}
    elseif isArray(a1) then
        local v3, v4
        if __DEV__ and #a1 > 0 and typeof(a1[1]) ~= "table" then
            error("Value `" .. (typeof(a1[1])) .. "` is not an entry object.\n Cannot create Map from {K, V} form, it must be { {K, V}... }")
        end
        v1 = table.create(#a1)
        v2 = {}
        local v5 = nil
        local v6 = nil
        for i, j in a1, v5, v6 do
            v3 = j[1]
            if __DEV__ and v3 == nil then
                error("cannot create Map from a table that isn't an array.")
            end
            v4 = j[2]
            if v2[v3] == nil then
                table.insert(v1, v3)
            end
            v2[v3] = v4
        end
    elseif not u50(a1, u61) then
        error(("`%s` `%s` is not iterable, cannot make Map using it"):format(typeof(a1), (tostring(a1))))
    else
        v1 = table.clone(a1._array)
        v2 = table.clone(a1._map)
    end
    return (setmetatable({size = #v1, _map = v2, _array = v1}, u61))
end

function u61:set(a2, a3) -- Line: 71
    if self._map[a2] == nil then
        self.size = self.size + 1
        table.insert(self._array, a2)
    end
    self._map[a2] = a3
    return self
end

function u61.get(a1, a2) -- Line: 83
    return a1._map[a2]
end

function u61.clear(a1) -- Line: 87
    local v1 = table
    a1.size = 0
    v1.clear(a1._map)
    v1.clear(a1._array)
end

function u61.delete(a1, a2) -- Line: 94
    if a1._map[a2] == nil then
        return false
    end
    a1.size = a1.size - 1
    a1._map[a2] = nil
    local v1 = table.find(a1._array, a2)
    if v1 then
        table.remove(a1._array, v1)
    end
    return true
end

function u61.forEach(a1, a2, a3) -- Line: 110 -- upvalues: __DEV__ (val), forEach (val)
    if __DEV__ and typeof(a2) ~= "function" then
        error("callback is not a function")
    end
    forEach(a1._array, function(a1_2) -- Line: 117 -- upvalues: a1 (val), a3 (val), a2 (val)
        local v1 = a1._map[a1_2]
        if a3 ~= nil then
            a2(a3, v1, a1_2, a1)
            return
        end
        a2(v1, a1_2, a1)
    end)
end

function u61.has(a1, a2) -- Line: 128
    return a1._map[a2] ~= nil
end

function u61.keys(a1) -- Line: 132
    return a1._array
end

function u61.values(a1) -- Line: 136 -- upvalues: map (val)
    return map(a1._array, function(a1_2) -- Line: 137 -- upvalues: a1 (val)
        return a1._map[a1_2]
    end)
end

function u61:entries() -- Line: 142 -- upvalues: map (val)
    return map(self._array, function(a1) -- Line: 143 -- upvalues: self (val)
        return {a1, self._map[a1]}
    end)
end

function u61.ipairs(a1) -- Line: 148 -- upvalues: __DEV__ (val)
    if __DEV__ then
        warn(debug.traceback(
            "`for _,_ in myMap:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in myMap do` instead\n",
            2
        ))
    end
    return ipairs(a1:entries())
end

function u61.__iter(a1) -- Line: 160
    return next, a1:entries()
end

function u61.__index(a1, a2) -- Line: 164 -- upvalues: u61 (val), __DEV__ (val)
    local v1 = rawget(u61, a2)
    if v1 ~= nil then
        return v1
    end
    if __DEV__ then
        assert(
            rawget(a1, "_map"),
            "Map has been corrupted, and is missing private state! Did you accidentally call table.clear() instead of map:clear()?"
        )
    end
    return u61.get(a1, a2)
end

function u61.__newindex(a1, a2, a3) -- Line: 180
    a1:set(a2, a3)
end

return u61