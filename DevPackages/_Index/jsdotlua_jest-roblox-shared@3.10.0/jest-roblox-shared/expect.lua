-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-roblox-shared@3.10.0.jest-roblox-shared.expect
-- Decompile time: 8.94 ms

local eq, getObjectSubset, iterableEquality
local getType = require(script.Parent.Parent:WaitForChild("jest-get-type")).getType
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local toJSBoolean = v1.Boolean.toJSBoolean
local Array = v1.Array
local Object = v1.Object

local function hasKey(a1, a2) -- Line: 24 -- types: a2: string
    return rawget(a1, a2) ~= nil
end

local function hasDefinedKey(a1, a2) -- Line: 29 -- types: a2: string
    return rawget(a1, a2) ~= nil
end

local function keys(a1, a2) -- Line: 34 -- types: a1: table, a2: function
    local v1 = {}
    for k in pairs(a1) do
        if a1[k] ~= nil then
            table.insert(v1, k)
        end
    end
    return v1
end

local function isAsymmetric(a1) -- Line: 57 -- upvalues: toJSBoolean (val), getType (val)
    if toJSBoolean(a1) and typeof(a1) == "table" then
        local success, result = pcall(function() -- Line: 59 -- upvalues: a1 (val)
            return a1.asymmetricMatch
        end)
        if success and getType(result) == "function" then
            return true
        end
    end
    return false
end

local function asymmetricMatch(a1, a2) -- Line: 70 -- upvalues: isAsymmetric (val)
    local v1 = isAsymmetric(a1)
    local v2 = isAsymmetric(a2)
    if v1 and v2 then
        return nil
    end
    if v1 then
        return a1:asymmetricMatch(a2)
    end
    if v2 then
        return a2:asymmetricMatch(a1)
    end
    return nil
end

function eq(a1, a2, a3, a4, a5, a6) -- Line: 92
    -- upvalues: isAsymmetric (val), Object (val), getType (val), Array (val), keys (val), eq (val)
    local v1
    local v2 = true
    local v3 = isAsymmetric(a1)
    local v4 = isAsymmetric(a2)
    local v5 = if not v3 then if not v3 then if not v4 then nil else a2:asymmetricMatch(a1) else a1:asymmetricMatch(a2) else if not v4 then if not v3 then if not v4 then nil else a2:asymmetricMatch(a1) else a1:asymmetricMatch(a2) else nil
    if v5 ~= nil then
        return v5
    end
    for i, v in ipairs(a5) do
        v1 = v(a1, a2)
        if v1 ~= nil then
            return v1
        end
    end
    if Object.is(a1, a2) then
        return true
    end
    v3 = getType(a1)
    if v3 ~= getType(a2) then
        return false
    end
    if (Array.isArray(a1)) ~= Array.isArray(a2) then
        return false
    end
    if v3 ~= "boolean" and v3 ~= "string" and v3 ~= "number" and v3 ~= "userdata" then
        if v3 == "DateTime" then
            return a1 == a2
        end
        if v3 == "regexp" then
            return (tostring(a1)) == tostring(a2)
        end
        if typeof(a1) == "table" and typeof(a2) == "table" then
            local v6
            v4 = #a3
            while v4 > 0 do
                if a3[v4] == a1 then
                    return a4[v4] == a2
                end
                if a4[v4] == a2 then
                    return false
                end
                v4 = v4 - 1
            end
            table.insert(a3, a1)
            table.insert(a4, a2)
            if Array.isArray(a1) and #a1 ~= #a2 then
                return false
            end
            local v7 = keys(a1, a6)
            local v8 = #v7
            if #keys(a2, a6) ~= v8 then
                return false
            end
            while v8 > 0 do
                v6 = v7[v8]
                v2 = rawget(a2, v6) ~= nil and eq(a1[v6], a2[v6], a3, a4, a5, a6)
                if not v2 then
                    return false
                end
                v8 = v8 - 1
            end
            table.remove(a3)
            table.remove(a4)
            return v2
        end
        return false
    end
    return Object.is(a1, a2)
end

local function equals(a1, a2, a3, a4) -- Line: 211
    -- upvalues: eq (val), hasKey (val), hasDefinedKey (val)
    return eq(a1, a2, {}, {}, a3 or {}, (a4 or false) and hasKey or hasDefinedKey)
