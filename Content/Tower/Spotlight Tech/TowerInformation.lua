-- Script path: ReplicatedStorage.Content.Tower.Spotlight Tech.TowerInformation
-- Decompile time: 1.44 ms

return {
    ToolTip = {
        "A large cliff tower that shines a spotlight onto enemies, damaging them over time and applying burn at higher levels.",
        "Specializes in dealing high area damage to large crowds of enemies.",
        "At max level, gains a meter that builds up to apply confusion to any enemies in the spotlight radius.",
        "Has hidden and flying detection, indirectly damages lead enemies with burn. At Level 2, reveals hidden enemies in spotlight radius.",
    },
    [0] = {
        ["Tower Ability"] = {
            {
                Header = "Spotlight",
                Icon = 119703739718324,
                Description = "Attacks in an AOE radius via a spotlight.",
                Content = {{Text = "Spotlight Radius: 2"}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Spotlight",
                Icon = 119703739718324,
                Description = "Attacks in an AOE radius via a spotlight.",
                Content = {
                    {Text = "Spotlight Radius: 3.5"},
                    {Text = "Burn Damage: 1"},
                    {Text = "Burn Time: 2s"},
                    {Text = "Burn Tick: 0.25s"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Spotlight",
                Icon = 119703739718324,
                Description = "Attacks in an AOE radius via a spotlight. Applies burn to enemies.",
                Content = {
                    {Text = "Reveals Hidden Enemies in Spotlight Radius"},
                    {Text = "Spotlight Radius: 4.5"},
                    {Text = "Burn Damage: 2"},
                    {Text = "Burn Time: 2s"},
                    {Text = "Burn Tick: 0.25s"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Spotlight",
                Icon = 119703739718324,
                Description = "Attacks in an AOE radius via a spotlight. Applies burn to enemies.",
                Content = {
                    {Text = "Reveals Hidden Enemies in Spotlight Radius"},
                    {Text = "Spotlight Radius: 4.5"},
                    {Text = "Burn Damage: 5"},
                    {Text = "Burn Time: 4s"},
                    {Text = "Burn Tick: 0.25s"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Spotlight",
                Icon = 119703739718324,
                Description = "Attacks in an AOE radius via a spotlight. Applies burn to enemies and triggers confusion after enough damage.",
                Content = {
                    {Text = "Reveals Hidden Enemies in Spotlight Radius"},
                    {Text = "Spotlight Radius: 5.5"},
                    {Text = "Burn Damage: 10"},
                    {Text = "Burn Time: 6s"},
                    {Text = "Burn Tick: 0.5s"},
                    {Text = "Confusion Damage Threshold: 1800"},
                    {Text = "Confusion Duration: 2.5s"},
                },
            },
        },
    },
}