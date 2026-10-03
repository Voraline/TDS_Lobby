-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-roblox-shared@3.10.0.jest-roblox-shared.RobloxInstance
-- Decompile time: 4.23 ms

local RobloxApiDump = require(script.Parent:WaitForChild("RobloxApiDump"))
local getType = require(script.Parent.Parent:WaitForChild("jest-get-type")).getType
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Object = v1.Object
local expect = require(script.Parent:WaitForChild("expect"))
local equals = expect.equals
local isObjectWithKeys = expect.isObjectWithKeys
local hasPropertyInObject = expect.hasPropertyInObject
local isAsymmetric = expect.isAsymmetric
local u41 = {}

local function readPropUnsafe(a1, a2) -- Line: 33 -- types: a1: userdata, a2: string
    return a1[a2]
end

local function writePropUnsafe(a1, a2, a3) -- Line: 38 -- types: a1: userdata, a2: string
    a1[a2] = a3
end

function u41.readProp(a1, a2) -- Line: 42 -- upvalues: readPropUnsafe (val) -- types: a1: userdata, a2: string
    return pcall(readPropUnsafe, a1, a2)
end

function u41.writeProp(a1, a2, a3) -- Line: 46 -- upvalues: writePropUnsafe (val) -- types: a1: userdata, a2: string
    return pcall(writePropUnsafe, a1, a2, a3)
end

local function listPropsUnsafe(a1) -- Line: 51 -- upvalues: RobloxApiDump (val) -- types: a1: string
    local v1 = {}
    local v2 = RobloxApiDump[a1]
    while v2 ~= nil do
        for i, v in ipairs(v2.Properties) do
            v1[v] = true
        end
        v2 = RobloxApiDump[v2.Superclass]
    end
    return v1
end

function u41.listProps(a1, a2) -- Line: 63
    -- upvalues: listPropsUnsafe (val), u41 (val), Object (val)
    local None_2, v1, v2
    local v3 = listPropsUnsafe(a1.ClassName)
    local v4 = nil
    local v5 = nil
    local v6, v7 = a2, a1
    for i in v3, v4, v5 do
        v1, v2 = u41.readProp(v7, i)
        if not v1 then
            v3[i] = nil
        else
            None_2 = if v2 ~= nil then v2 else Object.None
            v3[i] = None_2
        end
    end
    if v6 then
        local None
        v4 = nil
        v5 = nil
        for j in v3, v4, v5 do
            v1 = v7[j]
            None = if v1 ~= nil then v1 else Object.None
            v3[j] = None
        end
    end
    return v3
end

local u48 = {}

function u41.listDefaultProps(a1) -- Line: 88 -- upvalues: u48 (val), u41 (val) -- types: a1: string
    local v1 = u48[a1]
    if v1 ~= nil then
        return v1
    end
    local success, result = pcall(Instance.new, a1)
    if not success then
        error("Class type is abstract or not creatable - cannot list defaults")
    end
    local v2 = u41.listProps(result)
    result:Destroy()
    u48[a1] = v2
    return v2
end

function u41.instanceSubsetEquality(a1, a2) -- Line: 110
    -- upvalues: getType (val), isObjectWithKeys (val), Array (val), Object (val), u41 (val), equals (val)
    local subsetEqualityWithContext

    function subsetEqualityWithContext(a1) -- Line: 111
        -- upvalues: getType (upval), isObjectWithKeys (upval), Array (upval), Object (upval), u41 (upval)
        -- upvalues: equals (upval), subsetEqualityWithContext (val)
        return function(a1_2, a2) -- Line: 112
            -- upvalues: a1 (ref), getType (upval), isObjectWithKeys (upval), Array (upval), Object (upval), u41 (upval)
            -- upvalues: equals (upval), subsetEqualityWithContext (upval)
            a1 = a1 or {}
            if getType(a1_2) == "Instance" and isObjectWithKeys(a2) then
                return Array.every(Object.keys(a2), function(a1_3) -- Line: 119
                    -- upvalues: a2 (val), isObjectWithKeys (upval), a1 (upval), u41 (upval), a1_2 (val), equals (upval)
                    -- upvalues: subsetEqualityWithContext (upval)
                    local v1 = a2[a1_3]
                    if isObjectWithKeys(v1) then
                        if a1[v1] then
                            return false
                        end
                        a1[v1] = true
                    end
                    local v2, v3 = u41.readProp(a1_2, a1_3)
                    local v4 = v2 and equals(v3, v1, {subsetEqualityWithContext(a1)})
                    a1[v1] = nil
                    return v4
                end)
            end
            return nil
        end
    end

    local u3 = nil

    local function v1(a1, a2) -- Line: 112
        -- upvalues: u3 (ref), getType (upval), isObjectWithKeys (upval), Array (upval), Object (upval), u41 (upval)
        -- upvalues: equals (upval), subsetEqualityWithContext (val)
        u3 = u3 or {}
        if getType(a1) == "Instance" and isObjectWithKeys(a2) then
            return Array.every(Object.keys(a2), function(a1_2) -- Line: 119
                -- upvalues: a2 (val), isObjectWithKeys (upval), u3 (upval), u41 (upval), a1 (val), equals (upval)
                -- upvalues: subsetEqualityWithContext (upval)
                local v1 = a2[a1_2]
                if isObjectWithKeys(v1) then
                    if u3[v1] then
                        return false
                    end
                    u3[v1] = true
                end
                local v2, v3 = u41.readProp(a1, a1_2)
                local v4 = v2 and equals(v3, v1, {subsetEqualityWithContext(u3)})
                u3[v1] = nil
                return v4
            end)
        end
        return nil
    end

    if v1 then
        return v1(a1, a2)
    end
    return v1
end

local u51 = {}
u41.InstanceSubset = u51
u51.__index = u51

function u51.new(a1, a2) -- Line: 152 -- upvalues: u51 (val)
    table.sort(a2)
    local v1 = {ClassName = a1, subset = a2}
    setmetatable(v1, u51)
    return v1
end

function u41.getInstanceSubset(a1, a2, a3) -- Line: 166
    -- upvalues: equals (val), isAsymmetric (val), u41 (val), u51 (val)
    local v1 = a3 or {}
    local v2 = {}
    v1[a1] = v2
    if equals(a1, a2) then
        return a2, a2
    end
    if typeof(a2) == "table" and not isAsymmetric(a2) then
        local v3, v4, v5, v6
        local v7 = {}
        for k, v in pairs(a2) do
            if typeof(v) ~= "table" then
                v7[k] = v
            end
        end
        for k2, i in pairs(a2) do
            v3, v4 = u41.readProp(a1, k2)
            if v3 then
                if v1[v4] == nil then
                    v7[k2] = {}
                    v5, v6 = u41.getInstanceSubset(v4, i, v1)
                    v2[k2] = v5
                    v7[k2] = v6
                else
                    error("Circular reference passed into .toMatchInstance(subset)")
                end
            end
        end
        local ClassName = a1.ClassName
        if typeof(a2) == "table" and rawget(a2, "ClassName") then
            ClassName = rawget(a2, "ClassName")
        end
        return (u51.new(a1.ClassName, v2)), (u51.new(ClassName, v7))
    end
    return a1, a2
end

return u41