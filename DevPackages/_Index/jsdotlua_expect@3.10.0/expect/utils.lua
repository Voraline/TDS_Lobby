-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_expect@3.10.0.expect.utils
-- Decompile time: 6.97 ms

local getPath
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Error = v1.Error
local instanceof = v1.instanceof
local Object = v1.Object
local u21 = require(script.Parent.Parent:WaitForChild("luau-regexp"))
local v2 = require(script.Parent.Parent:WaitForChild("jest-roblox-shared"))
local equals = (require((script.Parent:WaitForChild("jasmineUtils")))).equals
local pathAsArray = nil

function getPath(a1, a2) -- Line: 40 -- upvalues: Array (val), pathAsArray (ref), getPath (val) -- types: a1: table
    if not Array.isArray(a2) then
        a2 = pathAsArray(a2)
    end
    if not (#a2 > 0) then
        return {traversedPath = {}, value = a1}
    end
    local v1 = #a2 == 1
    local u17 = a2[1]
    local success, result = pcall(function() -- Line: 51 -- upvalues: a1 (val), u17 (val)
        return a1[u17]
    end)
    if not success then
        return {hasEndProp = false, lastTraversedObject = a1, traversedPath = {}}
    end
    if not v1 and result == nil then
        return {hasEndProp = false, lastTraversedObject = a1, traversedPath = {}}
    end
    local v2 = getPath(result, Array.slice(a2, 2))
    if v2.lastTraversedObject == nil then
        v2.lastTraversedObject = a1
    end
    table.insert(v2.traversedPath, 1, u17)
    if v1 then
        v2.hasEndProp = result ~= nil
        if not v2.hasEndProp then
            Array.shift(v2.traversedPath)
        end
    end
    return v2
end

local getObjectSubset = v2.expect.getObjectSubset
local iterableEquality = v2.expect.iterableEquality
local subsetEquality = v2.expect.subsetEquality

local function typeEquality(a1, a2) -- Line: 115
    if a1 ~= nil and a2 ~= nil then
        if (typeof(a1)) ~= typeof(a2) then
            return false
        end
        if not getmetatable(a1) and not getmetatable(a2) then
            return nil
        end
        if getmetatable(a1)
            and getmetatable(a2)
            and getmetatable(a1).__index
            and getmetatable(a2).__index
            and getmetatable(a1).__index == getmetatable(a2).__index then
            return nil
        end
        return false
    end
    return nil
end

function pathAsArray(a1) -- Line: 201 -- upvalues: u21 (val) -- types: a1: string
    local v1, v2, v3, v4
    local v5 = u21("[^.[\\]]+|(?=(?:\\.)(?:\\.|$))")
    local v6 = {}
    if a1:sub(1, 1) == "." then
        table.insert(v6, "")
    end
    local v7 = 0
    local v8 = a1
    local v9 = v5:exec(v8)
    local v10 = a1
    while v9 ~= nil do
        if not (v7 < #v10) then
            break
        end
        v2 = v9[1]
        v3 = v9.index + #v2
        v4 = v7 + v9.index
        if v10:sub(v4 - 1, v4 - 1) ~= "[" then
            table.insert(v6, v2)
        else
            v1 = tonumber(v2, 10)
            if not v1 then
                table.insert(v6, v2)
            else
                table.insert(v6, v1)
            end
        end
        v7 = v7 + v3
        v8 = v8:sub(v3 + 1)
        v9 = v5:exec(v8)
    end
    return v6
end

return {
    getPath = getPath,
    getObjectSubset = getObjectSubset,
    iterableEquality = iterableEquality,
    subsetEquality = subsetEquality,
    typeEquality = typeEquality,
    sparseArrayEquality = function(a1, a2) -- Line: 175 -- upvalues: Array (val), Object (val), equals (val), typeEquality (val)
        if Array.isArray(a1) and Array.isArray(a2) then
            local v1 = Object.keys(a1)
            local v2 = Object.keys(a2)
            return equals(a1, a2, {typeEquality}, true) and equals(v1, v2)
        end
        return nil
    end,
    partition = function(a1, a2) -- Line: 191 -- types: a2: function
        local v1 = {{}, {}}
        for i, v in ipairs(a1) do
            table.insert(v1[if not a2(v) then 2 else 1], v)
        end
        return v1
    end,
    pathAsArray = pathAsArray,
    isError = function(a1) -- Line: 250 -- upvalues: instanceof (val), Error (val)
        return instanceof(a1, Error)
    end,
    emptyObject = function(a1) -- Line: 255 -- upvalues: Object (val)
        local v1
        if typeof(a1) ~= "table" then
            v1 = false
        else
            v1 = true
            if #Object.keys(a1) ~= 0 then
                v1 = false
            end
        end
        return v1
    end,
    isOneline = function(a1, a2) -- Line: 261
        local v1 = false
        if typeof(a1) == "string" then
            v1 = false
            if typeof(a2) == "string" then
                v1 = not a2:match("[\r\n]") or not a1:match("[\r\n]")
            end
        end
        return v1
    end,
}