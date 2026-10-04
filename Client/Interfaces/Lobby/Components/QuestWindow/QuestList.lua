-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.QuestList
-- Decompile time: 24.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ClientAdapter = require(ReplicatedStorage.Shared.Data.Quests.ClientAdapter)
local QuestCard = require(script.Parent.QuestCard)
local QuestDetail = require(script.Parent.QuestDetail)
require(ReplicatedStorage.Shared.Types.QuestTypes)
local React = require(ReplicatedStorage.Shared.UI.React)
local StudioElements = require(script.Parent.StudioElements)
local QuestViewModels = require(script.Parent.QuestViewModels)
local useCountdown = require(ReplicatedStorage.Client.Interfaces.Hooks.useCountdown)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local useRef = React.useRef
local useState = React.useState
local scaledStroke = StudioElements.scaledStroke
local textStroke = StudioElements.textStroke

local function textSizeConstraint(a1, a2) -- Line: 38 -- upvalues: createElement (val) -- types: a1: number, a2: number?
    return createElement("UITextSizeConstraint", {MaxTextSize = a1, MinTextSize = a2 or 8})
end

local u55 = {
    daily = "rbxassetid://77379119157860",
    seasonal = "rbxassetid://128460064413219",
    weekly = "rbxassetid://86361624497791",
}
local u56 = {"daily", "weekly"}
local u59 = {"daily", "weekly"}
local u62 = {missions = true}

local function getQuestGroupNames(a1) -- Line: 67 -- upvalues: u56 (val), u62 (val), u59 (val)
    local v1 = {}
    local v2 = {}
    local groups = a1 and a1.groups or nil
    for i, j in u56 do
        v1[j] = true
    end
    if groups then
        for k in groups do
            if not u62[k] then
                v1[k] = true
            end
        end
    end
    local v3 = {}
    for n, m in u59 do
        if v1[m] then
            table.insert(v3, m)
            v1[m] = nil
        end
    end
    for i5 in v1 do
        table.insert(v2, i5)
    end
    table.sort(v2)
    for i6, i7 in v2 do
        table.insert(v3, i7)
    end
    return v3
end

local function RefreshTimerLabel(a1) -- Line: 106
    -- upvalues: useCountdown (val), QuestViewModels (val), createElement (val), textStroke (val)
    return createElement("TextLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 1,
        TextScaled = true,
        TextSize = 20,
        TextWrapped = true,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.new(0.137, 0, 0.1494, 0),
        Size = UDim2.new(0.8456, 0, 0.6372, 0),
        Text = if not a1.Expires then "Refreshes in --:--:--" else (useCountdown(a1.Expires)):map(function(a1) -- Line: 109 -- upvalues: QuestViewModels (upval)
            return (("Refreshes in %*"):format((QuestViewModels.formatSecondsLeft(a1))))
        end),
        TextColor3 = Color3.fromRGB(255, 255, 255),
    }, {
        Stroke = textStroke({Thickness = 0.04, Transparency = 0.35, Color = Color3.fromRGB(0, 0, 0)}),
        TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 20, MinTextSize = 8}),
    })
end

local function sectionDivider(a1) -- Line: 139
    -- upvalues: createElement (val), QuestViewModels (val), textStroke (val), u55 (val), RefreshTimerLabel (val)
    -- upvalues: scaledStroke (val)
    local GroupName = a1.GroupName
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = a1.LayoutOrder,
        Size = UDim2.new(1, 0, 0, 48),
    }, {
        Title = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Position = UDim2.new(0.0707, 0, 0.5, 0),
            Size = UDim2.new(0.4355, 0, 0.7, 0),
            Text = string.upper(QuestViewModels.getSectionTitle(GroupName)),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {
            Stroke = textStroke({Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0)}),
            TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 26, MinTextSize = 10}),
        }),
        DividerIcon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = u55[GroupName] or "rbxassetid://77379119157860",
            Position = UDim2.new(0.028, 0, 0.5, 0),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.new(0.0559, 0, 1, 0),
        }, {AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1})}),
        Timer = createElement("Frame", {
            BackgroundTransparency = 0.4,
            BorderSizePixel = 1,
            AnchorPoint = Vector2.new(1, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0.9704, 0, 0.5, 0),
            Size = UDim2.new(0.292, 0, 0.75, 0),
        }, {
            TimerIcon = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://82991540492128",
                ZIndex = 2,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.08, 0, 0.5, 0),
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.new(0.0875, 0, 0.6907, 0),
            }),
            TimerLabel = createElement(RefreshTimerLabel, {Expires = a1.Expires}),
            Stroke = scaledStroke({Thickness = 0.018, Transparency = 0.8, Color = Color3.fromRGB(255, 255, 255)}),
        }),
    })
