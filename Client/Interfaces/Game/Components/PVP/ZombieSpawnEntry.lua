-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.ZombieSpawnEntry
-- Decompile time: 28.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CircularProgressBar = require(ReplicatedStorage.Client.Interfaces.Universal.Components.CircularProgressBar)
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local Icons_2 = require(ReplicatedStorage.Shared.Data.Icons)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
require(ReplicatedStorage.Shared.Types.PVPConstantTypes)
local PVPConstants = require(ReplicatedStorage.Shared.Modules.PVPConstants)
local PVPUtilities = require(ReplicatedStorage.Shared.Modules.PVPUtilities)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local useEnemyStats = require(ReplicatedStorage.Client.Interfaces.Hooks.useEnemyStats)
local useServerTick = require(ReplicatedStorage.Client.Interfaces.Hooks.useServerTick)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local LegacyEnemies = Icons_2.LegacyEnemies
local Enemies = Icons_2.Enemies
local createElement = React.createElement
local useMemo = React.useMemo
local useEffect = React.useEffect
local PVP = NewNetwork.Channel("PVP")
return function(a1) -- Line: 44
    -- upvalues: useSpring (val), React (val), useMemo (val), PVPConstants (val), useEnemyStats (val), Enemies (val)
    -- upvalues: LegacyEnemies (val), PVPUtilities (val), useServerTick (val), Comma (val), useEffect (val)
    -- upvalues: useSound (val), Notification (val), createElement (val), PVP (val), Tooltip (val), Icons (val)
    -- upvalues: CircularProgressBar (val), ImageLabel (val)
    local name = a1.name
    local wave = a1.wave
    local idx = a1.idx
    local enabled = a1.enabled
    local entry = a1.entry
    local u7 = a1.difficulty or "PVP"
    local v1, u14 = useSpring(0, 1, 40, true)
    local v2, u21 = useSpring(0, 1, 40, true)
    local v3, u28 = useSpring(0, 1, 40, true)
    local u32, u33 = React.useState(false)
    local u37 = React.useRef(not u32)
    local zombieSpawnData = a1.zombieSpawnData or {}
    local u42 = a1.totalWaves or 0
    local v4 = {name, u7}
    local u50 = useMemo(function() -- Line: 63 -- upvalues: PVPConstants (upval), u7 (val), name (val)
        return (PVPConstants.getSpawnableEnemies(u7))[name] or {}
    end, v4)
    local v5 = useEnemyStats(name)
    local v6 = {name}
    v4 = useMemo(function() -- Line: 67 -- upvalues: Enemies (upval), name (val), LegacyEnemies (upval)
        return Enemies[name] or LegacyEnemies[name]
    end, v6)
    local SpawnHealth = if not v5 then 0 else if not v5.SpawnHealth then if not v5.HealthPerDifficulty then v5.MaxHealth or v5.Health else if not v5.HealthPerDifficulty[u7] then v5.MaxHealth or v5.Health else v5.HealthPerDifficulty[u7] else v5.SpawnHealth
    local Speed = if not v5 then 0 else v5.Speed
    local v7 = {wave, entry, u42}
    local v8 = React.useMemo(function() -- Line: 82 -- upvalues: PVPUtilities (upval), wave (val), entry (val), u42 (val)
        return PVPUtilities.getSpawnAmount(wave, entry, u42 or 40)
    end, v7)
    local v9 = useServerTick()
    local u102 = zombieSpawnData[name] or 0
    local v10, u109 = useSpring(0, 1, 30, true)
    local v11 = v9:map(function(a1) -- Line: 90 -- upvalues: u102 (val), u50 (val)
        return (a1 - u102) / (u50.PurchaseDebounceTime or 0)
    end)
    local v12 = v11:map(function(a1) -- Line: 93 -- upvalues: Comma (upval), u50 (val)
        return Comma((math.ceil((1 - a1) * (u50.PurchaseDebounceTime or 0))))
    end)
    local u124 = v11:map(function(a1) -- Line: 97 -- upvalues: u109 (val)
        local v1 = false
        if a1 >= 0 then
            v1 = a1 <= 1
        end
        u109(if not v1 then 0 else 1)
        return v1
    end)
    local v13 = u124:map(function(a1) -- Line: 102
        return not a1
    end)
    local v14 = {wave}
    useEffect(function() -- Line: 106 -- upvalues: wave (val), entry (val), u33 (val), u28 (val)
        local v1 = true
        if not (wave < (entry.StartWave or 1)) then
            v1 = (entry.EndWave or (1 / 0)) < wave
        end
        u33(v1)
        u28(if not v1 then 0 else 1)
    end, v14)
    local v15, u161 = useSpring(if not enabled then 0 else 1, 1, 30 - idx * 1.5, true)
    v14 = React.joinBindings({v1, v2, v15, v3})
    local HoverHotbar = useSound("HoverHotbar")
    local Click = useSound("Click")
    local v16 = {enabled}
    React.useEffect(function() -- Line: 121 -- upvalues: u161 (val), enabled (val)
        u161(if not enabled then 0 else 1)
    end, v16)
    local v17 = v15:map(function(a1) -- Line: 125
        return 1 - a1
    end)
    local v18 = React.joinBindings({v17, v3}):map(function(a1) -- Line: 130
        return a1[1] * a1[2]
    end)
    v16 = React.joinBindings({v15, v3}):map(function(a1) -- Line: 135
        return a1[1] * (1 - a1[2])
    end)
    local v19 = React.joinBindings({v15, v3}):map(function(a1) -- Line: 140
        return a1[1] * a1[2]
    end)
    local v20 = React.joinBindings({v3, v10})
    local v21 = v19:map(function(a1) -- Line: 146
        return 1 - a1
    end)
    local v22 = v16:map(function(a1) -- Line: 150
        return 1 - a1
    end)
    local v23 = {enabled, u32}
    useEffect(function() -- Line: 154
        -- upvalues: u37 (val), u32 (val), Enemies (upval), name (val), LegacyEnemies (upval), Notification (upval)
        local current = u37.current
        u37.current = not u32
        if current ~= u37.current and u37.current then
            local v1 = Enemies[name] or LegacyEnemies[name]
            if v1 and typeof(v1) == "string" then
                v1 = string.match(v1, "(%d+)")
                if v1 then
                    v1 = tonumber(v1)
                end
            end
            Notification.Create({Icon = v1, Text = ("Enemy \"%*\" is now available!"):format(name)})
            return
        end
    end, v23)
    v23 = {
        Size = UDim2.fromOffset(76, 92),
        BackgroundTransparency = 1,
        AutoButtonColor = u124:map(function(a1) -- Line: 179 -- upvalues: u32 (val)
            return not u32 and not a1
        end),
        Active = v13,
        LayoutOrder = entry.StartWave or 0,
        ImageTransparency = 1,
    }

    v23[React.Event.MouseEnter] = function() -- Line: 185 -- upvalues: u32 (val), u124 (val), HoverHotbar (val), u14 (val)
        if not u32 and not u124:getValue() then
            HoverHotbar()
            u14(1)
            return
        end
    end

    v23[React.Event.MouseLeave] = function() -- Line: 193 -- upvalues: u32 (val), u124 (val), HoverHotbar (val), u14 (val)
        if not u32 and not u124:getValue() then
            HoverHotbar()
            u14(0)
            return
        end
    end

    v23[React.Event.MouseButton1Down] = function() -- Line: 201 -- upvalues: u32 (val), u124 (val), u21 (val)
        if not u32 and not u124:getValue() then
            u21(1)
            return
        end
    end

    v23[React.Event.MouseButton1Up] = function() -- Line: 208 -- upvalues: u32 (val), u124 (val), u21 (val)
        if not u32 and not u124:getValue() then
            u21(0)
            return
        end
    end

    v23[React.Event.Activated] = function() -- Line: 215 -- upvalues: u32 (val), u124 (val), Click (val), PVP (upval), name (val)
        if not u32 and not u124:getValue() then
            Click()
            PVP:fireServer("SpawnEnemy", name)
            return
        end
    end

    return createElement("ImageButton", v23, {
        scale = createElement("UIScale", {
            Scale = v14:map(function(a1) -- Line: 225
                return 1 + a1[1] * (1 - a1[2]) * 0.1 - a1[2] * 0.1
            end),
        }),
        content = createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(43, 43, 43),
            BackgroundTransparency = v15:map(function(a1) -- Line: 233
                return math.map(a1, 0, 1, 1, 0.25)
            end),
        }, {
            corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
            gradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(45, 45, 45)),
            }),
            stroke = createElement("UIStroke", {
                Color = Color3.fromRGB(115, 116, 128),
                LineJoinMode = Enum.LineJoinMode.Round,
                Transparency = v17,
            }),
            Tooltip = createElement(Tooltip, {
                Subject = "Enemy Stats",
                Name = name,
                Header = name,
                Disabled = not enabled,
                Content = {
                    {Icon = Icons.EnemyHealth, Text = Comma(SpawnHealth)},
                    {Icon = Icons.EnemySpeed, Text = Comma(Speed)},
                },
            }),
            cooldown = createElement("Frame", {
                BackgroundTransparency = 1,
                ZIndex = 20,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromOffset(64, 64),
                Visible = u124,
            }, {
                counter = createElement("TextLabel", {
                    ZIndex = 4,
                    BackgroundTransparency = 1,
                    TextSize = 24,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromOffset(32, 32),
                    Visible = u124,
                    Text = v12,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    Font = Enum.Font.GothamBlack,
                }, {
                    stroke = createElement("UIStroke", {
                        Transparency = 0,
                        Thickness = 2,
                        LineJoinMode = Enum.LineJoinMode.Round,
                    }),
                }),
                timer = CircularProgressBar({Alpha = v11}),
            }),
            income = createElement("Frame", {
                BackgroundTransparency = 1,
                ZIndex = 4,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 1, -20),
                Size = UDim2.new(1.2, 0, 0, 20),
                Visible = v13,
            }, {
                list = createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                }),
                icon = createElement("ImageLabel", {
                    Image = "rbxassetid://16913572623",
                    BackgroundTransparency = 1,
                    LayoutOrder = 0,
                    Size = UDim2.fromOffset(16, 16),
                    ImageColor3 = Color3.fromRGB(255, 170, 0),
                    ImageTransparency = v22,
                }),
                value = createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    TextSize = 14,
                    AutomaticSize = Enum.AutomaticSize.X,
                    Size = UDim2.fromOffset(25, 20),
                    Font = Enum.Font.GothamBold,
                    TextColor3 = Color3.fromRGB(255, 170, 0),
                    TextTransparency = v22,
                    Text = ("$%*"):format((Comma(entry.Eco or 0))),
                }, {
                    stroke = createElement("UIStroke", {
                        Thickness = 4,
                        Transparency = v16:map(function(a1) -- Line: 326
                            return math.map(a1, 0, 1, 1, 0.5)
                        end),
                        LineJoinMode = Enum.LineJoinMode.Round,
                    }),
                }),
            }),
            icon = createElement(ImageLabel, {
                BackgroundTransparency = 1,
                ZIndex = 2,
                Image = v4,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, -8),
                Size = UDim2.fromOffset(72, 72),
                ScaleType = Enum.ScaleType.Fit,
                ImageColor3 = v20:map(function(a1) -- Line: 343
                    return (Color3.new(1, 1, 1)):Lerp(Color3.fromRGB(53, 53, 53), (math.max(a1[1], a1[2])))
                end),
                ImageTransparency = v17,
            }),
            lock = createElement("ImageLabel", {
                Image = "rbxassetid://1197061307",
                BackgroundTransparency = 1,
                ZIndex = 10,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, -8),
                Size = v18:map(function(a1) -- Line: 355
                    return (UDim2.fromOffset(38, 38)):Lerp(UDim2.new(), a1)
                end),
                ImageTransparency = v21,
            }),
            price = createElement("TextLabel", {
                BackgroundTransparency = 1,
                ZIndex = 4,
                TextSize = 16,
                TextWrapped = true,
                AutomaticSize = Enum.AutomaticSize.X,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Visible = v13,
                Position = UDim2.fromScale(0.5, 1),
                Size = UDim2.new(1.2, 0, 0, 20),
                Font = Enum.Font.GothamBlack,
                TextColor3 = Color3.fromRGB(53, 213, 67),
                TextTransparency = v22,
                Text = ("$%*"):format((Comma(entry.Cost))),
            }, {
                stroke = createElement("UIStroke", {
                    Thickness = 4,
                    Transparency = v16:map(function(a1) -- Line: 378
                        return math.map(a1, 0, 1, 1, 0.5)
                    end),
                    LineJoinMode = Enum.LineJoinMode.Round,
                }),
            }),
            wave = createElement("TextLabel", {
                BackgroundTransparency = 1,
                ZIndex = 4,
                TextSize = 16,
                TextWrapped = true,
                AutomaticSize = Enum.AutomaticSize.X,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 1, -16),
                Size = UDim2.new(1.2, 0, 0, 20),
                Font = Enum.Font.GothamBlack,
                TextColor3 = Color3.fromRGB(200, 200, 200),
                TextTransparency = v21,
                Text = ("Wave: %*"):format((Comma(entry.StartWave or 1))),
            }, {
                stroke = createElement("UIStroke", {
                    Thickness = 4,
                    Transparency = v19:map(function(a1) -- Line: 401
                        return math.map(a1, 0, 1, 1, 0.5)
                    end),
                    LineJoinMode = Enum.LineJoinMode.Round,
                }),
            }),
            count = createElement("TextLabel", {
                Rotation = -8,
                BackgroundTransparency = 1,
                ZIndex = 4,
                TextSize = 16,
                TextWrapped = true,
                AutomaticSize = Enum.AutomaticSize.X,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromOffset(8, 8),
                Size = UDim2.fromOffset(24, 24),
                Font = Enum.Font.GothamBlack,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextTransparency = v22,
                Visible = entry.PurchaseAmount ~= nil,
                Text = if not entry.PurchaseAmount then "" else ("x%*"):format((Comma(v8))),
            }, {
                stroke = createElement("UIStroke", {
                    Thickness = 4,
                    Transparency = v16:map(function(a1) -- Line: 426
                        return math.map(a1, 0, 1, 1, 0.5)
                    end),
                    LineJoinMode = Enum.LineJoinMode.Round,
                }),
            }),
        }),
    })
end