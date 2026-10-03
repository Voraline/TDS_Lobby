-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.MatchmakingCard
-- Decompile time: 19.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local MatchmakingCardHoverDetails = require(script.Parent.MatchmakingCardHoverDetails)
local MatchmakingDropShadow = require(script.Parent.MatchmakingDropShadow)
require(script.Parent.MatchmakingModel)
local MatchmakingModifierArtwork = require(script.Parent.MatchmakingModifierArtwork)
local MatchmakingPvpArtwork = require(script.Parent.MatchmakingPvpArtwork)
local MatchmakingSandboxArtwork = require(script.Parent.MatchmakingSandboxArtwork)
local MatchmakingStyle = require(script.Parent.MatchmakingStyle)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local useFontScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local createElement = React.createElement
local memo = React.memo
local useEffect = React.useEffect
local useRef = React.useRef
local u75 = Color3.fromRGB(18, 19, 23)
local u102 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(190, 194, 204)),
    ColorSequenceKeypoint.new(0.48, Color3.fromRGB(102, 106, 117)),
    (ColorSequenceKeypoint.new(1, Color3.fromRGB(38, 41, 48))),
})
local restingScale = MatchmakingStyle.motion.restingScale
local cardHoverScale = MatchmakingStyle.motion.cardHoverScale
local cardPressedScale = MatchmakingStyle.motion.cardPressedScale
local u112 = Vector2.new(5, 3)
local cardRevealStagger = MatchmakingStyle.motion.cardRevealStagger
local u119 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)

local function isPressInput(a1) -- Line: 74 -- types: a1: userdata
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

