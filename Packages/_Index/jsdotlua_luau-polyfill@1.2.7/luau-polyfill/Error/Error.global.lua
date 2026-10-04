-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_luau-polyfill@1.2.7.luau-polyfill.Error.Error.global
-- Decompile time: 1.89 ms

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local u10 = {}
u10.__index = u10

function u10.__tostring(a1) -- Line: 12 -- upvalues: u10 (val)
    return getmetatable(u10).__tostring(a1)
end

local function __createError(a1) -- Line: 18 -- upvalues: u10 (val) -- types: a1: string?
    local v1 = {name = "Error", message = a1 or ""}
    local v2 = setmetatable(v1, u10)
    u10.__captureStackTrace(v2, 4)
    return v2
end

function u10.new(a1) -- Line: 27 -- upvalues: u10 (val) -- types: a1: string?
    local v1 = {name = "Error", message = a1 or ""}
    local v2 = setmetatable(v1, u10)
    u10.__captureStackTrace(v2, 4)
    return v2
end

function u10.captureStackTrace(a1, a2) -- Line: 31 -- upvalues: u10 (val) -- types: a1: table
    u10.__captureStackTrace(a1, 3, a2)
end

function u10.__captureStackTrace(a1, a2, a3) -- Line: 35 -- upvalues: u10 (val) -- types: a1: table, a2: number
    if typeof(a3) ~= "function" then
        a1.__stack = debug.traceback(nil, a2)
    else
        local v1 = debug.traceback(nil, a2)
        local v2 = debug.info(a3, "n")
        local v3 = string.find(v1, string.gsub(debug.info(a3, "s"), "([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1") .. ":%d* function " .. v2)
        local v4 = nil
        if v3 ~= nil then
            local v5, v6 = string.find(v1, "\n", v3 + 1)
            v4 = v6
        end
        if v4 ~= nil then
            v1 = string.sub(v1, v4 + 1)
        end
        a1.__stack = v1
    end
    u10.__recalculateStacktrace(a1)
end

function u10.__recalculateStacktrace(a1) -- Line: 59 -- types: a1: table
    local message = a1.message
    local v1 = (a1.name or "Error") .. (if message == nil then "" else if message == "" then "" else ": " .. message)
    a1.stack = v1 .. "\n" .. (if not a1.__stack then "" else a1.__stack)
end

return (setmetatable(u10, {
    __call = function(a1, ...) -- Line: 71 -- upvalues: u10 (val)
        local v1 = {name = "Error", message = (...) or ""}
        local v2 = setmetatable(v1, u10)
        u10.__captureStackTrace(v2, 4)
        return v2
    end,
    __tostring = function(a1) -- Line: 74
        if a1.name == nil then
            return (tostring("Error"))
        end
        if a1.message and a1.message ~= "" then
            return string.format("%s: %s", tostring(a1.name), (tostring(a1.message)))
        end
        return (tostring(a1.name))
    end,
}))