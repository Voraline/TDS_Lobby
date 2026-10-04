-- Script path: ReplicatedStorage.Client.Modules.Replicators.StreamingReplicator
-- Decompile time: 1.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TagObserver = require(ReplicatedStorage.Shared.Modules.TagObserver)
local Assets = ReplicatedStorage:WaitForChild("Assets")
local v1 = {Tower = "Troops", Unit = "Units", Enemy = "NewEnemies", LegacyEnemy = "Enemies"}
local v2 = nil
local v3 = nil
for i, j in v1, v2, v3 do
    local u38 = Assets:FindFirstChild(j)
    local u33 = true
    if i ~= "Enemy" then
        u33 = i == "LegacyEnemy"
    end
    if not u38 then
        u38 = Instance.new("Folder")
        u38.Name = j
        u38.Parent = Assets
    end
    TagObserver(("%*_STREAM"):format((string.upper(i))), function(a1) -- Line: 24 -- upvalues: u33 (val), u38 (ref)
        if u33 then
            a1.Name = a1.Parent.Parent.Name
        end
        a1.Parent = u38
        return function() end
    end)
end
return nil