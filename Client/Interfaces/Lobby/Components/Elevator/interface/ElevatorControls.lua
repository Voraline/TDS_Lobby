-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Elevator.interface.ElevatorControls
-- Decompile time: 4.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ElevatorButton = require(script.Parent.ElevatorButton)
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
local createElement = React.createElement
return function(a1) -- Line: 19
    -- upvalues: useMediaQuery (val), React (val), createElement (val), ElevatorButton (val)
    local v1
    local v2 = ("%* (%*/%*)"):format(if not a1.isReady then "READY" else "UNREADY", a1.ready or 0, a1.size or 0)
    local onLeave = if not (a1.canLeave ~= false) then nil else a1.onLeave
    local v3 = not useMediaQuery("large")
    local createElement_2 = React.createElement
    local v4 = {
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0.5, 0, 1, -140 * (if v3 then 0.65 else 1)),
        Size = UDim2.fromScale(0.293, 0.104),
    }
    local v5 = {
        ready = createElement(ElevatorButton, {color = Color3.fromRGB(43, 235, 0), onClick = a1.onToggleReady, text = v2}),
    }
    local v6 = {text = "LEAVE"}
    local v7 = if not v1 then Color3.fromRGB(128, 128, 128) else Color3.fromRGB(240, 0, 0)
    v6.color = v7
    v6.onClick = onLeave
    v6.native = {LayoutOrder = 1}
    v5.leave = createElement(ElevatorButton, v6)
    v5.list = React.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0.05),
    })
    v5.uICorner4 = React.createElement("UICorner")
    v5.uIStroke4 = React.createElement("UIStroke", {Color = Color3.fromRGB(255, 255, 255)}, {
        uIGradient2 = React.createElement("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
        }),
    })
    v5.uIAspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 5})
    v5.sizeConstraint = React.createElement("UISizeConstraint", {MaxSize = Vector2.new(350, 100)})
    return createElement_2("Frame", v4, v5)
end