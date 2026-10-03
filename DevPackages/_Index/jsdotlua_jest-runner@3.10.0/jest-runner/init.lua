-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-runner@3.10.0.jest-runner
-- Decompile time: 3.35 ms

local v1 = require(script.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Error = v1.Error
local Map = v1.Map
local console = v1.console
local promise = require(script.Parent:WaitForChild("promise"))
local CoreScriptSyncService = require(script.Parent:WaitForChild("jest-roblox-shared")).getDataModelService("CoreScriptSyncService")
local v2 = {}
local default = (require((script.Parent:WaitForChild("emittery")))).default
local default_2 = (require((script.Parent:WaitForChild("throat")))).default
require(script.Parent:WaitForChild("jest-test-result"))
require(script.Parent:WaitForChild("jest-types"))
local deepCyclicCopy = require(script.Parent:WaitForChild("jest-util")).deepCyclicCopy
local default_3 = require(script:WaitForChild("runTest")).default
require(script:WaitForChild("types"))
local u92 = nil
local u93 = {}
u93.__index = u93

function u93.new(a1, a2) -- Line: 142 -- upvalues: u93 (val), default (val), Boolean (val), Map (val)
    local v1 = setmetatable({}, u93)
    v1.eventEmitter = default.new()
    v1.__PRIVATE_UNSTABLE_API_supportsEventEmitters__ = true
    v1._globalConfig = a1
    v1._context = Boolean.toJSBoolean(a2) and a2 or {}
    v1._loadedModuleFns = Map.new()
    return v1
end

function u93.runTests(a1, a2, a3, a4, a5, a6, a7) -- Line: 154 -- upvalues: promise (val), Boolean (val)
    return (promise.resolve()):andThen(function() -- Line: 162
        -- upvalues: Boolean (upval), a7 (val), a1 (val), a2 (val), a3 (val), a4 (val), a5 (val), a6 (val)
        if Boolean.toJSBoolean(a7.serial) then
            return (a1:_createInBandTestRun(a2, a3, a4, a5, a6):expect())
        end
        return (a1:_createParallelTestRun(a2, a3, a4, a5, a6):expect())
    end)
end

function u93._createInBandTestRun(a1, a2, a3, a4, a5, a6) -- Line: 170
    -- upvalues: promise (val), default_2 (val), Array (val), CoreScriptSyncService (val), u92 (ref), default_3 (val)
    -- upvalues: deepCyclicCopy (val)
    return (promise.resolve()):andThen(function() -- Line: 177
        -- upvalues: default_2 (upval), Array (upval), a2 (val), CoreScriptSyncService (upval), promise (upval)
        -- upvalues: a3 (val), u92 (upval), a4 (val), default_3 (upval), a1 (val), deepCyclicCopy (upval), a5 (val)
        -- upvalues: a6 (val)
        local u2 = default_2(1)
        return Array.reduce(a2, function(a1_2, a2) -- Line: 181
            -- upvalues: CoreScriptSyncService (upval), u2 (val), promise (upval), a3 (upval), u92 (upval), a4 (upval)
            -- upvalues: default_3 (upval), a1 (upval), deepCyclicCopy (upval), a5 (upval), a6 (upval)
            if CoreScriptSyncService then
                a2.path = CoreScriptSyncService:GetScriptFilePath(a2.script)
            end
            return u2(function() -- Line: 185
                -- upvalues: a1_2 (val), promise (upval), a3 (upval), u92 (upval), a4 (upval), a2 (val)
                -- upvalues: default_3 (upval), a1 (upval), deepCyclicCopy (upval), a5 (upval), a6 (upval)
                return (((a1_2:andThen(function() -- Line: 188
                    -- upvalues: promise (upval), a3 (upval), u92 (upval), a4 (upval), a2 (upval), default_3 (upval)
                    -- upvalues: a1 (upval), deepCyclicCopy (upval)
                    return (promise.resolve()):andThen(function() -- Line: 189
                        -- upvalues: a3 (upval), u92 (upval), a4 (upval), a2 (upval), default_3 (upval), a1 (upval)
                        -- upvalues: deepCyclicCopy (upval)
                        if a3:isInterrupted() then
                            error(u92.new())
                        end
                        if a4 ~= nil then
                            a4(a2):expect()
                            return default_3(a2.script, a1._globalConfig, a2.context.config, nil, a1._context, nil, a1._loadedModuleFns)
                        end
                        a1.eventEmitter:emit("test-file-start", {a2}):expect()
                        return default_3(a2.script, a1._globalConfig, a2.context.config, nil, a1._context, function(a1_2, a2) -- Line: 215 -- upvalues: a1 (upval), deepCyclicCopy (upval) -- types: a1_2: string
                            return a1.eventEmitter:emit(a1_2, (deepCyclicCopy(a2, {keepPrototype = false})))
                        end, a1._loadedModuleFns)
                    end)
                end)):andThen(function(a1_2) -- Line: 240 -- upvalues: a5 (upval), a2 (upval), a1 (upval)
                    if a5 ~= nil then
                        return a5(a2, a1_2)
                    end
                    return a1.eventEmitter:emit("test-file-success", {a2, a1_2})
                end)):catch(function(a1_2) -- Line: 247 -- upvalues: a6 (upval), a2 (upval), a1 (upval)
                    if a6 ~= nil then
                        return a6(a2, a1_2)
                    end
                    return a1.eventEmitter:emit("test-file-failure", {a2, a1_2})
                end))
            end)
        end, promise.resolve())
    end)
end

function u93._createParallelTestRun(a1, a2, a3, a4, a5, a6) -- Line: 260 -- upvalues: promise (val), console (val)
    return (promise.resolve()):andThen(function() -- Line: 267 -- upvalues: console (upval), a1 (val), a2 (val), a3 (val), a4 (val), a5 (val), a6 (val)
        console.warn("Parallel tests run not implemented yet\nRunning tests in band instead")
        return a1:_createInBandTestRun(a2, a3, a4, a5, a6)
    end)
end

function u93:on(a2, a3) -- Line: 402
    return self.eventEmitter:on(a2, a3)
end

function u93.cleanup(a1) -- Line: 415
    a1._loadedModuleFns:forEach(function(a1) -- Line: 416
        local v1 = a1[3]
        if v1 ~= nil then
            v1()
        end
    end)
end

v2.default = u93
local v3 = {__index = Error}
u92 = setmetatable({}, v3)
u92.__index = u92

function u92.new(a1) -- Line: 430 -- upvalues: Error (val), u92 (ref) -- types: a1: string?
    local v1 = Error.new(a1)
    local v2 = u92
    local v3 = setmetatable(v1, v2)
    v3.name = "CancelRun"
    return v3
end

return v2