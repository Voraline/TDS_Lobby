-- Script path: ReplicatedStorage.Packages.LyraLegacy.Files
-- Decompile time: 2.48 ms

local HttpService = game:GetService("HttpService")
require(script.Parent.Types)
local Promise = require(script.Parent.Promise)
local Tables = require(script.Parent.Tables)
local dataStoreRetry = require(script.Parent.dataStoreRetry)

local function splitString(a1, a2) -- Line: 44 -- types: a1: string, a2: number
    local v1
    local v2 = {}
    for i = 1, (math.ceil(#a1 / a2)) do
        v1 = (i - 1) * a2 + 1
        table.insert(v2, (string.sub(a1, v1, v1 + a2 - 1)))
    end
    return v2
end

return {
    isLargeFile = function(a1) -- Line: 62
        return a1.shard ~= nil
    end,
    write = function(a1) -- Line: 114
        -- upvalues: HttpService (val), Promise (val), splitString (val), Tables (val), dataStoreRetry (val)
        local v1 = HttpService:JSONEncode(a1.data)
        if #v1 <= a1.maxShardSize then
            return Promise.resolve({data = a1.data})
        end
        local v2 = splitString(HttpService:JSONEncode((buffer.fromstring(v1))), a1.maxShardSize)
        local u28 = HttpService:GenerateGUID(false)
        local u29 = {shard = u28}
        u29.count = #v2
        local v3 = Tables.map(v2, function(a1_2, a2) -- Line: 135 -- upvalues: u28 (val), dataStoreRetry (upval), a1 (val)
            local u7 = ("%*-%*"):format(u28, a2)
            return dataStoreRetry(function() -- Line: 138 -- upvalues: a1 (upval), u7 (val), a1_2 (val)
                return a1.store:SetAsync(u7, a1_2, a1.userIds)
            end)
        end)
        return (Promise.all(v3):andThenReturn(u29)):catch(function(a1) -- Line: 148 -- upvalues: Promise (upval), u29 (val)
            return Promise.reject({error = ("Failed to write file: %*"):format(a1), file = u29})
        end)
    end,
    read = function(a1) -- Line: 182 -- upvalues: Promise (val), dataStoreRetry (val), HttpService (val) -- types: a1: table
        if not (a1.file.shard ~= nil) then
            return Promise.resolve(a1.file.data)
        end
        local shard = a1.file.shard
        assert(shard, "Shard ID missing from large file object")
        local count = a1.file.count
        assert(count, "Shard count missing from large file object")
        local v1 = {}
        for i = 1, count do
            local u37 = ("%*-%*"):format(shard, i)
            table.insert(v1, (dataStoreRetry(function() -- Line: 202 -- upvalues: a1 (val), u37 (val)
                return a1.store:GetAsync(u37)
            end)))
        end
        return (Promise.all(v1)):andThen(function(a1) -- Line: 210 -- upvalues: count (val), Promise (upval), shard (val), HttpService (upval)
            for i = 1, count do
                if a1[i] == nil then
                    return Promise.reject((("Missing shard %* for file (shardId: %*)"):format(i, shard)))
                end
            end
            local success, result = pcall(function() -- Line: 221 -- upvalues: HttpService (upval), a1 (val)
                return HttpService:JSONDecode((table.concat(a1)))
            end)
            if not success then
                return Promise.reject((("Error decoding compressed file data (shardId: %*): %*"):format(shard, result)))
            end
            if typeof(result) ~= "buffer" then
                return Promise.reject((("Expected buffer after first decode, got %* (shardId: %*)"):format(typeof(result), shard)))
            end
            local success_2, result_2 = pcall(function() -- Line: 234 -- upvalues: HttpService (upval), result (val)
                return HttpService:JSONDecode((buffer.tostring(result)))
            end)
            if not success_2 then
                return Promise.reject((("Error decoding original file data (shardId: %*): %*"):format(shard, result_2)))
            end
            return result_2
        end)
    end,
}