-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-runtime@3.10.0.jest-runtime
-- Decompile time: 21.57 ms

local v1 = require(script.Parent:WaitForChild("luau-polyfill"))
local Boolean = v1.Boolean
local Error = v1.Error
local Map = v1.Map
local Object = v1.Object
require(script.Parent:WaitForChild("jest-types"))
local ModuleMocker = (require((script.Parent:WaitForChild("jest-mock")))).ModuleMocker
local u36 = require(script.Parent:WaitForChild("jest-mock-genv"))
local GlobalMocker = u36.GlobalMocker
require(script:WaitForChild("types"))
require(script:WaitForChild("_types"))
require(script.Parent:WaitForChild("expect"))
local u67 = require(script.Parent:WaitForChild("jest-fake-timers"))
local u68 = {}
u68.__index = u68

function u68.new(a1, a2) -- Line: 638
    -- upvalues: u68 (val), u67 (val), Map (val), ModuleMocker (val), GlobalMocker (val), u36 (val)
    local v1 = setmetatable({}, u68)
    v1.isTornDown = false
    v1._config = a1
    v1._environment = {fakeTimersModern = u67.new()}
    v1._explicitShouldMock = Map.new()
    v1._explicitShouldMockModule = Map.new()
    v1._internalModuleRegistry = Map.new()
    v1._mockFactories = Map.new()
    v1._mockRegistry = Map.new()
    v1._loadedModuleFns = a2
    v1._moduleMocker = ModuleMocker.new(a1)
    v1._globalMocker = GlobalMocker.new(u36.MOCKABLE_GLOBALS)
    v1._moduleMocker:mockGlobals(v1._globalMocker, (getfenv(0)))
    v1._isolatedModuleRegistry = nil
    v1._isolatedMockRegistry = nil
    v1._moduleRegistry = Map.new()
    v1._shouldAutoMock = false
    v1._shouldMockModuleCache = Map.new()
    v1._fakeTimersImplementation = v1._environment.fakeTimersModern
    v1._jestObject = v1:_createJestObjectFor(script)
    v1._cleanupFns = {}
    return v1
end

function u68:requireModule(a2, a3, a4, a5, a6) -- Line: 1135
    -- upvalues: 
    local u7 = if a3 ~= nil then a3 else a2
    if string.find(u7.Name, ".global$") then
        return require(u7)
    end
    local _internalModuleRegistry = if not (if typeof(a4) ~= "table" then false else if a4.isInternalModule == nil then false else a4.isInternalModule) then if self._isolatedModuleRegistry == nil then self._moduleRegistry else self._isolatedModuleRegistry else self._internalModuleRegistry
    local v1 = _internalModuleRegistry:get(u7)
    if v1 then
        return v1.exports
    end
    local u41 = {loaded = false, exports = {}, filename = u7, id = u7}
    _internalModuleRegistry:set(u7, u41)
    local success, result = pcall(function() -- Line: 1258
        -- upvalues: self (val), u41 (val), a2 (val), u7 (val), u7 (val), a4 (val), _internalModuleRegistry (ref)
        -- upvalues: a6 (val)
        self:_loadModule(u41, a2, u7, u7, a4, _internalModuleRegistry, a6)
    end)
    if not success then
        _internalModuleRegistry:delete(u7)
        error(result)
    end
    return u41.exports
end

function u68:requireInternalModule(a2, a3) -- Line: 1270 -- types: self: table, a2: userdata, a3: userdata?
    return self:requireModule(a2, a3, {isInternalModule = true})
end

function u68:requireActual(a2, a3) -- Line: 1298 -- types: self: table, a2: userdata, a3: userdata
    return self:requireModule(a2, a3, nil, true)
end

function u68:requireMock(a2, a3) -- Line: 1305 -- types: self: table, a2: userdata, a3: userdata
    if self._isolatedMockRegistry ~= nil and self._isolatedMockRegistry:has(a3) then
        return (self._isolatedMockRegistry:get(a3))
    end
    if self._mockRegistry:has(a3) then
        return (self._mockRegistry:get(a3))
    end
    local _isolatedMockRegistry = self._isolatedMockRegistry or self._mockRegistry
    if not self._mockFactories:has(a3) then
        error("manual mocks not implemented yet")
        return
    end
    local v1 = self._mockFactories:get(a3)()
    _isolatedMockRegistry:set(a3, v1)
    return v1
end

function u68:_loadModule(a2, a3, a4, a5, a6, a7, a8) -- Line: 1385
    -- upvalues: Boolean (val)
    self:_execModule(a2, a6, a7, if not Boolean.toJSBoolean(a4) then nil else a3, a8)
    a2.loaded = true
