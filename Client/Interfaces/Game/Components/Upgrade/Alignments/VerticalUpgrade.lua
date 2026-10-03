-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Upgrade.Alignments.VerticalUpgrade
-- Decompile time: 24.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Shared.UI.Comma)
local React = require(ReplicatedStorage.Shared.UI.React)
local Event = React.Event
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local useOneShot = require(ReplicatedStorage.Client.Interfaces.Hooks.useOneShot)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local Components = ReplicatedStorage.Client.Interfaces.Game.Components
local Components_2 = Components.Parent.Parent.Components
local Binding = require(Components.Binding)
local Button = require(Components_2.Button)
local ItemPreview = require(Components_2.ItemPreview)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local Ability = require(Components.Ability)
local TowerAmmo = require(Components.TowerAmmo)
local TowerOptions = require(Components.TowerOptions)
local Unit = require(Components.Unit)

local function List(a1) -- Line: 32 -- upvalues: useState (val), createElement (val), React (val)
    local IconPosition, IconSize, Icon_2, ItemSize, Label, Name, TextAlign, TextSize, v1, v2, v3, v4
    local Items = a1.Items or useState({})
    local v5 = a1.Padding or 8
    local v6 = {}
    local v7 = a1
    for i, v in ipairs(Items) do
        Name = v.Name or tostring(i)
        if not v.Label then
            v1 = {
                TextScaled = true,
                TextSize = 14,
                TextWrapped = true,
                BackgroundTransparency = 1,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Text = v.Text or "",
                TextColor3 = Color3.fromRGB(255, 255, 255),
            }
            TextAlign = v7.TextAlign or Enum.TextXAlignment.Left
            v1.TextXAlignment = TextAlign
            v1.TextYAlignment = Enum.TextYAlignment.Center
            v1.AnchorPoint = Vector2.new(1, 0.5)
            v1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            v1.Position = UDim2.fromScale(1, 0.5)
            TextSize = v7.TextSize or UDim2.new(1, -30, 0.7, 0)
            v1.Size = TextSize
            Label = createElement("TextLabel", v1, {
                uiStroke = createElement("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                    Thickness = v7.TextStroke or 0,
                    Color = Color3.new(),
                }),
            })
        else
            Label = v.Label
        end
        v1 = {BackgroundTransparency = 1}
        v1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ItemSize = v7.ItemSize or UDim2.new(1, 0, 0.25, -4)
        v1.Size = ItemSize
        v1.LayoutOrder = i
        v2 = {}
        if v.Icon == nil then
            v3 = nil
        else
            v4 = {BackgroundTransparency = 1}
            Icon_2 = if type(v.Icon) ~= "string" then ("rbxassetid://%*"):format(v.Icon or 0) else v.Icon
            v4.Image = Icon_2
            v4.ScaleType = Enum.ScaleType.Fit
            v4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            IconSize = v7.IconSize or UDim2.fromOffset(20, 20)
            v4.Size = IconSize
            IconPosition = v7.IconPosition or UDim2.fromScale(0, 0.5)
            v4.Position = IconPosition
            v4.AnchorPoint = Vector2.new(0, 0.5)
            v3 = createElement("ImageLabel", v4)
        end
        v2.icon = v3
        v2.label = Label
        v6[Name] = (createElement("Frame", v1, v2))
    end
    local v8 = {}
    local BackgroundColor = v7.BackgroundColor or Color3.fromRGB(255, 255, 255)
    v8.BackgroundColor3 = BackgroundColor
    v8.BackgroundTransparency = v7.BackgroundTransparency or 1
    local AnchorPoint = v7.AnchorPoint or Vector2.new(0.5, 1)
    v8.AnchorPoint = AnchorPoint
    local Position = v7.Position or UDim2.new(0.5, 0, 1, -16)
    v8.Position = Position
    local Size = v7.Size or UDim2.new(1, -16, 0, 142)
    v8.Size = Size
    v8.ZIndex = v7.ZIndex or 1
    local AutomaticSize = v7.AutomaticSize or Enum.AutomaticSize.None
    v8.AutomaticSize = AutomaticSize
    v8.Visible = v7.Visible
    local v9 = {}
    local v10 = {Padding = UDim.new(0, v7.ItemPadding or 4)}
    local HorizontalAlignment = v7.HorizontalAlignment or Enum.HorizontalAlignment.Center
    v10.HorizontalAlignment = HorizontalAlignment
    v10.SortOrder = Enum.SortOrder.LayoutOrder
    v9.uIListLayout = createElement("UIListLayout", v10)
    v9.components = React.createElement(React.Fragment, {}, v6)
    v9.children = React.createElement(React.Fragment, {}, v7.children or {})
    v9.uICorner = createElement("UICorner")
    v9.uIStroke = createElement("UIStroke", {Color = Color3.fromRGB(219, 164, 164), Thickness = v7.Stroke or 0})
    v9.uIPadding = createElement("UIPadding", {
        PaddingBottom = UDim.new(0, v5),
        PaddingLeft = UDim.new(0, v5),
        PaddingRight = UDim.new(0, v5),
        PaddingTop = UDim.new(0, v5),
    })
    return createElement("Frame", v8, v9)
