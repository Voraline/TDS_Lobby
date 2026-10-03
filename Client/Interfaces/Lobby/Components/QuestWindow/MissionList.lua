-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.MissionList
-- Decompile time: 23.36 ms

local addFilterLabel, valueContainsAdidas
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ActionButton = require(ReplicatedStorage.Client.Interfaces.Components.ActionButton)
local ClientAdapter = require(ReplicatedStorage.Shared.Data.Quests.ClientAdapter)
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local MissionCard = require(script.Parent.MissionCard)
local MissionFilterPanel = require(script.Parent.MissionFilterPanel)
local QuestObjectivesCard = require(script.Parent.QuestObjectivesCard)
local QuestProgressSummary = require(script.Parent.QuestProgressSummary)
local QuestRewardsPanel = require(script.Parent.QuestRewardsPanel)
require(ReplicatedStorage.Shared.Types.QuestTypes)
local React = require(ReplicatedStorage.Shared.UI.React)
local StudioElements = require(script.Parent.StudioElements)
local createElement = React.createElement
local Event = React.Event
local useBinding = React.useBinding
local useEffect = React.useEffect
local useState = React.useState
local textStroke = StudioElements.textStroke

local function getObjectiveCompletion(a1) -- Line: 55
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

local function getCompactProgressText(a1) -- Line: 67 -- upvalues: ClientAdapter (val), Comma (val)
    local v1 = ClientAdapter.getProgress(a1)
    return (("%*/%*"):format(Comma((math.min(v1.current, v1.amount))), (Comma(v1.amount))))
end

local function getSelectedRecord(a1, a2, a3) -- Line: 72 -- types: a1: table, a2: table, a3: string?
    if not a3 then
        return nil, false
    end
    for i, j in a1 do
        if j.id ~= a3 and j.quest.id ~= a3 then
            continue
        end
        return j, false
    end
    for k, n in a2 do
        if n.id ~= a3 and n.quest.id ~= a3 then
            continue
        end
        return n, true
    end
    return nil, false
end

function addFilterLabel(a1, a2) -- Line: 96 -- upvalues: addFilterLabel (val) -- types: a1: table
    if type(a2) == "string" and a2 ~= "" then
        a1[a2] = true
        return
    end
    if type(a2) == "table" then
        for i, j in a2 do
            addFilterLabel(a1, j)
        end
    end
end

local function addTowerLikeLabels(a1, a2) -- Line: 106 -- upvalues: addFilterLabel (val) -- types: a1: table
    local v1
    if type(a2) ~= "table" then
        return
    end
    local v2 = nil
    local v3 = nil
    for i, j in a2, v2, v3 do
        if type(i) == "string" then
            v1 = string.lower(i)
            if string.find(v1, "tower", 1, true) or string.find(v1, "troop", 1, true) then
                addFilterLabel(a1, j)
            end
        end
    end
end

local function getRecordFilterLabels(a1) -- Line: 124 -- upvalues: addFilterLabel (val), addTowerLikeLabels (val)
    local v1 = {}
    local v2 = {}
    for i, j in a1.quest.rewards do
        if j.tower then
            addFilterLabel(v1, j.tower)
        end
    end
    for k, n in a1.quest.objectives do
        addTowerLikeLabels(v1, n.filter)
    end
    addTowerLikeLabels(v1, a1.quest.metadata)
    addTowerLikeLabels(v1, a1.quest.templateVariables)
    for m in v1 do
        table.insert(v2, m)
    end
    table.sort(v2)
    return v2
end

local function getFilterOptions(a1, a2) -- Line: 149
    -- upvalues: getRecordFilterLabels (val)
    local v1, v2
    local v3 = {}
    local v4 = {}
    local v5 = {a1, a2}
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        v1 = nil
        v2 = nil
        for k, n in j, v1, v2 do
            for m, i5 in getRecordFilterLabels(n) do
                v3[i5] = true
            end
        end
    end
    for i6 in v3 do
        table.insert(v4, i6)
    end
    table.sort(v4)
    return v4
end

local function hasActiveFilters(a1) -- Line: 172 -- types: a1: table
    for i, j in a1 do
        if j then
            return true
        end
    end
    return false
end

