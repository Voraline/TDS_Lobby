-- Script path: ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.Menu.Container
-- Decompile time: 0.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
require(ReplicatedStorage.Shared.Modules.Utils.math)
require(ReplicatedStorage.Shared.Modules.Utils.table)
local u27 = {}
for k, v in pairs((script:WaitForChild("Modules")):GetChildren()) do
    u27[v.Name] = (require(v))
end
local u47 = {}
u47.__index = u47

function u47.new(a1, a2) -- Line: 31 -- upvalues: u27 (val), Signal (val), u47 (val)
    local Name = a1.Name
    return (setmetatable({
        Name = Name,
        Container = a1:WaitForChild("Content"),
        Button = a2,
        Opened = Signal.new(),
        Closed = Signal.new(),
    }, (setmetatable(u27[Name], u47))))
end

return u47