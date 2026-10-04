-- Script path: ReplicatedStorage.Client.Controllers.Shared.AudioLoaderController
-- Decompile time: 0.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sounds = require(ReplicatedStorage.Shared.Data.Sounds)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
task.spawn(function() -- Line: 6 -- upvalues: Sounds (val), Sound (val)
    for i, j in Sounds do
        Sound(i, j)
    end
end)
return nil