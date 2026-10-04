-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.TowerDisplay
-- Decompile time: 22.76 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Shared = ReplicatedStorage.Shared
local Packages = ReplicatedStorage.Packages
local BaseComponents = script.Parent.Parent.BaseComponents
local Components = Interfaces.Components
local Hooks = Interfaces.Hooks
local React = require(Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local Enum = require(Shared.Modules.Enum)
local Troops = require(Shared.Modules.Asset.Handlers.Troops)
local useReactBindings = require(Hooks.useReactBindings)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local Button = require(BaseComponents.Button)
local Container = require(BaseComponents.Container)
local ImageLabel = require(BaseComponents.ImageLabel)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local TowerPreview = require(Components.Previews.TowerPreview)
local createElement = React.createElement
local joinBindings = React.joinBindings
local useEffect = React.useEffect
local useMemo = React.useMemo
local useSpring = ReactFlow.useSpring
local u78 = table.freeze({
    Enum.TargetingMode.First,
    Enum.TargetingMode.Last,
    Enum.TargetingMode.Strongest,
    Enum.TargetingMode.Weakest,
    Enum.TargetingMode.Closest,
    Enum.TargetingMode.Farthest,
    Enum.TargetingMode.Random,
})
local u79 = {
    [Enum.TargetingMode.First] = "First Enemy",
    [Enum.TargetingMode.Last] = "Last Enemy",
    [Enum.TargetingMode.Strongest] = "Strongest",
    [Enum.TargetingMode.Weakest] = "Weakest",
    [Enum.TargetingMode.Closest] = "Closest",
    [Enum.TargetingMode.Farthest] = "Farthest",
    [Enum.TargetingMode.Random] = "Random",
}
local u105 = Color3.fromRGB(162, 162, 162)
local u106 = {[Enum.SkinRarity.Common] = u105}
u106[Enum.SkinRarity.Uncommon] = (Color3.fromRGB(85, 255, 127))
u106[Enum.SkinRarity.Rare] = (Color3.fromRGB(0, 170, 255))
u106[Enum.SkinRarity.Legendary] = (Color3.fromRGB(170, 85, 255))
u106[Enum.SkinRarity.Golden] = (Color3.fromRGB(255, 223, 0))
u106[Enum.SkinRarity.Exclusive] = (Color3.fromRGB(255, 0, 0))
u106[Enum.SkinRarity.Event] = (Color3.fromRGB(255, 0, 0))
u106[Enum.SkinRarity.Ultimate] = (Color3.fromRGB(255, 67, 174))
local u161 = React.memo(function(a1) -- Line: 75
    -- upvalues: useSpring (val), useEffect (val), createElement (val), ImageLabel (val), React (val), Container (val)
    -- upvalues: TextLabel (val)
    local v1, u4 = useSpring({start = 1, speed = 30, damper = 1})
    local v2, u8 = useSpring({start = -10, speed = 30, damper = 0.9})
    local v3 = useEffect
    local v4 = {a1.Name, a1.Icon}
    v3(function() -- Line: 82 -- upvalues: u8 (val)
        u8({start = -10, target = 0})
    end, v4)
    v4 = {
        Size = v2:map(function(a1) -- Line: 87
            return UDim2.fromOffset(24 + a1, 24 + a1)
        end),
        LayoutOrder = a1.LayoutOrder or 1,
        Selectable = false,
    }
    local Icon_3 = typeof(a1.Icon) == "number" and ("rbxassetid://%*"):format(a1.Icon) or a1.Icon
    v4.Image = Icon_3
    v4.ImageTransparency = v1:map(function(a1) -- Line: 95
        return 0.4 * a1
    end)
    v4.Transparency = a1.Transparency

    v4[React.Event.MouseEnter] = function() -- Line: 101 -- upvalues: u8 (val), u4 (val)
        u8({target = 5})
        u4({target = 0})
    end

    v4[React.Event.MouseLeave] = function() -- Line: 106 -- upvalues: u8 (val), u4 (val)
        u8({target = 0})
        u4({target = 1})
    end

    return createElement(ImageLabel, v4, {
        toolTipContainer = createElement(Container, {
            CornerRadius = 3,
            StrokeThickness = 1,
            Size = UDim2.fromScale(0, 0.7),
            Position = v1:map(function(a1) -- Line: 113
                return UDim2.fromScale(1.25 - a1 / 1.5, 0.5)
            end),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = v1:map(function(a1) -- Line: 119
                return 1 - 0.5 * (1 - a1)
            end),
            AutomaticSize = Enum.AutomaticSize.X,
            StrokeColor = Color3.fromRGB(255, 255, 255),
            StrokeTransparency = v1,
            Transparency = a1.Transparency,
        }, {
            uiPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5)}),
            nameText = createElement(TextLabel, {
                TextSize = 15,
                TextScaled = false,
                FontWeight = "SemiBold",
                Size = UDim2.fromScale(0, 1),
                Position = UDim2.fromScale(0, 0),
                AnchorPoint = Vector2.new(0, 0),
                AutomaticSize = Enum.AutomaticSize.X,
                TextTransparency = v1,
                Text = a1.Name:upper(),
                Transparency = a1.Transparency,
            }),
        }),
    })
