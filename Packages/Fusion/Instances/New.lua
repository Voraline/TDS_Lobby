-- Script path: ReplicatedStorage.Packages.Fusion.Instances.New
-- Decompile time: 0.55 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
local defaultProps = require(Parent.Instances.defaultProps)
local semiWeakRef = require(Parent.Instances.semiWeakRef)
local applyInstanceProps = require(Parent.Instances.applyInstanceProps)
local logError = require(Parent.Logging.logError)
return function(a1) -- Line: 15
    -- upvalues: logError (val), defaultProps (val), applyInstanceProps (val), semiWeakRef (val)
    return function(a1_2) -- Line: 16
        -- upvalues: a1 (val), logError (upval), defaultProps (upval), applyInstanceProps (upval), semiWeakRef (upval)
        local success, result = pcall(Instance.new, a1)
        if not success then
            logError("cannotCreateClass", nil, a1)
        end
        local v1 = defaultProps[a1]
        if v1 ~= nil then
            for k, v in pairs(v1) do
                result[k] = v
            end
        end
        applyInstanceProps(a1_2, semiWeakRef(result))
        return result
    end
end