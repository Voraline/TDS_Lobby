-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.MissionCard
-- Decompile time: 27.60 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ActionButton = require(ReplicatedStorage.Client.Interfaces.Components.ActionButton)
local ClientAdapter = require(ReplicatedStorage.Shared.Data.Quests.ClientAdapter)
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
require(ReplicatedStorage.Shared.Types.QuestTypes)
local React = require(ReplicatedStorage.Shared.UI.React)
local RewardList = require(script.Parent.RewardList)
local StudioElements = require(script.Parent.StudioElements)
local createElement = React.createElement
local Event = React.Event
local scaledStroke = StudioElements.scaledStroke
local strokedText = StudioElements.strokedText
local textStroke = StudioElements.textStroke

local function progressBar(a1) -- Line: 39 -- upvalues: createElement (val) -- types: a1: number
    return createElement("Frame", {
        BorderSizePixel = 0,
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(0.5, 0.9),
        BackgroundColor3 = Color3.fromRGB(29, 29, 29),
        Position = UDim2.new(0.5, 0, 0.9, 0),
        Size = UDim2.new(0.8025, 0, 0.2395, 0),
    }, {
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 100)}),
        InnerBar = createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.new(math.clamp(a1, 0, 1), 0, 1, 0),
        }, {
            Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 100)}),
            Gradient = createElement("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 124, 0)),
                    ColorSequenceKeypoint.new(0.3633, Color3.fromRGB(255, 165, 11)),
                    ColorSequenceKeypoint.new(0.7422, Color3.fromRGB(255, 207, 22)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
                }),
            }),
        }),
    })
end

local function getObjectiveCompletion(a1) -- Line: 71
    local v1
    local v2 = 0
    local v3 = #a1.quest.objectives
    for i, j in a1.quest.objectives do
        v1 = j.current or 0
        if (j.amount or 0) <= v1 then
            v2 = v2 + 1
        end
    end
    return v2, (math.max(v3, 1))
end

local function getCompactProgressText(a1) -- Line: 83 -- upvalues: ClientAdapter (val), Comma (val)
    local v1 = ClientAdapter.getProgress(a1)
    return (("%*/%*"):format(Comma((math.min(v1.current, v1.amount))), (Comma(v1.amount))))
end

local function coinButton(a1) -- Line: 88 -- upvalues: createElement (val), ActionButton (val) -- types: a1: table
    local Variant = a1.Variant or (if a1.ShowCoin ~= false then "purchase" else "primary")
    local v1 = {
        LayoutOrder = 5,
        TextSize = 25,
        ZIndex = 1,
        Disabled = a1.Disabled,
        Label = a1.Label,
        OnActivated = a1.OnActivated,
        Position = UDim2.new(0.4592, 0, 0.9495, 0),
        ShowCurrency = a1.ShowCoin ~= false,
        Size = UDim2.new(0.4275, 0, 0.126, 0),
    }
    local v2 = if Variant ~= "danger" then Color3.fromRGB(62, 244, 69) else Color3.fromRGB(163, 55, 55)
    v1.StrokeColor = v2
    v1.Variant = Variant
    return createElement(ActionButton, v1)
end

local function getAction(a1, a2) -- Line: 115 -- upvalues: ClientAdapter (val) -- types: a2: table
    if a2.Locked then
        return nil
    end
    return ClientAdapter.getQuestAction(a1, {groupName = "missions", isAvailableMission = a2.IsAvailableMission})
end

local function getActionLabel(a1, a2) -- Line: 126 -- upvalues: Comma (val)
    if not a2 then
        if 0 < (a1.price or 0) then
            return (Comma(a1.price or 0)), true
        end
        return "View", false
    end
    if a2.kind == "purchaseMission" then
        return (Comma(a1.price or 0)), true
    end
    if a2.kind == "startMission" then
        return "Start", false
    end
    if a2.kind == "claim" then
        return "Claim", false
    end
    if a2.kind ~= "cancelMission" then
        return (string.upper(a2.label)), false
    end
    if 0 < (a1.price or 0) then
        return (Comma(a1.price or 0)), true
    end
    return "View", false
end

