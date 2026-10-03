-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.LobbyModifierSelector
-- Decompile time: 5.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GlowButton = require(ReplicatedStorage.Client.Interfaces.Components.GlowButton)
local IconButton = require(ReplicatedStorage.Client.Interfaces.Components.IconButton)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local ModifiersFrame = require(script.ModifiersFrame)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local SelectedModifiers = require(script.SelectedModifiers)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local memo = React.memo
local createElement = React.createElement
local useEffect = React.useEffect
local useSpring = ReactFlow.useSpring
return memo(function(a1) -- Line: 28
    -- upvalues: useSpring (val), React (val), useTransparencyModifier (val), useEffect (val), Maid (val)
    -- upvalues: createElement (val), ModifiersFrame (val), SelectedModifiers (val), GlowButton (val), IconButton (val)
    local v1, u4 = useSpring({target = 0, start = 2, damper = 0.6, speed = 12})
    local v2, u8 = useSpring({target = 0, start = 0, damper = 0.8, speed = 8})
    local v3, u12 = useSpring({target = 1, start = 1, damper = 1, speed = 7})
    local u16 = React.useRef(nil)
    local u20 = React.useRef(nil)
    local v4 = useTransparencyModifier(v3)
    local v5 = {u16}
    useEffect(function() -- Line: 55 -- upvalues: Maid (upval), u16 (val), u20 (val)
        local u2 = Maid.new()
        if u16.current then
            u2:Mark((u16.current.Changed:Connect(function() -- Line: 59 -- upvalues: u16 (upval), u20 (upval)
                local v1
                local v2 = string.lower(u16.current.Text)
                for i, j in u20.current:GetChildren() do
                    if j:IsA("GuiObject") then
                        v1 = not not string.find(string.lower(j.Name), v2, 1, true)
                        j.Visible = v1
                    end
                end
            end)))
        end
        return function() -- Line: 72 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, v5)
    local v6 = useEffect
    v5 = {a1.visible}
    v6(function() -- Line: 77 -- upvalues: a1 (val), u4 (val), u8 (val), u12 (val)
        if a1.visible then
            u4({target = 0, speed = 12})
            u8({target = 1})
            u12({target = 0, speed = 7})
            return
        end
        u4({target = 2})
        u8({target = 0})
        u12({target = 1, speed = 30})
    end, v5)
    v6 = {}
    for i, j in a1.modifiers do
        if a1.selectedModifiers[j.name] then
            v6[j.name] = (createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = ("rbxassetid://%*"):format(j.icon),
                ScaleType = Enum.ScaleType.Fit,
            }))
        end
    end
    local v7 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 0.950782),
    }
    local v8 = {
        uIAspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 1.86883}),
    }
    local createElement_2 = React.createElement
    local v9 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.new(),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.322564, 0.801485),
    }
    local v10 = {
        backgroundFrame = createElement("Frame", {
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Position = v1:map(function(a1) -- Line: 122
                return UDim2.fromScale(0.5, a1 + 0.5)
            end),
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = v4(0),
        }, {
            uICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.02, 0)}),
            uIStroke = React.createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(53, 53, 53)}),
            uIScale = React.createElement("UIScale", {
                Scale = v2:map(function(a1) -- Line: 138
                    return a1
                end),
            }),
        }),
        title = React.createElement("TextLabel", {
            BackgroundTransparency = 1,
            Text = "Game Modifiers",
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Position = v1:map(function(a1) -- Line: 152
                return UDim2.fromScale(0.406101 - a1 / 10, 0.0312769)
            end),
            Size = UDim2.fromScale(0.770598, 0.0486027),
            TextColor3 = Color3.new(1, 1, 1),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTransparency = v4(0),
        }),
    }
    local v11 = {}
    local modifiers_2 = a1.modifiers or {}
    v11.modifiers = modifiers_2
    v11.visible = a1.visible
    v11.holderRef = u20
    v10.modifiers = createElement(ModifiersFrame, v11)
    v10.selectedModifiers = createElement(SelectedModifiers, {modifiers = v6, total = #a1.modifiers, visible = a1.visible})
    v10.bar = createElement("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0, 0.0935601),
        Size = UDim2.fromScale(1, 0.0668287),
    }, {
        uIListLayout = React.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0.013, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }, {
        search = createElement("Frame", {
            LayoutOrder = 3,
            BackgroundTransparency = 1,
            BackgroundColor3 = Color3.new(),
            Position = UDim2.fromScale(0.553425, 0.209091),
            Size = UDim2.fromScale(0.93, 0.581818),
            Visible = v4(0):map(function(a1) -- Line: 195
                return a1 < 1
            end),
        }, {
            main = createElement("Frame", {
                LayoutOrder = 3,
                BackgroundColor3 = Color3.new(),
                Position = v1:map(function(a1) -- Line: 201
                    return UDim2.fromScale(0.5, 0.5 - a1 / 1.85)
                end),
                BackgroundTransparency = v4(0),
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
            }, {
                uICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.15, 0)}),
                uIStroke = React.createElement("UIStroke", {Thickness = 2, Color = Color3.new(1, 1, 1), Transparency = v4(0)}),
                selection = React.createElement("Frame", {
                    BackgroundColor3 = Color3.fromRGB(124, 124, 124),
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = v4(0.55),
                }, {
                    uICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.15, 0)}),
                    uIGradient = React.createElement("UIGradient", {
                        Rotation = -90,
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0.4375),
                            NumberSequenceKeypoint.new(0.268171, 0.725),
                            (NumberSequenceKeypoint.new(1, 1)),
                        }),
                    }),
                }),
                textButton = React.createElement("TextButton", {
                    BackgroundTransparency = 1,
                    Text = "",
                    TextScaled = true,
                    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
                    Size = UDim2.fromScale(1, 1),
                    TextColor3 = Color3.new(),
                }),
                textLabel = React.createElement("TextBox", {
                    Active = false,
                    BackgroundTransparency = 1,
                    CursorPosition = -1,
                    PlaceholderText = "[Search]",
                    Selectable = false,
                    Text = "",
                    TextScaled = true,
                    ZIndex = 2,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                    PlaceholderColor3 = Color3.new(1, 1, 1),
                    TextTransparency = v4(0),
                    Size = UDim2.fromScale(1, 1),
                    TextColor3 = Color3.new(1, 1, 1),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ref = u16,
                }, {
                    uIPadding = React.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0.1, 0),
                        PaddingLeft = UDim.new(0.03, 0),
                        PaddingRight = UDim.new(0.1, 0),
                        PaddingTop = UDim.new(0.1, 0),
                    }),
                }),
                imageLabel = React.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://107096977214246",
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.fromScale(1, 0.5),
                    ScaleType = Enum.ScaleType.Fit,
                    Size = UDim2.fromScale(0.133047, 1),
                    ImageTransparency = v4(0),
                }),
            }),
        }),
    })
    v10.totalRewards = createElement("TextLabel", {
        BackgroundTransparency = 1,
        RichText = true,
        TextScaled = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
        Position = v1:map(function(a1) -- Line: 297
            return UDim2.fromScale(0.330516 + a1 / 10, 0.95192)
        end),
        Size = UDim2.fromScale(0.6, 0.035),
        Text = ("Total Rewards: <b><font color=\"rgb(255,125,0)\">%*X</font></b>"):format(a1.totalRewards),
        TextColor3 = Color3.new(1, 1, 1),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTransparency = v4(0),
    })
    v10.ApplyModifiers = createElement(GlowButton, {
        text = "Vote For Modifiers",
        color = Color3.fromRGB(83, 255, 83),
        Size = UDim2.fromScale(0.35, 0.055),
        Position = v1:map(function(a1) -- Line: 313
            return UDim2.fromScale(0.785, 0.95 + a1 / 10)
        end),
        transparency = v3,
        clicked = a1.onApply,
    })
    v10.close = createElement(IconButton, {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.945, 0.04),
        Color = Color3.fromRGB(255, 74, 74),
        Clicked = a1.onClose,
        Transparency = v3,
    }, {uIScale = React.createElement("UIScale", {Scale = 0.8})})
    v8.background = createElement_2("Frame", v9, v10)
    return createElement("Frame", v7, v8)
end)