-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Hotbar.HotbarButton
-- Decompile time: 16.19 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
require(ReplicatedStorage.Shared.Modules.Enum)
require(ReplicatedStorage.Client.Interfaces.Universal.Components.Hotbar.HotbarStars)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local Icons_2 = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local React = require(ReplicatedStorage.Shared.UI.React)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local TutorialStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.TutorialStore)
require(ReplicatedStorage.Client.Interfaces.Game.Components.UltimateEffect)
require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassStars)
local CustomSkinRarityComponent = require(ReplicatedStorage.Client.Interfaces.Universal.Components.CustomSkinRarityComponent)
local RarityColors = require(ReplicatedStorage.Shared.Modules.RarityColors)
local useKeyBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useKeyBinding)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local useBinding = React.useBinding
local joinBindings = React.joinBindings
local useState = React.useState
local Event = React.Event
local memo = React.memo
local useRef = React.useRef
local u124 = Color3.new(1, 1, 1)
local u129 = Color3.fromRGB(85, 255, 127)
return memo(function(a1) -- Line: 82
    -- upvalues: useRef (val), useBinding (val), u129 (val), RarityColors (val), useSpring (val), useSound (val)
    -- upvalues: useState (val), HttpService (val), React (val), useKeyBinding (val), u124 (val), useReactBindings (val)
    -- upvalues: TutorialStore (val), createElement (val), Icons (val), joinBindings (val)
    -- upvalues: CustomSkinRarityComponent (val), Icons_2 (val), Tooltip (val), Event (val), Comma (val)
    local v1, v2, v3
    local u3 = useRef(nil)
    local u5 = a1.LayoutOrder or 1
    useBinding(0)
    local Color = a1.Color
    if not Color then
        Color = u129
    end
    if a1.Rarity ~= nil then
        Color = RarityColors[tostring(a1.Rarity)] or Color
    end
    local v4, u27 = useSpring(0, 1, 40, true)
    local Click = useSound("Click")
    local Enabled = a1.Enabled
    if Enabled then
        Enabled = not a1.Disabled
    end
    local u37 = a1.MaxCooldown or 1
    local Cooldown = a1.Cooldown or useBinding(0)
    local Queued = a1.Queued or useBinding(false)
    local v5 = useState(function() -- Line: 102 -- upvalues: HttpService (upval)
        return HttpService:GenerateGUID(false)
    end, {})
    local v6 = {}
    local v7 = if not a1.LevelLock then false else a1.Level < a1.LevelLock
    local useCallback = React.useCallback
    local v8 = {Enabled, a1.OnActivate}
    local v9 = useCallback(function() -- Line: 109 -- upvalues: Enabled (val), a1 (val), Click (val)
        if not Enabled then
            return
        end
        if a1.OnPressChanged then
            a1.OnPressChanged(false)
        end
        Click()
        a1.OnActivate()
    end, v8)
    v1, v8 = useKeyBinding(a1.Binding or "", v9, nil, true, not Enabled)
    local u89, u90 = useState(false)
    local v10, u97 = useSpring(0, 1, 40, true)
    local v11, u104 = useSpring(0, 1, 40, true)
    local v12, u125 = useSpring(if not a1.Enabled then 0 else 1, 1, 40 - 5 * u5, true)
    local Selected = a1.Selected
    local v13 = if not v7 then if a1.Icon ~= "" then v11:map(function(a1) -- Line: 135 -- upvalues: Color (ref), u124 (upval)
        return Color:Lerp(u124, a1)
    end) else Color3.fromRGB(49, 49, 49) else Color3.fromRGB(37, 48, 68)
    local v14 = React.joinBindings({v4, v10})
    local v15 = useReactBindings
    local v16 = {Selected}
    local v17 = {Selected, a1.picked}
    v15(function(a1_2) -- Line: 147 -- upvalues: a1 (val), u104 (val)
        if a1.picked ~= nil then
            u104(if a1_2 then 1 else if not a1.picked then 0 else 1)
        end
    end, v16, v17)
    React.useEffect(function() -- Line: 153 -- upvalues: u104 (val)
        u104(0)
    end, {})
    local useEffect_2 = React.useEffect
    v16 = {a1.Enabled}
    useEffect_2(function() -- Line: 157 -- upvalues: u125 (val), a1 (val)
        u125(if not a1.Enabled then 0 else 1)
    end, v16)
    v16 = {v1}
    v17 = {u89}
    useReactBindings(function(a1) -- Line: 161 -- upvalues: u97 (val), u89 (val)
        u97(if a1 then 1 else if not u89 then 0 else 1)
    end, v16, v17)
    v16 = {u3, u5}
    React.useEffect(function() -- Line: 165 -- upvalues: u3 (val), a1 (val), TutorialStore (upval), u5 (val)
        if u3 and u3.current then
            if a1.dontSpotlight then
                return
            end
            TutorialStore.addValidInstanceOrRef(("slot_%*"):format(u5), u3)
            return
        end
    end, v16)
    if a1.Stats and next(a1.Stats) then
        local v18
        for i, j in a1.Stats do
            if j ~= 0 then
                v18 = createElement
                v2 = {
                    BackgroundTransparency = 1,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Size = UDim2.new(1, 0, 0, 15),
                }
                v3 = {
                    Icon = createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        ImageTransparency = 0.3,
                        AnchorPoint = Vector2.new(0, 0.5),
                        Size = UDim2.fromOffset(15, 15),
                        Position = UDim2.new(0, 0, 0.5, 0),
                        ScaleType = Enum.ScaleType.Fit,
                        Image = Icons[i],
                    }),
                    Value = createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.fromScale(0, 0.5),
                        Size = UDim2.new(1, 0, 1, 0),
                        TextXAlignment = Enum.TextXAlignment.Right,
                        Font = Enum.Font.SourceSansBold,
                        TextColor3 = Color3.fromRGB(156, 156, 156),
                        Text = string.format("%.2g", j),
                    }),
                }
                v6[i] = (v18("Frame", v2, v3))
            end
        end
    end
    v16 = {BackgroundTransparency = 1}
    local Size = a1.Size or UDim2.fromOffset(64, 64)
    v16.Size = Size
    v16.SizeConstraint = a1.SizeConstraint
    v16.Position = a1.Position
    v16.AnchorPoint = a1.AnchorPoint
    v16.LayoutOrder = u5
    v16.ZIndex = u5
    v16.ref = u3
    v17 = {
        Scale = createElement("UIScale", {
            Scale = v14:map(function(a1) -- Line: 227
                return 1 + a1[1] * (1 - a1[2]) * 0.1 - a1[2] * 0.1
            end),
        }),
    }
    local v19 = {BackgroundTransparency = 0.2, AnchorPoint = Vector2.new(0.5, 0.5)}
    v19.Position = joinBindings({
        v11,
        v12:map(function(a1) -- Line: 238
            return (UDim2.fromScale(0.5, 2)):Lerp(UDim2.fromScale(0.5, 0.5), a1)
        end),
    }):map(function(a1) -- Line: 241
        local v1 = a1[1]
        local v2 = a1[2]
        return UDim2.new(v2.X.Scale, v2.X.Offset, v2.Y.Scale, v2.Y.Offset - v1 * 8)
    end)
    v19.BackgroundColor3 = v4:map(function(a1) -- Line: 252
        return (Color3.fromRGB(45, 45, 45)):Lerp(Color3.fromRGB(73, 73, 73), a1)
    end)
    v19.Visible = v12:map(function(a1) -- Line: 255
        return a1 > 0.01
    end)
    v19.Size = UDim2.fromScale(1, 1)
    v2 = {customEffects = createElement(CustomSkinRarityComponent, {Rarity = a1.Rarity})}
    local isGolden = a1.isGolden and createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = Icons_2.GoldenPerks,
        Size = UDim2.fromScale(0.4, 0.4),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(1, 0),
    }, {AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1})})
    v2.goldenIcon = isGolden
    v2.Scale = createElement("UIScale", {Scale = v12})
    v2.Gradient = createElement("UIGradient", {
        Rotation = 90,
        Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(45, 45, 45)),
    })
    v2.Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)})
    v2.Aspect = createElement("UIAspectRatioConstraint")
    local v20 = {
        Thickness = 0.04,
        Transparency = 0,
        Color = v13,
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
    }
    local v21 = {}
    local v22 = {
        Rotation = if not v7 then v11:map(function(a1) -- Line: 312 -- types: a1: number
            return a1 * 45 + 45
        end) else 45,
    }
    local v23 = if not v7 then v11:map(function(a1) -- Line: 324
        return NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.5, 1 - a1),
            (NumberSequenceKeypoint.new(1, 0)),
        })
    end) else NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.2, 0.75),
        NumberSequenceKeypoint.new(0.5, 1),
        NumberSequenceKeypoint.new(0.8, 0.75),
        (NumberSequenceKeypoint.new(1, 0)),
    })
    v22.Transparency = v23
    v21.Gradient = createElement("UIGradient", v22)
    v2.Stroke = createElement("UIStroke", v20, v21)
    v20 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(1.1, 1.1),
        Position = UDim2.new(0.5, 0, 0.5, 0),
    }
    v21 = {}
    v22 = {BackgroundTransparency = 1, ZIndex = 2, AnchorPoint = Vector2.new(0.5, 0.5)}
    local IconSize = a1.IconSize or UDim2.new(1.1, 0, 1.1, 0)
    v22.Size = IconSize
    v22.Position = UDim2.new(0.5, 0, 0.5, 0)
    v22.ScaleType = Enum.ScaleType.Fit
    v23 = if not a1.Disabled then if not v7 then if not a1.Stock then Color3.fromRGB(255, 255, 255) else 0 < a1.Stock and Color3.fromRGB(255, 255, 255) or Color3.new() else Color3.fromRGB(34, 34, 34) else Color3.fromRGB(100, 100, 100)
    v22.ImageColor3 = v23
    v22.Image = a1.Icon
    v22.ImageTransparency = if not a1.Disabled then if not v7 then 0 else 0.5 else 0.55
    v21.ImageIcon = createElement("ImageLabel", v22)
    v22 = {
        BackgroundTransparency = 1,
        ImageTransparency = 0.25,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local IconSize_2 = a1.IconSize or UDim2.new(1.1, 0, 1.1, 0)
    v22.Size = IconSize_2
    v22.Position = v14:map(function(a1) -- Line: 363 -- types: a1: table
        local v1 = a1[1] - a1[2] * 2
        return UDim2.new(0.5, v1 * 2 + 4, 0.5, v1 * 2 + 4)
    end)
    v22.ImageColor3 = Color3.new(0, 0, 0)
    v22.ScaleType = Enum.ScaleType.Fit
    v22.Image = a1.Icon
    v22.Visible = not v7 and not a1.Disabled
    v21.Shadow = createElement("ImageLabel", v22)
    v2.Icon = createElement("Frame", v20, v21)
    local TooltipContent = false
    if a1.Name ~= nil then
        local v24
        if a1.Stats then
            v20 = {
                Name = v5,
                Header = a1.Name,
                Subject = a1.Description,
                Disabled = not Enabled,
            }
            if a1.Stats then
                v24 = {}
                for k2, n in a1.Stats do
                    if n ~= 0 then
                        table.insert(v24, {Bullet = false, Icon = Icons[k2], Text = tostring(n)})
                    end
                end
                v21 = if next(v24) then v24 else nil
            elseif not a1.TooltipContent then
                v21 = {}
            else
                v24 = {}
                for k, v in pairs(a1.TooltipContent) do
                    table.insert(v24, {Text = v})
                end
                v21 = if next(v24) then v24 else nil
            end
            v20.Content = v21
            TooltipContent = createElement(Tooltip, v20)
        else
            TooltipContent = a1.TooltipContent
            if TooltipContent then
                v20 = {
                    Name = v5,
                    Header = a1.Name,
                    Subject = a1.Description,
                    Disabled = not Enabled,
                }
                if a1.Stats then
                    v24 = {}
                    for i5, i6 in a1.Stats do
                        if i6 ~= 0 then
                            table.insert(v24, {Bullet = false, Icon = Icons[i5], Text = tostring(i6)})
                        end
                    end
                    v21 = if next(v24) then v24 else nil
                elseif not a1.TooltipContent then
                    v21 = {}
                else
                    v24 = {}
                    for k3, m in pairs(a1.TooltipContent) do
                        table.insert(v24, {Text = m})
                    end
                    v21 = if next(v24) then v24 else nil
                end
                v20.Content = v21
                TooltipContent = createElement(Tooltip, v20)
            end
        end
    end
    v2.Tooltip = TooltipContent
    v20 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundTransparency = 1,
        Text = "",
        ZIndex = 1000,
        Active = Enabled,
        Selectable = Enabled,
    }
    v21 = Enabled and not a1.dontAnimate
    v20.AutoButtonColor = v21

    v20[Event.MouseEnter] = function() -- Line: 453 -- upvalues: a1 (val), u27 (val)
        if a1.dontAnimate then
            return
        end
        u27(1)
    end

    v20[Event.MouseLeave] = function() -- Line: 459 -- upvalues: a1 (val), u27 (val)
        if a1.OnPressChanged then
            a1.OnPressChanged(false)
        end
        if a1.dontAnimate then
            return
        end
        u27(0)
    end

    v20[Event.MouseButton1Down] = function() -- Line: 469 -- upvalues: a1 (val), u90 (val)
        if a1.OnPressChanged then
            a1.OnPressChanged(true)
        end
        if a1.dontAnimate then
            return
        end
        u90(true)
    end

    v20[Event.MouseButton1Up] = function() -- Line: 479 -- upvalues: a1 (val), u90 (val)
        if a1.OnPressChanged then
            a1.OnPressChanged(false)
        end
        if a1.dontAnimate then
            return
        end
        u90(false)
    end

    v20[Event.MouseButton1Click] = v9
    v2.Button = createElement("TextButton", v20)
    v20 = {
        BackgroundTransparency = 0,
        TextSize = 16,
        ZIndex = 2,
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.fromOffset(18, 18),
        Font = Enum.Font.GothamBlack,
        BackgroundColor3 = v13,
        TextColor3 = v11:map(function(a1) -- Line: 497
            return (Color3.new(1, 1, 1)):Lerp(Color3.new(0, 0, 0), a1)
        end),
        Visible = a1.Binding ~= nil,
        Text = v8,
    }
    v21 = {
        Stroke = createElement("UIStroke", {
            Thickness = 2,
            Transparency = 0,
            LineJoinMode = Enum.LineJoinMode.Round,
            Color = v11:map(function(a1) -- Line: 510
                return (Color3.new(1, 1, 1)):Lerp(Color3.new(0, 0, 0), 1 - a1)
            end),
        }),
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
    }
    v2.Hotkey = createElement("TextLabel", v20, v21)
    v2.Cost = if a1.Price == nil then nil else createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.fromScale(1, 0.3),
        Font = Enum.Font.GothamBlack,
        TextColor3 = Color3.fromRGB(53, 213, 67),
        Text = if typeof(a1.Price) == "number" then ("$%*"):format((Comma(a1.Price))) else if typeof(a1.Price) ~= "table" then "" else a1.Price:map(function(a1) -- Line: 533 -- upvalues: Comma (upval)
            return (("$%*"):format((Comma(a1))))
        end),
    }, {
        TextSize = createElement("UITextSizeConstraint", {MaxTextSize = 30, MinTextSize = 1}),
        Stroke = createElement("UIStroke", {
            Thickness = 4,
            Transparency = 0.5,
            LineJoinMode = Enum.LineJoinMode.Round,
            Color = Color3.new(0, 0, 0),
        }),
    })
    if a1.Stock == nil then
        v3 = nil
    else
        v20 = {BackgroundTransparency = 1, TextScaled = true, ZIndex = 4}
        v21 = a1.Price and Vector2.new(1, 0) or Vector2.new(0.5, 1)
        v20.AnchorPoint = v21
        v21 = a1.Price and UDim2.fromScale(1, 0) or UDim2.fromScale(0.5, 1)
        v20.Position = v21
        v20.TextXAlignment = a1.Price and Enum.TextXAlignment.Right or Enum.TextXAlignment.Center
        v20.Size = UDim2.fromScale(1, 0.3)
        v20.Font = Enum.Font.GothamBlack
        v20.TextColor3 = Color3.new(1, 1, 1)
        v20.Text = if typeof(a1.Stock) ~= "number" then "" else if not a1.Amount then Comma(a1.Stock) else ("%*/%*"):format(Comma(a1.Stock), (Comma(a1.Amount)))
        v3 = createElement("TextLabel", v20, {
            TextSize = createElement("UITextSizeConstraint", {MaxTextSize = 30, MinTextSize = 1}),
            Stroke = createElement("UIStroke", {
                Thickness = 4,
                Transparency = 0.5,
                LineJoinMode = Enum.LineJoinMode.Round,
                Color = Color3.new(0, 0, 0),
            }),
        })
    end
    v2.Stock = v3
    v2.Lock = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        ImageTransparency = 0,
        Image = "rbxassetid://1197061307",
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.new(0.55, 0, 0.55, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        ScaleType = Enum.ScaleType.Fit,
        Visible = v7,
    })
    v2.Level = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.98),
        Size = UDim2.fromScale(0.75, 0.25),
        Font = Enum.Font.GothamBold,
        TextColor3 = Color3.new(1, 1, 1),
        Visible = v7,
        Text = ("Lv. %*"):format(a1.LevelLock or ""),
    }, {
        TextSize = createElement("UITextSizeConstraint", {MaxTextSize = 30, MinTextSize = 1}),
        Stroke = createElement("UIStroke", {
            Thickness = 2,
            Transparency = 0.5,
            LineJoinMode = Enum.LineJoinMode.Miter,
            Color = Color3.new(0, 0, 0),
        }),
    })
    v2.Cooldown = createElement("Frame", {
        BackgroundTransparency = 0.2,
        ZIndex = 5,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        Visible = React.joinBindings({Cooldown, Queued}):map(function(a1) -- Line: 622
            local v1 = true
            if not (0.01 < a1[1]) then
                v1 = a1[2]
            end
            return v1
        end),
    }, {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        uIGradient = createElement("UIGradient", {
            Rotation = -90,
            Offset = Cooldown:map(function(a1) -- Line: 632 -- upvalues: u37 (val)
                if a1 > 0.01 then
                    return (Vector2.new(0, 1 - math.clamp(a1 / u37, 0, 1) - 0.5))
                end
                return (Vector2.new(0, -0.5))
            end),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.505, 1),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
    v2.Timeleft = createElement("TextLabel", {
        TextScaled = true,
        TextSize = 10,
        TextWrapped = true,
        BackgroundTransparency = 1,
        ZIndex = 6,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = Cooldown:map(function(a1) -- Line: 658
            return (("%*"):format((math.ceil(a1))))
        end),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Visible = Cooldown:map(function(a1) -- Line: 665
            return a1 > 0.01
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.4, 0.4),
    }, {uIStroke = createElement("UIStroke", {Thickness = 3, Transparency = 0.5})})
    v17.content = createElement("Frame", v19, v2)
    return (createElement("Frame", v16, v17))
end)