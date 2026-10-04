-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow
-- Decompile time: 26.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ActionButton = require(ReplicatedStorage.Client.Interfaces.Components.ActionButton)
local ClientAdapter = require(ReplicatedStorage.Shared.Data.Quests.ClientAdapter)
local IconButton = require(ReplicatedStorage.Client.Interfaces.Components.IconButton)
local Inventory = ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory
local MissionList = require(script.MissionList)
local Navigation = require(Inventory.Navigation)
local NavButton = require(Inventory.NavButton)
local Objectives = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Objectives)
local QuestList = require(script.QuestList)
require(ReplicatedStorage.Shared.Types.QuestTypes)
local React = require(ReplicatedStorage.Shared.UI.React)
local StudioElements = require(script.StudioElements)
local createElement = React.createElement
local useState = React.useState
local Event = React.Event
local scaledStroke = StudioElements.scaledStroke
local textStroke = StudioElements.textStroke

local function noop() end

local function statusOverlay(a1) -- Line: 55
    -- upvalues: createElement (val), scaledStroke (val), textStroke (val), ActionButton (val)
    return createElement("Frame", {
        BackgroundTransparency = 0.25,
        BorderSizePixel = 0,
        ZIndex = 40,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
    }, {
        InputBlocker = createElement("TextButton", {
            Active = true,
            AutoButtonColor = false,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Selectable = false,
            Text = "",
            ZIndex = 40,
            Size = UDim2.fromScale(1, 1),
        }),
        Panel = createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 41,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(45, 45, 45),
            Position = UDim2.fromScale(0.5, 0.53),
            Size = UDim2.fromScale(0.58, 0.28),
        }, {
            Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 10)}),
            Stroke = scaledStroke({Thickness = 0.012, Transparency = 0.35, Color = Color3.fromRGB(255, 255, 255)}),
            Message = createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                TextWrapped = true,
                ZIndex = 42,
                AnchorPoint = Vector2.new(0.5, 0.5),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Position = UDim2.fromScale(0.5, if not a1.OnAction then 0.5 else 0.38),
                Size = UDim2.fromScale(0.86, if not a1.OnAction then 0.62 else 0.42),
                Text = a1.Message,
                TextColor3 = Color3.fromRGB(255, 255, 255),
            }, {
                Stroke = textStroke({Transparency = 0.35, Color = Color3.fromRGB(0, 0, 0)}),
                TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 22, MinTextSize = 10}),
            }),
            Action = if not a1.OnAction then nil else createElement(ActionButton, {
                Variant = "primary",
                ZIndex = 42,
                Label = a1.ActionLabel or "Retry",
                OnActivated = a1.OnAction,
                Position = UDim2.fromScale(0.5, 0.76),
                Size = UDim2.fromScale(0.42, 0.25),
            }),
        }),
    })
end

local u70 = {
    {icon = "rbxassetid://78615667890896", title = "Quests"},
    {icon = "rbxassetid://92104766216829", title = "Missions"},
}

local function findTrackedRecords(a1) -- Line: 149 -- upvalues: ClientAdapter (val)
    local v1 = {}
    if not a1 then
        return v1
    end
    local v2 = ClientAdapter.getTrackedQuestIdSet(a1)
    local v3 = nil
    local v4 = nil
    for i, j in a1.groups, v3, v4 do
        for k, n in j do
            if v2[n.id] then
                table.insert(v1, n)
            end
        end
    end
    table.sort(v1, function(a1, a2) -- Line: 164
        return (a1.order or 0) < (a2.order or 0)
    end)
    return v1
end

local function toTrackedObjective(a1) -- Line: 171 -- upvalues: ClientAdapter (val)
    if not a1 then
        return nil
    end
    local v1 = ClientAdapter.getProgress(a1)
    return {
        GoalDescriptionTextSize = 18,
        Title = a1.quest.name,
        GoalDescription = if not ClientAdapter.isComplete(a1) then v1.description else "Claim your reward in the lobby!",
        Progress = v1.summaryProgress,
        ObjectiveColor = if a1.group ~= "weekly" then nil else Color3.fromRGB(255, 128, 130),
        LayoutOrder = if a1.group ~= "weekly" then nil else 100,
    }