end

function u68:requireModuleOrMock(a2) -- Line: 1426 -- upvalues: Object (val) -- types: self: table, a2: userdata
    if a2 == script then
        return require(a2)
    end
    if typeof(script.Parent) == "ModuleScript" and a2 == script.Parent then
        return require(a2)
    end
    if string.find(a2.Name, ".global$") then
        return require(a2)
    end
    if a2.Name ~= "JestGlobals" and a2.Name ~= "jest-globals" then
        local success, result = pcall(function() -- Line: 1490 -- upvalues: self (val), a2 (val), a2 (val)
            if self:_shouldMock(a2, a2, self._explicitShouldMock, {}) then
                return self:requireMock(a2, a2)
            end
            return self:requireModule(a2, a2)
        end)
        if not success then
            error(result)
        end
        return result
    end
    return (Object.assign({}, self:getGlobalsFromEnvironment(), {jest = self._jestObject}))
end

function u68:isolateModules(a2) -- Line: 1507 -- upvalues: Error (val), Map (val) -- types: self: table, a2: function
    if self._isolatedModuleRegistry ~= nil or self._isolatedMockRegistry ~= nil then
        error(Error.new("isolateModules cannot be nested inside another isolateModules."))
    end
    self._isolatedModuleRegistry = Map.new()
    self._isolatedMockRegistry = Map.new()
    local success, result = pcall(function() -- Line: 1526 -- upvalues: a2 (val)
        a2()
    end)
    if self._isolatedModuleRegistry then
        self._isolatedModuleRegistry:clear()
    end
    if self._isolatedMockRegistry then
        self._isolatedMockRegistry:clear()
    end
    self._isolatedModuleRegistry = nil
    self._isolatedMockRegistry = nil
    if not success then
        error(result)
    end
end

function u68:resetModules() -- Line: 1563
    if self._isolatedModuleRegistry then
        self._isolatedModuleRegistry:clear()
    end
    if self._isolatedMockRegistry then
        self._isolatedMockRegistry:clear()
    end
    self._isolatedModuleRegistry = nil
    self._isolatedMockRegistry = nil
    self._mockRegistry:clear()
    self._moduleRegistry:clear()
end

function u68:setMock(a2, a3, a4, a5) -- Line: 1662
    -- upvalues: Boolean (val)
    local toJSBoolean = Boolean.toJSBoolean
    if toJSBoolean(if typeof(a5) ~= "table" then nil else a5.virtual) then
        error("virtual mocks not supported")
    end
    self._explicitShouldMock:set(a3, true)
    self._mockFactories:set(a3, a4)
end

function u68:restoreAllMocks() -- Line: 1702
    self._moduleMocker:restoreAllMocks()
end

function u68:resetAllMocks() -- Line: 1705
    self._moduleMocker:resetAllMocks()
end

function u68:clearAllMocks() -- Line: 1708
    self._moduleMocker:clearAllMocks()
end

function u68.teardown(a1) -- Line: 1711
    a1._moduleMocker:unmockGlobals(a1._globalMocker)
    a1:restoreAllMocks()
    a1:resetAllMocks()
    a1:resetModules()
    a1._internalModuleRegistry:clear()
    a1._mockFactories:clear()
    a1._shouldMockModuleCache:clear()
    a1._explicitShouldMock:clear()
    a1._explicitShouldMockModule:clear()
    for i, v in ipairs(a1._cleanupFns) do
        v()
    end
    a1.isTornDown = true
end

