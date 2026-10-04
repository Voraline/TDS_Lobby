-- Script path: ReplicatedStorage.Packages.LyraLegacy.dataStoreRetry
-- Decompile time: 0.73 ms

local Promise = require(script.Parent.Promise)
local u5 = {301, 302, 303, 304, 305, 306, 500, 501, 502, 503, 504, 505}
return function(a1) -- Line: 74 -- upvalues: Promise (val), u5 (val) -- types: a1: function
    return (Promise.new(function(a1_2, a2) -- Line: 75 -- upvalues: a1 (val), u5 (upval)
        local v1, v2, v3
        local v4 = nil
        for i = 1, 5 do
            if i > 1 then
                task.wait(2 ^ (i - 1))
            end
            v1 = table.pack(pcall(a1))
            if v1[1] == true then
                return v5(table.unpack(v1, 2))
            end
            v2 = v1[2]
            v3 = v2:match("^(%d+):")
            v3 = if not v3 then nil else tonumber(v3)
            if v3 ~= nil and table.find(u5, v3) then
                v4 = v2
                continue
            end
            return a2(v2)
        end
        return a2((("DataStore error: too many retries (%*). Last error: %*"):format(5, v4)))
    end))
end