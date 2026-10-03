-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.StatsPanel.StatsContent
-- Decompile time: 20.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.BaseComponents.Button)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local Container = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.BaseComponents.Container)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local Icons_2 = require(ReplicatedStorage.Client.Interfaces.Icons)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Paywall = require(ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Paywall)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local Searchbox = require(script.Parent.Parent.Searchbox)
local StatsDetectionEntry = require(script.Parent.StatsDetectionEntry)
local StatsEntry = require(script.Parent.StatsEntry)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local TowerPreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.TowerPreview)
local TowersEntry = require(ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Towers.TowersEntry)
local fzy = require(ReplicatedStorage.Shared.Modules.fzy)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local Collapsible = require(ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Collapsible)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Troops = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops)
local useCache = require(ReplicatedStorage.Client.Interfaces.Hooks.useCache)
local useCharmBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding)
local useHasSandboxGamepass = require(ReplicatedStorage.Client.Interfaces.Hooks.useHasSandboxGamepass)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Packages.ReactFlow).useSpring
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local createElement = React.createElement
local useState = React.useState
local useMemo = React.useMemo
local useEffect = React.useEffect
local Sandbox = NewNetwork.Channel("Sandbox")
local u195 = {
    Cooldown = true,
    Damage = true,
    Income = true,
    Range = true,
    Limit = true,
    SpawnTime = true,
    Price = true,
    Cost = true,
}
local u196 = {HiddenDetection = "Hidden", LeadDetection = "Lead", FlyingDetection = "Flying"}
local u197 = {Income = "Cash", Price = "Cash", Cost = "Cash"}
local u198 = {
    Cooldown = "How fast the tower can attack.",
    Damage = "How much damage the tower does.",
    Income = "How much money the tower generates.",
    Range = "How far the tower can attack.",
    SpawnTime = "How long it takes for units to spawn.",
    Limit = "How many of this tower you can place.",
    Price = "How much it costs to place this tower.",
    Cost = "How much this upgrade costs.",
}
local u202 = React.memo(function(a1) -- Line: 83
    -- upvalues: useSpring (val), useTransparencyModifier (val), useReactBindings (val), math (val), useEffect (val)
    -- upvalues: createElement (val), TowerPreview (val)
    local v1, u4 = useSpring({start = 0, speed = 12, damper = 0.8})
    local v2, u8 = useSpring({start = 0, speed = 10, damper = 1})
    local v3 = useTransparencyModifier(a1.Transparency)(v2)
    local v4 = useReactBindings
    local v5 = {a1.Transparency}
    v4(function(a1) -- Line: 91 -- upvalues: u4 (val), math (upval), u8 (val)
        if a1 < 0.99 and a1 > 0.9 then
            u4({target = 0, start = math.pi * 1.5})
            u8({start = 1, target = 0})
        end
    end, v5)
    v4 = useEffect
    v5 = {a1.Name, a1.Level, a1.Skin, a1.Path}
    v4(function() -- Line: 98 -- upvalues: u4 (val), math (upval), u8 (val)
        u4({target = 0, start = math.pi * 1.5})
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
        modelTransformBinding = v1:map(function(a1) -- Line: 115
            return (CFrame.Angles(0, -a1, 0)) + Vector3.new(0, -a1 / 4, 0)
        end),
        tower = a1.Name,
        skin = a1.Skin,
        level = a1.Level,
        path = a1.Path,
    })
end, function(a1, a2) -- Line: 125
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
local u205 = React.memo(function(a1) -- Line: 137 -- upvalues: createElement (val), Container (val), ImageLabel (val), u202 (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.new(1, -20, 1, 0),
    }, {
        backDrop = createElement(Container, {
            BackgroundTransparency = 0.5,
            ZIndex = -1,
            GradientRotation = 90,
            StrokeThickness = 1,
            StrokeGradientRotation = 90,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(54, 70, 86),
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
                BackgroundTransparency = 1,
                Image = "rbxassetid://5948620849",
                AspectRatio = 1,
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = a1.Transparency:map(function(a1) -- Line: 178
                    return UDim2.fromScale(1 - a1, 1 - a1)
                end),
                Transparency = a1.Transparency,
            }),
        }),
        towerIcon = createElement(u202, {
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Transparency = a1.Transparency,
            Name = a1.Name,
            Skin = a1.Skin,
            Level = a1.Level,
            Path = a1.Path,
        }),
    })
