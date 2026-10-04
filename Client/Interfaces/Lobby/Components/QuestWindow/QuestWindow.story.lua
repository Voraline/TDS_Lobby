-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.QuestWindow.story
-- Decompile time: 15.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ClientAdapter = require(ReplicatedStorage.Shared.Data.Quests.ClientAdapter)
local Parent = require(script.Parent)
local Quests = require(ReplicatedStorage.Shared.Data.Quests)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Tome = require(ReplicatedStorage.Shared.Tome)
local Tooltips = require(ReplicatedStorage.Client.Interfaces.Universal.Views.Tooltips)
local createElement = React.createElement
local useState = React.useState

local function quest(a1, a2, a3, a4, a5, a6, a7, a8) -- Line: 15 -- upvalues: Tome (val), Quests (val)
    local v1, v2, v3, v4
    local description = Tome.create().name(a1).description
    local v5 = description(a6 or ("Complete %*."):format(a1)).withCategory(a2).objective({
        id = "objective",
        type = "story",
        order = 1,
        amount = a5 or 10,
        description = a6 or ("Make progress on %*."):format(a1),
    })
    local v6 = a7 or 1
    local v7, v8 = a6, a1
    for i = 2, v6 do
        v5 = v5.objective({
            type = "story",
            amount = 1,
            id = ("objective_%*"):format(i),
            description = v7 or ("Make progress on %*."):format(v8),
            order = i,
        })
    end
    local v9 = {type = "currency", currency = "coins", amount = 250}
    v5 = v5.reward(v9).reward(v9)
    v6 = Quests.createRecord(v5, {
        id = string.lower(string.gsub(v8, "%s+", "_")),
        category = v1,
        started = v2,
    })
    v6.progress.objectives.objective = v3 or 0
    local objective_3 = v6.progress.objectives.objective
    if v6.tome.objectives[1].amount <= objective_3 then
        for j, k in v6.tome.objectives do
            v6.progress.objectives[k.id] = k.amount
        end
        v6.progress.state = "COMPLETED"
    end
    if v4 then
        v6.progress = Tome.markRewardsClaimed(v6.tome, v6.progress)
    end
    return v6
end

local function mission(a1, a2, a3, a4, a5, a6, a7, a8) -- Line: 80 -- upvalues: quest (val)
    local v1 = a8 or {}
    local v2 = quest(a1, "missions", a3, a4, a5, a6, a7, v1.claimedRewards)
    if v1.id then
        v2.id = v1.id
        v2.tome.id = v1.id
    end
    for i, j in v2.tome.objectives do
        j.description = a6
        j.filter = {tower = a2}
    end
    for k, n in v1.progress or {} do
        v2.progress.objectives[k] = n
    end
    v2.price = v1.price
    v2.currency = v1.currency or "coins"
    v2.order = v1.order
    v2.productId = v1.productId
    return v2
end

