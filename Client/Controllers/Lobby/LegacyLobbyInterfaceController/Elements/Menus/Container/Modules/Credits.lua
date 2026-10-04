-- Script path: ReplicatedStorage.Client.Controllers.Lobby.LegacyLobbyInterfaceController.Elements.Menus.Container.Modules.Credits
-- Decompile time: 2.00 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Buttons = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Buttons)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 11 -- upvalues: Buttons (val), Sound (val)
    (Buttons(a1.Container:WaitForChild("Close")):Default()({MultiplierSpeed = 12, SizeMultiplyHover = 1.1})).instance.MouseButton1Click:Connect(function() -- Line: 17 -- upvalues: Sound (upval), a1 (val)
        Sound("Click"):Play()
        a1:Close()
    end)
end

function v1.Open(a1) -- Line: 26 -- upvalues: TweenService (val)
    (game:GetService("Lighting")):WaitForChild("Blur")
    a1.Container.Position = UDim2.new(0, 0, 0.1, 0)
    a1.Container.Visible = true
    TweenService:Create(
        a1.Container,
        TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
        {Position = UDim2.new(0, 0, 0, 0)}
    ):Play()
    a1.Visible = true
    a1.Opened:Fire()
end

function v1:Close() -- Line: 50
    (game:GetService("Lighting")):WaitForChild("Blur")
    self.Container.Visible = false
    self.Visible = false
    self.Closed:Fire()
end

return v1