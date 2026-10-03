-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-console@3.10.0.jest-console.Console
-- Decompile time: 0.93 ms

local v1 = {}
local format = require(script.Parent:WaitForChild("helpers")).format
require(script.Parent.Parent:WaitForChild("jest-roblox-shared"))
local u19 = {}
u19.__index = u19

function u19.new(a1, a2, a3) -- Line: 47 -- upvalues: u19 (val) -- types: a3: table?
    local v1 = setmetatable({}, u19)
    local v2 = a3 or {}
    if typeof(a1.write) == "function" then
        v2.stdout = a1
        v2.stderr = a2
    end
    if v2.stderr == nil then
        v2.stderr = v2.stdout
    end
    if v2.stdout == nil or typeof(v2.stdout.write) ~= "function" then
        error("stdout must have a write method")
    end
    if v2.stderr == nil or typeof(v2.stderr.write) ~= "function" then
        error("stderr must have a write method")
    end
    v1._stdout = v2.stdout
    v1._stderr = v2.stderr
    return v1
end

function u19:_write(a2, a3) -- Line: 74 -- types: self: table, a2: string, a3: string
    (if a2 ~= "stdout" then self._stderr else self._stdout):write(a3)
end

function u19.log(a1, ...) -- Line: 79 -- upvalues: format (val)
    a1:_write("stdout", (format(...)))
end

function u19.error(a1, ...) -- Line: 83 -- upvalues: format (val)
    a1:_write("stderr", (format(...)))
end

v1.default = u19
return v1