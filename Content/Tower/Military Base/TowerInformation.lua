-- Script path: ReplicatedStorage.Content.Tower.Military Base.TowerInformation
-- Decompile time: 1.37 ms

return {
    ToolTip = {
        "A unit summoning tower that endlessly spawns friendly Humvees and tanks down the path. At later levels can also call in air-strikes on the path.",
        "Units are capable of detecting hidden enemies.",
    },
    [0] = {
        ["Tower Ability"] = {
            {
                Header = "Military Caravan",
                Icon = 3877873543,
                Description = "Periodically spawns a Humvee to run over enemies.",
                Content = {{Text = "Spawn Time: 45s"}, {Text = "Health: 60"}, {Text = "Vehicle Speed: 8"}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Military Caravan",
                Icon = 3877873543,
                Description = "Periodically spawns a Humvee to run over enemies.",
                Content = {{Text = "Spawn Time: 35s"}, {Text = "Health: 60"}, {Text = "Vehicle Speed: 8"}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Military Caravan",
                Icon = 3877873543,
                Description = "Periodically spawns a Humvee to run over enemies.",
                Content = {{Text = "Spawn Time: 35s"}, {Text = "Health: 100"}, {Text = "Vehicle Speed: 8"}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Military Caravan",
                Icon = 3877873543,
                Description = "Periodically spawns a Humvee to run over and attack enemies.",
                Content = {
                    {Text = "Spawn Time: 35s"},
                    {Text = "Health: 100"},
                    {Text = "Damage: 4"},
                    {Text = "Range: 30"},
                    {Text = "Cooldown: 0.225s"},
                    {Text = "Detections: Hidden"},
                    {Text = "Vehicle Speed: 5"},
                    {Text = "Slows Down When Firing At Enemies"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Airstrike",
                Icon = 16899461518,
                Description = "Call in an airstrike on the path.",
                Content = {
                    {Text = "Cooldown: 45s"},
                    {Text = "Price: 500 Cash"},
                    {Text = "Missile Damage: 75"},
                    {Text = "Missile Amount: 6"},
                    {Text = "Explosion Radius: 8"},
                },
            },
            {
                Header = "Military Caravan",
                Icon = 3444568329,
                Description = "Periodically spawns a Tank to run over and attack enemies.",
                Content = {
                    {Text = "Spawn Time: 35s"},
                    {Text = "Health: 500"},
                    {Text = "Damage: 8"},
                    {Text = "Range: 30"},
                    {Text = "Cooldown: 0.225s"},
                    {Text = "Explosion Damage: 40"},
                    {Text = "Explosion Cooldown: 2s"},
                    {Text = "Explosion Radius: 6"},
                    {Text = "Detections: Hidden"},
                    {Text = "Vehicle Speed: 5"},
                    {Text = "Slows Down When Firing At Enemies"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Airstrike",
                Icon = 16899461518,
                Description = "Call in an airstrike on the path.",
                Content = {
                    {Text = "Cooldown: 45s"},
                    {Text = "Price: 500 Cash"},
                    {Text = "Airstrike Damage: 125"},
                    {Text = "Missile Amount: 6"},
                    {Text = "Explosion Radius: 12"},
                },
            },
            {
                Header = "Military Caravan",
                Icon = 3444568580,
                Description = "Periodically spawns a Railgun Tank to run over and attack enemies.",
                Content = {
                    {Text = "Spawn Time: 35s"},
                    {Text = "Health: 1600"},
                    {Text = "Damage: 22"},
                    {Text = "Range: 30"},
                    {Text = "Cooldown: 0.175s"},
                    {Text = "Explosion Damage: 75"},
                    {Text = "Missile Cooldown: 2s"},
                    {Text = "Missile Explosion Radius: 8"},
                    {Text = "Detections: Hidden"},
                    {Text = "Vehicle Speed: 5"},
                    {Text = "Slows Down When Firing At Enemies"},
                },
            },
        },
    },
}