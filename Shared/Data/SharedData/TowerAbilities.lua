-- Script path: ReplicatedStorage.Shared.Data.SharedData.TowerAbilities
-- Decompile time: 1.31 ms

local Abilities, Stats, Stats_2, v1, v2
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v3 = {}
for i, j in (require(ReplicatedStorage.Shared.Modules.Content)("Tower")):GetChildren() do
    Stats = j:FindFirstChild("Stats")
    if Stats then
        if Stats:IsA("ModuleScript") then
            Stats_2 = (require(Stats)).Stats
            v1 = nil
            v2 = nil
            for i6, i7 in Stats_2, v1, v2 do
                Abilities = i7.Defaults.Abilities
                if not Abilities then
                    break
                end
                for i8, i9 in Abilities do
                    if not table.find(v3, i9.Name) then
                        table.insert(v3, i9.Name)
                    end
                end
            end
        elseif Stats:IsA("Folder") and Stats:FindFirstChild("init") then
            Stats_2 = (require(Stats.init)).Stats
            v1 = nil
            v2 = nil
            for k, n in Stats_2, v1, v2 do
                Abilities = n.Defaults.Abilities
                if not Abilities then
                    break
                end
                for m, i5 in Abilities do
                    if not table.find(v3, i5.Name) then
                        table.insert(v3, i5.Name)
                    end
                end
            end
        end
    end
end
table.sort(v3, function(a1, a2) -- Line: 41
    return a1 < a2
end)
table.freeze(v3)
return v3