local function getRewardLayout(a1, a2) -- Line: 152 -- types: a1: number, a2: boolean?
    if a2 then
        if a1 <= 2 then
            return {
                maxCells = 2,
                cellPadding = UDim2.new(0.04, 0, 0, 0),
                cellSize = UDim2.new(0.42, 0, 0.9, 0),
            }
        end
        if a1 == 3 then
            return {
                maxCells = 3,
                cellPadding = UDim2.new(0.025, 0, 0, 0),
                cellSize = UDim2.new(0.31, 0, 0.9, 0),
            }
        end
        return {
            maxCells = 2,
            cellPadding = UDim2.new(0.025, 0, 0.04, 0),
            cellSize = UDim2.new(0.44, 0, 0.48, 0),
        }
    end
    if a1 <= 2 then
        return {
            maxCells = 2,
            cellPadding = UDim2.new(0.0317, 0, 0, 0),
            cellSize = UDim2.new(0.3575, 0, 0.8602, 0),
        }
    end
    if a1 == 3 then
        return {
            maxCells = 3,
            cellPadding = UDim2.new(0.025, 0, 0, 0),
            cellSize = UDim2.new(0.3, 0, 0.8602, 0),
        }
    end
    return {
        maxCells = 4,
        cellPadding = UDim2.new(0.005, 0, 0.0936, 0),
        cellSize = UDim2.new(0.2452, 0, 1.4473, 0),
    }
end

local function textSizeConstraint(a1, a2) -- Line: 196
    -- upvalues: createElement (val)
    return createElement("UITextSizeConstraint", {MaxTextSize = a1, MinTextSize = a2 or 8})
end

local function overlay(a1) -- Line: 203 -- upvalues: createElement (val), strokedText (val) -- types: a1: table
    local v1 = a1.Kind == "completed"
    local v2 = {BackgroundTransparency = 0.2, BorderSizePixel = 0, ZIndex = 8}
    local v3 = if not v1 then Color3.fromRGB(0, 0, 0) else Color3.fromRGB(16, 34, 0)
    v2.BackgroundColor3 = v3
    v2.Size = UDim2.fromScale(1, 1)
    v3 = {Corner = createElement("UICorner", {CornerRadius = UDim.new(0.0417, 0)})}
    local v4 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 9,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(0.7292, 0, 0.5177, 0),
    }
    local v5 = {
        Layout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, 15),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
    }
    v5.Icon = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        ZIndex = 10,
        Image = if not v1 then "rbxassetid://137052204118126" else "rbxassetid://15303988233",
        ScaleType = Enum.ScaleType.Fit,
        Size = UDim2.new(0.5714, 0, 0.5714, 0),
    })
    local v6 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        TextScaled = true,
        TextSize = 24,
        ZIndex = 10,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Size = UDim2.new(2.1714, 0, 0.0971, 0),
        Text = if not v1 then "Mission Locked" else "Mission Completed",
    }
    local v7 = if not v1 then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(63, 243, 63)
    v6.TextColor3 = v7
    v6.TextXAlignment = Enum.TextXAlignment.Center
    v6.Children = {
        TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 24, MinTextSize = 10}),
    }
    v5.State = strokedText(v6)
    v5.Required = if v1 or not a1.RequiredText then nil else strokedText({
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 3,
        TextScaled = true,
        TextSize = 20,
        ZIndex = 10,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Size = UDim2.new(1.76, 0, 0.08, 0),
        Text = a1.RequiredText,
        TextColor3 = Color3.fromRGB(248, 86, 46),
        TextXAlignment = Enum.TextXAlignment.Center,
        Children = {
            TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 20, MinTextSize = 8}),
        },
    })
    v3.Elementcontainer = createElement("Frame", v4, v5)
    return createElement("Frame", v2, v3)
end

