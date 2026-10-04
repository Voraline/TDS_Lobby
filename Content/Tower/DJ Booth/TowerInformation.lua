-- Script path: ReplicatedStorage.Content.Tower.DJ Booth.TowerInformation
-- Decompile time: 1.69 ms

return {
    ToolTip = {
        "A support tower that can switch tracks to provide either a range, discount, or damage buff to nearby towers.",
        "Later levels comes with an active skill that will change depending on what track is active.",
    },
    [0] = {
        ["Tower Options"] = {
            {
                Header = "Purple Track",
                Icon = "Purple",
                Color = "rgb(193, 69, 255)",
                Content = {{Text = "Boosts the tower's range by ${PurpleTrackBuffs.Range}%"}},
            },
            {
                Header = "Green Track",
                Icon = "Green",
                Color = "rgb(49, 255, 49)",
                Content = {{Text = "Reduces the tower's price by ${GreenTrackBuffs.Discount}%"}},
            },
        },
    },
    {
        ["Tower Options"] = {
            {
                Header = "Purple Track",
                Icon = "Purple",
                Color = "rgb(193, 69, 255)",
                Content = {{Text = "Boosts the tower's range by ${PurpleTrackBuffs.Range}%"}},
            },
            {
                Header = "Green Track",
                Icon = "Green",
                Color = "rgb(49, 255, 49)",
                Content = {{Text = "Reduces the tower's price by ${GreenTrackBuffs.Discount}%"}},
            },
        },
    },
    {
        ["Tower Options"] = {
            {
                Header = "Purple Track",
                Icon = "Purple",
                Color = "rgb(193, 69, 255)",
                Content = {{Text = "Boosts the tower's range by ${PurpleTrackBuffs.Range}%"}},
            },
            {
                Header = "Green Track",
                Icon = "Green",
                Color = "rgb(49, 255, 49)",
                Content = {{Text = "Reduces the tower's price by ${GreenTrackBuffs.Discount}%"}},
            },
            {
                Header = "Red Track",
                Icon = "Red",
                Color = "rgb(255, 65, 68)",
                Content = {{Text = "Increases the tower's damage by ${RedTrackBuffs.Damage}%"}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Drop The Beat",
                Icon = "Drop The Beat",
                Description = "Perform a powerful ability that differs based on what track is active. Scales with towers in range.",
                Content = {
                    {Text = "Cooldown: 30s"},
                    {Text = "Initial Cooldown: 10s"},
                    {
                        Text = "<font size=\"18\" color=\"rgb(193, 69, 255)\">Purple</font> Knockback force of 20 and apply a 25% slowness debuff to enemies in range. Gain 1% slow debuff per tower in range.",
                    },
                    {
                        Text = "<font size=\"18\" color=\"rgb(49, 255, 49)\">Green</font> Gain 250 base cash plus 35 per tower in range.",
                    },
                    {
                        Text = "<font size=\"18\" color=\"rgb(255, 65, 68)\">Red</font> Deal damage and 2% defense melt to enemies in range. Gain 0.25% defense melt per tower in range. Caps out at 10% defense melt.",
                    },
                },
            },
        },
        ["Tower Options"] = {
            {
                Header = "Purple Track",
                Icon = "Purple",
                Color = "rgb(193, 69, 255)",
                Content = {{Text = "Boosts the tower's range by ${PurpleTrackBuffs.Range}%"}},
            },
            {
                Header = "Green Track",
                Icon = "Green",
                Color = "rgb(49, 255, 49)",
                Content = {{Text = "Reduces the tower's price by ${GreenTrackBuffs.Discount}%"}},
            },
            {
                Header = "Red Track",
                Icon = "Red",
                Color = "rgb(255, 65, 68)",
                Content = {{Text = "Increases the tower's damage by ${RedTrackBuffs.Damage}%"}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Drop The Beat",
                Icon = "Drop The Beat",
                Description = "Perform a powerful ability that differs based on what track is active. Scales with towers in range.",
                Content = {
                    {Text = "Cooldown: 30s"},
                    {Text = "Initial Cooldown: 10s"},
                    {
                        Text = "<font size=\"18\" color=\"rgb(193, 69, 255)\">Purple</font> Knockback force of 20 and apply a 30% slowness debuff to enemies in range. Gain 1% slow debuff per tower in range.",
                    },
                    {
                        Text = "<font size=\"18\" color=\"rgb(49, 255, 49)\">Green</font> Gain 500 base cash plus 50 per tower in range.",
                    },
                    {
                        Text = "<font size=\"18\" color=\"rgb(255, 65, 68)\">Red</font> Deal damage and 3% defense melt to enemies in range. Gain 0.25% defense melt per tower in range. Caps out at 12% defense melt.",
                    },
                },
            },
        },
        ["Tower Options"] = {
            {
                Header = "Purple Track",
                Icon = "Purple",
                Color = "rgb(193, 69, 255)",
                Content = {{Text = "Boosts the tower's range by ${PurpleTrackBuffs.Range}%"}},
            },
            {
                Header = "Green Track",
                Icon = "Green",
                Color = "rgb(49, 255, 49)",
                Content = {{Text = "Reduces the tower's price by ${GreenTrackBuffs.Discount}%"}},
            },
            {
                Header = "Red Track",
                Icon = "Red",
                Color = "rgb(255, 65, 68)",
                Content = {{Text = "Increases the tower's damage by ${RedTrackBuffs.Damage}%"}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Drop The Beat",
                Icon = "Drop The Beat",
                Description = "Perform a powerful ability that differs based on what track is active. Scales with towers in range.",
                Content = {
                    {Text = "Cooldown: 30s"},
                    {Text = "Initial Cooldown: 10s"},
                    {
                        Text = "<font size=\"18\" color=\"rgb(193, 69, 255)\">Purple</font> Knockback force of 20 and apply a 35% slowness debuff to enemies in range. Gain 1% slow debuff per tower in range.",
                    },
                    {
                        Text = "<font size=\"18\" color=\"rgb(49, 255, 49)\">Green</font> Gain 750 base cash plus 75 per tower in range.",
                    },
                    {
                        Text = "<font size=\"18\" color=\"rgb(255, 65, 68)\">Red</font> Deal damage and 5% defense melt to enemies in range. Gain 0.25% defense melt per tower in range. Caps out at 15% defense melt.",
                    },
                },
            },
        },
        ["Tower Options"] = {
            {
                Header = "Purple Track",
                Icon = "Purple",
                Color = "rgb(193, 69, 255)",
                Content = {
                    {Text = "Boosts the tower's range by ${PurpleTrackBuffs.Range}%"},
                    {Text = "Reduces the tower's price by ${PurpleTrackBuffs.Discount}%"},
                    {Text = "Increases the tower's damage by ${PurpleTrackBuffs.Damage}%"},
                },
            },
            {
                Header = "Green Track",
                Icon = "Green",
                Color = "rgb(49, 255, 49)",
                Content = {
                    {Text = "Boosts the tower's range by ${GreenTrackBuffs.Range}%"},
                    {Text = "Reduces the tower's price by ${GreenTrackBuffs.Discount}%"},
                    {Text = "Increases the tower's damage by ${GreenTrackBuffs.Damage}%"},
                },
            },
            {
                Header = "Red Track",
                Icon = "Red",
                Color = "rgb(255, 65, 68)",
                Content = {
                    {Text = "Boosts the tower's range by ${RedTrackBuffs.Range}%"},
                    {Text = "Reduces the tower's price by ${RedTrackBuffs.Discount}%"},
                    {Text = "Increases the tower's damage by ${RedTrackBuffs.Damage}%"},
                },
            },
        },
    },
}