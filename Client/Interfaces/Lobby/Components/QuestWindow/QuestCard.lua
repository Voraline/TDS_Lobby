-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.QuestCard
-- Decompile time: 5.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ActionButton = require(ReplicatedStorage.Client.Interfaces.Components.ActionButton)
local ClientAdapter = require(ReplicatedStorage.Shared.Data.Quests.ClientAdapter)
local PinButton = require(script.Parent.PinButton)
require(ReplicatedStorage.Shared.Types.QuestTypes)
local React = require(ReplicatedStorage.Shared.UI.React)
local RewardList = require(script.Parent.RewardList)
local StudioElements = require(script.Parent.StudioElements)
local QuestViewModels = require(script.Parent.QuestViewModels)
local createElement = React.createElement
local Event = React.Event
local scaledStroke = StudioElements.scaledStroke
local textStroke = StudioElements.textStroke

local function progressBar(a1) -- Line: 33 -- upvalues: createElement (val), scaledStroke (val) -- types: a1: number
    return createElement("Frame", {
        BorderSizePixel = 0,
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(0.5, 0.9),
        BackgroundColor3 = Color3.fromRGB(44, 44, 44),
        Position = UDim2.new(0.4752, 0, 0.9016, 0),
        Size = UDim2.new(0.8025, 0, 0.2232, 0),
    }, {
        Fill = createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.new(math.clamp(a1, 0, 1), 0, 1, 0),
        }, {
            Gradient = createElement("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 124, 0)),
                    ColorSequenceKeypoint.new(0.3633, Color3.fromRGB(255, 165, 11)),
                    ColorSequenceKeypoint.new(0.7422, Color3.fromRGB(255, 207, 22)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
                }),
            }),
            Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 100)}),
        }),
        Stroke = scaledStroke({Thickness = 0.015, Transparency = 1, Color = Color3.fromRGB(255, 255, 255)}),
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 100)}),
    })
end

local function textSizeConstraint(a1, a2) -- Line: 70 -- upvalues: createElement (val) -- types: a1: number, a2: number?
    return createElement("UITextSizeConstraint", {MaxTextSize = a1, MinTextSize = a2 or 8})
end