end)
return function() -- Line: 205
    -- upvalues: useHasSandboxGamepass (val), useCharmBinding (val), SandboxStore (val), useState (val), useSpring (val)
    -- upvalues: useEffect (val), useSound (val), React (val), useCache (val), useMemo (val), Troops (val)
    -- upvalues: createElement (val), u196 (val), StatsDetectionEntry (val), Icons_2 (val), Sandbox (val), u195 (val)
    -- upvalues: StatsEntry (val), u198 (val), Icons (val), u197 (val), Enum (val), TowersEntry (val), Collapsible (val)
    -- upvalues: Paywall (val), Searchbox (val), fzy (val), u205 (val), math (val), TextLabel (val), Button (val)
    -- upvalues: Tooltip (val), Container (val)
    local u13, u30
    local v1 = useHasSandboxGamepass()
    local v2 = useCharmBinding(SandboxStore.getState)
    local u8, u9 = useState(false)
    _, u13 = useSpring({start = 0, speed = 20, damper = 1})
    local v3, u17 = useSpring({start = 0, speed = 20, damper = 1})
    local v4 = {u8}
    useEffect(function() -- Line: 221 -- upvalues: u13 (val), u8 (val), u17 (val)
        u13({target = if not u8 then 0 else 1})
        u17({target = 0})
    end, v4)
    local v5, u26 = useSpring({start = 0, speed = 20, damper = 1})
    v4, u30 = useSpring({start = 1, speed = 20, damper = 1})
    local GoldenPerks = useSound("GoldenPerks")
    local u36, u37 = useState(Enum.SortOrder.Name)
    local u40, u41 = useState(false)
    local u44, u45 = useState(0)
    local u48, u49 = useState(nil)
    local u53, u54 = React.useBinding(u44)
    local v6 = {u40}
    useEffect(function() -- Line: 247 -- upvalues: u26 (val), u40 (val)
        u26({target = if not u40 then 0 else 1})
    end, v6)
    v6 = {u49, u37, u41, u45}
    local u68 = React.useCallback(function() -- Line: 251 -- upvalues: u49 (val), u37 (val), u41 (val), u45 (val)
        u49(nil)
        u37(Enum.SortOrder.Name)
        u41(false)
        u45(0)
    end, v6)
    local v7 = v2:map(function(a1) -- Line: 258 -- upvalues: u30 (val)
        u30({start = 1, target = if a1.SelectedTab ~= "Stats" then 1 else 0})
        return a1.SelectedTab == "Stats"
    end)
    local u76 = useCache("Inventory.Troops", {})
    local Scout, Scout_2 = useState("Scout")
    local v8 = {Scout, u76}
    local u86 = useMemo(function() -- Line: 270 -- upvalues: u76 (val), Scout (val)
        return u76[Scout]
    end, v8)
    local v9 = {Scout}
    local u91, u92 = useMemo(function() -- Line: 274 -- upvalues: Troops (upval), Scout (val)
        local v1 = Troops(Scout)
        if v1 then
            return v1.Stats.Default, v1.Stats.Golden
        end
        return {}, nil
    end, v9)
    local v10 = {u91}
    v9 = useMemo(function() -- Line: 289 -- upvalues: u91 (val), createElement (upval), u53 (val)
        local v1
        local v2 = {}
        local Upgrades = u91.Upgrades or {}
        for i = 1, #Upgrades + 1 do
            v1 = tostring(i)
            v2[v1] = (createElement("Frame", {
                BackgroundTransparency = 0,
                Size = UDim2.fromScale(1, 0.5),
                LayoutOrder = i + 10,
                BackgroundColor3 = u53:map(function(a1) -- Line: 300 -- upvalues: i (val)
                    if a1 == i - 1 then
                        return (Color3.fromRGB(255, 255, 255))
                    end
                    return (Color3.fromRGB(27, 27, 27))
                end),
            }, {
                corner = createElement("UICorner", {CornerRadius = UDim.new(0, 5)}),
                ratio = createElement("UIAspectRatioConstraint", {AspectRatio = 2}),
            }))
        end
        return v2
    end, v10)
    local v11 = {u92}
    useEffect(function() -- Line: 319 -- upvalues: u92 (val), u40 (val), u41 (val)
        if not u92 and u40 then
            u41(false)
        end
    end, v11)
    v11 = {Scout, u68}
    useEffect(function() -- Line: 325 -- upvalues: u68 (val)
        u68()
    end, v11)
    v11 = {u91, u92, u40, u44}
    local v12 = useMemo(function() -- Line: 329
        -- upvalues: u44 (val), u40 (val), u92 (val), u91 (val), u196 (upval), createElement (upval)
        -- upvalues: StatsDetectionEntry (upval), Icons_2 (upval), Sandbox (upval), Scout (val)
        local renderStats
        local u61 = {}
        local u63 = u44 == 0
        local v1 = if not u40 then u91 else if not u92 then u91 else u92
        local Defaults = if not u63 then v1.Upgrades[u44] or {} else v1.Defaults
        local v2 = {Defaults, Defaults.Stats}
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            function renderStats(a1, a2) -- Line: 344
                -- upvalues: u44 (upval), u196 (upval), u61 (val), createElement (upval), StatsDetectionEntry (upval)
                -- upvalues: Icons_2 (upval), Sandbox (upval), Scout (upval), u40 (upval), u63 (val)
                local v1, v2
                local Detections = a1.Detections or {}
                local v3 = a2 and ("Path %*%*"):format(u44, (string.char(64 + a2))) or ""
                for i, j in u196 do
                    v2 = u61
                    v1 = ("%*Detections%*"):format(v3, i)
                    v2[v1] = (createElement(StatsDetectionEntry, {
                        name = j,
                        value = Detections[i] or false,
                        icon = Icons_2[j],
                        onConfirm = function(a1) -- Line: 357
                            -- upvalues: Sandbox (upval), Scout (upval), u40 (upval), u63 (upval), u44 (upval), i (val)
                            -- upvalues: a2 (val)
                            Sandbox:fireServer("SetDetection", Scout, u40, if not u63 then u44 else "Defaults", i, a1, a2)
                        end,
                    }))
                end
            end

            if not j[1] then
                renderStats(j)
            else
                for k, n in j do
                    renderStats(n, k)
                    renderStats(n.Stats, k)
                end
            end
        end
        return u61
    end, v11)
    local v13 = {u91, u92, u40, u44}
    v10 = useMemo(function() -- Line: 385
        -- upvalues: u44 (val), u54 (val), u40 (val), u92 (val), u91 (val), u195 (upval), createElement (upval)
        -- upvalues: StatsEntry (upval), u198 (upval), Icons (upval), u197 (upval), Sandbox (upval), Scout (val)
        local renderStats
        local u64 = {}
        local u66 = u44 == 0
        u54(u44)
        local v1 = if not u40 then u91 else if not u92 then u91 else u92
        local Defaults = if not u66 then v1.Upgrades[u44] or {} else v1.Defaults
        local v2 = {Defaults, Defaults.Stats}
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            function renderStats(a1, a2) -- Line: 402
                -- upvalues: u195 (upval), u44 (upval), u64 (val), createElement (upval), StatsEntry (upval)
                -- upvalues: u198 (upval), Icons (upval), u197 (upval), Sandbox (upval), Scout (upval), u40 (upval)
                -- upvalues: u66 (val)
                local v1, v2, v3, v4
                local v5 = nil
                local v6 = nil
                for i, j in a1, v5, v6 do
                    if u195[i] then
                        v4 = ("%*%*"):format(a2 and ("Path %*%*"):format(u44, (string.char(64 + a2))) or "", i)
                        v1 = createElement
                        v2 = {}
                        v3 = a2 and ("Path %*%*: %*"):format(u44, string.char(64 + a2), i) or i
                        v2.name = v3
                        v2.description = u198[i] or ""
                        v2.value = j
                        v2.icon = Icons[u197[i] or i]

                        function v2.onConfirm(a1) -- Line: 417
                            -- upvalues: Sandbox (upval), Scout (upval), u40 (upval), u66 (upval), u44 (upval), i (val)
                            -- upvalues: a2 (val)
                            Sandbox:fireServer("SetStats", Scout, u40, if not u66 then u44 else "Defaults", i, a1, a2)
                        end

                        u64[v4] = (v1(StatsEntry, v2))
                    end
                end
            end

            if not j[1] then
                renderStats(j)
            else
                for k, n in j do
                    renderStats(n, k)
                    renderStats(n.Stats, k)
                end
            end
        end
        return u64
    end, v13)
    local v14 = {u76}
    local u129 = useMemo(function() -- Line: 445 -- upvalues: u76 (val)
        local v1 = {}
        for i, j in u76 do
            table.insert(v1, i)
        end
        return v1
    end, v14)
    local v15 = {u129, u48}
    local u135 = useMemo(function() -- Line: 455 -- upvalues: u48 (val), u129 (val), Troops (upval), Enum (upval)
        local v1, v2
        local v3 = {}
        local v4 = u48 ~= nil
        local v5 = nil
        local v6 = nil
        for i, j in u129, v5, v6 do
            if not v4 or u48[j] then
                v1 = Troops(j)
                if v1 then
                    v2 = Enum.TowerCategory.ToString(v1.Properties.Category) or "Exclusive"
                    if not v3[v2] then
                        v3[v2] = {}
                    end
                    table.insert(v3[v2], j)
                end
            end
        end
        return v3
    end, v15)
    local v16 = {u76, u48, u8}
    v14 = useMemo(function() -- Line: 481
        -- upvalues: u135 (val), createElement (upval), TowersEntry (upval), u86 (val), u8 (val), Scout_2 (val)
        -- upvalues: u9 (val), u36 (val), Collapsible (upval), Enum (upval)
        local v1, v2, v3, v4, v5, v6, v7, v8
        local v9 = {}
        local v10 = nil
        local v11 = nil
        for i, j in u135, v10, v11 do
            v5 = {}
            v6 = false
            v7 = j
            v8 = nil
            v1 = nil
            for k, n in v7, v8, v1 do
                v6 = true
                v2 = createElement
                v3 = TowersEntry
                v4 = {
                    ignoreSelected = true,
                    idx = 1,
                    name = n,
                    skin = u86.Skin or "Default",
                    enabled = u8,
                    onClick = function() -- Line: 496 -- upvalues: Scout_2 (upval), n (val), u9 (upval)
                        Scout_2(n)
                        u9(false)
                    end,
                    Size = UDim2.fromScale(1, 1),
                }
                v5[n] = (v2(v3, v4))
            end
            if v6 then
                v5.grid = createElement("UIGridLayout", {
                    CellSize = UDim2.fromOffset(138, 138),
                    CellPadding = UDim2.fromOffset(15, 15),
                    SortOrder = u36,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                }, {ratio = createElement("UIAspectRatioConstraint")})
                v7 = createElement
                v8 = Collapsible
                v1 = {
                    name = i,
                    content = v5,
                    layoutOrder = tonumber(Enum.TowerCategory[i]) or 0,
                }
                v9[i] = (v7(v8, v1))
            end
        end
        return v9
    end, v16)
    local v17 = {u76}
    local u148 = React.useCallback(function(a1) -- Line: 530 -- upvalues: u129 (val), u49 (val)
        local v1 = {}
        for i, j in u129 do
            if a1(j) then
                v1[j] = true
            end
        end
        u49(v1)
    end, v17)
    if not v1 then
        return createElement(Paywall)
    end
    v16 = createElement
    local v18 = {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Visible = v7,
    }
    local v19 = {
        towerSelectionOverlay = createElement("ImageButton", {
            BorderSizePixel = 0,
            ZIndex = 100,
            ImageTransparency = 1,
            AutoButtonColor = false,
            Active = true,
            BackgroundTransparency = if not u8 then 1 else 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Visible = u8,
        }, {
            padding = createElement("UIPadding", {
                PaddingTop = UDim.new(0, 5),
                PaddingBottom = UDim.new(0, 5),
                PaddingLeft = UDim.new(0, 5),
                PaddingRight = UDim.new(0, 5),
            }),
            searchbox = createElement(Searchbox, {
                Text = "Search for Towers",
                OnSearch = function(a1) -- Line: 574 -- upvalues: u49 (val), u37 (val), fzy (upval), u129 (val), u148 (val)
                    if a1 == "" then
                        u49(nil)
                        u37(Enum.SortOrder.Name)
                        return
                    end
                    local u13 = fzy.filter(a1, u129, false, true)
                    table.sort(u13, function(a1, a2) -- Line: 582
                        local v1 = a1[3]
                        return a2[3] < v1
                    end)
                    u148(function(a1) -- Line: 586 -- upvalues: u13 (val), u129 (upval)
                        for i, j in u13 do
                            if u129[j[1]] == a1 and j[2] then
                                return true
                            end
                        end
                        return false
                    end)
                    u37(Enum.SortOrder.LayoutOrder)
                end,
            }),
            selection = createElement("ScrollingFrame", {
                BackgroundTransparency = 1,
                ClipsDescendants = true,
                TopImage = "",
                BottomImage = "",
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 1, -45),
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.fromScale(0.5, 1),
                Visible = v7,
                HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
                CanvasSize = UDim2.fromScale(1, 0),
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                ScrollingDirection = Enum.ScrollingDirection.Y,
            }, {
                padding = createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 15),
                    PaddingBottom = UDim.new(0, 10),
                    PaddingLeft = UDim.new(0, 12),
                    PaddingRight = UDim.new(0, 0),
                }),
                list = createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    FillDirection = Enum.FillDirection.Vertical,
                    Padding = UDim.new(0, 10),
                }),
                content = React.createElement(React.Fragment, {}, v14),
            }),
        }),
    }
    local v20 = createElement
    local v21 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 1, 0),
    }
    local v22 = {}
    local v23 = createElement
    local v24 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.5, 1),
        Position = UDim2.fromScale(0, 0),
    }
    local v25 = {}
    local v26 = createElement
    local v27 = {
        BackgroundTransparency = 1,
        LayoutOrder = 0,
        Size = UDim2.fromScale(1, 0.85),
        Position = UDim2.new(0.5, 0, 0, 10),
        AnchorPoint = Vector2.new(0.5, 0),
    }
    local v28 = {}
    local v29 = createElement
    local v30 = {
        Path = 1,
        Size = UDim2.new(1, -20, 1, 0),
        Transparency = v4,
        Name = Scout,
        Level = u44,
    }
    v30.Skin = u86 and u86.Skin or "Default"
    v28.viewport = v29(u205, v30)
    v29 = createElement
    v30 = {
        Size = UDim2.fromScale(1, 1),
        AutoButtonColor = false,
        ZIndex = 200,
        ImageTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(27, 27, 27),
        BorderSizePixel = 0,
        BackgroundTransparency = v3:map(function(a1) -- Line: 676 -- upvalues: math (upval)
            return math.map(a1, 0, 1, 1, 0.5)
        end),
    }

    v30[React.Event.Activated] = function() -- Line: 680 -- upvalues: u9 (val), u8 (val)
        u9(not u8)
    end

    v30[React.Event.MouseEnter] = function() -- Line: 684 -- upvalues: u8 (val), u17 (val)
        if u8 then
            return
        end
        u17({target = 1})
    end

    v30[React.Event.MouseLeave] = function() -- Line: 692 -- upvalues: u8 (val), u17 (val)
        if u8 then
            return
        end
        u17({target = 0})
    end

    v28.viewportSelectionButton = v29("ImageButton", v30, {
        switchTowerText = createElement(TextLabel, {
            BackgroundTransparency = 1,
            Text = "Switch Tower",
            FontWeight = "Bold",
            StrokeThickness = 2,
            Size = UDim2.fromScale(0.5, 0.5),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = v3:map(function(a1) -- Line: 706 -- upvalues: math (upval)
                return math.map(a1, 0, 1, 1, 0.5)
            end),
            StrokeColor = Color3.fromRGB(0, 0, 0),
            StrokeTransparency = v3:map(function(a1) -- Line: 712 -- upvalues: math (upval)
                return math.map(a1, 0, 1, 1, 0.5)
            end),
        }),
    })
    v28.towerTitle = createElement(TextLabel, {
        LayoutOrder = 1,
        ZIndex = 2,
        FontWeight = "Black",
        StrokeThickness = 4,
        Size = UDim2.fromScale(1, 0.1),
        Position = UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0),
        Transparency = v4,
        Text = Scout,
    })
    v25.view = v26("Frame", v27, v28)
    v25.towerLevel = createElement(TextLabel, {
        LayoutOrder = 1,
        ZIndex = 2,
        FontWeight = "Black",
        StrokeThickness = 4,
        Size = UDim2.fromScale(1, 0.06),
        Position = UDim2.fromScale(0.5, 0.83),
        AnchorPoint = Vector2.new(0.5, 0),
        Transparency = v4,
        Text = ("Level %*"):format(u44),
    })
    v26 = createElement
    v27 = {
        Size = UDim2.fromScale(0.12, 0.12),
        Position = UDim2.fromScale(0.95, 0.04),
        AnchorPoint = Vector2.new(1, 0),
        Visible = u92 ~= nil,
        LayoutOrder = 3,
        Transparency = v4,
        ZIndex = 201,
        AspectRatio = 1,
        Image = Icons.GoldenPerks,
        ImageColor3 = v5:map(function(a1) -- Line: 764
            return (Color3.fromRGB(0, 0, 0)):Lerp(Color3.fromRGB(255, 255, 255), a1)
        end),
        CornerRadius = 8,
        StrokeThickness = 4,
        StrokeColor = Color3.new(1, 1, 1),
        StrokeGradientColor = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(59, 59, 59)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(26, 26, 26))),
        }),
        StrokeGradientRotation = 90,
        BackgroundColor3 = Color3.fromRGB(27, 27, 27),
        BorderSizePixel = 0,
    }

    v27[React.Event.Activated] = function() -- Line: 781 -- upvalues: GoldenPerks (val), u41 (val), u40 (val)
        GoldenPerks()
        u41(not u40)
    end

    v25.goldenPerksSelection = v26(Button, v27, {
        Tooltip = createElement(Tooltip, {
            Name = "GoldenPerks",
            Disabled = false,
            Header = if not u40 then "Edit Golden Perks Stats" else "Edit Regular Stats",
        }),
    })
    v26 = createElement
    local v31 = Container
    v27 = {
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0.1),
        Position = UDim2.fromScale(0.5, 0.88),
        AnchorPoint = Vector2.new(0.5, 0),
    }
    v28 = {
        list = createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0, 20),
        }),
    }
    v29 = createElement
    local v32 = Button
    v30 = {
        Size = UDim2.fromOffset(28, 28),
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
    }

    v30[React.Event.Activated] = function() -- Line: 832 -- upvalues: u45 (val), math (upval), u44 (val), u91 (val)
        local clamp = math.clamp
        local Upgrades = u91.Upgrades or {}
        u45(clamp(u44 - 1, 0, #Upgrades))
    end

    v28.previousButton = v29(v32, v30)
    v28.levelIndicators = createElement("Frame", {
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Size = UDim2.fromScale(0, 0.7),
        AutomaticSize = Enum.AutomaticSize.X,
    }, {
        list = createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0, 5),
        }),
        children = React.createElement(React.Fragment, {}, v9),
    })
    v29 = createElement
    v32 = Button
    v30 = {
        Size = UDim2.fromOffset(28, 28),
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
        LayoutOrder = 2,
        PressSound = "New Click",
        HoverSound = "New Hover",
        HoverSizeScale = 1.2,
        DepressSizeScale = 0.85,
    }

    v30[React.Event.Activated] = function() -- Line: 880 -- upvalues: u45 (val), math (upval), u44 (val), u91 (val)
        local clamp = math.clamp
        local Upgrades = u91.Upgrades or {}
        u45(clamp(u44 + 1, 0, #Upgrades))
    end

    v28.forwardButton = v29(v32, v30)
    v25.levelSelection = v26(v31, v27, v28)
    v22.leftContent = v23("Frame", v24, v25)
    v22.rightContent = createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(1, 0),
        Size = UDim2.fromScale(0.5, 1),
        Position = UDim2.fromScale(1, 0),
    }, {
        statsContainer = createElement(Container, {
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            ZIndex = -1,
            StrokeThickness = 2,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 1),
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = Color3.fromRGB(27, 27, 27),
            StrokeColor = Color3.fromRGB(90, 90, 90),
        }, {
            stats = createElement("ScrollingFrame", {
                BackgroundTransparency = 1,
                ClipsDescendants = true,
                TopImage = "",
                BottomImage = "",
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0, 0),
                Visible = v7,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
                CanvasSize = UDim2.new(),
            }, {
                content = React.createElement(React.Fragment, {}, v10),
                detections = createElement(Container, {
                    LayoutOrder = 9999,
                    BackgroundTransparency = 0.5,
                    BorderSizePixel = 0,
                    CornerRadius = 8,
                    StrokeThickness = 2,
                    Size = UDim2.fromScale(1, 0.25),
                    BackgroundColor3 = Color3.fromRGB(27, 27, 27),
                    StrokeColor = Color3.fromRGB(90, 90, 90),
                }, {
                    list = createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        FillDirection = Enum.FillDirection.Horizontal,
                        Padding = UDim.new(0, 10),
                    }),
                    padding = createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 10),
                        PaddingBottom = UDim.new(0, 10),
                        PaddingLeft = UDim.new(0, 10),
                        PaddingRight = UDim.new(0, 10),
                    }),
                    children = React.createElement(React.Fragment, {}, v12),
                }),
                padding = createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 10),
                    PaddingBottom = UDim.new(0, 10),
                    PaddingLeft = UDim.new(0, 10),
                    PaddingRight = UDim.new(0, 10),
                }),
                list = createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.Name,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    FillDirection = Enum.FillDirection.Vertical,
                    Padding = UDim.new(0, 12),
                }),
            }),
        }),
    })
    v19.towerContent = v20("Frame", v21, v22)
    return v16("Frame", v18, v19)
end