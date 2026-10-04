-- Script path: ReplicatedStorage.Shared.UI.ItemPresentations
-- Decompile time: 0.39 ms

local Name, v1
local u32 = {}
for i, v in ipairs(script:GetDescendants()) do
    if v:IsA("ModuleScript") then
        Name = v.Parent.Name
        v1 = u32[Name]
        if not v1 then
            u32[Name] = {}
        end
        v1[v.Name] = (require(v))
    end
end
return function(a1, a2) -- Line: 17 -- upvalues: u32 (val)
    local v1 = u32[a1]
    if v1 then
        return v1[a2]
    end
end