-- Script path: ReplicatedStorage.Packages.Lyra.Types
-- Decompile time: 0.44 ms

require(script.Parent.Log)
local t = require(script.Parent.Parent.t)
return {
    txInfoCheck = t.some(t.strictInterface({committedData = t.any}), t.strictInterface({committedData = t.any, txId = t.string, txPatch = t.any})),
    fileCheck = t.some(t.strictInterface({data = t.any}), t.strictInterface({shard = t.string, count = t.number})),
}