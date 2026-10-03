-- Script path: ReplicatedStorage.Client.Controllers.Shared.SettingsController
-- Decompile time: 0.16 ms

local Modules = script:WaitForChild("Modules")
return {
    Game = require(Modules:WaitForChild("Game")),
    User = require(Modules:WaitForChild("User")),
}