function u68:_execModule(a2, a3, a4, a5, a6) -- Line: 1836
    -- upvalues: Error (val), Object (val)
    local setupAutomocks, v1, v2, v3, v4, v5
    local v6 = nil
    local v7 = nil
    local filename = a2.filename
    local v8 = pcall(debug.loadmodule, Instance.new("ModuleScript"))
    if not self._loadedModuleFns or not self._loadedModuleFns:has(filename) then
        if not v8 then
            v4 = loadstring(filename.Source, filename:GetFullName())
        else
            v1, v2, v3 = debug.loadmodule(filename)
            v4 = v1
            v6 = v2
            v7 = v3
        end
        if v4 == nil then
            error(Error.new(v6))
        end
        v5 = getfenv(v4)
        if self._loadedModuleFns then
            self._loadedModuleFns:set(filename, {v4, v5, v7})
        elseif v7 ~= nil then
            table.insert(self._cleanupFns, v7)
        end
    else
        local v9 = self._loadedModuleFns:get(filename)
        v4 = v9[1]
        v5 = v9[2]
    end
    local isInternalModule = if a3 == nil then false else if not a3.isInternalModule then false else a3.isInternalModule
    v2 = {
        script = if not v8 then filename else v5.script,
        require = if not isInternalModule then function(a1) -- Line: 2007 -- upvalues: self (val)
            if typeof(a1) == "string" then
                error("Require-by-string is not enabled for use inside Jest at this time.")
            end
            return self:requireModuleOrMock(a1)
        end else function(a1) -- Line: 1999 -- upvalues: self (val)
            if typeof(a1) == "string" then
                error("Require-by-string is not enabled for use inside Jest at this time.")
            end
            return self:requireInternalModule(a1)
        end,
    }
    v3 = {__index = v5}
    v1 = setmetatable(v2, v3)
    if not isInternalModule then
        Object.assign(v1, {
            delay = self._fakeTimersImplementation.delayOverride,
            tick = self._fakeTimersImplementation.tickOverride,
            time = self._fakeTimersImplementation.timeOverride,
            DateTime = self._fakeTimersImplementation.dateTimeOverride,
            os = self._fakeTimersImplementation.osOverride,
            task = self._fakeTimersImplementation.taskOverride,
        })
    end
    local v10 = {__index = v1}
    v2 = setmetatable({}, v10)

    function setupAutomocks(a1, a2, a3) -- Line: 2034 -- upvalues: Error (upval), setupAutomocks (val)
        local v1, v2, v3
        for i, j in a1 do
            if not j._isGlobalAutomockFn then
                v2 = a2[i]
                v1 = {__index = v2}
                v3 = setmetatable({}, v1)
                a3[i] = v3
                setupAutomocks(j, v2, v3)
            else
                v2 = a2[i]

                a3[i] = function(...) -- Line: 2041 -- upvalues: j (val), Error (upval)
                    if j._maybeMock == nil then
                        error(Error.new("Code should not be running when globalEnv is uninitialised"))
                    end
                    return j._maybeMock(...)
                end
            end
        end
    end

    setupAutomocks(self._globalMocker.automocks, v1, v2)
    setfenv(v4, v2)
    v10 = table.pack(v4())
    if v10.n ~= 1 and a6 ~= true then
        error(string.format(
            "[Module Error]: %s did not return a valid result\n\tModuleScripts must return exactly one value",
            (tostring(filename))
        ))
    end
    a2.exports = v10[1]
end

function u68:_shouldMock(a2, a3, a4, a5) -- Line: 2283 -- types: self: table, a2: userdata, a3: userdata
    if a4:has(a3) then
        return (a4:get(a3))
    end
    if not self._shouldAutoMock then
        return false
    end
    if self._shouldMockModuleCache:has(a3) then
        return (self._shouldMockModuleCache:get(a3))
    end
    return true
end

