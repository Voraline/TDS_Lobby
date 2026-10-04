-- Script path: ReplicatedStorage.Shared.Data.Communication
-- Decompile time: 1.16 ms

local CommunicationConfig = require(script.Parent.CommunicationConfig)
local u5 = {
    Type = CommunicationConfig.Type,
    TypeOrder = CommunicationConfig.TypeOrder,
    TypeLabels = CommunicationConfig.TypeLabels,
    TypeIcons = CommunicationConfig.TypeIcons,
    TypeSounds = CommunicationConfig.TypeSounds,
    MarkerTypes = CommunicationConfig.MarkerTypes,
    SuggestionTTL = CommunicationConfig.SuggestionTTL,
    TypeCooldown = CommunicationConfig.TypeCooldown,
    BurstWindow = CommunicationConfig.BurstWindow,
    BurstLimit = CommunicationConfig.BurstLimit,
    Palette = CommunicationConfig.Palette,
}

function u5.isValidType(a1) -- Line: 17 -- upvalues: u5 (val) -- types: a1: string
    for i, j in u5.TypeOrder do
        if j == a1 then
            return true
        end
    end
    return false
end

function u5.isMarkerType(a1) -- Line: 27 -- upvalues: u5 (val) -- types: a1: string
    return u5.MarkerTypes[a1] == true
end

function u5.getTypeLabel(a1) -- Line: 31 -- upvalues: u5 (val) -- types: a1: string
    return u5.TypeLabels[a1] or "Suggestion"
end

function u5.getTypeIcon(a1) -- Line: 35 -- upvalues: u5 (val) -- types: a1: string
    return u5.TypeIcons[a1]
end

function u5.getTypeSound(a1) -- Line: 39 -- upvalues: u5 (val) -- types: a1: string
    return u5.TypeSounds[a1]
end

function u5.getSuggestionTowerPingKey(a1) -- Line: 43 -- upvalues: u5 (val)
    if a1 and u5.isMarkerType(a1.type) then
        local data = a1.data or {}
        local towerUID = a1.towerUID or data.towerUID
        if typeof(towerUID) ~= "string" and typeof(towerUID) ~= "number" then
            return nil
        end
        if typeof(a1.targetUserId) ~= "number" then
            return nil
        end
        return (("%*:%*"):format(a1.targetUserId, towerUID))
    end
    return nil
end

function u5.getColor(a1) -- Line: 61 -- upvalues: u5 (val) -- types: a1: number?
    local Palette = u5.Palette
    return Palette[math.clamp(a1 or 1, 1, #Palette)]
end

function u5.getColorIndex(a1) -- Line: 68 -- upvalues: u5 (val) -- types: a1: number
    local Palette = u5.Palette
    return (math.max(a1, 1) - 1) % #Palette + 1
end

function u5.getLoadoutField(a1, a2) -- Line: 73 -- upvalues: CommunicationConfig (val) -- types: a1: boolean, a2: string
    local PVP = if not a1 then CommunicationConfig.LoadoutFields.Default else CommunicationConfig.LoadoutFields.PVP
    return PVP[a2]
end

return u5