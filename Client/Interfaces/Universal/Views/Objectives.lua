-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.Objectives
-- Decompile time: 6.86 ms

local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ClientAdapter = require(ReplicatedStorage.Shared.Data.Quests.ClientAdapter)
local FFlagController = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
local Objectives = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Objectives)
local PlayerListStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.PlayerListStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
local useQuestState = require(ReplicatedStorage.Client.Interfaces.Hooks.useQuestState)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useView = require(ReplicatedStorage.Client.Interfaces.Hooks.useView)
local createElement = React.createElement
local useState = React.useState
local u88 = FFlagController.get("quests.active", false)
local u89 = {
    Inventory = true,
    Shop = true,
    Settings = true,
    Achievements = true,
    Quests = true,
    Crate = true,
    XmasQuests = true,
    ChallengeMaps = true,
    PromptMatchmaking = true,
}

local function getTrackedQuestObjectives(a1) -- Line: 34 -- upvalues: ClientAdapter (val)
    local v1, v2, v3
    local v4 = {}
    if not a1 then
        return v4
    end
    local v5 = ClientAdapter.getTrackedQuestIdSet(a1)
    local v6 = nil
    local v7 = nil
    for i, j in a1.groups, v6, v7 do
        v3 = nil
        v1 = nil
        for k, n in j, v3, v1 do
            if v5[n.id] and n.started then
                v2 = ClientAdapter.getProgress(n)
                table.insert(v4, {
                    GoalDescriptionTextSize = 18,
                    Title = n.quest.name,
                    GoalDescription = if not ClientAdapter.isComplete(n) then v2.description else "Claim your reward in the lobby!",
                    Progress = v2.summaryProgress,
                    ObjectiveColor = if i ~= "weekly" then nil else Color3.fromRGB(255, 128, 130),
                    LayoutOrder = if i ~= "weekly" then nil else 100,
                })
            end
        end
    end
    return v4
end

return function(a1) -- Line: 65
    -- upvalues: useMediaQuery (val), useState (val), useView (val), useReactBindings (val), u89 (val)
    -- upvalues: useGameStateValue (val), useQuestState (val), u88 (val), useCharmSelector (val), PlayerListStore (val)
    -- upvalues: useScale (val), getTrackedQuestObjectives (val), GuiService (val), createElement (val)
    -- upvalues: Objectives (val)
    local large = useMediaQuery("large")
    local v1, u7 = useState(false)
    local v2 = {(useView(true))}
    useReactBindings(function(a1) -- Line: 71 -- upvalues: u89 (upval), u7 (val)
        if u89[a1] then
            u7(not u89[a1])
            return
        end
        u7(true)
    end, v2, {})
    local v3 = useGameStateValue("GameMode") == "Sandbox"
    local v4 = useQuestState(u88(), true)
    v2 = useCharmSelector(PlayerListStore.getState, function(a1) -- Line: 82 -- upvalues: u88 (upval)
        if not u88() then
            return false
        end
        return a1.visible
    end)
    local v5 = useScale(1.5)
    local v6 = useCharmSelector(PlayerListStore.getState, function(a1) -- Line: 92
        return a1.contentSize
    end)
    local v7 = useCharmSelector(PlayerListStore.getState, function(a1) -- Line: 96
        return a1.absolutePosition
    end)
    local v8 = useCharmSelector(PlayerListStore.getState, function(a1) -- Line: 100
        return a1.absoluteSize
    end)
    local v9 = getTrackedQuestObjectives(v4.State)
    local v10, v11 = useState(Vector2.zero)
    if #v9 ~= 0 and v1 and u88() and not v3 then
        local Y = if not v2 then v7.Y else if not large then v7.Y else v7.Y + v6.Y + 16
        local v12 = -32
        local v13 = 0
        local xAxis = Vector2.xAxis
        if Y < v8.Y * 0.5 + v10.Y or not large then
            Y = -GuiService:GetGuiInset().Y
            v13 = 0.5
            xAxis = Vector2.new(1, 0.5)
            if not large then
                v13 = 0
                xAxis = Vector2.xAxis
                Y = 16
                v12 = 0
            end
        end
        return createElement(Objectives, {
            Position = UDim2.new(1, v12, v13, Y),
            Size = UDim2.fromOffset(300, 0),
            AnchorPoint = xAxis,
            Objectives = v9,
            Scale = v5,
            SetWindowSize = v11,
        })
    end
    return nil
end