-- Script path: ReplicatedStorage.Packages.Fusion.Instances.isAccessible
-- Decompile time: 0.33 ms

local Parent
local u23 = {}
for i, v in ipairs({game, script, plugin}) do
    Parent = v
    while Parent.Parent ~= nil do
        Parent = Parent.Parent
    end
    u23[Parent] = true
end
return function(a1) -- Line: 35 -- upvalues: u23 (val) -- types: a1: userdata
    for k in pairs(u23) do
        if k:IsAncestorOf(a1) then
            return true
        end
    end
    return false
end