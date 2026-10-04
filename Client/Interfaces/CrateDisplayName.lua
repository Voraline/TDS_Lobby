-- Script path: ReplicatedStorage.Client.Interfaces.CrateDisplayName
-- Decompile time: 1.06 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local u10 = {}

local function getExplicitDisplayName(a1) -- Line: 7
    if not a1 then
        return nil
    end
    local DisplayName = a1.DisplayName
    if type(DisplayName) == "string" and DisplayName ~= "" then
        return DisplayName
    end
    return nil
end

function u10.text(a1, a2) -- Line: 20 -- upvalues: Asset (val) -- types: a1: string?
    local v1
    if a2 then
        local DisplayName = a2.DisplayName
        v1 = if type(DisplayName) ~= "string" then nil else if DisplayName == "" then nil else DisplayName
    else
        v1 = nil
    end
    if v1 then
        return v1
    end
    if a1 then
        local v2 = Asset("NewCrates", a1)
        if v2 then
            local DisplayName_2 = v2.DisplayName
            v1 = if type(DisplayName_2) ~= "string" then nil else if DisplayName_2 == "" then nil else DisplayName_2
        else
            v1 = nil
        end
        if v1 then
            return v1
        end
    end
    return a1 or "Crate"
end

function u10.withSuffix(a1, a2) -- Line: 37 -- upvalues: u10 (val) -- types: a1: string?
    local v1
    if a2 then
        local DisplayName = a2.DisplayName
        v1 = if type(DisplayName) ~= "string" then nil else if DisplayName == "" then nil else DisplayName
    else
        v1 = nil
    end
    if v1 then
        return v1
    end
    local v2 = u10.text(a1, a2)
    if string.find(v2, "Crate", 1, true) then
        return v2
    end
    return (("%* Crate"):format(v2))
end

return u10