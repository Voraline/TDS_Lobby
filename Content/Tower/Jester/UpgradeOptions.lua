-- Script path: ReplicatedStorage.Content.Tower.Jester.UpgradeOptions
-- Decompile time: 0.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {
    Header = "Fire",
    Subject = "Bomb",
    Content = {{Text = "Applies burn to enemies, dealing damage over time."}},
}
local v2 = {
    Header = "Freeze",
    Subject = "Bomb",
    Content = {{Text = "Applies slow to enemies, reducing their movement speed."}},
}
local v3 = {
    Header = "Poison",
    Subject = "Bomb",
    Content = {{Text = "Creates a pool of poison dealing damage over time."}},
}
local v4 = {
    Header = "Confusion",
    Subject = "Bomb",
    Content = {{Text = "Confuses enemies, causing them to walk backwards."}},
}
return {
    {
        Name = "Bomb 1",
        Icon = 15332760498,
        Default = (require(ReplicatedStorage.Shared.Modules.Enum)).JesterBomb.Fire,
        Values = {
            {
                Name = "Fire",
                Icon = 15332760498,
                Level = 0,
                Value = "Fire",
                Tooltip = v1,
            },
            {
                Name = "Ice",
                Icon = 15332760300,
                Level = 2,
                Value = "Ice",
                Tooltip = v2,
            },
            {
                Name = "Poison",
                Icon = 15332760148,
                Level = 3,
                Value = "Poison",
                Tooltip = v3,
            },
            {
                Name = "Confusion",
                Icon = 15332760639,
                Level = 4,
                Value = "Confusion",
                Tooltip = v4,
            },
        },
    },
    {
        Name = "Bomb 2",
        Icon = 15332760498,
        Values = {
            {
                Name = "Fire",
                Icon = 15332760498,
                Level = 4,
                Value = "Fire",
                Tooltip = v1,
            },
            {
                Name = "Ice",
                Icon = 15332760300,
                Level = 4,
                Value = "Ice",
                Tooltip = v2,
            },
            {
                Name = "Poison",
                Icon = 15332760148,
                Level = 4,
                Value = "Poison",
                Tooltip = v3,
            },
            {
                Name = "Confusion",
                Icon = 15332760639,
                Level = 4,
                Value = "Confusion",
                Tooltip = v4,
            },
        },
    },
}