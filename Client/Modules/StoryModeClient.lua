-- Script path: ReplicatedStorage.Client.Modules.StoryModeClient
-- Decompile time: 0.81 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local StoryModeSerialization = require(ReplicatedStorage.Shared.Modules.StoryModeSerialization)
local Chapters = NewNetwork.Channel("Chapters")
return {
    getProgress = function() -- Line: 12 -- upvalues: StoryModeSerialization (val), Chapters (val)
        return StoryModeSerialization.deserialize(Chapters:invokeServer("GetProgress"))
    end,
    getPartyStoryAvailability = function() -- Line: 16 -- upvalues: StoryModeSerialization (val), Chapters (val)
        return StoryModeSerialization.deserializePartyAvailability(Chapters:invokeServer("GetPartyStoryAvailability"))
    end,
}