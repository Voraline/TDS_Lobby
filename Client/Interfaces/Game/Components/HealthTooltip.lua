-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.HealthTooltip
-- Decompile time: 13.13 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useEffect = React.useEffect
local useBinding = React.useBinding

local function formatHealth(a1) -- Line: 15 -- upvalues: Comma (val) -- types: a1: number
    return Comma((math.round(a1)))
end

local function HealthBar(a1) -- Line: 19
    -- upvalues: useSpring (val), useEffect (val), createElement (val), Comma (val), formatHealth (val)
    local u2 = a1.MaxHealth or 1000
    local u4 = a1.Shield or 0
    local u7 = u4 + (a1.Health or u2)
    local v1, u14 = useSpring(u7 / u2, 1, 20, true)
    local v2, u21 = useSpring(u4 / u2, 1, 20, true)
    local v3 = {u4, u2}
    useEffect(function() -- Line: 27 -- upvalues: u21 (val), u4 (val), u2 (val)
        u21(u4 / u2)
    end, v3)
    v3 = {u7, u2}
    useEffect(function() -- Line: 31 -- upvalues: u14 (val), u7 (val), u2 (val)
        u14(u7 / u2)
    end, v3)
    return createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(44, 44, 44),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.new(1, 0, 1, -26),
    }, {
        uIStroke = createElement("UIStroke", {
            Thickness = 2,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(255, 255, 255),
            LineJoinMode = Enum.LineJoinMode.Bevel,
        }),
        bar = createElement("ImageLabel", {
            Image = "rbxassetid://300134974",
            ImageTransparency = 0.8,
            BorderSizePixel = 0,
            ZIndex = 2,
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ScaleType = Enum.ScaleType.Tile,
            SliceCenter = Rect.new(0, 256, 0, 256),
            TileSize = UDim2.fromOffset(90, 90),
            BackgroundColor3 = Color3.fromRGB(18, 245, 45),
            Size = UDim2.fromScale(1, 1),
        }, {
            uIGradient = createElement("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
                }),
                Offset = v1:map(function(a1) -- Line: 67
                    return Vector2.new(math.clamp(a1, 0, 1) - 0.5, 0)
                end),
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(0.5, 0),
                    NumberSequenceKeypoint.new(0.505, 1),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        }),
        shadow = createElement("ImageLabel", {
            Image = "rbxassetid://405124116",
            ImageTransparency = 0.6,
            BackgroundTransparency = 1,
            ZIndex = -1,
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(12, 12, 115, 115),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 28, 1, 28),
        }),
        thresholds = createElement("Frame", {
            BackgroundTransparency = 1,
            ZIndex = 5,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(1, 1),
        }, {
            uIListLayout = createElement("UIListLayout", {
                Padding = UDim.new(0.333, 0),
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            frame = createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.fromRGB(44, 44, 44),
                BorderColor3 = Color3.fromRGB(44, 44, 44),
                Size = UDim2.new(0, 2, 1, 0),
            }),
            frame1 = createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.fromRGB(44, 44, 44),
                BorderColor3 = Color3.fromRGB(44, 44, 44),
                Size = UDim2.new(0, 2, 1, 0),
            }),
        }),
        icon = createElement("ImageLabel", {
            Image = "rbxassetid://5945850925",
            BackgroundTransparency = 1,
            ZIndex = 10,
            ImageColor3 = Color3.fromRGB(44, 44, 44),
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0, 4, 0.5, 0),
            Size = UDim2.fromOffset(12, 12),
        }),
        healthCount = createElement("TextLabel", {
            TextSize = 14,
            TextStrokeTransparency = 0,
            BackgroundTransparency = 1,
            ZIndex = 10,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = string.format("%s / %s", Comma((math.round(u7))), formatHealth(u2)),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Right,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Size = UDim2.new(1, -4, 1, 0),
        }),
        shield = createElement("ImageLabel", {
            Image = "rbxassetid://300134974",
            ImageTransparency = 0.8,
            BorderSizePixel = 0,
            ZIndex = 3,
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ScaleType = Enum.ScaleType.Tile,
            SliceCenter = Rect.new(0, 256, 0, 256),
            TileSize = UDim2.fromOffset(90, 90),
            BackgroundColor3 = Color3.fromRGB(255, 213, 0),
            Size = UDim2.fromScale(1, 1),
        }, {
            uIGradient1 = createElement("UIGradient", {
                Rotation = 180,
                Offset = v2:map(function(a1) -- Line: 165
                    return Vector2.new(0.5 - math.clamp(a1, 0, 1), 0)
                end),
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
                }),
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(0.5, 0),
                    NumberSequenceKeypoint.new(0.505, 1),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        }),
    })
end

