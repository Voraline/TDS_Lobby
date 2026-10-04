-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.roblox.SingleEventManager
-- Decompile time: 2.13 ms

local console = (require((script.Parent.Parent.Parent.Parent:WaitForChild("shared")))).console
local u13 = {}
u13.__index = u13

function u13.new(a1) -- Line: 47 -- upvalues: u13 (val) -- types: a1: userdata
    return (setmetatable({
        _status = "Disabled",
        _isResuming = false,
        _suspendedEventQueue = {},
        _connections = {},
        _listeners = {},
        _instance = a1,
    }, u13))
end

function u13.connectEvent(a1, a2, a3) -- Line: 75
    a1:_connect(a2, a1._instance[a2], a3)
end

function u13.connectPropertyChange(a1, a2, a3) -- Line: 79
    local success, result = pcall(a1._instance.GetPropertyChangedSignal, a1._instance, a2)
    if not success then
        error(string.format("Cannot get changed signal on property %q: %s", tostring(a2), result), 0)
    end
    a1:_connect("Change." .. a2, result, a3)
end

function u13:_connect(a2, a3, a4) -- Line: 97
    if a4 ~= nil then
        if self._connections[a2] == nil then
            self._connections[a2] = (a3:Connect(function(...) -- Line: 108 -- upvalues: self (val), a2 (val)
                if self._status == "Enabled" then
                    self._listeners[a2](self._instance, ...)
                    return
                end
                if self._status == "Suspended" then
                    table.insert(self._suspendedEventQueue, {a2, select("#", ...), ...})
                end
            end))
        end
        self._listeners[a2] = a4
        return
    end
    if self._connections[a2] ~= nil then
        self._connections[a2]:Disconnect()
        self._connections[a2] = nil
    end
    self._listeners[a2] = nil
end

function u13.suspend(a1) -- Line: 128
    a1._status = "Suspended"
end

function u13.resume(a1) -- Line: 132 -- upvalues: console (val)
    local _instance, resume, v1, v2, v3, v4, v5, v6
    if a1._isResuming then
        return
    end
    a1._isResuming = true
    for i, j in a1._suspendedEventQueue do
        v3 = a1._listeners[j[1]]
        v4 = j[2]
        if v3 ~= nil then
            v5 = coroutine.create(v3)
            resume = coroutine.resume
            _instance = a1._instance
            v2 = 2 + v4
            v6, v1 = resume(v5, _instance, unpack(j, 3, v2))
            if not v6 then
                console.warn("%s", v1)
            end
        end
    end
    a1._isResuming = false
    a1._status = "Enabled"
    table.clear(a1._suspendedEventQueue)
end

return u13