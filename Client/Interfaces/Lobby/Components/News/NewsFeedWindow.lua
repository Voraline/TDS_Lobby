-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.NewsFeedWindow
-- Decompile time: 26.09 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Button = require(ReplicatedStorage.Client.Interfaces.Components.Button)
local IconButton = require(ReplicatedStorage.Client.Interfaces.Components.IconButton)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local MinimizeContainer = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.MinimizeContainer)
local NewsfeedBanner = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.NewsfeedBanner)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local SectionDivider = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.SectionDivider)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local UltimateList = require(ReplicatedStorage.Packages.UltimateList)
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
local DataSources = UltimateList.DataSources
local Dimensions = UltimateList.Dimensions
local Renderers = UltimateList.Renderers
local ScrollingFrame = UltimateList.Components.ScrollingFrame
local Tween = ReactFlow.Tween
local useGroupAnimation = ReactFlow.useGroupAnimation
local useAnimation = ReactFlow.useAnimation
local Change = React.Change
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local useMemo = React.useMemo
local useCallback = React.useCallback
local memo = React.memo
local News = ReplicatedStorage.Client.Interfaces.Lobby.Components.News
local u99 = utf8.char(127925)
local u100 = {}
local v1 = Color3.new(0.9921568627450981, 0.1607843137254902, 0.2627450980392157)
local v2 = Color3.new(0.00392156862745098, 0.6352941176470588, 1)
local v3 = Color3.new(0.00784313725490196, 0.7215686274509804, 0.3411764705882353)
local Color = BrickColor.new("Bright violet").Color
local Color_2 = BrickColor.new("Bright orange").Color
u100[1] = v1
u100[2] = v2
u100[3] = v3
u100[4] = Color
u100[5] = Color_2
u100[6] = BrickColor.new("Bright yellow").Color
u100[7] = BrickColor.new("Light reddish violet").Color
u100[8] = BrickColor.new("Brick yellow").Color

local function getUpdateValue(a1) -- Line: 70
    local v1, v2
    local v3 = 0
    local v4 = #a1
    local v5 = a1
    for i = 1, v4 do
        v1 = string.byte((string.sub(v5, i, i)))
        v2 = #v5 - i + 1
        if #v5 % 2 == 1 then
            v2 = v2 - 1
        end
        if 2 <= v2 % 4 then
            v1 = -v1
        end
        v3 = v3 + v1
    end
    return v3
end

local function computeUpdateColor(a1) -- Line: 87 -- upvalues: u100 (val), getUpdateValue (val)
    return u100[(getUpdateValue(a1) + 0) % #u100 + 1]
end

local function getContentItemCount(a1) -- Line: 91
    local v1 = 0
    if not a1 then
        return v1
    end
    for i, j in a1.Sections do
        v1 = v1 + #j.Content
    end
    return v1
end

local function createNewsContentElement(a1, a2, a3) -- Line: 105
    -- upvalues: News (val), createElement (val), MinimizeContainer (val)
    local v1 = News:FindFirstChild(a1.Type)
    if not v1 then
        return nil
    end
    local v2 = require(v1)
    local v3 = table.clone(a1.Props or {})
    local Minimize = v3.Minimize
    v3.Minimize = nil
    v3.LayoutOrder = a2
    v3.Transparency = a3
    local v4 = createElement(v2, v3)
    if typeof(Minimize) == "number" and Minimize > 0 and Minimize < 1 then
        v4 = createElement(MinimizeContainer, {LayoutOrder = a2, Minimize = Minimize}, {content = v4})
    end
    return v4
end

local u142 = memo(function(a1) -- Line: 131
    -- upvalues: u100 (val), getUpdateValue (val), createElement (val), Button (val), TextLabel (val), u99 (val)
    -- upvalues: ImageLabel (val)
    local v1 = u100[(getUpdateValue(a1.updateTitle) + 0) % #u100 + 1]
    local v2 = {
        BorderSizePixel = 0,
        BackgroundColor3 = v1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = a1.transparency,
        LayoutOrder = a1.layoutOrder,
        Position = a1.position,
    }
    local size = a1.size or UDim2.new(1, 0, 0, 80)
    v2.Size = size
    local v3 = {
        button = createElement(Button, {
            BackgroundIcon = "",
            Size = UDim2.fromScale(1, 1),
            Clicked = function() -- Line: 146 -- upvalues: a1 (val)
                if a1.clicked then
                    a1.clicked(a1.version)
                end
            end,
        }),
    }
    local v4 = {
        FontWeight = "Bold",
        TextScaled = true,
        StrokeThickness = 2,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(0.974, 0.3),
        Size = UDim2.fromScale(0.9, 0.4),
    }
    local updateTitle_2 = a1.updateTitle or ("%* DJ Rework %*"):format(u99, u99)
    v4.Text = updateTitle_2
    v4.TextColor3 = Color3.fromRGB(255, 255, 255)
    v4.TextXAlignment = Enum.TextXAlignment.Right
    v4.TextTransparency = a1.transparency
    v4.StrokeTransparency = a1.transparency
    v3.title = createElement(TextLabel, v4, {textSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 27})})
    v3.frame = createElement(ImageLabel, {
        BorderSizePixel = 0,
        ZIndex = 0,
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Image = a1.imageId or "rbxassetid://138924286251630",
        ScaleType = Enum.ScaleType.Crop,
        Size = UDim2.fromScale(0.7, 1),
        ImageTransparency = a1.transparency,
    }, {
        gradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.35, 0),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
        corner = createElement("UICorner"),
    })
    v3.version = createElement(TextLabel, {
        FontWeight = "SemiBold",
        TextScaled = true,
        StrokeThickness = 2,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(0.974, 0.7),
        Size = UDim2.fromScale(0.9, 0.3),
        Text = a1.version or "v1.25.0",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextTransparency = a1.transparency,
        TextXAlignment = Enum.TextXAlignment.Right,
        StrokeTransparency = a1.transparency,
    })
    v3.corner = createElement("UICorner")
    v3.stroke = createElement("UIStroke", {
        Thickness = 2,
        Color = v1:Lerp(Color3.new(0), 0.6),
        Transparency = a1.transparency,
    })
    return createElement("Frame", v2, v3)
