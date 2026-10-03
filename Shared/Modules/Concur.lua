-- Script path: ReplicatedStorage.Shared.Modules.Concur
-- Decompile time: 3.91 ms

local u0 = {}
u0.__index = u0
u0.Errors = {Stopped = "Stopped", Timeout = "Timeout"}

function u0._new(a1, a2, ...) -- Line: 54 -- upvalues: u0 (val) -- types: a1: function, a2: function
    local u6 = setmetatable({_completed = false, _awaitingThreads = {}}, u0)
    u6._thread = a2(function(...) -- Line: 63 -- upvalues: a1 (val), u6 (val)
        local n, spawn
        local v1 = table.pack(pcall(a1, ...))
        u6._completed = true
        u6._err = if v1[1] then nil else v1[2]
        if u6._err ~= nil then
            for i2, i3 in ipairs(u6._awaitingThreads) do
                task.spawn(i3, u6._err)
            end
            return
        end
        local v2 = table.move(v1, 2, #v1, 1, table.create(#v1 - 1))
        u6._res = v2
        for i, v in ipairs(u6._awaitingThreads) do
            spawn = task.spawn
            n = v2.n
            spawn(v, nil, table.unpack(v2, 1, n))
        end
    end, ...)
    return u6
end

function u0.spawn(a1, ...) -- Line: 100 -- upvalues: u0 (val) -- types: a1: function
    if type(a1) ~= "function" then
        error("Concur.spawn argument must be a function; got " .. type(a1), 2)
    end
    return u0._new(a1, task.spawn, ...)
end

function u0.defer(a1, ...) -- Line: 110 -- upvalues: u0 (val) -- types: a1: function
    if type(a1) ~= "function" then
        error("Concur.defer argument must be a function; got " .. type(a1), 2)
    end
    return u0._new(a1, task.defer, ...)
end

function u0.delay(a1, a2, ...) -- Line: 120 -- upvalues: u0 (val) -- types: a1: number, a2: function
    if type(a2) ~= "function" then
        error("Concur.delay argument must be a function; got " .. type(a2), 2)
    end
    return u0._new(a2, function(...) -- Line: 124 -- upvalues: a1 (val)
        return task.delay(a1, ...)
    end, ...)
end

function u0.value(a1) -- Line: 139 -- upvalues: u0 (val)
    return u0.spawn(function() -- Line: 140 -- upvalues: a1 (val)
        return a1
    end)
end

function u0.event(a1, a2) -- Line: 163 -- upvalues: u0 (val) -- types: a1: userdata, a2: function?
    local u2 = nil
    local u3 = nil
    u2 = a1:Connect(function(...) -- Line: 166 -- upvalues: u3 (ref), a2 (val), u2 (ref)
        if not u3 then
            return
        end
        if a2 == nil then
            u2:Disconnect()
            task.spawn(u3, ...)
        elseif a2(...) then
            u2:Disconnect()
            task.spawn(u3, ...)
        end
    end)
    local v1 = u0.spawn(function() -- Line: 176 -- upvalues: u3 (ref)
        u3 = coroutine.running()
        return coroutine.yield()
    end)
    v1:OnCompleted(function(a1) -- Line: 181 -- upvalues: u2 (ref), u3 (ref)
        u2:Disconnect()
        if coroutine.status(u3) == "suspended" then
            task.spawn(u3, a1)
        end
    end)
    return v1
end

function u0.all(a1) -- Line: 215 -- upvalues: u0 (val) -- types: a1: table
    if #a1 == 0 then
        return u0.value(nil)
    end
    return u0.spawn(function() -- Line: 220 -- upvalues: a1 (val)
        local u0 = 0
        local u2 = #a1
        local u4 = coroutine.running()
        local u7 = table.create(u2)
        for i, v in ipairs(a1) do
            v:OnCompleted(function(...) -- Line: 226 -- upvalues: u7 (val), i (val), u0 (ref), u2 (val), u4 (val)
                u7[i] = (table.pack(...))
                u0 = u0 + 1
                if u2 <= u0 and coroutine.status(u4) == "suspended" then
                    task.spawn(u4)
                end
            end)
        end
        if u0 < u2 then
            coroutine.yield()
        end
        return u7
    end)
end

function u0.first(a1) -- Line: 259 -- upvalues: u0 (val) -- types: a1: table
    if #a1 == 0 then
        return u0.value(nil)
    end
    return u0.spawn(function() -- Line: 264 -- upvalues: a1 (val)
        local u1 = coroutine.running()
        local u2 = nil
        local u3 = nil
        for i, v in ipairs(a1) do
            v:OnCompleted(function(a1, ...) -- Line: 269 -- upvalues: u2 (ref), u3 (ref), v (val), u1 (val)
                if not u2 and a1 == nil then
                    u3 = v
                    u2 = table.pack(...)
                    if coroutine.status(u1) == "suspended" then
                        task.spawn(u1)
                    end
                    return
                end
            end)
        end
        if u2 == nil then
            coroutine.yield()
        end
        for i2, i3 in ipairs(a1) do
            if i3 ~= u3 then
                i3:Stop()
            end
        end
        return (table.unpack(u2, 1, u2.n))
    end)
end

function u0:Stop() -- Line: 310 -- upvalues: u0 (val)
    if self._completed then
        return
    end
    self._completed = true
    self._err = u0.Errors.Stopped
    task.cancel(self._thread)
    for i, v in ipairs(self._awaitingThreads) do
        task.spawn(v, u0.Errors.Stopped)
    end
end

function u0.IsCompleted(a1) -- Line: 325
    return a1._completed
end

function u0:Await(a2) -- Line: 402 -- upvalues: u0 (val) -- types: self: table, a2: number?
    if self._completed then
        if self._err ~= nil then
            return self._err
        end
        local v1 = nil
        if self._res == nil then
            return v1, nil
        end
        return v1, (table.unpack(self._res, 1, self._res.n))
    end
    local u15 = coroutine.running()
    table.insert(self._awaitingThreads, u15)
    if not a2 then
        return coroutine.yield()
    end
    local v2 = task.delay(a2, function() -- Line: 415 -- upvalues: self (val), u15 (val), u0 (upval)
        local v1 = table.find(self._awaitingThreads, u15)
        if v1 then
            table.remove(self._awaitingThreads, v1)
            task.spawn(u15, u0.Errors.Timeout)
        end
    end)
    local v3 = table.pack(coroutine.yield())
    if coroutine.status(v2) ~= "normal" then
        task.cancel(v2)
    end
    return table.unpack(v3, 1, v3.n)
end

function u0.OnCompleted(a1, a2, a3) -- Line: 517 -- types: a1: table, a2: function, a3: number?
    local u5 = task.spawn(function() -- Line: 518 -- upvalues: a2 (val), a1 (val), a3 (val)
        a2(a1:Await(a3))
    end)
    return function() -- Line: 523 -- upvalues: u5 (val), a1 (val)
        task.cancel(u5)
        local v1 = table.find(a1._awaitingThreads, u5)
        if v1 then
            table.remove(a1._awaitingThreads, v1)
        end
    end
end

return u0