end

local function HoverImageButton(a1) -- Line: 133
    -- upvalues: useSpring (val), useState (val), createElement (val), Event (val), React (val)
    local v1, u7 = useSpring(1, 0.6, 60, true)
    local u10, u11 = useState(false)
    local v2 = {
        Image = a1.Image,
        ImageColor3 = a1.ImageColor3,
        ImageRectOffset = a1.ImageRectOffset,
        ImageRectSize = a1.ImageRectSize,
        AnchorPoint = a1.AnchorPoint,
        BackgroundColor3 = a1.BackgroundColor3,
        LayoutOrder = a1.LayoutOrder,
        Position = a1.Position,
        Size = a1.Size,
        ZIndex = a1.ZIndex,
    }

    v2[Event.MouseEnter] = function() -- Line: 149 -- upvalues: u7 (val)
        u7(1.1)
    end

    v2[Event.MouseLeave] = function() -- Line: 153 -- upvalues: u7 (val)
        u7(1)
    end

    v2[Event.MouseButton1Down] = function() -- Line: 157 -- upvalues: u7 (val), u11 (val)
        u7(0.9)
        u11(true)
    end

    v2[Event.MouseButton1Up] = function() -- Line: 162 -- upvalues: u10 (val), u7 (val), u11 (val), a1 (val)
        local v1 = u10
        u7(1.1)
        u11(false)
        if v1 and a1.Clicked then
            a1.Clicked()
        end
    end

    return createElement("ImageButton", v2, {
        uiScale = createElement("UIScale", {Scale = v1}),
        children = React.createElement(React.Fragment, {}, a1.children or {}),
    })
end

local function PathLocked(a1) -- Line: 181 -- upvalues: createElement (val)
    return createElement("Frame", {
        BackgroundTransparency = 0.65,
        ZIndex = 10,
        BackgroundColor3 = Color3.fromRGB(150, 0, 0),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = a1.Position,
        Size = a1.Size,
        Visible = a1.Visible,
    }, {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
        textLabel = createElement("TextLabel", {
            Text = "Upgrades Locked!",
            TextSize = 32,
            TextWrapped = true,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(1, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(1, 0.5),
            Size = UDim2.fromScale(0.66, 0.9),
        }, {uIStroke = createElement("UIStroke", {Thickness = 4})}),
        lock = createElement("ImageLabel", {
            Image = "rbxassetid://1197061307",
            BackgroundTransparency = 1,
            Rotation = 5,
            ZIndex = 0,
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.25, 0.45),
            Size = UDim2.fromScale(0.7, 0.7),
        }, {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint")}),
    })
end

local function UpgradeSlot(a1) -- Line: 233 -- upvalues: useOneShot (val), useEffect (val), createElement (val)
    local u3 = a1.Enabled == true
    local u7 = a1.Animatable == true
    local v1 = a1.MaxUpgrades or 4
    local v2, u21 = useOneShot(0, 1, TweenInfo.new(0.3, Enum.EasingStyle.Sine), 1, true)
    local v3 = v2:map(function(a1) -- Line: 241 -- upvalues: u3 (val)
        return a1 * (if not u3 then 0 else 1)
    end)
    local v4 = {u3}
    useEffect(function() -- Line: 245 -- upvalues: u3 (val), u7 (val), u21 (val)
        if u3 and u7 then
            u21()
        end
    end, v4)
    v4 = {
        BackgroundTransparency = 1,
        ZIndex = 9,
        Size = UDim2.new(1 / v1, -8, 1, 0),
        LayoutOrder = a1.LayoutOrder,
    }
    local v5 = {}
    local v6 = {
        Image = "rbxassetid://300134974",
        ImageTransparency = 0.8,
        ZIndex = 1,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        ScaleType = Enum.ScaleType.Tile,
        SliceCenter = Rect.new(0, 256, 0, 256),
        TileSize = UDim2.fromOffset(90, 90),
    }
    local v7 = u3 and Color3.fromRGB(109, 243, 72) or Color3.fromRGB(97, 97, 97)
    v6.BackgroundColor3 = v7
    v6.Position = UDim2.fromScale(0.5, 0.5)
    v7 = {}
    local v8 = {Thickness = 2}
    local v9 = u3 and Color3.fromRGB(54, 162, 0) or Color3.fromRGB(65, 65, 65)
    v8.Color = v9
    v7.uiStroke = createElement("UIStroke", v8)
    v7.uiCorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)})
    v5.image = createElement("ImageLabel", v6, v7)
    v5.particle = createElement("Frame", {
        ZIndex = 2,
        Visible = u3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = v3:map(function(a1) -- Line: 284
            return UDim2.new(1, 20 * a1, 1, 20 * a1)
        end),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BackgroundTransparency = v3,
        Position = UDim2.fromScale(0.5, 0.5),
        LayoutOrder = a1.LayoutOrder,
    }, {
        uiStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.new(1, 1, 1), Transparency = v3}),
        uiCorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
    })
    return createElement("Frame", v4, v5)
