-- Script path: ReplicatedStorage.Content.Tower.Swarmer.TowerInformation
-- Decompile time: 1.09 ms

return {
    ToolTip = {
        "A cheap single target DPS tower that shoots bees that apply a damage over time debuff on enemies.",
        "Swarmers can stack multiple bees on a target increasing the strength of the damage over time.",
        "Later levels also gain a bee grenade that applies the debuff to multiples enemies.",
    },
    [0] = {
        ["Tower Ability"] = {
            {
                Header = "Bee Swarm",
                Icon = 119703739718324,
                Description = "Stack multiple bees on a target to deal damage over time.",
                Content = {
                    {Text = "Max Bee Stacks: 1"},
                    {Text = "Bee Damage: 3"},
                    {Text = "Bee Duration: 2.1s"},
                    {Text = "Bee Tick Rate: 1s"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Bee Swarm",
                Icon = 119703739718324,
                Description = "Stack multiple bees on a target to deal damage over time.",
                Content = {
                    {Text = "Max Bee Stacks: 3"},
                    {Text = "Bee Damage: 3"},
                    {Text = "Bee Duration: 2.1s"},
                    {Text = "Bee Tick Rate: 1s"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Bee Swarm",
                Icon = 119703739718324,
                Description = "Stack multiple bees on a target to deal damage over time.",
                Content = {
                    {Text = "Max Bee Stacks: 6"},
                    {Text = "Bee Damage: 3"},
                    {Text = "Bee Duration: 4.1s"},
                    {Text = "Bee Tick Rate: 1s"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Bee Swarm",
                Icon = 119703739718324,
                Description = "Stack multiple bees on a target to deal damage over time.",
                Content = {
                    {Text = "Max Bee Stacks: 12"},
                    {Text = "Bee Damage: 3"},
                    {Text = "Bee Duration: 5.25s"},
                    {Text = "Bee Tick Rate: 0.75s"},
                },
            },
            {
                Header = "Bee Grenade",
                Icon = 4865025806,
                Description = "Throws a AOE bee grenade that applies a stack of bees to enemies.",
                Content = {
                    {Text = "Grenade Damage: 30"},
                    {Text = "Cooldown: 15s"},
                    {Text = "Explosion Radius: 6"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Bee Swarm",
                Icon = 119703739718324,
                Description = "Stack multiple bees on a target to deal damage over time.",
                Content = {
                    {Text = "Max Bee Stacks: 25"},
                    {Text = "Bee Damage: 3"},
                    {Text = "Bee Duration: 7.5s"},
                    {Text = "Bee Tick Rate: 0.75s"},
                },
            },
            {
                Header = "Bee Grenade",
                Icon = 4865025806,
                Description = "Throws a AOE bee grenade that applies a stack of bees to enemies.",
                Content = {
                    {Text = "Grenade Damage: 70"},
                    {Text = "Cooldown: 15s"},
                    {Text = "Explosion Radius: 7"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Bee Swarm",
                Icon = 119703739718324,
                Description = "Stack multiple bees on a target to deal damage over time.",
                Content = {
                    {Text = "Max Bee Stacks: 30"},
                    {Text = "Bee Damage: 4"},
                    {Text = "Bee Duration: 15s"},
                    {Text = "Bee Tick Rate: 0.75s"},
                },
            },
            {
                Header = "Bee Grenade",
                Icon = 4865025806,
                Description = "Throws a AOE bee grenade that applies a stack of bees to enemies.",
                Content = {
                    {Text = "Grenade Damage: 125"},
                    {Text = "Cooldown: 15s"},
                    {Text = "Explosion Radius: 8"},
                },
            },
        },
    },
}