-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useCheckAdAvailability
-- Decompile time: 2.44 ms

local AdService = game:GetService("AdService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local u17 = require("./useFFlag")
local u20 = require("./useNewNetworkEvent")
local useEffect = React.useEffect
local useState = React.useState
return function(a1, a2) -- Line: 11
    -- upvalues: useState (val), u17 (val), u20 (val), useEffect (val), AdService (val)
    local v1, u5 = useState(false)
    local v2, u9 = useState(0)
    local u14 = u17("ads.enabled", true, {enabled = a2})
    u20("RobloxAds", "RecheckAdAvailability", function() -- Line: 16 -- upvalues: u9 (val)
        u9(function(a1) -- Line: 17
            return a1 + 1
        end)
    end)
    local v3 = {a1, a2, u14, v2}
    useEffect(function() -- Line: 22 -- upvalues: a2 (val), u14 (val), u5 (val), AdService (upval), a1 (val)
        if a2 and u14 then
            local u2 = true
            local u6 = task.delay(60, function() -- Line: 30 -- upvalues: AdService (upval), a1 (upval), u2 (ref), u5 (upval)
                local AdAvailabilityNowAsync = AdService:GetAdAvailabilityNowAsync(a1)
                if u2 then
                    u5(AdAvailabilityNowAsync.AdAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable)
                end
            end)
            return function() -- Line: 39 -- upvalues: u2 (ref), u6 (val)
                u2 = false
                if coroutine.status(u6) ~= "dead" then
                    task.cancel(u6)
                end
            end
        end
        u5(false)
    end, v3)
    return v1
end