end

local function Upgrade(a1) -- Line: 306
    -- upvalues: createElement (val), UpgradeSlot (val), React (val), Button (val), Comma (val), Binding (val)
    local v1
    local v2 = a1.Level or 1
    local v3 = a1.MaxLevel or 4
    local v4 = a1.LevelLocked or false
    local v5 = {}
    for i = 1, v3 do
        v1 = "slot" .. i
        v5[v1] = (createElement(UpgradeSlot, {
            Enabled = i <= v2,
            MaxUpgrades = v3,
            Animatable = a1.Animatable,
            LayoutOrder = i,
        }))
    end
    local v6 = {
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromOffset(0, 8),
        Size = UDim2.new(1, 0, 0, 170),
    }
    v1 = {}
    v1.upgradeName = createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = a1.UpgradeName or "Unknown...",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromOffset(100, 45),
        Size = UDim2.new(1, -110, 0, 35),
    }, {uIStroke7 = createElement("UIStroke", {Thickness = 3})})
    v1.iconBorder = createElement("Frame", {
        BackgroundTransparency = 1,
        Selectable = true,
        ZIndex = 3,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromOffset(10, 8),
        Size = UDim2.fromOffset(80, 80),
    }, {
        uICorner4 = createElement("UICorner"),
        uIStroke4 = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(147, 147, 147)}),
        upgradeIcon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Selectable = true,
            ZIndex = 3,
            Image = "rbxassetid://" .. (a1.Icon or 0),
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }),
    })
    v1.progress = createElement("Frame", {
        Active = true,
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Selectable = true,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.5, 0, 1, -2),
        Size = UDim2.new(1, -8, 0, 16),
    }, {
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 8),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        slots = React.createElement(React.Fragment, {}, v5),
    })
    v1.level = createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = "Lv. " .. math.min(v2 + 1, v3),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromOffset(100, 20),
        Size = UDim2.new(1, -110, 0, 25),
    }, {uIStroke8 = createElement("UIStroke", {Thickness = 3})})
    local v7 = {
        Active = true,
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Selectable = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.5, 0, 0, 120),
        Size = UDim2.new(1, -70, 0, 44),
    }
    local v8 = {}
    local v9 = {SpotlightRefName = "upgrade", LayoutOrder = 1, Visible = a1.Visible}
    local v10 = a1.Owns and not a1.Locked and Color3.fromRGB(109, 243, 72) or Color3.fromRGB(150, 150, 150)
    v9.Color = v10
    v9.AnchorPoint = Vector2.new(0.5, 0.5)
    v9.Position = UDim2.fromScale(0.5, 1)
    v9.Size = UDim2.new(1, 0, 0, 44)
    v9.Text = if not v4 then "Upgrade: $" .. Comma(a1.Cost or 0) else "Fully Upgraded"
    v9.Clicked = a1.OnUpgrade
    v8.button = createElement(Button, v9)
    v8.bind = createElement(Binding, {
        LayoutOrder = 2,
        Binding = "Upgrade Tower",
        DisableOnGameState = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(1, -8, 1, -8),
        Size = UDim2.fromOffset(32, 32),
        Callback = a1.OnUpgrade,
    })
    v8.uIListLayout1 = createElement("UIListLayout", {
        Padding = UDim.new(0, 12),
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    })
    v1.buy = createElement("Frame", v7, v8)
    return createElement("Frame", v6, v1)
end

