-- Script path: ReplicatedStorage.Content.Tower.DJ Booth.UpgradeOptions
-- Decompile time: 0.40 ms

return {
    {
        Name = "Track",
        Icon = 78057132346559,
        Default = "Purple",
        Values = {
            {
                Name = "Purple",
                Icon = 78057132346559,
                Level = 0,
                Value = "Purple",
                Tooltip = {
                    Header = "Purple Track",
                    Subject = "Buff",
                    Content = {
                        {Text = "Passive: Applies a range buff to nearby towers."},
                        {Text = "Active: Pushback and slow enemies in range."},
                    },
                },
            },
            {
                Name = "Green",
                Icon = 135909664575578,
                Level = 0,
                Value = "Green",
                Tooltip = {
                    Header = "Green Track",
                    Subject = "Buff",
                    Content = {
                        {Text = "Passive: Applies a discount buff to nearby towers."},
                        {
                            Text = "Active: Earn a cash payout that scales with the number of towers in range.",
                        },
                    },
                },
            },
            {
                Name = "Red",
                Icon = 124149992110066,
                Level = 2,
                Value = "Red",
                Tooltip = {
                    Header = "Red Track",
                    Subject = "Buff",
                    Content = {
                        {Text = "Passive: Applies a damage buff to nearby towers."},
                        {Text = "Active: Deal damage and apply defense melt to enemies in range."},
                    },
                },
            },
        },
    },
}