end

local function header(a1) -- Line: 190
    -- upvalues: createElement (val), scaledStroke (val), textStroke (val), IconButton (val), Event (val), noop (val)
    local Title = a1.Title
    local v1 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(56, 56, 56),
        Position = UDim2.new(0.5, 0, 0, 0),
        Size = UDim2.new(1.015, 0, 0.1072, 0),
        Visible = a1.Visible,
    }
    local v2 = {
        DropShadow = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "http://www.roblox.com/asset/?id=9239716855",
            ZIndex = -2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Slice,
            Size = UDim2.new(1, 14, 1, 14),
            SliceCenter = Rect.new(14, 14, 64, 24),
        }),
    }
    v2.Background = createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(56, 56, 56),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1.0228, 0, 1.0433, 0),
    }, {
        Stroke = scaledStroke({Thickness = 0.012, Transparency = 0.4, Color = Color3.fromRGB(255, 255, 255)}, {
            Gradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(0.4663, Color3.fromRGB(54, 54, 54)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
                }),
            }),
        }),
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0.1887, 0)}),
        Gradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 130, 130))),
            }),
        }),
    })
    v2.Icon = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Image = a1.Icon,
        Position = UDim2.new(0.0491, 0, 0.2777, 0),
        ScaleType = Enum.ScaleType.Fit,
        Size = UDim2.new(0.1019, 0, 1.3977, 0),
    })
    local v3 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
    }
    local v4 = if Title ~= "Quests" then UDim2.new(0.1001, 0, 0.5009, 0) else UDim2.new(0.0916, 0, 0.4468, 0)
    v3.Position = v4
    v4 = if Title ~= "Quests" then UDim2.new(0.5577, 0, 0.7677, 0) else UDim2.new(0.2396, 0, 0.8122, 0)
    v3.Size = v4
    v3.Text = Title
    v3.TextColor3 = Color3.fromRGB(255, 255, 255)
    v3.TextScaled = Title == "Quests"
    v3.TextSize = if Title ~= "Quests" then 40 else 48
    v3.TextXAlignment = Enum.TextXAlignment.Left
    v2.Title = createElement("TextLabel", v3, {Stroke = textStroke({Color = Color3.fromRGB(0, 0, 0)})})
    local v5 = createElement
    local v6 = IconButton
    v3 = {
        LayoutOrder = 6,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Clicked = a1.OnClose,
        Color = Color3.fromRGB(255, 45, 70),
        Position = UDim2.new(0.97, 0, 0.5009, 0),
        Size = UDim2.new(0.0473, 0, 0.7677, 0),
    }
    v2.Leave = v5(v6, v3, {
        AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1, AspectType = Enum.AspectType.ScaleWithParentSize}),
    })
    if Title == "Quests" then
        v5 = nil
    else
        v3 = {
            AnchorPoint = Vector2.new(0, 0.5),
            AutoButtonColor = true,
            BackgroundColor3 = Color3.fromRGB(21, 21, 21),
            BorderSizePixel = 0,
            Position = UDim2.new(0.7989, 0, 0.5, 0),
            Size = UDim2.new(0.1332, 0, 0.5315, 0),
            Text = "",
            TextScaled = true,
            TextWrapped = true,
            ZIndex = 1,
        }
        local Activated = Event.Activated
        v3[Activated] = a1.OnToggleFilters or noop
        v5 = createElement("TextButton", v3, {
            Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)}),
            Stroke = scaledStroke({Thickness = 0.02, Color = Color3.fromRGB(7, 7, 7)}),
            FilterIcon = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Image = "rbxassetid://120083696589185",
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.1754, 0, 0.5, 0),
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.new(0.8, 0, 0.8, 0),
            }, {AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1})}),
            FilterLabel = createElement("TextLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Text = "Filters",
                TextScaled = true,
                TextWrapped = true,
                AnchorPoint = Vector2.new(0.5, 0.5),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Position = UDim2.new(0.6316, 0, 0.5, 0),
                Size = UDim2.new(0.7092, 0, 0.8385, 0),
                TextColor3 = Color3.fromRGB(255, 255, 255),
            }, {
                Stroke = textStroke({Thickness = 0.04, Transparency = 0.35, Color = Color3.fromRGB(0, 0, 0)}),
                TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 20, MinTextSize = 9}),
            }),
        })
    end
    v2.FilterToggleButton = v5
    return createElement("Frame", v1, v2)
