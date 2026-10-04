-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.MatchmakingResultCard
-- Decompile time: 17.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ItemController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ItemController)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
local useEffect = React.useEffect
local useTween = ReactFlow.useTween
local u58 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(191, 191, 191)),
    ColorSequenceKeypoint.new(0.3560732, Color3.fromRGB(190, 190, 190)),
    ColorSequenceKeypoint.new(0.3793677, Color3.fromRGB(255, 255, 255)),
    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
})
local u73 = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(0.5, 0.4),
    (NumberSequenceKeypoint.new(1, 1)),
})

local function safeText(a1) -- Line: 52 -- types: a1: string?
    return a1 or ""
end

local function formatImageId(a1) -- Line: 56
    if type(a1) == "number" then
        return (("rbxassetid://%*"):format(a1))
    end
    if type(a1) == "string" then
        return a1
    end
    return ""
end

local function getTowerIcon(a1, a2) -- Line: 66 -- upvalues: ItemController (val)
    if type(a1) == "string" and a1 ~= "" then
        ItemController:init()
        local success, result = pcall(function() -- Line: 73 -- upvalues: ItemController (upval), a1 (val), a2 (val)
            return ItemController:skin(a1, a2 or "Default")
        end)
        if success and result and result.info then
            local Icon = result.info.Icon
            if type(Icon) == "number" then
                return (("rbxassetid://%*"):format(Icon))
            end
            if type(Icon) == "string" then
                return Icon
            end
            return ""
        end
        return ""
    end
    return ""
end

local function getTowerName(a1) -- Line: 84
    if type(a1) ~= "table" then
        return nil
    end
    if type(a1.name) == "string" then
        return a1.name
    end
    if type(a1.Name) == "string" then
        return a1.Name
    end
    if type(a1.tower) == "string" then
        return a1.tower
    end
    if type(a1.Tower) == "string" then
        return a1.Tower
    end
    if type(a1.troop) == "string" then
        return a1.troop
    end
    if type(a1.Troop) == "string" then
        return a1.Troop
    end
    return nil
end

local function getTowerSkin(a1) -- Line: 106
    if type(a1) ~= "table" then
        return nil
    end
    if type(a1.skin) == "string" then
        return a1.skin
    end
    if type(a1.Skin) == "string" then
        return a1.Skin
    end
    return nil
end

local function getTowerDisplay(a1, a2) -- Line: 120
    -- upvalues: getTowerIcon (val), getTowerName (val)
    if type(a1) == "string" then
        return {key = ("%*:%*"):format(a2, a1), icon = getTowerIcon(a1), name = a1}
    end
    if type(a1) ~= "table" then
        return {icon = "", key = tostring(a2)}
    end
    local v1 = getTowerName(a1)
    local icon = a1.icon
    local v2 = if type(icon) ~= "number" then if type(icon) ~= "string" then "" else icon else ("rbxassetid://%*"):format(icon)
    if v2 == "" then
        v2 = getTowerIcon(
            v1,
            if type(a1) ~= "table" then nil else if type(a1.skin) ~= "string" then if type(a1.Skin) ~= "string" then nil else a1.Skin else a1.skin
        )
    end
    local v3 = {}
    local key = a1.key or v1 and ("%*:%*"):format(a2, v1) or tostring(a2)
    v3.key = key
    v3.icon = v2
    v3.name = v1
    return v3
end

local function getTowerEntries(a1) -- Line: 149
    local v1 = {}
    if type(a1) ~= "table" then
        return v1
    end
    for i, j in a1 do
        table.insert(v1, {key = i, tower = j})
    end
    table.sort(v1, function(a1, a2) -- Line: 163
        if type(a1.key) == "number" and type(a2.key) == "number" then
            return a1.key < a2.key
        end
        return (tostring(a1.key)) < tostring(a2.key)
    end)
    return v1
end

local function createTextGradient() -- Line: 174 -- upvalues: createElement (val), u58 (val)
    return createElement("UIGradient", {Name = "UIGradient", Rotation = -90, Color = u58})
end

