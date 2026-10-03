-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.GameModeCard
-- Decompile time: 11.69 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Abbreviate = require(ReplicatedStorage.Shared.Modules.Abbreviate)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local RewardInfo = require(script.Parent.RewardInfo)
local useAttribute = require(ReplicatedStorage.Client.Interfaces.Hooks.useAttribute)
local useGamepass = require(ReplicatedStorage.Client.Interfaces.Hooks.useGamepass)
local usePooledEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.usePooledEvent)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local useRef = React.useRef
local Event = React.Event
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
return function(a1) -- Line: 59
    -- upvalues: useBinding (val), useRef (val), useTween (val), useSound (val), useSpring (val), useGamepass (val)
    -- upvalues: useAttribute (val), LocalPlayer (val), usePooledEvent (val), RunService (val), Mouse (val)
    -- upvalues: useEffect (val), createElement (val), Event (val), Notification (val), RewardInfo (val)
    -- upvalues: Abbreviate (val), React (val)
    local v1
    local u3 = a1.Visible ~= false
    local count = a1.count or useBinding(0)
    local clicked = a1.clicked
    local u12 = a1.LayoutOrder or 1
    local playerLevel = a1.playerLevel
    local levelLock = a1.levelLock
    local gamepass = a1.gamepass
    local attribute = a1.attribute
    local u114 = nil
    local u95 = nil
    local u20 = useRef()
    local u23, u24 = useBinding(Vector2.zero)
    local u27, u28 = useBinding(Vector2.zero)
    local u31, u32 = useBinding(false)
    local u35, u36 = useBinding(false)
    local v2, u46 = useTween(0, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), true, true)
    local v3 = v2:map(function(a1) -- Line: 81
        return 1 - a1
    end)
    local Click = useSound("Click")
    local v4, u60 = useSpring(0, 0.8, 30, true)
    local v5, u67 = useSpring(1, 0.7, 30, true)
    local v6, u81 = useTween(Color3.fromRGB(102, 102, 102), TweenInfo.new(0.2, Enum.EasingStyle.Sine), true, true)
    local u84 = levelLock
    if u84 then
        u84 = playerLevel < levelLock
    end
    local u99 = a1.disabled or u84
    if gamepass ~= nil then
        local v7
        v1, v7 = useGamepass(gamepass)
        u95 = v7
        v1 = u84 and not v1
        u99 = v1
    end
    if attribute ~= nil then
        v1 = useAttribute(LocalPlayer, attribute) == true
        u114 = u114 or v1
        u99 = u84 and not u114
    end
    usePooledEvent(RunService.Heartbeat, function(a1) -- Line: 111 -- upvalues: u27 (val), u23 (val), u28 (val)
        u28((u27:getValue()):Lerp(u23:getValue(), a1 * 10))
    end, {})
    local v8 = {u99}
    usePooledEvent(Mouse.Move, function() -- Line: 118 -- upvalues: u20 (val), u99 (ref), u35 (val), Mouse (upval), u24 (val)
        local current = u20.current
        if not u99 and current and u35:getValue() then
            local AbsolutePosition = current.AbsolutePosition
            local AbsoluteSize = current.AbsoluteSize
            local v1 = (Mouse.X - AbsolutePosition.X) / AbsoluteSize.X
            local v2 = (Mouse.Y - AbsolutePosition.Y) / AbsoluteSize.Y
            u24(Vector2.new(math.round((v1 - 0.5) * 30 / 2) * 2, math.round((v2 - 0.5) * 30 / 2) * 2 / 2))
            return
        end
    end, v8)
    local v9 = {u12, u3}
    useEffect(function() -- Line: 141 -- upvalues: u12 (val), u46 (val), u3 (val)
        local u6 = task.delay(0.05 * (u12 - 1), function() -- Line: 142 -- upvalues: u46 (upval), u3 (upval)
            u46(if not u3 then 0 else 1)
        end)
        return function() -- Line: 146 -- upvalues: u6 (val)
            if u6 then
                task.cancel(u6)
            end
        end
    end, v9)
    v9 = {BackgroundTransparency = 1}
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v9.Size = Size
    v9.AnchorPoint = a1.AnchorPoint
    v9.Position = a1.Position
    v9.LayoutOrder = a1.LayoutOrder
    v8 = {}
    local v10 = {
        BackgroundColor3 = Color3.fromRGB(33, 33, 33),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Text = "",
        ref = u20,
        Position = v3:map(function(a1) -- Line: 170
            return (UDim2.fromScale(0.5, 0.5)) + UDim2.fromOffset(0, 100 * a1)
        end),
    }

    v10[Event.MouseButton1Down] = function() -- Line: 174 -- upvalues: u67 (val), u60 (val), u32 (val)
        u67(1.02)
        u60(4)
        u32(true)
    end

    v10[Event.MouseButton1Up] = function() -- Line: 180
        -- upvalues: u31 (val), u67 (val), u35 (val), u60 (val), u32 (val), Click (val), clicked (val), gamepass (val)
        -- upvalues: u114 (ref), u84 (val), u95 (ref), Notification (upval), levelLock (val)
        local v1 = u31:getValue()
        u67(if not u35:getValue() then 1 else 1.1)
        u60(if not u35:getValue() then 0 else 2)
        u32(false)
        Click()
        if v1 and clicked then
            if gamepass ~= nil and not u114 and u84 then
                u95()
                return
            end
            if u84 and not u114 then
                Notification.Create({
                    Text = ("You need to be level %* to play this gamemode!"):format(levelLock),
                    Color = Color3.fromRGB(255, 0, 0),
                })
                return
            end
            clicked()
        end
    end

    v10[Event.MouseEnter] = function() -- Line: 207 -- upvalues: u60 (val), u67 (val), u36 (val), u81 (val)
        u60(2)
        u67(1.1)
        u36(true)
        u81(Color3.fromRGB(201, 201, 201))
    end

    v10[Event.MouseLeave] = function() -- Line: 214 -- upvalues: u67 (val), u60 (val), u36 (val), u24 (val), u81 (val)
        u67(1)
        u60(0)
        u36(false)
        u24(Vector2.zero)
        u81(Color3.fromRGB(102, 102, 102))
    end

    local v11 = {uIScale = createElement("UIScale", {Scale = v5})}
    local rewardInfo = a1.rewardInfo and createElement(RewardInfo, {rewardInfo = a1.rewardInfo})
    v11.rewardInfo = rewardInfo
    local v12 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.02),
        Size = UDim2.fromScale(1, 0.2),
    }
    local v13 = {}
    local v14 = {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
        Text = a1.title,
    }
    local titleColor = a1.titleColor or Color3.fromRGB(255, 255, 255)
    v14.TextColor3 = titleColor
    v14.TextTransparency = v3
    v14.AnchorPoint = Vector2.new(0.5, 0)
    v14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v14.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v14.Position = UDim2.fromScale(0.5, 0.02)
    v14.Size = UDim2.fromScale(1, 0.6)
    v13.textLabel1 = createElement("TextLabel", v14, {
        uIStroke = createElement("UIStroke", {Thickness = 4, Color = Color3.fromRGB(102, 102, 102), Transparency = v3}, {
            uIGradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 40))),
                }),
            }),
        }),
        uIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0.1, 0), PaddingRight = UDim.new(0.1, 0)}),
    })
    v13.uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 3.5, DominantAxis = Enum.DominantAxis.Height})
    v14 = {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Text = a1.subTitle,
    }
    local subTitleColor = a1.subTitleColor or Color3.fromRGB(255, 170, 0)
    v14.TextColor3 = subTitleColor
    v14.TextTransparency = v3
    v14.AnchorPoint = Vector2.new(0.5, 0)
    v14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v14.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v14.Position = UDim2.fromScale(0.5, 0.65)
    v14.Size = UDim2.fromScale(1, 0.35)
    v13.textLabel2 = createElement("TextLabel", v14, {
        uIStroke1 = createElement("UIStroke", {
            Thickness = 2,
            Color = (a1.subTitleColor or Color3.fromRGB(255, 170, 0)):Lerp(Color3.fromRGB(0, 0, 0), 0.4),
            Transparency = v3,
        }, {
            uIGradient1 = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 40))),
                }),
            }),
        }),
        uIPadding1 = createElement("UIPadding", {PaddingTop = UDim.new(0.1, 0), PaddingBottom = UDim.new(0.1, 0)}),
    })
    v11.container = createElement("Frame", v12, v13)
    v12 = {
        BorderSizePixel = 0,
        ZIndex = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }
    v13 = u99 and Color3.fromRGB(83, 83, 83) or Color3.fromRGB(255, 255, 255)
    v12.GroupColor3 = v13
    v12.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v12.Position = UDim2.fromScale(0.5, 0.5)
    v12.Size = UDim2.fromScale(1, 1)
    v12.GroupTransparency = v3
    v13 = {uICorner = createElement("UICorner")}
    v14 = {BorderSizePixel = 0}
    local background_2 = not (typeof(a1.background) ~= "string") and a1.background or ("rbxassetid://%*"):format(a1.background or 17524202802)
    v14.Image = background_2
    v14.ImageColor3 = u99 and Color3.fromRGB(102, 102, 102) or v6
    v14.ScaleType = Enum.ScaleType.Crop
    v14.AnchorPoint = Vector2.new(0.5, 0.5)
    v14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v14.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v14.Size = UDim2.fromScale(2, 2)
    v14.Position = u27:map(function(a1) -- Line: 354
        return UDim2.new(0.5, a1.X * 0.6, 0.5, a1.Y * 0.6)
    end)
    v13.background = createElement("ImageLabel", v14, {
        uIAspectRatioConstraint1 = createElement("UIAspectRatioConstraint", {DominantAxis = Enum.DominantAxis.Height}),
    })
    v14 = {BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 2}
    local character_2 = not (typeof(a1.character) ~= "string") and a1.character or ("rbxassetid://%*"):format(a1.character or 16455010332)
    v14.Image = character_2
    v14.ScaleType = Enum.ScaleType.Fit
    local characterAnchorPoint = a1.characterAnchorPoint or Vector2.new(0.45, 0.85)
    v14.AnchorPoint = characterAnchorPoint
    v14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v14.BorderColor3 = Color3.fromRGB(0, 0, 0)
    local characterSize = a1.characterSize or UDim2.fromScale(1.8, 1.8)
    v14.Size = characterSize
    v14.Position = u27:map(function(a1) -- Line: 379
        return UDim2.new(0.5, a1.X, 1, a1.Y)
    end)
    v13.character = createElement("ImageLabel", v14, {uIAspectRatioConstraint2 = createElement("UIAspectRatioConstraint")})
    v13.uIStroke2 = createElement("UIStroke", {Color = Color3.fromRGB(255, 255, 255), Thickness = v4, Transparency = v3})
    v11.canvasGroup = createElement("CanvasGroup", v12, v13)
    v12 = {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = count:map(function(a1) -- Line: 399 -- upvalues: Abbreviate (upval)
            return (("%* Playing"):format((Abbreviate(a1))))
        end),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextTransparency = v3,
        AnchorPoint = Vector2.new(0.5, 1),
    }
    v13 = u99 and Color3.fromRGB(48, 54, 66) or Color3.fromRGB(8, 9, 11)
    v12.BackgroundColor3 = v13
    v12.BackgroundTransparency = v2:map(function(a1) -- Line: 410
        return 1 - a1 * 0.75
    end)
    v12.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v12.Position = UDim2.fromScale(0.5, 0.975)
    v12.Size = UDim2.fromScale(0.9, 0.08)
    v12.Visible = count:map(function(a1) -- Line: 417
        return a1 and a1 > 0
    end)
    v13 = {}
    local v15 = createElement
    v14 = {
        PaddingBottom = UDim.new(0.25, 0),
        PaddingLeft = UDim.new(0.25, 0),
        PaddingRight = UDim.new(0.25, 0),
        PaddingTop = UDim.new(0.25, 0),
    }
    v13.uIPadding2 = v15("UIPadding", v14)
    v11.textLabel3 = createElement("TextLabel", v12, v13)
    local v16 = createElement
    v12 = {
        Image = "rbxassetid://9239716855",
        BackgroundTransparency = 1,
        ZIndex = -1,
        ImageTransparency = v2:map(function(a1) -- Line: 431
            return 1 - 0.8 * a1
        end),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(14, 14, 64, 24),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, 14, 1, 14),
    }
    v11.dropShadow = v16("ImageLabel", v12)
    local popular = a1.popular and createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(44, 232, 81),
        BackgroundTransparency = v3,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1.05),
        Size = UDim2.fromScale(0.7, 0.08),
    }, {
        uIAspectRatioConstraint3 = createElement("UIAspectRatioConstraint", {AspectRatio = 6}),
        uICorner1 = createElement("UICorner"),
        dropShadow1 = createElement("ImageLabel", {
            Image = "rbxassetid://9239716855",
            BackgroundTransparency = 1,
            ZIndex = -1,
            ImageTransparency = v2:map(function(a1) -- Line: 462
                return 1 - 0.8 * a1
            end),
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(14, 14, 64, 24),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 14, 1, 14),
        }),
        imageLabel = createElement("ImageLabel", {
            Image = "rbxassetid://16381447184",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ImageTransparency = v3,
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.1, 0.5),
            Size = UDim2.fromScale(0.2, 0.6),
        }, {uIAspectRatioConstraint4 = createElement("UIAspectRatioConstraint")}),
        textLabel4 = createElement("TextLabel", {
            Text = "Most Popular!",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = v3,
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.2, 0),
            Size = UDim2.fromScale(0.8, 1),
        }, {
            uIPadding3 = createElement("UIPadding", {
                PaddingBottom = UDim.new(0.1, 0),
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.1, 0),
                PaddingTop = UDim.new(0.1, 0),
            }),
            uIStroke3 = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(32, 171, 55), Transparency = v3}),
        }),
    })
    v11.frame = popular
    v16 = u99
    if v16 then
        v12 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 5,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }
        v13 = {
            uIAspectRatioConstraint = createElement("UIAspectRatioConstraint"),
            lock = createElement("ImageLabel", {
                Image = "rbxassetid://1197061307",
                BackgroundTransparency = 1,
                ZIndex = 10,
                ImageTransparency = v3,
                ScaleType = Enum.ScaleType.Fit,
                AnchorPoint = Vector2.new(0.5, 1),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                Position = UDim2.fromScale(0.5, 0.52),
                Size = UDim2.fromScale(0.4, 0.4),
            }, {uIAspectRatioConstraint1 = createElement("UIAspectRatioConstraint")}),
        }
        v14 = {
            TextScaled = true,
            TextSize = 14,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = a1.disabledText or "LOCKED",
            TextColor3 = Color3.fromRGB(153, 153, 153),
            TextTransparency = v2:map(function(a1) -- Line: 563
                return 1 - 0.6 * a1
            end),
            TextWrapped = if a1.disabledTextWrapped ~= nil then a1.disabledTextWrapped else true,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
        }
        local disabledTextPosition = a1.disabledTextPosition or UDim2.fromScale(0.5, 0.55)
        v14.Position = disabledTextPosition
        v14.Size = UDim2.fromScale(1, 0.2)
        v14.AutomaticSize = Enum.AutomaticSize.Y
        v13.textLabel = createElement("TextLabel", v14, {
            uIStroke = createElement("UIStroke", {Thickness = 4, Transparency = 0.8}),
            uiAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 2}),
        })
        v16 = createElement("Frame", v12, v13)
    end
    v11.locked = v16
    v11.children = createElement(React.Fragment, {}, a1.children or {})
    v8.content = createElement("TextButton", v10, v11)
    return (createElement("Frame", v9, v8))
end