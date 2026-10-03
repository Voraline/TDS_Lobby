-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useContentEnemy
-- Decompile time: 0.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local React = require(ReplicatedStorage.Shared.UI.React)
local useEffect = React.useEffect
local useState = React.useState
local NewEnemies = Content("NewEnemies")
return function(a1) -- Line: 10 -- upvalues: useState (val), useEffect (val), NewEnemies (val)
    local v1, u3 = useState()
    local v2 = {a1}
    useEffect(function() -- Line: 13 -- upvalues: a1 (val), u3 (val), NewEnemies (upval)
        if a1 and a1.name ~= "" then
            local v1 = NewEnemies:FindFirstChild(a1.name)
            if not v1 then
                u3(nil)
                return
            end
            local Stats = v1:FindFirstChild("Stats")
            if Stats and Stats:IsA("ModuleScript") then
                local success, result = pcall(require, Stats)
                if success then
                    u3(result)
                    return
                end
                warn((("Failed to load enemy stats for %*: %*"):format(a1.name, result)))
                u3(nil)
                return
            end
            u3(nil)
            return
        end
        u3(nil)
    end, v2)
    return v1
end