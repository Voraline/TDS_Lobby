-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.Loadouts
-- Decompile time: 18.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Button = require(script.Parent.Button)
local IconButton = require(ReplicatedStorage.Client.Interfaces.Components.IconButton)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local Maid = require(ReplicatedStorage.Shared.Modules.GuiLib.Utilities.Maid)
local PVPTowerInventoryHotbar = require(ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPTowerInventoryHotbar)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local SearchBar = require(script.Parent.SearchBar)
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
require(ReplicatedStorage.Packages.Sift)
local WindowFrame = require(script.Parent.WindowFrame)
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local createElement = React.createElement
local useEffect = React.useEffect

local function editComponent(a1) -- Line: 42
    -- upvalues: React (val), useScale (val), useMediaQuery (val), useEffect (val), UserInputService (val)
    -- upvalues: createElement (val), Button (val)
    local v1, u8 = React.useBinding(UDim2.fromOffset(0, 0))
    local v2 = useScale(1, nil, true)
    local v3 = not useMediaQuery("medium")
    local v4 = useEffect
    local v5 = {a1.enabled, a1.idSelected}
    v4(function() -- Line: 51 -- upvalues: UserInputService (upval), u8 (val)
        local MouseLocation = UserInputService:GetMouseLocation()
        u8((UDim2.fromOffset(MouseLocation.X, MouseLocation.Y)))
    end, v5)
    v5 = {
        BackgroundTransparency = 0.1,
        ZIndex = 9999,
        BackgroundColor3 = Color3.new(),
        Position = v1,
        Size = UDim2.fromOffset(230, 160),
        Visible = a1.enabled,
    }
    local v6 = {
        uIScale = createElement("UIScale", {Scale = v2 * (if not v3 then 1 else 1.2)}),
        uICorner = createElement("UICorner"),
        uIStroke = createElement("UIStroke", {Thickness = 3, Transparency = 0.8, Color = Color3.new(1, 1, 1)}),
        uIList = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            FillDirection = Enum.FillDirection.Vertical,
            Padding = UDim.new(0, 12),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
    }
    local v7 = {
        dontUseRatio = true,
        text = "Rename",
        textSize = 26,
        scaleMultiplier = 0.5,
        onClick = function() -- Line: 87 -- upvalues: a1 (val)
            a1.onClick("rename")
        end,
        color = Color3.new(1, 1, 1),
    }
    local fromOffset = UDim2.fromOffset
    local v8 = if not v3 then 1 else 1.1
    v7.size = fromOffset(180 * (if not v3 then 1 else 1.5), 50 * v8)
    v7.anchorPoint = Vector2.new(0.5, 0.5)
    v7.position = UDim2.fromScale(0.5, 0.2)
    v6.renameButton = createElement(Button, v7)
    v7 = {
        dontUseRatio = true,
        text = "Override",
        textSize = 26,
        scaleMultiplier = 0.5,
        onClick = function() -- Line: 101 -- upvalues: a1 (val)
            a1.onClick("overRide")
        end,
        color = Color3.new(1, 0.160784, 0.160784),
    }
    local fromOffset_2 = UDim2.fromOffset
    v8 = if not v3 then 1 else 1.1
    v7.size = fromOffset_2(180 * (if not v3 then 1 else 1.5), 50 * v8)
    v7.anchorPoint = Vector2.new(0.5, 0.5)
    v7.position = UDim2.fromScale(0.5, 0.755)
    v6.overRideButton = createElement(Button, v7)
    return createElement("Frame", v5, v6)
end

