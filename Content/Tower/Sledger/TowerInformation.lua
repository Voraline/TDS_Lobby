-- Script path: ReplicatedStorage.Content.Tower.Sledger.TowerInformation
-- Decompile time: 1.09 ms

return {
    ToolTip = {
        "A mid-game AOE melee tower that hits multiples enemies in an arc and is capable of slowing and freeze enemies.",
        "Capable of detecting lead enemies.",
    },
    [0] = {
        ["Tower Ability"] = {
            {
                Header = "Heavy Handed",
                Icon = 129569296351035,
                Description = "Hit multiple enemies in an arc and apply slow",
                Content = {
                    {Text = "Max Hits: 3"},
                    {Text = "Swing Angle: 60°"},
                    {Text = "Slow on Hit: 10%"},
                    {Text = "Max Slow: 30%"},
                    {Text = "Slow Duration: 4s"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Heavy Handed",
                Icon = 129569296351035,
                Description = "Hit multiple enemies in an arc and apply slow",
                Content = {
                    {Text = "Max Hits: 4"},
                    {Text = "Swing Angle: 60°"},
                    {Text = "Slow on Hit: 15%"},
                    {Text = "Max Slow: 30%"},
                    {Text = "Slow Duration: 4s"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Heavy Handed",
                Icon = 129569296351035,
                Description = "Hit multiple enemies in an arc and apply slow",
                Content = {
                    {Text = "Max Hits: 5"},
                    {Text = "Swing Angle: 60°"},
                    {Text = "Slow on Hit: 15%"},
                    {Text = "Max Slow: 30%"},
                    {Text = "Slow Duration: 4s"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Heavy Handed",
                Icon = 129569296351035,
                Description = "Hit multiple enemies in an arc and apply slow/freeze",
                Content = {
                    {Text = "Max Hits: 5"},
                    {Text = "Swing Angle: 60°"},
                    {Text = "Slow on Hit: 17.5%"},
                    {Text = "Max Slow: 35%"},
                    {Text = "Slow Duration: 4s"},
                    {Text = "Freeze Duration: 0.75s"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Heavy Handed",
                Icon = 129569296351035,
                Description = "Hit multiple enemies in an arc and apply slow/freeze",
                Content = {
                    {Text = "Max Hits: 5"},
                    {Text = "Swing Angle: 60°"},
                    {Text = "Slow on Hit: 17.5%"},
                    {Text = "Max Slow: 35%"},
                    {Text = "Slow Duration: 5s"},
                    {Text = "Freeze Duration: 0.75s"},
                },
            },
            {
                Header = "Ice Breaker",
                Icon = 87639607914634,
                Description = "Deal x2 damage to frozen and slowed enemies.",
                Content = {{Text = ""}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Heavy Handed",
                Icon = 129569296351035,
                Description = "Hit multiple enemies in an arc and apply freeze",
                Content = {
                    {Text = "Max Hits: 7"},
                    {Text = "Swing Angle: 60°"},
                    {Text = "Slow on Hit: 35%"},
                    {Text = "Max Slow: 35%"},
                    {Text = "Slow Duration: 5s"},
                    {Text = "Freeze Duration: 1s"},
                },
            },
            {
                Header = "Ice Breaker",
                Icon = 87639607914634,
                Description = "Deal x2 damage to frozen and slowed enemies.",
                Content = {{Text = ""}},
            },
            {
                Header = "Aftershock",
                Icon = 92990655062231,
                Description = "Creates an aftershock after the tower swings its hammer.",
                Content = {
                    {Text = "Aftershock Delay: 0.4s"},
                    {Text = "Applies 35% of base damage"},
                    {Text = "Applies slow"},
                },
            },
        },
    },
}