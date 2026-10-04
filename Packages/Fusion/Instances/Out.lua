-- Script path: ReplicatedStorage.Packages.Fusion.Instances.Out
-- Decompile time: 0.76 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
local logError = require(Parent.Logging.logError)
local xtypeof = require(Parent.Utility.xtypeof)
return function(a1) -- Line: 13 -- upvalues: logError (val), xtypeof (val) -- types: a1: string
    return {
        type = "SpecialKey",
        kind = "Out",
        stage = "observer",
        apply = function(a1_2, a2, a3, a4) -- Line: 19
            -- upvalues: a1 (val), logError (upval), xtypeof (upval)
            local instance = a3.instance
            local success, result = pcall(instance.GetPropertyChangedSignal, instance, a1)
            if not success then
                logError("invalidOutProperty", nil, instance.ClassName, a1)
                return
            end
            if xtypeof(a2) == "State" and a2.kind == "Value" then
                a2:set(a3.instance[a1])
                table.insert(a4, (result:Connect(function() -- Line: 28 -- upvalues: a3 (val), a2 (val), a1 (upval)
                    if a3.instance ~= nil then
                        a2:set(a3.instance[a1])
                    end
                end)))
                table.insert(a4, function() -- Line: 33 -- upvalues: a2 (val)
                    a2:set(nil)
                end)
                return
            end
            logError("invalidOutType")
        end,
    }
end