local function StatCell(a1) -- Line: 182 -- upvalues: createElement (val), u58 (val)
    local v1 = false
    if a1.icon ~= nil then
        v1 = a1.icon ~= ""
    end
    local v2 = {}
    local v3 = {
        Name = "TextLabel",
        BackgroundTransparency = 1,
        TextSize = 26,
        TextWrapped = true,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.fromScale(1, 1),
        Text = a1.text or "",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextTransparency = a1.fade,
    }
    local textXAlignment = a1.textXAlignment or Enum.TextXAlignment.Right
    v3.TextXAlignment = textXAlignment
    v2.TextLabel = createElement("TextLabel", v3, {
        UIGradient = createElement("UIGradient", {Name = "UIGradient", Rotation = -90, Color = u58}),
        UIStroke = createElement("UIStroke", {
            Name = "UIStroke",
            Thickness = 2.5,
            Color = Color3.fromRGB(22, 22, 22),
            Transparency = a1.fade,
        }),
    })
    v2.UICorner = createElement("UICorner", {Name = "UICorner", CornerRadius = UDim.new(0, 8)})
    v2.UIPadding = createElement("UIPadding", {Name = "UIPadding"})
    if v1 then
        v2.ImageLabel = createElement("ImageLabel", {
            Name = "ImageLabel",
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Image = a1.icon,
            ImageTransparency = a1.fade,
            Position = UDim2.fromScale(0, 0.5),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromOffset(26, 26),
        })
    end
    return createElement("Frame", {
        BackgroundTransparency = 0.9,
        Name = a1.name,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        LayoutOrder = a1.layoutOrder,
        Size = UDim2.new(0.333, -4, 0, 32),
    }, v2)
end

local function TowerIcon(a1) -- Line: 248 -- upvalues: createElement (val)
    return createElement("Frame", {
        Name = a1.name,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = a1.fade,
        LayoutOrder = a1.layoutOrder,
        Size = UDim2.fromOffset(64, 64),
    }, {
        UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {Name = "UIAspectRatioConstraint", AspectRatio = 1}),
        UICorner = createElement("UICorner", {Name = "UICorner", CornerRadius = UDim.new(0, 8)}),
        ImageLabel = createElement("ImageLabel", {
            Name = "ImageLabel",
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Image = a1.icon or "",
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Stretch,
            Size = UDim2.fromScale(1.25, 1.25),
        }),
    })
end