end

local function isObject(a1) -- Line: 232 -- upvalues: getType (val)
    local v1 = false
    if a1 ~= nil then
        v1 = getType(a1) == "table"
    end
    return v1
end

function iterableEquality(a1, a2, a3, a4) -- Line: 242 -- upvalues: getType (val), iterableEquality (val), equals (val)
    local u5 = a3
    if not u5 then
        u5 = {}
    end
    local u8 = a4
    if not u8 then
        u8 = {}
    end
    if getType(a1) == "set" and getType(a2) == "set" then
        local v1 = #u5
        while v1 > 0 do
            if u5[v1] == a1 then
                return u8[v1] == a2
            end
            v1 = v1 - 1
        end
        table.insert(u5, a1)
        table.insert(u8, a2)

        local function iterableEqualityWithStack(a1, a2) -- Line: 273
            -- upvalues: iterableEquality (upval), u5 (val), u8 (val)
            return iterableEquality(a1, a2, {(unpack(u5))}, {(unpack(u8))})
        end

        if a1.size ~= nil then
            if a1.size ~= a2.size then
                return false
            end
            local v2 = getType(a1) == "set"
            if v2 then
                local v3
                v2 = true
                local v4 = a2
                for i, j in a1:ipairs() do
                    if not v4:has(j) then
                        v3 = false
                        for k, n in v4:ipairs() do
                            if equals(j, n, {iterableEqualityWithStack}) == true then
                                v3 = true
                            end
                        end
                        if not v3 then
                            v2 = false
                            break
                        end
                    end
                end
                table.remove(u5)
                table.remove(u8)
                return v2
            end
        end
        return nil
    end
    return nil
end

local function subsetEquality(a1, a2) -- Line: 313
    -- upvalues: getType (val), Array (val), Object (val), equals (val), iterableEquality (val), toJSBoolean (val)
    local subsetEqualityWithContext

    function subsetEqualityWithContext(a1) -- Line: 317
        -- upvalues: getType (upval), Array (upval), Object (upval), equals (upval), iterableEquality (upval)
        -- upvalues: toJSBoolean (upval), subsetEqualityWithContext (val)
        local u2 = a1
        if not u2 then
            u2 = {}
        end
        return function(a1, a2) -- Line: 320
            -- upvalues: getType (upval), Array (upval), Object (upval), u2 (val), equals (upval)
            -- upvalues: iterableEquality (upval), toJSBoolean (upval), subsetEqualityWithContext (upval)
            local v1 = false
            if a2 ~= nil then
                v1 = getType(a2) == "table"
            end
            if v1 then
                v1 = true
                if next(a2) ~= nil then
                    v1 = not Array.isArray(a2)
                end
            end
            if not v1 then
                return nil
            end
            return Array.every(Object.keys(a2), function(a1_2) -- Line: 325
                -- upvalues: a2 (val), getType (upval), Array (upval), u2 (upval), equals (upval), a1 (val)
                -- upvalues: iterableEquality (upval), toJSBoolean (upval), subsetEqualityWithContext (upval)
                local v1 = a2[a1_2]
                local v2 = false
                if v1 ~= nil then
                    v2 = getType(v1) == "table"
                end
                if v2 then
                    v2 = true
                    if next(v1) ~= nil then
                        v2 = not Array.isArray(v1)
                    end
                end
                if v2 then
                    if u2[a2[a1_2]] then
                        return equals(a1[a1_2], a2[a1_2], {iterableEquality})
                    end
                    u2[a2[a1_2]] = true
                end
                v2 = false
                if a1 ~= nil then
                    v1 = a1
                    v2 = (if toJSBoolean(v1) and not (typeof(v1) ~= "table") then v1[a1_2] ~= nil else false) and equals(a1[a1_2], a2[a1_2], {subsetEqualityWithContext(u2)})
                end
                u2[a2[a1_2]] = nil
                return v2
            end)
        end
    end

    local u3 = {}
    return (function(a1, a2) -- Line: 320
        -- upvalues: getType (upval), Array (upval), Object (upval), u3 (val), equals (upval), iterableEquality (upval)
        -- upvalues: toJSBoolean (upval), subsetEqualityWithContext (val)
        local v1 = false
        if a2 ~= nil then
            v1 = getType(a2) == "table"
        end
        if v1 then
            v1 = true
            if next(a2) ~= nil then
                v1 = not Array.isArray(a2)
            end
        end
        if not v1 then
            return nil
        end
        return Array.every(Object.keys(a2), function(a1_2) -- Line: 325
            -- upvalues: a2 (val), getType (upval), Array (upval), u3 (upval), equals (upval), a1 (val)
            -- upvalues: iterableEquality (upval), toJSBoolean (upval), subsetEqualityWithContext (upval)
            local v1 = a2[a1_2]
            local v2 = false
            if v1 ~= nil then
                v2 = getType(v1) == "table"
            end
            if v2 then
                v2 = true
                if next(v1) ~= nil then
                    v2 = not Array.isArray(v1)
                end
            end
            if v2 then
                if u3[a2[a1_2]] then
                    return equals(a1[a1_2], a2[a1_2], {iterableEquality})
                end
                u3[a2[a1_2]] = true
            end
            v2 = false
            if a1 ~= nil then
                v1 = a1
                v2 = (if toJSBoolean(v1) and not (typeof(v1) ~= "table") then v1[a1_2] ~= nil else false) and equals(a1[a1_2], a2[a1_2], {subsetEqualityWithContext(u3)})
            end
            u3[a2[a1_2]] = nil
            return v2
        end)
    end)(
        a1,
        a2
    )