return function(a1) -- Line: 77
    -- upvalues: ClientAdapter (val), createElement (val), ActionButton (val), scaledStroke (val), Event (val)
    -- upvalues: PinButton (val), textStroke (val), QuestViewModels (val), progressBar (val), RewardList (val)
    local Record = a1.Record
    local v1 = ClientAdapter.getProgress(Record)
    local v2 = ClientAdapter.getQuestAction(Record, {
        groupName = a1.GroupName,
        trackedQuestIds = a1.TrackedQuestIds,
        trackedQuestId = a1.TrackedQuestId,
    })
    local u17 = ClientAdapter.isClaimable(Record)
    local Height = a1.Height
    local v3 = a1.IsMobile == true
    local v4 = ClientAdapter.isTracked(Record, {trackedQuestIds = a1.TrackedQuestIds, trackedQuestId = a1.TrackedQuestId})
    local v5 = string.len(Record.quest.name)
    local v6 = v5 > 22
    local v7 = if not (v5 > 34) then if not v6 then 22 else 20 else 18
    local v8 = v2 and v2.kind == "claim" and createElement(ActionButton, {
        Label = "Claim",
        Variant = "primary",
        ZIndex = 6,
        Disabled = a1.Busy,
        OnActivated = function() -- Line: 101 -- upvalues: a1 (val), Record (val)
            a1.OnClaimQuest(Record.id)
            return
        end,
        Position = UDim2.new(0.48, 0, 0.6, 0),
        Size = UDim2.new(0.2224, 0, 0.4001, 0),
    }) or nil
    local v9 = {
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        LayoutOrder = a1.LayoutOrder,
    }
    local v10 = if not Height then if not u17 then UDim2.new(0.9704, 0, 0.6358, 0) else UDim2.new(0.9704, 0, 0.2249, 0) else UDim2.new(1, 0, 0, Height)
    v9.Size = v10
    v10 = {}
    local v11 = {Transparency = 0}
    local v12 = if not v4 then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(0, 170, 255)
    v11.Color = v12
    v11.Thickness = if not v4 then 0.012 else 0.016
    v10.Stroke = scaledStroke(v11, {
        Gradient = createElement("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 34, 34)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 130, 130))),
            }),
        }),
    })
    v10.Corner = createElement("UICorner", {CornerRadius = UDim.new(0.1294, 0)})
    v10.Gradient = createElement("UIGradient", {
        Rotation = 90,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 18, 18))),
        }),
    })
    v10.AspectRatio = if Height then nil else createElement("UIAspectRatioConstraint", {AspectRatio = 9.54, DominantAxis = Enum.DominantAxis.Width})
    local v13 = createElement
    v12 = {
        AutoButtonColor = false,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        Text = "",
        ZIndex = 2,
    }

    v12[Event.Activated] = function() -- Line: 167 -- upvalues: a1 (val), Record (val)
        a1.OnSelected(Record.id)
    end

    v10.SelectHitbox = v13("TextButton", v12)
    v10.PinButton = if u17 then nil else createElement(PinButton, {
        ZIndex = 7,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Disabled = a1.Busy,
        IsPinned = v4,
        OnActivated = function() -- Line: 111 -- upvalues: u17 (val), a1 (val), Record (val)
            if not u17 and not a1.Busy then
                a1.OnTrackQuest(Record.id)
                return
            end
        end,
        Position = UDim2.fromScale(0.964, 0.183),
        Size = UDim2.fromScale(0.025, 0.234),
    })
    v12 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0.01, 0, 0.06, 0),
        Size = UDim2.new(0.3092, 0, 0.6235, 0),
    }
    local v14 = {}
    local v15 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextScaled = true,
        TextWrapped = true,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
    }
    local v16 = if not u17 then UDim2.fromScale(0, 0) else UDim2.new(0, 0, -0.1132, 0)
    v15.Position = v16
    v15.Size = UDim2.new(1, 0, 0.5094, 0)
    v15.Text = Record.quest.name
    v15.TextColor3 = Color3.fromRGB(255, 255, 255)
    v15.TextSize = v7
    v15.TextXAlignment = Enum.TextXAlignment.Left
    v14.TitleLabel = createElement("TextLabel", v15, {
        Stroke = textStroke({Color = Color3.fromRGB(0, 0, 0)}),
        TextSizeConstraint = createElement("UITextSizeConstraint", {MinTextSize = 10, MaxTextSize = v7}),
    })
    v14.Layout = createElement("UIListLayout", {Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder})
    v15 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        RichText = true,
        TextScaled = true,
        TextSize = 16,
        TextWrapped = true,
        FontFace = Font.new(
            "rbxasset://fonts/families/GothamSSm.json",
            if not u17 then Enum.FontWeight.Bold else Enum.FontWeight.Heavy,
            Enum.FontStyle.Normal
        ),
    }
    v16 = if not u17 then UDim2.new(0, 0, 0.5677, 0) else UDim2.new(0, 0, 0.5677, 0)
    v15.Position = v16
    v15.Size = UDim2.new(0.8784, 0, 0.691, 0)
    v15.Text = Record.quest.description
    v15.TextColor3 = Color3.fromRGB(255, 255, 255)
    v15.TextXAlignment = Enum.TextXAlignment.Left
    v14.DescriptionLabel = createElement("TextLabel", v15, {
        Stroke = textStroke({Color = Color3.fromRGB(0, 0, 0)}),
        TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 16, MinTextSize = 8}),
    })
    v10.TextContainer = createElement("Frame", v12, v14)
    v12 = {BackgroundTransparency = 1, BorderSizePixel = 0, AnchorPoint = Vector2.new(0.5, 0.5)}
    v14 = if not u17 then UDim2.new(0.48, 0, 0.5324, 0) else UDim2.new(0.44, 0, 0.5324, 0)
    v12.Position = v14
    v14 = if not u17 then UDim2.new(0.3071, 0, 0.5647, 0) else UDim2.fromOffset(242, 48)
    v12.Size = v14
    v10.Progression = createElement("Frame", v12, {
        ProgressLabel = if u17 then nil else createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextSize = 22,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Position = UDim2.new(0.3113, 0, -0.1395, 0),
            Size = UDim2.new(0.376, 0, 0.5625, 0),
            Text = QuestViewModels.getProgressText(Record),
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            Stroke = textStroke({Transparency = 0.25, Color = Color3.fromRGB(0, 0, 0)}),
            TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 22, MinTextSize = 8}),
        }),
        ProgressBar = if u17 then nil else progressBar(v1.progress),
    })
    v12 = {
        ShowQuantity = true,
        ZIndex = 6,
        AnchorPoint = Vector2.new(0.5, 0.5),
        CellSize = if not v3 then nil else UDim2.new(0.2452, 0, 1.65, 0),
        IsMobile = v3,
    }
    v14 = if not v3 then if not u17 then UDim2.new(0.765, 0, 0.511, 0) else UDim2.new(0.83, 0, 0.5107, 0) else UDim2.new(0.75, 0, 0.5, 0)
    v12.Position = v14
    v12.PreviewScale = if not v3 then nil else 1.35
    v12.Rewards = Record.quest.rewards
    v14 = if not v3 then UDim2.new(0.3101, 0, 0.6684, 0) else UDim2.new(0.32, 0, 0.86, 0)
    v12.Size = v14
    v12.TooltipKeyPrefix = ("QuestCardReward_%*"):format(Record.id)
    v10.RewardsContainer = createElement(RewardList, v12)
    v10.ActionButton = v8
    return createElement("Frame", v9, v10)
end