local function loadOutComponent(a1) -- Line: 114
    -- upvalues: useScale (val), SharedGameConstants (val), createElement (val), React (val)
    -- upvalues: PVPTowerInventoryHotbar (val), useMediaQuery (val), Button (val), Icons (val)
    local name, skin, v1, v2, v3, v4
    local v5 = {}
    local v6 = useScale(1, nil, true)
    local MAX_TOWER_SLOTS = SharedGameConstants.MAX_TOWER_SLOTS
    for i = 1, MAX_TOWER_SLOTS do
        local u16 = a1.towers[i]
        v4 = "tower" .. i
        v1 = {LayoutOrder = i, BackgroundTransparency = 1, Size = UDim2.fromScale(0.19, 1)}

        v1[React.Event.MouseEnter] = function() -- Line: 132 -- upvalues: u16 (val), a1 (val)
            if u16 then
                a1.onHover(u16.name, u16.skin)
            end
        end

        v1[React.Event.MouseLeave] = function() -- Line: 137 -- upvalues: a1 (val)
            a1.onLeave()
        end

        v2 = {}
        v3 = {
            Container = false,
            showPrice = false,
            picked = false,
            isTower = true,
            dontAnimate = true,
            LayoutOrder = i,
        }
        name = u16 and u16.name
        v3.name = name
        skin = u16 and u16.skin
        v3.skin = skin
        v3.towerInventory = {}

        function v3.onEnter() end

        v2.hotbar = createElement(PVPTowerInventoryHotbar, v3)
        v5[v4] = (createElement("Frame", v1, v2))
    end
    local v7 = not useMediaQuery("medium")
    local v8 = {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 120), LayoutOrder = a1.index}
    v4 = {}
    v4.aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 4.236, AspectType = Enum.AspectType.ScaleWithParentSize})
    v4.gradientFrame = createElement("Frame", {
        BackgroundTransparency = 0.28,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Position = UDim2.fromScale(0, 0.155),
        Size = UDim2.fromScale(1, 0.25),
    }, {
        uIGradient = React.createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.569187, 1),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
        uICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.3, 0)}),
        glow = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://102413898432149",
            ImageTransparency = 0.6,
            Size = UDim2.fromScale(1.06, 1.378),
            Position = UDim2.fromScale(0.52, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(128, 128, 128, 128),
        }, {
            uIGradient = React.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.1, 0),
                    NumberSequenceKeypoint.new(0.6, 1),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        }),
    })
    v4.title = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = false,
        ZIndex = 9,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.0174745, 0.0364705),
        Size = UDim2.fromScale(0.72, 0.23),
        Text = a1.title,
        TextColor3 = Color3.new(1, 1, 1),
        TextSize = 30 * v6,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {
        uIStroke = createElement("UIStroke", {
            Thickness = 0.08,
            Transparency = 0.5,
            Color = Color3.new(0, 0, 0),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }),
    })
    v4.towerInventory = createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.362458, 0.409603),
        Size = UDim2.fromScale(0.689966, 0.533967),
    }, {
        React.createElement("UIAspectRatioConstraint", {AspectRatio = 5.49}),
        uiList = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0, 6 * v6),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
    }, v5)
    v1 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(0.98, 0.5),
        Size = UDim2.fromScale(0.26, 1),
    }
    v2 = {aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1.196})}
    v3 = {
        dontUseRatio = true,
        scaleMultiplier = 0.3,
        text = if not a1.hasEquippedLoadout then "Apply" else "Equipped",
        onClick = function() -- Line: 264 -- upvalues: a1 (val)
            a1.onEquip()
        end,
        textSize = 18 * v6 * 1.3,
        automaticSize = Enum.AutomaticSize.None,
    }
    local v9 = v7 and UDim2.fromScale(1, 0.6) or UDim2.fromScale(1, 0.4)
    v3.size = v9
    v3.anchorPoint = Vector2.new(0.5, 0.5)
    v3.position = UDim2.fromScale(0.5, 0.3)
    v3.icon = Icons.TowersInventory
    v3.color = if not a1.hasEquippedLoadout then false else Color3.fromRGB(255, 186, 38)
    v2.equipButton = createElement(Button, v3)
    v3 = {
        dontUseRatio = true,
        text = "Edit",
        scaleMultiplier = 0.3,
        onClick = function() -- Line: 280 -- upvalues: a1 (val)
            a1.onEdit()
        end,
        automaticSize = Enum.AutomaticSize.None,
        textSize = 18 * v6 * 1.3,
        color = Color3.fromRGB(189, 189, 189),
    }
    v9 = v7 and UDim2.fromScale(1, 0.6) or UDim2.fromScale(1, 0.4)
    v3.size = v9
    v3.anchorPoint = Vector2.new(0.5, 0.5)
    v3.position = UDim2.fromScale(0.5, 0.78)
    v3.icon = Icons.Pencil
    v2.editButton = createElement(Button, v3)
    v4.buttons = createElement("Frame", v1, v2)
    return createElement("Frame", v8, v4)
end

