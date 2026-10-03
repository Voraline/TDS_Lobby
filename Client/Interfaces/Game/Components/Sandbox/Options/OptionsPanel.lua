-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Options.OptionsPanel
-- Decompile time: 8.60 ms

local v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local BooleanOption = require(ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Options.OptionTypes.BooleanOption)
local ButtonOption = require(ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Options.OptionTypes.ButtonOption)
local Collapsible = require(ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Collapsible)
local Container = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.BaseComponents.Container)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameRules = require(ReplicatedStorage.Shared.Modules.GameRules)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.BaseComponents.ImageLabel)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local NumberOption = require(ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Options.OptionTypes.NumberOption)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local useEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.useEvent)
local useMouse = require(ReplicatedStorage.Client.Interfaces.Hooks.useMouse)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)

local function map(a1, a2, a3, a4, a5) -- Line: 32
    return (a1 - a2) / (a3 - a2) * (a5 - a4) + a4
end

local createElement = React.createElement
local useEffect = React.useEffect
local Sandbox = NewNetwork.Channel("Sandbox")
local u134 = {number = NumberOption, button = ButtonOption, boolean = BooleanOption}
local u135 = {button = true}
local v2 = {
    [Enum.Modifier.Bloated] = true,
    [Enum.Modifier.Aggro] = true,
    [Enum.Modifier.Boss] = true,
    [Enum.Modifier.HealthRegen] = true,
    [Enum.Modifier.Flying] = true,
    [Enum.Modifier.Ghost] = true,
    [Enum.Modifier.Hidden] = true,
    [Enum.Modifier.Lead] = true,
    [Enum.Modifier.Slime] = true,
    [Enum.Modifier.MoltenCorpse] = true,
}
local u167 = {
    Enemies = {
        EnemySpawnAmount = {type = "number", displayName = "Spawn Amount", max = 100, min = 1},
        EnemySpawnDelay = {type = "number", displayName = "Spawn Delay", max = 100, min = 0.01},
    },
    Gamemodes = {
        VoteSkipEnabled = {type = "boolean", displayName = "Enable Vote Skip"},
        HiddenWave = {type = "boolean", displayName = "Hidden Wave"},
    },
    Units = {
        UnitSpawnAmount = {type = "number", displayName = "Spawn Amount", max = 100, min = 1},
        UnitSpawnDelay = {type = "number", displayName = "Spawn Delay", max = 100, min = 0.01},
    },
    Towers = {
        GoldenPerks = {type = "boolean", displayName = "Golden Perks"},
        Level = {type = "number", max = 10, min = 0, displayName = "Tower Level"},
    },
}
u167.Global = {
    KillAll = {
        type = "button",
        displayName = "Clear Enemies",
        iconTransparency = 0.5,
        color = Color3.fromRGB(126, 57, 57),
        icon = Icons.ExplosionDamage,
        iconColor = Color3.fromRGB(0, 0, 0),
        activate = function() -- Line: 147 -- upvalues: Sandbox (val)
            Sandbox:fireServer("KillAll")
        end,
    },
    KillUnits = {
        type = "button",
        displayName = "Clear Units",
        icon = "rbxassetid://5547581690",
        iconTransparency = 0.5,
        color = Color3.fromRGB(126, 57, 57),
        iconColor = Color3.fromRGB(0, 0, 0),
        activate = function() -- Line: 162 -- upvalues: Sandbox (val)
            Sandbox:fireServer("KillUnits")
        end,
    },
    KillTowers = {
        type = "button",
        displayName = "Clear Towers",
        icon = "rbxassetid://5547581690",
        iconTransparency = 0.5,
        color = Color3.fromRGB(126, 57, 57),
        iconColor = Color3.fromRGB(0, 0, 0),
        activate = function() -- Line: 177 -- upvalues: Sandbox (val)
            Sandbox:fireServer("KillTowers")
        end,
    },
    Restart = {
        type = "button",
        displayName = "Restart Game",
        icon = "rbxassetid://5547581690",
        iconTransparency = 0.5,
        color = Color3.fromRGB(126, 57, 57),
        iconColor = Color3.fromRGB(0, 0, 0),
        activate = function() -- Line: 192 -- upvalues: Sandbox (val)
            Sandbox:fireServer("RestartGame")
        end,
    },
    CancelTimer = {
        type = "button",
        displayName = "Cancel Timer",
        icon = "rbxassetid://5547581690",
        iconTransparency = 0.5,
        color = Color3.fromRGB(126, 57, 57),
        iconColor = Color3.fromRGB(0, 0, 0),
        activate = function() -- Line: 207 -- upvalues: Sandbox (val)
            Sandbox:fireServer("CancelTimer")
        end,
    },
    Timescale = {type = "number", max = 10, min = 0},
    Health = {type = "number", max = 10000000, min = 1},
    DesiredWave = {type = "number", displayName = "Desired Wave", max = 100, min = 0},
    Pause = {type = "boolean", displayName = "Pause"},
    Invincible = {type = "boolean", displayName = "Invincible"},
    InfiniteCash = {type = "boolean", displayName = "Infinite Cash"},
    InfiniteTowers = {type = "boolean", displayName = "Infinite Towers"},
    NoConsumableCooldowns = {type = "boolean", displayName = "Consumable Cooldowns"},
    MusicEnabled = {type = "boolean", displayName = "Music Enabled"},
    SkillsEnabled = {type = "boolean", displayName = "Skills Enabled"},
}
local v3 = {}
local v4 = {}
u167["Enemies (Modifiers)"] = v3
u167["Units (Modifiers)"] = v4
local v5 = {}
for i in v2 do
    v1 = Enum.Modifier.ToString(i)
    v3[(("Enemies%*"):format(v1))] = {type = "boolean", displayName = v1}
    if not v5[i] then
        v4[(("Units%*"):format(v1))] = {type = "boolean", displayName = v1}
    end