local function recordMatchesFilters(a1, a2) -- Line: 182 -- upvalues: getRecordFilterLabels (val) -- types: a2: table
    for i, j in a2 do
        if j then
            if false then
                return true
            end
            for k, n in getRecordFilterLabels(a1) do
                if a2[n] then
                    return true
                end
            end
            return false
        end
    end
    if true then
        return true
    end
    for m, i5 in getRecordFilterLabels(a1) do
        if a2[i5] then
            return true
        end
    end
    return false
end

local function filterMissionRecords(a1, a2) -- Line: 199
    -- upvalues: getRecordFilterLabels (val)
    local v1, v2, v3
    local v4 = nil
    local v5 = nil
    for i, j in a2, v4, v5 do
        if j then
            if false then
                return a1
            end
            v2 = {}
            v4 = nil
            v5 = nil
            v1 = a2
            for k, n in a1, v4, v5 do
                for m, i5 in v1 do
                    if i5 then
                        if true then
                            for i6, i7 in getRecordFilterLabels(n) do
                                if v1[i7] then
                                    if true then
                                        table.insert(v2, n)
                                    end
                                    -- [[ incomplete: control flow could not be represented ]]
                                end
                            end
                            v3 = false
                        else
                            v3 = true
                        end
                        if v3 then
                            table.insert(v2, n)
                        end
                        break
                    end
                end
                if false then
                    for i8, i9 in getRecordFilterLabels(n) do
                        if v1[i9] then
                            if true then
                                table.insert(v2, n)
                            end
                            break
                        end
                    end
                    v3 = false
                else
                    v3 = true
                end
                if v3 then
                    table.insert(v2, n)
                end
            end
            return v2
        end
    end
    if true then
        return a1
    end
    v2 = {}
    v4 = nil
    v5 = nil
    v1 = a2
    for i10, i11 in a1, v4, v5 do
        for i12, i13 in v1 do
            if i13 then
                if true then
                    for i14, i15 in getRecordFilterLabels(i11) do
                        if v1[i15] then
                            if true then
                                table.insert(v2, i11)
                            end
                            -- [[ incomplete: control flow could not be represented ]]
                        end
                    end
                    v3 = false
                else
                    v3 = true
                end
                if v3 then
                    table.insert(v2, i11)
                end
                break
            end
        end
        if false then
            for i16, i17 in getRecordFilterLabels(i11) do
                if v1[i17] then
                    if true then
                        table.insert(v2, i11)
                    end
                    break
                end
            end
            v3 = false
        else
            v3 = true
        end
        if v3 then
            table.insert(v2, i11)
        end
    end
    return v2
end

