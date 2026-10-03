-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-console@3.10.0.jest-console.NullConsole
-- Decompile time: 0.59 ms

local v1 = {}
local default = require(script.Parent:WaitForChild("CustomConsole")).default
local v2 = {__index = default}
local u13 = setmetatable({}, v2)
u13.__index = u13

function u13.new(...) -- Line: 33 -- upvalues: default (val), u13 (val)
    return (setmetatable(default.new(...), u13))
end

function u13.assert(a1) end

function u13.debug(a1) end

function u13.dir(a1) end

function u13.error(a1) end

function u13.info(a1) end

function u13.log(a1) end

function u13.time(a1) end

function u13.timeEnd(a1) end

function u13.timeLog(a1) end

function u13.trace(a1) end

function u13.warn(a1) end

function u13.group(a1) end

function u13.groupCollapsed(a1) end

function u13.groupEnd(a1) end

v1.default = u13
return v1