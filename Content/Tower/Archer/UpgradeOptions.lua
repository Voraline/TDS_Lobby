-- Script path: ReplicatedStorage.Content.Tower.Archer.UpgradeOptions
-- Decompile time: 0.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    {
        Name = "ArrowType",
        Icon = 130381507989498,
        CoolDown = 10,
        Default = Enum.ArrowType.Normal,
        Values = {
            {
                Name = "Flame",
                Icon = 119109572019138,
                Level = 3,
                Value = Enum.ArrowType.Flame,
            },
            {
                Name = "Explosive",
                Icon = 107936780777670,
                Level = 4,
                Value = Enum.ArrowType.Explosive,
            },
            {
                Name = "Shock",
                Icon = 103509825924427,
                Level = 5,
                Value = Enum.ArrowType.Shock,
            },
        },
    },
}