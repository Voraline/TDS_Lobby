-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.Healthbar
-- Decompile time: 15.86 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local usePooledEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.usePooledEvent)
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local useEffect = React.useEffect
local useRef = React.useRef
local joinBindings = React.joinBindings
local u80 = Color3.fromRGB(211, 77, 77)
local u85 = Color3.fromRGB(106, 197, 106)
local u90 = Color3.new(1, 1, 1)
local u92 = Random.new()
local u93 = {}
u93[Enum.Team.Player] = Enum.Team.Enemy
u93[Enum.Team.Enemy] = Enum.Team.Player
u93[Enum.Team.Red] = Enum.Team.Blue
u93[Enum.Team.Blue] = Enum.Team.Red
return function() -- Line: 37
    -- upvalues: PlayerReplicator (val), Players (val), useGameStateValue (val), useReplicatedState (val), u93 (val)
    -- upvalues: useSound (val), useReactBinding (val), useRef (val), useSpring (val), joinBindings (val), Enum (val)
    -- upvalues: useEffect (val), u92 (val), usePooledEvent (val), RunService (val), createElement (val), u80 (val)
    -- upvalues: u85 (val), u90 (val)
    local u116, u38, u46, u54, v1, v2, v3
    local v4 = PlayerReplicator.GetEntityFromPlayer(Players.LocalPlayer)
    local HealthPerTeam = useGameStateValue("HealthPerTeam")
    local u12 = useGameStateValue("GameMode") == "PVP"
    local u17 = useReplicatedState(v4.Replicator, "Team")
    local u19 = u93[u17]
    local u23 = useSound("Damage", true)
    local u26, u27 = useReactBinding(Vector2.zero)
    local u30 = useRef(0)
    v3, _, u38 = useSpring(0, 1, 40, true)
    v1, _, u46 = useSpring(0, 1, 40, true)
    v2, _, u54 = useSpring(0, 1, 40, true)
    local u64 = joinBindings({v3, v1, v2}):map(function(a1) -- Line: 56
        return (math.max((unpack(a1))))
    end)
    local v5, u82 = useSpring(HealthPerTeam[Enum.Team.Red].Current / HealthPerTeam[Enum.Team.Red].Max, 1, 40, true)
    local v6, u99 = useSpring(HealthPerTeam[Enum.Team.Blue].Current / HealthPerTeam[Enum.Team.Blue].Max, 1, 40, true)
    _, u116 = useSpring(HealthPerTeam[Enum.Team.Player].Current / HealthPerTeam[Enum.Team.Player].Max, 1, 40, true)
    local u120, u121 = useReactBinding(HealthPerTeam[u17].Current)
    local u125, u126 = useReactBinding(HealthPerTeam[u19].Current)
    local u133, u134 = useReactBinding(HealthPerTeam[Enum.Team.Red].Current)
    local u141, u142 = useReactBinding(HealthPerTeam[Enum.Team.Blue].Current)
    local u149, u150 = useReactBinding(HealthPerTeam[Enum.Team.Player].Current)
    local v7 = {u12, HealthPerTeam}
    useEffect(function() -- Line: 93
        -- upvalues: u82 (val), HealthPerTeam (val), Enum (upval), u99 (val), u116 (val), u12 (val), u17 (val)
        -- upvalues: u120 (val), u23 (val), u92 (upval), u19 (val), u125 (val), u133 (val), u38 (val), u141 (val)
        -- upvalues: u46 (val), u149 (val), u54 (val), u121 (val), u126 (val), u134 (val), u142 (val), u150 (val)
        u82(HealthPerTeam[Enum.Team.Red].Current / HealthPerTeam[Enum.Team.Red].Max)
        u99(HealthPerTeam[Enum.Team.Blue].Current / HealthPerTeam[Enum.Team.Blue].Max)
        u116(HealthPerTeam[Enum.Team.Player].Current / HealthPerTeam[Enum.Team.Player].Max)
        if u12 then
            print("play sound")
            if HealthPerTeam[u17].Current < u120:getValue() then
                u23(u92:NextNumber(0.85, 1.1))
            end
            if HealthPerTeam[u19].Current < u125:getValue() then
                u23(u92:NextNumber(1.35, 1.51))
            end
        end
        if HealthPerTeam[Enum.Team.Red].Current < u133:getValue() then
            u38(1)
        end
        if HealthPerTeam[Enum.Team.Blue].Current < u141:getValue() then
            u46(1)
        end
        if HealthPerTeam[Enum.Team.Player].Current < u149:getValue() then
            u54(1)
        end
        u121(HealthPerTeam[u17].Current)
        u126(HealthPerTeam[u17].Current)
        u134(HealthPerTeam[Enum.Team.Red].Current)
        u142(HealthPerTeam[Enum.Team.Blue].Current)
        u150(HealthPerTeam[Enum.Team.Player].Current)
    end, v7)
    usePooledEvent(RunService.Heartbeat, function(a1) -- Line: 128 -- upvalues: u30 (val), u64 (val), u26 (val), u27 (val), u92 (upval)
        local v1 = u30
        v1.current = v1.current + a1
        if u30.current < 0.03333333333333333 then
            return
        end
        u30.current = 0
        v1 = u64:getValue() * 10
        if not (v1 <= 0) then
            u27(Vector2.new(u92:NextNumber(), u92:NextNumber()) * v1)
            return
        end
        if (u26:getValue()) ~= Vector2.zero then
            u27(Vector2.zero)
        end
    end)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(640, 60),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = u26:map(function(a1) -- Line: 150
            return UDim2.new(0.5, a1.X, 0, a1.Y)
        end),
        Visible = u12,
    }, {
        pvpBar = createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, -190, 0.5, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Visible = u12,
        }, {
            stroke = createElement("UIStroke", {
                Thickness = 2,
                LineJoinMode = Enum.LineJoinMode.Bevel,
                Color = Color3.new(1, 1, 1),
            }),
            redTeam = createElement("Frame", {
                BackgroundTransparency = 0.4,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.new(0, 0, 0),
                Position = UDim2.fromScale(0, 0.5),
                Size = UDim2.fromScale(0.5, 1),
            }, {
                fill = createElement("Frame", {
                    BorderSizePixel = 0,
                    BackgroundColor3 = v3:map(function(a1) -- Line: 177 -- upvalues: u80 (upval)
                        return (Color3.fromRGB(255, 71, 71)):Lerp(u80, a1)
                    end),
                    AnchorPoint = Vector2.new(1, 0),
                    Position = UDim2.fromScale(1, 0),
                    Size = v5:map(function(a1) -- Line: 183
                        return UDim2.fromScale(a1, 1)
                    end),
                }, {
                    gradient = createElement("UIGradient", {
                        Rotation = 90,
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(225, 225, 225)),
                            ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
                            (ColorSequenceKeypoint.new(1, Color3.fromRGB(225, 225, 225))),
                        }),
                    }),
                }),
                amount = createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    ZIndex = 2,
                    TextSize = 14,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(0.9, 0.6),
                    Font = Enum.Font.GothamBold,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Text = ("%* / %*"):format(HealthPerTeam[Enum.Team.Red].Current, HealthPerTeam[Enum.Team.Red].Max),
                    TextColor3 = Color3.new(1, 1, 1),
                }, {
                    stroke = createElement("UIStroke", {
                        Thickness = 2,
                        Transparency = 0.5,
                        Color = Color3.new(),
                        LineJoinMode = Enum.LineJoinMode.Round,
                    }),
                }),
                teamName = createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    ZIndex = 2,
                    Text = "Red Team",
                    TextSize = 14,
                    AnchorPoint = Vector2.new(0.5, 1),
                    Position = UDim2.new(0.5, 0, 0, -8),
                    Size = UDim2.fromScale(0.9, 0.6),
                    Font = if u17 ~= Enum.Team.Red then Enum.Font.GothamMedium else Enum.Font.GothamBlack,
                    TextColor3 = if u17 ~= Enum.Team.Red then u90 else u85,
                }, {
                    stroke = createElement("UIStroke", {
                        Thickness = 2,
                        Transparency = 0.5,
                        Color = Color3.new(),
                        LineJoinMode = Enum.LineJoinMode.Round,
                    }),
                }),
            }),
            blueTeam = createElement("Frame", {
                BackgroundTransparency = 0.4,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundColor3 = Color3.new(0, 0, 0),
                Position = UDim2.fromScale(1, 0.5),
                Size = UDim2.fromScale(0.5, 1),
            }, {
                fill = createElement("Frame", {
                    BorderSizePixel = 0,
                    BackgroundColor3 = v1:map(function(a1) -- Line: 247 -- upvalues: u80 (upval)
                        return (Color3.fromRGB(0, 170, 255)):Lerp(u80, a1)
                    end),
                    Size = v6:map(function(a1) -- Line: 251
                        return UDim2.fromScale(a1, 1)
                    end),
                }, {
                    gradient = createElement("UIGradient", {
                        Rotation = 90,
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(225, 225, 225)),
                            ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
                            (ColorSequenceKeypoint.new(1, Color3.fromRGB(225, 225, 225))),
                        }),
                    }),
                }),
                amount = createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    ZIndex = 2,
                    TextSize = 14,
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.9, 0.6),
                    TextColor3 = Color3.new(1, 1, 1),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    TextXAlignment = Enum.TextXAlignment.Right,
                    Font = Enum.Font.GothamBold,
                    Text = ("%* / %*"):format(HealthPerTeam[Enum.Team.Blue].Current, HealthPerTeam[Enum.Team.Blue].Max),
                }, {
                    stroke = createElement("UIStroke", {
                        Thickness = 2,
                        Transparency = 0.5,
                        Color = Color3.new(),
                        LineJoinMode = Enum.LineJoinMode.Round,
                    }),
                }),
                teamName = createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    ZIndex = 2,
                    Text = "Blue Team",
                    TextSize = 14,
                    AnchorPoint = Vector2.new(0.5, 1),
                    Position = UDim2.new(0.5, 0, 0, -8),
                    Size = UDim2.fromScale(0.9, 0.6),
                    Font = if u17 ~= Enum.Team.Blue then Enum.Font.GothamMedium else Enum.Font.GothamBlack,
                    TextColor3 = if u17 ~= Enum.Team.Blue then u90 else u85,
                }, {
                    stroke = createElement("UIStroke", {
                        Thickness = 2,
                        Transparency = 0.5,
                        Color = Color3.new(),
                        LineJoinMode = Enum.LineJoinMode.Round,
                    }),
                }),
            }),
            shadow = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ZIndex = -1,
                Image = "rbxassetid://405124116",
                ImageTransparency = 0.7,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.new(1, 28, 1, 28),
                ImageColor3 = Color3.new(),
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(12, 12, 115, 115),
            }),
            icon = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ZIndex = 2,
                Image = "rbxassetid://7245682360",
                ImageTransparency = 0.5,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromOffset(24, 24),
                ImageColor3 = Color3.new(),
                ScaleType = Enum.ScaleType.Fit,
            }),
        }),
    })
end