end

function getObjectSubset(a1, a2, a3) -- Line: 369
    -- upvalues: Array (val), getObjectSubset (val), getType (val), equals (val), iterableEquality (val)
    -- upvalues: subsetEquality (val), Object (val), toJSBoolean (val)
    local v1
    local v2 = if not a3 then {} else a3
    if Array.isArray(a1) then
        if Array.isArray(a2) and #a2 == #a1 then
            v1 = {}
            for i2, i3 in ipairs(a2) do
                table.insert(v1, (getObjectSubset(a1[i2], i3)))
            end
            return v1
        end
        return a1
    end
    if getType(a1) == "DateTime" then
        return a1
    end
    v1 = false
    if a1 ~= nil then
        v1 = getType(a1) == "table"
    end
    if v1 then
        v1 = false
        if a2 ~= nil then
            v1 = getType(a2) == "table"
        end
        if v1 then
            if equals(a1, a2, {iterableEquality, subsetEquality}) then
                return a2
            end
            v1 = {}
            v2[a1] = v1
            for i, v in ipairs(Array.filter(Object.keys(a1), function(a1) -- Line: 393 -- upvalues: a2 (val), toJSBoolean (upval)
                local v1, v2, v3
                v2 = a2
                v3 = not toJSBoolean(v2)
                if not v3 then
                    if typeof(v2) ~= "table" then
                        v3 = true
                    else
                        v3 = false
                    end
                end
                if not v3 then
                    if v2[a1] ~= nil then
                        v1 = true
                    else
                        v1 = false
                    end
                    return v1
                else
                    return false
                end
            end)) do
                if v2[a1[v]] == nil then
                    v1[v] = (getObjectSubset(a1[v], a2[v], v2))
                else
                    v1[v] = v2[a1[v]]
                end
            end
            if #Object.keys(v1) > 0 then
                return v1
            end
        end
    end
    return a1
end

return {
    equals = equals,
    isA = function(a1, a2) -- Line: 52 -- upvalues: getType (val) -- types: a1: string
        return getType(a2) == a1
    end,
    isAsymmetric = isAsymmetric,
    getObjectSubset = getObjectSubset,
    iterableEquality = iterableEquality,
    subsetEquality = subsetEquality,
    isObjectWithKeys = function(a1) -- Line: 237 -- upvalues: getType (val), Array (val)
        local v1 = false
        if a1 ~= nil then
            v1 = getType(a1) == "table"
        end
        if v1 then
            v1 = true
            if next(a1) ~= nil then
                v1 = not Array.isArray(a1)
            end
        end
        return v1
    end,
    hasPropertyInObject = function(a1, a2) -- Line: 218 -- upvalues: toJSBoolean (val) -- types: a2: string
        if not toJSBoolean(a1) or typeof(a1) ~= "table" then
            return false
        end
        return a1[a2] ~= nil
    end,
}