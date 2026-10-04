-- Script path: ReplicatedStorage.Content.Tower.Mercenary Base.UpgradeOptions
-- Decompile time: 0.74 ms

local v1 = {
    Header = "Rifleman",
    Subject = "Unit",
    Content = {
        {Text = "Shoot at enemies in bursts of rounds!"},
        {Text = "Damage: 5 / 8 / 17"},
        {Text = "Burst: 6 / 8 / 8"},
        {Text = "Rifleman Lifetime: 150s"},
    },
}
local v2 = {
    Header = "Grenadier",
    Subject = "Unit",
    Content = {
        {Text = "Deal explosive damage to enemies!"},
        {Text = "Explosion Damage: 20 / 30 / 40"},
        {Text = "Grenadier Lifetime: 150s"},
    },
}
local v3 = {
    Header = "Field Medic",
    Subject = "Unit",
    Content = {
        {Text = "Heal and protect ally humanoid units!"},
        {Text = "Heal Rate: 75 / 100 HP"},
        {Text = "Max Targets: 8 / 10"},
        {Text = "Field Medic Lifetime: 150s"},
    },
}
local v4 = {
    Header = "Riot Guard",
    Subject = "Unit",
    Content = {
        {Text = "Rush to the front lines and stun enemies with a charged attack!"},
        {Text = "Damage: 50"},
        {Text = "Knockback Force: 15 / 25"},
        {Text = "Riot Guard Lifetime: 75s"},
    },
}
return {
    {
        Name = "Unit 1",
        Icon = 17191733923,
        QueueName = "Unit 1",
        Default = "nil",
        Values = {
            {
                Name = "Rifleman",
                Icon = 17190812977,
                Level = 0,
                Value = "Rifleman",
                Tooltip = v1,
            },
            {
                Name = "Grenadier",
                Icon = 17190813281,
                Level = 1,
                Value = "Grenadier",
                Tooltip = v2,
            },
            {
                Name = "Riot Guard",
                Icon = 17190812760,
                Level = 4,
                Value = "Riot Guard",
                Tooltip = v4,
            },
            {
                Name = "Field Medic",
                Icon = 17190813144,
                Level = 5,
                Value = "Field Medic",
                Tooltip = v3,
            },
        },
    },
    {
        Name = "Unit 2",
        Icon = 17191733923,
        QueueName = "Unit 2",
        Values = {
            {
                Name = "Rifleman",
                Icon = 17190812977,
                Level = 2,
                Value = "Rifleman",
                Tooltip = v1,
            },
            {
                Name = "Grenadier",
                Icon = 17190813281,
                Level = 2,
                Value = "Grenadier",
                Tooltip = v2,
            },
            {
                Name = "Riot Guard",
                Icon = 17190812760,
                Level = 4,
                Value = "Riot Guard",
                Tooltip = v4,
            },
            {
                Name = "Field Medic",
                Icon = 17190813144,
                Level = 5,
                Value = "Field Medic",
                Tooltip = v3,
            },
        },
    },
    {
        Name = "Unit 3",
        Icon = 17191733923,
        QueueName = "Unit 3",
        Values = {
            {
                Name = "Rifleman",
                Icon = 17190812977,
                Level = 4,
                Value = "Rifleman",
                Tooltip = v1,
            },
            {
                Name = "Grenadier",
                Icon = 17190813281,
                Level = 4,
                Value = "Grenadier",
                Tooltip = v2,
            },
            {
                Name = "Riot Guard",
                Icon = 17190812760,
                Level = 4,
                Value = "Riot Guard",
                Tooltip = v4,
            },
            {
                Name = "Field Medic",
                Icon = 17190813144,
                Level = 5,
                Value = "Field Medic",
                Tooltip = v3,
            },
        },
    },
}