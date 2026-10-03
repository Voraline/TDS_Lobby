-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.ItemPreview.Renderers
-- Decompile time: 0.24 ms

local u0 = {}
for i, v in ipairs(script:GetChildren()) do
    u0[v.Name] = (require(v))
end
return function(a1) -- Line: 8 -- upvalues: u0 (val)
    return u0[a1]
end