end

local function navigationRail(a1) -- Line: 368
    -- upvalues: u70 (val), createElement (val), NavButton (val), Navigation (val)
    local v1
    local CurrentTab = a1.CurrentTab
    local v2 = a1.IsMobile == true
    local v3 = {}
    local v4 = nil
    local v5 = nil
    for i, j in u70, v4, v5 do
        v1 = ("%*Button"):format(j.title)
        v3[v1] = (createElement(NavButton, {
            buttonSize = if not v2 then nil else 1.75,
            icon = j.icon,
            title = j.title,
            layoutOrder = i,
            enabled = j.title == CurrentTab,
            onClick = function() -- Line: 384 -- upvalues: j (val), CurrentTab (val), a1 (val)
                if j.title ~= CurrentTab then
                    a1.SetTab(j.title)
                end
            end,
        }))
    end
    v3.otherChildren = {aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 0.26})}
    return createElement(Navigation, {
        flipped = true,
        anchorPoint = Vector2.new(1, 0.5),
        position = UDim2.new(-0.06, 0, 0.5, 0),
        size = UDim2.new(1, 0, 0, if not v2 then 100 else 175),
        childPadding = UDim.new(0, if not v2 then 25 else 100),
        cornerRadius = UDim.new(0.3, 0),
        padding = {top = UDim.new(0, -4), bottom = UDim.new(0, -4)},
    }, v3)
end