local function selectedMissionView(a1) -- Line: 217
    -- upvalues: ClientAdapter (val), createElement (val), ActionButton (val), QuestObjectivesCard (val)
    -- upvalues: QuestProgressSummary (val), Comma (val), QuestRewardsPanel (val), textStroke (val)
    local current_2, kind
    local Record = a1.Record
    local IsAvailableMission = a1.IsAvailableMission
    local OnStartMission = a1.OnStartMission
    local OnClaimQuest = a1.OnClaimQuest
    local OnPurchaseMission = a1.OnPurchaseMission
    local OnSkipMission = a1.OnSkipMission
    local OnReturn = a1.OnReturn
    local IsMobile = a1.IsMobile
    local v1 = ClientAdapter.getProgress(Record)
    local v2 = ClientAdapter.getQuestAction(Record, {groupName = "missions", isAvailableMission = IsAvailableMission})
    if not v2 then
        kind = nil
    else
        kind = v2.kind
        if not kind then
            kind = nil
        end
    end
    local v3 = 0
    local v4 = #Record.quest.objectives
    for i, j in Record.quest.objectives do
        current_2 = j.current
        if j.amount <= current_2 then
            v3 = v3 + 1
        end
    end
    local v5 = v3
    local v6 = math.max(v4, 1)
    v3 = not IsAvailableMission
    if v3 then
        v3 = false
        if kind == "cancelMission" then
            v3 = false
            if Record.productId ~= nil then
                v3 = v1.currentObjectiveIndex < v1.totalObjectives
            end
        end
    end
    v4 = true
    if kind ~= "purchaseMission" then
        v4 = true
        if kind ~= "startMission" then
            v4 = v3
        end
    end
    local v7 = if not v3 then if not IsAvailableMission then "Start this mission?" else "Want to begin this mission?" else "Want to skip to the rewards?"

    local function purchase() -- Line: 255 -- upvalues: a1 (val), OnPurchaseMission (val), Record (val)
        if a1.Busy then
            return
        end
        OnPurchaseMission(Record.id, Record.quest.name, Record.price or 0)
    end

    local function skipToRewards() -- Line: 263 -- upvalues: a1 (val), OnSkipMission (val), Record (val)
        if a1.Busy then
            return
        end
        if OnSkipMission and Record.productId then
            OnSkipMission(Record.id, Record.productId, Record.quest.name)
        end
    end

    local function primaryAction() -- Line: 273
        -- upvalues: a1 (val), kind (val), OnClaimQuest (val), Record (val), OnStartMission (val)
        -- upvalues: OnPurchaseMission (val)
        if a1.Busy then
            return
        end
        if kind == "claim" then
            OnClaimQuest(Record.id)
            return
        end
        if kind == "startMission" then
            OnStartMission(Record.id)
            return
        end
        if kind == "purchaseMission" then
            if a1.Busy then
                return
            end
            OnPurchaseMission(Record.id, Record.quest.name, Record.price or 0)
        end
    end

    local v8 = {}
    if IsAvailableMission or kind == "cancelMission" then
        v8.ReturnButton = createElement(ActionButton, {
            Label = "Return",
            Variant = "danger",
            OnActivated = OnReturn,
            Position = UDim2.new(0.5, 0, 0.925, 0),
            Size = UDim2.new(0.62, 0, 0.095, 0),
        })
    elseif kind == "claim" then
        v8.ClaimButton = createElement(ActionButton, {
            Label = "Claim",
            Variant = "primary",
            Disabled = a1.Busy,
            OnActivated = primaryAction,
            Position = UDim2.new(0.5, 0, 0.925, 0),
            Size = UDim2.new(0.62, 0, 0.095, 0),
        })
    end
    local v9 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0.12, 0),
        Size = UDim2.new(1, 0, 0.86, 0),
    }
    local v10 = {
        MissionCard = createElement(QuestObjectivesCard, {
            ActiveObjectiveIndex = v1.currentObjectiveIndex,
            ActionChildren = v8,
            ObjectivesLabel = ("Objective (%*/%*)"):format(v5, v6),
            Record = Record,
            Title = Record.quest.name,
        }),
    }
    local v11 = createElement
    local v12 = QuestProgressSummary
    local v13 = {
        Description = v1.description or "",
        IsMobile = IsMobile,
        Label = ("Current Objective (%*/%*)"):format(v1.currentObjectiveIndex, v1.totalObjectives),
        Progress = v1.progress,
    }
    local v14 = ClientAdapter.getProgress(Record)
    v13.Value = ("(%*)"):format((("%*/%*"):format(Comma((math.min(v14.current, v14.amount))), (Comma(v14.amount)))))
    v10.ProgressSummary = v11(v12, v13)
    v10.RewardsPanel = createElement(QuestRewardsPanel, {
        Title = "Mission Completion Rewards",
        IsMobile = IsMobile,
        Rewards = Record.quest.rewards,
        TooltipKeyPrefix = ("SelectedMissionReward_%*"):format(Record.id),
    })
    v10.PurchasePromptLabel = if not v4 then nil else createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        TextSize = 20,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.new(0.645, 0, 0.86, 0),
        Size = UDim2.new(0.22, 0, 0.11, 0),
        Text = v7,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Center,
    }, {
        Stroke = textStroke({Transparency = 0.35, Color = Color3.fromRGB(0, 0, 0)}),
        TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 20, MinTextSize = if not IsMobile then 10 else 8}),
    })
    v10.PurchaseButton = if v3 then createElement(ActionButton, {
        Label = "0",
        LayoutOrder = 0,
        Variant = "purchase",
        Disabled = a1.Busy,
        OnActivated = skipToRewards,
        Position = UDim2.new(0.84, 0, 0.86, 0),
        ProductId = Record.productId,
        Size = UDim2.new(0.16, 0, 0.09, 0),
    }) else if kind == "purchaseMission" then createElement(ActionButton, {
        LayoutOrder = 0,
        Variant = "purchase",
        Disabled = a1.Busy,
        Label = Comma(Record.price or 0),
        OnActivated = primaryAction,
        Position = UDim2.new(0.84, 0, 0.86, 0),
        Size = UDim2.new(0.16, 0, 0.09, 0),
    }) else if kind ~= "startMission" then nil else createElement(ActionButton, {
        Label = "Start",
        LayoutOrder = 0,
        Variant = "primary",
        Disabled = a1.Busy,
        OnActivated = primaryAction,
        Position = UDim2.new(0.84, 0, 0.86, 0),
        Size = UDim2.new(0.16, 0, 0.09, 0),
    })
    return createElement("Frame", v9, v10)
