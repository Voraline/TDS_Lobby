-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-fake-timers@3.10.0.jest-fake-timers
-- Decompile time: 6.43 ms

local getType = require(script.Parent:WaitForChild("jest-get-type")).getType
local ModuleMocker = (require((script.Parent:WaitForChild("jest-mock")))).ModuleMocker
local u18 = delay
local u19 = tick
local u20 = time
local u21 = DateTime
local u22 = os
local u23 = task
local u24 = {}
u24.__index = u24

function u24.new() -- Line: 65
    -- upvalues: ModuleMocker (val), u18 (val), u19 (val), u20 (val), u21 (val), u22 (val), u23 (val), u24 (val)
    local v1 = ModuleMocker.new()
    local v2 = v1:fn(u18)
    local v3 = v1:fn(u19)
    local v4 = v1:fn(u20)
    local v5 = {
        now = v1:fn(u21.now),
        fromUnixTimestamp = u21.fromUnixTimestamp,
        fromUnixTimestampMillis = u21.fromUnixTimestampMillis,
        fromUniversalTime = u21.fromUniversalTime,
        fromLocalTime = u21.fromLocalTime,
        fromIsoDate = u21.fromIsoDate,
    }
    local v6 = {time = v1:fn(u22.time), clock = v1:fn(u22.clock)}
    local v7 = {__index = u22}
    setmetatable(v6, v7)
    local v8 = {
        delay = v1:fn(u23.delay),
        cancel = v1:fn(u23.cancel),
        wait = v1:fn(u23.wait),
    }
    local v9 = {__index = u23}
    setmetatable(v8, v9)
    local v10 = {
        _fakingTime = false,
        _mockTimeMs = 0,
        _engineFrameTime = 0,
        _timeouts = {},
        _mock = v1,
        _mockSystemTime = u21.now().UnixTimestamp,
        delayOverride = v2,
        tickOverride = v3,
        timeOverride = v4,
        dateTimeOverride = v5,
        osOverride = v6,
        taskOverride = v8,
    }
    setmetatable(v10, u24)
    return v10
end

function u24:_advanceToTime(a2) -- Line: 110
    local v1 = a2
    if self._mockTimeMs < a2 then
        if 0 < self._engineFrameTime then
            v1 = (math.floor(a2 / self._engineFrameTime)) * self._engineFrameTime
        end
        local v2 = v1 - self._mockTimeMs
        self._mockTimeMs = v1
        self._mockSystemTime = self._mockSystemTime + v2 / 1000
    end
end

function u24.clearAllTimers(a1) -- Line: 125
    if a1._fakingTime then
        a1._timeouts = {}
    end
end

function u24.dispose(a1) -- Line: 131
    a1:useRealTimers()
end

function u24.runAllTimers(a1) -- Line: 135
    if a1:_checkFakeTimers() then
        local args, callback
        for i, j in a1._timeouts do
            a1:_advanceToTime(j.time + a1._engineFrameTime)
            callback = j.callback
            args = j.args
            callback(unpack(args))
        end
    end
    a1._timeouts = {}
end

function u24.runOnlyPendingTimers(a1) -- Line: 145
    if a1:_checkFakeTimers() then
        local args, callback
        local v1 = {}
        for i, j in a1._timeouts do
            table.insert(v1, j)
        end
        a1._timeouts = {}
        for k, n in v1 do
            a1:_advanceToTime(n.time + a1._engineFrameTime)
            callback = n.callback
            args = n.args
            callback(unpack(args))
        end
    end
end

function u24.advanceTimersToNextTimer(a1, a2) -- Line: 161 -- types: a1: table, a2: number?
    local v1 = a2 or 1
    if a1:_checkFakeTimers() then
        local _mockTimeMs, args, callback
        local v2 = {}
        local time_2 = -1
        local v3 = nil
        local v4 = nil
        local v5 = a1
        for i, j in a1._timeouts, v3, v4 do
            if time_2 < j.time and v1 > 0 then
                v5:_advanceToTime(if not (0 < v5._engineFrameTime) then j.time else (math.floor(j.time / v5._engineFrameTime + 1)) * v5._engineFrameTime)
                v1 = v1 - 1
            end
            _mockTimeMs = v5._mockTimeMs
            if not (j.time <= _mockTimeMs) then
                table.insert(v2, j)
            else
                callback = j.callback
                args = j.args
                callback(unpack(args))
            end
        end
        v5._timeouts = v2
    end
end

function u24.advanceTimersByTime(a1, a2) -- Line: 188 -- types: a1: table, a2: number
    if a1:_checkFakeTimers() then
        local args, callback
        local v1 = a1._mockTimeMs + a2
        if 0 < a1._engineFrameTime then
            v1 = (math.floor(v1 / a1._engineFrameTime) + 1) * a1._engineFrameTime
        end
        local v2 = {}
        for i, j in a1._timeouts do
            if not (j.time <= v1) then
                table.insert(v2, j)
            else
                a1:_advanceToTime(j.time + a1._engineFrameTime)
                callback = j.callback
                args = j.args
                callback(unpack(args))
            end
        end
        a1:_advanceToTime(v1)
        a1._timeouts = v2
    end
end

function u24.runAllTicks(a1) -- Line: 208
    if a1:_checkFakeTimers() then
        error("not implemented")
    end
end