local function Timer(a1) -- Line: 186
    -- upvalues: useBinding (val), useEffect (val), RunService (val), GameState (val), createElement (val)
    local TimeLeft = a1.TimeLeft
    local MaxTimeLeft = a1.MaxTimeLeft
    local u5, u6 = useBinding(TimeLeft)
    local v1 = {TimeLeft}
    useEffect(function() -- Line: 192 -- upvalues: TimeLeft (val), u6 (val), RunService (upval), GameState (upval), u5 (val)
        if not TimeLeft then
            return
        end
        u6(TimeLeft)
        local u9 = RunService.Heartbeat:Connect(function(a1) -- Line: 199 -- upvalues: RunService (upval), GameState (upval), u6 (upval), u5 (upval)
            if not RunService:IsRunning() or GameState.GameStarted then
                local v1 = a1 * GameState.TimeScale
                u6(u5:getValue() - v1)
            end
        end)
        return function() -- Line: 206 -- upvalues: u9 (val)
            u9:Disconnect()
        end
    end, v1)
    return createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0),
        Size = u5:map(function(a1) -- Line: 213
            return UDim2.new(1, 0, 0, 5)
        end),
        Position = UDim2.new(0, 0, 1, 8),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }, {
        uiCorner = createElement("UICorner", {CornerRadius = UDim.new(0, 0)}),
        uiStroke = createElement("UIStroke", {
            Thickness = 1,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(0, 0, 0),
        }),
        gradient = createElement("UIGradient", {
            Offset = u5:map(function(a1) -- Line: 230 -- upvalues: MaxTimeLeft (val)
                return Vector2.new(math.clamp(a1 / MaxTimeLeft, 0, 1) - 0.5, 0)
            end),
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 136, 0)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 136, 0)),
                ColorSequenceKeypoint.new(0.501, Color3.fromRGB(44, 44, 44)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(44, 44, 44))),
            }),
        }),
    })
end

local function Extras(a1) -- Line: 244 -- upvalues: createElement (val), React (val)
    local Icon, v1
    local v2 = {}
    local v3 = a1.padding or 8
    local v4 = pairs
    local Data = a1.Data or {}
    for k, v in v4(Data) do
        Icon = v.Icon
        v1 = createElement("Frame", {
            BackgroundTransparency = 0.4,
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.fromOffset(0, 20),
            LayoutOrder = k,
        }, {
            uIPadding = createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 4),
                PaddingLeft = UDim.new(0, 4),
                PaddingRight = UDim.new(0, 4),
                PaddingTop = UDim.new(0, 4),
            }),
            imageLabel = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = if type(Icon) ~= "string" then ("rbxassetid://%*"):format(Icon) else Icon,
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0, 0.5),
                Size = UDim2.fromOffset(16, 16),
            }),
            textLabel = createElement("TextLabel", {
                TextSize = 16,
                BackgroundTransparency = 1,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Text = v.Text or "",
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Left,
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromOffset(22, 0),
                Size = UDim2.fromScale(0, 1),
            }),
            borderStroke = createElement("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Color = Color3.fromRGB(255, 255, 255),
                LineJoinMode = Enum.LineJoinMode.Bevel,
            }),
        })
        v2[tostring(k)] = v1
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0, 0, 1, v3),
        Size = UDim2.new(1, 0, 0, 20),
    }, {
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 8),
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        content = React.createElement(React.Fragment, {}, v2),
    })
end

local function HealthInfo(a1) -- Line: 318 -- upvalues: createElement (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromOffset(-16, if not a1.NoHealth then 0 else 20),
        Size = UDim2.fromOffset(200, 20),
    }, {
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 4),
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        textLabel = createElement("TextLabel", {
            TextScaled = true,
            TextSize = 20,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = a1.Name or "Hidden Boss",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromOffset(0, 22),
        }, {uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.2})}),
    })
end

return function(a1) -- Line: 358
    -- upvalues: createElement (val), useScale (val), HealthBar (val), HealthInfo (val), Timer (val), Extras (val)
    local TimeLeft = a1.TimeLeft
    local MaxTimeLeft = a1.MaxTimeLeft
    local v1 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v1.Position = Position
    local Size = a1.Size or UDim2.fromOffset(224, 44)
    v1.Size = Size
    local v2 = {
        scale = createElement("UIScale", {Scale = useScale(1.2)}),
        healthBar = if a1.NoHealth then nil else createElement(HealthBar, {Health = a1.Health, MaxHealth = a1.MaxHealth, Shield = a1.Shield}),
    }
    local v3 = {Name = a1.Name}
    local Extras_2 = a1.Extras or {}
    v3.Extras = Extras_2
    v3.NoHealth = a1.NoHealth
    v2.healthInfo = createElement(HealthInfo, v3)
    v2.timer = TimeLeft and MaxTimeLeft and createElement(Timer, {TimeLeft = TimeLeft, MaxTimeLeft = MaxTimeLeft})
    v3 = {}
    local Extras_3 = a1.Extras or {}
    v3.Data = Extras_3
    v3.padding = if not TimeLeft then 8 else 20
    v2.extras = createElement(Extras, v3)
    return createElement("Frame", v1, v2)
end