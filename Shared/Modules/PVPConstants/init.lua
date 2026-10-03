-- Script path: ReplicatedStorage.Shared.Modules.PVPConstants
-- Decompile time: 2.19 ms

local GamemodeWaves
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local Content = require(script.Parent.Content)
local PVPRanks = require(script.PVPRanks)
local PVPSeasons = require(script.PVPSeasons)
local PVP = Content("Gamemodes"):WaitForChild("PVP")
local u32 = RunService:IsServer()
if not u32 then
    GamemodeWaves = nil
else
    GamemodeWaves = ServerStorage:FindFirstChild("GamemodeWaves")
    if not GamemodeWaves then
        GamemodeWaves = nil
    end
end

local function getPVPDifficulty(a1) -- Line: 20 -- upvalues: PVP (val) -- types: a1: string?
    if not a1 then
        a1 = "PVP_lowRanks"
    end
    local v1 = PVP.Difficulties:FindFirstChild(a1)
    assert(v1, (("Difficulty not found: %*"):format(a1)))
    return v1
end

local function getWaveData(a1) -- Line: 38 -- upvalues: PVP (val), u32 (val), GamemodeWaves (val) -- types: a1: string?
    local v1 = a1 or "PVP_lowRanks"
    local v2 = PVP.Difficulties:FindFirstChild(v1)
    assert(v2, (("Difficulty not found: %*"):format(v1)))
    local Waves = v2:FindFirstChild("Waves")
    if not Waves and u32 and GamemodeWaves then
        local PVP_2 = GamemodeWaves:FindFirstChild("PVP")
        local v3 = PVP_2 and PVP_2:FindFirstChild(v2.Name)
        Waves = v3 and v3:FindFirstChild("Waves")
    end
    if not Waves then
        return {ExtraOptions = {}}
    end
    return require(Waves)
end

return {
    RATING_PERIOD_LENGTH = 4,
    MATCHES_UNTIL_RANKED = 0,
    getPVPWaveData = getWaveData,
    getSpawnableEnemies = function(a1) -- Line: 30 -- upvalues: PVP (val) -- types: a1: string
        local v1 = a1 or "PVP_lowRanks"
        local v2 = PVP.Difficulties:FindFirstChild(v1)
        assert(v2, (("Difficulty not found: %*"):format(v1)))
        local SpawnableEnemies = v2:FindFirstChild("SpawnableEnemies")
        assert(SpawnableEnemies, (("SpawnableEnemies not found in %*"):format(a1)))
        return require(SpawnableEnemies)
    end,
    getWaveTime = function(a1) -- Line: 57 -- upvalues: getWaveData (val) -- types: a1: string?
        return getWaveData(a1).ExtraOptions.WaveTime or 40
    end,
    getLoadoutSize = function(a1) -- Line: 61 -- upvalues: getWaveData (val) -- types: a1: string?
        return getWaveData(a1).ExtraOptions.LoadoutSize or 4
    end,
    getConsumableLoadoutSize = function(a1) -- Line: 65 -- upvalues: getWaveData (val) -- types: a1: string?
        return getWaveData(a1).ExtraOptions.ConsumableLoadoutSize or 4
    end,
    getActiveSeason = function() -- Line: 69 -- upvalues: PVPSeasons (val)
        local ServerTimeNow = workspace:GetServerTimeNow()
        for k, v in pairs(PVPSeasons) do
            if v.startsAt
                and v.endsAt
                and v.startsAt.UnixTimestamp <= ServerTimeNow
                and ServerTimeNow <= v.endsAt.UnixTimestamp then
                return v
            end
        end
        return nil
    end,
    getLastSeason = function() -- Line: 85 -- upvalues: PVPSeasons (val)
        local v1 = {}
        for i, j in PVPSeasons do
            table.insert(v1, j)
        end
        table.sort(v1, function(a1, a2) -- Line: 92
            return a1.endsAt.UnixTimestamp < a2.endsAt.UnixTimestamp
        end)
        return v1[#v1]
    end,
    RANK_DATA = PVPRanks,
    SEASON_DATA = PVPSeasons,
    RANK_DIFFICULTIES = {
        PVP_lowRanks = NumberRange.new(0, 499),
        PVP_midRanks = NumberRange.new(500, 1799),
        PVP_highRanks = NumberRange.new(1800, (1 / 0)),
    },
    ARENA_IMAGES = {
        PVP_lowRanks = "rbxassetid://96068039844843",
        PVP_midRanks = "rbxassetid://111007445869339",
        PVP_highRanks = "rbxassetid://88240765692605",
    },
    ARENA_NAMES = {PVP_lowRanks = "Basic Arena", PVP_midRanks = "Molten Arena", PVP_highRanks = "Fallen Arena"},
}