-- Script path: ReplicatedStorage.Packages._Index.sleitnick_trove@1.8.0.trove
-- Decompile time: 3.98 ms

local RunService = game:GetService("RunService")
local u6 = newproxy()
local u8 = newproxy()
local u15 = table.freeze({"Destroy", "Disconnect", "destroy", "disconnect"})

local function getObjectCleanupFunction(a1, a2) -- Line: 220
    -- upvalues: u6 (val), u8 (val), u15 (val)
    local v1 = typeof(a1)
    if v1 == "function" then
        return u6
    end
    if v1 == "thread" then
        return u8
    end
    if a2 then
        return a2
    end
    if v1 == "Instance" then
        return "Destroy"
    end
    if v1 == "RBXScriptConnection" then
        return "Disconnect"
    end
    if v1 == "table" then
        for i, j in u15 do
            if typeof(a1[j]) == "function" then
                return j
            end
        end
    end
    error(("failed to get cleanup function for object %*: %*"):format(v1, a1), 3)
end

local function assertPromiseLike(a1) -- Line: 248
    if typeof(a1) ~= "table"
        or typeof(a1.getStatus) ~= "function"
        or typeof(a1.finally) ~= "function"
        or typeof(a1.cancel) ~= "function" then
        error("did not receive a promise as an argument", 3)
    end
end

local function assertSignalLike(a1) -- Line: 259
    if typeof(a1) ~= "RBXScriptSignal" then
        if typeof(a1) ~= "table" or typeof(a1.Connect) ~= "function" or typeof(a1.Once) ~= "function" then
            error("did not receive a signal as an argument", 3)
        end
    end
end

local u19 = {}
u19.__index = u19

function u19.new() -- Line: 284 -- upvalues: u19 (val)
    local v1 = setmetatable({}, u19)
    v1._objects = {}
    v1._cleaning = false
    return v1
end

function u19:Add(a2, a3) -- Line: 343 -- upvalues: getObjectCleanupFunction (val) -- types: a3: string?
    if self._cleaning then
        error("cannot call trove:Add() while cleaning", 2)
    end
    table.insert(self._objects, {a2, (getObjectCleanupFunction(a2, a3))})
    return a2
end

function u19:Clone(a2) -- Line: 365 -- types: a2: userdata
    if self._cleaning then
        error("cannot call trove:Clone() while cleaning", 2)
    end
    return self:Add((a2:Clone()))
end

function u19:Construct(a2, ...) -- Line: 408
    if self._cleaning then
        error("Cannot call trove:Construct() while cleaning", 2)
    end
    local v1 = nil
    local v2 = type(a2)
    if v2 == "table" then
        v1 = a2.new(...)
    elseif v2 == "function" then
        v1 = a2(...)
    end
    return self:Add(v1)
end

function u19:Connect(a2, a3) -- Line: 441 -- types: a3: function
    if self._cleaning then
        error("Cannot call trove:Connect() while cleaning", 2)
    end
    if typeof(a2) ~= "RBXScriptSignal" then
        if typeof(a2) ~= "table" or typeof(a2.Connect) ~= "function" or typeof(a2.Once) ~= "function" then
            error("did not receive a signal as an argument", 3)
        end
    end
    return self:Add((a2:Connect(a3)))
end

function u19:Once(a2, a3) -- Line: 474 -- types: a3: function
    if self._cleaning then
        error("Cannot call trove:Connect() while cleaning", 2)
    end
    if typeof(a2) ~= "RBXScriptSignal" then
        if typeof(a2) ~= "table" or typeof(a2.Connect) ~= "function" or typeof(a2.Once) ~= "function" then
            error("did not receive a signal as an argument", 3)
        end
    end
    local u25 = nil
    u25 = (a2:Once(function(...) -- Line: 487 -- upvalues: a3 (val), self (val), u25 (ref)
        a3(...)
        self:Pop(u25)
    end))
    return (self:Add(u25))
end

function u19:BindToRenderStep(a2, a3, a4) -- Line: 510
    -- upvalues: RunService (val)
    if self._cleaning then
        error("cannot call trove:BindToRenderStep() while cleaning", 2)
    end
    RunService:BindToRenderStep(a2, a3, a4)
    self:Add(function() -- Line: 517 -- upvalues: RunService (upval), a2 (val)
        RunService:UnbindFromRenderStep(a2)
    end)
end

function u19.AddPromise(a1, a2) -- Line: 547
    if a1._cleaning then
        error("cannot call trove:AddPromise() while cleaning", 2)
    end
    if typeof(a2) ~= "table"
        or typeof(a2.getStatus) ~= "function"
        or typeof(a2.finally) ~= "function"
        or typeof(a2.cancel) ~= "function" then
        error("did not receive a promise as an argument", 3)
    end
    if a2:getStatus() == "Started" then
        a2:finally(function() -- Line: 555 -- upvalues: a1 (val), a2 (val)
            if a1._cleaning then
                return
            end
            a1:_findAndRemoveFromObjects(a2, false)
        end)
        a1:Add(a2, "cancel")
    end
    return a2
end

function u19.Remove(a1, a2) -- Line: 581
    if a1._cleaning then
        error("cannot call trove:Remove() while cleaning", 2)
    end
    return a1:_findAndRemoveFromObjects(a2, true)
end

function u19:Pop(a2) -- Line: 603
    if self._cleaning then
        error("cannot call trove:Pop() while cleaning", 2)
    end
    return self:_findAndRemoveFromObjects(a2, false)
end

function u19.Extend(a1) -- Line: 632 -- upvalues: u19 (val)
    if a1._cleaning then
        error("cannot call trove:Extend() while cleaning", 2)
    end
    return a1:Construct(u19)
end

function u19:Clean() -- Line: 652
    if self._cleaning then
        return
    end
    self._cleaning = true
    for i, j in self._objects do
        self:_cleanupObject(j[1], j[2])
    end
    table.clear(self._objects)
    self._cleaning = false
end

function u19.WrapClean(a1) -- Line: 694
    return function() -- Line: 695 -- upvalues: a1 (val)
        a1:Clean()
    end
end

function u19:_findAndRemoveFromObjects(a2, a3) -- Line: 700 -- types: a3: boolean
    local v1
    local _objects = self._objects
    for i, j in _objects do
        if j[1] == a2 then
            v1 = #_objects
            _objects[i] = _objects[v1]
            _objects[v1] = nil
            if a3 then
                self:_cleanupObject(j[1], j[2])
            end
            return true
        end
    end
    return false
end

function u19._cleanupObject(a1, a2, a3) -- Line: 720 -- upvalues: u6 (val), u8 (val) -- types: a3: string?
    if a3 == u6 then
        task.spawn(a2)
        return
    end
    if a3 == u8 then
        pcall(task.cancel, a2)
        return
    end
    a2[a3](a2)
end

function u19.AttachToInstance(a1, a2) -- Line: 760 -- types: a2: userdata
    if a1._cleaning then
        error("cannot call trove:AttachToInstance() while cleaning", 2)
    elseif not a2:IsDescendantOf(game) then
        error("instance is not a descendant of the game hierarchy", 2)
    end
    return a1:Connect(a2.Destroying, function() -- Line: 767 -- upvalues: a1 (val)
        a1:Destroy()
    end)
end

function u19:Destroy() -- Line: 781
    self:Clean()
end

return {new = u19.new}