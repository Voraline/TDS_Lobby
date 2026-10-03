-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_emittery@3.10.0.emittery
-- Decompile time: 25.99 ms

local v1 = require(script.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Error = v1.Error
local Map = v1.Map
local Object = v1.Object
local Set = v1.Set
local Symbol = v1.Symbol
local WeakMap = v1.WeakMap
local console = v1.console
local promise = require(script.Parent:WaitForChild("promise"))
local HttpService = game:GetService("HttpService")
local isMetaEvent = nil
local None = Object.None
local v2 = {}
local u34 = WeakMap.new()
local u36 = WeakMap.new()
local u38 = WeakMap.new()
local anyProducer = Symbol("anyProducer")
local u43 = promise.resolve()
local listenerAdded = Symbol("listenerAdded")
local listenerRemoved = Symbol("listenerRemoved")
local metaEventsAllowed = Symbol("metaEventsAllowed")
local u53 = false

local function isSymbol(a1) -- Line: 57
    local v1 = false
    if typeof(a1) == "userdata" then
        v1 = tostring(a1):match("Symbol%(.*%)") ~= nil
    end
    return v1
end

local function isCallable(a1) -- Line: 66
    local v1 = true
    if typeof(a1) ~= "function" then
        v1 = false
        if typeof(a1) == "table" then
            v1 = false
            if typeof((getmetatable(a1))) == "table" then
                v1 = typeof((getmetatable(a1)).__call) == "function"
            end
        end
    end
    return v1
end

local function assertEventName(a1, a2) -- Line: 76 -- upvalues: Error (val), isMetaEvent (ref), metaEventsAllowed (val)
    if typeof(a1) ~= "string" then
        local v1 = false
        if typeof(a1) == "userdata" then
            v1 = tostring(a1):match("Symbol%(.*%)") ~= nil
        end
        if not v1 and typeof(a1) ~= "number" then
            error(Error.new("`eventName` must be a string, symbol, or number"))
        end
    end
    if isMetaEvent(a1) and a2 ~= metaEventsAllowed then
        error(Error.new("`eventName` cannot be meta event `listenerAdded` or `listenerRemoved`"))
    end
end

local function assertListener(a1) -- Line: 90 -- upvalues: Error (val)
    local v1 = true
    if typeof(a1) ~= "function" then
        v1 = false
        if typeof(a1) == "table" then
            v1 = false
            if typeof((getmetatable(a1))) == "table" then
                v1 = typeof((getmetatable(a1)).__call) == "function"
            end
        end
    end
    if not v1 then
        error(Error.new("listener must be a function"))
    end
end

local function getListeners(a1, a2) -- Line: 97 -- upvalues: u36 (val), Set (val)
    local v1 = u36:get(a1)
    if not v1:has(a2) then
        v1:set(a2, (Set.new()))
    end
    return v1:get(a2)
end

local function getEventProducers(a1, a2) -- Line: 105 -- upvalues: anyProducer (val), u38 (val), Set (val)
    local v1, v2
    if typeof(a2) == "string" then
        v1 = a2
    else
        v2 = false
        if typeof(a2) == "userdata" then
            v2 = tostring(a2):match("Symbol%(.*%)") ~= nil
        end
        v1 = if v2 then a2 else if typeof(a2) ~= "number" then anyProducer else a2
    end
    v2 = u38:get(a1)
    if not v2:has(v1) then
        v2:set(v1, (Set.new()))
    end
    return v2:get(v1)
end

local function enqueueProducers(a1, a2, a3) -- Line: 119 -- upvalues: u38 (val), anyProducer (val), promise (val)
    local v1 = u38:get(a1)
    if v1:has(a2) then
        for i, j in v1:get(a2):ipairs() do
            j:enqueue(a3)
        end
    end
    if v1:has(anyProducer) then
        local v2 = promise.all({promise.resolve(a2), (promise.resolve(a3))})
        for k, n in v1:get(anyProducer):ipairs() do
            n:enqueue(v2)
        end
    end
end

local function iterator(a1, a2) -- Line: 139
    -- upvalues: Array (val), None (val), getEventProducers (val), promise (val)
    if not Array.isArray(a2) then
        a2 = if a2 == nil then {None} else {a2}
    end
    local u12 = false

    local function flush() end

    local u14 = {}
    local u15 = {}

    function u15.enqueue(a1, a2) -- Line: 148 -- upvalues: u14 (ref), flush (ref)
        table.insert(u14, a2)
        flush()
    end

    function u15.finish(a1) -- Line: 152 -- upvalues: u12 (ref), flush (ref)
        u12 = true
        flush()
    end

    for i, j in a2 do
        (getEventProducers(a1, j)):add(u15)
    end
    return {
        next = function(a1) -- Line: 163 -- upvalues: promise (upval), u14 (ref), u12 (ref), flush (ref)
            return (promise.resolve()):andThen(function() -- Line: 164 -- upvalues: u14 (upval), u12 (upval), a1 (val), promise (upval), flush (upval)
                if u14 == nil then
                    return {done = true}
                end
                if #u14 ~= 0 then
                    return {
                        done = false,
                        value = promise.resolve((table.remove(u14, 1))):expect(),
                    }
                end
                if u12 then
                    u14 = nil
                    return a1:next()
                end
                promise.new(function(a1) -- Line: 174 -- upvalues: flush (upval)
                    flush = a1
                end):expect()
                return a1:next()
            end)
        end,
        ["return"] = function(a1_2, ...) -- Line: 187
            -- upvalues: promise (upval), u14 (ref), a2 (ref), getEventProducers (upval), a1 (val), u15 (val)
            -- upvalues: flush (ref)
            local u1 = ...
            local u2 = {}
            u2[1] = ...
            return (promise.resolve()):andThen(function() -- Line: 190
                -- upvalues: u14 (upval), a2 (upval), getEventProducers (upval), a1 (upval), u15 (upval), flush (upval)
                -- upvalues: u2 (val), u1 (val)
                u14 = nil
                for i, j in a2 do
                    (getEventProducers(a1, j)):delete(u15)
                end
                flush()
                if #u2 > 0 then
                    return {done = true, value = u1:expect()}
                end
                return {done = true}
            end)
        end,
    }
end

function isMetaEvent(a1) -- Line: 233 -- upvalues: listenerAdded (val), listenerRemoved (val)
    local v1 = true
    if a1 ~= listenerAdded then
        v1 = a1 == listenerRemoved
    end
    return v1
end

local u63 = {}
u63.__index = u63

function u63.new(a1) -- Line: 255
    -- upvalues: u63 (val), u34 (val), Set (val), u36 (val), Map (val), u38 (val), Boolean (val), HttpService (val)
    -- upvalues: Array (val), Object (val), console (val)
    local v1 = setmetatable({}, u63)
    local v2 = if a1 == nil then {} else a1
    u34:set(v1, (Set.new()))
    u36:set(v1, (Map.new()))
    u38:set(v1, (Map.new()))
    v1.debug = Boolean.toJSBoolean(v2.debug) and v2.debug or {}
    if v1.debug.enabled == nil then
        v1.debug.enabled = false
    end
    if not Boolean.toJSBoolean(v1.debug.logger) then
        function v1.debug.logger(a1, a2, a3, a4, a5) -- Line: 268
            -- upvalues: HttpService (upval), Array (upval), Object (upval), console (upval)
            xpcall(function() -- Line: 269 -- upvalues: a5 (ref), HttpService (upval)
                a5 = HttpService:JSONEncode(a5)
            end, function() -- Line: 272 -- upvalues: a5 (ref), Array (upval), Object (upval)
                a5 = ("Object with the following keys failed to stringify: %s"):format((Array.join(Object.keys(a5), ",")))
            end)
            local v1 = false
            if typeof(a4) == "userdata" then
                v1 = tostring(a4):match("Symbol%(.*%)") ~= nil
            end
            local v2 = if v1 then tostring(a4) else if typeof(a4) ~= "number" then a4 else tostring(a4)
            v1 = DateTime.now():ToUniversalTime()
            local v3 = ("%d:%d:%d.%d"):format(v1.Hour, v1.Minute, v1.Second, v1.Millisecond)
            console.log(("[%s][emittery:%s][%s] Event Name: %s\n\tdata: %s"):format(v3, tostring(a2), tostring(a3), tostring(v2), (tostring(a5))))
        end
    end
    return v1
end

function u63.getIsDebugEnabled() -- Line: 370 -- upvalues: u53 (ref)
    return u53
end

function u63.setIsDebugEnabled(a1) -- Line: 379 -- upvalues: u53 (ref) -- types: a1: boolean
    u53 = a1
end

function u63:logIfDebugEnabled(a2, a3, a4) -- Line: 383 -- upvalues: u63 (val)
    if u63.getIsDebugEnabled() or self.debug.enabled then
        self.debug:logger(a2, self.debug.name, a3, a4)
    end
end

function u63:on(a2, a3) -- Line: 392
    -- upvalues: Error (val), Array (val), assertEventName (val), metaEventsAllowed (val), u36 (val), Set (val)
    -- upvalues: isMetaEvent (ref), listenerAdded (val)
    local v1, v2
    local v3 = true
    if typeof(a3) ~= "function" then
        v3 = false
        if typeof(a3) == "table" then
            v3 = false
            if typeof((getmetatable(a3))) == "table" then
                v3 = typeof((getmetatable(a3)).__call) == "function"
            end
        end
    end
    if not v3 then
        error(Error.new("listener must be a function"))
    end
    if not Array.isArray(a2) then
        a2 = {a2}
    end
    local v4 = nil
    local v5 = nil
    for i, j in a2, v4, v5 do
        assertEventName(j, metaEventsAllowed)
        v2 = u36:get(self)
        if not v2:has(j) then
            v1 = Set.new()
            v2:set(j, v1)
        end
        ;(v2:get(j)):add(a3)
        self:logIfDebugEnabled("subscribe", j, nil)
        if not isMetaEvent(j) then
            self:emit(listenerAdded, {eventName = j, listener = a3}, metaEventsAllowed)
        end
    end
    return function() -- Line: 406 -- upvalues: self (val), a2 (ref), a3 (val)
        return self:off(a2, a3)
    end
end

function u63:off(a2, a3) -- Line: 411
    -- upvalues: Error (val), Array (val), assertEventName (val), metaEventsAllowed (val), u36 (val), Set (val)
    -- upvalues: isMetaEvent (ref), listenerRemoved (val)
    local v1, v2
    local v3 = true
    if typeof(a3) ~= "function" then
        v3 = false
        if typeof(a3) == "table" then
            v3 = false
            if typeof((getmetatable(a3))) == "table" then
                v3 = typeof((getmetatable(a3)).__call) == "function"
            end
        end
    end
    if not v3 then
        error(Error.new("listener must be a function"))
    end
    local v4 = if not Array.isArray(a2) then {a2} else a2
    local v5 = nil
    local v6 = nil
    local v7 = self
    for i, j in v4, v5, v6 do
        assertEventName(j, metaEventsAllowed)
        v2 = u36:get(v7)
        if not v2:has(j) then
            v1 = Set.new()
            v2:set(j, v1)
        end
        ;(v2:get(j)):delete(v8)
        v7:logIfDebugEnabled("unsubscribe", j, nil)
        if not isMetaEvent(j) then
            v7:emit(listenerRemoved, {eventName = j, listener = v8}, metaEventsAllowed)
        end
    end
end

function u63.once(a1, a2) -- Line: 427 -- upvalues: promise (val)
    return promise.new(function(a1_2) -- Line: 428 -- upvalues: a1 (val), a2 (val)
        local u1 = nil
        local v1 = a1:on(a2, function(a1) -- Line: 430 -- upvalues: u1 (ref), a1_2 (val)
            u1()
            a1_2(a1)
        end)
    end)
end

function u63.events(a1, a2) -- Line: 437
    -- upvalues: Array (val), assertEventName (val), metaEventsAllowed (val), iterator (val)
    if not Array.isArray(a2) then
        a2 = {a2}
    end
    for i, j in a2 do
        assertEventName(j, metaEventsAllowed)
    end
    return (iterator(a1, a2))
end

function u63.emit(a1, a2, a3, a4) -- Line: 447
    -- upvalues: promise (val), assertEventName (val), enqueueProducers (val), u36 (val), Set (val), u34 (val)
    -- upvalues: Array (val), Boolean (val), isMetaEvent (ref), u43 (val)
    return (promise.resolve()):andThen(function() -- Line: 448
        -- upvalues: assertEventName (upval), a2 (val), a4 (val), a1 (val), a3 (val), enqueueProducers (upval)
        -- upvalues: u36 (upval), Set (upval), u34 (upval), Array (upval), Boolean (upval), isMetaEvent (upval)
        -- upvalues: u43 (upval), promise (upval)
        assertEventName(a2, a4)
        a1:logIfDebugEnabled("emit", a2, a3)
        enqueueProducers(a1, a2, a3)
        local v1 = a2
        local v2 = u36:get(a1)
        if not v2:has(v1) then
            v2:set(v1, (Set.new()))
        end
        local u40 = v2:get(v1)
        local u45 = u34:get(a1)
        v1 = Array.concat({}, Array.from(u40))
        v2 = if not Boolean.toJSBoolean(isMetaEvent(a2)) then Array.concat({}, Array.from(u45)) else {}
        u43:andThen(function(...) -- Line: 464 -- upvalues: promise (upval)
            return promise.delay(0):andThenReturn(...)
        end):expect()
        promise.all(Array.concat({}, Array.map(v1, function(a1) -- Line: 471 -- upvalues: promise (upval), u40 (val), a3 (upval)
            return (promise.resolve()):andThen(function() -- Line: 472 -- upvalues: u40 (upval), a1 (val), a3 (upval)
                if u40:has(a1) then
                    return a1(a3)
                end
            end)
        end), Array.map(v2, function(a1) -- Line: 479 -- upvalues: promise (upval), u45 (val), a2 (upval), a3 (upval)
            return (promise.resolve()):andThen(function() -- Line: 480 -- upvalues: u45 (upval), a1 (val), a2 (upval), a3 (upval)
                if u45:has(a1) then
                    return a1(a2, a3)
                end
            end)
        end))):expect()
    end)
end

function u63.emitSerial(a1, a2, a3, a4) -- Line: 491
    -- upvalues: promise (val), assertEventName (val), u36 (val), Set (val), u34 (val), Array (val), u43 (val)
    return (promise.resolve()):andThen(function() -- Line: 492
        -- upvalues: assertEventName (upval), a2 (val), a4 (val), a1 (val), a3 (val), u36 (upval), Set (upval)
        -- upvalues: u34 (upval), Array (upval), u43 (upval), promise (upval)
        assertEventName(a2, a4)
        a1:logIfDebugEnabled("emitSerial", a2, a3)
        local v1 = a2
        local v2 = u36:get(a1)
        if not v2:has(v1) then
            v2:set(v1, (Set.new()))
        end
        local v3 = v2:get(v1)
        local v4 = u34:get(a1)
        v1 = Array.concat({}, Array.from(v3))
        v2 = Array.concat({}, Array.from(v4))
        u43:andThen(function(...) -- Line: 504 -- upvalues: promise (upval)
            return promise.delay(0):andThenReturn(...)
        end):expect()
        for i, j in v1 do
            if v3:has(j) then
                promise.resolve(j(a3)):expect()
            end
        end
        for k, n in v2 do
            if v4:has(n) then
                promise.resolve(n(a2, a3)):expect()
            end
        end
    end)
end

function u63.onAny(a1, a2) -- Line: 527
    -- upvalues: Error (val), u34 (val), listenerAdded (val), metaEventsAllowed (val)
    local v1 = true
    if typeof(a2) ~= "function" then
        v1 = false
        if typeof(a2) == "table" then
            v1 = false
            if typeof((getmetatable(a2))) == "table" then
                v1 = typeof((getmetatable(a2)).__call) == "function"
            end
        end
    end
    if not v1 then
        error(Error.new("listener must be a function"))
    end
    a1:logIfDebugEnabled("subscribeAny", nil, nil)
    ;(u34:get(a1)):add(a2)
    a1:emit(listenerAdded, {listener = a2}, metaEventsAllowed)
    return function() -- Line: 534 -- upvalues: a1 (val), a2 (val)
        a1:offAny(a2)
    end
end

function u63.anyEvent(a1) -- Line: 539 -- upvalues: iterator (val)
    return (iterator(a1))
end

function u63:offAny(a2) -- Line: 543 -- upvalues: Error (val), listenerRemoved (val), metaEventsAllowed (val), u34 (val)
    local v1 = true
    if typeof(a2) ~= "function" then
        v1 = false
        if typeof(a2) == "table" then
            v1 = false
            if typeof((getmetatable(a2))) == "table" then
                v1 = typeof((getmetatable(a2)).__call) == "function"
            end
        end
    end
    if not v1 then
        error(Error.new("listener must be a function"))
    end
    self:logIfDebugEnabled("unsubscribeAny", nil, nil)
    self:emit(listenerRemoved, {listener = a2}, metaEventsAllowed)
    ;(u34:get(self)):delete(a2)
end

function u63.clearListeners(a1, a2) -- Line: 552
    -- upvalues: Array (val), None (val), u36 (val), Set (val), getEventProducers (val), u34 (val), u38 (val)
    local v1, v2, v3
    if not Array.isArray(a2) then
        a2 = if a2 == nil then {None} else {a2}
    end
    local v4 = nil
    local v5 = nil
    local v6 = a1
    for i, j in a2, v4, v5 do
        v6:logIfDebugEnabled("clear", j, nil)
        if typeof(j) == "string" then
            v3 = u36:get(v6)
            if not v3:has(j) then
                v1 = Set.new()
                v3:set(j, v1)
            end
            v3:get(j):clear()
            v2 = getEventProducers(v6, j)
            for k, n in v2:ipairs() do
                n:finish()
            end
            v2:clear()
        else
            v2 = false
            if typeof(j) == "userdata" then
                v2 = tostring(j):match("Symbol%(.*%)") ~= nil
            end
            if v2 then
                v3 = u36:get(v6)
                if not v3:has(j) then
                    v1 = Set.new()
                    v3:set(j, v1)
                end
                v3:get(j):clear()
                v2 = getEventProducers(v6, j)
                for m, i5 in v2:ipairs() do
                    i5:finish()
                end
                v2:clear()
            elseif typeof(j) ~= "number" then
                u34:get(v6):clear()
                for i6, i7 in u36:get(v6):values() do
                    i7:clear()
                end
                for i8, i9 in u38:get(v6):values() do
                    for i10, i11 in i9:ipairs() do
                        i11:finish()
                    end
                    i9:clear()
                end
            else
                v3 = u36:get(v6)
                if not v3:has(j) then
                    v1 = Set.new()
                    v3:set(j, v1)
                end
                v3:get(j):clear()
                v2 = getEventProducers(v6, j)
                for i12, i13 in v2:ipairs() do
                    i13:finish()
                end
                v2:clear()
            end
        end
    end
end

function u63.listenerCount(a1, a2) -- Line: 592
    -- upvalues: Array (val), None (val), u34 (val), u36 (val), Set (val), getEventProducers (val)
    -- upvalues: assertEventName (val), metaEventsAllowed (val), u38 (val)
    local size, v1, v2
    if not Array.isArray(a2) then
        a2 = if a2 == nil then {None} else {a2}
    end
    local v3 = 0
    local v4 = nil
    local v5 = nil
    local v6 = a1
    for i, j in a2, v4, v5 do
        if typeof(j) ~= "string" then
            if j ~= nil and j ~= None then
                assertEventName(j, metaEventsAllowed)
            end
            v3 = v3 + u34:get(v6).size
            for k, n in u36:get(v6):values() do
                v3 = v3 + n.size
            end
            for m, i5 in u38:get(v6):values() do
                v3 = v3 + i5.size
            end
        else
            size = u34:get(v6).size
            v1 = u36:get(v6)
            if not v1:has(j) then
                v2 = Set.new()
                v1:set(j, v2)
            end
            v3 = v3 + (size + v1:get(j).size + getEventProducers(v6, j).size + getEventProducers(v6).size)
        end
    end
    return v3
end

u63.listenerAdded = listenerAdded
u63.listenerRemoved = listenerRemoved
v2.default = u63
return v2