end

local function getQuestCardHeight(a1, a2, a3) -- Line: 213 -- types: a1: userdata, a2: boolean, a3: boolean
    local v1 = if not a3 then 9.54 else 6.8
    local v2 = math.max(a1.X, 0) * 1 / v1
    local v3 = a1.Y * (if not a3 then if not a2 then 0.6358 else 0.2249 else 0.36)
    if not (v3 <= 0) then
        return (math.max(math.min(v2, v3), 1))
    end
    if v2 > 0 then
        return v2
    end
    if a3 then
        return 88
    end
    return 72
end

local function addRowHeight(a1, a2, a3) -- Line: 237 -- types: a1: number, a2: number, a3: number
    if a2 > 0 then
        a1 = a1 + 12
    end
    return a1 + a3, a2 + 1
end

local function findQuestRecord(a1, a2) -- Line: 249
    -- upvalues: getQuestGroupNames (val), ClientAdapter (val)
    if a1 and a2 then
        for i, j in getQuestGroupNames(a1) do
            for k, n in ClientAdapter.getGroup(a1, j) do
                if n.id ~= v1 and n.quest.id ~= v1 then
                    continue
                end
                return n, j
            end
        end
        return nil, nil
    end
    return nil, nil
end

return function(a1) -- Line: 268
    -- upvalues: useState (val), useBinding (val), useRef (val), findQuestRecord (val), createElement (val), React (val)
    -- upvalues: useEffect (val), getQuestGroupNames (val), ClientAdapter (val), sectionDivider (val), QuestCard (val)
    -- upvalues: QuestDetail (val)
    local expires, id, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
    local u3, u446 = useState(nil)
    local u453, u461 = useState(Vector2.zero)
    local v12 = a1.IsMobile == true
    local v13, u481 = useBinding(UDim2.new())
    local u489 = useRef(0)
    local u20 = 0
    local u497, v14 = findQuestRecord(a1.State, u3)

    local function updateCanvasSize(a1) -- Line: 277
        -- upvalues: u489 (val), u481 (val), u20 (ref)
        if a1 then
            u489.current = a1
        end
        local v1 = u481
        local new = UDim2.new
        local v2 = u20
        v1(new(0, 0, 0, (math.max(u489.current or 0, v2))))
    end

    local v15 = {}
    local v16 = createElement
    local v17 = {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0, 12),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Top,
    }

    v17[React.Change.AbsoluteContentSize] = function(a1) -- Line: 295 -- upvalues: u489 (val), u481 (val), u20 (ref) -- types: a1: userdata
        local v1 = math.ceil(a1.AbsoluteContentSize.Y + 24)
        if v1 then
            u489.current = v1
        end
        local v2 = u481
        local new = UDim2.new
        local v3 = u20
        v2(new(0, 0, 0, (math.max(u489.current or 0, v3))))
    end

    v15.ListLayout = v16("UIListLayout", v17)
    v15.Padding = createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 0),
        PaddingLeft = UDim.new(0, 20),
        PaddingRight = UDim.new(0, 20),
        PaddingTop = UDim.new(0, 24),
    })
    v17 = {u3, u497}
    useEffect(function() -- Line: 307 -- upvalues: u3 (val), u497 (val), u446 (val)
        if u3 and not u497 then
            u446(nil)
        end
    end, v17)
    v16 = 1
    local v18 = 0
    v17 = 0
    local v19 = a1
    for i, j in getQuestGroupNames(a1.State) do
        v3 = ClientAdapter.getGroup(v19.State, j)
        expires = if not v3[1] then nil else v3[1].expires
        v6 = v18
        if v17 > 0 then
            v6 = v6 + 12
        end
        v18 = v6 + 48
        v17 = v17 + 1
        v4 = ("%*Divider"):format(j)
        v6 = {Expires = expires, GroupName = j, LayoutOrder = v16}
        v15[v4] = (sectionDivider(v6))
        v16 = v16 + 1
        if #v3 == 0 then
            v6 = v18
            if v17 > 0 then
                v6 = v6 + 12
            end
            v18 = v6 + 70
            v17 = v17 + 1
            v4 = ("%*Empty"):format(j)
            v15[v4] = (createElement("TextLabel", {
                BackgroundTransparency = 0.9,
                BorderSizePixel = 0,
                Text = "No quests are available right now.",
                TextScaled = true,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                LayoutOrder = v16,
                Size = UDim2.new(0.9704, 0, 0, 70),
                TextColor3 = Color3.fromRGB(255, 255, 255),
            }, {
                Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)}),
                TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 20, MinTextSize = 8}),
            }))
            v16 = v16 + 1
        end
        v5 = nil
        v6 = nil
        for k, n in v3, v5, v6 do
            v8 = ClientAdapter.isClaimable(n)
            v9 = if not v12 then 9.54 else 6.8
            v10 = math.max(u453.X, 0) * 1 / v9
            v11 = u453.Y * (if not v12 then if not v8 then 0.6358 else 0.2249 else 0.36)
            v7 = if not (v11 <= 0) then math.max(math.min(v10, v11), 1) else if not (v10 > 0) then if not v12 then 72 else 88 else v10
            v10 = v18
            if v17 > 0 then
                v10 = v10 + 12
            end
            v18 = v10 + v7
            v17 = v17 + 1
            id = n.id
            v8 = ("%*_%*"):format(j, id)
            v15[v8] = (createElement(QuestCard, {
                Busy = v19.Busy,
                GroupName = j,
                Height = v7,
                IsMobile = v12,
                LayoutOrder = v16,
                OnClaimQuest = v19.OnClaimQuest,
                OnSelected = u446,
                OnTrackQuest = v19.OnTrackQuest,
                Record = n,
                TrackedQuestIds = v19.TrackedQuestIds,
                TrackedQuestId = v19.TrackedQuestId,
            }))
            v16 = v16 + 1
        end
    end
    if v17 > 0 then
        v2 = v18
        if v17 > 0 then
            v2 = v2 + 12
        end
        v1 = v2 + 12
        local v20 = v17 + 1
        v18 = v1
        v15.BottomSpacer = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = v16,
            Size = UDim2.new(1, 0, 0, 12),
        })
    end
    u20 = math.ceil(v18 + 24)
    v2 = {u20}
    useEffect(function() -- Line: 391 -- upvalues: u481 (val), u489 (val), u20 (ref)
        local v1 = u481
        local new = UDim2.new
        local v2 = u20
        v1(new(0, 0, 0, (math.max(u489.current or 0, v2))))
    end, v2)
    if u497 and v14 then
        return (createElement(QuestDetail, {
            Busy = v19.Busy,
            GroupName = v14,
            IsMobile = v12,
            OnClaimQuest = v19.OnClaimQuest,
            OnReturn = function() -- Line: 401 -- upvalues: u446 (val)
                u446(nil)
            end,
            OnTrackQuest = v19.OnTrackQuest,
            Record = u497,
            TrackedQuestIds = v19.TrackedQuestIds,
            TrackedQuestId = v19.TrackedQuestId,
        }))
    end
    v1 = createElement
    v2 = {
        Active = true,
        AnchorPoint = Vector2.new(0.5, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.None,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BottomImage = "",
        CanvasSize = v13,
        ClipsDescendants = true,
        ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
        MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
        Position = UDim2.new(0.5, 0, 0.12, 0),
        Selectable = true,
        SelectionGroup = true,
        ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
        ScrollBarImageTransparency = 0.15,
        ScrollBarThickness = 4,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollingEnabled = true,
        Size = UDim2.new(0.96, 0, 0.86, 0),
        TopImage = "",
    }

    v2[React.Change.AbsoluteSize] = function(a1) -- Line: 433 -- upvalues: u453 (val), u461 (val) -- types: a1: userdata
        local AbsoluteSize = a1.AbsoluteSize
        if AbsoluteSize ~= u453 then
            u461(AbsoluteSize)
        end
    end

    v1 = v1("ScrollingFrame", v2, v15)
    return v1
end