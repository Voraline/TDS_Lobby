-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.TowerUpgradeButton
-- Decompile time: 20.10 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Shared = ReplicatedStorage.Shared
local Packages = ReplicatedStorage.Packages
local Components = Interfaces.Game.Components
local BaseComponents = script.Parent.Parent.BaseComponents
local Hooks = Interfaces.Hooks
local React = require(Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local Comma = require(Shared.UI.Comma)
require(Shared.Modules.Utils.table)
local useReactBindings = require(Hooks.useReactBindings)
local Binding = require(Components.Binding)
local Button = require(BaseComponents.Button)
local Container = require(BaseComponents.Container)
local ImageLabel = require(BaseComponents.ImageLabel)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
local useEffect = React.useEffect
local useRef = React.useRef
local useBinding = React.useBinding
local joinBindings = React.joinBindings
local useSpring = ReactFlow.useSpring

local function isBinding(a1) -- Line: 44
    local v1 = false
    if typeof(a1) == "table" then
        v1 = a1["$$typeof"] == 60132
    end
    return v1
end

local u63 = React.memo(function(a1) -- Line: 49
    -- upvalues: useSpring (val), useEffect (val), createElement (val), Container (val), ImageLabel (val)
    -- upvalues: joinBindings (val)
    local v1, u4 = useSpring({start = 1, speed = 15, damper = 0.8})
    local v2, u8 = useSpring({start = 0, speed = 15, damper = 0.7})
    local v3 = useEffect
    local v4 = {a1.IsUnlocked}
    v3(function() -- Line: 55 -- upvalues: a1 (val), u4 (val), u8 (val)
        if a1.IsUnlocked then
            u4({start = 0, target = 1})
            u8({force = 5})
        end
    end, v4)
    v4 = {
        Size = v2:map(function(a1_2) -- Line: 63 -- upvalues: a1 (val)
            return a1.Size + UDim2.fromScale(a1_2 / 2, a1_2 * 2.5)
        end),
        BackgroundTransparency = if not a1.IsUnlocked then 0.5 else 1,
        BackgroundColor3 = Color3.fromRGB(31, 31, 31),
        LayoutOrder = a1.LayoutOrder,
        Transparency = a1.Transparency,
    }
    local v5 = {}
    local v6 = {
        ZIndex = -1,
        Image = "rbxassetid://18610319939",
        ImageTransparency = 0.5,
        Size = UDim2.new(1, 16, 1, 16),
        ImageColor3 = Color3.fromRGB(62, 255, 78),
    }
    local CanAfford = a1.CanAfford
    local v7 = false
    if typeof(CanAfford) == "table" then
        v7 = CanAfford["$$typeof"] == 60132
    end
    local v8 = if not v7 then a1.IsHovering:map(function(a1_2) -- Line: 85 -- upvalues: a1 (val)
        return a1.IsUnlocked and a1.CanAfford and a1_2
    end) else (joinBindings({a1.CanAfford, a1.IsHovering})):map(function(a1_2) -- Line: 82 -- upvalues: a1 (val)
        return a1.IsUnlocked and a1_2[1] and a1_2[2]
    end)
    v6.Visible = v8
    v6.ScaleType = Enum.ScaleType.Slice
    v6.SliceCenter = Rect.new(7, 12, 54, 50)
    v6.Transparency = a1.Transparency
    v5.dropShadow = createElement(ImageLabel, v6)
    v5.fillFrame = createElement(Container, {
        ZIndex = 2,
        BackgroundColor3 = a1.BackgroundColor3,
        BackgroundTransparency = v1:map(function(a1_2) -- Line: 97 -- upvalues: a1 (val)
            if not a1.IsUnlocked then
                return 1
            end
            return 1 - a1_2
        end),
        CornerRadius = a1.CornerRadius,
        StrokeColor = not a1.IsUnlocked and Color3.fromRGB(177, 177, 177),
        StrokeThickness = not a1.IsUnlocked and 1,
        Transparency = a1.Transparency,
    })
    v5.outlineFrame = createElement(Container, {
        ZIndex = 1,
        StrokeThickness = 3,
        Size = v1:map(function(a1) -- Line: 115
            return UDim2.fromScale(a1 * 1.5, a1 * 1.85)
        end),
        CornerRadius = a1.CornerRadius + 1,
        StrokeColor = Color3.fromRGB(255, 255, 255),
        StrokeTransparency = v2:map(function(a1) -- Line: 125
            return 1 - a1 * 5
        end),
        Visible = v1:map(function(a1) -- Line: 128
            return a1 < 0.99
        end),
        Transparency = a1.Transparency,
    })
    return createElement(Container, v4, v5)
end, function(a1, a2) -- Line: 135
    local v1 = false
    if a1.IsUnlocked == a2.IsUnlocked then
        v1 = false
        if a1.CanAfford == a2.CanAfford then
            v1 = false
            if a1.IsHovering == a2.IsHovering then
                v1 = false
                if a1.Size == a2.Size then
                    v1 = false
                    if a1.LayoutOrder == a2.LayoutOrder then
                        v1 = a1.BackgroundColor3 == a2.BackgroundColor3
                    end
                end
            end
        end
    end
    return v1
end)
return React.memo(function(a1) -- Line: 145
    -- upvalues: useBinding (val), useEffect (val), useSpring (val), useReactBindings (val), useRef (val)
    -- upvalues: createElement (val), u63 (val), Button (val), React (val), ImageLabel (val), Container (val)
    -- upvalues: Binding (val), TextLabel (val), Comma (val)
    local new, u334, u350, v1, v2
    local u606 = a1.MaxLevel or 2
    local u599 = a1.Level or 1
    local v3, u12 = useBinding(a1.CanAfford == true)
    local CanAfford_2 = a1.CanAfford
    local v4 = false
    if typeof(CanAfford_2) == "table" then
        v4 = CanAfford_2["$$typeof"] == 60132
    end
    local CanAfford = if not v4 then v3 else a1.CanAfford
    v4 = CanAfford:map(function(a1) -- Line: 153 -- upvalues: u599 (val), u606 (val)
        return a1 or u599 == u606
    end)
    local v5 = v4:map(function(a1_2) -- Line: 156 -- upvalues: a1 (val)
        return a1_2 and not a1.IsLocked
    end)

    local function getCanAfford() -- Line: 160 -- upvalues: u599 (val), u606 (val), CanAfford (val)
        local v1 = true
        if u599 ~= u606 then
            v1 = CanAfford:getValue() == true
        end
        return v1
    end

    local v6 = useEffect
    local v7 = {a1.CanAfford}
    v6(function() -- Line: 164 -- upvalues: a1 (val), u12 (val)
        local CanAfford = a1.CanAfford
        local v1 = false
        if typeof(CanAfford) == "table" then
            v1 = CanAfford["$$typeof"] == 60132
        end
        if not v1 then
            u12(a1.CanAfford == true)
        end
    end, v7)
    local u851 = u606 <= u599
    local v8, u62 = useSpring({speed = 25, damper = 0.7, start = if not u851 then 0 else 1})
    local v9 = {u851}
    useEffect(function() -- Line: 175 -- upvalues: u851 (val), u62 (val)
        if u851 then
            u62({target = 1})
            return
        end
        u62({start = 0, target = 0})
    end, v9)
    local u71, u326 = useBinding(false)
    v9, u334 = useSpring({start = 0, speed = 25, damper = 0.7})
    local v10, u80 = useSpring({start = 0, speed = 20, damper = 0.7})
    local v11, u84 = useSpring({start = 0, speed = 20, damper = 0.7})
    local v12 = useEffect
    local v13 = {u599, a1.Name}
    v12(function() -- Line: 192 -- upvalues: u80 (val), u84 (val)
        u80({start = 0, target = 1})
        u84({force = 5})
    end, v13)
    v13 = {v11}
    useReactBindings(function(a1) -- Line: 197 -- upvalues: u71 (val), u334 (val)
        local v1 = a1 > 0.01
        local v2 = u71:getValue()
        if v1 and not v2 then
            u334({target = 1})
            return
        end
        if not v1 and not v2 then
            u334({target = 0})
        end
    end, v13)
    local u106 = useRef(v4:getValue())
    local v14 = {v4}
    useReactBindings(function(a1) -- Line: 210 -- upvalues: u106 (val), u84 (val)
        if u106.current == a1 then
            return
        end
        u106.current = a1
        u84({force = 2})
    end, v14)
    local v15, u115 = useSpring({start = 0, speed = 25, damper = 0.7})
    v14, u350 = useSpring({start = 0, speed = 25, damper = 0.4})
    local v16 = useEffect
    local v17 = {a1.IsLocked}
    v16(function() -- Line: 224 -- upvalues: u115 (val), a1 (val)
        u115({target = if not a1.IsLocked then 0 else 1})
    end, v17)
    v16 = table.create(u606)
    for i = 1, u606 do
        v1 = {}
        new = UDim2.new
        v2 = if a1.IsVertical then -2 else 0
        v1.Size = new(1 / u606, -8, 1, v2)
        v1.CornerRadius = if a1.IsVertical then 3 else 4
        v1.BackgroundColor3 = v5:map(function(a1_2) -- Line: 237 -- upvalues: a1 (val)
            if a1.IsLocked then
                return Color3.fromRGB(144, 144, 144)
            end
            return a1_2 and Color3.fromRGB(57, 255, 87) or Color3.fromRGB(40, 40, 40)
        end)
        v1.LayoutOrder = i
        v1.IsUnlocked = i <= u599
        v1.IsHovering = u71
        v1.CanAfford = v5
        v1.Transparency = a1.Transparency
        table.insert(v16, (createElement(u63, v1)))
    end
    local u231 = UDim2.fromOffset(0, if not u851 then 0 else 14)
    local Position_2 = not (type(a1.Position) ~= "table") and a1.Position or useBinding(a1.Position)
    local v18 = {
        Size = a1.Size + u231,
        Position = Position_2:map(function(a1) -- Line: 263 -- upvalues: u231 (val)
            return a1 - u231
        end),
        AnchorPoint = a1.AnchorPoint,
        ZIndex = a1.ZIndex,
        BackgroundTransparency = 0,
        BackgroundColor3 = v5:map(function(a1_2) -- Line: 271 -- upvalues: a1 (val)
            return a1_2 and Color3.fromRGB(43, 132, 71) or not a1.IsLocked and Color3.fromRGB(172, 172, 172) or Color3.fromRGB(90, 90, 90)
        end),
        StrokeColor = Color3.fromRGB(255, 255, 255),
        StrokeThickness = 1,
        StrokeTransparency = v9:map(function(a1) -- Line: 279
            return 0.3 - a1 / 5
        end),
        GradientRotation = 90,
    }
    v18.GradientColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 130, 130))),
    })
    v18.CornerRadius = 4
    v18.Transparency = a1.Transparency
    v18.Visible = a1.Transparency:map(function(a1) -- Line: 292
        return a1 < 0.99
    end)
    v18.AutoButtonAnimate = true
    v18.HoverSound = "New Upgrade Hover"
    v18.HoverSizeScale = 1.065
    v18.DepressSizeScale = 0.9
    v18.SpotlightRefName = a1.SpotlightRefName

    v18[React.Event.MouseEnter] = function() -- Line: 304 -- upvalues: u326 (val), u334 (val), a1 (val)
        u326(true)
        u334({target = 1})
        if a1.OnHover then
            a1.OnHover(true)
        end
    end

    v18[React.Event.MouseLeave] = function() -- Line: 313 -- upvalues: u326 (val), u334 (val), a1 (val)
        u326(false)
        u334({target = 0})
        if a1.OnHover then
            a1.OnHover(false)
        end
    end

    v18[React.Event.Activated] = function() -- Line: 322 -- upvalues: a1 (val), u350 (val), u599 (val), u606 (val), CanAfford (val)
        if a1.IsLocked then
            u350({force = 10})
            return
        end
        if a1.OnUpgrade then
            local OnUpgrade = a1.OnUpgrade
            local v1 = true
            if u599 ~= u606 then
                v1 = CanAfford:getValue() == true
            end
            OnUpgrade(v1)
        end
    end

    local v19 = {
        dropShadow = createElement(ImageLabel, {
            ZIndex = -1,
            Image = "rbxassetid://18610113607",
            Size = UDim2.new(1, 16, 1, 16),
            ImageColor3 = v5:map(function(a1_2) -- Line: 335 -- upvalues: a1 (val)
                return a1_2 and Color3.fromRGB(85, 255, 82) or not a1.IsLocked and Color3.fromRGB(255, 99, 99) or Color3.fromRGB(177, 177, 177)
            end),
            ImageTransparency = v9:map(function(a1) -- Line: 340
                return 1 - a1
            end),
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(8, 8, 54, 54),
            Transparency = a1.Transparency,
        }),
    }
    local v20 = {
        ZIndex = 2,
        BackgroundTransparency = 0,
        CornerRadius = 4,
        StrokeThickness = 1,
        StrokeGradientRotation = 90,
    }
    local v21 = not a1.IsVertical and UDim2.fromOffset(80, 80) or UDim2.fromOffset(75, 75)
    v20.Size = v21
    v20.Position = UDim2.fromOffset(32, 24)
    v20.BackgroundColor3 = v5:map(function(a1) -- Line: 356
        return a1 and Color3.fromRGB(22, 40, 18) or Color3.fromRGB(43, 43, 43)
    end)
    v20.StrokeColor = Color3.new(1, 1, 1)
    v20.StrokeGradientColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
        (ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))),
    })
    v20.Scale = v11:map(function(a1) -- Line: 369
        return 1 + a1 * 2
    end)
    v20.Visible = v8:map(function(a1) -- Line: 373
        return a1 < 0.01
    end)
    v20.Transparency = a1.Transparency
    v21 = {
        dropShadow = createElement(ImageLabel, {
            ZIndex = -2,
            Image = "rbxassetid://18610113607",
            ImageTransparency = 0.2,
            Size = UDim2.new(1, 16, 1, 16),
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(8, 8, 54, 54),
            Transparency = a1.Transparency,
        }),
    }
    v21.iconLight = createElement(ImageLabel, {
        ZIndex = -1,
        CornerRadius = 6,
        Image = "rbxassetid://13772117423",
        GradientRotation = -90,
        ImageColor3 = v5:map(function(a1) -- Line: 398
            return a1 and Color3.fromRGB(47, 255, 158) or Color3.fromRGB(199, 199, 199)
        end),
        GradientTransparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.2, 0.4),
            NumberSequenceKeypoint.new(0.6, 0.85),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
        Transparency = a1.Transparency,
    })
    v2 = {CornerRadius = 6, Size = UDim2.new(1, -2, 1, -2)}
    local Icon_3 = typeof(a1.Icon) == "number" and ("rbxassetid://%*"):format(a1.Icon) or a1.Icon
    v2.Image = Icon_3
    v2.Transparency = a1.Transparency
    v21.iconImage = createElement(ImageLabel, v2)
    v2 = {
        DisableOnGameState = true,
        Size = UDim2.fromOffset(24, 24),
        Position = UDim2.new(1, -8, 1, -8),
        Transparency = a1.Transparency,
    }
    local v22 = false
    if a1.IsPreview ~= true then
        v22 = not a1.IsLocked
    end
    v2.Visible = v22
    v2.DefaultText = if a1.IsBottomPath then "T" else "E"
    v2.Binding = if a1.IsBottomPath then "Upgrade Bottom Path" else "Upgrade Tower"

    function v2.Callback() -- Line: 434 -- upvalues: a1 (val), u599 (val), u606 (val), CanAfford (val)
        if a1.IsActive and not a1.IsLocked and a1.OnUpgrade then
            local OnUpgrade = a1.OnUpgrade
            local v1 = true
            if u599 ~= u606 then
                v1 = CanAfford:getValue() == true
            end
            OnUpgrade(v1)
        end
    end

    v21.keybindFrame = createElement(Binding, v2)
    v21.lockedFrame = createElement(Container, {
        BackgroundTransparency = 0.4,
        CornerRadius = 6,
        ZIndex = 2,
        BackgroundColor3 = Color3.fromRGB(45, 45, 45),
        Visible = a1.IsLocked,
        Transparency = a1.Transparency,
    }, {
        lockIcon = createElement(ImageLabel, {
            Image = "rbxassetid://1197061307",
            Rotation = 10,
            Size = v15:map(function(a1) -- Line: 452
                return UDim2.fromScale(0.7 * a1, 0.7 * a1)
            end),
            Position = v14:map(function(a1) -- Line: 455
                return UDim2.fromScale(0.5 + a1, 0.5)
            end),
            ScaleType = Enum.ScaleType.Fit,
            Transparency = a1.Transparency,
            ImageTransparency = v15:map(function(a1) -- Line: 465
                return 1 - a1
            end),
        }),
    })
    v19.upgradeIconFrame = createElement(Container, v20, v21)
    v20 = {FontWeight = "ExtraBold", StrokeThickness = 3}
    v21 = not a1.IsVertical and UDim2.new(1, -90, 0, 28) or UDim2.new(1, -85, 0, 26)
    v20.Size = v21
    v20.Position = v11:map(function(a1_2) -- Line: 474 -- upvalues: a1 (val)
        local v1 = not a1.IsVertical and UDim2.fromOffset(82, 11) or UDim2.fromOffset(77, 11)
        return v1 + UDim2.fromScale(a1_2 * 0.8, 0)
    end)
    v20.AnchorPoint = Vector2.new(0, 0)
    v20.Text = a1.Name or "N/A"
    v20.TextXAlignment = Enum.TextXAlignment.Left
    v20.StrokeColor = Color3.fromRGB(0, 0, 0)
    v20.Visible = not u851
    v20.Transparency = a1.Transparency
    v19.upgradeNameText = createElement(TextLabel, v20, {
        uiPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8)}),
    })
    v20 = {
        TextScaled = false,
        TextSize = 24,
        FontWeight = "Bold",
        StrokeThickness = 2,
        Size = UDim2.new(1, -106, 0, 32),
        Position = v11:map(function(a1_2) -- Line: 500 -- upvalues: a1 (val)
            local v1 = not a1.IsVertical and UDim2.fromOffset(90, 37) or UDim2.fromOffset(85, 34)
            return v1 + UDim2.fromScale(a1_2, 0)
        end),
        AnchorPoint = Vector2.new(0, 0),
    }
    v21 = a1.Cost and ("$%*%*"):format(Comma((math.floor(a1.Cost))), a1.CostModifierText or "") or ". . ."
    v20.Text = v21
    v20.TextColor3 = v5:map(function(a1_2) -- Line: 510 -- upvalues: a1 (val)
        return a1_2 and Color3.fromRGB(71, 255, 15) or not a1.IsLocked and Color3.fromRGB(255, 96, 96) or Color3.fromRGB(204, 204, 204)
    end)
    v20.RichText = a1.CostModifierText ~= nil
    v20.TextXAlignment = Enum.TextXAlignment.Left
    v20.StrokeColor = Color3.fromRGB(0, 0, 0)
    v20.Visible = not u851
    v20.Transparency = a1.Transparency
    v19.upgradeCostText = createElement(TextLabel, v20)
    v19.upgradeProgressFrame = createElement(Container, {
        Size = UDim2.new(1, -16, 0, 12),
        Position = UDim2.new(0.5, 0, 1, -8),
        AnchorPoint = Vector2.new(0.5, 1),
    }, {
        uiListLayout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8),
        }),
        progressPills = createElement(React.Fragment, {}, v16),
    })
    v19.maxedUpgradeText = createElement(TextLabel, {
        Text = "Fully Upgraded!",
        FontWeight = "ExtraBold",
        StrokeThickness = 3,
        Size = v8:map(function(a1_2) -- Line: 549 -- upvalues: a1 (val)
            local v1 = (1 - a1_2) / 3
            return UDim2.new(1 + v1, 0, v1, if not a1.Horizontal then 28 else 32)
        end),
        Position = UDim2.fromScale(0.5, 0.4),
        StrokeColor = Color3.fromRGB(0, 0, 0),
        TextTransparency = v8:map(function(a1) -- Line: 561
            return 1 - a1
        end),
        StrokeTransparency = v8:map(function(a1) -- Line: 564
            return 1 - a1
        end),
        Transparency = a1.Transparency,
        Visible = v8:map(function(a1) -- Line: 569
            return a1 > 0.01
        end),
    }, {})
    v19.overlayFrame = createElement(Container, {
        ZIndex = -1,
        CornerRadius = 5,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0, 0.5),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = v5:map(function(a1) -- Line: 579
            return a1 and Color3.fromRGB(132, 248, 96) or Color3.fromRGB(255, 99, 99)
        end),
        BackgroundTransparency = v11:map(function(a1) -- Line: 582
            return 1 - a1 * 8
        end),
        GradientTransparency = v10:map(function(a1) -- Line: 589
            return NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(math.clamp(a1 * 1.1, 0.01, 0.99), 0, 1),
                (NumberSequenceKeypoint.new(1, 1)),
            })
        end),
        Transparency = a1.Transparency,
        Visible = v10:map(function(a1) -- Line: 598
            return a1 < 0.99
        end),
    })
    v19.children = createElement(React.Fragment, {}, a1.children)
    return createElement(Button, v18, v19)
end, function(a1, a2) -- Line: 678
    local v1 = false
    if a1.CanAfford == a2.CanAfford then
        v1 = false
        if a1.Level == a2.Level then
            v1 = false
            if a1.MaxLevel == a2.MaxLevel then
                v1 = false
                if a1.Cost == a2.Cost then
                    v1 = false
                    if a1.CostModifierText == a2.CostModifierText then
                        v1 = false
                        if a1.Name == a2.Name then
                            v1 = false
                            if a1.Icon == a2.Icon then
                                v1 = false
                                if a1.IsLocked == a2.IsLocked then
                                    v1 = false
                                    if a1.IsActive == a2.IsActive then
                                        v1 = a1.OnUpgrade == a2.OnUpgrade
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return v1
end)