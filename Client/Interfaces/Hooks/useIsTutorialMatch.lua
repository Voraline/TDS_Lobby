-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useIsTutorialMatch
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TutorialMatch = require(ReplicatedStorage.Shared.Modules.TutorialMatch)
local useGameStateValue = require(script.Parent.useGameStateValue)
return function() -- Line: 6 -- upvalues: useGameStateValue (val), TutorialMatch (val)
    return TutorialMatch(useGameStateValue("Tutorial", false), useGameStateValue("StoryChapter"), (useGameStateValue("GameMode", "")))
end