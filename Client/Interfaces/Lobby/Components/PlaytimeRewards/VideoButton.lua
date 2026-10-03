-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PlaytimeRewards.VideoButton
-- Decompile time: 3.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local memo = React.memo
local createElement = React.createElement
return memo(function(a1) -- Line: 22
    -- upvalues: useSpring (val), React (val), useSound (val), createElement (val)
    local v1, u7 = useSpring(1, 0.6, 40, true)
    local u11, u12 = React.useState(false)
    local Click = useSound("Click")
    local useEffect = React.useEffect
    local v2 = {u11, a1.state}
    useEffect(function() -- Line: 27 -- upvalues: a1 (val), u7 (val), u12 (val), u11 (val)
        if a1.state ~= "claim" then
            u7(1)
            u12(false)
            return
        end
        if u11 then
            u7(1.1)
            return
        end
        u7(1)
    end, v2)
    v2 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Visible = true,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local Size = a1.Size or UDim2.fromOffset(200, 200)
    v2.Size = Size
    v2.Position = a1.Position
    v2.AnchorPoint = a1.AnchorPoint
    v2.LayoutOrder = a1.LayoutOrder
    local v3 = {
        uiStroke = React.createElement("UIStroke", {
            Thickness = 1,
            Color = Color3.fromRGB(255, 255, 255),
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        }),
    }
    v3.uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)})
    v3.uIScale = createElement("UIScale", {Scale = v1})
    v3.imageLabel = createElement("ImageLabel", {
        Image = "rbxassetid://128891223142774",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(-0.2, -0.2),
        Size = UDim2.fromScale(0.5, 0.5),
    })
    local v4 = {
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        LayoutOrder = a1.LayoutOrder,
        Text = "",
    }

    v4[React.Event.MouseEnter] = function() -- Line: 85 -- upvalues: a1 (val), u12 (val)
        if a1.state ~= "claim" then
            return
        end
        u12(true)
    end

    v4[React.Event.MouseLeave] = function() -- Line: 92 -- upvalues: a1 (val), u12 (val)
        if a1.state ~= "claim" then
            return
        end
        u12(false)
    end

    v4[React.Event.Activated] = function() -- Line: 99 -- upvalues: a1 (val), u7 (val), Click (val)
        if a1.state ~= "claim" then
            return
        end
        u7(0.85)
        Click()
        task.spawn(a1.onActivated)
        task.delay(0.03, function() -- Line: 109 -- upvalues: u7 (upval)
            u7(1.1)
        end)
    end

    local v5 = {UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.052, 0)})}
    local v6 = {Thickness = 3, ApplyStrokeMode = Enum.ApplyStrokeMode.Border}
    local v7 = if a1.state ~= "claim" then Color3.fromRGB(146, 146, 146) else Color3.fromRGB(62, 244, 69)
    v6.Color = v7
    v5.UIStroke = createElement("UIStroke", v6)
    v5.image = createElement("ImageLabel", {
        Active = false,
        Selectable = false,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Image = a1.image,
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromScale(1, 1),
        ScaleType = Enum.ScaleType.Crop,
        Position = UDim2.fromScale(0.5, 0.5),
    })
    local v8 = createElement
    v6 = {
        BackgroundTransparency = 1,
        Image = "rbxassetid://102274897797890",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        ImageColor3 = Color3.fromRGB(146, 146, 146),
    }
    v5.glow = v8("ImageLabel", v6)
    v5.Check = if a1.state ~= "claimed" then nil else createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://15303988233",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.603, 0.603),
        ImageColor3 = Color3.fromRGB(255, 255, 255),
    })
    if a1.state == "claimed" then
        v8 = nil
    else
        v6 = {BorderSizePixel = 0, AnchorPoint = Vector2.new(0.5, 1)}
        v7 = if a1.state ~= "locked" then Color3.fromRGB(80, 255, 86) else Color3.fromRGB(146, 146, 146)
        v6.BackgroundColor3 = v7
        v6.Position = UDim2.fromScale(0.5, 1)
        v6.Size = UDim2.fromScale(1, 0.25)
        v7 = {
            UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.062, 0)}),
            UIGradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 130, 130))),
                }),
            }),
        }
        local v9 = {Thickness = 2}
        local v10 = if a1.state ~= "claim" then Color3.fromRGB(146, 146, 146) else Color3.fromRGB(62, 244, 69)
        v9.Color = v10
        v7.UIStroke = createElement("UIStroke", v9)
        v7.TextLabel = createElement("TextLabel", {
            TextScaled = true,
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Text = if a1.state ~= "locked" then "CLAIM" else "LOCKED",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(0.7, 0.81),
            Position = UDim2.fromScale(0.5, 0.5),
        }, {
            UIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(52, 52, 52)}),
        })
        v8 = createElement("Frame", v6, v7)
    end
    v5.AdVideoButton = v8
    v3.button = createElement("TextButton", v4, v5)
    return createElement("Frame", v2, v3)
end)