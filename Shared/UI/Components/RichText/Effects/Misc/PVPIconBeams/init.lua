-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.PVPIconBeams
-- Decompile time: 0.65 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PVPConstants = require(ReplicatedStorage.Shared.Modules.PVPConstants)
local u10 = {}
u10.Private = require(script.Private)
u10.Sergeant = require(script.Sergeant)
u10.Lieutenant = require(script.Lieutenant)
u10.Major = require(script.Major)
u10.General = require(script.General)
return function(a1, a2) -- Line: 14 -- upvalues: PVPConstants (val), u10 (val) -- types: a1: userdata, a2: userdata
    local PVPRankIcon = a2:FindFirstChild("PVPRankIcon")
    if PVPRankIcon then
        PVPRankIcon:Destroy()
    end
    local Rank = a1:FindFirstChild("Rank")
    if Rank and Rank:IsA("IntValue") then
        local v1 = PVPConstants.RANK_DATA[tostring(Rank.Value)]
        if v1 and v1.Name then
            local v2 = u10[(v1.Name:split(" "))[1]]
            if v2 then
                local v3 = v2[1]:Clone()
                v3.Name = "PVPRankIcon"
                v3.Parent = a2
                return v3
            end
        end
    end
    return nil
end