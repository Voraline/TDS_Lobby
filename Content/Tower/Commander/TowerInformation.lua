-- Script path: ReplicatedStorage.Content.Tower.Commander.TowerInformation
-- Decompile time: 1.17 ms

return {
    ToolTip = {
        "A support tower that provides passive attack speed buff to nearby towers. Can also use its active skill to provide a temporary massive buff to nearby towers.",
        "At final level also unlocks the ability to summon a caravan of friendly APC units.",
    },
    [0] = {
        ["Tower Ability"] = {
            {
                Header = "Cooldown Buff",
                Icon = 5525000768,
                Description = "Passively decreases the cooldown of towers in range by 10%.",
                Content = {{Text = ""}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Cooldown Buff",
                Icon = 5525000768,
                Description = "Passively decreases the cooldown of towers in range by 15%.",
                Content = {{Text = ""}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Cooldown Buff",
                Icon = 5525000768,
                Description = "Passively decreases the cooldown of towers in range by 15%.",
                Content = {{Text = ""}},
            },
            {
                Header = "Call to Arms",
                Icon = 4594880289,
                Description = "Temporarily decreases the cooldown of towers in range by an additional 10% for 10 seconds.",
                Content = {{Text = ""}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Cooldown Buff",
                Icon = 5525000768,
                Description = "Passively decreases the cooldown of towers in range by 17.5%.",
                Content = {{Text = ""}},
            },
            {
                Header = "Call to Arms",
                Icon = 4594880289,
                Description = "Temporarily decreases the cooldown of towers in range by an additional 15% for 10 seconds.",
                Content = {{Text = ""}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Cooldown Buff",
                Icon = 5525000768,
                Description = "Passively decreases the cooldown of towers in range by 20%.",
                Content = {{Text = ""}},
            },
            {
                Header = "Call to Arms",
                Icon = 4594880289,
                Description = "Temporarily decreases the cooldown of towers in range by an additional 20% for 10 seconds.",
                Content = {{Text = ""}},
            },
            {
                Header = "Support Caravan",
                Icon = 4594880289,
                Description = "Summons a caravan of 3 friendly APC units to assist in battle.",
                Content = {
                    {Text = "Cooldown: 60 seconds"},
                    {Text = "Costs: 2000 cash"},
                    {Text = "Gunner APC: A gunner APC that drives down the path and shoots at enemies."},
                    {Text = "Health: 200"},
                    {Text = "Speed: 4"},
                    {Text = "Damage: 7"},
                    {Text = "Range: 30"},
                    {Text = "Cooldown: 0.2s"},
                    {Text = "Detections: Hidden, Flying"},
                    {
                        Text = "Missile APC: A missile APC that drives down the path and shoots at enemies.",
                    },
                    {Text = "Health: 300"},
                    {Text = "Speed: 4"},
                    {Text = "Explosion Radius: 5"},
                    {Text = "Range: 25"},
                    {Text = "Cooldown: 2s"},
                    {Text = "Explosion Damage: 40"},
                    {Text = "Detections: Hidden, Lead"},
                },
            },
        },
    },
}