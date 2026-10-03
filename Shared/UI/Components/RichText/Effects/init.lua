-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects
-- Decompile time: 0.31 ms

local v1, v2
local v3 = {}
for i, v in ipairs(script:GetDescendants()) do
    if v:IsA("ModuleScript") then
        v1 = v.Name:lower()
        v2 = require(v)
        rawset(v3, v1, v2)
    end
end
return v3