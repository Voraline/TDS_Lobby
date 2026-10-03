-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.Topbar
-- Decompile time: 5.32 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local PVPHealthBar = require(ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPHealthBar)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local useGameRule = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameRule)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local usePropertyBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.usePropertyBinding)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local useTagReplicatorInstance = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicatorInstance)
require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicators)
local createElement = React.createElement
local useEffect = React.useEffect
local u105 = Color3.fromRGB(211, 77, 77)
;(NewNetwork.Channel("Sound")):onUnreliableEvent("PlaySound", function(a1) -- Line: 30 -- upvalues: Sound (val) -- types: a1: string
    Sound(a1):Play()
end)

local function withPVPLogic(a1) -- Line: 34 -- upvalues: useGameStateValue (val), createElement (val)
    local v1 = useGameStateValue("GameMode") == "PVP"
    local Intermission = useGameStateValue("Intermission")
    if v1 and not Intermission then
        return createElement(a1)
    end
    return nil
end

local function RenderTopBar() -- Line: 45
    -- upvalues: useSound (val), useTagReplicatorInstance (val), Players (val), useReplicatedState (val)
    -- upvalues: useSpring (val), useGameStateValue (val), Enum (val), useGameRule (val), useEffect (val)
    -- upvalues: usePropertyBinding (val), ReplicatedStorage (val), createElement (val), useScale (val), Comma (val)
    -- upvalues: u105 (val), PVPHealthBar (val)
    local u21, u29, v1, v2
    local Timer = useSound("Timer")
    local v3 = useReplicatedState(useTagReplicatorInstance(Players.LocalPlayer, "Replicator", "EnemyQueue"), "Modifiers", {})
    v1, _, u21 = useSpring(0, 1, 40, true)
    v2, _, u29 = useSpring(0, 1, 40, true)
    local Wave = useGameStateValue("Wave")
    local HealthPerTeam = useGameStateValue("HealthPerTeam")
    local v4 = HealthPerTeam[Enum.Team.Red]
    local v5 = HealthPerTeam[Enum.Team.Blue]
    local LowDamage = useSound("LowDamage")
    local MediumDamage = useSound("MediumDamage")
    local FatalHealth = useSound("FatalHealth")
    local HealthHeal = useSound("HealthHeal")
    local ShieldDamage = useSound("ShieldDamage")
    local Invincible = useGameRule("Invincible")
    local v6 = Invincible or v4 and 900000000 <= v4.Current
    local v7 = Invincible or v5 and 900000000 <= v5.Current
    local v8 = {Wave}
    useEffect(function() -- Line: 70 -- upvalues: u21 (val)
        u21(1)
    end, v8)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Visible = true,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.fromOffset(640, 60),
    }, {
        uiScale = createElement("UIScale", {Scale = useScale(1.5)}),
        waveTitle = createElement("TextLabel", {
            BackgroundTransparency = 1,
            ZIndex = 2,
            TextSize = 20,
            Text = "Wave:",
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0, 0),
            Size = UDim2.fromOffset(60, 20),
            Font = Enum.Font.GothamMedium,
            TextColor3 = Color3.new(1, 1, 1),
        }, {
            stroke = createElement("UIStroke", {Thickness = 3, Transparency = 0.35, LineJoinMode = Enum.LineJoinMode.Round}),
        }),
        wave = createElement("TextLabel", {
            BackgroundTransparency = 1,
            ZIndex = 2,
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.new(0, 60, 1, -20),
            Font = Enum.Font.GothamBlack,
            Text = Comma(Wave),
            TextColor3 = v1:map(function(a1) -- Line: 134 -- upvalues: u105 (upval)
                return (Color3.new(1, 1, 1)):Lerp(u105, a1)
            end),
        }, {
            gradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                    ColorSequenceKeypoint.new(0.6, Color3.new(1, 1, 1)),
                    ColorSequenceKeypoint.new(0.601, Color3.fromRGB(235, 235, 235)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(235, 235, 235))),
                }),
            }),
            stroke = createElement("UIStroke", {Thickness = 3, Transparency = 0.35, LineJoinMode = Enum.LineJoinMode.Round}),
            scale = createElement("UIScale", {
                Scale = v1:map(function(a1) -- Line: 153 -- types: a1: number
                    return a1 * 0.2 + 1
                end),
            }),
        }),
        timerTitle = createElement("Frame", {
            BackgroundTransparency = 1,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0),
            AutomaticSize = Enum.AutomaticSize.X,
            Size = UDim2.fromOffset(60, 20),
            Position = UDim2.fromScale(1, 0),
        }, {
            title = createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "Time Left:",
                TextSize = 20,
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2.fromOffset(0, 20),
                Font = Enum.Font.GothamMedium,
                TextColor3 = Color3.fromRGB(222, 222, 222),
            }, {
                padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 26)}),
                stroke = createElement("UIStroke", {Thickness = 3, Transparency = 0.35}),
            }),
            icon = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://5577896365",
                Size = UDim2.fromOffset(24, 24),
                Position = UDim2.fromOffset(0, 0.5),
                ScaleType = Enum.ScaleType.Fit,
            }),
        }),
        time = createElement("TextLabel", {
            BackgroundTransparency = 1,
            ZIndex = 2,
            TextSize = 36,
            TextWrapped = false,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(1, 1),
            Size = UDim2.new(0, 90, 1, -20),
            Font = Enum.Font.GothamBlack,
            Text = (usePropertyBinding(ReplicatedStorage.State.Timer.Time, "Value")):map(function(a1) -- Line: 75 -- upvalues: ReplicatedStorage (upval), Timer (val), u29 (val)
                if a1 < 5 then
                    if ReplicatedStorage.State.Timer.Sound.Value and a1 > 0 then
                        Timer()
                    end
                    u29(1)
                end
                if a1 > 10000 then
                    return "∞"
                end
                local v1 = (a1 - a1 % 60) / 60
                local v2 = a1 - v1 * 60
                return (("%*:%*"):format(string.format("%02i", v1), (string.format("%02i", v2))))
            end),
            TextColor3 = v2:map(function(a1) -- Line: 202 -- upvalues: u105 (upval)
                return (Color3.new(1, 1, 1)):Lerp(u105, a1)
            end),
        }, {
            gradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                    ColorSequenceKeypoint.new(0.6, Color3.new(1, 1, 1)),
                    ColorSequenceKeypoint.new(0.601, Color3.fromRGB(235, 235, 235)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(235, 235, 235))),
                }),
            }),
            stroke = createElement("UIStroke", {Thickness = 3, Transparency = 0.35, LineJoinMode = Enum.LineJoinMode.Round}),
            scale = createElement("UIScale", {
                Scale = v2:map(function(a1) -- Line: 221 -- types: a1: number
                    return a1 * 0.2 + 1
                end),
            }),
        }),
        healthbar = createElement(PVPHealthBar, {
            leftHealth = v4.Current,
            leftMaxHealth = v4.Max,
            leftInvincible = v6,
            rightHealth = v5.Current,
            rightMaxHealth = v5.Max,
            rightInvincible = v7,
            modifiers = v3,
            lowHealthSound = LowDamage,
            mediumHealthSound = MediumDamage,
            fatalHealthSound = FatalHealth,
            healHealthSound = HealthHeal,
            shieldDamageSound = ShieldDamage,
        }),
    })
end

return function() -- Line: 244 -- upvalues: withPVPLogic (val), RenderTopBar (val)
    return withPVPLogic(RenderTopBar)
end