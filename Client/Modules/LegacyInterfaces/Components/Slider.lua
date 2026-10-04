-- Script path: ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Slider
-- Decompile time: 1.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GuiLib = require(ReplicatedStorage.Shared.Modules.GuiLib)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local u20 = {}
u20.__index = u20

function u20.new(a1) -- Line: 10 -- upvalues: GuiLib (val), Maid (val), Signal (val), u20 (val)
    local v1 = {
        stringFormat = "%.f",
        Class = GuiLib.Classes.Slider.new(a1.Frame, a1.Axis),
        Connections = Maid.new(),
        Updated = Signal.new(),
    }
    local u17 = setmetatable(v1, u20)
    u17.Connections:Mark(function() -- Line: 20 -- upvalues: u17 (val)
        u17.Class:Destroy()
    end)
    u17.Class.Interval = a1.Increment
    u17.Class.Changed:Connect(function(a1) -- Line: 25 -- upvalues: u17 (val)
        u17.Updated:Fire(a1, (u17:GetPercentage(a1)))
    end)
    return u17
end

function u20:GetPercentage(a2) -- Line: 32
    return self.stringFormat:format((a2 or self.Class:Get()) * 100)
end

function u20:Set(a2) -- Line: 37
    self.Class:Set(a2)
end

function u20.Stop(a1) -- Line: 43
    a1.Connections:Sweep()
end

function u20:Connect(a2) -- Line: 47
    self.Connections:Mark((self.Updated:Connect(a2)))
end

return u20