-- Script path: ReplicatedStorage.Content.Tower.Pulse Trooper.TowerInformation
-- Decompile time: 0.45 ms

return {
    ToolTip = {
        "A specialized crowd-control tower that releases piercing pulses in a 360° arc.",
        "At high levels, unlocks the Sweeper ability to clear dense crowds with rotating lasers.",
    },
    [0] = {["Tower Ability"] = {}},
    {["Tower Ability"] = {}},
    {["Tower Ability"] = {}},
    {["Tower Ability"] = {}},
    {
        ["Tower Ability"] = {
            {
                Header = "Sweeper",
                Icon = 128149436227441,
                Description = "Disables basic attacks and sweeps the map with two opposite lasers, hitting each enemy exactly twice over 7.5 seconds.",
                Content = {
                    {Text = "Laser Damage: 175"},
                    {Text = "Duration: 7.5s"},
                    {Text = "Ability Cooldown: 60s"},
                    {Text = "Ability Initial Cooldown: 45s"},
                },
            },
        },
    },
    {
        ["Tower Ability"] = {
            {
                Header = "Sweeper",
                Icon = 128149436227441,
                Description = "Disables basic attacks and sweeps the map with two opposite lasers, hitting each enemy exactly twice over 6.0 seconds.",
                Content = {
                    {Text = "Laser Damage: 300"},
                    {Text = "Duration: 6s"},
                    {Text = "Ability Cooldown: 60s"},
                    {Text = "Ability Initial Cooldown: 45s"},
                },
            },
        },
    },
}