function u68:_createJestObjectFor(a2) -- Line: 2430 -- upvalues: Error (val) -- types: self: table, a2: userdata
    local setMockFactory = nil
    local u3 = nil

    local function unmock(a1) -- Line: 2447 -- upvalues: self (val), u3 (ref) -- types: a1: userdata
        self._explicitShouldMock:set(a1, false)
        return u3
    end

    local function mock(a1, a2, a3) -- Line: 2469
        -- upvalues: setMockFactory (ref), self (val), u3 (ref)
        if a2 ~= nil then
            return setMockFactory(a1, a2, a3)
        end
        self._explicitShouldMock:set(a1, true)
        return u3
    end

    function setMockFactory(a1, a2_2, a3) -- Line: 2483
        -- upvalues: self (val), a2 (val), u3 (ref)
        self:setMock(a2, a1, a2_2, a3)
        return u3
    end

    local function _getFakeTimers() -- Line: 2510 -- upvalues: self (val)
        return self._fakeTimersImplementation
    end

    u3 = {
        advanceTimersByTime = function(a1) -- Line: 2598 -- upvalues: _getFakeTimers (val) -- types: a1: number
            return _getFakeTimers():advanceTimersByTime(a1)
        end,
        advanceTimersToNextTimer = function(a1) -- Line: 2601 -- upvalues: _getFakeTimers (val) -- types: a1: number?
            return _getFakeTimers():advanceTimersToNextTimer(a1)
        end,
        getEngineFrameTime = function() -- Line: 2605 -- upvalues: _getFakeTimers (val)
            return _getFakeTimers():getEngineFrameTime()
        end,
        setEngineFrameTime = function(a1) -- Line: 2608 -- upvalues: _getFakeTimers (val) -- types: a1: number
            return _getFakeTimers():setEngineFrameTime(a1)
        end,
        clearAllMocks = function() -- Line: 2498 -- upvalues: self (val), u3 (ref)
            self:clearAllMocks()
            return u3
        end,
        clearAllTimers = function() -- Line: 2617 -- upvalues: _getFakeTimers (val)
            return _getFakeTimers():clearAllTimers()
        end,
        doMock = mock,
        dontMock = unmock,
        fn = function(...) -- Line: 2560 -- upvalues: self (val)
            return self._moduleMocker:fn(...)
        end,
        getRealSystemTime = function() -- Line: 2638 -- upvalues: _getFakeTimers (val), self (val), Error (upval)
            local v1 = _getFakeTimers()
            if v1 == self._environment.fakeTimersModern then
                return v1:getRealSystemTime()
            end
            error(Error.new("getRealSystemTime is not available when not using modern timers"))
        end,
        getTimerCount = function() -- Line: 2646 -- upvalues: _getFakeTimers (val)
            return _getFakeTimers():getTimerCount()
        end,
        globalEnv = self._globalMocker.envObject,
        isMockFunction = self._moduleMocker.isMockFunction,
        isolateModules = function(a1) -- Line: 2555 -- upvalues: self (val), u3 (ref) -- types: a1: function
            self:isolateModules(a1)
            return u3
        end,
        mock = mock,
        requireActual = function(a1) -- Line: 2659 -- upvalues: self (val), a2 (val)
            if typeof(a1) == "string" then
                error("Require-by-string is not enabled for use inside Jest at this time.")
            end
            return self:requireActual(a2, a1)
        end,
        resetAllMocks = function() -- Line: 2502 -- upvalues: self (val), u3 (ref)
            self:resetAllMocks()
            return u3
        end,
        resetModules = function() -- Line: 2551 -- upvalues: self (val), u3 (ref)
            self:resetModules()
            return u3
        end,
        restoreAllMocks = function() -- Line: 2506 -- upvalues: self (val), u3 (ref)
            self:restoreAllMocks()
            return u3
        end,
        runAllTicks = function() -- Line: 2685 -- upvalues: _getFakeTimers (val)
            return _getFakeTimers():runAllTicks()
        end,
        runAllTimers = function() -- Line: 2688 -- upvalues: _getFakeTimers (val)
            return _getFakeTimers():runAllTimers()
        end,
        runOnlyPendingTimers = function() -- Line: 2691 -- upvalues: _getFakeTimers (val)
            return _getFakeTimers():runOnlyPendingTimers()
        end,
        jestTimers = _getFakeTimers(),
        setMock = function(a1, a2) -- Line: 2699 -- upvalues: setMockFactory (ref) -- types: a1: userdata
            return setMockFactory(a1, function() -- Line: 2701 -- upvalues: a2 (val)
                return a2
            end)
        end,
        setSystemTime = function(a1) -- Line: 2705 -- upvalues: _getFakeTimers (val), self (val), Error (upval)
            local v1 = _getFakeTimers()
            if v1 == self._environment.fakeTimersModern then
                v1:setSystemTime(a1)
                return
            end
            error(Error.new("setSystemTime is not available when not using modern timers"))
        end,
        spyOn = function(...) -- Line: 2563 -- upvalues: self (val)
            return self._moduleMocker:spyOn(...)
        end,
        unmock = unmock,
        useFakeTimers = function() -- Line: 2533 -- upvalues: self (val), u3 (ref)
            self._fakeTimersImplementation:useFakeTimers()
            return u3
        end,
        useRealTimers = function() -- Line: 2547 -- upvalues: _getFakeTimers (val), u3 (ref)
            _getFakeTimers():useRealTimers()
            return u3
        end,
    }
    return u3
end

function u68:getGlobalsFromEnvironment() -- Line: 2819
    if self.jestGlobals then
        return table.clone(self.jestGlobals)
    end
    local v1 = require(script.Parent:WaitForChild("jest-snapshot"))
    local expect = require(script.Parent:WaitForChild("expect"))
    return {
        expect = expect,
        expectExtended = expect,
        jestSnapshot = {
            toMatchSnapshot = v1.toMatchSnapshot,
            toThrowErrorMatchingSnapshot = v1.toThrowErrorMatchingSnapshot,
        },
    }
end

function u68.setGlobalsForRuntime(a1, a2) -- Line: 2876 -- types: a1: table, a2: table
    a1.jestGlobals = a2
end

return u68