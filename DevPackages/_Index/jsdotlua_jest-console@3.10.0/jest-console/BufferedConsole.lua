-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-console@3.10.0.jest-console.BufferedConsole
-- Decompile time: 4.25 ms

local v1 = {}
local v2 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v2.Array
local Boolean = v2.Boolean
local String = v2.String
local Error = v2.Error
local inspect = v2.util.inspect
local default = require(script.Parent:WaitForChild("Console")).default
local helpers = require(script.Parent:WaitForChild("helpers"))
local format = helpers.format
local formatWithOptions = helpers.formatWithOptions
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
local v3 = require(script.Parent.Parent:WaitForChild("jest-util"))
local ErrorWithStack = v3.ErrorWithStack
local formatTime = v3.formatTime
require(script.Parent:WaitForChild("types"))
require(script.Parent.Parent:WaitForChild("jest-roblox-shared"))
local invariant = nil
local v4 = {__index = default}
local u76 = setmetatable({}, v4)
u76.__index = u76

function u76.new() -- Line: 84 -- upvalues: default (val), u76 (val)
    local v1 = default.new({
        write = function(a1, a2) -- Line: 87 -- upvalues: u76 (upval)
            u76.write(a1._buffer, "log", a2, nil)
            return true
        end,
    })
    local v2 = u76
    local v3 = setmetatable(v1, v2)
    v3._buffer = {}
    v3._counters = {}
    v3._timers = {}
    v3._groupDepth = 0
    v3.Console = default
    return v3
end

function u76.write(a1, a2, a3, a4) -- Line: 103
    -- upvalues: ErrorWithStack (val), u76 (val), invariant (ref), Array (val), String (val), Boolean (val)
    local stack = ErrorWithStack.new(nil, u76.write).stack
    invariant(stack, "always have a stack trace")
    table.insert(a1, {
        message = a3,
        origin = Array.join(Array.filter(Array.slice(String.split(stack, "\n"), if a4 == nil then 2 else a4), Boolean.toJSBoolean), "\n"),
        type = a2,
    })
    return a1
end

function u76:_log(a2, a3) -- Line: 115 -- upvalues: u76 (val)
    u76.write(self._buffer, a2, (("  "):rep(self._groupDepth)) .. a3, 3)
end

function u76.assert(a1, a2, a3) -- Line: 119
    xpcall(function() -- Line: 120 -- upvalues: a2 (val)
        assert(a2)
    end, function(a1_2) -- Line: 122 -- upvalues: a3 (val), a1 (val)
        local v1 = ""
        if a3 ~= nil then
            v1 = " " .. tostring(a3)
        end
        a1:_log("assert", (tostring(a1_2)) .. v1)
    end)
end

function u76.count(a1, a2) -- Line: 132 -- upvalues: format (val) -- types: a2: string?
    local v1 = if a2 == nil then "default" else a2
    if a1._counters[v1] == nil then
        a1._counters[v1] = 0
    end
    local _counters_2 = a1._counters
    _counters_2[v1] = _counters_2[v1] + 1
    a1:_log("count", (format("%s: %s", v1, a1._counters[v1])))
end

function u76.countReset(a1, a2) -- Line: 141 -- types: a2: string?
    local v1 = if a2 == nil then "default" else a2
    a1._counters[v1] = 0
end

function u76.debug(a1, a2, ...) -- Line: 146 -- upvalues: format (val)
    a1:_log("debug", (format(a2, ...)))
end

function u76.dir(a1, a2, a3) -- Line: 150 -- upvalues: inspect (val), formatWithOptions (val)
    local v1 = a3 or {}
    a1:_log("dir", (formatWithOptions(v1, (inspect(a2, v1)))))
end

function u76.dirxml(a1, a2, ...) -- Line: 156 -- upvalues: format (val)
    a1:_log("dirxml", (format(a2, ...)))
end

function u76.error(a1, a2, ...) -- Line: 160 -- upvalues: format (val)
    a1:_log("error", (format(a2, ...)))
end

function u76.group(a1, a2, ...) -- Line: 164 -- upvalues: Boolean (val), chalk (val), format (val) -- types: a2: string?
    local v1 = {...}
    a1._groupDepth = a1._groupDepth + 1
    if Boolean.toJSBoolean(a2) then
        a1:_log("group", (chalk.bold((format(a2, ...)))))
    elseif #v1 > 0 then
        a1:_log("group", (chalk.bold((format(a2, ...)))))
    end
end

function u76.groupCollapsed(a1, a2, ...) -- Line: 172
    -- upvalues: Boolean (val), chalk (val), format (val)
    local v1 = {...}
    a1._groupDepth = a1._groupDepth + 1
    if Boolean.toJSBoolean(a2) then
        a1:_log("groupCollapsed", (chalk.bold((format(a2, ...)))))
    elseif #v1 > 0 then
        a1:_log("groupCollapsed", (chalk.bold((format(a2, ...)))))
    end
end

function u76.groupEnd(a1) -- Line: 180
    if 0 < a1._groupDepth then
        a1._groupDepth = a1._groupDepth - 1
    end
end

function u76.info(a1, a2, ...) -- Line: 186 -- upvalues: format (val)
    a1:_log("info", (format(a2, ...)))
end

function u76.log(a1, a2, ...) -- Line: 190 -- upvalues: format (val)
    a1:_log("log", (format(a2, ...)))
end

function u76.time(a1, a2) -- Line: 194 -- upvalues: Boolean (val) -- types: a2: string?
    local v1
    if Boolean.toJSBoolean(a1._timers[if a2 == nil then "default" else a2]) then
        return
    end
    a1._timers[v1] = (DateTime.now())
end

function u76.timeEnd(a1, a2) -- Line: 202
    -- upvalues: Boolean (val), format (val), formatTime (val)
    local v1 = a1._timers[if a2 == nil then "default" else a2]
    if Boolean.toJSBoolean(v1) then
        local v2
        a1:_log("time", (format("%s: %s", v2, (formatTime((DateTime.now()).UnixTimestampMillis - v1.UnixTimestampMillis)))))
        a1._timers[v2] = nil
    end
end

function u76.timeLog(a1, a2, ...) -- Line: 213
    -- upvalues: Boolean (val), format (val), formatTime (val)
    local v1 = a1._timers[if a2 == nil then "default" else a2]
    if Boolean.toJSBoolean(v1) then
        local v2
        a1:_log("time", (format("%s: %s", v2, formatTime((DateTime.now()).UnixTimestampMillis - v1.UnixTimestampMillis), ...)))
    end
end

function u76.warn(a1, a2, ...) -- Line: 223 -- upvalues: format (val)
    a1:_log("warn", (format(a2, ...)))
end

function u76.getBuffer(a1) -- Line: 227
    if #a1._buffer > 0 then
        return a1._buffer
    end
    return nil
end

function invariant(a1, a2) -- Line: 231 -- upvalues: Boolean (val), Error (val) -- types: a2: string?
    if not Boolean.toJSBoolean(a1) then
        error(Error.new(a2))
    end
end

v1.default = u76
return v1