local function Extras(a1) -- Line: 468
    -- upvalues: createElement (val), Ability (val), TowerOptions (val), Unit (val), React (val)
    local DisplayName, DisplayName_2, GlobalOptionsSync, TowerDisplayName, interval, started, v1, v2, v3, v4, v5
    local Abilities = a1.Abilities or {}
    local Options = a1.Options or {}
    local Units = a1.Units or {}
    local v6 = a1.Level or 0
    local Callback = a1.Callback
    if not Callback then
        function Callback(a1) end
    end
    local OnOption = a1.OnOption
    if not OnOption then
        function OnOption(a1, a2, a3) end
    end
    local v7 = {}
    local v8 = {}
    local v9 = {}
    local v10 = {}
    local v11 = 1
    local v12 = a1
    for i, v in ipairs(Abilities) do
        if not (v6 < (v.Level or 0)) then
            v2 = tostring(v11)
            v3 = {BackgroundTransparency = 1, Size = UDim2.fromOffset(80, 112), LayoutOrder = v11}
            v4 = {}
            v5 = {
                DisableOnGameState = true,
                Size = UDim2.fromOffset(80, 80),
                Position = UDim2.new(0.5, 0, 0, 40),
                AnchorPoint = Vector2.new(0.5, 0.5),
            }
            DisplayName = v.DisplayName or v.Name
            v5.Name = DisplayName
            DisplayName_2 = v.DisplayName or v.Name
            v5.DisplayName = DisplayName_2
            TowerDisplayName = v12.TowerDisplayName or v12.TowerName
            v5.TowerName = TowerDisplayName
            v5.Icon = v.Icon
            v5.CoolDown = v.Debounce or 0
            v5.Price = v.Price
            v5.Model = v12.Model

            function v5.Callback() -- Line: 510 -- upvalues: Callback (val), v (val)
                return Callback(v.Name)
            end

            v4.ability = createElement(Ability, v5)
            v7[v2] = (createElement("Frame", v3, v4))
            v11 = v11 + 1
        end
    end
    for i2, i3 in ipairs(Options) do
        v1 = i3.Name or ""
        started = nil
        GlobalOptionsSync = nil
        interval = nil
        if i3.QueueName then
            v3 = nil
            for i4, j in ipairs(Units) do
                if j.id == string.gsub(i3.QueueName, " ", "_") then
                    v3 = j
                    v10[j] = true
                    break
                end
            end
            if v3 and v3.interval then
                started = v3.started
                interval = v3.interval
            end
        end
        if v12.GlobalOptionsCoolDown then
            started = v12.GlobalOptionsStart
            interval = v12.GlobalOptionsCoolDown
            GlobalOptionsSync = v12.GlobalOptionsSync
        end
        v3 = tostring(v11)
        v8[v3] = (createElement(TowerOptions, {
            Name = if not i3.QueueName then v1 else "",
            TooltipKey = tostring(v11),
            Level = v6,
            CooldownStart = started,
            CooldownSync = GlobalOptionsSync,
            CooldownInterval = interval,
            Icon = i3.Icon,
            Values = i3.Values,
            Selected = i3.Selected,
            Path = v12.Path,
            Cooldown = i3.Cooldown,
            MaxCooldown = i3.MaxCooldown,
            LayoutOrder = v11,
            Callback = function(a1) -- Line: 565 -- upvalues: OnOption (val), i3 (val)
                OnOption(i3.Name, a1.Name, a1.Value)
            end,
        }))
        v11 = v11 + 1
    end
    for i5, k in ipairs(Units) do
        if not v10[k] then
            v1 = tostring(v11)
            v9[v1] = (createElement(Unit, {
                Model = v12.Model,
                Icon = k.icon,
                Interval = k.interval,
                StartTick = k.started,
                LayoutOrder = v11,
            }))
            v11 = v11 + 1
        end
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(1, 8, 0.5, 0),
        Size = UDim2.new(0, 0, 1, -32),
        AutomaticSize = Enum.AutomaticSize.X,
    }, {
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 14),
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        abilities = React.createElement(React.Fragment, {}, v7),
        options = React.createElement(React.Fragment, {}, v8),
        units = React.createElement(React.Fragment, {}, v9),
    })
end

