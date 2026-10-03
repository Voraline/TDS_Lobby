-- Script path: ReplicatedStorage.Content.Tower.Medic.TowerInformation
-- Decompile time: 1.39 ms

return {
    ToolTip = {
        "A support tower that heals the base at the start of each wave and can assign its medi gun to nearby towers to give them a shield and a cooldown boost.",
        "Active ability uber charge also provides a temporary damage boost to all assigned towers.",
    },
    [0] = {
        ["Tower Ability"] = {
            {
                Header = "Take your Vitamins",
                Icon = 4119548431,
                Description = "Heal 5 HP at the start of each wave.",
                Content = {{Text = "Overheal Limit: 100"}},
            },
            {
                Header = "Medi Gun",
                Icon = 4119548431,
                Description = "Assign medic to support towers in range with a shield and cooldown boost.",
                Content = {
                    {Text = "Max Number of Targets: 1"},
                    {Text = "Shield Recharge Speed: 8s"},
                    {Text = "Cooldown Boost: 15%"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Take your Vitamins",
                Icon = 4119548431,
                Description = "Heal 5 HP at the start of each wave.",
                Content = {{Text = "Overheal Limit: 100"}},
            },
            {
                Header = "Medi Gun",
                Icon = 4119548431,
                Description = "Assign medic to support towers in range with a shield and cooldown boost.",
                Content = {
                    {Text = "Max Number of Targets: 2"},
                    {Text = "Shield Recharge Speed: 8s"},
                    {Text = "Cooldown Boost: 15%"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Take your Vitamins",
                Icon = 4119548431,
                Description = "Heal 10 HP at the start of each wave.",
                Content = {{Text = "Overheal Limit: 100"}},
            },
            {
                Header = "Medi Gun",
                Icon = 4119548431,
                Description = "Assign medic to support towers in range with a shield and cooldown boost.",
                Content = {
                    {Text = "Max Number of Targets: 3"},
                    {Text = "Shield Recharge Speed: 6s"},
                    {Text = "Cooldown Boost: 15%"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Take your Vitamins",
                Icon = 4119548431,
                Description = "Heal 20 HP at the start of each wave.",
                Content = {{Text = "Overheal Limit: 100"}},
            },
            {
                Header = "Medi Gun",
                Icon = 4119548431,
                Description = "Assign medic to support towers in range with a shield and cooldown boost.",
                Content = {
                    {Text = "Max Number of Targets: 3"},
                    {Text = "Shield Recharge Speed: 6s"},
                    {Text = "Cooldown Boost: 15%"},
                },
            },
            {
                Header = "Ubercharge",
                Icon = 4119548431,
                Description = "Give all towers assigned to medi gun a temporary damage boost, stun immunity and freeze immunity. Grants self freeze immunity while active.",
                Content = {
                    {Text = "Damage Boost: 20%"},
                    {Text = "Duration: 7.5s"},
                    {Text = "Cooldown: 60s"},
                    {Text = "Initial Cooldown: 30s"},
                    {Text = "Grants full stun & freeze immunity to all assigned towers while active."},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Take your Vitamins",
                Icon = 4119548431,
                Description = "Heal 20 HP at the start of each wave.",
                Content = {{Text = "Overheal Limit: 100"}},
            },
            {
                Header = "Medi Gun",
                Icon = 4119548431,
                Description = "Assign medic to support towers in range with a shield and cooldown boost.",
                Content = {
                    {Text = "Max Number of Targets: 4"},
                    {Text = "Shield Recharge Speed: 5s"},
                    {Text = "Cooldown Boost: 15%"},
                },
            },
            {
                Header = "Ubercharge",
                Icon = 4119548431,
                Description = "Give all towers assigned to medi gun a temporary damage boost, stun immunity and freeze immunity. Grants self freeze immunity while active.",
                Content = {
                    {Text = "Damage Boost: 27.5%"},
                    {Text = "Duration: 10s"},
                    {Text = "Cooldown: 60s"},
                    {Text = "Initial Cooldown: 30s"},
                    {Text = "Grants full stun & freeze immunity to all assigned towers while active."},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Take your Vitamins",
                Icon = 4119548431,
                Description = "Heal 20 HP at the start of each wave.",
                Content = {{Text = "Overheal Limit: 100"}},
            },
            {
                Header = "Medi Gun",
                Icon = 4119548431,
                Description = "Assign medic to support towers in range with a shield and cooldown boost.",
                Content = {
                    {Text = "Max Number of Targets: 5"},
                    {Text = "Shield Recharge Speed: 4.5s"},
                    {Text = "Cooldown Boost: 15%"},
                },
            },
            {
                Header = "Ubercharge",
                Icon = 4119548431,
                Description = "Give all towers assigned to medi gun a temporary damage boost, stun immunity and freeze immunity. Grants self freeze immunity while active.",
                Content = {
                    {Text = "Damage Boost: 35%"},
                    {Text = "Duration: 10s"},
                    {Text = "Cooldown: 60s"},
                    {Text = "Initial Cooldown: 30s"},
                    {Text = "Grants full stun & freeze immunity to all assigned towers while active."},
                },
            },
        },
    },
}