-- Script path: ReplicatedStorage.Packages.Fusion.Instances.OnChange
-- Decompile time: 0.53 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
local logError = require(Parent.Logging.logError)
return function(a1) -- Line: 12 -- upvalues: logError (val) -- types: a1: string
    return {
        type = "SpecialKey",
        kind = "OnChange",
        stage = "observer",
        apply = function(a1_2, a2, a3, a4) -- Line: 18 -- upvalues: a1 (val), logError (upval) -- types: a1_2: table, a4: table
            local instance = a3.instance
            local success, result = pcall(instance.GetPropertyChangedSignal, instance, a1)
            if not success then
                logError("cannotConnectChange", nil, instance.ClassName, a1)
                return
            end
            if typeof(a2) ~= "function" then
                logError("invalidChangeHandler", nil, a1)
                return
            end
            table.insert(a4, (result:Connect(function() -- Line: 26 -- upvalues: a3 (val), a2 (val), a1 (upval)
                if a3.instance ~= nil then
                    a2(a3.instance[a1])
                end
            end)))
        end,
    }
end