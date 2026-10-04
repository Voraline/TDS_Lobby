-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.inspect
-- Decompile time: 3.87 ms

local HttpService = game:GetService("HttpService")
local isArray = require((script.Parent:WaitForChild("Array")):WaitForChild("isArray"))
require(script.Parent.Parent:WaitForChild("es7-types"))
local formatValue = nil
local formatObjectValue = nil
local formatArray = nil
local formatObject = nil
local getObjectTag = nil

local function isIndexKey(a1, a2) -- Line: 41
    local v1 = false
    if type(a1) == "number" then
        v1 = false
        if a1 <= a2 then
            v1 = false
            if a1 >= 1 then
                v1 = math.floor(a1) == a1
            end
        end
    end
    return v1
end

local function getTableLength(a1) -- Line: 48
    local v1 = 1
    local v2 = rawget(a1, v1)
    while v2 ~= nil do
        v1 = v1 + 1
        v2 = rawget(a1, v1)
    end
    return v1 - 1
end

local function sortKeysForPrinting(a1, a2) -- Line: 58
    local v1 = type(a1)
    local v2 = type(a2)
    if v1 ~= v2 then
        return v1 < v2
    end
    if v1 ~= "number" and v1 ~= "string" then
        return v1 < v2
    end
    return a1 < a2
end

local function rawpairs(a1) -- Line: 71
    return next, a1, nil
end

local function getFragmentedKeys(a1) -- Line: 75 -- upvalues: sortKeysForPrinting (val)
    local v1
    local v2 = {}
    local v3 = 0
    local v4 = 1
    local v5 = rawget(a1, v4)
    while v5 ~= nil do
        v4 = v4 + 1
        v5 = rawget(a1, v4)
    end
    local v6 = v4 - 1
    v4 = next
    local v7 = nil
    for i, j in v4, a1, v7 do
        v1 = false
        if type(i) == "number" then
            v1 = false
            if i <= v6 then
                v1 = false
                if i >= 1 then
                    v1 = math.floor(i) == i
                end
            end
        end
        if not v1 then
            v3 = v3 + 1
            v2[v3] = i
        end
    end
    table.sort(v2, sortKeysForPrinting)
    return v2, v3, v6
end

function formatValue(a1, a2, a3) -- Line: 89 -- upvalues: HttpService (val), formatObjectValue (ref) -- types: a3: table
    local v1 = typeof(a1)
    if v1 == "string" then
        return HttpService:JSONEncode(a1)
    end
    if v1 == "number" then
        if a1 ~= a1 then
            return "NaN"
        end
        if a1 == (1 / 0) then
            return "Infinity"
        end
        if a1 == (-1 / 0) then
            return "-Infinity"
        end
        return (tostring(a1))
    end
    if v1 ~= "function" then
        if v1 == "table" then
            return formatObjectValue(a1, a2, a3)
        end
        return (tostring(a1))
    end
    local v2 = "[function"
    local v3 = debug.info(a1, "n")
    if v3 ~= nil and v3 ~= "" then
        v2 = v2 .. " " .. v3
    end
    return v2 .. "]"
end

function formatObjectValue(a1, a2, a3) -- Line: 122
    -- upvalues: formatValue (ref), isArray (val), formatArray (ref), formatObject (ref)
    if table.find(a2, a1) ~= nil then
        return "[Circular]"
    end
    local v1 = {unpack(a2)}
    table.insert(v1, a1)
    if typeof(a1.toJSON) ~= "function" then
        if isArray(a1) then
            return formatArray(a1, v1, a3)
        end
        return formatObject(a1, v1, a3)
    end
    local v2 = a1:toJSON(a1)
    if v2 == a1 then
        return formatObject(a1, v1, a3)
    end
    if typeof(v2) == "string" then
        return v2
    end
    return formatValue(v2, v1, a3)
end

function formatObject(a1, a2, a3) -- Line: 147
    -- upvalues: getFragmentedKeys (val), getObjectTag (ref), formatValue (ref)
    local v1
    local v2 = ""
    local v3 = getmetatable(a1)
    if v3 and rawget(v3, "__tostring") then
        return (tostring(a1))
    end
    local v4, v5, v6 = getFragmentedKeys(a1)
    if v6 == 0 and v5 == 0 then
        return v2 .. "{}"
    end
    if a3.depth < #a2 then
        return v2 .. "[" .. (getObjectTag(a1)) .. "]"
    end
    local v7 = {}
    for i = 1, v6 do
        table.insert(v7, (formatValue(a1[i], a2, a3)))
    end
    for j = 1, v5 do
        v1 = v4[j]
        table.insert(v7, v1 .. ": " .. (formatValue(a1[v1], a2, a3)))
    end
    return v2 .. "{ " .. (table.concat(v7, ", ")) .. " }"
end

function formatArray(a1, a2, a3) -- Line: 183 -- upvalues: formatValue (ref) -- types: a3: table
    local v1 = #a1
    if v1 == 0 then
        return "[]"
    end
    if a3.depth < #a2 then
        return "[Array]"
    end
    local v2 = math.min(10, v1)
    local v3 = v1 - v2
    local v4 = {}
    for i = 1, v2 do
        v4[i] = (formatValue(a1[i], a2, a3))
    end
    if v3 == 1 then
        table.insert(v4, "... 1 more item")
    elseif v3 > 1 then
        table.insert(v4, (("... %s more items"):format((tostring(v3)))))
    end
    return "[" .. (table.concat(v4, ", ")) .. "]"
end

function getObjectTag(a1) -- Line: 209
    return "Object"
end

return function(a1, a2) -- Line: 34 -- upvalues: formatValue (ref) -- types: a2: table?
    local v1 = a2 or {depth = 2}
    local v2 = v1.depth or 2
    v1.depth = if not (v2 >= 0) then 2 else v2
    return formatValue(a1, {}, v1)
end