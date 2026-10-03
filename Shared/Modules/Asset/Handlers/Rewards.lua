-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.Rewards
-- Decompile time: 0.46 ms

local Name, v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Utils.math)
require(ReplicatedStorage.Shared.Modules.Utils.table)
local u17 = {}
for k, v in pairs((ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Rewards")):GetChildren()) do
    Name = v.Name
    if Name then
        v1 = require(v)
        if v1 then
            u17[Name] = v1
        end
    end
end
return function(a1) -- Line: 25 -- upvalues: u17 (val)
    return not a1 and u17 or u17[a1]
end