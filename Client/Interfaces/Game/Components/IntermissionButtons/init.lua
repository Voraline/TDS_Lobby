-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.IntermissionButtons
-- Decompile time: 1.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local Button = require(script.Button)
local Scale = require(script.Parent.Scale)
return function(a1) -- Line: 9 -- upvalues: React (val), createElement (val), Scale (val), Button (val)
    local createElement_2 = React.createElement
    local v1 = {
        BackgroundTransparency = 1,
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
    }
    local v2 = {
        uiListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 16),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        scale = createElement(Scale, {Min = 0.8, Max = 1}),
    }
    local IsPvp = a1.IsPvp and a1.IsRanked
    v2.inventory = not IsPvp and createElement(Button, {
        Icon = "rbxassetid://5547582257",
        Title = "Inventory",
        LayoutOrder = 0,
        TextSize = 20,
        Size = UDim2.fromOffset(150, 50),
        Position = UDim2.new(0, 0, 1, 40),
        AnchorPoint = Vector2.new(0.5, 0.5),
        ButtonColor = Color3.fromRGB(255, 170, 0),
        OnClick = a1.OnInventoryClick,
    })
    v2.ready = createElement(Button, {
        Icon = "rbxassetid://3642321726",
        LayoutOrder = 1,
        TextSize = 24,
        Size = UDim2.fromOffset(200, 60),
        Position = UDim2.new(0, 0, 1, 40),
        Title = ("Ready (%*/%*)"):format(a1.ReadyPlayers or 0, a1.TotalPlayers or 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        ButtonColor = Color3.fromRGB(6, 255, 68),
        OnClick = a1.OnReadyClick,
        Disabled = a1.ReadyDisabled,
    })
    v2.veto = createElement(Button, {
        Icon = "rbxassetid://9674219565",
        LayoutOrder = 2,
        TextSize = 20,
        Size = UDim2.fromOffset(150, 50),
        Position = UDim2.new(0, 0, 1, 40),
        Title = ("Veto (%*/%*)"):format(a1.VetoPlayers or 0, a1.TotalVetoPlayers or 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        ButtonColor = Color3.fromRGB(255, 60, 60),
        OnClick = a1.OnVetoClick,
        Disabled = a1.VetoDisabled,
    })
    return createElement_2("Frame", v1, v2)
end