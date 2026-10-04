-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_scheduler@17.2.1.scheduler.forks.SchedulerHostConfig.mock
-- Decompile time: 2.53 ms

local u0 = {}
local u1 = 0
local u2 = nil
local u3 = nil
local u4 = -1
local u5 = nil
local u6 = -1
local u7 = false
local u8 = false
local u9 = false
local u10 = false
local console = require(script.Parent.Parent.Parent:WaitForChild("shared")).console
local disabledLog = require(script.Parent.Parent.Parent:WaitForChild("shared")).ConsolePatchingDev.disabledLog

function u0.requestHostCallback(a1) -- Line: 27 -- upvalues: u2 (ref) -- types: a1: function
    u2 = a1
end

function u0.cancelHostCallback() -- Line: 31 -- upvalues: u2 (ref)
    u2 = nil
end

function u0.requestHostTimeout(a1, a2) -- Line: 35
    -- upvalues: u3 (ref), u4 (ref), u1 (ref)
    u3 = a1
    u4 = u1 + a2
end

function u0.cancelHostTimeout() -- Line: 40 -- upvalues: u3 (ref), u4 (ref)
    u3 = nil
    u4 = -1
end

function u0.shouldYieldToHost() -- Line: 45 -- upvalues: u5 (ref), u6 (ref), u10 (ref), u9 (ref), u7 (ref)
    local v1 = u5
    if u6 ~= -1 and v1 ~= nil then
        local v2 = #v1
        if u6 <= v2 then
            u7 = true
            return true
        end
    end
    if u10 and u9 then
        u7 = true
        return true
    end
    return false
end

function u0.getCurrentTime() -- Line: 64 -- upvalues: u1 (ref)
    return u1
end

function u0.forceFrameRate() end

function u0.reset() -- Line: 72
    -- upvalues: u8 (ref), u1 (ref), u2 (ref), u3 (ref), u4 (ref), u5 (ref), u6 (ref), u7 (ref), u9 (ref)
    if u8 then
        error("Cannot reset while already flushing work.")
    end
    u1 = 0
    u2 = nil
    u3 = nil
    u4 = -1
    u5 = nil
    u6 = -1
    u7 = false
    u8 = false
    u9 = false
end

function u0.unstable_flushNumberOfYields(a1) -- Line: 89
    -- upvalues: u8 (ref), u2 (ref), u6 (ref), u1 (ref), u7 (ref)
    if u8 then
        error("Already flushing work.")
    end
    if u2 ~= nil then
        local u6_2 = u2
        u6 = a1
        u8 = true
        local success, result = pcall(function() -- Line: 99 -- upvalues: u6_2 (val), u1 (upval), u7 (upval), u2 (upval)
            local v1
            repeat
            until not (u6_2(true, u1)) or u7
            if not v1 then
                u2 = nil
            end
        end)
        u6 = -1
        u7 = false
        u8 = false
        if not success then
            error(result)
        end
    end
end

function u0.unstable_flushUntilNextPaint() -- Line: 120
    -- upvalues: u8 (ref), u2 (ref), u10 (ref), u9 (ref), u1 (ref), u7 (ref)
    if u8 then
        error("Already flushing work.")
    end
    if u2 ~= nil then
        local u5 = u2
        u10 = true
        u9 = false
        u8 = true
        local success, result = pcall(function() -- Line: 131 -- upvalues: u5 (val), u1 (upval), u7 (upval), u2 (upval)
            local v1
            repeat
            until not (u5(true, u1)) or u7
            if not v1 then
                u2 = nil
            end
        end)
        u10 = false
        u7 = false
        u8 = false
        if not success then
            error(result)
        end
    end
end

function u0.unstable_flushExpired() -- Line: 153 -- upvalues: u8 (ref), u2 (ref), u1 (ref)
    if u8 then
        error("Already flushing work.")
    end
    if u2 ~= nil then
        u8 = true
        local success, result = pcall(function() -- Line: 159 -- upvalues: u2 (upval), u1 (upval)
            if not u2(false, u1) then
                u2 = nil
            end
        end)
        u8 = false
        if not success then
            error(result)
        end
    end
end

function u0.unstable_flushAllWithoutAsserting() -- Line: 177 -- upvalues: u8 (ref), u2 (ref), u1 (ref)
    if u8 then
        error("Already flushing work.")
    end
    if u2 == nil then
        return false
    end
    local u5 = u2
    u8 = true
    local success, result = pcall(function() -- Line: 185 -- upvalues: u5 (val), u1 (upval), u2 (upval)
        local v1
        repeat
        until not (u5(true, u1))
        if not v1 then
            u2 = nil
        end
    end)
    u8 = false
    if not success then
        error(result)
    end
    return true
end

function u0.unstable_clearYields() -- Line: 208 -- upvalues: u5 (ref)
    if u5 == nil then
        return {}
    end
    local v1 = u5
    u5 = nil
    return v1
end

function u0.unstable_flushAll() -- Line: 217 -- upvalues: u5 (ref), u0 (val)
    if u5 ~= nil then
        error("Log is not empty. Assert on the log of yielded values before flushing additional work.")
    end
    u0.unstable_flushAllWithoutAsserting()
    if u5 ~= nil then
        error("While flushing work, something yielded a value. Use an assertion helper to assert on the log of yielded values, e.g. expect(Scheduler).toFlushAndYield([...])")
    end
end

function u0.unstable_yieldValue(a1) -- Line: 234 -- upvalues: console (val), disabledLog (val), u5 (ref)
    if console.log == disabledLog then
        return
    end
    if u5 == nil then
        u5 = {a1}
        return
    end
    table.insert(u5, a1)
end

function u0.unstable_advanceTime(a1) -- Line: 251
    -- upvalues: console (val), disabledLog (val), u1 (ref), u3 (ref), u4 (ref)
    if console.log == disabledLog then
        return
    end
    u1 = u1 + a1
    if u3 ~= nil and u4 <= u1 then
        u3(u1)
        u4 = -1
        u3 = nil
    end
end

function u0.requestPaint() -- Line: 270 -- upvalues: u9 (ref)
    u9 = true
end

return u0