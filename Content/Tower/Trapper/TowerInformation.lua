-- Script path: ReplicatedStorage.Content.Tower.Trapper.TowerInformation
-- Decompile time: 1.32 ms

return {
    ToolTip = {
        "A early game defensive tower that lays down traps. At later levels the tower can select from multiple traps to focus on AOE or stuns.",
        "Traps trigger on all enemies except for flying.",
    },
    [0] = {
        ["Tower Ability"] = {
            {
                Header = "Traps",
                Icon = 16493201931,
                Description = "Traps have a lifetime of 25s each, and a limit of 6.",
                Content = {{Text = ""}},
            },
        },
        ["Tower Options"] = {
            {
                Header = "Spike Trap",
                Icon = "Spike",
                Color = "rgb(255, 255, 255)",
                Content = {{Text = "Damage: 10"}, {Text = "Cooldown: 4s"}, {Text = "Health: 10"}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Traps",
                Icon = 16493201931,
                Description = "Traps have a lifetime of 25s each, and a limit of 6.",
                Content = {{Text = ""}},
            },
        },
        ["Tower Options"] = {
            {
                Header = "Spike Trap",
                Icon = "Spike",
                Color = "rgb(255, 255, 255)",
                Content = {{Text = "Damage: 20"}, {Text = "Cooldown: 4s"}, {Text = "Health: 20"}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Traps",
                Icon = 16493201931,
                Description = "Traps have a lifetime of 25s each, and a limit of 7.",
                Content = {{Text = ""}},
            },
        },
        ["Tower Options"] = {
            {
                Header = "Spike Trap",
                Icon = "Spike",
                Color = "rgb(255, 255, 255)",
                Content = {{Text = "Damage: 25"}, {Text = "Cooldown: 4s"}, {Text = "Health: 75"}},
            },
            {
                Header = "Landmine",
                Icon = "Landmine",
                Color = "rgb(255, 255, 255)",
                Content = {
                    {Text = "Damage: 50"},
                    {Text = "Cooldown: 4s"},
                    {Text = "Explosion Radius: 5"},
                    {Text = "Burn Damage: 5"},
                    {Text = "Burn Time: 1s"},
                    {Text = "Burn Tick Rate: 0.25s"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Traps",
                Icon = 16493201931,
                Description = "Traps have a lifetime of 25s each, and a limit of 9.",
                Content = {{Text = ""}},
            },
        },
        ["Tower Options"] = {
            {
                Header = "Spike Trap",
                Icon = "Spike",
                Color = "rgb(255, 255, 255)",
                Content = {{Text = "Damage: 45"}, {Text = "Cooldown: 3s"}, {Text = "Health: 225"}},
            },
            {
                Header = "Landmine",
                Icon = "Landmine",
                Color = "rgb(255, 255, 255)",
                Content = {
                    {Text = "Damage: 100"},
                    {Text = "Cooldown: 3s"},
                    {Text = "Explosion Radius: 5"},
                    {Text = "Burn Damage: 3"},
                    {Text = "Burn Time: 2s"},
                    {Text = "Burn Tick Rate: 0.25s"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Traps",
                Icon = 16493201931,
                Description = "Traps have a lifetime of 25s each, and a limit of 13.",
                Content = {{Text = ""}},
            },
        },
        ["Tower Options"] = {
            {
                Header = "Spike Trap",
                Icon = "Spike",
                Color = "rgb(255, 255, 255)",
                Content = {{Text = "Damage: 65"}, {Text = "Cooldown: 2.5s"}, {Text = "Health: 325"}},
            },
            {
                Header = "Landmine",
                Icon = "Landmine",
                Color = "rgb(255, 255, 255)",
                Content = {
                    {Text = "Damage: 160"},
                    {Text = "Cooldown: 2.5s"},
                    {Text = "Explosion Radius: 6"},
                    {Text = "Burn Damage: 4"},
                    {Text = "Burn Time: 5s"},
                    {Text = "Burn Tick Rate: 0.25s"},
                },
            },
            {
                Header = "Bear Trap",
                Icon = "BearTrap",
                Color = "rgb(255, 255, 255)",
                Content = {{Text = "Damage: 325"}, {Text = "Cooldown: 2.5s"}, {Text = "Stun Duration: 3s"}},
            },
        },
    },
}