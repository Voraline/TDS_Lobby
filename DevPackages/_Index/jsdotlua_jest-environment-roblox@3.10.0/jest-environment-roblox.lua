-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-environment-roblox@3.10.0.jest-environment-roblox
-- Decompile time: 0.75 ms

local Object = (require((script.Parent:WaitForChild("luau-polyfill")))).Object
local promise = require(script.Parent:WaitForChild("promise"))
require(script.Parent:WaitForChild("jest-environment"))
local u32 = require(script.Parent:WaitForChild("jest-fake-timers"))
require(script.Parent:WaitForChild("jest-types"))
require(script.Parent:WaitForChild("jest-fake-timers"))
require(script.Parent:WaitForChild("jest-mock"))
local u57 = {}
u57.__index = u57

function u57.new(a1) -- Line: 62 -- upvalues: u57 (val), Object (val), u32 (val)
    local v1 = setmetatable({}, u57)
    v1.context = {}
    local v2 = Object.assign(v1.context, a1.testEnvironmentOptions)
    v1.global = v2
    v2.global = v2
    v1.fakeTimers = u32.new()
    return v1
end

function u57.getVmContext(a1) -- Line: 75
    return a1.context
end

function u57.setup(a1) -- Line: 79 -- upvalues: promise (val)
    return promise.resolve()
end

function u57.teardown(a1) -- Line: 83 -- upvalues: promise (val)
    return (promise.resolve()):andThen(function() -- Line: 84 -- upvalues: a1 (val)
        if a1.fakeTimers ~= nil then
            a1.fakeTimers:dispose()
        end
        a1.context = {}
        a1.fakeTimers = nil
    end)
end

return u57