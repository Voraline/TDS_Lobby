-- Script path: ReplicatedStorage.Client.Modules.State
-- Decompile time: 0.94 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
require(ReplicatedStorage.Shared.Modules.Utils.math)
require(ReplicatedStorage.Shared.Modules.Utils.table)
local v1 = {}
local State = ReplicatedStorage:WaitForChild("State")
local u27 = {}
u27.__index = u27

function u27.new(a1) -- Line: 14 -- upvalues: Signal (val), u27 (val)
    local v1 = {Updated = Signal.new()}
    local u7 = setmetatable(v1, u27)
    ;(a1:GetPropertyChangedSignal("Value")):Connect(function() -- Line: 19 -- upvalues: u7 (val), a1 (val)
        u7:Set(a1.Value)
    end)
    return u7:Set(a1.Value) and u7
end

function u27:Set(a2) -- Line: 26
    self.Value = a2
    self.Updated:Fire(a2)
    return true
end

function u27.Get(a1) -- Line: 35
    return a1.Value
end

local u31 = {}

function v1.Get(a1, a2) -- Line: 41 -- upvalues: u31 (val), State (val), u27 (val)
    local v1 = u31[a2]
    if v1 then
        return v1
    end
    local v2 = State
    for k, v in pairs((string.split(a2, "."))) do
        v2 = v2:WaitForChild(v)
    end
    local v3 = u27.new(v2)
    if not v3 then
        return
    end
    u31[a2] = v3
    return v3
end

return v1