-- Script path: ReplicatedStorage.Shared.Data.XmasGifts
-- Decompile time: 0.32 ms

local name, v1
require(script.Types)
local v2 = {}
for i, j in script.Templates:GetDescendants() do
    if j:IsA("ModuleScript") then
        v1 = require(j)
        name = v1.name or j.Name
        v2[name] = v1
    end
end
return v2