end
return function(a1) -- Line: 301
    -- upvalues: ReactCharm (val), SandboxStore (val), useEvent (val), GameRules (val), React (val), u167 (val)
    -- upvalues: u135 (val), createElement (val), Container (val), TextLabel (val), u134 (val), Collapsible (val)
    -- upvalues: useSpring (val), useEffect (val), useMouse (val), RunService (val), ImageLabel (val)
    local u5 = ReactCharm.useSignalState(SandboxStore.getState)
    useEvent(GameRules.Changed(), function(a1, a2) -- Line: 304 -- upvalues: SandboxStore (upval)
        SandboxStore.setOption(a1, a2, true)
    end, {})
    local useMemo = React.useMemo
    local v1 = {u5.SelectedTab}
    local v2 = useMemo(function() -- Line: 308
        -- upvalues: u5 (val), u167 (upval), u135 (upval), SandboxStore (upval), createElement (upval)
        -- upvalues: Container (upval), TextLabel (upval), u134 (upval), Collapsible (upval)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
        local v11 = {}
        local v12 = {}
        v12[u5.SelectedTab] = u167[u5.SelectedTab]
        v12.Global = u167.Global
        for i, j in u167 do
            if (string.gsub(i, " %b()", "")) == u5.SelectedTab then
                v12[i] = j
            end
        end
        local v13 = nil
        local v14 = nil
        for k, n in v12, v13, v14 do
            v8 = {}
            v9 = {}
            for m, i5 in n do
                table.insert(v9, i5.displayName or m)
            end
            table.sort(v9)
            v1 = nil
            v2 = nil
            for i6, i7 in n, v1, v2 do
                v3 = table.clone(i7)
                v3.id = i6
                v4 = table.find(v9, v3.displayName or i6)
                if not u135[v3.type] then
                    function v3.activate(a1) -- Line: 339 -- upvalues: SandboxStore (upval), i6 (val)
                        SandboxStore.setOption(i6, a1)
                    end
                end
                v5 = createElement
                v6 = {
                    CornerRadius = 8,
                    StrokeTransparency = 1,
                    Size = UDim2.new(1, -10, 0, 30),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.fromScale(1, 0.5),
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    BackgroundTransparency = if v4 % 2 == 0 then 0.25 else 1,
                }
                v7 = {
                    padding = createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 10),
                        PaddingRight = UDim.new(0, 10),
                        PaddingTop = UDim.new(0, 5),
                        PaddingBottom = UDim.new(0, 5),
                    }),
                    content = createElement(TextLabel, {
                        FontWeight = "Bold",
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        Text = v3.displayName or i6,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center,
                        Size = UDim2.fromScale(1, 1),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                    }, {
                        content = createElement("Frame", {
                            BackgroundTransparency = 1,
                            AnchorPoint = Vector2.new(1, 0.5),
                            Position = UDim2.fromScale(1, 0.5),
                            Size = UDim2.fromScale(0.5, 1),
                        }, {container = createElement(u134[v3.type], v3)}),
                    }),
                }
                v8[i6] = (v5(Container, v6, v7))
            end
            v8.list = createElement("UIListLayout", {
                Padding = UDim.new(0, 6),
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                VerticalAlignment = Enum.VerticalAlignment.Top,
            })
            v10 = if k ~= "Global" then k else "zzz"
            v11[v10] = (createElement(Collapsible, {openedByDefault = true, corner = 0, name = k, content = v8}))
        end
        return v11
    end, v1)
    local u22 = React.useRef(nil)
    local u26, u27 = React.useState(true)
    local PanelEnabled = u5.PanelEnabled
    local v3, u35 = useSpring(0, 0.8, 15, true)
    local v4, u42 = useSpring(0, 0.8, 13, true)
    local v5, u49 = useSpring(0, 1, 30, true)
    local v6, u56 = useSpring(0, 1, 30, true)
    local v7 = useEffect
    local v8 = {u26, u5.PanelEnabled, u5.PanelDisabledModifier}
    v7(function() -- Line: 416 -- upvalues: u5 (val), u26 (val), u35 (val), u42 (val)
        local v1
        local PanelEnabled = u5.PanelEnabled and not next(u5.PanelDisabledModifier)
        u35(if not u26 then 0 else if not PanelEnabled then 0 else 1)
        u42(v1)
    end, v8)
    local u65, u66 = useMouse()
    useEvent(RunService.Heartbeat, function(a1) -- Line: 427 -- upvalues: u22 (val), u65 (val), u66 (val), u49 (val)
        if not u22.current then
            return
        end
        u49((math.clamp((((Vector2.new(u65:getValue(), u66:getValue())) - u22.current.AbsolutePosition).Magnitude - 40) / 80 * 1 + 0, 0.25, 1)))
    end, {})
    v8 = useEffect
    local v9 = {u5.PanelEnabled}
    v8(function() -- Line: 439 -- upvalues: u56 (val), u5 (val)
        u56(if not u5.PanelEnabled then 0 else 1)
    end, v9)
    v8 = createElement
    v9 = {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(1.005, 0.5),
        Size = UDim2.fromScale(0.4, 1),
        Visible = PanelEnabled,
    }
    local v10 = {}
    local v11 = createElement
    local v12 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromOffset(40, 25),
        Position = v4:map(function(a1) -- Line: 455
            return (UDim2.fromScale(math.clamp(a1 - 1, -0.95, 0), 0.5)) + UDim2.new(1, 0, 0, 0)
        end),
        BackgroundTransparency = 1,
        ZIndex = 10,
        Rotation = v4:map(function(a1) -- Line: 461
            return 90 + a1 * 180
        end),
        ImageColor3 = Color3.fromRGB(150, 150, 150),
        Image = "rbxassetid://13069495837",
        ImageTransparency = v5,
    }

    v12[React.Event.Activated] = function() -- Line: 470 -- upvalues: u27 (val), u26 (val)
        u27(not u26)
    end

    v12.ref = u22
    v10.expand = v11("ImageButton", v12, {scale = createElement("UIScale", {Scale = 0.75})})
    v10.content = createElement(Container, {
        BackgroundTransparency = 0.25,
        CornerRadius = 8,
        StrokeThickness = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v3:map(function(a1) -- Line: 483
            return UDim2.new(a1 - 0.5, 0, 0.5, 0)
        end),
        Size = UDim2.new(1, -14, 1, -14),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        StrokeColor = Color3.fromRGB(90, 90, 90),
        Transparency = v6:map(function(a1) -- Line: 496
            return 1 - a1
        end),
    }, {
        dropShadow = createElement(ImageLabel, {
            ZIndex = -1,
            Image = "rbxassetid://9239716855",
            ImageTransparency = 0.2,
            Size = UDim2.new(1, 14, 1, 14),
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(14, 14, 64, 24),
            Transparency = v6:map(function(a1) -- Line: 510
                return 1 - a1
            end),
        }),
        tabContent = createElement("ScrollingFrame", {
            BackgroundTransparency = 1,
            TopImage = "",
            BottomImage = "",
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(1, 0.5),
            Size = UDim2.new(1, 0, 1, 0),
            CanvasSize = UDim2.fromScale(0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
        }, {
            list = createElement("UIListLayout", {
                Padding = UDim.new(0, 4),
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
            }),
            createElement(React.Fragment, {}, v2),
        }),
    })
    return v8("Frame", v9, v10)
end