-- Script path: ReplicatedStorage.Content.Tower.Freezer.TowerInformation
-- Decompile time: 1.02 ms

return {
    ToolTip = {
        "A support tower focused on slowing down and freezing enemies to support the team.",
        "Capable of detecting hidden enemies.",
    },
    [0] = {
        ["Tower Ability"] = {
            {
                Header = "Frost Ray",
                Icon = 15686418975,
                Description = "Fires a projectile that chills and slows enemies.",
                Content = {
                    {Text = "Slow Percent on Hit: 7.5%"},
                    {Text = "Max Slow Percent: 15%"},
                    {Text = "Chill Duration: 2s"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Frost Ray",
                Icon = 15686418975,
                Description = "Fires a projectile that chills and slows enemies.",
                Content = {
                    {Text = "Slow Percent on Hit: 10%"},
                    {Text = "Max Slow Percent: 20%"},
                    {Text = "Chill Duration: 2s"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Frost Ray",
                Icon = 15686418975,
                Description = "Fires a projectile that builds chill to a slow freeze.",
                Content = {
                    {Text = "Slow Percent on Hit: 10%"},
                    {Text = "Max Slow Percent: 20%"},
                    {Text = "Chill Duration: 2s"},
                    {Text = "Freeze Duration: 0.5s"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Frost Ray",
                Icon = 15686418975,
                Description = "Fires a projectile that builds chill to a slow freeze.",
                Content = {
                    {Text = "Slow Percent on Hit: 12.5%"},
                    {Text = "Max Slow Percent: 25%"},
                    {Text = "Chill Damage: 3"},
                    {Text = "Damage Tick Rate: 1s"},
                    {Text = "Chill Duration: 3s"},
                    {Text = "Freeze Duration: 0.5s"},
                    {Text = "Burst: 5"},
                    {Text = "Burst Cooldown: 0.6s"},
                    {Text = "Defense Melt: 10"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Frost Ray",
                Icon = 15686418975,
                Description = "Fires a projectile that builds chill to a slow freeze.",
                Content = {
                    {Text = "Slow Percent on Hit: 12.5%"},
                    {Text = "Max Slow Percent: 25%"},
                    {Text = "Chill Damage: 5"},
                    {Text = "Damage Tick Rate: 1s"},
                    {Text = "Chill Duration: 3s"},
                    {Text = "Freeze Duration: 0.75s"},
                    {Text = "Burst: 7"},
                    {Text = "Burst Cooldown: 0.6s"},
                    {Text = "Defense Melt: 10"},
                },
            },
            {
                Header = "Frost Grenade",
                Icon = 15686418975,
                Description = "Throws a grenade that freezes enemies in an area on impact.",
                Content = {{Text = "Radius: 6"}, {Text = "Freeze Duration: 6s"}, {Text = "Max Hits: 5"}},
            },
        },
    },
}