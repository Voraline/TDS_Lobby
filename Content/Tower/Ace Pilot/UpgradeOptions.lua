-- Script path: ReplicatedStorage.Content.Tower.Ace Pilot.UpgradeOptions
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    {
        Name = "Flight Path",
        Icon = 17832618044,
        Default = Enum.AcePilotMode.Normal,
        Values = {
            {
                Name = "Default",
                Icon = 17832548233,
                Level = 0,
                Value = Enum.AcePilotMode.Normal,
            },
            {
                Name = "Figure8",
                Icon = 17858292405,
                Level = 2,
                Value = Enum.AcePilotMode.Figure8,
            },
        },
    },
}