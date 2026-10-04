-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.PromptModal
-- Decompile time: 21.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local Event = React.Event
local useEffect = React.useEffect
local useRef = React.useRef
local useState = React.useState

local function darken(a1, a2) -- Line: 58 -- types: a1: userdata, a2: number
    return a1:Lerp(Color3.new(), a2)
end

local function getText(a1) -- Line: 62 -- types: a1: string?
    return a1 or ""
end

local function PromptButton(a1) -- Line: 66
    -- upvalues: useState (val), useRef (val), useSpring (val), useEffect (val), createElement (val), Event (val)
    local u3, u4 = useState(false)
    local u7, u8 = useState(false)
    local u11 = useRef(false)
    local v1, u18 = useSpring(1, 0.6, 50, true)
    local v2 = a1.visible ~= false
    local color = a1.color or Color3.fromRGB(150, 150, 150)
    local v3 = false
    if a1.text ~= nil then
        v3 = a1.text ~= ""
    end
    local icon = a1.icon
    local v4 = {u3, u7}
    useEffect(function() -- Line: 77 -- upvalues: u7 (val), u18 (val), u3 (val)
        if u7 then
            u18(0.9)
            return
        end
        if u3 then
            u18(1.1)
            return
        end
        u18(1)
    end, v4)
    v4 = {
        BackgroundTransparency = 1,
        Name = a1.name or "Button",
        AnchorPoint = Vector2.new(0.5, 0.5),
        LayoutOrder = a1.layoutOrder,
        Position = UDim2.new(0, 0, 1, 40),
    }
    local size = a1.size or UDim2.fromOffset(200, 60)
    v4.Size = size
    v4.Visible = v2
    local v5 = {}
    local v6 = {Name = "Button", AnchorPoint = Vector2.new(0.5, 0.5), AutoButtonColor = false}
    v6.BackgroundColor3 = if not v3 then color else Color3.fromRGB(255, 255, 255)
    v6.BackgroundTransparency = if not v3 then 0 else 1
    v6.BorderSizePixel = 0
    v6.Image = "rbxassetid://8429088937"
    v6.ImageColor3 = if not u3 then color else color:Lerp(Color3.new(), 0.4)
    v6.ImageTransparency = if not v3 then 1 else 0
    v6.Position = UDim2.fromScale(0.5, 0.5)
    v6.ScaleType = Enum.ScaleType.Slice
    v6.Selectable = v2
    v6.Size = UDim2.fromScale(1, 1)
    v6.SliceCenter = Rect.new(8, 8, 152, 32)

    v6[Event.MouseButton1Down] = function() -- Line: 112 -- upvalues: u11 (val), u8 (val)
        u11.current = true
        u8(true)
    end

    v6[Event.MouseButton1Up] = function() -- Line: 117 -- upvalues: u11 (val), u8 (val), a1 (val)
        local current = u11.current
        u11.current = false
        u8(false)
        if not current then
            return
        end
        if a1.playClick then
            a1.playClick()
        end
        if a1.onClick then
            a1.onClick()
        end
    end

    v6[Event.MouseEnter] = function() -- Line: 135 -- upvalues: u4 (val)
        u4(true)
    end

    v6[Event.MouseLeave] = function() -- Line: 139 -- upvalues: u11 (val), u4 (val), u8 (val)
        u11.current = false
        u4(false)
        u8(false)
    end

    local v7 = {UIScale = createElement("UIScale", {Scale = v1})}
    v7.UICorner = createElement("UICorner", {CornerRadius = UDim.new(0, if not v3 then 6 else 0)})
    v7.UIStroke = createElement("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Color = if not u3 then color else color:Lerp(Color3.new(), 0.4),
        Thickness = if not v3 then 2 else 0,
        Transparency = if not v3 then 0.5 else 1,
    })
    v7.UIListLayout = createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0, 4),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    })
    local v8 = {
        Name = "Icon",
        BackgroundTransparency = 1,
        ImageTransparency = 0,
        LayoutOrder = 1,
        Image = icon or "",
        Size = UDim2.fromScale(0.7, 0.7),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
    }
    local v9 = false
    if icon ~= nil then
        v9 = icon ~= ""
    end
    v8.Visible = v9
    v7.Icon = createElement("ImageLabel", v8)
    v8 = {
        Name = "Value",
        BackgroundTransparency = 1,
        LayoutOrder = 3,
        TextScaled = true,
        TextTransparency = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.625, 0.5),
        RichText = a1.richText,
        Size = UDim2.new(0, 0, 0.5, 0),
        Text = a1.text or "",
    }
    local textColor = a1.textColor or Color3.fromRGB(255, 255, 255)
    v8.TextColor3 = textColor
    v8.TextXAlignment = if icon == nil then Enum.TextXAlignment.Center else if icon == "" then Enum.TextXAlignment.Center else Enum.TextXAlignment.Left
    v8.Visible = v3
    v9 = {}
    local v10 = {Thickness = 2}
    local textStrokeColor = a1.textStrokeColor or Color3.new()
    v10.Color = textStrokeColor
    v10.LineJoinMode = Enum.LineJoinMode.Miter
    v10.Transparency = a1.textStrokeTransparency or 0
    v9.UIStroke = createElement("UIStroke", v10)
    v7.Value = createElement("TextLabel", v8, v9)
    v5.Button = createElement("ImageButton", v6, v7)
    return createElement("Frame", v4, v5)