function u24:useRealTimers() -- Line: 214 -- upvalues: u18 (val), u19 (val), u20 (val), u21 (val), u22 (val), u23 (val)
    if self._fakingTime then
        self.delayOverride.mockImplementation(u18)
        self.tickOverride.mockImplementation(u19)
        self.timeOverride.mockImplementation(u20)
        self.dateTimeOverride.now.mockImplementation(u21.now)
        self.osOverride.time.mockImplementation(u22.time)
        self.osOverride.clock.mockImplementation(u22.clock)
        self.taskOverride.delay.mockImplementation(u23.delay)
        self.taskOverride.cancel.mockImplementation(u23.cancel)
        self.taskOverride.wait.mockImplementation(u23.wait)
        self._fakingTime = false
    end
end

local function fakeClock(a1) -- Line: 229
    return a1._mockTimeMs / 1000
end

local function fakeDelay(a1, a2, a3, ...) -- Line: 233
    local v1 = a1._mockTimeMs + (a1._engineFrameTime / 1000 + a2 * 1000)
    local v2 = {time = v1, callback = a3, args = {...}}
    local v3 = #a1._timeouts + 1
    for i, j in a1._timeouts do
        if v1 < j.time then
            v3 = i
            break
        end
    end
    table.insert(a1._timeouts, v3, v2)
    return v2
end

local function fakeCancel(a1, a2) -- Line: 257
    for i, j in a1._timeouts do
        if j == a2 then
            table.remove(a1._timeouts, i)
            return
        end
    end
end

local function fakeWait(a1, a2) -- Line: 266 -- upvalues: fakeDelay (val) -- types: a2: number?
    local u3 = coroutine.running()
    local u5 = a1._mockTimeMs / 1000
    fakeDelay(a1, a2 or 0, function() -- Line: 269 -- upvalues: u3 (val), a1 (val), u5 (val)
        task.spawn(u3, a1._mockTimeMs / 1000 - u5)
    end)
    return coroutine.yield()
end

function u24.useFakeTimers(a1) -- Line: 275 -- upvalues: fakeDelay (val), u21 (val), fakeCancel (val), fakeWait (val)
    if not a1._fakingTime then
        a1.delayOverride.mockImplementation(function(a1_2, a2) -- Line: 277 -- upvalues: fakeDelay (upval), a1 (val)
            return fakeDelay(a1, a1_2, a2)
        end)
        a1.tickOverride.mockImplementation(function() -- Line: 281 -- upvalues: a1 (val)
            return a1._mockSystemTime
        end)
        a1.timeOverride.mockImplementation(function() -- Line: 285 -- upvalues: a1 (val)
            return a1._mockTimeMs / 1000
        end)
        a1.dateTimeOverride.now.mockImplementation(function() -- Line: 289 -- upvalues: u21 (upval), a1 (val)
            return u21.fromUnixTimestamp(a1._mockSystemTime)
        end)
        a1.osOverride.time.mockImplementation(function(a1_2) -- Line: 293 -- upvalues: u21 (upval), a1 (val)
            if typeof(a1_2) == "table" then
                return a1._mockSystemTime - (u21.fromUniversalTime(a1_2.year or 1970, a1_2.month or 1, a1_2.day or 1, a1_2.hour or 0, a1_2.min or 0, a1_2.sec or 0)).UnixTimestamp
            end
            return a1._mockSystemTime
        end)
        a1.osOverride.clock.mockImplementation(function() -- Line: 308 -- upvalues: a1 (val)
            return a1._mockTimeMs / 1000
        end)
        a1.taskOverride.delay.mockImplementation(function(a1_2, a2, ...) -- Line: 312 -- upvalues: fakeDelay (upval), a1 (val)
            return fakeDelay(a1, a1_2, a2, ...)
        end)
        a1.taskOverride.cancel.mockImplementation(function(a1_2) -- Line: 316 -- upvalues: fakeCancel (upval), a1 (val)
            fakeCancel(a1, a1_2)
        end)
        a1.taskOverride.wait.mockImplementation(function(a1_2) -- Line: 320 -- upvalues: fakeWait (upval), a1 (val)
            return fakeWait(a1, a1_2)
        end)
        a1._fakingTime = true
        a1:reset()
    end
end

function u24:reset() -- Line: 329 -- upvalues: u21 (val)
    if self:_checkFakeTimers() then
        self._mock:clearAllMocks()
        self._timeouts = {}
        self._mockTimeMs = 0
        self._mockSystemTime = u21.now().UnixTimestamp
        self._engineFrameTime = 0
    end
end

function u24.setSystemTime(a1, a2) -- Line: 339 -- upvalues: u21 (val), getType (val)
    if a1:_checkFakeTimers() then
        if not a2 then
            a2 = u21.now()
        end
        if getType(a2) == "DateTime" then
            a2 = a2.UnixTimestamp
        end
        a1._mockSystemTime = a2
    end
end

function u24.setEngineFrameTime(a1, a2) -- Line: 351 -- types: a1: table, a2: number
    if a1:_checkFakeTimers() then
        if a2 < 0 then
            error("Frame Time should be greater than 0")
        end
        a1._engineFrameTime = a2
    end
end

function u24.getEngineFrameTime(a1) -- Line: 361
    if a1:_checkFakeTimers() then
        return a1._engineFrameTime
    end
    return 0
end

function u24.getRealSystemTime(a1) -- Line: 368 -- upvalues: u21 (val)
    return u21.now()
end

function u24.getTimerCount(a1) -- Line: 372
    if a1:_checkFakeTimers() then
        return #a1._timeouts
    end
    return 0
end

function u24:_checkFakeTimers() -- Line: 380
    if not self._fakingTime then
        error("A function to advance timers was called but the timers API is not mocked with fake timers. Call `jest.useFakeTimers()` in this test.")
    end
    return self._fakingTime
end

return u24