local function createState() -- Line: 126 -- upvalues: Quests (val), quest (val), Tome (val), mission (val)
    local v1 = Quests.createData()
    local v2 = {}
    local ServerTimeNow = workspace:GetServerTimeNow()
    local v3 = ServerTimeNow + 14400 + 1920 + 12
    local v4 = ServerTimeNow + 172800 + 25200 + 1080 + 41
    local v5 = ServerTimeNow + 432000 + 39600 + 240 + 3
    v1.trackedQuestIds = {accelerator_lab = true, win_3_games = true, triumph_maps = true}
    v1.trackedQuestId = "win_3_games"
    v1.groups.daily = Quests.createGroup("daily")
    v1.groups.seasonal = Quests.createGroup("seasonal")
    v1.groups.weekly = Quests.createGroup("weekly")
    v1.groups.missions = Quests.createGroup("missions")
    v1.groups.daily.quests.win_3_games = quest("Win 3 Games", "daily", true, 2, 3)
    v1.groups.daily.quests.defeat_bosses = quest("Defeat Bosses", "daily", true, 6, 6)
    v1.groups.daily.quests.win_3_games.expires = v3
    v1.groups.daily.quests.defeat_bosses.expires = v3
    v1.groups.seasonal.quests.collect_snowflakes = quest("Collect Snowflakes", "seasonal", true, 4, 10, "Collect Snowflakes.")
    v1.groups.seasonal.quests.collect_snowflakes.expires = v4
    v1.groups.weekly.quests.triumph_maps = quest("Triumph Maps", "weekly", true, 8, 15)
    v1.groups.weekly.quests.triumph_maps.order = 1
    v1.groups.weekly.quests.triumph_maps.expires = v5
    local v6 = {type = "currency", currency = "coins", amount = 600}
    local v7 = Quests.createRecord((((((((Tome.create()).name("Accelerator Lab")).description("Run Lab drills with Accelerator.")).withCategory("weekly")).objectiveMode("PARALLEL")).objective({
        id = "damage",
        type = "quest_tower_match_damage",
        amount = 500000,
        description = "Deal 500,000 damage with Accelerator.",
        filter = {tower = "Accelerator"},
    })).objective({
        id = "kills",
        type = "quest_tower_match_kills",
        amount = 600,
        description = "Defeat 600 enemies with Accelerator.",
        filter = {tower = "Accelerator"},
    })).objective(v6).reward(v6).reward(v6), {id = "accelerator_lab", category = "weekly", order = 2, started = true})
    v7.expires = v5
    v1.groups.weekly.quests.accelerator_lab = v7
    local v8 = mission(
        "Frozen Impact",
        "Sledger",
        true,
        2,
        10,
        "Freeze 1200 Enemies with Sledger.",
        4,
        {order = 1, price = 1200, productId = 568633322, progress = {objective = 1, objective_2 = 2}}
    )
    v8.tome.objectives[1].amount = 1
    v8.tome.objectives[2].amount = 10
    v1.groups.missions.quests.frozen_impact = v8
    v6 = mission(
        "Signal Boost",
        "Commander",
        true,
        3,
        8,
        "Buff allies with Commander.",
        3,
        {order = 2, price = 900, productId = 568633322, progress = {objective_2 = 1}}
    )
    v1.groups.missions.quests.signal_boost = v6
    local v9 = mission(
        "Frozen Payday",
        "Sledger",
        true,
        10,
        10,
        "Freeze 1200 Enemies with Sledger.",
        4,
        {id = "frozen_payday_claimable", order = 3, price = 1200}
    )
    v1.groups.missions.quests.frozen_payday_claimable = v9
    local v10 = mission(
        "Frozen Impact",
        "Sledger",
        true,
        10,
        10,
        "Freeze 1200 Enemies with Sledger.",
        4,
        {claimedRewards = true, id = "frozen_impact_completed", order = 4, price = 1200}
    )
    v1.groups.missions.quests.frozen_impact_completed = v10
    table.insert(v2, (mission("Molten Cleanup", "Pyromancer", false, 0, 12, "Burn enemies with Pyromancer.", 3, {order = 4, price = 800})))
    table.insert(v2, (mission("Rocket Barrage", "Rocketeer", false, 0, 4, "Complete waves using Rocketeer.", 3, {order = 5, price = 1200})))
    table.insert(v2, (mission("Ranger Watch", "Ranger", false, 0, 6, "Defeat hidden enemies with Ranger.", 3, {order = 6, price = 700})))
    table.insert(
        v2,
        (mission("Minigunner Sweep", "Minigunner", false, 0, 15, "Deal damage with Minigunner.", 4, {order = 7, price = 1500}))
    )
    table.insert(v2, (mission("DJ Rotation", "DJ Booth", false, 0, 5, "Support towers with DJ Booth.", 3, {order = 8, price = 1000})))
    table.insert(
        v2,
        (mission("Do The Wave!", "Militant", false, 0, 3, "Deal damage with Militant.", 3, {order = 9, price = 525, productId = 3594835461}))
    )
    table.insert(
        v2,
        (mission(
            "Setup the Cones!",
            "Trapper",
            false,
            0,
            3,
            "Deal damage with Trapper.",
            3,
            {order = 10, price = 525, productId = 3594835623}
        ))
    )
    table.insert(v2, (mission(
        "What was that Ref?!",
        "Assassin",
        false,
        0,
        3,
        "Defeat enemies with Assassin.",
        3,
        {order = 11, price = 525, productId = 3594835830}
    )))
    local v11 = Quests.toClientState(v1, v2)
    local availableMissions = v11.availableMissions and v11.availableMissions[1]
    if availableMissions then
        table.insert(availableMissions.quest.rewards, {type = "tower", tower = "Sledger", skin = "Fallen"})
        availableMissions.locked = true
        availableMissions.lockReason = "MISSING_TOWER"
    end
    return v11
