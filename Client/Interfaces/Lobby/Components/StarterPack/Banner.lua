-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.StarterPack.Banner
-- Decompile time: 10.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Components = ReplicatedStorage.Client.Interfaces.Components
local React = require(ReplicatedStorage.Shared.UI.React)
local IconButton = require(Components.IconButton)
local Loader = require(Components.Loader)
local useMediaQuery = require(Hooks.useMediaQuery)
local useProductInfo = require(Hooks.useProductInfo)
local useReactBindings = require(Hooks.useReactBindings)
local useScale = require(Hooks.useScale)
local useTween = require(Hooks.useTween)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
return {
    Banner = function(a1) -- Line: 27
        -- upvalues: useState (val), useMediaQuery (val), useProductInfo (val), useScale (val), useTween (val)
        -- upvalues: useReactBindings (val), React (val), createElement (val), Loader (val), IconButton (val)
        local PriceInRobux
        local u3, u4 = useState(true)
        local v1 = a1.Visible:map(function(a1) -- Line: 30 -- upvalues: u3 (val)
            return a1 and u3
        end)
        local u13 = not useMediaQuery("large")
        local v2, v3 = useProductInfo(Enum.InfoType.Product, 1759399952)
        local v4 = useScale(1.5)
        local v5 = TweenInfo.new(0.3, Enum.EasingStyle.Sine)
        local v6, u38 = useTween(if not a1.Visible:getValue() then 0 else 1, v5, true, true)
        v5 = v6:map(function(a1) -- Line: 44
            return 1 - a1
        end)
        local v7 = (if not v2 then v3.PriceInRobux else 0) < 740
        local v8 = {v1}
        local v9 = {u3}
        useReactBindings(function(a1) -- Line: 52 -- upvalues: u38 (val)
            u38(if not a1 then 0 else 1)
        end, v8, v9)
        local createElement_2 = React.createElement
        v8 = {
            Image = "rbxassetid://9063805762",
            BorderSizePixel = 0,
            ImageColor3 = Color3.fromRGB(141, 141, 141),
            ImageTransparency = v5,
            ScaleType = Enum.ScaleType.Crop,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = v5,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = v6:map(function(a1) -- Line: 66 -- upvalues: u13 (val)
                return UDim2.new(0.5, 0, 0, (if not u13 then 32 else 0) * a1)
            end),
            Size = UDim2.new(0, 288, 0, 80),
            Visible = v6:map(function(a1) -- Line: 70
                return a1 > 0
            end),
        }
        v9 = {}
        local v10 = React.createElement("UIScale", {Scale = v4})
        local v11 = React.createElement("TextButton", {
            ZIndex = 4,
            BackgroundTransparency = 0.5,
            Visible = v2,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        }, {
            loader = createElement(Loader, {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.1),
                Visible = v2,
            }),
        })
        local v12 = React.createElement(IconButton, {
            Rotation = 5,
            ZIndex = 10,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(1, 0),
            Size = UDim2.fromOffset(30, 30),
            Color = Color3.fromRGB(255, 60, 60),
            Clicked = function() -- Line: 100 -- upvalues: u4 (val)
                return u4(false)
            end,
            Transparency = v5,
        })
        local v13 = React.createElement("TextLabel", {
            Text = "Starter Bundle!",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 5,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = v5,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0.5, 0, 0, 0),
            Size = UDim2.new(0.7, 0, 0, 24),
        }, {
            React.createElement("UIStroke", {Thickness = 6, Color = Color3.fromRGB(255, 255, 255), Transparency = v5}, {
                React.createElement("UIGradient", {
                    Rotation = -90,
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(17, 17, 17)),
                        ColorSequenceKeypoint.new(0.347, Color3.fromRGB(19, 19, 19)),
                        (ColorSequenceKeypoint.new(1, Color3.fromRGB(61, 61, 61))),
                    }),
                    Transparency = v5:map(function(a1) -- Line: 138
                        return NumberSequence.new(a1)
                    end),
                }),
            }),
        })
        local v14 = React.createElement("TextLabel", {
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 5,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = a1.Duration,
            TextColor3 = Color3.fromRGB(255, 192, 103),
            TextTransparency = v5,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0.5, 0, 0, 22),
            Size = UDim2.new(0.35, 0, 0, 20),
        }, {
            React.createElement("UIStroke", {Thickness = 6, Color = Color3.fromRGB(17, 17, 17), Transparency = v5}),
        })
        local v15 = React.createElement("ImageLabel", {
            Image = "rbxassetid://16455010681",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 3,
            ImageTransparency = v5,
            ScaleType = Enum.ScaleType.Crop,
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0.5, 0, 1, 0),
            Size = UDim2.new(1, 0, 0.9, 0),
        }, {React.createElement("UICorner")})
        local v16 = React.createElement("ImageButton", {
            Image = "rbxassetid://8429088937",
            Active = false,
            BackgroundTransparency = 1,
            ZIndex = 5,
            ImageColor3 = Color3.fromRGB(10, 220, 80),
            ImageTransparency = v5,
            Visible = not v2,
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(8, 8, 152, 32),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0.5, 64, 1, 0),
            Size = UDim2.new(0, 106, 0, 36),
        }, {
            React.createElement("UIPadding", {PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8)}),
            (React.createElement("TextLabel", {
                TextScaled = true,
                TextSize = 32,
                TextWrapped = true,
                BackgroundTransparency = 1,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Text = (" %*"):format(PriceInRobux),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextTransparency = v5,
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.new(0, 0, 0.5, 0),
                Size = UDim2.new(1, 0, 0, 20),
            }, {React.createElement("UIStroke", {Thickness = 2, Transparency = v5})})),
        })
        local v17 = React.createElement("TextLabel", {
            TextScaled = true,
            TextSize = 32,
            TextWrapped = true,
            BackgroundTransparency = 1,
            ZIndex = 5,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = (" %*"):format(740),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = v5,
            Visible = v7 and not v2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0.5, -64, 1, 0),
            Size = UDim2.new(0, 106, 0, 22),
        }, {
            React.createElement("UIStroke", {Thickness = 2, Transparency = v5}),
            React.createElement("Frame", {
                BorderSizePixel = 0,
                Rotation = -8,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BackgroundTransparency = v5,
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Size = UDim2.new(0.85, 0, 0, 4),
            }, {
                React.createElement("UIGradient", {
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 39, 39)),
                        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 39, 39))),
                    }),
                    Transparency = v5:map(function(a1) -- Line: 269
                        return NumberSequence.new({
                            NumberSequenceKeypoint.new(0, a1 * 1),
                            NumberSequenceKeypoint.new(0.2, 0),
                            NumberSequenceKeypoint.new(0.8, 0),
                            (NumberSequenceKeypoint.new(1, a1 * 1)),
                        })
                    end),
                }),
            }),
            (React.createElement("TextLabel", {
                TextScaled = true,
                TextSize = 14,
                TextWrapped = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                Text = ("%*%% OFF!"):format((math.round(PriceInRobux / 740 * 100))),
                TextColor3 = Color3.fromRGB(232, 232, 232),
                TextTransparency = v5,
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.new(0.5, 0, 0, -20),
                Size = UDim2.new(1, 0, 0, 16),
            }, {React.createElement("UIStroke", {Transparency = v5})})),
        })
        local UICorner = React.createElement("UICorner")
        local createElement_22 = React.createElement
        local v18 = {
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
            Text = "",
            TextColor3 = Color3.fromRGB(0, 0, 0),
            TextSize = 14,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 1, 0),
            ZIndex = 10,
        }
        v18[React.Event.MouseButton1Down] = a1.Clicked
        local v19 = createElement_22("TextButton", v18)
        local v20 = React.createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(255, 255, 255), Transparency = v5})
        local createElement_24 = React.createElement
        local v21 = {
            Image = "rbxassetid://9239716855",
            BackgroundTransparency = 1,
            ZIndex = -1,
            ImageTransparency = v5:map(function(a1) -- Line: 325
                return 0.2 + 0.8 * a1
            end),
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(14, 14, 64, 24),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(1, 14, 1, 14),
        }
        v9[1] = v10
        v9[2] = v11
        v9[3] = v12
        v9[4] = v13
        v9[5] = v14
        v9[6] = v15
        v9[7] = v16
        v9[8] = v17
        v9[9] = UICorner
        v9[10] = v19
        v9[11] = v20
        v9[12] = createElement_24("ImageLabel", v21)
        return createElement_2("ImageLabel", v8, v9)
    end,
}