end

local u79 = {adidas = "Adidas", evergreen = "Evergreen"}
local u80 = {evergreen = 1, adidas = 2}
local u81 = {[3594835461] = true, [3594835623] = true, [3594835830] = true}

local function hasText(a1, a2) -- Line: 409 -- types: a2: string
    if type(a1) ~= "string" then
        return false
    end
    return string.find(string.lower(a1), a2, 1, true) ~= nil
end

function valueContainsAdidas(a1, a2) -- Line: 417 -- upvalues: valueContainsAdidas (val) -- types: a2: number?
    local v1 = a2 or 0
    if v1 > 4 then
        return false
    end
    if if type(a1) == "string" then string.find(string.lower(a1), "adidas", 1, true) ~= nil else false then
        return true
    end
    if type(a1) ~= "table" then
        return false
    end
    for i, j in a1 do
        if valueContainsAdidas(i, v1 + 1) or valueContainsAdidas(j, v1 + 1) then
            return true
        end
    end
    return false
end

local function normalizeMissionSection(a1) -- Line: 444 -- types: a1: string
    local v1 = string.gsub(string.lower(a1), "%s+", "_")
    if string.find(v1, "adidas", 1, true) then
        return "adidas"
    end
    if v1 ~= "missions" and v1 ~= "mission" and v1 ~= "permanent" then
        return v1
    end
    return "evergreen"
end

local function getExplicitMissionSection(a1) -- Line: 457 -- upvalues: normalizeMissionSection (val)
    local v1
    local metadata = a1.quest.metadata or {}
    for i, j in {"missionSection", "missionCategory", "missionGroup", "section", "event", "eventName", "campaign"} do
        v1 = metadata[j]
        if type(v1) == "string" and v1 ~= "" then
            return (normalizeMissionSection(v1))
        end
    end
    return nil
end

local function getMissionSectionKey(a1) -- Line: 479
    -- upvalues: getExplicitMissionSection (val), valueContainsAdidas (val), u81 (val)
    local v1 = getExplicitMissionSection(a1)
    if v1 then
        return v1
    end
    if not valueContainsAdidas(a1.id)
        and not valueContainsAdidas(a1.source)
        and u81[a1.productId or 0] ~= true
        and not valueContainsAdidas(a1.quest.name)
        and not valueContainsAdidas(a1.quest.tags)
        and not valueContainsAdidas(a1.quest.metadata) then
        for i, j in a1.quest.objectives do
            if not valueContainsAdidas(j.type)
                and not valueContainsAdidas(j.description)
                and not valueContainsAdidas(j.filter) then
                continue
            end
            return "adidas"
        end
        return "evergreen"
    end
    return "adidas"
end

local function getMissionSectionTitle(a1) -- Line: 509 -- upvalues: u79 (val) -- types: a1: string
    local v1 = u79[a1]
    if v1 then
        return v1
    end
    return (string.gsub(string.gsub(a1, "_", " "), "(%a)([%w_']*)", function(a1, a2) -- Line: 516
        return (string.upper(a1)) .. string.lower(a2)
    end))
end

local function missionSectionHeader(a1) -- Line: 523
    -- upvalues: createElement (val), textStroke (val)
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
            Position = UDim2.new(0.025, 0, 0.5, 0),
            Size = UDim2.new(0.52, 0, 0.72, 0),
            Text = string.upper(a1.Title),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {Stroke = textStroke({Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0)})}),
    })
end

local function getMissionGridHeight(a1, a2, a3) -- Line: 555 -- types: a1: number, a2: number, a3: number
    if a1 <= 0 then
        return 70
    end
    local v1 = math.ceil(a1 / a3)
    return v1 * a2 + math.max(v1 - 1, 0) * 14
