-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-core@3.10.0.jest-core.TestWatcher
-- Decompile time: 0.89 ms

local Object = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Object
local promise = require(script.Parent.Parent:WaitForChild("promise"))
local v1 = {}
local default = require(script.Parent.Parent:WaitForChild("emittery")).default
local v2 = {__index = default}
local u33 = setmetatable({}, v2)
u33.__index = u33

function u33.new(a1) -- Line: 31 -- upvalues: default (val), u33 (val) -- types: a1: table
    local v1 = default.new()
    local v2 = setmetatable(v1, u33)
    local isWatchMode = a1.isWatchMode
    v2.state = {interrupted = false}
    v2._isWatchMode = isWatchMode
    return v2
end

function u33.setState(a1, a2) -- Line: 39 -- upvalues: promise (val), Object (val) -- types: a1: table, a2: table
    return (promise.resolve()):andThen(function() -- Line: 40 -- upvalues: Object (upval), a1 (val), a2 (val)
        Object.assign(a1.state, a2)
        a1:emit("change", a1.state):expect()
    end)
end

function u33.isInterrupted(a1) -- Line: 46
    return a1.state.interrupted
end

function u33.isWatchMode(a1) -- Line: 50
    return a1._isWatchMode
end

v1.default = u33
return v1