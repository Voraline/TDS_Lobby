-- Script path: ReplicatedStorage.Packages.Lyra.hashMapRetry
-- Decompile time: 0.98 ms

local Promise = require(script.Parent.Promise)
require(script.Parent.Types)
local u10 = {
    "TotalRequestsOverLimit",
    "InternalError",
    "RequestThrottled",
    "PartitionRequestsOverLimit",
    "Throttled",
    "Timeout",
}
return function(a1) -- Line: 75 -- upvalues: Promise (val), u10 (val) -- types: a1: function
    local u1 = false
    return {
        promise = Promise.new(function(a1_2, a2) -- Line: 79 -- upvalues: u1 (ref), a1 (val), u10 (upval)
            local v1, v2
            local v3 = nil
            for i = 1, 5 do
                if i > 1 and not u1 then
                    task.wait(2 ^ (i - 1))
                end
                if u1 then
                    return a2("HashMap error: operation cancelled")
                end
                v1 = table.pack(pcall(a1))
                if v1[1] == true then
                    return v4(table.unpack(v1, 2))
                end
                v3 = v1[2]
                v2 = false
                for j, k in u10 do
                    if v3:find(k, 1, true) then
                        v2 = true
                        break
                    end
                end
                if not v2 then
                    return a2((("HashMap error: %*"):format(v3)))
                end
            end
            if u1 then
                return a2("HashMap error: operation cancelled")
            end
            return a2((("HashMap error: too many retries (%*). Last error: %*"):format(5, v3)))
        end),
        cancel = function() -- Line: 128 -- upvalues: u1 (ref)
            u1 = true
        end,
    }
end