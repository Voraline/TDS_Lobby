-- Script path: ReplicatedStorage.Packages.LyraLegacy.Transactions
-- Decompile time: 0.69 ms

local JsonPatch = require(script.Parent.JsonPatch)
require(script.Parent.Types)
local Promise = require(script.Parent.Promise)
local dataStoreRetry = require(script.Parent.dataStoreRetry)
local DataStoreGetOptions = Instance.new("DataStoreGetOptions")
DataStoreGetOptions.UseCache = false
return {
    readTx = function(a1) -- Line: 75
        -- upvalues: Promise (val), dataStoreRetry (val), DataStoreGetOptions (val), JsonPatch (val)
        local txInfo = a1.txInfo
        local txId = txInfo.txId
        if txId == nil then
            return Promise.resolve(txInfo.committedData)
        end
        return (dataStoreRetry(function() -- Line: 85 -- upvalues: a1 (val), txId (val), DataStoreGetOptions (upval)
            return a1.store:GetAsync(txId, DataStoreGetOptions)
        end)):andThen(function(a1) -- Line: 87 -- upvalues: txInfo (val), Promise (upval), txId (val), JsonPatch (upval)
            if a1 ~= nil then
                return txInfo.committedData
            end
            if txInfo.txPatch == nil then
                return Promise.reject((("Transaction '%*' is committed but has no patch"):format(txId)))
            end
            return JsonPatch.applyPatch(txInfo.committedData, txInfo.txPatch)
        end)
    end,
}