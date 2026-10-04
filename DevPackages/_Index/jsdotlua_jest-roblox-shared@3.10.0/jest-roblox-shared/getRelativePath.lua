-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-roblox-shared@3.10.0.jest-roblox-shared.getRelativePath
-- Decompile time: 0.53 ms

return function(a1, a2) -- Line: 17 -- types: a1: userdata, a2: userdata?
    local Name = a1.Name
    local Parent = a1
    while Parent.Parent do
        if Parent == a2 then
            break
        end
        Parent = Parent.Parent
        Name = Parent.Name .. "/" .. Name
    end
    if a2 ~= nil then
        return Name
    end
    return "/" .. Name
end