-- Script path: ReplicatedStorage.Shared.Modules.FastSignal.Deferred
-- Decompile time: 2.04 ms

local u0 = {}
u0.__index = u0
local u1 = {}
u1.__index = u1

function u0.new() -- Line: 27 -- upvalues: u0 (val)
    return (setmetatable({_active = true}, u0))
end

function u0.Is(a1) -- Line: 34 -- upvalues: u0 (val)
    local v1 = false
    if typeof(a1) == "table" then
        v1 = (getmetatable(a1)) == u0
    end
    return v1
end

function u0.IsActive(a1) -- Line: 38
    return a1._active == true
end

function u0:Connect(a2) -- Line: 42 -- upvalues: u1 (val)
    assert(typeof(a2) == "function", "Must be function")
    if self._active ~= true then
        return (setmetatable({Connected = false}, u1))
    end
    local _head = self._head
    local v1 = {_signal = self, _handler = a2, _next = _head}
    if _head ~= nil then
        _head._prev = v1
    end
    self._head = v1
    local v2 = {Connected = true, _node = v1}
    local v3 = setmetatable(v2, u1)
    v1._connection = v3
    return v3
end

function u0.Once(a1, a2) -- Line: 79
    assert(typeof(a2) == "function", "Must be function")
    local u11 = nil
    u11 = (a1:Connect(function(...) -- Line: 83 -- upvalues: u11 (ref), a2 (val)
        if u11 == nil then
            return
        end
        u11:Disconnect()
        u11 = nil
        a2(...)
    end))
    return u11
end

u0.ConnectOnce = u0.Once

function u0.Wait(a1) -- Line: 98
    local u4 = coroutine.running()
    local u5 = nil
    local v1 = a1:Connect(function(...) -- Line: 104 -- upvalues: u5 (ref), u4 (ref)
        if u5 == nil then
            return
        end
        u5:Disconnect()
        u5 = nil
        if coroutine.status(u4) == "suspended" then
            task.spawn(u4, ...)
        end
    end)
    return (coroutine.yield())
end

function u0.Fire(a1, ...) -- Line: 120
    local _head = a1._head
    while _head ~= nil do
        task.defer(_head._handler, ...)
        _head = _head._next
    end
end

function u0:DisconnectAll() -- Line: 129
    local _connection
    local _head = self._head
    while _head ~= nil do
        _connection = _head._connection
        if _connection ~= nil then
            _connection.Connected = false
            _connection._node = nil
            _head._connection = nil
        end
        _head = _head._next
    end
    self._head = nil
end

function u0.Destroy(a1) -- Line: 146
    if a1._active ~= true then
        return
    end
    a1:DisconnectAll()
    a1._active = false
end

function u1:Disconnect() -- Line: 155
    if self.Connected ~= true then
        return
    end
    self.Connected = false
    local _node = self._node
    local _prev = _node._prev
    local _next = _node._next
    if _next ~= nil then
        _next._prev = _prev
    end
    if _prev == nil then
        _node._signal._head = _next
    else
        _prev._next = _next
    end
    _node._connection = nil
    self._node = nil
end

u1.Destroy = u1.Disconnect
return u0