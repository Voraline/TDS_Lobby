-- Script path: ReplicatedStorage.Shared.Modules.ElevatorConfig
-- Decompile time: 0.62 ms

local v1 = {}
local u33 = table.freeze({
    Easy = Color3.fromRGB(188, 255, 112),
    Casual = Color3.fromRGB(22, 199, 22),
    Intermediate = Color3.fromRGB(255, 124, 107),
    Molten = Color3.fromRGB(255, 223, 44),
    Fallen = Color3.fromRGB(160, 82, 255),
    Frost = Color3.fromRGB(103, 155, 240),
})

function v1.getGameModeColor(a1, a2) -- Line: 12 -- upvalues: u33 (val)
    if type(a2) ~= "string" then
        return nil
    end
    return u33[a2]
end

function v1.shouldVoteForMap(a1) -- Line: 20 -- types: a1: userdata
    local Attribute = a1:GetAttribute("Type")
    local v1 = false
    if a1:GetAttribute("Voting") == true then
        v1 = false
        if type(Attribute) == "string" then
            v1 = Attribute:lower() == "survival"
        end
    end
    return v1
end

return table.freeze(v1)