end

local function getMissionGridColumns(a1) -- Line: 568 -- types: a1: boolean?
    if a1 then
        return 3
    end
    return 4
end

local function MissionGrid(a1) -- Line: 576
    -- upvalues: useState (val), useBinding (val), u79 (val), getMissionSectionKey (val), ClientAdapter (val), u80 (val)
    -- upvalues: createElement (val), missionSectionHeader (val), MissionCard (val), useEffect (val), React (val)
    local v1, v2, v3
    local CurrentMissions = a1.CurrentMissions
    local AvailableMissions = a1.AvailableMissions
    local SelectedQuestId = a1.SelectedQuestId
    local SetSelectedQuestId = a1.SetSelectedQuestId
    local WindowProps = a1.WindowProps
    local IsFiltered = a1.IsFiltered
    local v4 = 1 / (if not (a1.IsMobile == true) then 4 else 3)
    local u495, u498 = useState(Vector2.zero)
    local v5, u504 = useBinding(UDim2.new())
    local v6 = if not (0 < u495.X) then 260 else math.max(math.floor(((u495.X - 40) * v4 - 16) / 0.7), 1)
    local u37 = {}
    local u511 = {}
    local u609 = 0

    local function getSection(a1) -- Line: 612 -- upvalues: u37 (val), u79 (upval), u511 (val) -- types: a1: string
        local v1 = u37[a1]
        if v1 then
            return v1
        end
        local v2 = {Key = a1}
        local v3 = u79[a1]
        v2.Title = if not v3 then string.gsub(string.gsub(a1, "_", " "), "(%a)([%w_']*)", function(a1, a2) -- Line: 516
            return (string.upper(a1)) .. string.lower(a2)
        end) else v3
        v2.Records = {}
        v1 = v2
        u37[a1] = v1
        table.insert(u511, v1)
        return v1
    end

    local function addRecord(a1, a2, a3, a4) -- Line: 628
        -- upvalues: getMissionSectionKey (upval), getSection (val), u609 (ref)
        table.insert(
            (getSection((getMissionSectionKey(a1)))).Records,
            {Record = a1, IsAvailableMission = a2, Locked = a3, RequiredText = a4}
        )
        u609 = u609 + 1
    end

    for i, j in CurrentMissions do
        table.insert((getSection((getMissionSectionKey(j)))).Records, {IsAvailableMission = false, Locked = false, Record = j})
        u609 = u609 + 1
    end
    local v7 = nil
    local v8 = nil
    for k, n in AvailableMissions, v7, v8 do
        v1 = ClientAdapter.getMissionLockText(n)
        v2 = v1 ~= nil
        table.insert(
            (getSection((getMissionSectionKey(n)))).Records,
            {IsAvailableMission = true, Record = n, Locked = v2, RequiredText = v1}
        )
        u609 = u609 + 1
    end
    local v9 = CurrentMissions[1] or AvailableMissions[1]
    while not IsFiltered do
        if not v9 or not (u609 < v3) then
            break
        end
        table.insert((getSection((getMissionSectionKey(v9)))).Records, {
            IsAvailableMission = true,
            Locked = true,
            RequiredText = "More missions coming soon",
            Record = v9,
        })
        u609 = u609 + 1
    end
    table.sort(u511, function(a1, a2) -- Line: 659 -- upvalues: u80 (upval)
        local v1 = u80[a1.Key] or 100
        local v2 = u80[a2.Key] or 100
        if v1 == v2 then
            return a1.Title < a2.Title
        end
        return v1 < v2
    end)
    v7 = {
        ListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            Padding = UDim.new(0, 18),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
    }
    v7.Padding = createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 0),
        PaddingLeft = UDim.new(0, 20),
        PaddingRight = UDim.new(0, 20),
        PaddingTop = UDim.new(0, 20),
    })
    local u517 = 56
    local v10 = 1
    if #u511 ~= 0 then
        local Record, Records_2, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22
        v1 = nil
        v2 = nil
        for m, i5 in u511, v1, v2 do
            Records_2 = i5.Records
            v11 = #Records_2
            if not (v11 <= 0) then
                v13 = math.ceil(v11 / v3)
                v12 = v13 * v6 + math.max(v13 - 1, 0) * 14
            else
                v12 = 70
            end
            v14 = {
                GridLayout = createElement("UIGridLayout", {
                    CellPadding = UDim2.fromOffset(16, 14),
                    CellSize = UDim2.new(v4, -16, 0, v6),
                    FillDirection = Enum.FillDirection.Horizontal,
                    FillDirectionMaxCells = v3,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                }),
            }
            v15 = {
                Layout = createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    Padding = UDim.new(0, 8),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                }),
            }
            v15.Header = missionSectionHeader({LayoutOrder = 1, Title = i5.Title})
            v15.Grid = createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0, v12),
            }, v14)
            v17 = nil
            v18 = nil
            for i6, i7 in Records_2, v17, v18 do
                Record = i7.Record
                v19 = ("Mission_%*_%*"):format(Record.id, i6)
                v20 = {Busy = WindowProps.Busy}
                v21 = ClientAdapter.isComplete(Record) and not ClientAdapter.isClaimable(Record)
                v20.CompletedOverlay = v21
                v20.IsAvailableMission = i7.IsAvailableMission
                v20.IsMobile = v22
                v20.LayoutOrder = i6
                v20.Locked = i7.Locked
                v20.OnCancelQuest = WindowProps.OnCancelQuest
                v20.OnClaimQuest = WindowProps.OnClaimQuest
                v20.OnPurchaseMission = WindowProps.OnPurchaseMission
                v20.OnSelected = SetSelectedQuestId
                v20.OnStartMission = WindowProps.OnStartMission
                v20.OnTrackQuest = WindowProps.OnTrackQuest
                v20.Record = Record
                v20.RequiredText = i7.RequiredText
                v20.Selected = SelectedQuestId == Record.id
                v20.TrackedQuestIds = WindowProps.TrackedQuestIds
                v20.TrackedQuestId = WindowProps.TrackedQuestId
                v14[v19] = (createElement(MissionCard, v20))
            end
            v16 = ("Section_%*"):format(i5.Key)
            v7[v16] = (createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = v10,
                Size = UDim2.new(1, 0, 0, v12 + 56),
            }, v15))
            u517 = u517 + v13
            if v10 < #u511 then
                u517 = u517 + 18
            end
            v10 = v10 + 1
        end
    else
        u517 = u517 + 70
        v7.Empty = createElement("TextLabel", {
            BackgroundTransparency = 0.9,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            TextScaled = true,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Size = UDim2.new(0.9704, 0, 0, 70),
            Text = if not IsFiltered then "No missions are available right now." else "No missions match the selected filters.",
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)})})
    end
    v2 = {u517}
    useEffect(function() -- Line: 796 -- upvalues: u504 (val), u517 (ref)
        u504(UDim2.fromOffset(0, (math.ceil(u517))))
    end, v2)
    local v23 = createElement
    v2 = {
        Active = true,
        AnchorPoint = Vector2.new(0.5, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.None,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BottomImage = "",
        CanvasSize = v5,
        ClipsDescendants = true,
        ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
        MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
        Position = UDim2.new(0.5, 0, 0.13, 0),
        Selectable = true,
        SelectionGroup = true,
        ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
        ScrollBarImageTransparency = 0.15,
        ScrollBarThickness = 4,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollingEnabled = true,
        Size = UDim2.new(0.96, 0, 0.85, 0),
        TopImage = "",
    }

    v2[React.Change.AbsoluteSize] = function(a1) -- Line: 822 -- upvalues: u495 (val), u498 (val) -- types: a1: userdata
        local AbsoluteSize = a1.AbsoluteSize
        if AbsoluteSize ~= u495 then
            u498(AbsoluteSize)
        end
    end

    v23 = v23("ScrollingFrame", v2, v7)
    return v23
end

return function(a1) -- Line: 831
    -- upvalues: useState (val), ClientAdapter (val), getFilterOptions (val), filterMissionRecords (val)
    -- upvalues: getSelectedRecord (val), selectedMissionView (val), createElement (val), MissionGrid (val), Event (val)
    -- upvalues: MissionFilterPanel (val)
    local v1, v2, v3, v4, v5
    local v6, u4 = useState(nil)
    local v7, u8 = useState({})
    local v8 = a1.IsMobile == true
    local v9 = ClientAdapter.getMissionRecords(a1.State)
    local v10 = ClientAdapter.getAvailableMissions(a1.State)
    local v11 = getFilterOptions(v9, v10)
    local v12 = filterMissionRecords(v9, v7)
    local v13 = filterMissionRecords(v10, v7)
    local v14 = v7
    local v15 = nil
    for i, j in v14, v15 do
        if j then
            v14, v15 = getSelectedRecord(v9, v10, v6)
            v1 = if not v14 then createElement(MissionGrid, {
                AvailableMissions = v13,
                CurrentMissions = v12,
                IsFiltered = true,
                IsMobile = v8,
                SelectedQuestId = v6,
                SetSelectedQuestId = u4,
                WindowProps = a1,
            }) else selectedMissionView({
                Busy = a1.Busy,
                IsAvailableMission = v15,
                IsMobile = v8,
                OnClaimQuest = a1.OnClaimQuest,
                OnPurchaseMission = a1.OnPurchaseMission,
                OnReturn = function() -- Line: 866 -- upvalues: u4 (val)
                    u4(nil)
                end,
                OnSkipMission = a1.OnSkipMission,
                OnStartMission = a1.OnStartMission,
                Record = v14,
            })
            v2 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 5,
                Size = UDim2.fromScale(1, 1),
            }
            v3 = {Content = v1}
            if a1.FiltersVisible ~= true then
                v4 = nil
            else
                v4 = createElement
                v5 = {
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 1),
                    Text = "",
                    ZIndex = 18,
                }
                v5[Event.Activated] = a1.OnDismissFilters
                v4 = v4("TextButton", v5)
            end
            v3.DismissFilters = v4
            v3.FilterPanel = createElement(MissionFilterPanel, {
                ActiveFilters = v7,
                Options = v11,
                Visible = a1.FiltersVisible == true,
                OnToggleFilter = function(a1) -- Line: 844 -- upvalues: u8 (val), u4 (val) -- types: a1: string
                    u8(function(a1_2) -- Line: 845 -- upvalues: a1 (val)
                        local v1 = table.clone(a1_2)
                        if v1[a1] then
                            v1[a1] = nil
                            return v1
                        end
                        v1[a1] = true
                        return v1
                    end)
                    u4(nil)
                end,
            })
            return createElement("Frame", v2, v3)
        end
    end
    v14, v15 = getSelectedRecord(v9, v10, v6)
    v1 = if not v14 then createElement(MissionGrid, {
        AvailableMissions = v13,
        CurrentMissions = v12,
        IsFiltered = false,
        IsMobile = v8,
        SelectedQuestId = v6,
        SetSelectedQuestId = u4,
        WindowProps = a1,
    }) else selectedMissionView({
        Busy = a1.Busy,
        IsAvailableMission = v15,
        IsMobile = v8,
        OnClaimQuest = a1.OnClaimQuest,
        OnPurchaseMission = a1.OnPurchaseMission,
        OnReturn = function() -- Line: 866 -- upvalues: u4 (val)
            u4(nil)
        end,
        OnSkipMission = a1.OnSkipMission,
        OnStartMission = a1.OnStartMission,
        Record = v14,
    })
    v2 = {BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 5, Size = UDim2.fromScale(1, 1)}
    v3 = {Content = v1}
    if a1.FiltersVisible ~= true then
        v4 = nil
    else
        v4 = createElement
        v5 = {
            AutoButtonColor = false,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            Text = "",
            ZIndex = 18,
        }
        v5[Event.Activated] = a1.OnDismissFilters
        v4 = v4("TextButton", v5)
    end
    v3.DismissFilters = v4
    v3.FilterPanel = createElement(MissionFilterPanel, {
        ActiveFilters = v7,
        Options = v11,
        Visible = a1.FiltersVisible == true,
        OnToggleFilter = function(a1) -- Line: 844 -- upvalues: u8 (val), u4 (val) -- types: a1: string
            u8(function(a1_2) -- Line: 845 -- upvalues: a1 (val)
                local v1 = table.clone(a1_2)
                if v1[a1] then
                    v1[a1] = nil
                    return v1
                end
                v1[a1] = true
                return v1
            end)
            u4(nil)
        end,
    })
    return createElement("Frame", v2, v3)
end