return memo(function(a1) -- Line: 84
    -- upvalues: useFontScale (val), MatchmakingStyle (val), useRef (val), ReactFlow (val), restingScale (val)
    -- upvalues: u119 (val), u112 (val), cardHoverScale (val), useEffect (val), cardPressedScale (val)
    -- upvalues: cardRevealStagger (val), React (val), createElement (val), MatchmakingDropShadow (val), u102 (val)
    -- upvalues: MatchmakingSandboxArtwork (val), MatchmakingPvpArtwork (val), MatchmakingModifierArtwork (val)
    -- upvalues: ImageLabel (val), MatchmakingCardHoverDetails (val), u75 (val), TextLabel (val), isPressInput (val)
    local v1, v2, v3, v4, v5
    local u3 = a1.locked == true
    local u7 = a1.selected == true
    local v6 = a1.compact == true
    local v7 = a1.denseChin == true
    local u19 = a1.revealImmediately == true
    local u23 = a1.revealed ~= false
    local u29 = math.max(a1.revealOrder or 1, 1)
    local u32 = a1.parallaxEnabled ~= false
    local u35 = a1.parallaxSensitivity or 1
    local imageOffset = a1.imageOffset
    if not imageOffset then
        imageOffset = UDim2.fromScale(0, 0)
    end
    local v8 = math.max(a1.imageScale or 1, 0)
    local artworkDescriptor = a1.artworkDescriptor
    local v9 = true
    if a1.artwork == nil then
        v9 = false
        if artworkDescriptor ~= nil then
            v9 = true
            if artworkDescriptor.type ~= "Sandbox" then
                v9 = artworkDescriptor.type == "PVP"
            end
        end
    end
    local v10 = useFontScale(MatchmakingStyle.getFontSize("header2", v6))
    local v11 = useFontScale(MatchmakingStyle.getFontSize("subheader2", v6))
    local v12 = (if not v7 then if not v6 then 78 else 62 else if not v6 then 58 else 42) + (if not v7 then if not v6 then 68 else 34 else if not v6 then 50 else 22)
    local v13 = v2 / v12
    local v14 = v1 - (if not v6 then 0 else math.min(v2, 20))
    local u109 = useRef(false)
    local u112_2 = useRef(false)
    local v15, u118 = ReactFlow.useSpring({damper = 1, speed = 28, start = restingScale})
    local v16, u139 = ReactFlow.useSpring({damper = 1, speed = 24, start = if not u7 then 0 else 1})
    local v17, u144 = ReactFlow.useSpring({damper = 1, speed = 28, start = 0})
    local v18, u150 = ReactFlow.useSpring({damper = 1, speed = 18, start = Vector2.zero})
    local v19, u170, u171 = ReactFlow.useTween({target = 1, info = u119, start = if not u19 then 0 else 1})

    local function setScale(a1) -- Line: 142 -- upvalues: u118 (val) -- types: a1: number
        u118({target = a1})
    end

    local function resetArtworkOffset() -- Line: 148 -- upvalues: u150 (val)
        u150({target = Vector2.zero})
    end

    local function updateArtworkOffset(a1, a2) -- Line: 154
        -- upvalues: u32 (val), u3 (val), u150 (val), u112 (upval), u35 (val)
        if u32 and not u3 then
            local UserInputType = a2.UserInputType
            if UserInputType ~= Enum.UserInputType.MouseMovement and UserInputType ~= Enum.UserInputType.Touch then
                return
            end
            local AbsoluteSize = a1.AbsoluteSize
            if not (AbsoluteSize.X <= 0) and not (AbsoluteSize.Y <= 0) then
                local AbsolutePosition = a1.AbsolutePosition
                local v1 = math.clamp((a2.Position.X - AbsolutePosition.X) / AbsoluteSize.X, 0, 1) * 2 - 1
                local v2 = math.clamp((a2.Position.Y - AbsolutePosition.Y) / AbsoluteSize.Y, 0, 1) * 2 - 1
                u150({
                    target = (Vector2.new(v1 * u112.X, v2 * u112.Y)) * u35,
                })
                return
            end
            return
        end
    end

    local function setHovered(a1) -- Line: 190
        -- upvalues: u109 (val), u112_2 (val), u150 (val), u3 (val), cardHoverScale (upval), restingScale (upval)
        -- upvalues: u118 (val), u144 (val)
        u109.current = a1
        if not a1 then
            u112_2.current = false
            u150({target = Vector2.zero})
        end
        u118({
            target = if not a1 then restingScale else if u3 then restingScale else cardHoverScale,
        })
        u144({target = if not a1 then 0 else 1})
    end

    local v20 = {u3, u32}
    useEffect(function() -- Line: 203
        -- upvalues: u3 (val), u32 (val), u112_2 (val), u150 (val), restingScale (upval), cardPressedScale (upval)
        -- upvalues: u109 (val), cardHoverScale (upval), u118 (val), u144 (val)
        if u3 or not u32 then
            u112_2.current = false
            u150({target = Vector2.zero})
        end
        u118({
            target = if not u3 then if not u112_2.current then if not u109.current then restingScale else cardHoverScale else cardPressedScale else restingScale,
        })
        u144({target = if not u109.current then 0 else 1})
    end, v20)
    v20 = {u7}
    useEffect(function() -- Line: 222 -- upvalues: u139 (val), u7 (val)
        u139({target = if not u7 then 0 else 1})
    end, v20)
    local v21 = useEffect
    v20 = {a1.revealCycle, u19, u29, u23}
    v21(function() -- Line: 228 -- upvalues: u171 (val), u19 (val), u170 (val), u23 (val), cardRevealStagger (upval), u29 (val)
        u171()
        if u19 then
            u170({start = 0, target = 1}, true)
            return
        end
        u170({start = 1, target = 0}, true)
        if not u23 then
            return
        end
        local u18 = task.delay(cardRevealStagger * (u29 - 1), function() -- Line: 248 -- upvalues: u170 (upval)
            u170({start = 0, target = 1})
        end)
        return function() -- Line: 255 -- upvalues: u18 (val), u171 (upval)
            task.cancel(u18)
            u171()
        end
    end, v20)
    v21 = React.joinBindings({hover = v17, selected = v16})
    local v22 = {DropShadow = createElement(MatchmakingDropShadow, {overscan = 14, zIndex = 0})}
    v22.Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.card})
    v22.BevelGradient = createElement("UIGradient", {Rotation = 90, Color = u102})
    local v23 = {
        Active = false,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        GroupTransparency = 0,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = v15:map(function(a1) -- Line: 283 -- upvalues: restingScale (upval), cardHoverScale (upval)
            local v1 = math.clamp((a1 - restingScale) / (cardHoverScale - restingScale), 0, 1)
            return (Color3.fromRGB(27, 28, 32)):Lerp(Color3.fromRGB(37, 39, 45), v1)
        end),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, -4, 1, -4),
    }
    local v24 = {}
    local v25 = createElement
    local v26 = {CornerRadius = MatchmakingStyle.cornerRadius.panel}
    v24.Corner = v25("UICorner", v26)
    if v9 then
        v26 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            ZIndex = 1,
            Size = UDim2.new(1, 0, 1, -v1),
        }
        v3 = {
            Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.panel}),
        }
        v4 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = v18:map(function(a1) -- Line: 315
                return (UDim2.fromScale(0.5, 0.5)) + UDim2.fromOffset(a1.X, a1.Y)
            end),
            Size = UDim2.fromScale(1.05, 1.05),
        }
        v5 = {Scale = createElement("UIScale", {Scale = v15})}
        local artwork = if not artworkDescriptor then if not artworkDescriptor or artworkDescriptor.type ~= "PVP" then a1.artwork else createElement(MatchmakingPvpArtwork, {ranked = artworkDescriptor.ranked, teamSize = artworkDescriptor.teamSize}) else if artworkDescriptor.type == "Sandbox" then createElement(MatchmakingSandboxArtwork, {
            artworkOffset = v18,
            foregroundImage = a1.image,
            imageOffset = imageOffset,
            imageScale = v8,
        }) else if not artworkDescriptor or artworkDescriptor.type ~= "PVP" then a1.artwork else createElement(MatchmakingPvpArtwork, {ranked = artworkDescriptor.ranked, teamSize = artworkDescriptor.teamSize})
        v5.Artwork = artwork
        v3.Content = createElement("Frame", v4, v5)
        v25 = createElement("Frame", v26, v3)
    else
        v25 = if not artworkDescriptor or artworkDescriptor.type ~= "Modifier" then createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            ZIndex = 1,
            Size = UDim2.new(1, 0, 1, -v1),
        }, {
            Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.panel}),
            Content = createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = v18:map(function(a1) -- Line: 370 -- upvalues: imageOffset (val)
                    return (UDim2.fromScale(0.5, 0.5)) + imageOffset + UDim2.fromOffset(a1.X, a1.Y)
                end),
                Size = UDim2.fromScale(v8 * 1.05, v8 * 1.05),
            }, {
                Scale = createElement("UIScale", {Scale = v15}),
                Image = createElement(ImageLabel, {
                    BackgroundTransparency = 0,
                    ZIndex = 1,
                    disableSpinner = true,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(61, 64, 72),
                    Image = a1.image,
                    ScaleType = Enum.ScaleType.Crop,
                    Size = UDim2.fromScale(1, 1),
                }),
            }),
        }) else createElement(MatchmakingModifierArtwork, {
            artworkScale = v15,
            artworkOffset = v18,
            compact = v6,
            gridTexture = artworkDescriptor.gridTexture,
            icon = artworkDescriptor.icon,
            imageOffset = imageOffset,
            imageScale = v8,
            mapImage = a1.image,
            size = UDim2.new(1, 0, 1, -v1),
            tag = a1.tag,
            timerEndsAt = a1.timerEndsAt,
        })
    end
    v24.Artwork = v25
    v24.HoverDim = if not a1.hoverDetails or u3 then nil else createElement("Frame", {
        Active = false,
        BorderSizePixel = 0,
        ZIndex = 2,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = v17:map(function(a1) -- Line: 402
            return 1 - math.clamp(a1, 0, 1) * 0.62
        end),
        Size = UDim2.new(1, 0, 1, -v14),
    })
    v24.HoverDetails = if not a1.hoverDetails or u3 then nil else createElement("Frame", {
        Active = false,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 8,
        Size = UDim2.new(1, 0, 1, -v14),
    }, {
        Content = createElement(MatchmakingCardHoverDetails, {compact = v6, details = a1.hoverDetails, hoverAlpha = v17}),
    })
    v26 = {BorderSizePixel = 0, ZIndex = 3}
    v26.BackgroundColor3 = u75
    v26.Position = UDim2.new(0, 0, 1, -v12)
    v26.Size = UDim2.new(1, 0, 0, v12)
    v3 = {}
    v3.Gradient = createElement("UIGradient", {
        Rotation = 90,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(v13 * 0.7, 0.12),
            NumberSequenceKeypoint.new(v13, 0),
            (NumberSequenceKeypoint.new(1, 0)),
        }),
    })
    v4 = {
        BackgroundTransparency = 1,
        ZIndex = 4,
        Position = UDim2.fromOffset(if not v7 then if not v6 then 16 else 12 else 10, v2 + (if not v7 then if not v6 then 6 else 5 else 3)),
    }
    v4.Size = UDim2.new(1, if not v7 then if not v6 then -32 else -24 else -20, 0, v1 + (if not v7 then if not v6 then -11 else -10 else -6))
    v5 = {}
    v5.Layout = createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        Padding = UDim.new(0, if not v7 then 3 else 0),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = if not v7 then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Center,
    })
    v5.Title = createElement(TextLabel, {
        BackgroundTransparency = 1,
        FontWeight = "Heavy",
        LayoutOrder = 1,
        TextScaled = false,
        ZIndex = 4,
        AnchorPoint = Vector2.zero,
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.new(1, 0, 0, if not v7 then if not v6 then 27 else 23 else v1 - 6),
        Text = a1.title,
        TextColor3 = MatchmakingStyle.colors.text,
        TextSize = v10,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    v5.Subtitle = not v7 and createElement(TextLabel, {
        BackgroundTransparency = 1,
        FontWeight = "Medium",
        LayoutOrder = 2,
        TextScaled = false,
        TextWrapped = true,
        ZIndex = 4,
        AnchorPoint = Vector2.zero,
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.new(1, 0, 0, if not v6 then 37 else 26),
        Text = a1.subtitle,
        TextColor3 = Color3.fromRGB(184, 188, 199),
        TextSize = v11,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
    })
    v3.Content = createElement("Frame", v4, v5)
    v24.Chin = createElement("Frame", v26, v3)
    v24.Locked = if not u3 then nil else createElement("Frame", {
        BackgroundTransparency = 0.24,
        BorderSizePixel = 0,
        ZIndex = 10,
        BackgroundColor3 = MatchmakingStyle.colors.overlay,
        Size = UDim2.fromScale(1, 1),
    }, {
        LockPill = createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 11,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = MatchmakingStyle.colors.surface,
            BackgroundTransparency = MatchmakingStyle.transparency.surface,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, if not v6 then -32 else -20, 0, if not v6 then 62 else 54),
        }, {
            Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.panel}),
            Stroke = createElement("UIStroke", {
                Color = MatchmakingStyle.colors.borderMuted,
                Transparency = MatchmakingStyle.transparency.border,
                Thickness = MatchmakingStyle.strokeThickness.thin,
            }),
            Lock = createElement(ImageLabel, {
                BackgroundTransparency = 1,
                Image = 137052204118126,
                ZIndex = 12,
                disableSpinner = true,
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromOffset(13, if not v6 then 31 else 27),
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.fromOffset(28, 28),
            }),
            Reason = createElement(TextLabel, {
                BackgroundTransparency = 1,
                FontWeight = "Bold",
                TextScaled = false,
                TextWrapped = true,
                ZIndex = 12,
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromOffset(50, if not v6 then 31 else 27),
                Size = UDim2.new(1, -62, 0, if not v6 then 42 else 36),
                Text = a1.lockReason or "Locked",
                TextColor3 = Color3.fromRGB(240, 242, 247),
                TextSize = v11,
                TextTruncate = Enum.TextTruncate.AtEnd,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
        }),
    })
    v22.Surface = createElement("CanvasGroup", v23, v24)
    v22.BevelOverlay = createElement("Frame", {
        Active = false,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 29,
        Size = UDim2.fromScale(1, 1),
    }, {
        Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.card}),
        Stroke = createElement("UIStroke", {
            Thickness = 2,
            Transparency = 0.12,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            BorderStrokePosition = Enum.BorderStrokePosition.Inner,
            Color = MatchmakingStyle.colors.text,
            LineJoinMode = Enum.LineJoinMode.Round,
        }, {Gradient = createElement("UIGradient", {Rotation = 90, Color = u102})}),
    })
    v22.Outline = createElement("Frame", {
        Active = false,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 30,
        Size = UDim2.fromScale(1, 1),
    }, {
        Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.card}),
        Stroke = createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            BorderStrokePosition = Enum.BorderStrokePosition.Inner,
            Color = MatchmakingStyle.colors.text,
            LineJoinMode = Enum.LineJoinMode.Round,
            Transparency = v21:map(function(a1) -- Line: 606
                return 1 - math.max(math.clamp(a1.hover, 0, 1), (math.clamp(a1.selected, 0, 1)))
            end),
            Thickness = v21:map(function(a1) -- Line: 611
                return math.max(math.clamp(a1.hover, 0, 1), (math.clamp(a1.selected, 0, 1))) * 2 + 1
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
        ref = a1.buttonRef,
    }
    local Activated = React.Event.Activated
    v23[Activated] = not u3 and a1.onActivated or nil
    local InputBegan = React.Event.InputBegan
    v23[InputBegan] = not u3 and function(a1, a2) -- Line: 634
        -- upvalues: isPressInput (upval), u112_2 (val), cardPressedScale (upval), u118 (val)
        if not isPressInput(a2) then
            return
        end
        u112_2.current = true
        u118({target = cardPressedScale})
        return
    end or nil
    local InputEnded = React.Event.InputEnded
    v23[InputEnded] = not u3 and function(a1, a2) -- Line: 643
        -- upvalues: isPressInput (upval), u112_2 (val), u109 (val), cardHoverScale (upval), restingScale (upval)
        -- upvalues: u118 (val), u150 (val)
        if not isPressInput(a2) then
            return
        end
        u112_2.current = false
        u118({target = if not u109.current then restingScale else cardHoverScale})
        if a2.UserInputType == Enum.UserInputType.Touch then
            u150({target = Vector2.zero})
        end
        return
    end or nil
    local InputChanged = React.Event.InputChanged
    v23[InputChanged] = u32 and not u3 and function(a1, a2) -- Line: 655 -- upvalues: updateArtworkOffset (val) -- types: a1: userdata, a2: userdata
        updateArtworkOffset(a1, a2)
        return
    end or nil

    v23[React.Event.MouseEnter] = function() -- Line: 661
        -- upvalues: u109 (val), u3 (val), cardHoverScale (upval), restingScale (upval), u118 (val), u144 (val)
        u109.current = true
        u118({target = if u3 then restingScale else cardHoverScale})
        u144({target = 1})
    end

    v23[React.Event.MouseLeave] = function() -- Line: 664 -- upvalues: u109 (val), u112_2 (val), u150 (val), restingScale (upval), u118 (val), u144 (val)
        u109.current = false
        u112_2.current = false
        u150({target = Vector2.zero})
        u118({target = restingScale})
        u144({target = 0})
    end

    local SelectionGained = React.Event.SelectionGained
    v23[SelectionGained] = not u3 and function() -- Line: 667
        -- upvalues: u109 (val), u3 (val), cardHoverScale (upval), restingScale (upval), u118 (val), u144 (val)
        u109.current = true
        u118({target = if u3 then restingScale else cardHoverScale})
        u144({target = 1})
        return
    end or nil
    local SelectionLost = React.Event.SelectionLost
    v23[SelectionLost] = not u3 and function() -- Line: 670 -- upvalues: u109 (val), u112_2 (val), u150 (val), restingScale (upval), u118 (val), u144 (val)
        u109.current = false
        u112_2.current = false
        u150({target = Vector2.zero})
        u118({target = restingScale})
        u144({target = 0})
        return
    end or nil
    v22.Hitbox = createElement("TextButton", v23)
    v23 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = false,
        AnchorPoint = Vector2.new(0.5, 0.5),
        LayoutOrder = a1.layoutOrder,
        Position = UDim2.fromScale(0.5, 0.5),
    }
    local size = a1.size or UDim2.fromOffset(256, 206)
    v23.Size = size
    return createElement("Frame", v23, {
        RevealClip = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 14, 1, 14),
        }, {
            Card = createElement("Frame", {
                BorderSizePixel = 0,
                ClipsDescendants = false,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = MatchmakingStyle.colors.text,
                Position = v19:map(function(a1) -- Line: 698
                    return UDim2.fromScale(0.5, 0.5 + 1 * (1 - a1))
                end),
                Size = UDim2.new(1, -14, 1, -14),
            }, v22),
        }),
    })
end)