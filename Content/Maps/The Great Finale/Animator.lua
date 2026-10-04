-- Script path: ReplicatedStorage.Content.Maps.The Great Finale.Animator
-- Decompile time: 0.26 ms

game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
game:GetService("TweenService")
require(ReplicatedStorage.Shared.Modules.GameState)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
require(ReplicatedStorage.Client.Modules.Shaker)
Network.Channel("Map")
return function(a1, a2) end