local function Stat(a1) -- Line: 609 -- upvalues: useOneShot (val), useEffect (val), createElement (val)
    local Value = a1.Value
    local Animatable = a1.Animatable
    local v1, u13 = useOneShot(0, 1, TweenInfo.new(0.2, Enum.EasingStyle.Sine), 1, true)
    local v2 = {Value}
    useEffect(function() -- Line: 615 -- upvalues: Animatable (val), u13 (val)
        if Animatable then
            u13()
        end
    end, v2)
    v2 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(1, 0.5),
    }
    local TextSize = a1.TextSize or UDim2.new(1, -30, 0.7, 0)
    v2.Size = TextSize
    local v3 = {}
    local v4 = {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = Value,
        TextColor3 = v1:map(function(a1) -- Line: 636
            return (Color3.new(0, 1, 0)):Lerp(Color3.new(1, 1, 1), a1)
        end),
    }
    local TextAlign = a1.TextAlign or Enum.TextXAlignment.Left
    v4.TextXAlignment = TextAlign
    v4.TextYAlignment = Enum.TextYAlignment.Center
    v4.Size = UDim2.fromScale(1, 1)
    v4.AnchorPoint = Vector2.new(0.5, 0.5)
    v4.Position = v1:map(function(a1) -- Line: 648
        return UDim2.new(0.5, 0, 0.5, -10 * (1 - a1))
    end)
    v3.text = createElement("TextLabel", v4, {
        uiStroke = createElement("UIStroke", {
            Thickness = 2,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
            Color = Color3.new(),
        }),
    })
    return createElement("Frame", v2, v3)
end

local function Stats(a1) -- Line: 661 -- upvalues: createElement (val), Stat (val), List (val)
    local v1
    local v2 = {}
    local v3 = {
        Cooldown = 5577896365,
        Damage = 5577895610,
        Cash = 5547581690,
        Income = 5547581690,
        Range = 5577896808,
    }
    local v4 = pairs
    local Stats = a1.Stats or {}
    for k, v in v4(Stats) do
        v1 = v3[k]
        if v1 and v ~= 0 and v then
            table.insert(v2, {
                Icon = v1,
                Name = k,
                Label = createElement(Stat, {Value = v, Animatable = a1.Animatable}),
            })
        end
    end
    return createElement(List, {
        BackgroundTransparency = 0.3,
        Stroke = 1,
        Padding = 4,
        TextStroke = 2,
        Visible = next(v2) ~= nil,
        Size = UDim2.fromOffset(80, 0),
        Position = UDim2.fromOffset(-8, 32),
        AnchorPoint = Vector2.new(1, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor = Color3.new(),
        TextAlign = Enum.TextXAlignment.Center,
        TextSize = UDim2.new(1, -36, 0.7, 0),
        ItemSize = UDim2.new(1, 0, 0, 32),
        IconSize = UDim2.fromOffset(26, 26),
        Items = v2,
    }, {
        title = createElement("TextLabel", {
            Text = "STATS:",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            LayoutOrder = -1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.new(0.7, 0, 0, 24),
        }, {
            uIStroke = createElement("UIStroke", {Thickness = 2}),
            frame = createElement("Frame", {
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 1),
                BackgroundColor3 = Color3.fromRGB(109, 109, 109),
                Position = UDim2.fromScale(0.5, 1),
                Size = UDim2.new(1.2, 0, 0, 2),
            }),
        }),
    })
end