end, function(a1, a2) -- Line: 154
    local v1 = false
    if a1.Name == a2.Name then
        v1 = false
        if a1.Icon == a2.Icon then
            v1 = a1.LayoutOrder == a2.LayoutOrder
        end
    end
    return v1
end)

local function u162(a1) -- Line: 160 -- upvalues: createElement (val), u161 (val), Container (val), React (val)
    local v1 = {}
    for k, v in pairs(a1.Detections) do
        v1[v.Name] = (createElement(u161, {
            Name = v.Name,
            Icon = v.Icon,
            LayoutOrder = k,
            Transparency = a1.Transparency,
        }))
    end
    return createElement(Container, {
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        ZIndex = a1.ZIndex,
    }, {
        uiListLayout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 5),
        }),
        detectionIcons = createElement(React.Fragment, {}, v1),
    })
end

local u166 = React.memo(function(a1) -- Line: 194
    -- upvalues: u78 (val), u79 (val), useSpring (val), createElement (val), Container (val), useEffect (val)
    -- upvalues: TextLabel (val), joinBindings (val), React (val), Button (val)
    local Target = a1.Target
    local v1 = u78[1]
    for k, v in pairs(u79) do
        if v == Target then
            v1 = k
            break
        end
    end
    local u301 = table.find(u78, v1)
    local v2, u303 = useSpring({start = 0, speed = 22, damper = 0.7})
    local v3, u305 = useSpring({start = 0, speed = 25, damper = 0.7})
    local v4, u307 = useSpring({start = 0, speed = 25, damper = 0.7})
    local v5 = {}
    local v6, u308 = useSpring({start = 1, speed = 35, damper = 0.6})
    for k2, i in pairs(u78) do
        if i == v1 then
            u267 = true
        else
            local u267 = false
        end
        table.insert(v5, (createElement(Container, {
            CornerRadiusScale = 1,
            Size = UDim2.fromOffset(10, 4),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = v6:map(function(a1) -- Line: 228 -- upvalues: u267 (val)
                return 1 - (if not u267 then 0.2 else 0.9) * (1 - a1)
            end),
            Visible = a1.OwnsTowner,
            Transparency = a1.Transparency,
            LayoutOrder = k2,
        })))
    end
    local v7 = useEffect
    local v8 = {a1.CanEdit}
    v7(function() -- Line: 242 -- upvalues: a1 (val), u305 (val), u307 (val)
        if a1.CanEdit then
            u305({force = 9})
            u307({force = 9})
        end
    end, v8)
    v7 = createElement
    local v9 = Container
    v8 = {
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        ZIndex = a1.ZIndex,
    }
    local v10 = {
        titleText = createElement(TextLabel, {
            Text = "Targets:",
            FontWeight = "Bold",
            StrokeThickness = 3,
            Size = UDim2.new(1, -64, 0.5, 0),
            Position = UDim2.fromScale(0.5, 0),
            Transparency = a1.Transparency,
        }),
        selectedTargetText = createElement(TextLabel, {
            TextScaled = false,
            TextSize = 20,
            FontWeight = "Black",
            StrokeThickness = 3,
            Size = UDim2.fromScale(0, 0.65),
            Position = joinBindings({v2, v6}):map(function(a1) -- Line: 272
                return UDim2.fromScale(0.5 - a1[1], 0.53 + a1[2] / 20)
            end),
            Text = Target,
            Transparency = a1.Transparency,
        }),
        selectionPillsContainer = createElement(Container, {
            Size = UDim2.fromScale(1, 0.2),
            Position = v2:map(function(a1) -- Line: 290
                return UDim2.fromScale(0.5 - a1 / 2, 0.95)
            end),
        }, {
            uiListLayout = createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 7),
            }),
            selectionPills = createElement(React.Fragment, {}, v5),
        }),
    }
    local v11 = createElement
    local v12 = Button
    local v13 = {
        Size = UDim2.fromOffset(28, 28),
        Position = v3:map(function(a1) -- Line: 309
            return UDim2.fromScale(0.96, 0.5 + a1)
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(52, 52, 52),
        Image = "rbxassetid://6764432408",
        ImageColor3 = Color3.fromRGB(156, 156, 156),
        ImageRectSize = Vector2.new(50, 50),
        ImageRectOffset = Vector2.new(0, 500),
        CornerRadius = 8,
        StrokeColor = Color3.fromRGB(116, 116, 116),
        StrokeThickness = 2,
        AutoButtonAnimate = true,
        PressSound = "New Click",
        HoverSound = "New Hover",
        HoverSizeScale = 1.2,
        DepressSizeScale = 0.85,
        Visible = a1.CanEdit,
        Transparency = a1.Transparency,
    }

    v13[React.Event.MouseEnter] = function() -- Line: 336 -- upvalues: u308 (val)
        u308({target = 0})
    end

    v13[React.Event.MouseLeave] = function() -- Line: 340 -- upvalues: u308 (val)
        u308({target = 1})
    end

    v13[React.Event.Activated] = function() -- Line: 344 -- upvalues: u301 (val), u78 (upval), u303 (val), u305 (val), a1 (val)
        local v1 = u301 % #u78 + 1
        u303({force = 3})
        u305({force = 9})
        if a1.OnTargetChanged then
            a1.OnTargetChanged(u78[v1])
        end
    end

    v10.nextButton = v11(v12, v13)
    v11 = createElement
    v12 = Button
    v13 = {
        Size = UDim2.fromOffset(28, 28),
        Position = v4:map(function(a1) -- Line: 357
            return UDim2.fromScale(0.04, 0.5 + a1)
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(52, 52, 52),
        Image = "rbxassetid://6764432408",
        ImageColor3 = Color3.fromRGB(156, 156, 156),
        ImageRectSize = Vector2.new(50, 50),
        ImageRectOffset = Vector2.new(0, 550),
        CornerRadius = 8,
        StrokeColor = Color3.fromRGB(116, 116, 116),
        StrokeThickness = 2,
        AutoButtonAnimate = true,
        PressSound = "New Click",
        HoverSound = "New Hover",
        HoverSizeScale = 1.2,
        DepressSizeScale = 0.85,
        Visible = a1.CanEdit,
        Transparency = a1.Transparency,
    }

    v13[React.Event.MouseEnter] = function() -- Line: 384 -- upvalues: u308 (val)
        u308({target = 0})
    end

    v13[React.Event.MouseLeave] = function() -- Line: 388 -- upvalues: u308 (val)
        u308({target = 1})
    end

    v13[React.Event.Activated] = function() -- Line: 392 -- upvalues: u301 (val), u78 (upval), u303 (val), u307 (val), a1 (val)
        local v1 = (u301 - 2) % #u78 + 1
        u303({force = -3})
        u307({force = 9})
        if a1.OnTargetChanged then
            a1.OnTargetChanged(u78[v1])
        end
    end

    v10.previousButton = v11(v12, v13)
    return v7(v9, v8, v10)
end, function(a1, a2) -- Line: 403
    local v1 = false
    if a1.Target == a2.Target then
        v1 = a1.CanEdit == a2.CanEdit
    end
    return v1
end)
local u170 = React.memo(function(a1) -- Line: 407
    -- upvalues: useSpring (val), useTransparencyModifier (val), useReactBindings (val), useEffect (val)
    -- upvalues: createElement (val), TowerPreview (val)
    local v1, u4 = useSpring({start = 0, speed = 12, damper = 0.8})
    local v2, u8 = useSpring({start = 0, speed = 10, damper = 1})
    local v3 = useTransparencyModifier(a1.Transparency)(v2)
    local v4 = useReactBindings
    local v5 = {a1.Transparency}
    v4(function(a1) -- Line: 415 -- upvalues: u4 (val), u8 (val)
        if a1 < 0.99 and a1 > 0.9 then
            u4({start = 4.71238898038469, target = 0})
            u8({start = 1, target = 0})
        end
    end, v5)
    v4 = useEffect
    v5 = {a1.Name, a1.Level, a1.Skin, a1.Path}
    v4(function() -- Line: 422 -- upvalues: u4 (val), u8 (val)
        u4({start = 4.71238898038469, target = 0})
        u8({start = 1, target = 0})
    end, v5)
    return createElement(TowerPreview, {
        ClipsDescendants = true,
        shadow = false,
        icon = false,
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        ImageTransparency = v3,
        cameraOffset = CFrame.new(0, 0.2, -1.75),
        modelTransformBinding = v1:map(function(a1) -- Line: 439
            return (CFrame.Angles(0, -a1, 0)) + Vector3.new(0, -a1 / 4, 0)
        end),
        tower = a1.Name,
        skin = a1.Skin,
        level = a1.Level,
        path = a1.Path,
    })
end, function(a1, a2) -- Line: 449
    if not a2.Skin then
        return true
    end
    local v1 = false
    if a1.Name == a2.Name then
        v1 = false
        if a1.Skin == a2.Skin then
            v1 = false
            if a1.Level == a2.Level then
                v1 = a1.Path == a2.Path
            end
        end
    end
    return v1
end)
return function(a1) -- Line: 462
    -- upvalues: useMemo (val), u105 (val), Troops (val), u106 (val), createElement (val), Container (val)
    -- upvalues: ImageLabel (val), u170 (val), TextLabel (val), u162 (val), u166 (val), u79 (val)
    local TowerName = a1.TowerName
    local v1 = a1.TowerDisplayName or TowerName
    local TowerModel = a1.TowerModel
    if TowerModel then
        TowerModel = a1.TowerModel.Name
    end
    return createElement(Container, {
        Active = true,
        Selectable = false,
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
    }, {
        backDrop = createElement(Container, {
            BackgroundTransparency = 0.5,
            ZIndex = -1,
            GradientRotation = 90,
            StrokeThickness = 1,
            StrokeGradientRotation = 90,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(54, 70, 86),
            CornerRadius = a1.CornerRadius,
            GradientColor = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.32, Color3.fromRGB(62, 62, 62)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(33, 33, 33))),
            }),
            StrokeColor = Color3.fromRGB(158, 158, 158),
            StrokeGradientColor = ColorSequence.new(Color3.new(1, 1, 1)),
            StrokeGradientTransparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.4, 0.8),
                NumberSequenceKeypoint.new(0.7, 1),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
            Transparency = a1.Transparency,
        }, {
            imageGlow = createElement(ImageLabel, {
                Image = "rbxassetid://5948620849",
                AspectRatio = 1,
                Size = a1.Transparency:map(function(a1) -- Line: 519
                    return UDim2.fromScale(2, 1 - a1)
                end),
                ImageColor3 = useMemo(function() -- Line: 467 -- upvalues: TowerName (val), TowerModel (val), u105 (upval), Troops (upval), u106 (upval)
                    if TowerName and TowerModel then
                        local v1 = Troops(TowerName)
                        local v2 = v1 and v1.Properties.SkinData[TowerModel]
                        if not v2 then
                            return u105
                        end
                        return u106[v2.Rarity] or u105
                    end
                    return u105
                end, {TowerName, TowerModel}),
                Transparency = a1.Transparency,
            }),
        }),
        towerIcon = createElement(u170, {
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Transparency = a1.Transparency,
            Name = TowerName,
            Skin = TowerModel,
            Level = a1.TowerLevel,
            Path = a1.TowerPath,
        }),
        titleText = createElement(TextLabel, {
            ZIndex = 2,
            FontWeight = "Black",
            StrokeThickness = 4,
            Size = UDim2.fromOffset(200, 32),
            Position = UDim2.fromScale(0.5, -0.08),
            AnchorPoint = Vector2.new(0.5, 0),
            Transparency = a1.Transparency,
            Text = v1 or "",
        }),
        detectionList = createElement(u162, {
            ZIndex = 3,
            Size = UDim2.fromOffset(24, 24),
            Position = UDim2.fromOffset(8, 26),
            AnchorPoint = Vector2.new(0, 0),
            Detections = a1.TowerDetections,
            Transparency = a1.Transparency,
        }),
        targetControl = not a1.hideTargetingMode and createElement(u166, {
            ZIndex = 2,
            Size = UDim2.fromOffset(180, 32),
            Position = UDim2.new(0.5, 0, 1, -3),
            AnchorPoint = Vector2.new(0.5, 1),
            Transparency = a1.Transparency,
            CanEdit = a1.CanEditTower,
            Target = a1.TowerTarget,
            OnTargetChanged = function(a1_2) -- Line: 580 -- upvalues: a1 (val), u79 (upval) -- types: a1_2: number
                if a1.OnTarget then
                    a1.OnTarget(u79[a1_2])
                end
            end,
        }),
    })
end