-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPHealthBar
-- Decompile time: 23.88 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
require(ReplicatedStorage.Client.Interfaces.Hooks.useGameRule)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local useMemo = React.useMemo
local memo = React.memo
local Tween = ReactFlow.Tween
local useGroupAnimation = ReactFlow.useGroupAnimation
local useSequenceAnimation = ReactFlow.useSequenceAnimation
local useTween = ReactFlow.useTween
local u72 = Color3.fromRGB(255, 71, 71)
local u77 = Color3.fromRGB(0, 170, 255)

local function modify(a1, a2) -- Line: 34 -- types: a1: number, a2: number
    if a2 then
        return a1
    end
    return 1 - a1
end

local u81 = memo(function(a1) -- Line: 42 -- upvalues: createElement (val), React (val)
    local reverse = a1.reverse
    local v1 = {BorderSizePixel = 0}
    local color = a1.color or Color3.fromRGB(243, 243, 243)
    v1.BackgroundColor3 = color
    v1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v1.Size = UDim2.fromScale(1, 1)
    v1.ZIndex = a1.zIndex or 0
    v1.BackgroundTransparency = a1.transparency:map(function(a1) -- Line: 50
        return a1
    end)
    return createElement("Frame", v1, {
        corner = createElement("UICorner"),
        gradient = createElement("UIGradient", {
            Rotation = if not reverse then 180 else 0,
            Offset = (React.joinBindings({a1.offset, a1.value})):map(function(a1) -- Line: 57 -- upvalues: reverse (val)
                local new = Vector2.new
                local v1 = a1[2]
                local v2 = (if not reverse then 1 - v1 else v1) - 0.5
                v1 = a1[1]
                return new(v2 + (if not reverse then 1 - v1 else v1), 0)
            end),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.501, 1),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
end)
local u84 = memo(function(a1) -- Line: 73 -- upvalues: createElement (val), ImageLabel (val)
    local reverse = a1.reverse
    local v1 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Image = ("rbxassetid://%*"):format(if not reverse then 115301677974683 else 138385766671386),
    }
    local color = a1.color or Color3.fromRGB(255, 21, 21)
    v1.ImageColor3 = color
    v1.SliceCenter = Rect.new(8, 8, if not reverse then 64 else 56, 56)
    v1.ScaleType = Enum.ScaleType.Slice
    v1.Size = UDim2.fromScale(1, 1)
    v1.ZIndex = a1.zIndex or 2
    return createElement(ImageLabel, v1, {
        gradient = createElement("UIGradient", {
            Rotation = if not reverse then 180 else 0,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.501, 1),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
            Offset = a1.value:map(function(a1) -- Line: 96 -- upvalues: reverse (val)
                return Vector2.new((reverse and a1 or 1 - a1) - 0.5, 0)
            end),
            Enabled = a1.value:map(function(a1) -- Line: 99
                return a1 ~= 1
            end),
        }),
    })
end)
local u87 = memo(function(a1) -- Line: 106
    -- upvalues: Enum (val), Icons (val), useMemo (val), HttpService (val), createElement (val), ImageLabel (val)
    -- upvalues: Tooltip (val)
    local modifier = a1.modifier
    local amount = a1.amount
    local v1 = Enum.Modifier.ToString(modifier) or "Aggro"
    return createElement(ImageLabel, {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
        LayoutOrder = a1.LayoutOrder,
        Image = Icons[v1],
    }, {
        tooltip = createElement(Tooltip, {
            Name = useMemo(function() -- Line: 113 -- upvalues: HttpService (upval)
                return HttpService:GenerateGUID(false)
            end, {}),
            Header = v1,
            Subject = ("%* Modifier"):format(v1),
        }),
        corner = createElement("UICorner"),
        count = amount and createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            Size = UDim2.fromScale(1, 0.5),
            Position = UDim2.fromScale(0.5, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Text = ("x%*"):format(amount),
            Font = Enum.Font.GothamBlack,
            TextColor3 = Color3.new(1, 1, 1),
        }, {
            TextSize = createElement("UITextSizeConstraint", {MaxTextSize = 30, MinTextSize = 1}),
            Stroke = createElement("UIStroke", {
                Thickness = 2,
                Transparency = 0.5,
                LineJoinMode = Enum.LineJoinMode.Round,
                Color = Color3.new(0, 0, 0),
            }),
        }),
    })
end)
return (memo(function(a1) -- Line: 156
    -- upvalues: useBinding (val), useTween (val), useGroupAnimation (val), useSequenceAnimation (val), Tween (val)
    -- upvalues: useEffect (val), createElement (val), u84 (val), u72 (val), u81 (val), React (val), u77 (val)
    -- upvalues: TextLabel (val), ImageLabel (val), table (val), u87 (val)
    local u3, u4 = useBinding(a1.leftHealth)
    local u7, u8 = useBinding(a1.rightHealth)
    local v1, u12 = useBinding(a1.leftHealth)
    local v2, u16 = useBinding(a1.rightHealth)
    local u19, u20 = useBinding(0)
    local u23, u24 = useBinding(0)
    local v3, u31 = useTween({start = 0, target = 0, info = TweenInfo.new(0.2)})
    local v4, u38 = useTween({start = 0, target = 0, info = TweenInfo.new(0.2)})
    local leftInvincible = a1.leftInvincible
    local rightInvincible = a1.rightInvincible
    local v5, u49 = useTween({start = a1.leftHealth, target = a1.leftHealth, info = TweenInfo.new(0.2)})
    local v6, u58 = useTween({start = a1.rightHealth, target = a1.rightHealth, info = TweenInfo.new(0.2)})
    local v7, u86 = useGroupAnimation({
        offset = useSequenceAnimation({
            {
                timestamp = 0,
                offset = Tween({start = 0, target = 1, info = TweenInfo.new(0)}),
                transparency = Tween({start = 0, target = 1, info = TweenInfo.new(0.3)}),
            },
            {
                timestamp = 0.166,
                offset = Tween({start = 1, target = 0, info = TweenInfo.new(0.166)}),
            },
        }),
    }, {offset = 1, transparency = 0})
    local v8, u114 = useGroupAnimation({
        offset = useSequenceAnimation({
            {
                timestamp = 0,
                offset = Tween({start = 0, target = 1, info = TweenInfo.new(0)}),
                transparency = Tween({start = 0, target = 1, info = TweenInfo.new(0.3)}),
            },
            {
                timestamp = 0.166,
                offset = Tween({start = 1, target = 0, info = TweenInfo.new(0.166)}),
            },
        }),
    }, {offset = 1, transparency = 0})
    local v9 = useEffect
    local v10 = {a1.leftHealth, a1.leftMaxHealth}
    v9(function() -- Line: 251 -- upvalues: a1 (val), u19 (val), u20 (val), u31 (val)
        local v1 = a1.leftHealth - a1.leftMaxHealth
        if v1 < u19:getValue() and v1 > 0 and a1.shieldDamageSound then
            a1.shieldDamageSound()
        end
        u20(v1)
        u31({target = v1})
    end, v10)
    v9 = useEffect
    v10 = {a1.leftHealth, a1.leftMaxHealth}
    v9(function() -- Line: 268 -- upvalues: a1 (val), u23 (val), u24 (val), u38 (val)
        local v1 = a1.rightHealth - a1.rightMaxHealth
        if v1 < u23:getValue() and v1 > 0 and a1.shieldDamageSound then
            a1.shieldDamageSound()
        end
        u24(v1)
        u38({target = v1})
    end, v10)
    v9 = useEffect
    v10 = {a1.leftHealth}
    v9(function() -- Line: 283 -- upvalues: a1 (val), u3 (val), u12 (val), u4 (val), u49 (val), u86 (val)
        if not (a1.leftHealth < u3:getValue()) then
            local leftHealth = a1.leftHealth
            if u3:getValue() < leftHealth and a1.healHealthSound then
                a1.healHealthSound()
            end
        else
            local v1 = (u3:getValue()) - a1.leftHealth
            local v2 = 0 < a1.leftHealth - a1.leftMaxHealth
            if a1.leftHealth <= 0 and a1.fatalHealthSound then
                a1.fatalHealthSound()
            end
            if not v2 then
                if not (0.25 <= v1 / a1.leftMaxHealth) then
                    if a1.lowHealthSound then
                        a1.lowHealthSound()
                    end
                elseif a1.mediumHealthSound then
                    a1.mediumHealthSound()
                end
            end
        end
        u12(u3:getValue())
        u4(a1.leftHealth)
        u49({target = a1.leftHealth})
        u86("offset")
    end, v10)
    v9 = useEffect
    v10 = {a1.rightHealth}
    v9(function() -- Line: 319 -- upvalues: a1 (val), u7 (val), u16 (val), u3 (val), u8 (val), u58 (val), u114 (val)
        if not (a1.rightHealth < u7:getValue()) then
            local rightHealth = a1.rightHealth
            if u7:getValue() < rightHealth and a1.healHealthSound then
                a1.healHealthSound()
            end
        else
            local v1 = (u7:getValue()) - a1.rightHealth
            local v2 = 0 < a1.rightHealth - a1.rightMaxHealth
            if a1.rightHealth <= 0 and a1.fatalHealthSound then
                a1.fatalHealthSound()
            end
            if not v2 then
                if not (0.25 <= v1 / a1.rightMaxHealth) then
                    if a1.lowHealthSound then
                        a1.lowHealthSound()
                    end
                elseif a1.mediumHealthSound then
                    a1.mediumHealthSound()
                end
            end
        end
        u16(u3:getValue())
        u8(a1.rightHealth)
        u58({target = a1.rightHealth})
        u114("offset")
    end, v10)
    v9 = createElement
    v10 = {BackgroundTransparency = 0.2}
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 0.5)
    v10.AnchorPoint = anchorPoint
    local position = a1.position or UDim2.fromScale(0.5, 0.5)
    v10.Position = position
    local size = a1.size or UDim2.fromOffset(480, 32)
    v10.Size = size
    v10.BackgroundColor3 = Color3.new(0, 0, 0)
    return v9("Frame", v10, {
        leftHealth = createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.5, 1),
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.fromScale(0, 0),
        }, {
            shield = createElement(u84, {
                zIndex = 10,
                value = v3:map(function(a1_2) -- Line: 369 -- upvalues: a1 (val)
                    return a1_2 / a1.leftMaxHealth
                end),
                color = Color3.fromRGB(66, 255, 239),
            }),
            health = createElement(u84, {
                value = v5:map(function(a1_2) -- Line: 377 -- upvalues: a1 (val)
                    return a1_2 / a1.leftMaxHealth
                end),
                color = u72,
            }),
            lag1 = createElement(u81, {
                zIndex = 1,
                value = v5:map(function(a1_2) -- Line: 384 -- upvalues: a1 (val)
                    return a1_2 / a1.leftMaxHealth
                end),
                transparency = v7.transparency,
                color = Color3.fromRGB(251, 207, 119),
                offset = (React.joinBindings({v1, v5, v7.offset})):map(function(a1_2) -- Line: 393 -- upvalues: a1 (val)
                    return (a1_2[1] - a1_2[2]) / a1.leftMaxHealth / 2 * a1_2[3]
                end),
            }),
            lag2 = createElement(u81, {
                zIndex = 0,
                color = Color3.fromRGB(255, 255, 255),
                value = v5:map(function(a1_2) -- Line: 404 -- upvalues: a1 (val)
                    return a1_2 / a1.leftMaxHealth
                end),
                transparency = v7.transparency,
                offset = (React.joinBindings({v1, v5, v7.offset})):map(function(a1_2) -- Line: 412 -- upvalues: a1 (val)
                    return (a1_2[1] - a1_2[2]) / a1.leftMaxHealth * a1_2[3]
                end),
            }),
        }),
        rightHealth = createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.5, 1),
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(1, 0),
        }, {
            health = createElement(u84, {
                reverse = true,
                value = v6:map(function(a1_2) -- Line: 430 -- upvalues: a1 (val)
                    return a1_2 / a1.rightMaxHealth
                end),
                color = u77,
            }),
            shield = createElement(u84, {
                zIndex = 10,
                value = v4:map(function(a1_2) -- Line: 437 -- upvalues: a1 (val)
                    return a1_2 / a1.rightMaxHealth
                end),
                color = Color3.fromRGB(66, 255, 239),
            }),
            lag1 = createElement(u81, {
                reverse = true,
                zIndex = 1,
                value = v6:map(function(a1_2) -- Line: 446 -- upvalues: a1 (val)
                    return a1_2 / a1.rightMaxHealth
                end),
                transparency = v8.transparency,
                color = Color3.fromRGB(251, 207, 119),
                offset = (React.joinBindings({v2, v6, v8.offset})):map(function(a1_2) -- Line: 455 -- upvalues: a1 (val)
                    return (a1_2[1] - a1_2[2]) / a1.rightMaxHealth / 2 * a1_2[3]
                end),
            }),
            lag2 = createElement(u81, {
                zIndex = 0,
                color = Color3.fromRGB(255, 255, 255),
                value = v6:map(function(a1_2) -- Line: 466 -- upvalues: a1 (val)
                    return a1_2 / a1.rightMaxHealth
                end),
                transparency = v8.transparency,
                offset = (React.joinBindings({v2, v6, v8.offset})):map(function(a1_2) -- Line: 474 -- upvalues: a1 (val)
                    return (a1_2[1] - a1_2[2]) / a1.rightMaxHealth * a1_2[3]
                end),
            }),
        }),
        leftProgress = createElement(TextLabel, {
            TextScaled = true,
            ZIndex = 3,
            StrokeThickness = 2,
            StrokeTransparency = 0.5,
            FontWeight = "Bold",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.95, 0.6),
            Text = v5:map(function(a1_2) -- Line: 488 -- upvalues: leftInvincible (val), a1 (val)
                if leftInvincible then
                    return "∞"
                end
                return (("%* / %*"):format(math.floor(a1_2), a1.leftMaxHealth))
            end),
            TextXAlignment = Enum.TextXAlignment.Left,
        }),
        rightProgress = createElement(TextLabel, {
            TextScaled = true,
            ZIndex = 3,
            StrokeThickness = 2,
            StrokeTransparency = 0.5,
            FontWeight = "Bold",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.95, 0.6),
            Text = v6:map(function(a1_2) -- Line: 506 -- upvalues: rightInvincible (val), a1 (val)
                if rightInvincible then
                    return "∞"
                end
                return (("%* / %*"):format(math.floor(a1_2), a1.rightMaxHealth))
            end),
            TextXAlignment = Enum.TextXAlignment.Right,
        }),
        icon = createElement(ImageLabel, {
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
        title = createElement(TextLabel, {
            FontWeight = "SemiBold",
            Text = "Base Health",
            TextScaled = true,
            ZIndex = 3,
            StrokeThickness = 2,
            StrokeTransparency = 0.25,
            Position = UDim2.new(0.5, 0, 0, -8),
            Size = UDim2.fromScale(0.9, 0.6),
            AnchorPoint = Vector2.new(0.5, 1),
        }),
        modifiers = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.new(0, 0, 1, 5),
            Size = UDim2.new(1, 0, 0, 30),
        }, {
            modifierList = createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 8),
            }),
            content = createElement(React.Fragment, {}, table.reduce(a1.modifiers or {}, function(a1, a2, a3) -- Line: 561 -- upvalues: createElement (upval), u87 (upval)
                local v1 = tostring(a3)
                a1[v1] = (createElement(u87, {LayoutOrder = a3, modifier = a2.modifier, amount = a2.amount}))
                return a1
            end, {})),
        }),
        corner = createElement("UICorner"),
        stroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(39, 39, 39)}),
    })
end))