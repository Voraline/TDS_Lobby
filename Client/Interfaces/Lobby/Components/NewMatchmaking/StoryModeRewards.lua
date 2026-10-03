-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.StoryModeRewards
-- Decompile time: 1.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
require(script.Parent.MatchmakingModel)
local Chapters = NewNetwork.Channel("Chapters")
local u18 = {}
local v1 = {}

local function normalizeRewards(a1) -- Line: 21 -- types: a1: table
    local Name, Rarity_2, Type, v1, v2
    local v3 = {}
    local v4 = nil
    local v5 = nil
    for i, j in a1, v4, v5 do
        Name = j.Name
        Type = j.Type
        if type(Name) == "string" and Name ~= "" and type(Type) == "string" then
            Rarity_2 = if type(j.Rarity) ~= "string" then nil else j.Rarity
            v1 = #v3 + 1
            v3[v1] = {
                guaranteed = j.Guaranteed == true,
                id = ("%*:%*:%*:%*"):format(Type, if Type ~= "Experience" then Name else "EXP", Rarity_2 or "Guaranteed", i),
                name = v2,
                rarity = Rarity_2,
                rewardType = Type,
            }
        end
    end
    return v3
end

function v1.load(a1, a2) -- Line: 45
    -- upvalues: u18 (val), Chapters (val), normalizeRewards (val)
    local v1 = ("%*:%*"):format(a1, a2)
    local v2 = u18[v1]
    if v2 then
        return v2
    end
    local v3 = Chapters:invokeServer("GetMissionRewards", a1, a2)
    if type(v3) ~= "table" then
        error((("Mission rewards were unavailable for chapter %*, mission %*"):format(a1, a2)))
    end
    local v4 = normalizeRewards(v3)
    u18[v1] = v4
    return v4
end

return v1