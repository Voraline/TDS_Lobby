-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Elevator.interface.ElevatorSizeButton
-- Decompile time: 3.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local Sift = require(ReplicatedStorage.Packages.Sift)
local useState = React.useState
local useEffect = React.useEffect
return function(a1) -- Line: 16 -- upvalues: useState (val), useEffect (val), React (val), Sift (val) -- types: a1: table
    local v1, u4 = useState(false)
    local v2 = useEffect
    local v3 = {v1, a1.isSelected}
    v2(function() end, v3)
    local createElement = React.createElement
    local merge = Sift.Dictionary.merge
    local v4 = {}

    v4[React.Event.MouseEnter] = function() -- Line: 26 -- upvalues: u4 (val)
        u4(true)
    end

    v4[React.Event.MouseLeave] = function() -- Line: 29 -- upvalues: u4 (val)
        u4(false)
    end

    local v5 = if not a1.isSelected then Color3.fromRGB(158, 158, 158) else Color3.fromRGB(131, 209, 137)
    v4.BackgroundColor3 = v5
    v4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v4.BorderSizePixel = 0
    v4.Size = UDim2.fromScale(0.2, 0.6)
    v3 = merge(v4, a1.native)
    v4 = {uICorner3 = React.createElement("UICorner", {CornerRadius = UDim.new(0.2, 0)})}
    local createElement_3 = React.createElement
    local v6 = {}
    v6[React.Event.MouseButton1Click] = a1.onClick
    v6.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
    v6.Text = ""
    v6.TextColor3 = Color3.fromRGB(0, 0, 0)
    v6.TextSize = 14
    v6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v6.BackgroundTransparency = 1
    v6.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v6.BorderSizePixel = 0
    v6.Size = UDim2.fromScale(1, 1)
    v6.ZIndex = 100
    v4.detector = createElement_3("TextButton", v6)
    v4.textLabel2 = React.createElement("TextLabel", {
        TextSize = 32,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = a1.size,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, 0, 0, 32),
    }, {uIStroke5 = React.createElement("UIStroke", {Thickness = 4})})
    v4.highlight = React.createElement("UIStroke", {
        Thickness = 2,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Color = Color3.fromRGB(255, 255, 255),
    })
    v4.uIAspectRatioConstraint = React.createElement("UIAspectRatioConstraint")
    return createElement("Frame", v3, v4)
end