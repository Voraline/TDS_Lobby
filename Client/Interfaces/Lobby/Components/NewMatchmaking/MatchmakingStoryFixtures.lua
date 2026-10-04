-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.MatchmakingStoryFixtures
-- Decompile time: 11.19 ms

local MatchmakingModel = require(script.Parent.MatchmakingModel)
local StoryModeData = require(script.Parent.StoryModeData)
local v1 = {}
local u11 = {
    {guaranteed = true, id = "Currency:Coins:Guaranteed", name = "Coins", rewardType = "Currency"},
    {guaranteed = true, id = "Experience:EXP:Guaranteed", name = "EXP", rewardType = "Experience"},
    {
        guaranteed = false,
        id = "Consumable:Grenade:Common",
        name = "Grenade",
        rarity = "Common",
        rewardType = "Consumable",
    },
    {
        guaranteed = false,
        id = "Currency:Revive:Uncommon",
        name = "Revive",
        rarity = "Uncommon",
        rewardType = "Currency",
    },
    {
        guaranteed = false,
        id = "Crate:Low Grade:Rare",
        name = "Low Grade",
        rarity = "Rare",
        rewardType = "Crate",
    },
}
local u17 = {
    Survival = {
        intermediate = "Reach level 5 to unlock.",
        molten = "Reach level 15 to unlock.",
        fallen = "Reach level 30 to unlock.",
        frost = "Reach level 60 to unlock.",
        hardcore = "Reach level 50 to unlock.",
        voidcore = "Complete Hardcore to unlock.",
    },
    Story = {},
    PVP = {
        ["casual-1v1"] = "Reach level 25 to unlock.",
        ["casual-2v2"] = "Reach level 25 to unlock.",
        ["ranked-1v1"] = "Reach level 25 to unlock.",
        ["ranked-2v2"] = "Reach level 25 to unlock.",
    },
    Arcade = {
        ["pizza-party"] = "Reach level 25 to unlock.",
        ["badlands-ii"] = "Reach level 25 to unlock.",
        ["polluted-wasteland"] = "Reach level 50 to unlock.",
    },
    Sandbox = {
        ["sandbox-solo"] = "Reach level 250 or own the Admin Gamepass to unlock.",
        ["sandbox-duo"] = "Reach level 250 or own the Admin Gamepass to unlock.",
        ["sandbox-trio"] = "Reach level 250 or own the Admin Gamepass to unlock.",
        ["sandbox-quad"] = "Reach level 250 or own the Admin Gamepass to unlock.",
        ["sandbox-squads"] = "Purchase \"Admin Gamepass\" to unlock.",
        ["sandbox-mega"] = "Purchase \"Admin Gamepass\" to unlock.",
    },
}

local function cloneModeGroups(a1) -- Line: 89 -- upvalues: MatchmakingModel (val), u17 (val) -- types: a1: string
    local v1, v2, v3, v4, v5, v6
    local v7 = {}
    local v8 = nil
    local v9 = nil
    for i, j in MatchmakingModel.SECTION_ORDER, v8, v9 do
        v5 = MatchmakingModel.MODE_GROUPS[j]
        v6 = table.create(#v5)
        v1 = nil
        v2 = nil
        for k, n in v5, v1, v2 do
            v3 = table.clone(n)
            if a1 ~= "everything-unlocked" then
                v4 = u17[j][v3.id]
                v3.locked = v4 ~= nil
                v3.lockReason = v4
            else
                v3.locked = false
                v3.lockReason = nil
            end
            v6[k] = v3
        end
        v7[j] = v6
    end
    return v7
end

local function cloneStorySections(a1, a2) -- Line: 117 -- types: a1: string, a2: table
    local lockReason_2, lockReason_3, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
    local v11 = table.create(#a2)
    local v12 = nil
    local v13 = nil
    local v14, v15 = a1, a2
    for i, j in a2, v12, v13 do
        v9 = table.clone(j)
        v10 = table.create(#j.missions)
        v1 = table.create(#j.cutscenes)
        v2 = {}
        if v14 ~= "everything-unlocked" then
            v9.completedMissions = 0
            v9.locked = i ~= 1
            v9.lockReason = if not v9.locked then nil else j.lockReason or ("Complete %* to unlock."):format(v15[i - 1].title)
        else
            v9.locked = false
            v9.lockReason = nil
        end
        v4 = nil
        v5 = nil
        for k, n in j.missions, v4, v5 do
            v6 = table.clone(n)
            v7 = table.create(#n.rewards)
            for m, i5 in n.rewards do
                v7[m] = (table.clone(i5))
            end
            v6.rewards = v7
            v6.starRequirements = if not n.starRequirements then nil else table.clone(n.starRequirements)
            if v14 ~= "everything-unlocked" then
                v8 = true
                if i == 1 then
                    v8 = k ~= 1
                end
                v6.locked = v8
                if not v6.locked then
                    v6.lockReason = nil
                else
                    v8 = j.missions[k - 1]
                    lockReason_3 = n.lockReason or (if not v8 then v9.lockReason else ("Complete %* to unlock."):format(v8.title))
                    v6.lockReason = lockReason_3
                end
            else
                v6.locked = false
                v6.lockReason = nil
            end
            v10[k] = v6
            v2[v6.id] = v6
        end
        v4 = nil
        v5 = nil
        for i6, i7 in j.cutscenes, v4, v5 do
            v6 = table.clone(i7)
            if v14 ~= "everything-unlocked" then
                v7 = true
                if i == 1 then
                    v7 = v6.afterMission ~= 0
                end
                v6.locked = v7
                if not v6.locked then
                    v6.lockReason = nil
                else
                    v7 = j.missions[v6.afterMission]
                    lockReason_2 = i7.lockReason or (if not v7 then v9.lockReason else ("Complete %* to unlock."):format(v7.title))
                    v6.lockReason = lockReason_2
                end
            else
                v6.locked = false
                v6.lockReason = nil
            end
            v1[i6] = v6
            v2[v6.id] = v6
        end
        v3 = table.create(#j.entries)
        for i8, i9 in j.entries do
            v3[i8] = v2[i9.id]
        end
        v9.missions = v10
        v9.cutscenes = v1
        v9.entries = v3
        v11[i] = v9
    end
    return v11
end

function v1.withMockStoryRewards(a1) -- Line: 210 -- upvalues: u11 (val) -- types: a1: table
    local v1, v2, v3
    local v4 = table.create(#a1)
    local v5 = nil
    local v6 = nil
    for i, j in a1, v5, v6 do
        v2 = table.clone(j)
        v3 = table.create(#j.missions)
        for k, n in j.missions do
            v1 = table.clone(n)
            v1.rewards = u11
            v3[k] = v1
        end
        v2.missions = v3
        v4[i] = v2
    end
    return v4
end

function v1.get(a1, a2) -- Line: 232
    -- upvalues: cloneModeGroups (val), cloneStorySections (val), StoryModeData (val)
    return {
        modeGroups = cloneModeGroups(a1),
        storySections = cloneStorySections(a1, a2 or StoryModeData.getSections(nil)),
    }
end

return v1