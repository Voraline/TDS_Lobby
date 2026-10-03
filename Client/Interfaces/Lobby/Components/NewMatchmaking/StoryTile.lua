-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.StoryTile
-- Decompile time: 13.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local MatchmakingStyle = require(script.Parent.MatchmakingStyle)
local StoryMissionCountdown = require(script.Parent.StoryMissionCountdown)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local TextMarquee = require(ReplicatedStorage.Client.Interfaces.Universal.Components.TextMarquee)
local useCountdown = require(ReplicatedStorage.Client.Interfaces.Hooks.useCountdown)
local useFontScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local useOnScreen = require(ReplicatedStorage.Client.Interfaces.Hooks.useOnScreen)
local createElement = React.createElement
local memo = React.memo
local useEffect = React.useEffect
local useRef = React.useRef
local u91 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(178, 178, 172)),
    ColorSequenceKeypoint.new(0.48, Color3.fromRGB(92, 92, 87)),
    (ColorSequenceKeypoint.new(1, Color3.fromRGB(31, 31, 28))),
})
local restingScale = MatchmakingStyle.motion.restingScale
local tileHoverScale = MatchmakingStyle.motion.tileHoverScale
local tilePressedScale = MatchmakingStyle.motion.tilePressedScale
local tileRevealStagger = MatchmakingStyle.motion.tileRevealStagger
local u104 = Font.fromName("Montserrat", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
local u109 = Font.fromName("Montserrat", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
local u114 = Font.fromName("Montserrat", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
local u120 = TweenInfo.new(MatchmakingStyle.motion.tileRevealDuration, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)

local function isPressInput(a1) -- Line: 66 -- types: a1: userdata
    local UserInputType = a1.UserInputType
    local v1 = true
    if UserInputType ~= Enum.UserInputType.MouseButton1 then
        v1 = true
        if UserInputType ~= Enum.UserInputType.Touch then
            if string.find(UserInputType.Name, "Gamepad", 1, true) == nil then
                v1 = true
                if a1.KeyCode ~= Enum.KeyCode.Return then
                    v1 = a1.KeyCode == Enum.KeyCode.Space
                end
            else
                v1 = true
                if a1.KeyCode ~= Enum.KeyCode.ButtonA then
                    v1 = true
                    if a1.KeyCode ~= Enum.KeyCode.Return then
                        v1 = a1.KeyCode == Enum.KeyCode.Space
                    end
                end
            end
        end
    end
    return v1
end

return memo(function(a1) -- Line: 76
    -- upvalues: useFontScale (val), MatchmakingStyle (val), useCountdown (val), StoryMissionCountdown (val)
    -- upvalues: useRef (val), useOnScreen (val), ReactFlow (val), restingScale (val), u120 (val), tileHoverScale (val)
    -- upvalues: useEffect (val), tilePressedScale (val), tileRevealStagger (val), createElement (val), u91 (val)
    -- upvalues: ImageLabel (val), TextMarquee (val), u104 (val), u109 (val), TextLabel (val), u114 (val), React (val)
    -- upvalues: isPressInput (val)
    local v1, v2
    local u3 = a1.locked == true
    local u7 = a1.selected == true
    local v3 = a1.compact == true
    local v4 = a1.condensed == true
    local v5 = useFontScale(MatchmakingStyle.getFontSize("header2", v3))
    local v6 = useFontScale(MatchmakingStyle.getFontSize("caption", v3))
    local v7 = useFontScale(MatchmakingStyle.getFontSize("micro", v3))
    local v8 = useFontScale(MatchmakingStyle.getFontSize("bodySmall", v3))
    local v9 = (useCountdown(if not u3 then nil else a1.unlocksAt)):map(function(a1) -- Line: 86 -- upvalues: StoryMissionCountdown (upval)
        return (("Mission Unlocks in %*"):format((StoryMissionCountdown.formatSecondsLeft(a1))))
    end)
    local u63 = useRef(false)
    local u66 = useRef(false)
    local v10 = useRef(nil)
    local v11 = useOnScreen({
        enabled = a1.railOnScreen ~= false,
        targetRef = v10,
        viewportRef = a1.viewportRef,
    })
    local u81 = v1 and v11
    local u93 = ("%*:%*"):format(a1.revealCycle or 0, a1.revealKey or a1.title)
    local u101 = math.max(a1.revealOrder or a1.layoutOrder or 1, 1)
    local u105 = useRef(u93)
    local u108 = useRef(nil)
    local v12, u125 = ReactFlow.useSpring({damper = 1, speed = 24, start = if not u7 then 0 else 1})
    local v13, u131 = ReactFlow.useSpring({damper = 0.72, speed = 28, start = restingScale})
    local v14, u137, u138 = ReactFlow.useTween({start = 0, target = 0, info = u120})

    local function setScale(a1) -- Line: 121 -- upvalues: u131 (val) -- types: a1: number
        u131({target = a1})
    end

    local function setHovered(a1) -- Line: 127
        -- upvalues: u3 (val), u63 (val), u66 (val), tileHoverScale (upval), restingScale (upval), u131 (val)
        if u3 then
            return
        end
        u63.current = a1
        if not a1 then
            u66.current = false
        end
        u131({target = if not a1 then restingScale else tileHoverScale})
    end

    local v15 = {u3}
    useEffect(function() -- Line: 140
        -- upvalues: u3 (val), u63 (val), u66 (val), restingScale (upval), tilePressedScale (upval)
        -- upvalues: tileHoverScale (upval), u131 (val)
        if u3 then
            u63.current = false
            u66.current = false
        end
        u131({
            target = if not u3 then if not u66.current then if not u63.current then restingScale else tileHoverScale else tilePressedScale else restingScale,
        })
    end, v15)
    v15 = {u7}
    useEffect(function() -- Line: 156 -- upvalues: u125 (val), u7 (val)
        u125({target = if not u7 then 0 else 1})
    end, v15)
    v15 = {u93, u101, u81}
    useEffect(function() -- Line: 162
        -- upvalues: u105 (val), u93 (val), u108 (val), u138 (val), u137 (val), u81 (val), tileRevealStagger (upval)
        -- upvalues: u101 (val)
        if u105.current ~= u93 then
            u105.current = u93
            u108.current = nil
            u138()
            u137({start = 1, target = 0}, true)
        end
        if u81 and u108.current ~= u93 then
            local u17 = false
            local u24 = task.delay(tileRevealStagger * (u101 - 1), function() -- Line: 178 -- upvalues: u17 (ref), u108 (upval), u93 (upval), u137 (upval)
                u17 = true
                u108.current = u93
                u137({start = 0, target = 1})
            end)
            return function() -- Line: 187 -- upvalues: u17 (ref), u24 (val)
                if not u17 then
                    task.cancel(u24)
                end
            end
        end
    end, v15)
    v15 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = false,
        LayoutOrder = a1.layoutOrder,
    }
    local size = a1.size or UDim2.fromOffset(360, 92)
    v15.Size = size
    v15.ref = v10
    local v16 = {}
    local v17 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Position = UDim2.fromOffset(0, -8),
        Size = UDim2.new(1, 0, 1, 16),
    }
    local v18 = {}
    local v19 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v14:map(function(a1) -- Line: 213
            return UDim2.fromScale(0.5, 1.5 - math.clamp(a1, 0, 1))
        end),
        Size = UDim2.new(1, 0, 1, -16),
    }
    local v20 = {}
    local v21 = {
        BorderSizePixel = 0,
        ClipsDescendants = false,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = MatchmakingStyle.colors.text,
        Position = v12:map(function(a1) -- Line: 223
            return UDim2.new(0.5, 0, 0.5, (math.round((math.clamp(a1, 0, 1)) * -6)))
        end),
        Size = UDim2.fromScale(1, 1),
    }
    local v22 = {
        Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.panel}),
    }
    v22.BevelGradient = createElement("UIGradient", {Rotation = 90, Color = u91})
    local v23 = {
        Active = false,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        GroupTransparency = 0,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(36, 35, 32),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, -4, 1, -4),
    }
    local v24 = {
        Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.small}),
    }
    v24.Image = createElement(ImageLabel, {
        BackgroundTransparency = 0,
        ZIndex = 1,
        disableSpinner = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(80, 80, 80),
        Image = a1.image or 138924286251630,
        Position = UDim2.fromScale(0.648808, 0.5),
        ScaleType = Enum.ScaleType.Crop,
        Size = UDim2.fromScale(0.7, 1),
    }, {
        Gradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.35, 0.395),
                NumberSequenceKeypoint.new(0.6, 0),
                (NumberSequenceKeypoint.new(1, 0)),
            }),
        }),
        Scale = createElement("UIScale", {Scale = v13}),
    })
    v24.Shade = createElement("Frame", {
        BackgroundTransparency = 0.74,
        BorderSizePixel = 0,
        ZIndex = 2,
        BackgroundColor3 = Color3.new(),
        Size = UDim2.fromScale(1, 1),
    })
    local v25 = {
        BackgroundTransparency = 1,
        ZIndex = 4,
        Position = UDim2.fromOffset(if not v3 then 16 else 12, if not v4 then if not v3 then 11 else 8 else 2),
        Size = UDim2.new(1, if not v3 then -32 else -24, 1, if not v4 then if not v3 then -22 else -16 else -4),
    }
    local v26 = {
        Layout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            Padding = UDim.new(0, MatchmakingStyle.spacing.micro),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    local v27 = createElement
    local v28 = TextMarquee
    local v29 = {
        alwaysMarquee = true,
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        TextScaled = false,
        ZIndex = 4,
        AnchorPoint = Vector2.zero,
        FontFace = u104,
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.new(1, 0, 0, 22),
        Text = a1.title,
        TextColor3 = MatchmakingStyle.colors.text,
        TextSize = v5,
        TextXAlignment = Enum.TextXAlignment.Left,
    }
    v26.Title = v27(v28, v29)
    v26.Subtitle = if not a1.subtitle then nil else createElement(TextMarquee, {
        alwaysMarquee = true,
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        TextScaled = false,
        ZIndex = 4,
        AnchorPoint = Vector2.zero,
        FontFace = u109,
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.new(1, 0, 0, 16),
        Text = a1.subtitle,
        TextColor3 = Color3.fromRGB(202, 202, 198),
        TextSize = v6,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    v26.Progress = if not a1.progressText then nil else createElement(TextLabel, {
        BackgroundTransparency = 1,
        FontWeight = "Bold",
        LayoutOrder = 3,
        TextScaled = false,
        ZIndex = 4,
        AnchorPoint = Vector2.zero,
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.new(1, 0, 0, 14),
        Text = a1.progressText,
        TextColor3 = Color3.fromRGB(137, 210, 255),
        TextSize = v7,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    v24.Content = createElement("Frame", v25, v26)
    v24.CutsceneDim = if not v4 or not u3 then nil else createElement("Frame", {
        Active = false,
        BackgroundTransparency = 0.42,
        BorderSizePixel = 0,
        ZIndex = 5,
        BackgroundColor3 = Color3.new(),
        Size = UDim2.fromScale(1, 1),
    })
    if not u3 or v4 then
        v2 = nil
    else
        v25 = {
            BackgroundTransparency = 0.28,
            BorderSizePixel = 0,
            ZIndex = 10,
            BackgroundColor3 = Color3.new(),
            Size = UDim2.fromScale(1, 1),
        }
        v26 = {}
        v29 = {
            BackgroundTransparency = 0.08,
            BorderSizePixel = 0,
            ZIndex = 11,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(18, 18, 17),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, -20, 0, 42),
        }
        local v30 = {
            Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.small}),
        }
        v30.Stroke = createElement("UIStroke", {
            Transparency = 0.38,
            Color = Color3.fromRGB(121, 121, 118),
            Thickness = MatchmakingStyle.strokeThickness.thin,
        })
        v30.Lock = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            Image = 137052204118126,
            ZIndex = 12,
            disableSpinner = true,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromOffset(10, 21),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromOffset(22, 22),
        })
        local v31 = {
            alwaysMarquee = true,
            BackgroundTransparency = 1,
            TextScaled = false,
            ZIndex = 12,
            AnchorPoint = Vector2.new(0, 0.5),
            FontFace = u114,
            Position = UDim2.fromOffset(40, 21),
            Size = UDim2.new(1, -50, 0, 30),
        }
        v31.Text = a1.unlocksAt and v9 or a1.lockReason or "Locked"
        v31.TextColor3 = Color3.fromRGB(244, 244, 241)
        v31.TextSize = v8
        v31.TextXAlignment = Enum.TextXAlignment.Left
        v30.Reason = createElement(TextMarquee, v31)
        v26.LockPill = createElement("Frame", v29, v30)
        v2 = createElement("Frame", v25, v26)
    end
    v24.Locked = v2
    v22.Surface = createElement("CanvasGroup", v23, v24)
    v22.BevelOverlay = createElement("Frame", {
        Active = false,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 29,
        Size = UDim2.fromScale(1, 1),
    }, {
        Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.panel}),
        Stroke = createElement("UIStroke", {
            Thickness = 2,
            Transparency = 0.12,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            BorderStrokePosition = Enum.BorderStrokePosition.Inner,
            Color = MatchmakingStyle.colors.text,
            LineJoinMode = Enum.LineJoinMode.Round,
        }, {Gradient = createElement("UIGradient", {Rotation = 90, Color = u91})}),
    })
    v22.SelectedOutline = createElement("Frame", {
        Active = false,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 30,
        Size = UDim2.fromScale(1, 1),
    }, {
        Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.panel}),
        Stroke = createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            BorderStrokePosition = Enum.BorderStrokePosition.Inner,
            Color = MatchmakingStyle.colors.text,
            LineJoinMode = Enum.LineJoinMode.Round,
            Transparency = v12:map(function(a1) -- Line: 468
                return 1 - math.clamp(a1, 0, 1)
            end),
            Thickness = v12:map(function(a1) -- Line: 471
                return math.clamp(a1, 0, 1) * 2 + 1
            end),
        }),
    })
    v23 = {
        Active = true,
        AutoButtonColor = false,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Selectable = not u3,
        Size = UDim2.fromScale(1, 1),
        Text = "",
        ZIndex = 40,
    }
    local Activated = React.Event.Activated
    v23[Activated] = not u3 and a1.onActivated or nil
    local InputBegan = React.Event.InputBegan
    v23[InputBegan] = not u3 and function(a1, a2) -- Line: 488
        -- upvalues: isPressInput (upval), u66 (val), tilePressedScale (upval), u131 (val)
        if not isPressInput(a2) then
            return
        end
        u66.current = true
        u131({target = tilePressedScale})
        return
    end or nil
    local InputEnded = React.Event.InputEnded
    v23[InputEnded] = not u3 and function(a1, a2) -- Line: 496
        -- upvalues: isPressInput (upval), u66 (val), u63 (val), tileHoverScale (upval), restingScale (upval)
        -- upvalues: u131 (val)
        if not isPressInput(a2) then
            return
        end
        u66.current = false
        u131({target = if not u63.current then restingScale else tileHoverScale})
        return
    end or nil

    v23[React.Event.MouseEnter] = function() -- Line: 504 -- upvalues: u3 (val), u63 (val), tileHoverScale (upval), u131 (val)
        if u3 then
            return
        end
        u63.current = true
        u131({target = tileHoverScale})
    end

    v23[React.Event.MouseLeave] = function() -- Line: 507 -- upvalues: u3 (val), u63 (val), u66 (val), restingScale (upval), u131 (val)
        if u3 then
            return
        end
        u63.current = false
        u66.current = false
        u131({target = restingScale})
    end

    local SelectionGained = React.Event.SelectionGained
    v23[SelectionGained] = not u3 and function() -- Line: 510 -- upvalues: u3 (val), u63 (val), tileHoverScale (upval), u131 (val)
        if u3 then
            return
        end
        u63.current = true
        u131({target = tileHoverScale})
        return
    end or nil
    local SelectionLost = React.Event.SelectionLost
    v23[SelectionLost] = not u3 and function() -- Line: 513 -- upvalues: u3 (val), u63 (val), u66 (val), restingScale (upval), u131 (val)
        if u3 then
            return
        end
        u63.current = false
        u66.current = false
        u131({target = restingScale})
        return
    end or nil
    v22.Hitbox = createElement("TextButton", v23)
    v20.Lift = createElement("Frame", v21, v22)
    v18.TileVisual = createElement("Frame", v19, v20)
    v16.RevealClip = createElement("CanvasGroup", v17, v18)
    return createElement("Frame", v15, v16)
end)