end

local function PromptStat(a1) -- Line: 213 -- upvalues: createElement (val) -- types: a1: table
    local v1 = {
        BackgroundTransparency = 0.8,
        Name = a1.name or "Stat",
        AnchorPoint = a1.anchorPoint,
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.new(),
        LayoutOrder = a1.layoutOrder,
    }
    local position = a1.position or UDim2.new(0.5, 0, 1, -94)
    v1.Position = position
    local size = a1.size or UDim2.fromOffset(0, 30)
    v1.Size = size
    return createElement("Frame", v1, {
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)}),
        Icon = createElement("ImageLabel", {
            Name = "Icon",
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = a1.icon or "",
            Position = UDim2.new(0, 16, 0.5, 0),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromOffset(24, 24),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
        }),
        Value = createElement("TextLabel", {
            Name = "Value",
            BackgroundTransparency = 1,
            TextSize = 20,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0, 0.5),
            AutomaticSize = Enum.AutomaticSize.X,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.new(0, 0, 0.5, 0),
            Size = UDim2.new(0, 0, 0.5, 0),
            Text = a1.value or "",
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            UIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 34), PaddingRight = UDim.new(0, 8)}),
        }),
    })
end

local function getMaxButtonWidth(a1) -- Line: 264 -- types: a1: table
    local size
    local v1 = 0
    for i, v in ipairs(a1) do
        size = v.size
        v1 = math.max(v1, if not size then 160 else size.X.Offset)
    end
    return v1
end

