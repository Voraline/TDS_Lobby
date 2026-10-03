-- Script path: ReplicatedStorage.Client.Controllers.Shared.PostInitController
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Network).Channel("Ready"):FireServer("Ready")
return true