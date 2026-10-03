-- Script path: ReplicatedStorage.Client.Controllers.Lobby.MedalLobbyMomentsController
-- Decompile time: 3.07 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local FFlagController = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
local MedalClipController = require(ReplicatedStorage.Client.Controllers.Shared.MedalClipController)
local u27 = {
    Legendary = 4,
    Golden = 5,
    Exclusive = 6,
    Event = 7,
    Ultimate = 9,
}
local u31 = FFlagController.get("medal.autoclipping.crate_skin_enabled", true)
local v1 = {}

local function getSkinInfo(a1, a2) -- Line: 23 -- upvalues: Asset (val) -- types: a1: string, a2: string
    local success, result = pcall(Asset, "Troops", a1)
    if success and result then
        local Properties = result.Properties
        local SkinData = Properties and Properties.SkinData
        return SkinData and SkinData[a2]
    end
    return nil
end

local function getSkinRarityName(a1, a2) -- Line: 35
    -- upvalues: Asset (val), Enum (val)
    local v1
    local success, result = pcall(Asset, "Troops", a1)
    if not success then
        v1 = nil
    elseif result then
        local Properties = result.Properties
        local SkinData = Properties and Properties.SkinData
        v1 = SkinData and SkinData[a2]
    else
        v1 = nil
    end
    if v1 and v1.Rarity then
        return Enum.SkinRarity.ToString(v1.Rarity)
    end
    return nil
end

local function normalizeSkinReward(a1) -- Line: 44 -- types: a1: table
    local Troop = a1.Troop or a1.tower
    local Skin = a1.Skin or a1.skin
    if Troop and Skin then
        local v1 = {}
        local Name = a1.Name or a1.crate
        v1.crate = Name
        v1.tower = Troop
        v1.skin = Skin
        return v1
    end
    return nil
end

local function findBestSkinReward(a1) -- Line: 59 -- upvalues: Asset (val), Enum (val), u27 (val)
    local Name, Properties, Skin, SkinData, Troop, result, skin, success, tower, v1, v2, v3, v4
    if type(a1) ~= "table" then
        return nil
    end
    local v5 = if not a1[1] then {a1} else a1
    local v6 = nil
    local v7 = 0
    local v8 = nil
    local v9 = nil
    for i, j in v5, v8, v9 do
        Troop = j.Troop or j.tower
        Skin = j.Skin or j.skin
        if not Troop then
            v4 = nil
        elseif Skin then
            v4 = {}
            Name = j.Name or j.crate
            v4.crate = Name
            v4.tower = Troop
            v4.skin = Skin
        else
            v4 = nil
        end
        if v4 then
            tower = v4.tower
            skin = v4.skin
            success, result = pcall(Asset, "Troops", tower)
            if not success then
                v3 = nil
            elseif result then
                Properties = result.Properties
                SkinData = Properties and Properties.SkinData
                v3 = SkinData and SkinData[skin]
            else
                v3 = nil
            end
            v1 = if not v3 then nil else if v3.Rarity then Enum.SkinRarity.ToString(v3.Rarity) else nil
            v2 = v1 and u27[v1]
            if v2 and v7 < v2 then
                v4.rarity = v1
                v6 = v4
            end
        end
    end
    return v6
end

local function trackCrateResults(a1, a2) -- Line: 87
    -- upvalues: u31 (val), findBestSkinReward (val), MedalClipController (val)
    if a1 == "skins" and u31() then
        local v1 = findBestSkinReward(a2)
        if not v1 then
            return false
        end
        return MedalClipController.TriggerClip("tds_rare_crate_skin", ("%* Skin Unboxed"):format(v1.rarity), {
            duration = 30,
            captureDelayMs = 4500,
            cooldown = 120,
            contextTags = {
                event = "crate_skin",
                crate = v1.crate,
                tower = v1.tower,
                skin = v1.skin,
                rarity = v1.rarity,
            },
        })
    end
    return false
end

function v1.TrackCrateResults(a1, a2) -- Line: 111 -- upvalues: trackCrateResults (val) -- types: a1: string
    local success, result = pcall(trackCrateResults, a1, a2)
    if success then
        return result
    end
    warn((("Medal crate clip tracking failed: %*"):format(result)))
    return false
end

return v1