-- Script path: ReplicatedStorage.Client.Controllers.Lobby.LegacyLobbyInterfaceController.Elements.Menus.Container
-- Decompile time: 1.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local u10 = {}
for k, v in pairs((script:WaitForChild("Modules")):GetChildren()) do
    u10[v.Name] = (require(v))
end
local u30 = {}
u30.__index = u30

function u30.new(a1, a2) -- Line: 27 -- upvalues: u10 (val), Signal (val), u30 (val)
    local Name = a1.Name
    return (setmetatable({
        Name = Name,
        Container = a1:WaitForChild("Content"),
        Opened = Signal.new(),
        Closed = Signal.new(),
    }, (setmetatable(u10[Name], u30))))
end

return u30