local function loadoutPrompt(a1) -- Line: 296
    -- upvalues: useScale (val), SharedGameConstants (val), createElement (val), PVPTowerInventoryHotbar (val)
    -- upvalues: React (val), Button (val)
    local v1, v2
    local v3 = useScale(1.3, nil, true)
    local v4 = {}
    local MAX_TOWER_SLOTS = SharedGameConstants.MAX_TOWER_SLOTS
    for i = 1, MAX_TOWER_SLOTS do
        v1 = a1.towersToDisplay[i]
        v2 = "tower" .. i
        v4[v2] = (createElement(PVPTowerInventoryHotbar, {
            Container = false,
            showPrice = false,
            picked = false,
            isTower = true,
            LayoutOrder = i,
            name = v1,
            towerInventory = {},
            levelLock = SharedGameConstants.TOWER_SLOT_LEVELS[i],
            level = a1.level,
        }))
    end
    local renaming = a1.renaming
    if renaming then
        local v5 = {
            BackgroundTransparency = 0.2,
            Visible = true,
            ZIndex = 9999,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.new(),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
        }
        v1 = {
            Padding = createElement("UIPadding", {
                PaddingTop = UDim.new(0, 15 * v3),
                PaddingBottom = UDim.new(0, 15 * v3),
                PaddingLeft = UDim.new(0, 15 * v3),
                PaddingRight = UDim.new(0, 15 * v3),
            }),
            uiList = createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                FillDirection = Enum.FillDirection.Vertical,
                Padding = UDim.new(0, 15 * v3),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            scale = createElement("UIScale", {Scale = 1 * v3}),
            textLabel = React.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = false,
                TextSize = 23,
                LayoutOrder = -10,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                Position = UDim2.fromScale(0.0470588, 3.6548e-07),
                Size = UDim2.fromScale(0, 0),
                AutomaticSize = Enum.AutomaticSize.XY,
                Text = if not a1.makingLoadout then "Name Your Loadout" else "Name Your New Loadout",
                TextColor3 = Color3.new(1, 1, 1),
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            ButtonsContainer = createElement("Frame", {
                BackgroundTransparency = 1,
                LayoutOrder = 10,
                Size = UDim2.fromOffset(230, 83),
                Position = UDim2.fromScale(0.5, 0.8),
                AnchorPoint = Vector2.new(0.5, 0.5),
            }, {
                uiList = createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    FillDirection = Enum.FillDirection.Horizontal,
                    Padding = UDim.new(0, 23 * v3),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                }),
                createElement("UIFlexItem", {
                    FlexMode = Enum.UIFlexMode.Grow,
                    ItemLineAlignment = Enum.ItemLineAlignment.Center,
                }),
                cancelButton = createElement(Button, {
                    dontUseRatio = true,
                    text = "Cancel",
                    textSize = 25,
                    dontScale = true,
                    scaleMultiplier = 0.5,
                    onClick = function() -- Line: 396 -- upvalues: a1 (val)
                        a1.onCancel()
                    end,
                    color = Color3.fromRGB(189, 189, 189),
                    size = UDim2.fromScale(0.9, 0.7),
                    anchorPoint = Vector2.new(0.5, 0.5),
                    position = UDim2.fromScale(0.723401, 0.820239),
                }),
                confirmButton = createElement(Button, {
                    dontUseRatio = true,
                    text = "Confirm",
                    textSize = 25,
                    dontScale = true,
                    scaleMultiplier = 0.5,
                    onClick = function() -- Line: 411 -- upvalues: a1 (val)
                        a1.onRename()
                    end,
                    size = UDim2.fromScale(0.9, 0.7),
                    anchorPoint = Vector2.new(0.5, 0.5),
                    position = UDim2.fromScale(0.282527, 0.820239),
                }),
            }),
        }
        local makingLoadout = a1.makingLoadout and createElement("Frame", {LayoutOrder = 1, BackgroundTransparency = 1, Size = UDim2.fromOffset(450, 80)}, {
            uiList = createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 10 * v3),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
        }, v4)
        v1.towers = makingLoadout
        v1.nameloadout = React.createElement("Frame", {
            BackgroundTransparency = 1,
            Position = UDim2.fromScale(0.0470588, 0.251497),
            Size = UDim2.fromOffset(450, 50),
        }, {
            textBox = React.createElement("TextBox", {
                Text = "",
                TextScaled = false,
                ClearTextOnFocus = false,
                ClipsDescendants = true,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.new(),
                FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                TextColor3 = Color3.new(1, 1, 1),
                TextSize = 40 * v3,
                ref = a1.textBoxRef,
                TextXAlignment = Enum.TextXAlignment.Left,
            }, {
                uICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.130896, 0)}),
                uIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 6 * v3)}),
                uITextSizeConstraint = React.createElement("UITextSizeConstraint"),
            }),
            uIStroke = React.createElement("UIStroke", {Thickness = 3, Transparency = 0.8, Color = Color3.new(1, 1, 1)}),
            uICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.131148, 0)}),
        })
        v1.uICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.02, 0)})
        v1.uIStroke = React.createElement("UIStroke", {Thickness = 3, Transparency = 0.8, Color = Color3.new(1, 1, 1)})
        renaming = createElement("Frame", v5, v1)
    end
    return renaming