local function createPrompt(a1) -- Line: 275
    -- upvalues: getMaxButtonWidth (val), createElement (val), PromptStat (val), PromptButton (val), React (val)
    local key, key_2
    local stats = a1.stats or {}
    local actions = a1.actions or {}
    local v1 = {}
    local v2 = {}
    local v3 = getMaxButtonWidth(actions)
    local v4 = a1
    for i, v in ipairs(stats) do
        key_2 = v.key or ("stat%*"):format(i)
        v1[key_2] = (createElement(PromptStat, v))
    end
    for i2, i3 in ipairs(actions) do
        key = i3.key or ("button%*"):format(i2)
        if not (i3.size ~= nil) then
            v2[key] = (createElement("Frame", {
                BackgroundTransparency = 1,
                Name = i3.name or key,
                AnchorPoint = Vector2.new(0.5, 0),
                LayoutOrder = i3.layoutOrder or i2,
                Position = UDim2.fromScale(0.5, 0),
                Size = UDim2.fromOffset(v3, 44),
                Visible = i3.visible ~= false,
            }, {
                UIListLayout = createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                }),
                Button = createElement(PromptButton, {
                    layoutOrder = 1,
                    name = "Button",
                    visible = true,
                    color = i3.color,
                    icon = i3.icon,
                    onClick = i3.onClick,
                    playClick = v4.playClick,
                    richText = i3.richText,
                    size = UDim2.fromOffset(160, 44),
                    text = i3.text,
                    textColor = i3.textColor,
                    textStrokeColor = i3.textStrokeColor,
                    textStrokeTransparency = i3.textStrokeTransparency,
                }),
            }))
        else
            v2[key] = (createElement(PromptButton, {
                color = i3.color,
                icon = i3.icon,
                layoutOrder = i3.layoutOrder or i2,
                name = i3.name or key,
                onClick = i3.onClick,
                playClick = v4.playClick,
                richText = i3.richText,
                size = i3.size,
                text = i3.text,
                textColor = i3.textColor,
                textStrokeColor = i3.textStrokeColor,
                textStrokeTransparency = i3.textStrokeTransparency,
                visible = i3.visible,
            }))
        end
    end
    local v5 = {Name = "Prompt", BackgroundTransparency = 1, ZIndex = 2}
    local anchorPoint = v4.anchorPoint or Vector2.new(0.5, 0.5)
    v5.AnchorPoint = anchorPoint
    v5.AutomaticSize = Enum.AutomaticSize.XY
    v5.LayoutOrder = v4.layoutOrder
    local position = v4.position or UDim2.fromScale(0.5, 0.5)
    v5.Position = position
    local size = v4.size or UDim2.fromOffset(0, 80)
    v5.Size = size
    v5.Visible = v4.visible ~= false
    local v6 = {
        UIScale = createElement("UIScale", {Scale = v4.scale or 1}),
        Background = createElement("Frame", {
            Name = "Background",
            BackgroundTransparency = 0.05,
            ZIndex = 0,
            BackgroundColor3 = Color3.fromRGB(36, 36, 36),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Size = UDim2.fromScale(1, 1),
        }, {UICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)})}),
    }
    local v7 = {
        Name = "Content",
        BackgroundTransparency = 1,
        ZIndex = 1,
        AutomaticSize = Enum.AutomaticSize.XY,
        Size = UDim2.fromScale(0, 1),
    }
    local v8 = {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, 16),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        UIPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 8),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 8),
        }),
    }
    local v9 = {
        Name = "Icon",
        BackgroundTransparency = 1,
        LayoutOrder = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        Image = v4.icon or "",
        Position = UDim2.new(0.5, 0, 0, 32),
        Size = UDim2.fromOffset(64, 64),
    }
    local v10 = false
    if v4.icon ~= nil then
        v10 = v4.icon ~= ""
    end
    v9.Visible = v10
    v8.Icon = createElement("ImageLabel", v9)
    v8.Subject = createElement("TextLabel", {
        Name = "Subject",
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        RichText = true,
        TextSize = 34,
        AnchorPoint = Vector2.new(0.5, 0),
        AutomaticSize = Enum.AutomaticSize.X,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.new(0.5, 0, 0, 114),
        Size = UDim2.fromOffset(0, 20),
        Text = v4.subject or "",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Visible = v4.subject ~= nil,
    }, {
        UIPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 16),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 16),
        }),
        UIStroke = createElement("UIStroke", {Thickness = 3, Transparency = 0.8, Color = Color3.new()}),
    })
    v8.Description = createElement("TextLabel", {
        Name = "Description",
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        RichText = true,
        TextSize = 20,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0.5, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Position = UDim2.new(0.5, 0, 0, 144),
        Size = UDim2.fromOffset(280, 0),
        Text = v4.description or "",
        TextColor3 = Color3.fromRGB(163, 163, 163),
        Visible = v4.description ~= nil,
    })
    v8.Stats = createElement("Frame", {
        Name = "Stats",
        BackgroundTransparency = 1,
        LayoutOrder = 3,
        AutomaticSize = Enum.AutomaticSize.XY,
        Size = UDim2.fromScale(0, 0),
        Visible = next(v1) ~= nil,
    }, {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        Stats = createElement(React.Fragment, nil, v1),
    })
    v8.Buttons = createElement("Frame", {
        Name = "Buttons",
        BackgroundTransparency = 1,
        LayoutOrder = 4,
        AnchorPoint = Vector2.new(0, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
        Size = UDim2.fromScale(0, 0),
        Visible = next(v2) ~= nil,
    }, {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        UIPadding = createElement("UIPadding", {PaddingBottom = UDim.new(0, -8)}),
        Buttons = createElement(React.Fragment, nil, v2),
    })
    v6.Content = createElement("Frame", v7, v8)
    v6.DropShadow = createElement("ImageLabel", {
        Name = "DropShadow",
        BackgroundTransparency = 1,
        Image = "rbxassetid://9239716855",
        ImageTransparency = 0.2,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Slice,
        Size = UDim2.new(1, 14, 1, 14),
        SliceCenter = Rect.new(14, 14, 64, 24),
    })
    return createElement("Frame", v5, v6)
end

return function(a1) -- Line: 512 -- upvalues: createPrompt (val), createElement (val) -- types: a1: table
    if a1.visible == false then
        return nil
    end
    local v1 = createPrompt(a1)
    if a1.noBackground then
        return v1
    end
    return createElement("Frame", {
        Name = "Background",
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        ZIndex = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(2, 2),
    }, {
        UIGradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new()),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 0, 0))),
            }),
        }),
        InputSink = createElement("TextButton", {
            Name = "InputSink",
            BackgroundTransparency = 1,
            Text = "",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }),
        Prompt = v1,
    })
end