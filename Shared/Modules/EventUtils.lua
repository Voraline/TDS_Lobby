-- Script path: ReplicatedStorage.Shared.Modules.EventUtils
-- Decompile time: 0.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = require(script.Parent.Network)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
return {
    waitForNetworkPredicate = function(a1, a2, a3) -- Line: 7
        -- upvalues: Network (val), TypedPromise (val)
        local u6 = Network.Channel(a1)
        local u7 = nil
        local v1 = TypedPromise.new(function(a1, a2_2) -- Line: 15 -- upvalues: u7 (ref), u6 (val), a2 (val), a3 (val)
            local u2 = false
            u7 = u6:On(a2, function(...) -- Line: 17 -- upvalues: a3 (upval), u2 (ref)
                if a3(...) then
                    u2 = true
                end
            end)
            while not u2 do
                task.wait()
            end
            a1()
        end)
        v1:finally(function() -- Line: 29 -- upvalues: u7 (ref)
            if u7 then
                u7()
            end
        end)
        return v1
    end,
}