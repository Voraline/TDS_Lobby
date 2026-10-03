-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.61.0
-- Decompile time: 2.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "Ducky Revenge",
    ImageId = 121614796687576,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🦆 Ducky Revenge Event is LIVE!",
                        Points = {
                            "The ducks are back and seeking revenge! Experience feathered fury in this limited-time event.",
                            "<b><u>New Event Map:</u></b> Battle across the treacherous Bathroom Approach – navigate strategic corridors and outsmart your foes.",
                            "<b><u>Two Difficulty Modes:</u></b> Choose Easy for a breezier battle or Hard for a true test of skill, with waves of vengeful duck enemies.",
                            "<b><u>Grand Prize:</u></b> Conquer Hard mode to unlock the powerful new Biologist Tower.",
                            "<b><u>Recurring Rewards:</u></b> Once you beat Hard mode, return every 64 hours to earn exclusive milestone rewards.",
                            function(a1, a2) -- Line: 22 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 114757938234084,
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "New Tower: Biologist",
                        Points = {
                            "Grow your defenses with the new Biologist Tower, which deploys specialized botanical allies.",
                            "<b><u>Sunflowers:</u></b> Deliver consistent, single-target damage and detects hidden enemies.",
                            "<b><u>Ivy:</u></b> Inflict damage over time with splash effects on multiple foes.",
                            "<b><u>Nightshades:</u></b> Confuse enemies while delivering high single-target damage, especially effective against flyers.",
                            "Obtain the Biologist Tower by completing the Hard mode challenge or through the in-game shop.",
                            function(a1, a2) -- Line: 42 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 128125812774347,
                                    Text = "Biologist joins TDS this spring as a new unit summoning tower! This tower focuses on providing versatility through the power of nature :sunflower:",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Coming Soon 🔥",
                        Points = {
                            "Ducky DJ Mission Quest",
                            "Revamped Swarmer Tower",
                            "...keep an eye on our socials for more info! 📢",
                        },
                    },
                },
            },
        },
        {
            Name = "🎨 Event Rewards:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Easter Battlepass",
                        Points = {"Earn exclusive event rewards as you progress through the battlepass."},
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Skins 🔥", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Minimize = 0.6,
                        Items = {
                            {Type = "tower", Name = "Demoman", Skin = "Ducky", Details = "Ducky"},
                            {Type = "tower", Name = "Pursuit", Skin = "Eggy", Details = "Eggy"},
                            {Type = "tower", Name = "Soldier", Skin = "Bunny", Details = "Bunny"},
                            {Type = "tower", Name = "Gatling Gun", Skin = "Easter", Details = "Easter"},
                            {Type = "tower", Name = "Ace Pilot", Skin = "Easter", Details = "Easter"},
                            {
                                Type = "tower",
                                Name = "Trapper",
                                Skin = "Mallard Duck",
                                Details = "Mallard Duck",
                            },
                            {Type = "tower", Name = "Militant", Skin = "Easter", Details = "Easter"},
                            {
                                Type = "tower",
                                Name = "Ranger",
                                Skin = "Mecha Ducky",
                                Details = "Mecha Ducky",
                            },
                            {
                                Type = "tower",
                                Name = "Shotgunner",
                                Skin = "Gardener",
                                Details = "Gardener",
                            },
                            {
                                Type = "tower",
                                Name = "Mortar",
                                Skin = "Mecha Ducky",
                                Details = "Mecha Ducky",
                            },
                            {
                                Type = "tower",
                                Name = "Minigunner",
                                Skin = "Gardener",
                                Details = "Gardener",
                            },
                            {
                                Type = "tower",
                                Name = "Cowboy",
                                Skin = "Spring Time",
                                Details = "Spring Time",
                            },
                            {Type = "tower", Name = "Crook Boss", Skin = "Easter", Details = "Easter"},
                            {Type = "tower", Name = "Necromancer", Skin = "Duck", Details = "Duck"},
                            {Type = "tower", Name = "Rocketeer", Skin = "Duck", Details = "Duck"},
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Emotes 🕺", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Minimize = 0.8,
                        Items = {
                            {Type = "emote", Name = "Water The Plant"},
                            {Type = "emote", Name = "Griddy"},
                            {Type = "emote", Name = "Praise The Sun"},
                            {Type = "emote", Name = "Happy Feet"},
                            {Type = "emote", Name = "Wimbleton"},
                            {Type = "emote", Name = "Melted Chocolate"},
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Stickers 🎨", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Minimize = 0.6,
                        Items = {
                            {Type = "sticker", Name = "Cool Ducky Trick"},
                            {Type = "sticker", Name = "Ducky Quack"},
                            {Type = "sticker", Name = "Lemonade Stand"},
                            {Type = "sticker", Name = "Minigunner Triumph"},
                            {Type = "sticker", Name = "Ducky Doom Chasing"},
                            {Type = "sticker", Name = "Nerd Ducky"},
                            {Type = "sticker", Name = "Biologist Menace"},
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Nametags 🏷️", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Minimize = 0.6,
                        Items = {
                            {Type = "nametag", Name = "BunnyEars"},
                            {Type = "nametag", Name = "Birds"},
                            {Type = "nametag", Name = "Pastel"},
                            {Type = "nametag", Name = "Butterflies"},
                            {Type = "nametag", Name = "Verdant"},
                            {Type = "nametag", Name = "MeltingIce"},
                            {Type = "nametag", Name = "Sunlight"},
                            {Type = "nametag", Name = "CherryBlossom"},
                            {Type = "nametag", Name = "Biologist"},
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Consumables 🍬", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Items = {
                            {Type = "consumable", Name = "Ducky Squad"},
                            {Type = "consumable", Name = "Easter Egg"},
                        },
                    },
                },
            },
        },
        {
            Name = "🔨 Game Changes:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Improvements",
                        Points = {
                            "Smoother cutscene transitions for a more immersive experience.",
                            "Various bug fixes and performance optimizations implemented.",
                            "Fixed Bumper Cart avatar height scaling",
                            "Fixed Broomstick avatar height scaling",
                            "Fixed Sleigh Ride avatar height scaling",
                            "Fixed Jolly Tree avatar height scaling and body part transparencies",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Biologist",
                        Points = {
                            "Tower Limit: 8",
                            "Level 0 Cost: 750",
                            "Level 1 Cost: 600",
                            "Level 2 Cost: 1850",
                            "Level 3 Cost: 4500",
                            "Level 4 Cost: 20000",
                            "Level 0 Max Flowers: 1",
                            "Level 1 Max Flowers: 1",
                            "Level 2 Max Flowers: 2",
                            "Level 3 Max Flowers: 2",
                            "Level 4 Max Flowers: 3",
                            "Level 0 Sunflower Damage: 6",
                            "Level 1 Sunflower Damage: 10",
                            "Level 2 Sunflower Damage: 12",
                            "Level 3 Sunflower Damage: 28",
                            "Level 4 Sunflower Damage: 55",
                            "Level 0 Sunflower Cooldown: 1.1",
                            "Level 1 Sunflower Cooldown: 1.1",
                            "Level 2 Sunflower Cooldown: 1.1",
                            "Level 3 Sunflower Cooldown: 1",
                            "Level 4 Sunflower Cooldown: 0.8",
                            "Level 0 Sunflower Range: 15",
                            "Level 1 Sunflower Range: 15",
                            "Level 2 Sunflower Range: 17",
                            "Level 3 Sunflower Range: 19.5",
                            "Level 4 Sunflower Range: 22.5",
                            "Level 2 Sunflower Gains hidden detection",
                            "Level 1 Ivy Damage: 8",
                            "Level 2 Ivy Damage: 12",
                            "Level 3 Ivy Damage: 25",
                            "Level 4 Ivy Damage: 45",
                            "Level 1 Ivy Cooldown: 2",
                            "Level 2 Ivy Cooldown: 1.8",
                            "Level 3 Ivy Cooldown: 1.8",
                            "Level 4 Ivy Cooldown: 1.5",
                            "Level 1 Ivy Range: 14",
                            "Level 2 Ivy Range: 15.5",
                            "Level 3 Ivy Range: 17",
                            "Level 4 Ivy Range: 18.5",
                            "Level 1 Ivy Explosion Radius: 3",
                            "Level 2 Ivy Explosion Radius: 4",
                            "Level 3 Ivy Explosion Radius: 4.5",
                            "Level 4 Ivy Explosion Radius: 4.5",
                            "Level 1 Ivy Poison Damage: 1",
                            "Level 2 Ivy Poison Damage: 2",
                            "Level 3 Ivy Poison Damage: 4",
                            "Level 4 Ivy Poison Damage: 5",
                            "Level 1 Ivy Slow Percent: 5%",
                            "Level 2 Ivy Slow Percent: 7.5%",
                            "Level 3 Ivy Slow Percent: 7.5%",
                            "Level 4 Ivy Slow Percent: 12.5%",
                            "Level 1 Ivy Poison Length: 4.5s",
                            "Level 2 Ivy Poison Length: 4.5s",
                            "Level 3 Ivy Poison Length: 4.5s",
                            "Level 4 Ivy Poison Length: 5.2s",
                            "Level 1 Ivy Poison Tick Rate: 0.75s",
                            "Level 2 Ivy Poison Tick Rate: 0.75s",
                            "Level 3 Ivy Poison Tick Rate: 0.6s",
                            "Level 4 Ivy Poison Tick Rate: 0.65s",
                            "Level 2 Ivy Gains Lead Detection",
                            "Level 3 Nightshade Damage: 50",
                            "Level 4 Nightshade Damage: 135",
                            "Level 3 Nightshade Cooldown: 3",
                            "Level 4 Nightshade Cooldown: 2.75",
                            "Level 3 Nightshade Range: 30",
                            "Level 4 Nightshade Range: 35",
                            "Level 3 Nightshade Gains Flying detection",
                            "Level 3 Nightshade Confusion Duration: 1s",
                            "Level 4 Nightshade Confusion Duration: 1.25s",
                        },
                    },
                },
            },
        },
    },
}