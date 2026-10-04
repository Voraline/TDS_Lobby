-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Keybind
-- Decompile time: 6.00 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local useKeybind = require(ReplicatedStorage.Client.Interfaces.Hooks.useKeybind)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local createElement = React.createElement
local u44 = {
    Bumper = "http://www.roblox.com/asset/?id=4833778049",
    PC = "http://www.roblox.com/asset/?id=6362342133",
    Console = "http://www.roblox.com/asset/?id=4833777853",
    DoubleTap = "http://www.roblox.com/asset/?id=4833808674",
    LMB = "http://www.roblox.com/asset/?id=6429468581",
    RMB = "http://www.roblox.com/asset/?id=6429468711",
}
local u45 = {
    [Enum.KeyCode.LeftShift] = "LSFT",
    [Enum.KeyCode.RightShift] = "RSFT",
    [Enum.UserInputType.MouseButton1] = "MB1",
    [Enum.UserInputType.MouseButton2] = "MB2",
    [Enum.UserInputType.MouseButton3] = "MB3",
}
return function(a1) -- Line: 49
    -- upvalues: useKeybind (val), ReactFlow (val), useReactBindings (val), u45 (val), UserInputService (val), u44 (val)
    -- upvalues: React (val), createElement (val), ImageLabel (val), TextLabel (val)
    local v1 = useKeybind({Key = a1.Key})
    local v2, u9 = ReactFlow.useSpring({target = 0, start = 0, speed = 30, damper = 0.5})
    local u12 = v1:getValue()
    local v3 = {v1}
    useReactBindings(function(a1_2) -- Line: 57 -- upvalues: u12 (ref), a1 (val), u9 (val)
        if a1_2 == u12 then
            return
        end
        u12 = a1_2
        if a1.CallBack then
            a1.CallBack(a1_2)
        end
        u9({target = if not a1_2 then 0 else 0.5})
    end, v3)
    local Name = u45[a1.Key] or a1.Key.Name
    local v4 = nil
    local GamepadEnabled = UserInputService.GamepadEnabled and (UserInputService:GetLastInputType()) == Enum.UserInputType.Gamepad1
    if a1.Key:IsA("KeyCode") then
        v4 = UserInputService:GetImageForKeyCode(a1.Key)
        local StringForKeyCode = UserInputService:GetStringForKeyCode(a1.Key)
        if StringForKeyCode and StringForKeyCode ~= "" then
            Name = StringForKeyCode
        end
    end
    if a1.ForceConsole then
        GamepadEnabled = true
    end
    if a1.Icon then
        v4 = u44[a1.Icon] or a1.Icon
        Name = ""
        GamepadEnabled = true
    end
    local v5, u69 = React.useBinding(0)
    local v6 = {BorderSizePixel = 0}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v6.AnchorPoint = AnchorPoint
    v6.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v6.BackgroundTransparency = a1.BackgroundTransparency or 0.5
    v6.BorderColor3 = Color3.fromRGB(0, 0, 0)
    local Position = a1.Position or UDim2.fromScale(0.841, 0.5)
    v6.Position = Position
    v6.Size = v5:map(function(a1_2) -- Line: 104 -- upvalues: a1 (val)
        return UDim2.fromOffset(61 + a1_2 + 50 / (a1.ScaleMultiplier or 1), 58)
    end)
    v6.LayoutOrder = a1.Layout
    local v7 = {
        uIScale = createElement("UIScale", {Scale = a1.ScaleMultiplier or 1}),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.15, 0)}),
        uIStroke = createElement("UIStroke", {Thickness = 3, Transparency = 0.43}),
        bind = createElement("Frame", {
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            BackgroundColor3 = v1:map(function(a1) -- Line: 123
                return a1 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 0, 0)
            end),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0, 35.5, 0.5, 0),
            Size = UDim2.fromOffset(61, 50),
            AnchorPoint = Vector2.new(0.5, 0.5),
        }, {
            uICorner1 = createElement("UICorner"),
            uIScale = createElement("UIScale", {
                Scale = v2:map(function(a1) -- Line: 135
                    return 1 - a1 / 3
                end),
            }),
            bindImage = createElement(ImageLabel, {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = v4,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromOffset(30, 30),
                ScaleType = Enum.ScaleType.Fit,
            }, {uiScale = createElement("UIScale", {Scale = a1.IconSize or 1})}),
            text = createElement(TextLabel, {
                FontWeight = "Heavy",
                TextScaled = true,
                StrokeThickness = 2,
                StrokeTransparency = 0.4,
                Text = Name,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.0544, 0.12),
                AnchorPoint = Vector2.zero,
                Size = UDim2.fromOffset(53, 38),
                Visible = not GamepadEnabled,
            }),
        }),
    }
    local v8 = createElement
    local v9 = TextLabel
    local v10 = {
        FontWeight = "Bold",
        Text = a1.ActionText,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextScaled = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        AnchorPoint = Vector2.new(0, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        Position = UDim2.new(0, 75, 0.5, 0),
        Size = UDim2.fromOffset(0, 33),
        StrokeTransparency = 0.57,
        StrokeThickness = 2,
    }

    v10[React.Change.AbsoluteSize] = function(a1) -- Line: 181 -- upvalues: u69 (val) -- types: a1: userdata
        u69(a1.AbsoluteSize.X)
    end

    v7.actionText = v8(v9, v10)
    return (createElement("Frame", v6, v7))
end