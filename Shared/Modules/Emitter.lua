-- Script path: ReplicatedStorage.Shared.Modules.Emitter
-- Decompile time: 0.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local u10 = {}
u10.__index = u10

function u10.new() -- Line: 8 -- upvalues: u10 (val)
    return (setmetatable({Events = {}}, u10))
end

function u10:Get(a2) -- Line: 14 -- upvalues: Signal (val)
    if not self.Events[a2] then
        self.Events[a2] = (Signal.new())
    end
    return self.Events[a2]
end

function u10.On(a1, a2, a3) -- Line: 22
    return (a1:Get(a2)):Connect(a3)
end

function u10.Emit(a1, a2, ...) -- Line: 26
    (a1:Get(a2)):Fire(...)
end

return u10