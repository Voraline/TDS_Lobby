-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Tab
-- Decompile time: 5.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local Container = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.BaseComponents.Container)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.BaseComponents.ImageLabel)
local createElement = React.createElement
local u58 = UDim.new(0, 6)
return function(a1) -- Line: 26
    -- upvalues: useCharmSelector (val), SandboxStore (val), useSpring (val), React (val), createElement (val)
    -- upvalues: Container (val), u58 (val), ImageLabel (val)
    local u5 = useCharmSelector(SandboxStore.getState, function(a1) -- Line: 27
        return a1.SelectedTab
    end)
    local v1, u12 = useSpring(0, 1, 30, true)
    local v2, u19 = useSpring(0, 1, 30, true)
    local useEffect = React.useEffect
    local v3 = {u5, a1.id}
    useEffect(function() -- Line: 34 -- upvalues: u12 (val), u5 (val), a1 (val)
        u12(if u5 ~= a1.id then 0 else 1)
    end, v3)
    local v4 = React.joinBindings({selected = v1, hovered = v2})
    local v5 = createElement
    v3 = Container
    local v6 = {
        BackgroundTransparency = 0.6,
        CornerRadius = 8,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(99, 99, 99),
        StrokeColor = Color3.fromRGB(43, 92, 167),
        StrokeThickness = v1:map(function(a1) -- Line: 54 -- types: a1: number
            return a1 * 2
        end),
        Transparency = v4:map(function(a1) -- Line: 58
            return (1 - a1.selected) * ((1 - a1.hovered) * 0.5 + 0.5)
        end),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.new(0, 200, 1, 0),
        LayoutOrder = a1.layoutOrder,
    }
    local v7 = {uICorner = createElement("UICorner", {CornerRadius = u58})}
    local v8 = createElement
    local v9 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), ZIndex = 1000, Active = true}

    v9[React.Event.MouseButton1Click] = function() -- Line: 82 -- upvalues: a1 (val)
        a1.onClick(a1.id)
    end

    v9[React.Event.MouseEnter] = function() -- Line: 86 -- upvalues: u19 (val)
        u19(1)
    end

    v9[React.Event.MouseLeave] = function() -- Line: 90 -- upvalues: u19 (val)
        u19(0)
    end

    v7.inputSinker = v8("ImageButton", v9)
    v7.uIGradient = createElement("UIGradient", {
        Rotation = -90,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.2, 0),
            (NumberSequenceKeypoint.new(1, 0.2)),
        }),
    })
    v7.dropShadow = createElement(ImageLabel, {
        ZIndex = -1,
        Image = "rbxassetid://9239716855",
        ImageTransparency = 0.2,
        Size = UDim2.new(1, 14, 1, 14),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(14, 14, 64, 24),
        Transparency = v1:map(function(a1) -- Line: 114 -- types: a1: number
            return 1 - a1
        end),
    })
    v7.selectedHighlight = createElement("Frame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, -10),
        Size = UDim2.new(1, 10, 0.1, 10),
    }, {
        interior = createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.new(0.5, 0, 0, 10),
            BackgroundColor3 = Color3.fromRGB(43, 92, 167),
            BackgroundTransparency = v1:map(function(a1) -- Line: 130
                return 1 - a1
            end),
            Size = v1:map(function(a1) -- Line: 133
                return (UDim2.new(0, 0, 2, 0)):Lerp(UDim2.new(1, -10, 2, 0), a1)
            end),
        }, {uICorner = createElement("UICorner", {CornerRadius = u58})}),
    })
    v7.text = createElement("TextLabel", {
        ZIndex = 4,
        BackgroundTransparency = 1,
        TextSize = 25,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0, 1),
        Text = a1.id,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AutomaticSize = Enum.AutomaticSize.X,
        Font = Enum.Font.GothamBold,
    }, {
        stroke = createElement("UIStroke", {Transparency = 0, Thickness = 2, LineJoinMode = Enum.LineJoinMode.Round}),
    })
    return v5(v3, v6, v7)
end