-- Script path: ReplicatedStorage.Shared.Modules.InstancePool
-- Decompile time: 1.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u5 = {}
u5.__index = u5
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local u15 = CFrame.new(0, 1000000, 0)
local u16 = 0

function u5.new(a1, a2, a3, a4) -- Line: 20
    -- upvalues: u5 (val), u16 (ref), Maid (val), u15 (val)
    local u7 = setmetatable({}, u5)
    u16 = u16 + 1
    u7._uid = u16
    u7._maid = Maid.new()
    u7._copyInstance = a1:Clone()
    u7._pool = {}
    u7._maxInstances = a2 or (1 / 0)
    u7._parent = a3 or workspace
    u7._shouldMoveObject = a1:IsA("PVInstance")
    u7._copyInstance:SetAttribute("_PoolUID", u7._uid)
    if a4 then
        u7:Warm(a4)
    end
    if u7._shouldMoveObject then
        u7._copyInstance:PivotTo(u15)
    end
    u7._maid:Mark(function() -- Line: 48 -- upvalues: u7 (val)
        u7:Clear()
    end)
    return u7
end

function u5:Warm(a2) -- Line: 55 -- types: self: table, a2: number
    for i = 1, a2 do
        self:Return((self:Get()))
    end
end

function u5:Get() -- Line: 61
    local v1 = table.remove(self._pool)
    if v1 then
        return v1
    end
    local v2 = self._copyInstance:Clone()
    v2.Parent = self._parent
    return v2
end

function u5:Return(a2) -- Line: 74 -- upvalues: u15 (val) -- types: self: table, a2: userdata
    assert((a2:GetAttribute("_PoolUID")) == self._uid, "Instance does not belong to this pool")
    if self._maxInstances <= #self._pool then
        a2:Destroy()
        return
    end
    if self._shouldMoveObject then
        a2:PivotTo(u15)
    end
    table.insert(self._pool, a2)
end

function u5:Clear() -- Line: 89
    for i, v in ipairs(self._pool) do
        v:Destroy()
    end
    self._pool = {}
end

function u5:Destroy() -- Line: 97
    if self._maid then
        self._maid:Sweep()
        self._maid = nil
    end
end

return u5