return function(a1) -- Line: 279
    -- upvalues: useTween (val), useEffect (val), getTowerEntries (val), getTowerDisplay (val), createElement (val)
    -- upvalues: TowerIcon (val), u58 (val), u73 (val), StatCell (val), React (val)
    local key, v1, v2
    local index = a1.index or a1.layoutOrder or 1
    local u6 = (index - 1) * 0.01
    local v3 = a1.playerPreview ~= nil
    local v4, u19 = useTween({
        start = 0,
        target = 0,
        info = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
    })
    local v5 = {u6}
    useEffect(function() -- Line: 290 -- upvalues: u6 (val), u19 (val)
        local u3 = task.delay(u6, function() -- Line: 291 -- upvalues: u19 (upval)
            u19({target = 1})
        end)
        return function() -- Line: 297 -- upvalues: u3 (val)
            pcall(task.cancel, u3)
        end
    end, v5)
    local v6 = v4:map(function(a1) -- Line: 302
        return 1 - a1
    end)
    local v7 = v4:map(function(a1) -- Line: 305
        return 1 - a1 * 0.8
    end)
    v5 = v4:map(function(a1) -- Line: 308
        return 1 - a1 * 0.1
    end)
    local v8 = v4:map(function(a1) -- Line: 311
        return UDim2.fromScale(0.5, a1 * 0.5)
    end)
    local v9 = {}
    for i, v in ipairs((getTowerEntries(a1.towers))) do
        v1 = getTowerDisplay(v.tower, i)
        key = v1.key
        v2 = ("%*:%*"):format(i, key)
        v9[v2] = (createElement(TowerIcon, {name = tostring(i), icon = v1.icon, layoutOrder = i, fade = v5}))
    end
    local v10 = {Name = "MatchResult", BackgroundTransparency = 1}
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 0.5)
    v10.AnchorPoint = anchorPoint
    v10.LayoutOrder = a1.layoutOrder or index
    local position = a1.position or UDim2.fromScale(0.5, 0.5)
    v10.Position = position
    local size = a1.size or UDim2.fromScale(1, 1)
    v10.Size = size
    return createElement("Frame", v10, {
        UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {Name = "UIAspectRatioConstraint", AspectRatio = 1.5}),
        Card = createElement("ImageLabel", {
            Name = "MatchResult",
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.new(),
            BackgroundTransparency = v7,
            Image = a1.backgroundImage or "",
            ImageColor3 = Color3.fromRGB(80, 80, 80),
            Position = v8,
            ScaleType = Enum.ScaleType.Crop,
            Size = UDim2.fromScale(1, 1),
        }, {
            UICorner = createElement("UICorner", {Name = "UICorner", CornerRadius = UDim.new(0, 8)}),
            DropShadow = createElement("ImageLabel", {
                Name = "DropShadow",
                BackgroundTransparency = 1,
                Image = "rbxassetid://9239716855",
                ZIndex = -1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                ImageTransparency = v7,
                Position = UDim2.fromScale(0.5, 0.5),
                ScaleType = Enum.ScaleType.Slice,
                Size = UDim2.new(1, 14, 1, 14),
                SliceCenter = Rect.new(14, 14, 64, 24),
            }),
            Title = createElement("TextLabel", {
                Name = "Title",
                BackgroundTransparency = 1,
                TextSize = 26,
                TextWrapped = true,
                ZIndex = 2,
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Position = UDim2.new(0.5, 0, 0, 8),
                Size = UDim2.new(1, -16, 0, 26),
                Text = a1.title or "",
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextTransparency = v6,
                TextXAlignment = Enum.TextXAlignment.Left,
            }, {
                UIGradient = createElement("UIGradient", {Name = "UIGradient", Rotation = -90, Color = u58}),
                Frame = createElement("Frame", {
                    Name = "Frame",
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = v6,
                    Position = UDim2.new(0, 0, 1, 1),
                    Size = UDim2.new(0.7, 0, 0, 1),
                }, {
                    UIGradient = createElement("UIGradient", {Name = "UIGradient", Transparency = u73}),
                }),
            }),
            Player = createElement("ImageLabel", {
                Name = "Player",
                BackgroundTransparency = 1,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Image = a1.playerImage or "",
                ImageTransparency = if not v3 then v6 else 1,
                Position = UDim2.new(0, 8, 0, 42),
                ScaleType = Enum.ScaleType.Crop,
                Size = UDim2.new(0.4, 0, 1, -90),
            }, {
                UICorner = createElement("UICorner", {Name = "UICorner", CornerRadius = UDim.new(0, 8)}),
                Preview = a1.playerPreview,
            }),
            Stats = createElement("Frame", {
                Name = "Stats",
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 1),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.new(0.5, 0, 1, -8),
                Size = UDim2.new(1, -16, 0, 32),
            }, {
                UIListLayout = createElement("UIListLayout", {
                    Name = "UIListLayout",
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    Padding = UDim.new(0, 6),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                }),
                Level = createElement(StatCell, {
                    name = "Level",
                    layoutOrder = 0,
                    text = a1.levelText,
                    textXAlignment = Enum.TextXAlignment.Center,
                    fade = v6,
                }),
                Triumphs = createElement(StatCell, {
                    name = "Triumphs",
                    layoutOrder = 1,
                    text = a1.triumphsText,
                    icon = a1.triumphIcon or "rbxassetid://5547588029",
                    fade = v6,
                }),
                Loss = createElement(StatCell, {
                    name = "Loss",
                    layoutOrder = 2,
                    text = a1.lossesText,
                    icon = a1.lossIcon or "rbxassetid://5547582812",
                    fade = v6,
                }),
            }),
            Towers = createElement("Frame", {
                Name = "Towers",
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(1, 0),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.new(1, -8, 0, 42),
                Size = UDim2.new(0.55, 0, 1, -90),
            }, {
                UIGridLayout = createElement("UIGridLayout", {
                    Name = "UIGridLayout",
                    FillDirectionMaxCells = 3,
                    CellPadding = UDim2.new(0, 4, 0, 5),
                    CellSize = UDim2.new(0.333, -6, 0.5, -4),
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                }),
                TowerIcons = createElement(React.Fragment, {}, v9),
            }),
        }),
    })
end