end

local function StoryApp() -- Line: 334
    -- upvalues: useState (val), createState (val), ClientAdapter (val), createElement (val), Parent (val)
    local u3, u4 = useState((createState()))
    return createElement(Parent, {
        Loaded = true,
        Scale = 0.9,
        Visible = true,
        Actions = {
            RequestState = function() -- Line: 338 -- upvalues: u3 (val)
                return u3
            end,
            ClearError = function() end,
            StartMission = function() -- Line: 342
                return true
            end,
            TrackQuest = function(a1) -- Line: 345 -- upvalues: u4 (val), ClientAdapter (upval) -- types: a1: string?
                u4(function(a1_2) -- Line: 346 -- upvalues: ClientAdapter (upval), a1 (val)
                    local v1 = table.clone(a1_2)
                    local v2 = ClientAdapter.getTrackedQuestIdSet(a1_2)
                    if not a1 then
                        v2 = {}
                    elseif not v2[a1] then
                        v2[a1] = true
                    else
                        v2[a1] = nil
                    end
                    local v3 = {}
                    for i in v2 do
                        table.insert(v3, i)
                    end
                    table.sort(v3)
                    v1.trackedQuestIds = v3
                    v1.trackedQuestId = v3[1]
                    return v1
                end)
                return true
            end,
            CancelQuest = function() -- Line: 373
                return true
            end,
            ClaimQuest = function(a1) -- Line: 376 -- upvalues: u4 (val) -- types: a1: string
                u4(function(a1_2) -- Line: 377 -- upvalues: a1 (val)
                    local v1, v2, v3, v4, v5
                    local v6 = table.clone(a1_2)
                    local v7 = table.clone(a1_2.groups)
                    v6.groups = v7
                    local v8 = nil
                    local v9 = nil
                    for i, j in a1_2.groups, v8, v9 do
                        v5 = table.clone(j)
                        v7[i] = v5
                        for k, n in j do
                            if n.id ~= a1 and n.quest.id ~= a1 then
                                continue
                            end
                            v1 = table.clone(n)
                            v2 = table.clone(n.quest)
                            v3 = {}
                            for m, i5 in n.quest.rewards do
                                v4 = table.clone(i5)
                                v4.claimed = true
                                v3[m] = v4
                            end
                            v2.rewards = v3
                            v1.quest = v2
                            v5[k] = v1
                            return v6
                        end
                    end
                    return a1_2
                end)
                return true
            end,
            PurchaseMission = function() -- Line: 411
                return true
            end,
        },
        State = u3,
        OnClose = function() end,
        OnPurchaseMission = function() end,
        OnSkipMission = function() end,
    })
end

return function(a1) -- Line: 430 -- upvalues: createElement (val), StoryApp (val), ReactRoblox (val), Tooltips (val)
    local v1 = createElement(StoryApp)
    local QuestWindowStoryTooltips = a1:FindFirstChild("QuestWindowStoryTooltips")
    if QuestWindowStoryTooltips then
        QuestWindowStoryTooltips:Destroy()
    end
    local Frame = Instance.new("Frame")
    Frame.Name = "QuestWindowStoryTooltips"
    Frame.BackgroundTransparency = 1
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.fromScale(0, 0)
    Frame.Size = UDim2.fromScale(1, 1)
    Frame.ZIndex = 10000
    Frame.Parent = a1
    local u30 = ReactRoblox.createRoot(a1)
    local u34 = ReactRoblox.createRoot(Frame)
    u30:render(v1)
    u34:render((createElement(Tooltips)))
    return function() -- Line: 452 -- upvalues: u30 (val), u34 (val), Frame (val)
        u30:unmount()
        u34:unmount()
        Frame:Destroy()
    end
end