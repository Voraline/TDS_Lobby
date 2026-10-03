-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-mock@3.10.0.jest-mock
-- Decompile time: 6.74 ms

local v1 = require(script.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Error = v1.Error
local Set = v1.Set
local Symbol = v1.Symbol
local GlobalMocker = (require((script.Parent:WaitForChild("jest-mock-genv")))).GlobalMocker
require(script.Parent:WaitForChild("jest-types"))
local v2 = {}
local u31 = {}
u31.__index = u31

function u31.new(a1) -- Line: 143 -- upvalues: Set (val), u31 (val)
    local v1 = {
        _invocationCallCounter = 1,
        _projectConfig = a1,
        _mocksOnObjectsMap = setmetatable({}, {__mode = "k"}),
        _mockState = {},
        _mockConfigRegistry = {},
        _spyState = Set.new(),
    }
    setmetatable(v1, u31)
    return v1
end

function u31:_ensureMockConfig(a2) -- Line: 170
    local v1 = self._mockConfigRegistry[a2]
    if not v1 then
        v1 = self:_defaultMockConfig()
        self._mockConfigRegistry[a2] = v1
    end
    return v1
end

function u31:_ensureMockState(a2) -- Line: 181
    local v1 = self._mockState[a2]
    if not v1 then
        v1 = self:_defaultMockState()
        self._mockState[a2] = v1
    end
    if #v1.calls > 0 then
        v1.lastCall = v1.calls[#v1.calls]
    end
    return v1
end

function u31._defaultMockConfig(a1) -- Line: 203
    return {mockName = "jest.fn()", specificMockImpls = {}, specificReturnValues = {}}
end

function u31._defaultMockState(a1) -- Line: 212
    return {
        calls = {},
        contexts = {},
        instances = {},
        invocationCallOrder = {},
        results = {},
    }
end

function u31:_makeComponent(a2, a3) -- Line: 222 -- upvalues: Symbol (val), Array (val)
    if a2.type ~= "function" then
        error("Call to _makeComponent with non-function")
        return
    end

    local function u4(a1, ...) -- Line: 226 -- upvalues: self (val), Symbol (upval), Array (upval)
        local v1 = {...}
        local v2 = self:_ensureMockState(a1)
        local u71 = self:_ensureMockConfig(a1)
        table.insert(v2.instances, a1)
        table.insert(v2.contexts, v1[1])
        for i = 1, (select("#", ...)) do
            if v1[i] == nil then
                v1[i] = (Symbol.for_("$$nil"))
            end
        end
        table.insert(v2.calls, v1)
        local v3 = {type = "incomplete"}
        table.insert(v2.results, v3)
        table.insert(v2.invocationCallOrder, self._invocationCallCounter)
        self._invocationCallCounter = self._invocationCallCounter + 1
        local v4 = pcall
        local v5 = {...}
        local success, result = v4(function(a1) -- Line: 265 -- upvalues: Array (upval), u71 (val)
            local mockImpl = Array.shift(u71.specificMockImpls)
            if mockImpl == nil then
                mockImpl = u71.mockImpl
            end
            if mockImpl then
                return mockImpl(unpack(a1))
            end
            return nil
        end, v5)
        if not success then
            v3.type = "throw"
            v3.value = result
            error(result)
        end
        v3.type = "return"
        v3.value = result
        return result
    end

    local v1 = {__call = u4}
    local u8 = setmetatable({}, v1)
    u8._isMockFunction = true

    function u8.getMockImplementation() -- Line: 297 -- upvalues: self (val), u8 (val)
        return self:_ensureMockConfig(u8).mockImpl
    end

    if typeof(a3) == "function" then
        self._spyState:add(a3)
    end
    self._mockState[u8] = (self._defaultMockState())
    self._mockConfigRegistry[u8] = (self._defaultMockConfig())
    local v2 = {
        __index = function(a1, a2) -- Line: 309 -- upvalues: self (val), u8 (val)
            return self:_ensureMockState(u8)[a2]
        end,
    }
    u8.mock = setmetatable({}, v2)

    function u8.mockClear() -- Line: 321 -- upvalues: self (val), u8 (val)
        self._mockState[u8] = nil
        return u8
    end

    function u8.mockReset() -- Line: 326 -- upvalues: u8 (val), self (val)
        u8.mockClear()
        self._mockConfigRegistry[u8] = nil
        return u8
    end

    function u8.mockRestore() -- Line: 332 -- upvalues: u8 (val), a3 (val)
        u8.mockReset()
        if a3 then
            return a3()
        end
        return nil
    end

    function u8.mockImplementationOnce(a1) -- Line: 343 -- upvalues: self (val), u8 (val)
        table.insert((self:_ensureMockConfig(u8)).specificMockImpls, a1)
        return u8
    end

    function u8.mockImplementation(a1) -- Line: 351 -- upvalues: self (val), u8 (val)
        self:_ensureMockConfig(u8).mockImpl = a1
        return u8
    end

    function u8.mockReturnValueOnce(a1) -- Line: 358 -- upvalues: u8 (val)
        return u8.mockImplementationOnce(function() -- Line: 360 -- upvalues: a1 (val)
            return a1
        end)
    end

    function u8.mockReturnValue(a1) -- Line: 367 -- upvalues: u8 (val)
        return u8.mockImplementation(function() -- Line: 369 -- upvalues: a1 (val)
            return a1
        end)
    end

    function u8.mockReturnThis() -- Line: 374 -- upvalues: u8 (val)
        return u8.mockImplementation(function(a1) -- Line: 375 -- upvalues: u8 (upval)
            return u8
        end)
    end

    function u8.mockName(a1) -- Line: 380 -- upvalues: self (val), u8 (val)
        if a1 then
            self:_ensureMockConfig(u8).mockName = a1
        end
        return u8
    end

    function u8.getMockName() -- Line: 388 -- upvalues: self (val), u8 (val)
        return self:_ensureMockConfig(u8).mockName or "jest.fn()"
    end

    function u8.new(...) -- Line: 395 -- upvalues: u8 (val)
        u8(...)
        return u8
    end

    if a2.mockImpl then
        u8.mockImplementation(a2.mockImpl)
    end
    return u8, function(...) -- Line: 406 -- upvalues: u4 (val), u8 (val)
        return u4(u8, ...)
    end
end

function u31._createMockFunction(a1, a2, a3) -- Line: 415
    if not a2.name then
        return a3
    end
    return a3
end

function u31.isMockFunction(a1, a2) -- Line: 425
    local v1 = false
    if typeof(a2) == "table" then
        v1 = a2._isMockFunction == true
    end
    return v1
end

function u31.fn(a1, a2) -- Line: 431 -- types: a1: table, a2: function?
    local v1, v2 = a1:_makeComponent({length = 0, type = "function"})
    if a2 then
        v1.mockImplementation(a2)
    end
    return v1, v2
end

function u31.spyOn(a1, a2, a3, a4) -- Line: 442
    -- upvalues: Boolean (val), Error (val), GlobalMocker (val)
    if Boolean.toJSBoolean(a4) then
        return a1:_spyOnProperty(a2, a3, a4)
    end
    if typeof(a2) ~= "table" then
        error(Error.new(("Cannot spyOn on a primitive value; %s given"):format((typeof(a2)))))
    end
    local _projectConfig = a1._projectConfig
    local v1 = a1._mocksOnObjectsMap[a2]
    if v1 == nil then
        a1._mocksOnObjectsMap[a2] = {}
    end
    if GlobalMocker:isMockGlobalLibrary(a2) then
        local v2 = a2._automocksRef[a3]
        if typeof(v2) ~= "table" or not v2._isGlobalAutomockFn then
            error(Error.new(("Cannot spy the %s property because it is not a function; %s given instead"):format(tostring(a3), (typeof(v2)))))
        elseif v2._maybeMock == nil then
            error(Error.new("globalEnv has not been initialised by Jest here"))
        end
        return v2._maybeMock
    end
    local u76 = a2[a3]
    if v1[a3] == nil then
        local v3, v4
        local u84 = rawget(a2, a3) ~= nil
        local u97 = nil
        if typeof(u76) == "table" then
            v4 = getmetatable(u76)
            if typeof(v4) == "table" and v4.__call ~= nil then
                u97 = v4
            end
        end
        v4, v3 = a1:_makeComponent({type = "function"}, function() -- Line: 499 -- upvalues: a2 (val), a3 (val), u84 (val), u76 (val)
            a2[a3] = if not u84 then nil else u76
        end)
        if typeof(u76) == "function" then
            a2[a3] = if not _projectConfig.oldFunctionSpying then v3 else v4
            v1[a3] = v4
            v4.mockImplementation(function(...) -- Line: 506 -- upvalues: u76 (val)
                return u76(...)
            end)
        elseif u97 == nil then
            error(Error.new(("Cannot spy the %s property because it is not a function or callable table; %s given instead"):format(
                tostring(a3),
                (typeof(u76))
            )))
        else
            local success, result = pcall(table.clone, u76)
            if not success then
                error(Error.new(("Cannot spy the %s property because it cannot be cloned. (%s)"):format(
                    tostring(a3),
                    (result:match("protected metatable")) or result
                )))
            end
            local v5 = table.clone(u97)
            v5.__call = v3
            a2[a3] = (setmetatable(result, v5))
            v1[a3] = v4
            v4.mockImplementation(function(...) -- Line: 527 -- upvalues: u97 (ref)
                return u97.__call(...)
            end)
        end
    end
    return v1[a3]
end

function u31._spyOnProperty(a1, a2, a3, a4) -- Line: 545 -- types: a1: table, a4: string?
    error("spyOn with accessors is not currently supported")
end

function u31.clearAllMocks(a1) -- Line: 605
    a1._mockState = {}
end

function u31.resetAllMocks(a1) -- Line: 609
    a1._mockConfigRegistry = {}
    a1._mockState = {}
end

function u31.restoreAllMocks(a1) -- Line: 614 -- upvalues: Set (val)
    for i, j in a1._spyState do
        j()
    end
    a1._spyState = Set.new()
end

function u31.mocked(a1, a2, a3) -- Line: 629 -- types: a1: table, a3: boolean?
    return a2
end

function u31.mockGlobals(a1, a2, a3) -- Line: 634
    local implement
    assert(not a2.currentlyMocked, "Attempt to mock globals while they're already mocked")
    a2.currentlyMocked = true

    function implement(a1_2, a2) -- Line: 637 -- upvalues: a1 (val), implement (val)
        for i, j in a1_2 do
            if not j._isGlobalAutomockFn then
                implement(j, a2[i])
            else
                local u14 = a2[i]
                local u15 = nil
                u15 = a1:_makeComponent({type = "function"}, function() -- Line: 642 -- upvalues: u15 (ref), u14 (val)
                    u15.mockImplementation(function(...) -- Line: 643 -- upvalues: u14 (upval)
                        return u14(...)
                    end)
                end)
                u15.mockImplementation(function(...) -- Line: 643 -- upvalues: u14 (val)
                    return u14(...)
                end)
                j._maybeUnmocked = u14
                j._maybeMock = u15
            end
        end
    end

    implement(a2.automocks, a3)
end

function u31.unmockGlobals(a1, a2) -- Line: 661
    local unimplement
    a2.currentlyMocked = false

    function unimplement(a1) -- Line: 663 -- upvalues: unimplement (val)
        for i, j in a1 do
            if not j._isGlobalAutomockFn then
                unimplement(j)
            else
                j._maybeUnmocked = nil
                j._maybeMock = nil
            end
        end
    end

    unimplement(a2.automocks)
end

v2.ModuleMocker = u31
return v2