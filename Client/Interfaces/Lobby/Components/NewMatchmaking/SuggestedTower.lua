-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.SuggestedTower
-- Decompile time: 4.69 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.Button)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Icons = require(ReplicatedStorage.Shared.Data.Icons)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local RarityColors = require(ReplicatedStorage.Shared.Modules.RarityColors)
local React = require(ReplicatedStorage.Shared.UI.React)
local TextMarquee = require(ReplicatedStorage.Client.Interfaces.Universal.Components.TextMarquee)
local useTowerData = require(ReplicatedStorage.Client.Interfaces.Hooks.useTowerData)
local createElement = React.createElement
local memo = React.memo
local u53 = {}
u53[Enum.TowerCategory.Starter] = (Color3.fromRGB(255, 255, 255))
u53[Enum.TowerCategory.Intermediate] = RarityColors[Enum.Rarity.Uncommon]
u53[Enum.TowerCategory.Advanced] = RarityColors[Enum.Rarity.Rare]
u53[Enum.TowerCategory.Hardcore] = RarityColors[Enum.Rarity.Legendary]
u53[Enum.TowerCategory.Evolved] = (Color3.fromRGB(0, 208, 212))
u53[Enum.TowerCategory.Exclusive] = RarityColors[Enum.Rarity.Event]
u53[Enum.TowerCategory.Event] = RarityColors[Enum.Rarity.Event]
return memo(function(a1) -- Line: 40
    -- upvalues: useTowerData (val), u53 (val), React (val), Maid (val), createElement (val), Button (val)
    -- upvalues: TextMarquee (val), Icons (val), Enum (val)
    local v1 = useTowerData(a1.tower)
    local v2 = u53[v1.Properties.Category] or Color3.fromRGB(255, 255, 255)
    local DisplayName = v1.Properties.DisplayName or a1.tower
    local u21 = React.useRef(nil)
    local v3, u26 = React.useState(0)

    local function getTextSize(a1) -- Line: 50
        return (math.round(a1 * 0.16233766233766234))
    end

    local v4 = {u21}
    React.useLayoutEffect(function() -- Line: 54 -- upvalues: u21 (val), Maid (upval), u26 (val)
        if not u21.current then
            return
        end
        local u4 = Maid.new()
        u4:Mark(((u21.current:GetPropertyChangedSignal("AbsoluteSize")):Connect(function() -- Line: 61 -- upvalues: u26 (upval), u21 (upval)
            u26((math.round(u21.current.AbsoluteSize.Y * 0.16233766233766234)))
        end)))
        u26((math.round(u21.current.AbsoluteSize.Y * 0.16233766233766234)))
        return function() -- Line: 68 -- upvalues: u4 (val)
            u4:Sweep()
        end
    end, v4)
    local v5 = math.max(1, (math.round(v3 * 0.64)))
    local v6 = math.max(1, (math.round(v5 * 0.85)))
    v4 = a1.actionColor or v2
    local v7 = a1.actionText or "View"
    local v8 = {BackgroundTransparency = 1, BorderSizePixel = 0}
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 0.5)
    v8.AnchorPoint = anchorPoint
    local position = a1.position or UDim2.fromScale(0.5, 0.5)
    v8.Position = position
    local size = a1.size or UDim2.fromScale(0.25, 0.25)
    v8.Size = size
    v8.ref = u21
    local v9 = {AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1.86})}
    v9.suggestionText = React.createElement("TextLabel", {
        BackgroundTransparency = 1,
        Text = "Suggestion:",
        TextScaled = true,
        ZIndex = 123,
        AnchorPoint = Vector2.new(0, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.41, 0.3),
        Size = UDim2.fromScale(0.5, 0.13),
        TextColor3 = Color3.fromRGB(208, 208, 208),
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {uIStroke = React.createElement("UIStroke", {Thickness = 2, Transparency = 0.3})})
    v9.viewButtonContainer = createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 123,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0.41, 0.69),
        Size = UDim2.fromScale(0.5, 0.16),
    }, {
        viewButton = createElement(Button, {
            dontScale = true,
            zIndex = 123,
            anchorPoint = Vector2.new(0.5, 0.5),
            automaticSize = Enum.AutomaticSize.X,
            color = v4,
            padding = {left = UDim.new(0, v6), right = UDim.new(0, v6)},
            position = UDim2.fromScale(0.5, 0.5),
            size = UDim2.fromScale(0.7, 1),
            text = v7,
            textSize = v5,
            onClick = function() -- Line: 133 -- upvalues: a1 (val)
                if a1.actionDisabled then
                    return
                end
                a1.onView(a1.tower)
            end,
        }),
    })
    v9.towerText = React.createElement(TextMarquee, {
        alwaysMarquee = true,
        BackgroundTransparency = 1,
        TextScaled = true,
        ZIndex = 123,
        TextSize = v3,
        padding = UDim.new(0.01, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.41, 0.46),
        Size = UDim2.fromScale(0.5, 0.16),
        Text = DisplayName,
        TextColor3 = Color3.new(1, 1, 1),
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {
        uIStroke = React.createElement("UIStroke", {Thickness = 3, Transparency = 0.3}),
        uIGradient = React.createElement("UIGradient", {
            Rotation = -90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, v2),
                (ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))),
            }),
        }),
    })
    local v10 = {
        BackgroundTransparency = 0.15,
        ClipsDescendants = true,
        Size = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.25, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    }
    local v11 = {}
    local v12 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1.1, 1.1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    v12.Image = Icons.Towers[a1.tower] and Icons.Towers[a1.tower].Default or ""
    v12.ScaleType = Enum.ScaleType.Fit
    v11.icon = createElement("ImageLabel", v12)
    v11.suggestionText = createElement("TextLabel", {
        BackgroundTransparency = 1,
        Text = "Suggested",
        TextSize = 24,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.fromScale(1, 0.3),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        TextColor3 = Color3.fromRGB(255, 255, 255),
    })
    v11.glowImage = createElement("ImageLabel", {
        Image = "rbxassetid://99387764037728",
        BackgroundTransparency = 1,
        ImageTransparency = 0.85,
        Size = UDim2.fromScale(1.5, 1.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        ImageColor3 = v2 or Color3.fromRGB(255, 255, 255),
    })
    v11.uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)})
    v11.uIStroke = createElement("UIStroke", {Transparency = 0, Thickness = 1, Color = v2 or Color3.fromRGB(255, 255, 255)}, {
        uIGradient = createElement("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
        }),
    })
    v11.aspectRaito = createElement("UIAspectRatioConstraint", {AspectRatio = 1})
    v9.TowerImage = createElement("Frame", v10, v11)
    return createElement("Frame", v8, v9)
end)