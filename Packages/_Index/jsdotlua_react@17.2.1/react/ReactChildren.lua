-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactChildren
-- Decompile time: 4.58 ms

local mapIntoArray
require(script.Parent.Parent:WaitForChild("shared"))
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local ReactSymbols = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local getIteratorFn = ReactSymbols.getIteratorFn
local REACT_ELEMENT_TYPE = ReactSymbols.REACT_ELEMENT_TYPE
local REACT_PORTAL_TYPE = ReactSymbols.REACT_PORTAL_TYPE
local Array = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Array
local ReactElement = require(script.Parent:WaitForChild("ReactElement"))
local isValidElement = ReactElement.isValidElement
local cloneAndReplaceKey = ReactElement.cloneAndReplaceKey

local function escape(a1) -- Line: 43 -- types: a1: string
    return "$" .. string.gsub(string.gsub(a1, "=", "=0"), ":", "=2")
end

local function escapeUserProvidedKey(a1) -- Line: 58 -- types: a1: string
    return a1
end

local function getElementKey(a1, a2) -- Line: 71 -- types: a2: number
    if typeof(a1) == "table" and a1 ~= nil and a1.key ~= nil then
        return "$" .. (string.gsub(string.gsub(tostring(a1.key), "=", "=0"), ":", "=2"))
    end
    return (tostring(a2))
end

function mapIntoArray(a1, a2, a3, a4, a5) -- Line: 84
    -- upvalues: REACT_ELEMENT_TYPE (val), REACT_PORTAL_TYPE (val), Array (val), mapIntoArray (val)
    -- upvalues: isValidElement (val), cloneAndReplaceKey (val), getIteratorFn (val)
    local v1, v2, v3, v4, v5
    local v6 = typeof(a1)
    if v6 == "nil" or v6 == "boolean" or v6 == "userdata" then
        a1 = nil
    end
    local v7 = false
    if a1 == nil or v6 == "string" or v6 == "number" then
        v7 = true
    elseif v6 == "table" then
        v3 = a1["$$typeof"]
        if v3 == REACT_ELEMENT_TYPE or v3 == REACT_PORTAL_TYPE then
            v7 = true
        end
    end
    if v7 then
        v3 = a1
        v4 = a5(v3)
        if a4 ~= "" then
            v5 = a4
        else
            v2 = if typeof(v3) ~= "table" or v3 == nil or v3.key == nil then tostring(1) else "$" .. (string.gsub(string.gsub(tostring(v3.key), "=", "=0"), ":", "=2"))
            v5 = "." .. v2
        end
        if Array.isArray(v4) then
            v1 = ""
            if v5 ~= nil then
                v1 = v5 .. "/"
            end
            mapIntoArray(v4, a2, v1, "", function(a1) -- Line: 133
                return a1
            end)
        elseif v4 ~= nil then
            if isValidElement(v4) then
                local key_2 = v4.key
                v4 = cloneAndReplaceKey(
                    v4,
                    a3 .. (if not key_2 then "" else if not v3 then (tostring(key_2)) .. "/" else if v3.key == key_2 then "" else (tostring(key_2)) .. "/") .. v5
                )
            end
            table.insert(a2, v4)
        end
        return 1
    end
    v5 = 0
    v1 = if a4 ~= "" then a4 .. ":" else "."
    if Array.isArray(a1) then
        v2 = #a1
        for i = 1, v2 do
            v3 = a1[i]
            v5 = v5 + mapIntoArray(
                v3,
                a2,
                a3,
                v1 .. (if typeof(v3) ~= "table" or v3 == nil or v3.key == nil then tostring(i) else "$" .. (string.gsub(string.gsub(tostring(v3.key), "=", "=0"), ":", "=2"))),
                a5
            )
        end
        return v5
    end
    v2 = getIteratorFn(a1)
    if typeof(v2) == "function" then
        local value
        local v8 = v2(a1)
        local v9 = 1
        local v10 = v8.next()
        while not v10.done do
            value = v10.value
            v4 = v1 .. (if typeof(value) ~= "table" or value == nil or value.key == nil then tostring(v9) else "$" .. (string.gsub(string.gsub(tostring(value.key), "=", "=0"), ":", "=2")))
            v9 = v9 + 1
            v5 = v5 + mapIntoArray(value, a2, a3, v4, a5)
            v10 = v8.next()
        end
    end
    return v5
end

local function mapChildren(a1, a2, a3) -- Line: 251 -- upvalues: mapIntoArray (val) -- types: a2: function
    if a1 == nil then
        return nil
    end
    local v1 = {}
    local u5 = 1
    mapIntoArray(a1, v1, "", "", function(a1) -- Line: 261 -- upvalues: a2 (val), u5 (ref)
        local v1 = a2(a1, u5)
        u5 = u5 + 1
        return v1
    end)
    return v1
end

return {
    forEach = function(a1, a2, a3) -- Line: 303 -- upvalues: mapChildren (val) -- types: a2: function
        mapChildren(a1, function(...) -- Line: 308 -- upvalues: a2 (val)
            a2(...)
        end, a3)
    end,
    map = mapChildren,
    count = function(a1) -- Line: 279 -- upvalues: mapChildren (val)
        local u1 = 0
        mapChildren(a1, function() -- Line: 281 -- upvalues: u1 (ref)
            u1 = u1 + 1
        end)
        return u1
    end,
    only = function(a1) -- Line: 343 -- upvalues: invariant (val), isValidElement (val)
        invariant(isValidElement(a1), "React.Children.only expected to receive a single React element child.")
        return a1
    end,
    toArray = function(a1) -- Line: 322 -- upvalues: mapChildren (val)
        return mapChildren(a1, function(a1) -- Line: 323
            return a1
        end) or {}
    end,
}