local function Bottom(a1) -- Line: 738
    -- upvalues: createElement (val), Tooltip (val), Upgrade (val), List (val), React (val), PathLocked (val)
    -- upvalues: Button (val), Comma (val), Binding (val)
    local v1, v2
    local v3 = a1.Level or 0
    local v4 = a1.MaxLevel or 5
    local Owns = a1.Owns
    local v5 = {}
    local v6 = ("%* Stat Extras"):format(a1.Tower)
    local Tooltips = a1.Tooltips or {}
    for i, v in ipairs(Tooltips) do
        v1 = ("toolTip%*"):format(i)
        v5[v1] = (createElement("TextButton", {
            RichText = true,
            TextSize = 18,
            TextStrokeTransparency = 0,
            BackgroundTransparency = 0.6,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
            Text = v.ButtonText or "More Info",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(125, 210, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.fromOffset(0, 30),
            LayoutOrder = 9999 + i,
        }, {
            uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
            uIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8)}),
            borderStroke = createElement("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Color = Color3.fromRGB(255, 255, 255),
            }),
            element = createElement(Tooltip, {
                Name = ("%* %*"):format(v6, i),
                Header = v.Header,
                Subject = v.Subject,
                Content = v.Content,
            }),
        }))
    end
    local v7 = {
        BackgroundTransparency = 1,
        LayoutOrder = 3,
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromOffset(290, 0),
        Size = UDim2.fromOffset(300, 0),
    }
    local v8 = {
        uIListLayout = createElement("UIListLayout", {Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder}),
    }
    v8.uIPadding = createElement("UIPadding", {PaddingTop = UDim.new(0, 5)})
    v8.upgrade = createElement(Upgrade, {
        Cost = a1.Cost,
        Owns = Owns,
        Level = v3,
        MaxLevel = v4,
        Icon = a1.UpgradeIcon,
        UpgradeName = a1.UpgradeName,
        Animatable = a1.Animatable,
        OnUpgrade = a1.OnUpgrade,
        LevelLocked = v4 <= v3,
        Visible = a1.Visible,
        Locked = a1.Locked,
    })
    v8.description = createElement("Frame", {
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromScale(1, 0),
    }, {
        content = createElement(List, {
            Stroke = 1,
            Visible = not v2,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0),
            Size = UDim2.new(1, -16, 0, 142),
            IconSize = UDim2.fromOffset(25, 25),
            IconPosition = UDim2.new(0, 0, 0.5, 0),
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            ItemSize = UDim2.new(1, 0, math.min(0.35, 1 / #a1.Extras), -4),
            Items = a1.Extras,
        }, {toolTips = React.createElement(React.Fragment, {}, v5)}),
        pathLocked = createElement(PathLocked, {
            Position = UDim2.fromScale(0.5, 0),
            Size = UDim2.new(1, -16, 0, 142),
            Visible = not Owns or v2,
        }),
    })
    local v9 = {
        Active = true,
        BackgroundTransparency = 1,
        LayoutOrder = 3,
        Selectable = true,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.5, 0, 0, 272),
        Size = UDim2.new(1, 0, 0, 40),
    }
    local v10 = {
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 12),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    local v11 = {SpotlightRefName = "sell", LayoutOrder = 2, Visible = a1.Visible}
    local v12 = a1.Owns and not a1.Locked and Color3.fromRGB(255, 60, 60) or Color3.fromRGB(150, 150, 150)
    v11.Color = v12
    v11.AnchorPoint = Vector2.new(0.5, 0.5)
    v11.Position = UDim2.fromScale(0.5, 1)
    v11.Size = UDim2.new(1, -112, 0, 44)
    v11.Text = "Sell: $" .. Comma(a1.SellPrice or 0)
    v11.Clicked = a1.OnSell
    v10.button = createElement(Button, v11)
    v10.bind = createElement(Binding, {
        LayoutOrder = 1,
        Binding = "Sell Tower",
        DisableOnGameState = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(1, -8, 1, -8),
        Size = UDim2.fromOffset(32, 32),
        Callback = a1.OnSell,
    })
    v8.sell = createElement("Frame", v9, v10)
    return createElement("Frame", v7, v8)
end

