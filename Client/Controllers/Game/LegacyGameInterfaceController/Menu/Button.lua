-- Script path: ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.Menu.Button
-- Decompile time: 1.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
require(ReplicatedStorage.Shared.Modules.Utils.math)
require(ReplicatedStorage.Shared.Modules.Utils.table)
local u29 = {}
u29.__index = u29

function u29.new(a1) -- Line: 11 -- upvalues: u29 (val), Sound (val), Signal (val)
    local v1 = {Button = a1.Button, Container = a1.Container}
    local u6 = setmetatable(v1, u29)
    u6.Connection = u6.Button.MouseButton1Down:Connect(function() -- Line: 17 -- upvalues: Sound (upval), u6 (val)
        Sound("Click"):Play()
        u6.Clicked:Fire(u6.Container and u6.Container.Name)
        if not u6.Container then
            return
        end
        if u6.Container.Visible then
            u6.Container:Close()
            return
        end
        u6.Container:Open()
        if not u6.Loaded then
            u6.Loaded = true
            u6.Container:Initialize()
        end
    end)
    u6.Clicked = Signal.new()
    return u6
end

return u29