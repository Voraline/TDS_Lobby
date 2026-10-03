-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useProductInfoMap
-- Decompile time: 1.56 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProductInfoCache = require(ReplicatedStorage.Shared.Modules.ProductInfoCache)
local React = require(ReplicatedStorage.Shared.UI.React)
local useState = React.useState
local useCallback = React.useCallback

local function getNonce() -- Line: 27 -- upvalues: HttpService (val)
    return HttpService:GenerateGUID(false)
end

return function() -- Line: 31
    -- upvalues: React (val), useState (val), getNonce (val), useCallback (val), ProductInfoCache (val)
    local u3 = React.useRef({})
    local u7 = React.useRef({})
    local v1, u11 = useState(getNonce)
    local v2 = useCallback(function(a1, a2) -- Line: 37
        -- upvalues: u7 (val), u3 (val), u11 (val), getNonce (upval), ProductInfoCache (upval)
        local current = u7.current
        local current_2 = u3.current
        if current[a2] and current[a2][a1] then
            return
        end
        if current_2[a2] and current_2[a2][a1] then
            return
        end
        if not current_2[a2] then
            current_2[a2] = {}
        end
        if not current[a2] then
            current[a2] = {}
        end
        task.defer(function() -- Line: 53
            -- upvalues: current_2 (val), a2 (val), a1 (val), u11 (upval), getNonce (upval), ProductInfoCache (upval)
            -- upvalues: current (val)
            local v1 = current_2[a2]
            v1[a1] = true
            u11(getNonce())
            ;((ProductInfoCache.getProductInfo(a1, a2)):andThen(function(a1_2) -- Line: 58 -- upvalues: current (upval), a2 (upval), a1 (upval)
                local v1 = current[a2]
                v1[a1] = a1_2
            end)):finally(function() -- Line: 61 -- upvalues: current_2 (upval), a2 (upval), a1 (upval), u11 (upval), getNonce (upval)
                local v1 = current_2[a2]
                v1[a1] = nil
                u11(getNonce())
            end)
        end)
    end, {})
    return v1, (useCallback(function(a1, a2) -- Line: 68 -- upvalues: u7 (val), u3 (val) -- types: a1: number
        local current = u7.current
        local current_2 = u3.current
        local v1 = current_2[a2] and current_2[a2][a1]
        local v2 = v1 == true
        v1 = current[a2] and current[a2][a1]
        return v2, v1
    end, {})), v2
end