local function Top(a1) -- Line: 901
    -- upvalues: useOneShot (val), useEffect (val), createElement (val), TowerAmmo (val), List (val), Comma (val)
    -- upvalues: HoverImageButton (val), Event (val), ItemPreview (val)
    local Animatable = a1.Animatable
    local v1 = a1.Spent or 0
    local v2 = a1.Damage or 0
    local Tower = a1.Tower
    local v3 = a1.TowerDisplayName or Tower
    local Level = a1.Level
    local v4, u20 = useOneShot(0, 1, TweenInfo.new(0.2, Enum.EasingStyle.Sine), 1, true)
    local v5 = {Level}
    useEffect(function() -- Line: 912 -- upvalues: Animatable (val), u20 (val)
        if Animatable then
            u20()
        end
    end, v5)
    v5 = {
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromOffset(290, 0),
    }
    local v6 = {uIPadding = createElement("UIPadding", {PaddingBottom = UDim.new(0, 10)})}
    v6.ammo = createElement(TowerAmmo, {Ammo = a1.Ammo, MaxAmmo = a1.MaxAmmo})
    local v7 = {
        ZIndex = 3,
        Padding = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromOffset(32, 54),
        Size = UDim2.fromOffset(24, 24),
        IconSize = UDim2.fromScale(1, 1),
        ItemSize = UDim2.fromOffset(24, 24),
    }
    local Detections = a1.Detections or {}
    v7.Items = Detections
    v6.detections = createElement(List, v7)
    v6.stats = createElement(List, {
        Stroke = 1,
        ZIndex = 4,
        ItemPadding = 6,
        TextStroke = 2,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 212),
        Size = UDim2.new(1, -32, 0, 48),
        ItemSize = UDim2.new(1, -16, 0, 14),
        TextSize = UDim2.fromScale(1, 1),
        Items = {{Text = "Total Damage: " .. Comma(v2)}, {Text = "Total Spent: $" .. Comma(v1)}},
    })
    local v8 = createElement
    v7 = {
        Active = true,
        BackgroundTransparency = 1,
        Selectable = true,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.5, 0, 0, 190),
        Size = UDim2.fromOffset(180, 32),
    }
    local v9 = {
        title = createElement("TextLabel", {
            Text = "Targets:",
            TextScaled = true,
            TextSize = 20,
            TextWrapped = true,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, -0.1),
            Size = UDim2.new(1, -64, 0.5, 0),
        }, {
            uIStroke3 = createElement("UIStroke", {Thickness = 3, LineJoinMode = Enum.LineJoinMode.Miter}),
        }),
        next = createElement(HoverImageButton, {
            Image = "rbxassetid://6764432408",
            LayoutOrder = 2,
            ZIndex = 2,
            ImageColor3 = Color3.fromRGB(156, 156, 156),
            ImageRectOffset = Vector2.new(0, 500),
            ImageRectSize = Vector2.new(50, 50),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(244, 244, 244),
            Position = UDim2.fromScale(1, 0.5),
            Size = UDim2.fromOffset(32, 32),
            Clicked = a1.RotateTargetRight,
        }, {
            uICorner4 = createElement("UICorner"),
            uIStroke1 = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(159, 159, 159)}),
        }),
        value = createElement("TextLabel", {
            TextScaled = true,
            TextSize = 20,
            TextWrapped = true,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = a1.Target,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.6),
            Size = UDim2.new(1, -64, 0.8, 0),
        }, {
            uIStroke4 = createElement("UIStroke", {Thickness = 3, LineJoinMode = Enum.LineJoinMode.Miter}),
        }),
    }
    local v10 = createElement
    local v11 = {
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = "",
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 14,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, -40, 0, 50),
        ZIndex = 3,
    }
    v11[Event.Activated] = a1.RotateTargetRight
    v9.button = v10("TextButton", v11)
    v9.previous = createElement(HoverImageButton, {
        Image = "rbxassetid://6764432408",
        ZIndex = 2,
        ImageColor3 = Color3.fromRGB(156, 156, 156),
        ImageRectOffset = Vector2.new(0, 550),
        ImageRectSize = Vector2.new(50, 50),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(244, 244, 244),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromOffset(32, 32),
        Clicked = a1.RotateTargetLeft,
    }, {
        uICorner1 = createElement("UICorner"),
        uIStroke2 = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(159, 159, 159)}),
    })
    v6.targetting = v8("Frame", v7, v9)
    v6.towerIcon = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Selectable = true,
        ZIndex = 3,
        Image = "rbxassetid://" .. (a1.TowerIcon or 0),
        ScaleType = Enum.ScaleType.Fit,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.5, 0, 0, 4),
        Size = UDim2.fromOffset(200, 200),
    }, {})
    v7 = {
        Image = "rbxassetid://300134974",
        ImageTransparency = 0.75,
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ScaleType = Enum.ScaleType.Tile,
        SliceCenter = Rect.new(0, 256, 0, 256),
        TileSize = UDim2.fromOffset(30, 30),
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.5, 0, 0, 34),
        Size = UDim2.new(1, -32, 0, 160),
    }
    v9 = {uICorner3 = createElement("UICorner", {CornerRadius = UDim.new(0.2, 0)})}
    v11 = {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.15),
        Size = UDim2.fromScale(2.5, 2.5),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
    }
    local v12 = {}
    local v13 = {IgnoreShadow = true, HidePreviewText = true}
    local TowerIconOverride = a1.TowerIconOverride or UDim2.fromScale(0, 0)
    v13.Position = TowerIconOverride
    v13.Size = UDim2.fromScale(1, 1)
    v13.CameraOffset = CFrame.new(0, 0, 0)
    v13.Preview = {Type = "Towers", Skin = "Default", Item = Tower}
    v12.icon = createElement(ItemPreview, v13)
    v9.container = createElement("Frame", v11, v12)
    v9.glow = createElement("ImageLabel", {
        Image = "rbxassetid://5948620849",
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.2, 1.2),
    }, {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint")})
    v6.pattern = createElement("ImageLabel", v7, v9)
    v7 = {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
    }
    v7.Text = (a1.OwnerName and a1.OwnerName .. "'s " or "") .. v3
    v7.TextColor3 = Color3.fromRGB(255, 255, 255)
    v7.AnchorPoint = Vector2.new(0.5, 0)
    v7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v7.Position = UDim2.new(0.5, 0, 0, 8)
    v7.Size = UDim2.fromOffset(200, 36)
    v6.towerName = createElement("TextLabel", v7, {uIStroke3 = createElement("UIStroke", {Thickness = 3})})
    v6.level = createElement("Frame", {
        Rotation = -8,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(126, 126, 126),
        Position = UDim2.fromOffset(8, 8),
        Size = UDim2.fromOffset(36, 36),
    }, {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
        borderStroke = createElement("UIStroke", {
            Thickness = 2,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(255, 255, 255),
        }),
        content = createElement("TextLabel", {
            TextScaled = true,
            TextSize = 16,
            TextWrapped = true,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = a1.Level,
            TextColor3 = Color3.fromRGB(245, 245, 245),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = v4:map(function(a1) -- Line: 1196 -- upvalues: Level (val)
                return UDim2.new(0.5, 0, 0.5, -10 * (Level > 0 and 1 - a1 or 0))
            end),
            Size = UDim2.fromScale(1, 1),
        }, {uIStroke = createElement("UIStroke", {Thickness = 3})}),
        uIPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 4),
            PaddingLeft = UDim.new(0, 4),
            PaddingRight = UDim.new(0, 4),
            PaddingTop = UDim.new(0, 4),
        }),
    })
    return createElement("Frame", v5, v6)