end)
return function(a1) -- Line: 215
    -- upvalues: useState (val), useMediaQuery (val), useGroupAnimation (val), useAnimation (val), Tween (val)
    -- upvalues: useMemo (val), DataSources (val), Dimensions (val), Renderers (val), createElement (val), u142 (val)
    -- upvalues: useCallback (val), createNewsContentElement (val), SectionDivider (val), MinimizeContainer (val)
    -- upvalues: useEffect (val), RunService (val), IconButton (val), ImageLabel (val), TextLabel (val)
    -- upvalues: ScrollingFrame (val), Change (val), NewsfeedBanner (val), React (val)
    local Minimize, v1, v2, v3, v4
    local u312 = a1.visible ~= false
    local v5, u712 = useState(UDim2.new())
    local v6, u331 = useState({Count = 3, Visible = u312, Version = a1.selectedVersion})
    local v7 = not useMediaQuery("xxlarge")
    local v8 = not useMediaQuery("large")
    local v9 = if not v8 then if not v7 then UDim2.fromScale(0.65, 0.65) else UDim2.fromScale(0.7, 0.7) else UDim2.fromScale(1, 1)
    local u280, u305 = useGroupAnimation({
        enable = useAnimation({
            transparency = Tween({target = 0, info = TweenInfo.new(0.2)}),
            position = Tween({target = UDim2.fromScale(0.5, 0.5), info = TweenInfo.new(0.2)}),
        }),
        disable = useAnimation({
            transparency = Tween({target = 1, info = TweenInfo.new(0.2)}),
            position = Tween({target = UDim2.fromScale(0.5, 0.6), info = TweenInfo.new(0.2)}),
        }),
    }, {transparency = 1, position = UDim2.fromScale(0.5, 0.6)})
    local useLatest = if a1.useLatest == nil then true else a1.useLatest
    local v10 = nil
    for i, j in a1.newsFeed do
        if j.Version == a1.selectedVersion then
            v10 = j
            break
        end
    end
    v10 = v10 or a1.newsFeed[1]
    u342 = 0
    if v10 then
        for k, n in v10.Sections do
            local u342 = u342 + #n.Content
        end
    end
    local Count = if v6.Version ~= a1.selectedVersion then math.min(3, u342) else if v6.Visible ~= u312 then math.min(3, u342) else v6.Count
    local v11 = useMemo
    local v12 = {a1.newsFeed, useLatest}
    local u169 = v11(function() -- Line: 270 -- upvalues: a1 (val), useLatest (val)
        local v1 = {}
        local v2 = nil
        local v3 = nil
        for i, j in a1.newsFeed, v2, v3 do
            if i ~= 1 or useLatest then
                table.insert(v1, {
                    ImageId = j.ImageId,
                    Index = i,
                    Key = j.Version,
                    Title = j.Title,
                    Version = j.Version,
                })
            end
        end
        return v1
    end, v12)
    local v13 = {u169}
    local v14 = useMemo(function() -- Line: 290 -- upvalues: DataSources (upval), u169 (val)
        return DataSources.array(u169)
    end, v13)
    v12 = useMemo(function() -- Line: 294 -- upvalues: Dimensions (upval)
        return Dimensions.getter(function(a1, a2) -- Line: 295
            return {
                size = UDim2.new(1, 0, 0, 88),
                position = UDim2.fromOffset(0, 8 + (a2 - 1) * 88),
            }
        end)
    end, {})
    v13 = useMemo
    local v15 = {a1.onSectionClicked, u280.transparency}
    v13 = v13(function() -- Line: 306 -- upvalues: Renderers (upval), createElement (upval), u142 (upval), a1 (val), u280 (val)
        return Renderers.byState(function(a1_2) -- Line: 307 -- upvalues: createElement (upval), u142 (upval), a1 (upval), u280 (upval)
            return createElement(u142, {
                clicked = a1.onSectionClicked,
                imageId = "rbxassetid://" .. a1_2.ImageId,
                layoutOrder = a1_2.Index,
                position = UDim2.fromOffset(8, 0),
                size = UDim2.new(1, -16, 0, 80),
                transparency = u280.transparency,
                updateTitle = a1_2.Title,
                version = a1_2.Version,
            })
        end)
    end, v15)
    local v16 = useCallback(function(a1) -- Line: 321
        return a1.Key
    end, {})
    v15 = {}
    local v17 = Count
    local v18 = nil
    local v19 = nil
    for m, i5 in v10.Sections, v18, v19 do
        if v17 <= 0 then
            break
        end
        v1 = {}
        v2 = 0
        for i6, i7 in i5.Content do
            if v17 <= 0 then
                break
            end
            v4 = createNewsContentElement(i7, v2, u280.transparency)
            if v4 then
                table.insert(v1, v4)
                v2 = v2 + 1
                v17 = v17 - 1
            end
        end
        if #v1 > 0 then
            v3 = createElement(SectionDivider, {
                SectionName = i5.Name,
                LayoutOrder = m,
                Content = v1,
                Transparency = u280.transparency,
            })
            Minimize = i5.Minimize
            if typeof(Minimize) == "number" and Minimize > 0 and Minimize < 1 then
                v3 = createElement(MinimizeContainer, {LayoutOrder = m, Minimize = Minimize}, {content = v3})
            end
            table.insert(v15, v3)
        end
    end
    v19 = {u312}
    useEffect(function() -- Line: 371 -- upvalues: u305 (val), u312 (val)
        u305(if not u312 then "disable" else "enable")
    end, v19)
    local v20 = useEffect
    v19 = {a1.selectedVersion, u312, u342}
    v20(function() -- Line: 375 -- upvalues: u312 (val), u331 (val), a1 (val), u342 (val), RunService (upval)
        if not u312 then
            u331({Count = 3, Visible = false, Version = a1.selectedVersion})
            return
        end
        local u9 = math.min(3, u342)
        u331({Visible = true, Count = u9, Version = a1.selectedVersion})
        if u342 <= u9 then
            return
        end
        local u16 = false
        local u19 = task.spawn(function() -- Line: 397 -- upvalues: u16 (ref), u9 (ref), u342 (upval), RunService (upval), u331 (upval), a1 (upval)
            while not u16 do
                if not (u9 < u342) then
                    break
                end
                RunService.Heartbeat:Wait()
                if u16 then
                    break
                end
                u9 = math.min(u9 + 1, u342)
                u331({Visible = true, Count = u9, Version = a1.selectedVersion})
            end
        end)
        return function() -- Line: 415 -- upvalues: u16 (ref), u19 (val)
            u16 = true
            if u19 then
                task.cancel(u19)
            end
        end
    end, v19)
    v20 = createElement
    v19 = {BorderSizePixel = 0, Size = v9}
    local position = a1.position or UDim2.fromScale(0.5, 0.5)
    v19.Position = position
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 0.5)
    v19.AnchorPoint = anchorPoint
    v19.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
    v19.BackgroundTransparency = u280.transparency:map(function(a1) -- Line: 430
        return math.map(a1, 0, 1, 0.2, 1)
    end)
    v19.Visible = u280.transparency:map(function(a1) -- Line: 433
        return a1 < 1
    end)
    local v21 = {
        aspectRatio = not v8 and createElement("UIAspectRatioConstraint", {AspectRatio = 1.44}),
        maxSize = not v8 and createElement("UISizeConstraint", {MaxSize = Vector2.new(932, 639)}),
        scale = createElement("UIScale", {Scale = a1.scale or 1}),
        corner = not v8 and createElement("UICorner"),
    }
    local v22 = createElement
    v2 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
    }
    v3 = if not v8 then UDim2.fromScale(1.04, 0.045) else UDim2.fromScale(0.93, 0.045)
    v2.Position = v3
    v2.Size = UDim2.fromScale(0.07, 0.09)
    v2.Color = Color3.fromRGB(255, 60, 60)
    v2.Transparency = u280.transparency
    v2.Clicked = a1.closed
    v21.closeButton = v22(IconButton, v2, {aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1})})
    v21.dropShadow = createElement(ImageLabel, {
        BackgroundTransparency = 1,
        Image = "rbxassetid://9239716855",
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        ImageTransparency = u280.transparency:map(function(a1) -- Line: 468
            return math.map(a1, 0, 1, 0.2, 1)
        end),
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Slice,
        Size = UDim2.new(1, 14, 1, 14),
        SliceCenter = Rect.new(14, 14, 64, 24),
    })
    v21.updateTitle = createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(0.343, 0.1)}, {
        textLabel = createElement(TextLabel, {
            FontWeight = "Bold",
            Text = "All Updates",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            StrokeThickness = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.9, 0.6),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = u280.transparency,
            StrokeTransparency = u280.transparency,
        }),
    })
    v21.updateContainer = createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.343, 0.9),
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0, 1),
    }, {
        list = createElement(ScrollingFrame, {
            direction = "y",
            dataSource = v14,
            dimensions = v12,
            getKey = v16,
            renderer = v13,
            native = {
                BorderSizePixel = 0,
                ScrollBarThickness = 0,
                BackgroundTransparency = u280.transparency:map(function(a1) -- Line: 509
                    return math.map(a1, 0, 1, 0.95, 1)
                end),
                BackgroundColor3 = Color3.new(1, 1, 1),
                ScrollBarImageTransparency = u280.transparency,
                ScrollingDirection = Enum.ScrollingDirection.Y,
            },
        }),
    })
    v22 = createElement
    v2 = {
        BackgroundTransparency = 1,
        BottomImage = "",
        ScrollBarThickness = 8,
        ZIndex = 0,
        BorderSizePixel = 0,
        TopImage = "",
        Size = UDim2.fromScale(0.647, 1),
        Position = UDim2.fromScale(0.343, 0),
        ScrollBarImageColor3 = Color3.fromRGB(202, 202, 202),
        ScrollBarImageTransparency = u280.transparency,
        CanvasSize = v5,
    }
    v3 = {}
    local v23 = createElement
    local v24 = {
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
    }

    v24[Change.AbsoluteContentSize] = function(a1) -- Line: 536 -- upvalues: u712 (val)
        u712(UDim2.fromOffset(0, a1.AbsoluteContentSize.Y))
    end

    v3.listLayout = v23("UIListLayout", v24)
    v3.padding = createElement("UIPadding", {PaddingRight = UDim.new(0.05, 0), PaddingLeft = UDim.new(0.025, 0)})
    v3.mainBanner = createElement(NewsfeedBanner, {
        Size = UDim2.new(0.923, 0, 0, 161),
        Title = v10.Title,
        Version = v10.Version,
        ImageId = v10.ImageId,
        Transparency = u280.transparency,
    })
    v3.bin = createElement("Frame", {
        LayoutOrder = 1,
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        Size = UDim2.fromScale(1, 0),
    }, {
        listLayout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, 16),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        createElement(React.Fragment, nil, v15),
    })
    v21.container = v22("ScrollingFrame", v2, v3)
    return v20("Frame", v19, v21)
end