end

local function createLoadoutButton(a1) -- Line: 491
    -- upvalues: ReactFlow (val), createElement (val), React (val)
    local v1, u5 = ReactFlow.useSpring({start = 1, target = 1, damper = 0.6, speed = 25})
    local v2 = createElement
    local v3 = {
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.new(),
        LayoutOrder = a1.layoutOrder + -100,
        Size = UDim2.new(0.98, 0, 0, 120),
    }
    local v4 = {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 7.32})}
    local v5 = createElement
    local v6 = {
        BackgroundTransparency = 0.4,
        BackgroundColor3 = Color3.new(),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.new(1, 0, 1, 0),
    }
    local v7 = {
        uIGradient = createElement("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0.33125))}),
        }),
        glowFrame = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://102413898432149",
            Size = UDim2.fromScale(1.06, 1.378),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(128, 128, 128, 128),
            ImageTransparency = v1:map(function(a1) -- Line: 533
                return 1 - (a1 - 1) * 4
            end),
        }, {
            uIGradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 148, 179))),
                }),
            }),
        }),
        scale = createElement("UIScale", {
            Scale = v1:map(function(a1) -- Line: 547
                return a1 * 0.95
            end),
        }),
    }
    local v8 = createElement
    local v9 = {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        Image = "",
        ScaleType = Enum.ScaleType.Fit,
    }
    v9[React.Event.Activated] = a1.onClick

    v9[React.Event.MouseEnter] = function() -- Line: 558 -- upvalues: u5 (val)
        u5({target = 1.05})
    end

    v9[React.Event.MouseLeave] = function() -- Line: 563 -- upvalues: u5 (val)
        u5({target = 1})
    end

    v9[React.Event.MouseButton1Down] = function() -- Line: 568 -- upvalues: u5 (val)
        u5({target = 0.9})
    end

    v9[React.Event.MouseButton1Up] = function() -- Line: 573 -- upvalues: u5 (val)
        u5({target = 1.05})
    end

    v7.button = v8("ImageButton", v9)
    v7.imageLabel = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://97263782771522",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Fit,
        Size = UDim2.fromScale(1, 0.6),
    }, {
        uIGradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 148, 179))),
            }),
        }),
    })
    v7.uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.1, 0)})
    v7.uIStroke = createElement("UIStroke", {
        Thickness = 0.02,
        Transparency = 0.79,
        Color = Color3.new(1, 1, 1),
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
    })
    v4.main = v5("Frame", v6, v7)
    return v2("Frame", v3, v4)
end

