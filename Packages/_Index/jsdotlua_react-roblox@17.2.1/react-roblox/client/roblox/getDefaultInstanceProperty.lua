-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.roblox.getDefaultInstanceProperty
-- Decompile time: 0.72 ms

local Nil = require(script.Parent.Parent.Parent.Parent:WaitForChild("shared")).Symbol.named("Nil")
local u15 = {}

local function tryPropertyName(a1, a2) -- Line: 32
    return a1[a2]
end

return function(a1, a2) -- Line: 36 -- upvalues: u15 (val), Nil (val), tryPropertyName (val)
    local result, success, v1
    local v2 = u15[a1]
    if not v2 then
        v2 = {}
        u15[a1] = v2
        v1 = Instance.new(a1)
        success, result = pcall(tryPropertyName, v1, a2)
        v1:Destroy()
        if success then
            if result == nil then
                v2[a2] = Nil
                return success, result
            end
            v2[a2] = result
        end
        return success, result
    end
    v1 = v2[a2]
    if v1 == Nil then
        return true, nil
    end
    if v1 ~= nil then
        return true, v1
    end
    v1 = Instance.new(a1)
    success, result = pcall(tryPropertyName, v1, a2)
    v1:Destroy()
    if success then
        if result == nil then
            v2[a2] = Nil
            return success, result
        end
        v2[a2] = result
    end
    return success, result
end