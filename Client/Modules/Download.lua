-- Script path: ReplicatedStorage.Client.Modules.Download
-- Decompile time: 0.73 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = require(ReplicatedStorage.Shared.Modules.Network)
require(ReplicatedStorage.Shared.Modules.Utils.math)
require(ReplicatedStorage.Shared.Modules.Utils.table)
local Download = Network.Channel("Download")
return function(a1, a2) -- Line: 9 -- upvalues: ReplicatedStorage (val), Download (val)
    local v1 = ReplicatedStorage:FindFirstChild(a1)
    if not v1 then
        return
    end
    local v2 = v1:FindFirstChild(a2)
    if v2 then
        return v2
    end
    return Download:InvokeServer(a1, a2)
end