return (React.memo(function(a1) -- Line: 611
    -- upvalues: React (val), useEffect (val), Maid (val), UserInputService (val), createElement (val)
    -- upvalues: loadOutComponent (val), useScale (val), createLoadoutButton (val), useMediaQuery (val), Tooltip (val)
    -- upvalues: editComponent (val), loadoutPrompt (val), WindowFrame (val), SearchBar (val), IconButton (val)
    local v1
    local u4, u5 = React.useState("")
    local u9, u10 = React.useState(false)
    local u14, u15 = React.useState(nil)
    local u19, u20 = React.useState(false)
    local u24, u25 = React.useState(false)
    local v2, u30 = React.useState(nil)
    local v3 = {u9, u14}
    useEffect(function() -- Line: 620 -- upvalues: Maid (upval), UserInputService (upval), u9 (val), u10 (val)
        local u2 = Maid.new()
        u2:Mark((UserInputService.InputBegan:Connect(function(a1) -- Line: 623 -- upvalues: u9 (upval), u10 (upval)
            if a1.UserInputType == Enum.UserInputType.MouseButton1 and u9 == true then
                u10(false)
            end
        end)))
        return function() -- Line: 629 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, v3)
    local useMemo = React.useMemo
    v3 = {a1.towerInventory, a1.loadouts, u4}
    local v4 = useMemo(function() -- Line: 634
        -- upvalues: a1 (val), u4 (val), createElement (upval), loadOutComponent (upval), u30 (val), u14 (val), u9 (val)
        -- upvalues: u10 (val), u15 (val)
        local find, v1, v2
        local v3 = {}
        local v4 = nil
        local v5 = nil
        for i, j in a1.loadouts, v4, v5 do
            find = string.find
            v2 = j.Name:lower()
            if find(v2, u4:lower()) then
                v1 = true
                for k, n in j.Towers do
                    if not table.find(a1.towerInventory, n.name) then
                        v1 = false
                        break
                    end
                end
                if #a1.towerInventory ~= #j.Towers then
                    v1 = false
                end
                v2 = j.Name .. i
                v3[v2] = (createElement(loadOutComponent, {
                    towers = j.Towers,
                    title = j.Name,
                    index = i,
                    onHover = function(a1, a2) -- Line: 660 -- upvalues: u30 (upval)
                        u30({Name = a1, Header = a2, Subject = a1})
                    end,
                    onLeave = function() -- Line: 667 -- upvalues: u30 (upval)
                        u30(nil)
                    end,
                    hasEquippedLoadout = v1,
                    onEquip = function() -- Line: 671 -- upvalues: a1 (upval), j (val), i (val)
                        a1.onEquipLoadout(j, i)
                    end,
                    onEdit = function() -- Line: 674 -- upvalues: u14 (upval), i (val), u9 (upval), u10 (upval), u15 (upval)
                        if u14 == i and u9 then
                            u10(false)
                            u15(nil)
                            return
                        end
                        u15(i)
                        if not u9 then
                            u10(true)
                            return
                        end
                        u10(false)
                        task.defer(function() -- Line: 684 -- upvalues: u10 (upval)
                            u10(true)
                        end)
                    end,
                }))
            end
        end
        return v3
    end, v3)
    local u49 = useScale(1, nil, true)
    local u53 = React.useRef(nil)
    local v5 = {u53, u19, u14, u24}
    React.useEffect(function() -- Line: 700 -- upvalues: Maid (upval), u19 (val), u53 (val), u14 (val), a1 (val)
        local u2 = Maid.new()
        if u19 and u53.current then
            for i, j in a1.loadouts do
                if i == u14 then
                    u53.current.Text = j.Name
                    break
                end
            end
            u53.current:CaptureFocus()
        end
        if u53.current then
            u2:Mark(((u53.current:GetPropertyChangedSignal("Text")):Connect(function() -- Line: 717 -- upvalues: u53 (upval)
                if #u53.current.Text > 50 then
                    u53.current.Text = string.sub(u53.current.Text, 1, 50)
                end
            end)))
        end
        return function() -- Line: 724 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, v5)
    local v6 = {}
    if u4 == "" then
        local v7
        v1 = a1.numLoadoutsCanCreate - #a1.loadouts
        for i = 1, v1 do
            v7 = "createLoadout" .. i
            v6[v7] = (createElement(createLoadoutButton, {
                layoutOrder = 90000,
                onClick = function() -- Line: 735 -- upvalues: u25 (val)
                    u25(true)
                end,
            }))
        end
    end
    v1 = not useMediaQuery("medium")
    v5 = createElement
    local Fragment = React.Fragment
    local v8 = {
        tooltip = v2 and createElement(Tooltip, {Name = v2.Name, Header = v2.Header, Subject = v2.Subject}),
        modal = createElement("TextButton", {
            ZIndex = 998,
            Modal = true,
            Text = "",
            AutoButtonColor = false,
            BackgroundTransparency = 0.3,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.new(0, 0, 0),
        }),
        editFrame = createElement(editComponent, {
            ZIndex = 999,
            enabled = u9,
            idSelected = u14,
            onClick = function(a1_2) -- Line: 764 -- upvalues: u20 (val), a1 (val), u14 (val)
                if a1_2 == "rename" then
                    u20(true)
                    return
                end
                if a1_2 == "overRide" then
                    a1.onOverrideLoadout(u14)
                end
            end,
        }),
        editLoadout = createElement(loadoutPrompt, {
            ZIndex = 999,
            renaming = u19 or u24,
            textBoxRef = u53,
            makingLoadout = u24,
            towersToDisplay = a1.towersToDisplay,
            level = a1.level,
            onRename = function() -- Line: 780 -- upvalues: u19 (val), a1 (val), u14 (val), u53 (val), u24 (val), u20 (val), u25 (val)
                if u19 then
                    a1.onRenameLoadout(u14, u53.current.Text)
                end
                if u24 then
                    a1.createLoadout(u53.current.Text)
                end
                u20(false)
                u25(false)
            end,
            onCancel = function() -- Line: 793 -- upvalues: u20 (val), u25 (val)
                u20(false)
                u25(false)
            end,
        }),
    }
    local v9 = createElement
    local v10 = {
        BackgroundTransparency = 1,
        ZIndex = 999,
        Position = UDim2.fromScale(0.5, 0.536671),
        Size = UDim2.fromScale(0.512, 0.7),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = not u19 and not u24,
    }
    local v11 = {
        uIScale = createElement("UIScale", {Scale = if not v1 then 1 else 1.5}),
        uIAspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1.75,
            AspectType = Enum.AspectType.ScaleWithParentSize,
            DominantAxis = Enum.DominantAxis.Height,
        }),
    }
    local v12 = createElement
    local v13 = WindowFrame
    local v14 = {
        filterBackgroundTransparency = 0.2,
        size = UDim2.fromScale(0.455, 0.7),
        position = UDim2.fromScale(0.5, 0.5),
        anchorPoint = Vector2.new(0.5, 0.5),
        filterSize = UDim2.fromScale(1.036, 0.107),
    }
    local v15 = {}
    local v16 = {}
    local v17 = createElement
    local v18 = {
        Active = true,
        BackgroundTransparency = 1,
        BottomImage = "",
        ScrollBarThickness = 2,
        TopImage = "",
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.500246, 0.55329),
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Size = UDim2.fromScale(0.985791, 0.893421),
        CanvasSize = UDim2.new(0, 0, 0, 0),
    }
    local v19 = {}
    local createElement_3 = React.createElement
    local v20 = {
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0, 12 * u49),
        SortOrder = Enum.SortOrder.LayoutOrder,
    }

    v20[React.Change.AbsoluteContentSize] = function(a1) -- Line: 842 -- upvalues: u49 (val)
        local AbsoluteContentSize = a1.AbsoluteContentSize
        a1.Parent.CanvasSize = UDim2.new(0, 0, 0, AbsoluteContentSize.Y + 25 * u49)
    end

    v19.uIListLayout = createElement_3("UIListLayout", v20)
    v19.uIPadding = React.createElement("UIPadding", {PaddingTop = UDim.new(0, 12 * u49)})
    v16.scrollingFrame = v17("ScrollingFrame", v18, v19, v4, v6)
    v15.otherChildren = v16
    v15.title = createElement("TextLabel", {
        BackgroundTransparency = 1,
        Text = "Loadouts",
        TextScaled = true,
        ZIndex = 99,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.0412625, 0.147443),
        Size = UDim2.fromScale(0.438976, 0.685893),
        TextColor3 = Color3.new(1, 1, 1),
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    v15.searchBar = createElement(SearchBar, {
        position = UDim2.fromScale(0.66, 0.5),
        onSearch = function(a1) -- Line: 873 -- upvalues: u10 (val), u5 (val)
            u10(false)
            u5(a1)
        end,
    })
    v15.CloseButton = createElement(IconButton, {
        LayoutOrder = 3,
        Color = Color3.fromRGB(255, 45, 70),
        Position = UDim2.fromScale(0.95, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(0.7, 0.7),
        Clicked = a1.onClose,
    }, {
        uiAspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 1}),
    })
    v11.windowFrame = v12(v13, v14, v15)
    v8.main = v9("Frame", v10, v11)
    return v5(Fragment, nil, v8)
end))