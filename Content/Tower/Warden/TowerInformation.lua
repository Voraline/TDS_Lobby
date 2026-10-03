-- Script path: ReplicatedStorage.Content.Tower.Warden.TowerInformation
-- Decompile time: 0.66 ms

return {
    ToolTip = {
        "A mid-game melee tower that deals solid damage and has the ability to stun and deal a critical hit every 3 hits. ",
        "Capable of targeting hidden and lead enemies.",
    },
    [0] = {
        ["Tower Ability"] = {
            {
                Header = "Riot Control",
                Icon = 11415012702,
                Description = "Every 3rd hit deals critical damage and stuns enemies.",
                Content = {{Text = "Stun Duration: 0.5s"}, {Text = "Critical Hit Multiplier: 1.5x"}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Riot Control",
                Icon = 11415012702,
                Description = "Every 3rd hit deals critical damage and stuns enemies.",
                Content = {{Text = "Stun Duration: 0.5s"}, {Text = "Critical Hit Multiplier: 1.75x"}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Riot Control",
                Icon = 11415012702,
                Description = "Every 3rd hit deals critical damage and stuns enemies.",
                Content = {{Text = "Stun Duration: 0.75s"}, {Text = "Critical Hit Multiplier: 1.75x"}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Riot Control",
                Icon = 11415012702,
                Description = "Every 3rd hit deals critical damage. Stuns every hit now.",
                Content = {{Text = "Stun Duration: 0.75s"}, {Text = "Critical Hit Multiplier: 2x"}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Riot Control",
                Icon = 11415015418,
                Description = "Every 3rd hit deals critical damage. Stuns every hit. Now equipped with a shield to block. On successful block, grants self temporary stun immunity and a damage buff.",
                Content = {
                    {Text = "Stun Duration: 1.25s"},
                    {Text = "Critical Hit Multiplier: 3x"},
                    {Text = "Parry Length: 1s"},
                    {Text = "Parry Cooldown: 6s"},
                    {Text = "Parry Damage Buff: 100%"},
                    {Text = "Parry Buff Time: 6s"},
                },
            },
        },
    },
}