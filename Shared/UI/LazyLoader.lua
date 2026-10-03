-- Script path: ReplicatedStorage.Shared.UI.LazyLoader
-- Decompile time: 1.29 ms

local u0 = {}
u0.__index = u0

function u0.new(a1) -- Line: 4 -- upvalues: u0 (val)
    local init = a1
    if init then
        init = a1.init
    end
    return (setmetatable({
        _loading = false,
        _loaded = false,
        _load = function(a1_2) -- Line: 7 -- upvalues: init (val), a1 (val)
            if init then
                init(a1, a1_2)
                return
            end
            a1_2()
        end,
        _initialized = not init,
        _awaiters = {},
        _object = a1,
    }, u0))
end

function u0:isInitialized() -- Line: 25
    return self._initialized
end

function u0:isLoaded() -- Line: 29
    return not self._loading and self._initialized
end

function u0:resolve() -- Line: 33
    local _awaiters = self._awaiters
    self._awaiters = {}
    for i, j in _awaiters do
        coroutine.resume(j)
    end
end

function u0:await() -- Line: 42
    if not self._loaded then
        table.insert(self._awaiters, (coroutine.running()))
        coroutine.yield()
    end
end

function u0:load() -- Line: 49
    if not self._loading and not self._initialized then
        self._loading = true
        self._load(function() -- Line: 59 -- upvalues: self (val)
            if self._initialized then
                return nil
            end
            self._initialized = true
            self._loading = false
            self._loaded = true
            task.spawn(function() -- Line: 68 -- upvalues: self (upval)
                self:resolve()
            end)
        end)
        return
    end
    return nil
end

function u0:get() -- Line: 74
    if not self:isInitialized() then
        self:load()
    end
    if not self:isLoaded() then
        self:await()
    end
    return self._object
end

return function(a1) -- Line: 86 -- upvalues: u0 (val)
    local u4 = u0.new(a1)
    return (setmetatable({}, {
        __index = function(a1, a2) -- Line: 90 -- upvalues: u4 (val)
            if a2 == "LazyLoaded" then
                return u4._loaded
            end
            if a2 == "init" then
                return function() -- Line: 94 -- upvalues: u4 (upval)
                    return u4:get()
                end
            end
            return u4._object[a2]
        end,
        __newindex = function(a1, a2, a3) -- Line: 102 -- upvalues: u4 (val)
            u4._object[a2] = a3
        end,
    }))
end