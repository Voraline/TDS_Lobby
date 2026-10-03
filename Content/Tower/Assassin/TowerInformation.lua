-- Script path: ReplicatedStorage.Content.Tower.Assassin.TowerInformation
-- Decompile time: 0.50 ms

return {
    ToolTip = {
        "Silent but deadly. Clear out enemies with fatal stabs, whirlwind slashes, and throwing knives!",
        "Capable of detecting hidden enemies.",
    },
    [0] = {},
    {},
    {
        ["Tower Ability"] = {
            {
                Header = "Whirlwind Slash",
                Icon = 128618002892255,
                Description = "Wide area attack that deals damage to all enemies in range.",
                Content = {{Text = "Triggers every 3rd attack"}, {Text = "Range: 6"}, {Text = "Damage: 9"}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Whirlwind Slash",
                Icon = 128618002892255,
                Description = "Wide area attack that deals damage to all enemies in range.",
                Content = {{Text = "Triggers every 3rd attack"}, {Text = "Range: 6.5"}, {Text = "Damage: 16"}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Whirlwind Slash",
                Icon = 128618002892255,
                Description = "Wide area attack that deals damage to all enemies in range.",
                Content = {{Text = "Triggers every 3rd attack"}, {Text = "Range: 6.5"}, {Text = "Damage: 35"}},
            },
            {
                Header = "Fan of Knives",
                Icon = 90288499920630,
                Description = "Throws three knives in a fan shape at enemies.",
                Content = {
                    {Text = "Triggers once 500 damage is dealt."},
                    {Text = "Throws three knives in a fan shape."},
                    {Text = "Knife damage: 60"},
                    {Text = "Knife pierce: 3"},
                    {Text = "Range: 10"},
                },
            },
        },
    },
}