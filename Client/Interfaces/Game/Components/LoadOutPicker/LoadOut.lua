-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.LoadOutPicker.LoadOut
-- Decompile time: 9.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Components = ReplicatedStorage.Client.Interfaces.Components
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Troops = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useSound = require(Hooks.useSound)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local ImageLabel = require(Components.ImageLabel)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local Tooltip = require(Components.Tooltip)
local Fragment = React.Fragment
local Event = React.Event
local Spring = ReactFlow.Spring
local Tween = ReactFlow.Tween
local useAnimation = ReactFlow.useAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local useState = React.useState
local useEffect = React.useEffect
local useMemo = React.useMemo
local createElement = React.createElement
local memo = React.memo
local u64 = memo(function(a1) -- Line: 53
    -- upvalues: useMemo (val), Troops (val), useTransparencyModifier (val), createElement (val), Tooltip (val)
    -- upvalues: ImageLabel (val)
    local user = a1.user
    local tower = a1.tower
    local u4 = a1.skin or "Default"
    local Transparency = a1.Transparency
    local v1 = {tower, u4}
    local v2 = useMemo(function() -- Line: 59 -- upvalues: tower (val), Troops (upval), u4 (val)
        local v1 = tower and Troops(tower)
        if not v1 then
            warn((("LoadOutIcon: Tower %* not found"):format(tower)))
            return
        end
        local SkinData = v1.Properties.SkinData
        local v2 = SkinData and SkinData[u4]
        if v2 then
            return v2.Icon
        end
        return v1.Properties.Preview.Icon
    end, v1)
    local v3 = useTransparencyModifier(Transparency)
    local v4 = {Selectable = true}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v4.AnchorPoint = AnchorPoint
    local v5 = user and Color3.fromRGB(18, 30, 40) or Color3.fromRGB(22, 40, 18)
    v4.BackgroundColor3 = v5
    v4.BackgroundTransparency = Transparency
    v4.BorderColor3 = Color3.fromRGB(27, 42, 53)
    local Posiiton = a1.Posiiton or UDim2.fromScale(0.0706, 0.239)
    v4.Position = Posiiton
    local Size = a1.Size or UDim2.fromScale(0.177, 0.946)
    v4.Size = Size
    v4.ZIndex = a1.ZIndex or 3
    v4.LayoutOrder = a1.LayoutOrder or 0
    v5 = {
        Tooltip = createElement(Tooltip, {
            Subject = "Loadout Tower",
            Name = ("%* %* Tower"):format(a1.name, tower),
            Header = ("%* Tower"):format(tower),
        }),
    }
    local v6 = {
        BackgroundTransparency = 1,
        Selectable = true,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
    }
    v6.Image = not (typeof(v2) ~= "number") and ("rbxassetid://%*"):format(v2) or v2
    v6.ImageTransparency = Transparency
    v6.Position = UDim2.fromScale(0.5, 0.5)
    v6.ScaleType = Enum.ScaleType.Fit
    v6.Size = UDim2.fromScale(1.2, 1.2)
    v5.image = createElement(ImageLabel, v6, {uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)})})
    v6 = {
        Active = false,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = "rbxassetid://13772117423",
        Selectable = false,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local v7 = user and Color3.fromRGB(79, 158, 255) or Color3.fromRGB(47, 255, 158)
    v6.ImageColor3 = v7
    v6.ImageTransparency = v3(0.1)
    v6.Position = UDim2.fromScale(0.5, 0.5)
    v6.Size = UDim2.fromScale(1, 1)
    v5.light = createElement(ImageLabel, v6, {
        uIGradient = createElement("UIGradient", {
            Rotation = -90,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.222, 0.412),
                NumberSequenceKeypoint.new(0.579, 0.85),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
    v5.uICorner1 = createElement("UICorner", {CornerRadius = UDim.new(0, 4)})
    v5.dropShadow = createElement(ImageLabel, {
        BackgroundTransparency = 1,
        Image = "rbxassetid://18610113607",
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = v3(0.2),
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Slice,
        Size = UDim2.fromScale(1.2, 1.17),
        SliceCenter = Rect.new(8, 8, 54, 54),
    })
    v5.uIStroke = createElement("UIStroke", {Transparency = Transparency, Color = Color3.fromRGB(255, 255, 255)}, {
        uIGradient1 = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
            }),
        }),
    })
    v5.uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 0.8})
    return createElement("Frame", v4, v5)