return function(a1) -- Line: 292
    -- upvalues: ClientAdapter (val), getObjectiveCompletion (val), getActionLabel (val), getRewardLayout (val)
    -- upvalues: createElement (val), scaledStroke (val), Event (val), strokedText (val), textStroke (val), Comma (val)
    -- upvalues: progressBar (val), RewardList (val), coinButton (val), overlay (val)
    local Record = a1.Record
    local v1 = ClientAdapter.getProgress(Record)
    local v2, v3 = getObjectiveCompletion(Record)
    local u17 = if not a1.Locked then ClientAdapter.getQuestAction(Record, {groupName = "missions", isAvailableMission = a1.IsAvailableMission}) else nil
    local v4 = ClientAdapter.isTracked(Record, {trackedQuestIds = a1.TrackedQuestIds, trackedQuestId = a1.TrackedQuestId})
    local v5, v6 = getActionLabel(Record, u17)
    local v7 = nil
    local v8 = a1.IsMobile == true
    local v9 = getRewardLayout(#Record.quest.rewards, v8)
    local v10 = string.len(Record.quest.name)
    local v11 = v10 > 14
    local v12 = if not (v10 > 24) then if not v11 then 26 else 22 else 20
    if u17 and u17.kind == "cancelMission" then
        v5 = if not v4 then "Track" else "Untrack"
        v6 = false
        v7 = if not v4 then "primary" else "danger"
    end
    local v13 = a1.CompletedOverlay == true
    local v14 = {
        BorderSizePixel = 0,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(56, 56, 56),
        LayoutOrder = a1.LayoutOrder,
        Size = UDim2.fromScale(1, 1),
    }
    local v15 = {}
    local v16 = {}
    local v17 = if not a1.Selected then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(0, 170, 255)
    v16.Color = v17
    v16.Thickness = if not a1.Selected then 0.012 else 0.018
    v16.Transparency = if not a1.Selected then 0.4 else 0
    v15.Stroke = scaledStroke(v16, {
        Gradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.4663, Color3.fromRGB(54, 54, 54)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
            }),
        }),
    })
    v15.Corner = createElement("UICorner", {CornerRadius = UDim.new(0.0417, 0)})
    v15.Gradient = createElement("UIGradient", {
        Rotation = 90,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 130, 130))),
        }),
    })
    v15.AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 0.7})
    local v18 = createElement
    v17 = {
        AutoButtonColor = false,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        Text = "",
        ZIndex = 2,
    }

    v17[Event.Activated] = function() -- Line: 379 -- upvalues: a1 (val), Record (val)
        if not a1.Locked then
            a1.OnSelected(Record.id)
        end
    end

    v15.SelectButton = v18("TextButton", v17)
    v17 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 3,
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(1.0044, 0, 1, 0),
    }
    local v19 = {
        Padding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0.0444, 0),
            PaddingLeft = UDim.new(0.0333, 0),
            PaddingTop = UDim.new(0.0163, 0),
        }),
        Layout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0.0239, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    local v20 = {BackgroundTransparency = 1, BorderSizePixel = 0, LayoutOrder = 0}
    local v21 = if not v11 then UDim2.new(0.9483, 0, 0.1543, 0) else UDim2.new(0.9483, 0, 0.205, 0)
    v20.Size = v21
    v21 = {}
    local v22 = {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
    }
    local v23 = if not v11 then UDim.new(0.102, 0) else UDim.new(0.035, 0)
    v22.Padding = v23
    v22.SortOrder = Enum.SortOrder.LayoutOrder
    v22.VerticalAlignment = Enum.VerticalAlignment.Top
    v21.Layout = createElement("UIListLayout", v22)
    local v24 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        TextScaled = true,
        TextWrapped = true,
        ZIndex = 4,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
    }
    v22 = if not v11 then UDim2.new(1, 0, 0.4649, 0) else UDim2.new(1, 0, 0.62, 0)
    v24.Size = v22
    v24.Text = Record.quest.name
    v24.TextColor3 = Color3.fromRGB(255, 255, 255)
    v24.TextSize = v12
    v24.TextXAlignment = Enum.TextXAlignment.Left
    v24.Children = {
        TextSizeConstraint = createElement("UITextSizeConstraint", {MinTextSize = 10, MaxTextSize = v12}),
    }
    v21.TitleLabel = strokedText(v24)
    v24 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        TextScaled = true,
        TextWrapped = true,
        ZIndex = 4,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
    }
    v22 = if not v11 then UDim2.new(0.7864, 0, 0.3265, 0) else UDim2.new(0.7864, 0, 0.24, 0)
    v24.Size = v22
    v24.Text = ("Objective (%*/%*)"):format(v2, v3)
    v24.TextColor3 = Color3.fromRGB(255, 255, 255)
    v24.TextSize = if not v11 then 17 else 15
    v24.TextXAlignment = Enum.TextXAlignment.Left
    v24.Children = {
        TextSizeConstraint = createElement("UITextSizeConstraint", {MinTextSize = 8, MaxTextSize = if not v11 then 17 else 15}),
    }
    v21.SubtitleLabel = strokedText(v24)
    v19.Title = createElement("Frame", v20, v21)
    v20 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        TextScaled = true,
        TextSize = 20,
        TextWrapped = true,
        ZIndex = 4,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Size = UDim2.new(0.9526, 0, 0.1606, 0),
    }
    local description = v1.description or Record.quest.description
    v20.Text = description
    v20.TextColor3 = Color3.fromRGB(255, 255, 255)
    v20.TextXAlignment = Enum.TextXAlignment.Left
    v19.Description = createElement("TextLabel", v20, {
        Stroke = textStroke({Color = Color3.fromRGB(0, 0, 0)}),
        TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 20, MinTextSize = 8}),
    })
    local v25 = createElement
    v20 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.new(0.9529, 0, 0.141, 0),
    }
    v21 = {}
    local v26 = createElement
    v22 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextScaled = true,
        TextSize = 22,
        ZIndex = 4,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.new(0.2811, 0, 0.167, 0),
        Size = UDim2.new(0.6202, 0, 0.2935, 0),
    }
    local v27 = ClientAdapter.getProgress(Record)
    v22.Text = ("(%*)"):format((("%*/%*"):format(Comma((math.min(v27.current, v27.amount))), (Comma(v27.amount)))))
    v22.TextColor3 = Color3.fromRGB(255, 255, 255)
    v22.TextXAlignment = Enum.TextXAlignment.Right
    v21.ProgressLabel = v26("TextLabel", v22, {
        Stroke = textStroke({Color = Color3.fromRGB(0, 0, 0)}),
        TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 22, MinTextSize = 8}),
    })
    v21.ProgressBar = progressBar(v1.progress)
    v19.Progression = v25("Frame", v20, v21)
    v19.RewardContainer = createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 3,
        ZIndex = 4,
        Size = UDim2.new(0.9526, 0, 0.3349, 0),
    }, {
        RewardLabel = strokedText({
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "Rewards",
            TextScaled = true,
            TextSize = 18,
            TextWrapped = true,
            ZIndex = 4,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Position = UDim2.new(0.0452, 0, -0.0076, 0),
            Size = UDim2.new(0.905, 0, 0.1945, 0),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Center,
            Children = {
                TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 18, MinTextSize = 8}),
            },
        }),
        Rewards = createElement(RewardList, {
            ShowQuantity = true,
            CellPadding = v9.cellPadding,
            CellSize = v9.cellSize,
            FillDirectionMaxCells = v9.maxCells,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            IsMobile = v8,
            Position = UDim2.new(0, 0, 0.1696, 0),
            PreviewScale = if not v8 then 1 else 1.25,
            Rewards = Record.quest.rewards,
            Size = UDim2.new(1, 0, 0.8747, 0),
            TooltipKeyPrefix = ("MissionCardReward_%*_%*"):format(Record.id, a1.LayoutOrder or 0),
        }),
    })
    local v28 = {}
    local Locked = a1.Locked or a1.Busy or v13
    v28.Disabled = Locked
    v28.Label = v5

    function v28.OnActivated() -- Line: 316 -- upvalues: a1 (val), u17 (val), Record (val)
        if not a1.Locked and not a1.Busy then
            if u17 and u17.kind == "claim" then
                a1.OnClaimQuest(Record.id)
                return
            end
            if u17 and u17.kind == "cancelMission" then
                a1.OnTrackQuest(Record.id)
                return
            end
            if u17 and u17.kind == "startMission" then
                a1.OnStartMission(Record.id)
                return
            end
            if u17 and u17.kind == "purchaseMission" then
                a1.OnPurchaseMission(Record.id, Record.quest.name, Record.price or 0)
                return
            end
            a1.OnSelected(Record.id)
            return
        end
    end

    v28.ShowCoin = v6
    v28.Variant = v7
    v19.ActionButton = coinButton(v28)
    v15.InfoContainer = createElement("Frame", v17, v19)
    v15.StateOverlay = if a1.Locked then overlay({Kind = "locked", RequiredText = a1.RequiredText or "Mission requirements not met"}) else if not v13 then nil else overlay({Kind = "completed"})
    return createElement("Frame", v14, v15)
end