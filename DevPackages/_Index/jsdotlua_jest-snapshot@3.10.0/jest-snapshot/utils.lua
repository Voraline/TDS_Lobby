-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-snapshot@3.10.0.jest-snapshot.utils
-- Decompile time: 12.18 ms

local deepMergeArray
local v1 = require(script.Parent.Parent:WaitForChild("jest-roblox-shared"))
local FileSystemService = v1.getDataModelService("FileSystemService")
local v2 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v2.Array
local Error = v2.Error
local Object = v2.Object
local String = v2.String
local v3 = require(script.Parent.Parent:WaitForChild("pretty-format"))
require(script.Parent:WaitForChild("PrettyFormat"))
local format = v3.format
local getSerializers = require(script.Parent:WaitForChild("plugins")).getSerializers
require(script.Parent:WaitForChild("types"))
local normalizeNewLines = nil
local deepMerge = nil

local function writeSnapshotVersion() -- Line: 54
    return "-- Jest Roblox Snapshot v1, http://roblox.github.io/jest-roblox-internal/snapshot-testing"
end

local function isObject(a1) -- Line: 105 -- upvalues: Array (val)
    local v1 = a1
    if v1 then
        v1 = false
        if typeof(a1) == "table" then
            v1 = not Array.isArray(a1)
        end
    end
    return v1
end

local function printBacktickString(a1) -- Line: 215 -- types: a1: string
    return "[=[\n" .. a1 .. "]=]"
end

local ensureDirectoryExists = v1.ensureDirectoryExists

function normalizeNewLines(a1) -- Line: 222 -- types: a1: string
    return (string.gsub(string.gsub(a1, "\r\n", "\n"), "\r", "\n"))
end

local function alphanumsort(a1) -- Line: 230
    local function padnum(a1) -- Line: 231
        return ("%03d%s"):format(string.len(a1), a1)
    end

    table.sort(a1, function(a1, a2) -- Line: 234 -- upvalues: padnum (val)
        return ((tostring(a1)):gsub("%d+", padnum)) < (tostring(a2)):gsub("%d+", padnum)
    end)
    return a1
end

function deepMergeArray(a1, a2) -- Line: 270 -- upvalues: Array (val), deepMergeArray (val), deepMerge (ref)
    local v1, v2
    local v3 = Array.from(a1)
    local v4 = a1
    for i, v in ipairs(a2) do
        v1 = v3[i]
        if not Array.isArray(v4[i]) then
            v2 = v1
            if v2 then
                v2 = false
                if typeof(v1) == "table" then
                    v2 = not Array.isArray(v1)
                end
            end
            if not v2 then
                v3[i] = v
            else
                v3[i] = (deepMerge(v4[i], v))
            end
        else
            v3[i] = (deepMergeArray(v4[i], v))
        end
    end
    return v3
end

function deepMerge(a1, a2) -- Line: 290 -- upvalues: Array (val), Object (val), deepMerge (ref), deepMergeArray (val)
    local v1 = a1
    if v1 then
        v1 = false
        if typeof(a1) == "table" then
            v1 = not Array.isArray(a1)
        end
    end
    if v1 then
        v1 = a2
        if v1 then
            v1 = false
            if typeof(a2) == "table" then
                v1 = not Array.isArray(a2)
            end
        end
        if v1 then
            local assign, assign_2, v2, v3, v4
            v1 = table.clone(a1)
            local v5 = a2
            for k, v in pairs(a2) do
                v4 = v5[k]
                v3 = v4
                if v3 then
                    v3 = false
                    if typeof(v4) == "table" then
                        v3 = not Array.isArray(v4)
                    end
                end
                if not v3 or v5[k]["$$typeof"] then
                    if not Array.isArray(v5[k]) then
                        assign_2 = Object.assign
                        v2 = {}
                        v2[k] = v5[k]
                        assign_2(v1, v2)
                    else
                        v1[k] = (deepMergeArray(v6[k], v5[k]))
                    end
                elseif v6[k] then
                    v1[k] = (deepMerge(v6[k], v5[k]))
                else
                    assign = Object.assign
                    v2 = {}
                    v2[k] = v5[k]
                    assign(v1, v2)
                end
            end
            return v1
        end
    end
    if Array.isArray(a1) and Array.isArray(a2) then
        return (deepMergeArray(a1, a2))
    end
    return a1