local function trackedObjectivesPanel(a1) -- Line: 421
    -- upvalues: toTrackedObjective (val), createElement (val), Objectives (val)
    local v1
    local v2 = {}
    for i, j in a1 do
        v1 = toTrackedObjective(j)
        if v1 then
            table.insert(v2, v1)
        end
    end
    if #v2 == 0 then
        return nil
    end
    return createElement(Objectives, {
        Scale = 0.72,
        AnchorPoint = Vector2.xAxis,
        Objectives = v2,
        Position = UDim2.new(1, -24, 0.23, 0),
        Size = UDim2.fromOffset(300, 0),
        Title = ("Tracked Quests (%*)"):format(#v2),
    })
end

return function(a1) -- Line: 445
    -- upvalues: useState (val), findTrackedRecords (val), createElement (val), scaledStroke (val), navigationRail (val)
    -- upvalues: header (val), noop (val), QuestList (val), MissionList (val), statusOverlay (val)
    -- upvalues: trackedObjectivesPanel (val)
    local v1, v2
    local Quests, Quests_2 = useState("Quests")
    local v3, u8 = useState(false)
    local v4 = a1.Tab or Quests
    local v5 = a1.SetTab or Quests_2
    local Actions = a1.Actions
    local State = a1.State
    local v6 = a1.Loaded == true
    local v7 = a1.PendingAction ~= nil
    if v4 ~= "Quests" and v4 ~= "Missions" then
        v4 = "Quests"
    end

    local function purchaseMission(a1_2, a2, a3) -- Line: 465
        -- upvalues: a1 (val), Actions (val)
        if a1.OnPurchaseMission then
            a1.OnPurchaseMission(a1_2, a2, a3)
            return
        end
        Actions.PurchaseMission(a1_2)
    end

    local v8 = findTrackedRecords(State)
    local v9 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Visible = a1.Visible}
    local v10 = {}
    local v11 = {
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    }
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v11.Position = Position
    local Size = a1.Size or UDim2.new(0.665, 0, 0.651, 0)
    v11.Size = Size
    local v12 = {Scale = createElement("UIScale", {Scale = a1.Scale or 1})}
    v12.Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 10)})
    v12.Stroke = scaledStroke({Thickness = 0.006, Transparency = 0.7, Color = Color3.fromRGB(51, 51, 51)})
    v12.AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1.78})
    v12.NavigationRail = navigationRail({CurrentTab = v4, IsMobile = a1.IsMobile, SetTab = v5})
    local v13 = {Icon = "rbxassetid://78615667890896", Title = "Quests"}
    local OnClose = a1.OnClose or noop
    v13.OnClose = OnClose
    v13.Visible = v4 == "Quests"
    v12.QuestHeader = header(v13)
    v13 = {Icon = "rbxassetid://92104766216829", Title = "Missions Shop"}
    local OnClose_2 = a1.OnClose or noop
    v13.OnClose = OnClose_2

    function v13.OnToggleFilters() -- Line: 459 -- upvalues: u8 (val)
        u8(function(a1) -- Line: 460
            return not a1
        end)
    end

    v13.Visible = v4 == "Missions"
    v12.MissionHeader = header(v13)
    if v4 ~= "Quests" or not v6 then
        v1 = nil
    else
        v2 = {
            Busy = v7,
            IsMobile = a1.IsMobile,
            OnClaimQuest = Actions.ClaimQuest,
            OnTrackQuest = Actions.TrackQuest,
            State = State,
        }
        v2.TrackedQuestIds = State and State.trackedQuestIds or nil
        v2.TrackedQuestId = State and State.trackedQuestId or nil
        v1 = createElement(QuestList, v2)
    end
    v12.QuestList = v1
    if v4 ~= "Missions" or not v6 then
        v1 = nil
    else
        v2 = {
            Busy = v7,
            OnCancelQuest = Actions.CancelQuest,
            OnClaimQuest = Actions.ClaimQuest,
            OnPurchaseMission = purchaseMission,
            OnSkipMission = a1.OnSkipMission,
            OnStartMission = Actions.StartMission,
            OnTrackQuest = Actions.TrackQuest,
            FiltersVisible = v3,
            IsMobile = a1.IsMobile,
            OnDismissFilters = function() -- Line: 542 -- upvalues: u8 (val)
                u8(false)
            end,
            State = State,
        }
        v2.TrackedQuestIds = State and State.trackedQuestIds or nil
        v2.TrackedQuestId = State and State.trackedQuestId or nil
        v1 = createElement(MissionList, v2)
    end
    v12.MissionList = v1
    if a1.Error then
        v13 = {ActionLabel = if not v6 then "Retry" else "Dismiss", Message = a1.Error}
        local ClearError = if not v6 then Actions.RequestState else Actions.ClearError
        v13.OnAction = ClearError
        v1 = statusOverlay(v13)
    else
        v1 = if v6 then nil else statusOverlay({Message = "Loading quests..."})
    end
    v12.StatusOverlay = v1
    v12.BusyLabel = if not v6 or not v7 or a1.Error then nil else createElement("TextLabel", {
        BackgroundTransparency = 1,
        Text = "Updating...",
        TextScaled = true,
        ZIndex = 10,
        AnchorPoint = Vector2.new(1, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.91, 0.055),
        Size = UDim2.fromScale(0.2, 0.05),
        TextColor3 = Color3.fromRGB(255, 210, 74),
    }, {
        TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 18, MinTextSize = 8}),
    })
    v10.MenuContainer = createElement("Frame", v11, v12)
    v10.Objectives = trackedObjectivesPanel(v8)
    return createElement("Frame", v9, v10)
end