-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-roblox-shared@3.10.0.jest-roblox-shared.getDataModelService
-- Decompile time: 0.51 ms

return function(a1) -- Line: 2 -- types: a1: string
    local success, result = pcall(function() -- Line: 3 -- upvalues: a1 (val)
        local v1 = game:GetService(a1)
        local Name = v1.Name
        return v1
    end)
    return success and result or nil
end