end

return {
    testNameToKey = function(a1, a2) -- Line: 109 -- types: a1: string, a2: number
        return a1 .. " " .. a2
    end,
    keyToTestName = function(a1) -- Line: 113 -- upvalues: Error (val) -- types: a1: string
        if not a1:match(" %d+$") then
            error(Error("Snapshot keys must end with a number."))
        end
        return a1:gsub(" %d+$", "")
    end,
    getSnapshotData = function(a1, a2) -- Line: 121 -- types: a1: userdata?, a2: string
        local u2 = {}
        pcall(function() -- Line: 131 -- upvalues: u2 (ref), a1 (val)
            u2 = require(a1)
        end)
        if a2 ~= "all" and a2 == "new" then end
        return {data = u2, dirty = false}
    end,
    addExtraLineBreaks = function(a1) -- Line: 155 -- types: a1: string
        if a1:match("\n") then
            return "\n" .. a1 .. "\n"
        end
        return a1
    end,
    removeExtraLineBreaks = function(a1) -- Line: 166 -- upvalues: String (val) -- types: a1: string
        if 2 < (a1:len()) and String.startsWith(a1, "\n") and String.endsWith(a1, "\n") then
            return a1:sub(2, -2)
        end
        return a1
    end,
    serialize = function(a1, a2, a3) -- Line: 177
        -- upvalues: normalizeNewLines (ref), format (val), Object (val), getSerializers (val)
        return normalizeNewLines(format(a1, Object.assign({
            escapeRegex = true,
            printFunctionName = false,
            indent = a2 or 2,
            plugins = getSerializers(),
        }, a3 or {})))
    end,
    minify = function(a1) -- Line: 191 -- upvalues: format (val), getSerializers (val)
        return format(a1, {escapeRegex = true, min = true, printFunctionName = false, plugins = getSerializers()})
    end,
    deserializeString = function(a1) -- Line: 201 -- types: a1: string
        return (string.gsub(string.gsub(string.sub(a1, 2, -2), "\\\\", "\\"), "\\\"", "\""))
    end,
    escapeBacktickString = function(a1) -- Line: 210 -- types: a1: string
        return a1
    end,
    saveSnapshotFile = function(a1, a2) -- Line: 241
        -- upvalues: Object (val), normalizeNewLines (ref), FileSystemService (val), Error (val)
        -- upvalues: ensureDirectoryExists (val)
        local v1
        local v2 = {
            "-- Jest Roblox Snapshot v1, http://roblox.github.io/jest-roblox-internal/snapshot-testing",
            "local exports = {}",
        }
        local v3 = ipairs
        local v4 = Object.keys(a1)

        local function padnum(a1) -- Line: 231
            return ("%03d%s"):format(string.len(a1), a1)
        end

        table.sort(v4, function(a1, a2) -- Line: 234 -- upvalues: padnum (val)
            return ((tostring(a1)):gsub("%d+", padnum)) < (tostring(a2)):gsub("%d+", padnum)
        end)
        for i, v in v3(v4) do
            v1 = "[=[\n" .. (normalizeNewLines(a1[v])) .. "]=]"
            table.insert(v2, "exports[ [=[" .. v .. "]=] ] = " .. v1 .. "\n")
        end
        table.insert(v2, "return exports")
        if not FileSystemService then
            error(Error("Attempting to save snapshots in an environment where FileSystemService is inaccessible."))
        end
        ensureDirectoryExists(a2)
        FileSystemService:WriteFile(a2, (table.concat(v2, "\n")) .. "\n")
    end,
    deepMerge = deepMerge,
}