end

return function(a1) -- Line: 1217
    -- upvalues: createElement (val), useScale (val), Top (val), Bottom (val), Stats (val), Extras (val)
    local Owns = a1.Owns
    local Visible = a1.Visible
    local Level = a1.Level
    local Tower = a1.Tower
    local Damage = a1.Damage
    local Spent = a1.Spent
    local OnOption = a1.OnOption
    local OnUpgrade = a1.OnUpgrade
    local OnSell = a1.OnSell
    local NextUpgrade = a1.NextUpgrade
    local StatChanges = a1.StatChanges
    local Stats_2 = a1.Stats
    local Animatable = if a1.Animatable == nil then true else a1.Animatable
    local v1 = {
        BackgroundTransparency = 0.1,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(17, 17, 17),
        Position = UDim2.new(0, 20, 0.5, 0),
        Size = UDim2.fromOffset(300, 660),
        Visible = Visible,
    }
    local v2 = {scale = createElement("UIScale", {Scale = useScale(1.2)})}
    v2.dropShadow = createElement("ImageLabel", {
        Image = "rbxassetid://9239716855",
        ImageTransparency = 0.2,
        BackgroundTransparency = 1,
        ZIndex = -1,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(14, 14, 64, 24),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, 14, 1, 14),
    })
    v2.uICorner = createElement("UICorner")
    v2.uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(90, 90, 90)})
    local v3 = {
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromScale(1, 0),
    }
    local v4 = {
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 0),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
    }
    v4.top = createElement(Top, {
        Tower = Tower,
        TowerDisplayName = a1.TowerDisplayName,
        Level = Level,
        Spent = Spent,
        Damage = Damage,
        Owns = Owns,
        Detections = a1.Detections,
        Target = a1.TargetName or "First",
        RotateTargetRight = a1.UpdateTargetLeft,
        RotateTargetLeft = a1.UpdateTargetRight,
        Animatable = Animatable,
        Ammo = a1.Ammo,
        MaxAmmo = a1.MaxAmmo,
        TowerIconOverride = a1.TowerIconOverride,
        OwnerName = a1.OwnerName,
        Visible = a1.Visible,
        Locked = a1.Locked,
    })
    v4.divider = createElement("Frame", {
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = useScale(0.99, UDim2.new(0.5, 0, 0.5, -60)),
        Size = UDim2.new(1, -20, 0, 2),
    })
    local v5 = {
        Level = Level,
        MaxLevel = a1.MaxUpgrades,
        Owns = Owns,
        Cost = NextUpgrade.Cost,
        OnUpgrade = OnUpgrade,
    }
    local Title = NextUpgrade and NextUpgrade.Title or NextUpgrade.Title
    v5.UpgradeName = Title
    local Image = NextUpgrade and NextUpgrade.Image or NextUpgrade.Image
    v5.UpgradeIcon = Image
    v5.Tooltips = NextUpgrade and NextUpgrade.Tooltips
    v5.Tower = a1.Tower
    v5.Extras = StatChanges
    v5.SellPrice = a1.SellPrice
    v5.OnSell = OnSell
    v5.Animatable = Animatable
    v5.Visible = a1.Visible
    v5.Locked = a1.Locked
    v4.bottom = createElement(Bottom, v5)
    v2.content = createElement("Frame", v3, v4)
    v2.info = createElement("Frame", {
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromScale(0, 0),
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.fromScale(1.04, 0),
    }, {
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 15),
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        stats = createElement(Stats, {Stats = Stats_2, Animatable = Animatable}),
        extras = createElement(Extras, {
            Model = a1.Model,
            Callback = a1.OnAbility,
            Abilities = a1.Abilities,
            Units = a1.Units,
            Options = a1.Options,
            OnOption = OnOption,
            Level = Level,
            GlobalOptionsCoolDown = a1.GlobalOptionsCoolDown,
            GlobalOptionsStart = a1.GlobalOptionsStart,
        }),
    })
    return createElement("Frame", v1, v2)
end