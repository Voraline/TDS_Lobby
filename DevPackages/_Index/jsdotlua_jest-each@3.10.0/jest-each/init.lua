-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-each@3.10.0.jest-each
-- Decompile time: 4.36 ms

local v1 = require(script.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Error = v1.Error
local Object = v1.Object
local nilPlaceholder = require(script:WaitForChild("nilPlaceholder"))
local v2 = {}
require(script.Parent:WaitForChild("jest-types"))
local default = require(script:WaitForChild("bind")).default

local function install(a1, a2, ...) -- Line: 35 -- upvalues: Array (val), Boolean (val), Error (val), default (val)
    local u9
    if not (0 < (select("#", ...))) then
        u9 = {}
    else
        u9 = {}
        u9[1] = ...
    end
    local v1 = #u9 == 0
    local v2 = Array.isArray(a2) and Boolean.toJSBoolean(a2.raw)
    if not v1 and not v2 then
        error(Error.new("`.each` must only be called with an Array or Tagged Template Literal."))
    end
    local v3 = {
        __call = function(a1_2, a2_2, a3, a4) -- Line: 48
            -- upvalues: default (upval), a1 (val), a2 (val), u9 (val)
            return default(a1.test)(a2, table.unpack(u9))(a2_2, a3, a4)
        end,
    }
    local v4 = setmetatable({}, v3)
    v4.skip = default(if not a1.test then nil else a1.test.skip)(a2, table.unpack(u9))
    v4.only = default(if not a1.test then nil else a1.test.only)(a2, table.unpack(u9))
    local v5 = {
        __call = function(a1_2, a2_2, a3, a4) -- Line: 68
            -- upvalues: default (upval), a1 (val), a2 (val), u9 (val)
            return default(a1.it)(a2, table.unpack(u9))(a2_2, a3, a4)
        end,
    }
    local v6 = setmetatable({}, v5)
    v6.skip = default(if not a1.it then nil else a1.it.skip)(a2, table.unpack(u9))
    v6.only = default(if not a1.it then nil else a1.it.only)(a2, table.unpack(u9))
    v3 = default(a1.xit)(a2, table.unpack(u9))
    v5 = default(a1.fit)(a2, table.unpack(u9))
    local v7 = default(a1.xtest)(a2, table.unpack(u9))
    local v8 = {
        __call = function(a1_2, a2_2, a3, a4) -- Line: 84
            -- upvalues: default (upval), a1 (val), a2 (val), u9 (val)
            return default(a1.describe, false)(a2, table.unpack(u9))(a2_2, a3, a4)
        end,
    }
    local v9 = setmetatable({}, v8)
    v9.skip = default(if not a1.describe then nil else a1.describe.skip, false)(a2, table.unpack(u9))
    v9.only = default(if not a1.describe then nil else a1.describe.only, false)(a2, table.unpack(u9))
    local v10 = default(a1.fdescribe, false)(a2, table.unpack(u9))
    v8 = default(a1.xdescribe, false)(a2, table.unpack(u9))
    local v11 = default(a1.testSKIP)(a2, table.unpack(u9))
    local v12 = default(a1.testFOCUS)(a2, table.unpack(u9))
    local v13 = default(a1.itSKIP)(a2, table.unpack(u9))
    local v14 = default(a1.itFOCUS)(a2, table.unpack(u9))
    return {
        describe = v9,
        fdescribe = v10,
        fit = v5,
        it = v6,
        test = v4,
        xdescribe = v8,
        xit = v3,
        xtest = v7,
        describeSKIP = default(a1.describeSKIP, false)(a2, table.unpack(u9)),
        describeFOCUS = default(a1.describeFOCUS, false)(a2, table.unpack(u9)),
        itSKIP = v13,
        itFOCUS = v14,
        testSKIP = v11,
        testFOCUS = v12,
    }
end

local function maybeHandleTemplateString(a1) -- Line: 125
    local v1, v2, v3, v4
    if typeof(a1) ~= "string" then
        return a1
    end
    local v5 = {}
    local v6 = {}
    local v7 = 1
    local v8 = 1
    local v9 = false
    local v10 = #a1
    for i = 1, v10 do
        v4 = string.sub(a1, i, i)
        v1 = if not (i < #a1) then nil else string.sub(a1, i + 1, i + 1)
        if i == #a1 then
            if v9 then
                error("expression not closed")
            end
            table.insert(v5, (string.sub(a1, v7)))
        elseif v9 or v4 ~= "$" then
            if v9 and v4 == "}" then
                v2 = string.sub(a1, v7, v8)
                v3 = string.sub(a1, v8 + 3, i - 1)
                table.insert(v5, v2)
                table.insert(v6, v3)
                v7 = i + 1
            end
        elseif v1 == "{" then
            v8 = i - 1
        end
    end
    return (setmetatable(v5, {__index = {raw = a1}}))
end

v2.bind = default

function v2.default(a1) -- Line: 169
    -- upvalues: Array (val), Object (val), install (val), maybeHandleTemplateString (val)
    local u2 = if a1 == nil then {} else a1
    Array.forEach(Object.keys(u2), function(a1) -- Line: 175 -- upvalues: u2 (val)
        local v1
        local u2_2 = u2[a1]
        if typeof(u2_2) ~= "function" then
            v1 = u2_2
        else
            local v2 = {
                __call = function(a1, ...) -- Line: 179 -- upvalues: u2_2 (val)
                    return u2_2(...)
                end,
            }
            v1 = setmetatable({}, v2)
        end
        u2[a1] = v1
    end)
    return (setmetatable({
        withGlobal = function(a1) -- Line: 187 -- upvalues: install (upval), maybeHandleTemplateString (upval)
            return function(a1_2, ...) -- Line: 188 -- upvalues: install (upval), a1 (val), maybeHandleTemplateString (upval)
                return install(a1, maybeHandleTemplateString(a1_2), ...)
            end
        end,
    }, {
        __call = function(a1, a2, ...) -- Line: 193 -- upvalues: install (upval), u2 (val), maybeHandleTemplateString (upval)
            return install(u2, maybeHandleTemplateString(a2), ...)
        end,
    }))
end

v2.NIL = nilPlaceholder
return v2