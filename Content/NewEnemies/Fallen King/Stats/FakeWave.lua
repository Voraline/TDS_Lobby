-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen King.Stats.FakeWave
-- Decompile time: 2.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Fallen = {
        {
            WaveLength = 30,
            WaveTimeline = {
                Enemies = {
                    {
                        Name = "Fallen Shield",
                        Delay = 3,
                        Amount = 4,
                        Time = 3,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.Aggro] = true,
                        },
                    },
                    {
                        Name = "Fallen Honor Guard",
                        Delay = 1,
                        Amount = 1,
                        Modifiers = {
                            [Enum.Modifier.StunImmune] = true,
                            [Enum.Modifier.HealthRegen] = true,
                        },
                    },
                    {
                        Name = "Fallen Tank",
                        Delay = 1,
                        Amount = 4,
                        Modifiers = {[Enum.Modifier.Bloated] = true},
                    },
                    {
                        Name = "Fallen Guardian",
                        Delay = 3,
                        Amount = 4,
                        Time = 0.5,
                        Modifiers = {
                            [Enum.Modifier.StunImmune] = true,
                            [Enum.Modifier.Bloated] = true,
                        },
                    },
                    {
                        Name = "Fallen Tank",
                        Delay = 1,
                        Amount = 1,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.HealthRegen] = true,
                        },
                    },
                    {
                        Name = "Fallen Giant",
                        Delay = 0.8,
                        Amount = 5,
                        Time = 0.8,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.HealthRegen] = true,
                        },
                    },
                    {
                        Name = "Corrupted Fallen",
                        Delay = 0.8,
                        Amount = 25,
                        Time = 1.6,
                        Modifiers = {[Enum.Modifier.Bloated] = true},
                    },
                    {
                        Name = "Breaker4",
                        Delay = 0.8,
                        Amount = 20,
                        Time = 1.6,
                        Modifiers = {[Enum.Modifier.Bloated] = true},
                    },
                    {
                        Name = "Fallen Hero",
                        Delay = 1,
                        Amount = 6,
                        Time = 4,
                        Modifiers = {[Enum.Modifier.Bloated] = true},
                    },
                    {
                        Name = "Fallen Squire",
                        Delay = 3,
                        Amount = 2,
                        Time = 3,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.Tank] = true,
                        },
                    },
                    {
                        Name = "Fallen Honor Guard",
                        Delay = 3,
                        Amount = 1,
                        Time = 0.5,
                        Modifiers = {
                            [Enum.Modifier.StunImmune] = true,
                            [Enum.Modifier.HealthRegen] = true,
                        },
                    },
                    {
                        Name = "Templar",
                        Delay = 1,
                        Amount = 1,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.HealthRegen] = true,
                        },
                    },
                },
            },
        },
        {
            WaveLength = 9999999999,
            WaveTimeline = {
                Enemies = {
                    {Name = "Fallen Honor Guard", Delay = 1, Amount = 1},
                    {
                        Name = "Fallen Tank",
                        Delay = 0.5,
                        Amount = 5,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.Nimble] = true,
                        },
                    },
                    {
                        Name = "Fallen Guardian",
                        Delay = 1,
                        Amount = 1,
                        Modifiers = {
                            [Enum.Modifier.Nimble] = true,
                            [Enum.Modifier.Bloated] = true,
                        },
                    },
                    {
                        Name = "Fallen Shield",
                        Delay = 3,
                        Amount = 4,
                        Time = 3,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.Aggro] = true,
                            [Enum.Modifier.Nimble] = true,
                        },
                    },
                    {
                        Name = "Fallen Honor Guard",
                        Delay = 1,
                        Amount = 1,
                        Time = 0.5,
                        Modifiers = {
                            [Enum.Modifier.StunImmune] = true,
                            [Enum.Modifier.HealthRegen] = true,
                        },
                    },
                    {
                        Name = "Fallen Tank",
                        Delay = 0.5,
                        Amount = 5,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.Nimble] = true,
                        },
                    },
                    {
                        Name = "Corrupted Fallen",
                        Delay = 0.7,
                        Amount = 20,
                        Time = 1.4,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.Nimble] = true,
                        },
                    },
                    {
                        Name = "Fallen Hero",
                        Delay = 3,
                        Amount = 4,
                        Time = 1,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.Nimble] = true,
                        },
                    },
                    {
                        Name = "Fallen Summoner",
                        Delay = 1,
                        Amount = 1,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.Nimble] = true,
                        },
                    },
                    {
                        Name = "Fallen Summoner",
                        Delay = 1,
                        Amount = 1,
                        Modifiers = {[Enum.Modifier.Bloated] = true},
                    },
                    {
                        Name = "Fallen Giant",
                        Delay = 0.8,
                        Amount = 5,
                        Time = 0.8,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.HealthRegen] = true,
                            [Enum.Modifier.Nimble] = true,
                        },
                    },
                    {
                        Name = "Fallen Angel",
                        Delay = 0.8,
                        Amount = 15,
                        Time = 1.6,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.Nimble] = true,
                        },
                    },
                    {
                        Name = "Fallen Rusher",
                        Delay = 1,
                        Amount = 12,
                        Time = 2,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.Nimble] = true,
                        },
                    },
                    {
                        Name = "Fallen Shield",
                        Delay = 3,
                        Amount = 2,
                        Time = 0,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.Aggro] = true,
                            [Enum.Modifier.Nimble] = true,
                        },
                    },
                    {
                        Name = "Templar",
                        Delay = 1,
                        Amount = 1,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.HealthRegen] = true,
                        },
                    },
                    {
                        Name = "Fallen Giant",
                        Delay = 0.8,
                        Amount = 5,
                        Time = 0.8,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.HealthRegen] = true,
                            [Enum.Modifier.Nimble] = true,
                        },
                    },
                    {
                        Name = "Breaker4",
                        Delay = 0.6,
                        Amount = 10,
                        Time = 1.2,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.Nimble] = true,
                        },
                    },
                    {
                        Name = "Fallen Tank",
                        Delay = 1,
                        Amount = 1,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.HealthRegen] = true,
                            [Enum.Modifier.Nimble] = true,
                        },
                    },
                    {
                        Name = "Fallen Hero",
                        Delay = 1,
                        Amount = 4,
                        Modifiers = {
                            [Enum.Modifier.Bloated] = true,
                            [Enum.Modifier.Nimble] = true,
                        },
                    },
                    {
                        Name = "Fallen Guardian",
                        Delay = 3,
                        Amount = 2,
                        Time = 0.5,
                        Modifiers = {
                            [Enum.Modifier.StunImmune] = true,
                            [Enum.Modifier.Bloated] = true,
                        },
                    },
                },
            },
        },
    },
}