-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Timer
-- Decompile time: 6.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local usePooledEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.usePooledEvent)
local createElement = React.createElement
local useEffect = React.useEffect
local useBinding = React.useBinding

local function convertTime(a1) -- Line: 25 -- types: a1: number
    local v1 = math.floor(a1 / 86400)
    local v2 = math.floor(a1 / 3600) % 24
    local v3 = math.floor(a1 / 60) % 60
    local v4 = math.floor(a1 % 60)

    local function v5(a1) -- Line: 31
        return a1 < 10 and "0" .. a1 or tostring(a1)
    end

    local v6 = {}
    if v1 > 0 then
        table.insert(v6, v1 < 10 and "0" .. v1 or tostring(v1))
        table.insert(v6, v2 < 10 and "0" .. v2 or tostring(v2))
        table.insert(v6, v3 < 10 and "0" .. v3 or tostring(v3))
    elseif v2 > 0 then
        table.insert(v6, v2 < 10 and "0" .. v2 or tostring(v2))
        table.insert(v6, v3 < 10 and "0" .. v3 or tostring(v3))
    elseif v3 > 0 then
        table.insert(v6, v3 < 10 and "0" .. v3 or tostring(v3))
    end
    table.insert(v6, v4 < 10 and "0" .. v4 or tostring(v4))
    return table.concat(v6, ":")
end

return function(a1) -- Line: 52
    -- upvalues: useBinding (val), useEffect (val), usePooledEvent (val), RunService (val), convertTime (val)
    -- upvalues: createElement (val)
    local u4, u5 = useBinding(a1.TimeLeft or 0)
    local v1 = useEffect
    local v2 = {a1.TimeLeft}
    v1(function() -- Line: 55 -- upvalues: a1 (val), u4 (val), u5 (val)
        if a1.TimeLeft ~= u4:getValue() then
            u5(a1.TimeLeft)
        end
    end, v2)
    usePooledEvent(RunService.Stepped, function(a1, a2) -- Line: 61 -- upvalues: u4 (val), u5 (val)
        if (u4:getValue()) <= 0 then
            return
        end
        u5((math.max(0, (u4:getValue()) - a2)))
    end, {})
    v1 = if not a1.TimerTemplate then u4:map(function(a1) -- Line: 73 -- upvalues: convertTime (upval)
        return convertTime(a1)
    end) else u4:map(function(a1_2) -- Line: 70 -- upvalues: a1 (val), convertTime (upval)
        return string.format(a1.TimerTemplate, convertTime(a1_2))
    end)
    local v3 = {BackgroundTransparency = 0.4}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(1, 0)
    v3.AnchorPoint = AnchorPoint
    v3.AutomaticSize = Enum.AutomaticSize.X
    v3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    local Position = a1.Position or UDim2.new(1, 0, 0, 0)
    v3.Position = Position
    local Size = a1.Size or UDim2.fromScale(0, 1)
    v3.Size = Size
    local v4 = {}
    local v5 = {}
    local CornerRadius = a1.CornerRadius or UDim.new(0, 8)
    v5.CornerRadius = CornerRadius
    v4.corner = createElement("UICorner", v5)
    v4.listLayout = createElement("UIListLayout", {
        Padding = UDim.new(0, 0),
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    })
    v4.timerIcon = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        LayoutOrder = 0,
        Image = a1.TimerIcon or "rbxassetid://14907861175",
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.1, 0, 0.5, 0),
        Size = UDim2.fromScale(1, 1),
    }, {
        UIAspectRatioConstraint = createElement("UIAspectRatioConstraint"),
        UIScale = createElement("UIScale", {Scale = a1.IconScale or 0.9}),
    })
    v4.middleFillFrame = createElement("Frame", {
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(0.04, 1),
    })
    v4.label = createElement("TextLabel", {
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = v1,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = a1.TextSize or 24,
        AutomaticSize = Enum.AutomaticSize.X,
        Size = UDim2.fromScale(0, 1),
    }, {createElement("UITextSizeConstraint", {MaxTextSize = a1.MaxTextSize or 24})})
    local v6 = not a1.HasNoStroke and createElement("UIStroke", {
        Thickness = 0.075,
        Transparency = 0.5,
        Color = Color3.fromRGB(125, 125, 125),
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
    }) or nil
    v4.stroke = v6
    return createElement("Frame", v3, v4)
end