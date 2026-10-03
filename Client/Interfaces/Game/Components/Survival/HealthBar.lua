-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Survival.HealthBar
-- Decompile time: 5.84 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local memo = React.memo
local Tween = ReactFlow.Tween
local useGroupAnimation = ReactFlow.useGroupAnimation
local useSequenceAnimation = ReactFlow.useSequenceAnimation
local useTween = ReactFlow.useTween
local u36 = memo(function(a1) -- Line: 18 -- upvalues: createElement (val), React (val)
    local v1 = {BorderSizePixel = 0}
    local color = a1.color or Color3.fromRGB(243, 243, 243)
    v1.BackgroundColor3 = color
    v1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v1.Size = UDim2.fromScale(1, 1)
    v1.ZIndex = a1.zIndex or 0
    v1.BackgroundTransparency = a1.transparency:map(function(a1) -- Line: 25
        return a1
    end)
    return createElement("Frame", v1, {
        corner = createElement("UICorner"),
        gradient = createElement("UIGradient", {
            Offset = React.joinBindings({a1.offset, a1.value}):map(function(a1) -- Line: 31
                return Vector2.new(a1[2] - 0.5 + a1[1], 0)
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
local u39 = memo(function(a1) -- Line: 44 -- upvalues: createElement (val), ImageLabel (val)
    local v1 = {
        BorderSizePixel = 0,
        Image = "rbxassetid://76856872302406",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local color = a1.color or Color3.fromRGB(255, 21, 21)
    v1.ImageColor3 = color
    v1.Size = UDim2.fromScale(1, 1)
    v1.ZIndex = a1.zIndex or 2
    return createElement(ImageLabel, v1, {
        corner = createElement("UICorner"),
        gradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.501, 1),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
            Offset = a1.value:map(function(a1) -- Line: 62
                return Vector2.new(a1 - 0.5, 0)
            end),
            Enabled = a1.value:map(function(a1) -- Line: 65
                return a1 ~= 1
            end),
        }),
    })
end)
return (memo(function(a1) -- Line: 72
    -- upvalues: useBinding (val), useTween (val), useGroupAnimation (val), useSequenceAnimation (val), Tween (val)
    -- upvalues: useEffect (val), createElement (val), u39 (val), u36 (val), React (val), TextLabel (val)
    -- upvalues: ImageLabel (val)
    local u3, u4 = useBinding(a1.health)
    local u7, u8 = useBinding(0)
    local v1, u12 = useBinding(a1.health)
    local v2, u21 = useTween({start = a1.health, target = a1.health, info = TweenInfo.new(0.2)})
    local v3, u32 = useTween({
        start = a1.shield or 0,
        target = a1.shield or 0,
        info = TweenInfo.new(0.2),
    })
    local v4, u60 = useGroupAnimation({
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
    local v5 = useEffect
    local v6 = {a1.health, a1.invincible}
    v5(function() -- Line: 118 -- upvalues: a1 (val), u3 (val), u12 (val), u4 (val), u21 (val), u60 (val)
        local v1
        if not (a1.health < u3:getValue()) then
            local health = a1.health
            if u3:getValue() < health and a1.healHealthSound then
                a1.healHealthSound()
            end
        else
            local v2 = (u3:getValue()) - a1.health
            v1 = 0 < a1.health - a1.maxHealth
            if a1.health <= 0 and a1.fatalHealthSound then
                a1.fatalHealthSound()
            end
            if not v1 then
                if not (0.25 <= v2 / a1.maxHealth) then
                    if a1.lowHealthSound then
                        a1.lowHealthSound()
                    end
                elseif a1.mediumHealthSound then
                    a1.mediumHealthSound()
                end
            end
        end
        u12(u3:getValue())
        u4(a1.health)
        v1 = {}
        local maxHealth = if not a1.invincible then a1.health else a1.maxHealth
        v1.target = maxHealth
        u21(v1)
        u60("offset")
    end, v6)
    v5 = useEffect
    v6 = {a1.health, a1.maxHealth}
    v5(function() -- Line: 154 -- upvalues: a1 (val), u7 (val), u8 (val), u32 (val)
        local v1 = a1.health - a1.maxHealth
        if v1 < u7:getValue() and v1 > 0 and a1.shieldDamageSound then
            a1.shieldDamageSound()
        end
        u8(v1)
        u32({target = v1})
    end, v6)
    v6 = {BackgroundTransparency = 0.2}
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 0.5)
    v6.AnchorPoint = anchorPoint
    local position = a1.position or UDim2.fromScale(0.5, 0.1)
    v6.Position = position
    local size = a1.size or UDim2.fromOffset(480, 32)
    v6.Size = size
    v6.BackgroundColor3 = Color3.new(0, 0, 0)
    return createElement("Frame", v6, {
        health = createElement(u39, {
            value = v2:map(function(a1_2) -- Line: 177 -- upvalues: a1 (val)
                return a1_2 / a1.maxHealth
            end),
            color = a1.color,
        }),
        shield = createElement(u39, {
            zIndex = 3,
            value = v3:map(function(a1_2) -- Line: 183 -- upvalues: a1 (val)
                return a1_2 / a1.maxHealth
            end),
            color = a1.shieldColor,
        }),
        lag1 = createElement(u36, {
            zIndex = 1,
            value = v2:map(function(a1_2) -- Line: 190 -- upvalues: a1 (val)
                return a1_2 / a1.maxHealth
            end),
            transparency = v4.transparency,
            color = Color3.fromRGB(251, 207, 119),
            offset = (React.joinBindings({v1, v2, v4.offset})):map(function(a1_2) -- Line: 196 -- upvalues: a1 (val)
                return (a1_2[1] - a1_2[2]) / a1.maxHealth / 2 * a1_2[3]
            end),
        }),
        lag2 = createElement(u36, {
            zIndex = 0,
            color = Color3.fromRGB(255, 255, 255),
            value = v2:map(function(a1_2) -- Line: 206 -- upvalues: a1 (val)
                return a1_2 / a1.maxHealth
            end),
            transparency = v4.transparency,
            offset = (React.joinBindings({v1, v2, v4.offset})):map(function(a1_2) -- Line: 211 -- upvalues: a1 (val)
                return (a1_2[1] - a1_2[2]) / a1.maxHealth * a1_2[3]
            end),
        }),
        progress = createElement(TextLabel, {
            TextScaled = true,
            ZIndex = 3,
            StrokeThickness = 2,
            StrokeTransparency = 0.5,
            FontWeight = "Bold",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.9, 0.6),
            Text = v2:map(function(a1_2) -- Line: 223 -- upvalues: a1 (val)
                if a1.invincible then
                    return "∞"
                end
                if a1.percentage then
                    return (("%*%%"):format((math.round(a1_2 / a1.maxHealth * 100))))
                end
                return (("%* / %*"):format(math.floor(a1.shield and a1_2 + a1.shield or a1_2), a1.maxHealth))
            end),
        }),
        icon = if a1.disableIcon then nil else createElement(ImageLabel, {
            ImageTransparency = 0.6,
            BackgroundTransparency = 1,
            ZIndex = 4,
            Image = ("rbxassetid://%*"):format(a1.icon or 71379714293602),
            ImageColor3 = Color3.new(0, 0, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.625, 0.625),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
            Position = UDim2.fromScale(0.033, 0.5),
        }),
        title = createElement(TextLabel, {
            FontWeight = "SemiBold",
            TextScaled = true,
            ZIndex = 3,
            StrokeThickness = 2,
            StrokeTransparency = 0.25,
            Position = UDim2.new(0.5, 0, 0, -8),
            Size = UDim2.fromScale(0.9, 0.6),
            AnchorPoint = Vector2.new(0.5, 1),
            Text = a1.title or "Base Health",
        }),
        corner = createElement("UICorner"),
        stroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(39, 39, 39)}),
    })
end))