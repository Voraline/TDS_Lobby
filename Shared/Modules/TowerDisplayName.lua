-- Script path: ReplicatedStorage.Shared.Modules.TowerDisplayName
-- Decompile time: 2.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Troops = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops)
local u12 = {}

local function getString(a1) -- Line: 7
    if type(a1) == "string" and a1 ~= "" then
        return a1
    end
    return nil
end

local function getStateValue(a1, a2) -- Line: 15 -- types: a2: string
    if not a1 then
        return nil
    end
    local v1 = a1[a2]
    if v1 ~= nil then
        return v1
    end
    local State = a1.State
    if State and State[a2] ~= nil then
        return State[a2]
    end
    local Replicator = a1.Replicator
    if Replicator and type(Replicator.Get) == "function" then
        local v2 = Replicator:Get(a2)
        if v2 ~= nil then
            return v2
        end
    end
    if type(a1.Get) == "function" then
        return a1:Get(a2)
    end
    return nil
end

local function getTowerName(a1, a2) -- Line: 45 -- upvalues: getStateValue (val) -- types: a1: string?
    local v1 = if type(a1) ~= "string" then nil else if a1 == "" then nil else a1
    if not v1 then
        local v2 = getStateValue(a2, "Name")
        v1 = if type(v2) ~= "string" then nil else if v2 == "" then nil else v2
        if not v1 then
            v2 = getStateValue(a2, "Type")
            v1 = if type(v2) ~= "string" then nil else if v2 == "" then nil else v2
            if not v1 then
                v2 = getStateValue(a2, "TowerName")
                if type(v2) == "string" and v2 ~= "" then
                    return v2
                end
                v1 = nil
            end
        end
    end
    return v1
end

local function getTowerSkin(a1, a2) -- Line: 52 -- upvalues: getStateValue (val) -- types: a2: userdata?
    local v1
    if not a2 then
        v1 = getStateValue(a1, "Skin")
        if type(v1) == "string" and v1 ~= "" then
            return v1
        end
        return nil
    end
    v1 = getStateValue(a1, "Skin")
    local v2 = if type(v1) ~= "string" then nil else if v1 == "" then nil else v1
    if not v2 then
        local Name = a2.Name
        if type(Name) == "string" and Name ~= "" then
            return Name
        end
        v2 = nil
    end
    return v2
end

function u12.fromAsset(a1, a2) -- Line: 60 -- upvalues: Troops (val) -- types: a1: string, a2: string?
    local v1 = Troops(a1)
    local Properties = v1 and v1.Properties
    local SkinData = Properties and Properties.SkinData
    local v2 = SkinData and a2 and SkinData[a2]
    local DisplayName = v2 and v2.DisplayName
    local v3 = if type(DisplayName) ~= "string" then nil else if DisplayName == "" then nil else DisplayName
    if not v3 then
        local DisplayName_2 = Properties and Properties.DisplayName
        v3 = (if type(DisplayName_2) ~= "string" then nil else if DisplayName_2 == "" then nil else DisplayName_2) or a1
    end
    return v3
end

function u12.resolve(a1, a2, a3) -- Line: 71
    -- upvalues: getTowerName (val), getStateValue (val), u12 (val)
    local v1 = getTowerName(a1, a2)
    if not v1 then
        return "Tower"
    end
    local v2 = getStateValue(a2, "DisplayName")
    local v3 = if type(v2) ~= "string" then nil else if v2 == "" then nil else v2
    if not v3 then
        local v4, v5
        local fromAsset = u12.fromAsset
        if not a3 then
            v5 = getStateValue(a2, "Skin")
            v4 = if type(v5) ~= "string" then nil else if v5 == "" then nil else v5
        else
            v5 = getStateValue(a2, "Skin")
            v4 = if type(v5) ~= "string" then nil else if v5 == "" then nil else v5
            if not v4 then
                local Name = a3.Name
                v4 = if type(Name) ~= "string" then nil else if Name == "" then nil else Name
            end
        end
        v3 = fromAsset(v1, v4)
    end
    return v3
end

return u12