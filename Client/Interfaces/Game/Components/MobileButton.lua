-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.MobileButton
-- Decompile time: 2.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local createElement = React.createElement
local useBinding = React.useBinding
local Event = React.Event
return function(a1) -- Line: 22
    -- upvalues: useBinding (val), useScale (val), createElement (val), Event (val)
    local u3, u4 = useBinding(false)
    local v1, u14 = useBinding(a1.Position or UDim2.fromScale(0.5, 0.5))
    local u16 = useScale()
    local v2 = {
        BackgroundTransparency = 0.6,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v1,
        Size = UDim2.fromOffset(a1.Size or 100, a1.Size or 100),
        ZIndex = if not a1.FireStick then 1 else 90,
    }
    local v3 = {
        uIScale = createElement("UIScale", {
            Scale = u3:map(function(a1) -- Line: 38 -- upvalues: u16 (val)
                return (if not a1 then 1 else 1.3) * (u16 * 1.5)
            end),
        }),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
        uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5}),
        textLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 0, 1, -a1.Size / 1.3),
            Text = a1.Text or "",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Font = Enum.Font.GothamMedium,
        }),
    }
    local v4 = createElement
    local v5 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = a1.Icon or "rbxassetid://5138247197",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(a1.Size or 100, a1.Size or 100),
    }
    v3.icon = v4("ImageLabel", v5)
    if not a1.FireStick then
        v4 = createElement
        v5 = {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 10, 1, 10),
            Active = true,
            ZIndex = 10,
        }

        v5[Event.MouseButton1Down] = function() -- Line: 129 -- upvalues: a1 (val), u4 (val)
            if a1.CallBack then
                u4(true)
                a1.CallBack(true)
            end
        end

        v5[Event.MouseButton1Click] = function() -- Line: 135 -- upvalues: a1 (val), u4 (val)
            if a1.CallBack then
                u4(false)
                a1.CallBack(false)
            end
        end

        v4 = v4("ImageButton", v5)
    else
        v4 = createElement
        v5 = {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 10, 1, 10),
        }

        v5[Event.InputBegan] = function(a1_2, a2) -- Line: 84 -- upvalues: u4 (val), a1 (val)
            if a2.UserInputType == Enum.UserInputType.Touch
                or a2.UserInputType == Enum.UserInputType.MouseButton1 then
                u4(true)
                if a1.CallBack then
                    a1.CallBack(true)
                end
            end
        end

        v5[Event.InputChanged] = function(a1_2, a2) -- Line: 96 -- upvalues: a1 (val), u3 (val), u14 (val)
            if not a1.FireStick then
                return
            end
            if u3:getValue() then
                u14(UDim2.fromOffset(a2.Position.X, a2.Position.Y))
            end
        end

        v5[Event.InputEnded] = function(a1_2, a2) -- Line: 105 -- upvalues: u4 (val), u14 (val), a1 (val)
            if a2.UserInputType == Enum.UserInputType.Touch
                or a2.UserInputType == Enum.UserInputType.MouseButton1 then
                u4(false)
                u14(a1.Position or UDim2.fromScale(0.5, 0.5))
                if a1.CallBack then
                    a1.CallBack(false)
                end
            end
        end

        v4 = v4("ImageLabel", v5)
    end
    v3.button = v4
    v3.stickEnabled = createElement("Frame", {
        BackgroundTransparency = 0.6,
        BorderSizePixel = 0,
        ZIndex = -5,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset((a1.Size or 100) - 30, (a1.Size or 100) - 30),
        Visible = a1.FireStick or false,
    }, {
        uICorner1 = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
        uIStroke1 = createElement("UIStroke", {Thickness = 2, Transparency = 0.5}),
    })
    return createElement("Frame", v2, v3)
end