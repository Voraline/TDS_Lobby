-- Script path: ReplicatedStorage.Content.Tower.Trapper.UpgradeOptions
-- Decompile time: 0.32 ms

return {
    {
        Name = "Trap",
        Icon = 14606405886,
        Default = "Spike",
        Values = {
            {
                Name = "Spike",
                Icon = 16493201931,
                Level = 0,
                Value = "Spike",
                Tooltip = {
                    Header = "Spikes",
                    Subject = "Trap",
                    Content = {{Text = "Creates an obstacle that deals damage to enemies! Loses health on hit"}},
                },
            },
            {
                Name = "Landmine",
                Icon = 16493202350,
                Level = 2,
                Value = "Landmine",
                Tooltip = {
                    Header = "Landmine",
                    Subject = "Trap",
                    Content = {{Text = "Explodes on contact, deals AOE damage to enemies!"}},
                },
            },
            {
                Name = "Bear Traps",
                Icon = 16493202129,
                Level = 4,
                Value = "BearTrap",
                Tooltip = {
                    Header = "Bear Trap",
                    Subject = "Trap",
                    Content = {{Text = "Triggers on contact, stuns enemies and deals massive damage!"}},
                },
            },
        },
    },
}