-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.QuestDetail
-- Decompile time: 3.05 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ActionButton = require(ReplicatedStorage.Client.Interfaces.Components.ActionButton)
local ClientAdapter = require(ReplicatedStorage.Shared.Data.Quests.ClientAdapter)
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local QuestObjectivesCard = require(script.Parent.QuestObjectivesCard)
local QuestProgressSummary = require(script.Parent.QuestProgressSummary)
local QuestRewardsPanel = require(script.Parent.QuestRewardsPanel)
require(ReplicatedStorage.Shared.Types.QuestTypes)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement

local function getObjectiveCompletion(a1) -- Line: 28
    local current
    local v1 = 0
    local v2 = #a1.quest.objectives
    for i, j in a1.quest.objectives do
        current = j.current
        if j.amount <= current then
            v1 = v1 + 1
        end
    end
    return v1, (math.max(v2, 1))
end

return function(a1) -- Line: 41
    -- upvalues: ClientAdapter (val), Comma (val), createElement (val), QuestObjectivesCard (val), ActionButton (val)
    -- upvalues: QuestProgressSummary (val), QuestRewardsPanel (val)
    local current_2
    local Record = a1.Record
    local v1 = ClientAdapter.getProgress(Record)
    local v2 = ClientAdapter.getQuestAction(Record, {
        groupName = a1.GroupName,
        trackedQuestIds = a1.TrackedQuestIds,
        trackedQuestId = a1.TrackedQuestId,
    })
    local v3 = ClientAdapter.isTracked(Record, {trackedQuestIds = a1.TrackedQuestIds, trackedQuestId = a1.TrackedQuestId})
    local v4 = 0
    local v5 = #Record.quest.objectives
    for i, j in Record.quest.objectives do
        current_2 = j.current
        if j.amount <= current_2 then
            v4 = v4 + 1
        end
    end
    local v6 = v4
    local v7 = math.max(v5, 1)
    v4 = ("%*/%*"):format(Comma((math.min(v1.current, v1.amount))), (Comma(v1.amount)))
    local v8 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0.12, 0),
        Size = UDim2.new(1, 0, 0.86, 0),
    }
    local v9 = {
        ObjectivesCard = createElement(QuestObjectivesCard, {
            ActiveObjectiveIndex = v1.currentObjectiveIndex,
            ActionChildren = {
                ReturnButton = createElement(ActionButton, {
                    Label = "Return",
                    Variant = "danger",
                    OnActivated = a1.OnReturn,
                    Position = UDim2.new(0.5, 0, 0.925, 0),
                    Size = UDim2.new(0.62, 0, 0.095, 0),
                }),
            },
            ObjectivesLabel = ("Objectives (%*/%*)"):format(v6, v7),
            Record = Record,
            Title = Record.quest.name,
        }),
    }
    v9.ProgressSummary = createElement(QuestProgressSummary, {
        Description = v1.description or "",
        IsMobile = a1.IsMobile,
        Label = ("Current Objective (%*/%*)"):format(v1.currentObjectiveIndex, v1.totalObjectives),
        Progress = v1.progress,
        Value = ("(%*)"):format(v4),
    })
    v9.RewardsPanel = createElement(QuestRewardsPanel, {
        Title = "Quest Completion Rewards",
        IsMobile = a1.IsMobile,
        Rewards = Record.quest.rewards,
        TooltipKeyPrefix = ("SelectedQuestReward_%*"):format(Record.id),
    })
    v9.TrackButton = createElement(ActionButton, {
        Disabled = a1.Busy,
        Label = if not v3 then "Track" else "Untrack",
        OnActivated = function() -- Line: 95 -- upvalues: a1 (val), Record (val)
            if a1.Busy then
                return
            end
            a1.OnTrackQuest(Record.id)
        end,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.75, 0, 0.86, 0),
        Size = UDim2.new(0.16, 0, 0.09, 0),
        Variant = if not v3 then "primary" else "danger",
    })
    v9.ClaimButton = if not v2 or v2.kind ~= "claim" then nil else createElement(ActionButton, {
        Label = "Claim",
        Variant = "primary",
        Disabled = a1.Busy,
        OnActivated = function() -- Line: 111 -- upvalues: a1 (val), Record (val)
            if a1.Busy then
                return
            end
            a1.OnClaimQuest(Record.id)
        end,
        Position = UDim2.new(0.84, 0, 0.86, 0),
        Size = UDim2.new(0.16, 0, 0.09, 0),
    })
    return createElement("Frame", v8, v9)
end