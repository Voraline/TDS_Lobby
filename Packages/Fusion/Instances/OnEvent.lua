-- Script path: ReplicatedStorage.Packages.Fusion.Instances.OnEvent
-- Decompile time: 0.47 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
local logError = require(Parent.Logging.logError)

local function getProperty_unsafe(a1, a2) -- Line: 12 -- types: a1: userdata, a2: string
    return a1[a2]
end

return function(a1) -- Line: 16 -- upvalues: getProperty_unsafe (val), logError (val) -- types: a1: string
    return {
        type = "SpecialKey",
        kind = "OnEvent",
        stage = "observer",
        apply = function(a1_2, a2, a3, a4) -- Line: 22
            -- upvalues: getProperty_unsafe (upval), a1 (val), logError (upval)
            local instance = a3.instance
            local success, result = pcall(getProperty_unsafe, instance, a1)
            if success and typeof(result) == "RBXScriptSignal" then
                if typeof(a2) ~= "function" then
                    logError("invalidEventHandler", nil, a1)
                    return
                end
                table.insert(a4, (result:Connect(a2)))
                return
            end
            logError("cannotConnectEvent", nil, instance.ClassName, a1)
        end,
    }
end