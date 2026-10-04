-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Set
-- Decompile time: 2.20 ms

local __DEV__ = _G.__DEV__
local inspect = require(script.Parent:WaitForChild("inspect"))
local isArray = require((script.Parent:WaitForChild("Array")):WaitForChild("isArray"))
local forEach = require((script.Parent:WaitForChild("Array")):WaitForChild("forEach"))
local fromString = require(((script.Parent:WaitForChild("Array")):WaitForChild("from")):WaitForChild("fromString"))
require(script.Parent.Parent:WaitForChild("es7-types"))
local u59 = {}

function u59.__iter(a1) -- Line: 23
    return next, a1._array
end

function u59.__tostring(a1) -- Line: 26 -- upvalues: inspect (val)
    local v1 = "Set "
    if #a1._array > 0 then
        v1 = v1 .. "(" .. (tostring(#a1._array)) .. ") "
    end
    return v1 .. inspect(a1._array)
end

u59.__index = u59

function u59.new(a1) -- Line: 38 -- upvalues: isArray (val), __DEV__ (val), fromString (val), u59 (val)
    local v1
    local v2 = {}
    if a1 == nil then
        v1 = {}
    else
        local v3 = nil
        if typeof(a1) ~= "table" then
            if typeof(a1) ~= "string" then
                error(("cannot create array from value of type `%s`"):format((typeof(a1))))
            else
                v3 = fromString(a1)
            end
        elseif not isArray(a1) then
            local v4 = getmetatable(a1)
            if not v4 then
                if __DEV__ then
                    error("cannot create array from an object-like table")
                end
            elseif rawget(v4, "__iter") then
                v3 = a1
            elseif __DEV__ then
                error("cannot create array from an object-like table")
            end
        else
            v3 = table.clone(a1)
        end
        if not v3 then
            v1 = {}
        else
            v1 = table.create(#v3)
            for i, j in v3 do
                if not v2[j] then
                    v2[j] = true
                    table.insert(v1, j)
                end
            end
        end
    end
    return (setmetatable({size = #v1, _map = v2, _array = v1}, u59))
end

function u59.add(a1, a2) -- Line: 84
    if not a1._map[a2] then
        a1.size = a1.size + 1
        a1._map[a2] = true
        table.insert(a1._array, a2)
    end
    return a1
end

function u59.clear(a1) -- Line: 94
    a1.size = 0
    table.clear(a1._map)
    table.clear(a1._array)
end

function u59.delete(a1, a2) -- Line: 100
    if not a1._map[a2] then
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

function u59.forEach(a1, a2, a3) -- Line: 116 -- upvalues: forEach (val)
    if typeof(a2) ~= "function" then
        error("callback is not a function")
    end
    forEach(a1._array, function(a1_2) -- Line: 122 -- upvalues: a3 (val), a2 (val), a1 (val)
        if a3 ~= nil then
            a2(a3, a1_2, a1_2, a1)
            return
        end
        a2(a1_2, a1_2, a1)
    end)
end

function u59.has(a1, a2) -- Line: 131
    return a1._map[a2] ~= nil
end

function u59.ipairs(a1) -- Line: 135 -- upvalues: __DEV__ (val)
    if __DEV__ then
        warn(debug.traceback(
            "`for _,_ in mySet:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in mySet do` instead\n",
            2
        ))
    end
    return ipairs(a1._array)
end

return u59