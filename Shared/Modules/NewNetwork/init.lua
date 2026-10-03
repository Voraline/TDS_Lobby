-- Script path: ReplicatedStorage.Shared.Modules.NewNetwork
-- Decompile time: 0.20 ms

local RunService = game:GetService("RunService")
require(script.Types)
if RunService:IsServer() then
    return {Channel = require(script.ServerChannel).new}
end
return {Channel = require(script.ClientChannel).new}