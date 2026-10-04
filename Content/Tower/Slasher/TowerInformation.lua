-- Script path: ReplicatedStorage.Content.Tower.Slasher.TowerInformation
-- Decompile time: 0.57 ms

return {
    ToolTip = {
        "A mid to late-game melee tower that applies a bleed damage over time debuff on enemies.",
        "At 450 bleed stacks enemies will take a massive burst of damage. (Amount of damage done by bleed is relative to the health of the enemy)",
        "Capable of detecting hidden & lead enemies.",
    },
    [0] = {
        ["Tower Ability"] = {
            {
                Header = "Knife Expert",
                Icon = 102669883500047,
                Description = "Triggers a crit every 3rd hit.",
                Content = {{Text = "Critical Multiplier: 2x"}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Knife Expert",
                Icon = 102669883500047,
                Description = "Triggers a crit every 3rd hit.",
                Content = {{Text = "Critical Multiplier: 2x"}},
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Knife Expert",
                Icon = 102669883500047,
                Description = "Triggers a crit every 3rd hit and applies bleed.",
                Content = {
                    {Text = "Critical Multiplier: 2.1x"},
                    {
                        Text = "Stacks 13 bleed per hit, up to 450 max stacks. When max stacks are reached, bleed collapses, dealing all accumulated bleed damage at once.",
                    },
                    {Text = "Bleed Base Damage: 3 (per stack). Scales with enemy HP."},
                    {Text = "Bleed Tick Rate: 1s"},
                    {Text = "Bleed Collapse Cooldown: 5s"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Knife Expert",
                Icon = 102669883500047,
                Description = "Triggers a crit every 3rd hit and applies bleed.",
                Content = {
                    {Text = "Critical Multiplier: 2.5x"},
                    {
                        Text = "Stacks 20 bleed per hit, up to 450 max stacks. When max stacks are reached, bleed collapses, dealing all accumulated bleed damage at once.",
                    },
                    {Text = "Bleed Base Damage: 3 (per stack). Scales with enemy HP."},
                    {Text = "Bleed Tick Rate: 1s"},
                    {Text = "Bleed Collapse Cooldown: 5s"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Knife Expert",
                Icon = 102669883500047,
                Description = "Triggers a crit every 3rd hit and applies bleed.",
                Content = {
                    {Text = "Critical Multiplier: 4x"},
                    {
                        Text = "Stacks 45 bleed per hit, up to 450 max stacks. When max stacks are reached, bleed collapses, dealing all accumulated bleed damage at once.",
                    },
                    {Text = "Bleed Base Damage: 3 (per stack). Scales with enemy HP."},
                    {Text = "Bleed Tick Rate: 1s"},
                    {Text = "Bleed Collapse Cooldown: 5s"},
                },
            },
        },
    },
}