end)
return memo(function(a1) -- Line: 177
    -- upvalues: useState (val), useSound (val), useGroupAnimation (val), useAnimation (val), Spring (val), Tween (val)
    -- upvalues: useTransparencyModifier (val), useEffect (val), createElement (val), Event (val), Fragment (val)
    -- upvalues: useMemo (val), table (val), u64 (val), ImageLabel (val), TextLabel (val)
    local u3 = a1.Visible ~= false
    local v1 = a1.LayoutOrder or 0
    local v2 = a1.name or "Offensive"
    local v3 = a1.description or "Deal lots of damage!"
    local towers = a1.towers
    if not towers then
        towers = {}
    end
    local clicked = a1.clicked
    local u17 = a1.user == true
    local u20, u21 = useState(false)
    local Click = useSound("Click")
    local v4 = (v1 - 1) * 0.04
    local v5 = TweenInfo.new(0.2, Enum.EasingStyle.Sine)
    local u84, u85 = useGroupAnimation({
        hover = useAnimation({scale = Spring({target = 1.1, speed = 30, damper = 0.5})}),
        press = useAnimation({scale = Spring({target = 0.95, speed = 30, damper = 0.5})}),
        default = useAnimation({
            transparency = Tween({target = 0, info = v5, delay = v4}),
            position = Tween({target = UDim2.fromScale(0.5, 0.5), info = v5, delay = v4}),
            scale = Tween({target = 1, info = v5, delay = v4}),
        }),
        disable = useAnimation({
            transparency = Tween({target = 1, info = v5, delay = v4}),
            position = Tween({target = UDim2.fromScale(0.5, 1), info = v5, delay = v4}),
            scale = Spring({target = 1, speed = 30, damper = 0.5}),
        }),
    }, {transparency = 1, scale = 1, position = UDim2.fromScale(0.5, 1)})
    local v6 = useTransparencyModifier(u84.transparency)
    local v7 = {u3}
    useEffect(function() -- Line: 229 -- upvalues: u85 (val), u3 (val)
        u85(if not u3 then "disable" else "default")
    end, v7)
    local v8 = createElement
    v7 = {BackgroundTransparency = 1}
    local Size = a1.Size or UDim2.fromScale(0.5, 0.3)
    v7.Size = Size
    local Position = a1.Position or UDim2.fromScale(0.472, -9.66e-08)
    v7.Position = Position
    v7.LayoutOrder = v1
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0)
    v7.AnchorPoint = AnchorPoint
    local v9 = {uIAspectRatioConstraint1 = createElement("UIAspectRatioConstraint", {AspectRatio = 3})}
    local v10 = createElement
    local v11 = {
        Size = u84.scale:map(function(a1) -- Line: 245
            return UDim2.fromScale(a1, a1)
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = u84.position,
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BackgroundTransparency = v6(0.2),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
    }
    local v12 = u17 and Color3.fromRGB(79, 158, 255) or Color3.fromRGB(89, 255, 186)
    v11.ImageColor3 = v12
    v11.ScaleType = Enum.ScaleType.Tile
    v11.Selectable = true
    v11.TileSize = UDim2.fromOffset(45, 45)
    v11.AutoButtonColor = false

    v11[Event.MouseEnter] = function() -- Line: 260 -- upvalues: u3 (val), u21 (val), u85 (val)
        if not u3 then
            return
        end
        u21(true)
        u85("hover")
    end

    v11[Event.MouseLeave] = function() -- Line: 269 -- upvalues: u3 (val), u21 (val), u85 (val)
        if not u3 then
            return
        end
        u21(false)
        u85("default")
    end

    v11[Event.MouseButton1Down] = function() -- Line: 278 -- upvalues: u3 (val), u85 (val)
        if not u3 then
            return
        end
        u85("press")
    end

    v11[Event.MouseButton1Up] = function() -- Line: 286 -- upvalues: u3 (val), u20 (val), u85 (val), Click (val), clicked (val)
        if not u3 then
            return
        end
        if not u20 then
            u85("default")
            return
        end
        u85("hover")
        Click()
        if not clicked then
            return
        end
        clicked()
    end

    v12 = {}
    local v13 = createElement
    local v14 = {
        Active = true,
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Selectable = true,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.5, 0.95),
        Size = UDim2.fromScale(1, 0.7),
    }
    local v15 = {
        uIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
        }),
    }
    local v16 = {towers}
    v15.content = createElement(Fragment, nil, useMemo(function() -- Line: 326
        -- upvalues: table (upval), towers (val), createElement (upval), u64 (upval), u84 (val), a1 (val), u17 (val)
        return table.reduce(towers, function(a1_2, a2, a3) -- Line: 327
            -- upvalues: createElement (upval), u64 (upval), u84 (upval), a1 (upval), u17 (upval)
            if a2.tower and not (a3 > 5) then
                a1_2[a2.tower] = (createElement(u64, {
                    Transparency = u84.transparency,
                    clicked = function() end,
                    tower = a2.tower,
                    skin = a2.skin,
                    LayoutOrder = a3,
                    name = a1.name,
                    user = u17,
                }))
                return a1_2
            end
            return a1_2
        end, {u17})
    end, v16))
    v12.towers = v13("Frame", v14, v15)
    v12.uICorner2 = createElement("UICorner", {CornerRadius = UDim.new(0, 4)})
    v12.uIGradient2 = createElement("UIGradient", {
        Rotation = 90,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 130, 130))),
        }),
    })
    v13 = createElement
    v14 = {Thickness = 2}
    v15 = u17 and Color3.fromRGB(79, 158, 255) or Color3.fromRGB(85, 255, 127)
    v14.Color = v15
    v14.Transparency = u84.transparency
    v12.uIStroke1 = v13("UIStroke", v14, {
        uIGradient3 = createElement("UIGradient", {
            Rotation = 75,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 1),
                (NumberSequenceKeypoint.new(1, 0)),
            }),
        }),
    })
    v12.dropShadow1 = createElement(ImageLabel, {
        BackgroundTransparency = 1,
        Image = "rbxassetid://18610113607",
        Visible = false,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        ImageTransparency = u84.transparency,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Slice,
        Size = UDim2.fromScale(1.04, 1.11),
        SliceCenter = Rect.new(8, 8, 54, 54),
    })
    v12.description = createElement(TextLabel, {
        FontWeight = "SemiBold",
        TextScaled = true,
        ZIndex = 2,
        StrokeThickness = 3,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.727, 0.035),
        Size = UDim2.fromScale(0.556, 0.2),
        Text = v3,
        TextTransparency = u84.transparency,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        StrokeColor = Color3.fromRGB(9, 9, 9),
        StrokeTransparency = u84.transparency,
    }, {
        corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        padding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0.05, 0),
            PaddingLeft = UDim.new(0.1, 0),
            PaddingRight = UDim.new(0.1, 0),
            PaddingTop = UDim.new(0.05, 0),
        }),
    })
    v13 = createElement
    v14 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = "rbxassetid://102693079462159",
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    v15 = u17 and Color3.fromRGB(79, 158, 255) or Color3.fromRGB(45, 226, 102)
    v14.ImageColor3 = v15
    v14.ImageTransparency = u84.transparency
    v14.Position = UDim2.fromScale(-0.039, 0.0585)
    v14.ScaleType = Enum.ScaleType.Slice
    v14.Size = UDim2.fromScale(0.488, 0.234)
    v14.SliceCenter = Rect.new(8, 8, 120, 24)
    v12.title = v13(ImageLabel, v14, {
        textLabel = createElement(TextLabel, {
            FontWeight = "Bold",
            TextScaled = true,
            StrokeThickness = 3,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 0.8),
            Text = v2,
            TextTransparency = u84.transparency,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            StrokeColor = Color3.fromRGB(9, 9, 9),
            StrokeTransparency = u84.transparency,
        }, {
            padding = createElement("UIPadding", {
                PaddingBottom = UDim.new(0.05, 0),
                PaddingLeft = UDim.new(0.1, 0),
                PaddingRight = UDim.new(0.1, 0),
                PaddingTop = UDim.new(0.05, 0),
            }),
        }),
    })
    v9.button = v10("ImageButton", v11, v12)
    return v8("Frame", v7, v9)
end)