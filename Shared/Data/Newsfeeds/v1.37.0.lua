-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.37.0
-- Decompile time: 3.60 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🎃 The Hexscape Event 🎃",
    ImageId = 88825236416668,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "A New Threat Emerges...",
                        HeaderSubject = "🎃 Darkness falls over Robloxia this Halloween... As TDS defends against the undead and the Fallen, a sinister cult lurks in the shadows, plotting to unleash Lord EXO from his ancient prison!",
                        Points = {},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Your Objective:",
                        HeaderSubject = "⚠️ Command has detected radiation spikes matching the God Cube at the Eclipse Village! Your mission: deploy immediately to the battlefield and prevent the gateway from opening. It's highly unstable—failure is not an option!",
                        Points = {},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Version 1.37.0",
                        HeaderSubject = "💪 This Halloween, experience a brand-new story centered around the uprising of the Children of EXO! Battle through 3 Nights of unforgiving enemies to collect 2 limited-time Event Towers and complete the \"Hexscape\" battle pass for exclusive rewards!",
                        Points = {
                            "🌘 NIGHT 1: 10/23/2024 @ 3:00 PM (ET)",
                            "🌗 NIGHT 2: 10/25/2024 @ 3:00 PM (ET)",
                            "🌕 NIGHT 3: 10/30/2024 @ 3:00 PM (ET)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "The Battle Pass",
                        Points = {
                            "🎟️ The Battle Pass system returns with more content than ever! Grind through 40 ranks to earn exclusive Fall rewards and skins! Purchase (or even gift) the Premium Battle Pass track for 500 Robux to unlock even more exclusive items! The Hexscape battle pass ends Nov. 30.",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Preset Loadouts",
                        Points = {
                            "🧩 Don’t have the best towers for the event? No worries! Preset loadouts are finally here! In the 'EASY' mode of the Hexscape event, choose from 3 preset loadouts, each equipped with the game’s top-tier towers—completely free!",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "New Halloween Lobby:",
                        Points = {
                            "Get ready for the spooky season! Introducing a brand-new lobby to kick off 2025! Explore an optimized layout with new areas, including a dedicated spot for the upcoming PvP game mode. Lobby sizes have been reduced to 30 players per server for a smoother experience.",
                            function(a1, a2) -- Line: 64 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 87440898771947,
                                    Text = "Lobby!",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 72 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 137108343909203,
                                    Text = "The gang all here 🎃",
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
                        HeaderName = "New Lobby HUD:",
                        Points = {
                            "Get ready for the spooky season! Introducing a brand-new lobby to kick off 2025! Explore an optimized layout with new areas, including a dedicated spot for the upcoming PvP game mode. Lobby sizes have been reduced to 30 players per server for a smoother experience.",
                            function(a1, a2) -- Line: 89 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 95107479220130,
                                    Text = "Desktop",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 97 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 130881954405531,
                                    Text = "Mobile",
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
                        HeaderName = "New In-Game HUD:",
                        Points = {
                            "We’ve overhauled the in-game HUD! Experience the new health bar with updated sounds, plus a revamped wave and time counter.",
                            function(a1, a2) -- Line: 114 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 124761746095355,
                                    Text = "HUD",
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
                        HeaderName = "Elevators Refresh (Part 1):",
                        Points = {
                            "Elevators are receiving a gradual overhaul. In this update, we’ve revamped the back-end code, redesigned the elevator UI, introduced a new model, and improved difficulty displays and lighting. Plus, keep an eye on the skies—you can now watch other players deploy into matches via planes every time they teleport!",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Refreshed News Feed:",
                        Points = {
                            "What’s better than reading the update log? Reading a more polished one! Enjoy the refreshed news feed UI, making it easier to dive into TDS history and simpler for us to showcase content in the future!",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Slasher Rework 🔪",
                        Points = {
                            "Slasher now gains a new Bleed debuff!",
                            "Bleed applies stacks that deal damage over time.",
                            "If an enemy reaches max bleed stacks (30 stacks) then all bleed stacks are triggered for massive burst damage.",
                            "The amount of damage dealt by bleed is relative to the target enemy's total max health",
                            function(a1, a2) -- Line: 152 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 128296425218609,
                                    Text = "Stabby Stab",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Skins 🔥", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Minimize = 0.6,
                        Items = {
                            {
                                Type = "tower",
                                Name = "Scout",
                                Skin = "King of Rock",
                                Details = "King of Rock",
                            },
                            {Type = "tower", Name = "Soldier", Skin = "Aerobics", Details = "Aerobics"},
                            {
                                Type = "tower",
                                Name = "Shotgunner",
                                Skin = "Dance Fever",
                                Details = "Dance Fever",
                            },
                            {
                                Type = "tower",
                                Name = "Ranger",
                                Skin = "Frankenstein",
                                Details = "Frankenstein",
                            },
                            {
                                Type = "tower",
                                Name = "Militant",
                                Skin = "Wasteland",
                                Details = "Wasteland",
                            },
                            {
                                Type = "tower",
                                Name = "Military Base",
                                Skin = "Wasteland",
                                Details = "Wasteland",
                            },
                            {
                                Type = "tower",
                                Name = "Minigunner",
                                Skin = "Road Rage",
                                Details = "Road Rage",
                            },
                            {
                                Type = "tower",
                                Name = "Commander",
                                Skin = "Wasteland",
                                Details = "Wasteland",
                            },
                            {Type = "tower", Name = "Warden", Skin = "Freddy", Details = "Freddy"},
                            {Type = "tower", Name = "Accelerator", Skin = "Disco", Details = "Disco"},
                            {
                                Type = "tower",
                                Name = "DJ Booth",
                                Skin = "Garage Band",
                                Details = "Garage Band",
                            },
                            {Type = "tower", Name = "Farm", Skin = "Wasteland", Details = "Wasteland"},
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Emotes 🕺", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Minimize = 0.6,
                        Items = {
                            {Type = "emote", Name = "Scarecrow"},
                            {Type = "emote", Name = "Quota Craze"},
                            {Type = "emote", Name = "Scary Coffin"},
                            {Type = "emote", Name = "The Worm"},
                            {Type = "emote", Name = "Moon Walk"},
                            {Type = "emote", Name = "Take The L"},
                            {Type = "emote", Name = "Broomstick"},
                            {Type = "emote", Name = "Bumper Cart"},
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Nametags 🏷️", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Minimize = 0.6,
                        Items = {
                            {Type = "nametag", Name = "GreenMist"},
                            {Type = "nametag", Name = "DarkMist"},
                            {Type = "nametag", Name = "Curse"},
                            {Type = "nametag", Name = "Bewitched"},
                            {Type = "nametag", Name = "Autumn"},
                            {Type = "nametag", Name = "Conserver"},
                            {Type = "nametag", Name = "The32"},
                            {Type = "nametag", Name = "CandyCorn"},
                            {Type = "nametag", Name = "SugarRush"},
                            {Type = "nametag", Name = "Harrowing"},
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Stickers 🎨", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Minimize = 0.8,
                        Items = {
                            {Type = "sticker", Name = "Angry Pumpkin"},
                            {Type = "sticker", Name = "Narrator"},
                            {Type = "sticker", Name = "Umbra Laugh"},
                            {Type = "sticker", Name = "The32"},
                            {Type = "sticker", Name = "MJ Hehe"},
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Consumables 🍬", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Items = {
                            {Type = "consumable", Name = "Turkey Leg"},
                            {Type = "consumable", Name = "Sugar Rush"},
                            {Type = "consumable", Name = "Pumpkin Bomb"},
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Game Improvements 🛠️",
                        Points = {
                            "Improved Console Support",
                            "Improved Key Binds UI",
                            "Changed Tower Rotation angle to 45 degrees",
                            "New mobile control buttons",
                            "Fixed a lot of mobile layout",
                            "Added life-time timer to Units (Crook Boss, Mercenary Base)",
                            "Added Unit collisions to ranged units (Crook Boss, Mercenary Base,\n Elf camp, Necromancer)",
                            "Dialog with voice acting will now lower background music volume",
                            "Made large optimizations to the Cutscene system",
                            "Halloween loading screen",
                            "Halloween win / loss themes",
                            "Removed legacy battle pass + map scores in 'Rewards' menu.",
                            "Fixed consumables accessories",
                            "Fixed Tower boundary circles",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Coming Up 🔥",
                        Points = {
                            "The Haunt event",
                            "Night II going live October 25 @ 3:00PM ET",
                            function(a1, a2) -- Line: 443 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 85783688032899,
                                    Text = "Are you ready?",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            "...keep an eye on our socials for more info! 📢",
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
                        SubjectName = "Small Changes",
                        Points = {
                            "Burn no longer removes chill/frozen on enemies",
                            "Some unit towers now have a max unit cap per tower\n  and units have lifespans now",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Mercenary Base",
                        Points = {
                            "Mercenary Base dynamic placement limit removed (3)",
                            "Rifleman Cap (10 Units)",
                            "Grenadier Cap (7 Units)",
                            "Riot Guard Cap (4 Units)",
                            "Field Medic Cap (3 Units)",
                            "Rifleman Lifespan (120 Seconds)",
                            "Grenadier Lifespan (150 Seconds)",
                            "Riot Guard Lifespan (240 Seconds)",
                            "Field Medic Lifespan (240 Seconds)",
                            "Airdropped Units:",
                            "Rifleman Lifespan (90 Seconds)",
                            "Grenadier Lifespan (90 Seconds)",
                            "Riot Guard Lifespan (240 Seconds)",
                            "Field Medic Lifespan (120 Seconds)",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Crook Boss",
                        Points = {
                            "Pistol Crook Cap (10 Units)",
                            "Tommy Crook Cap (4 Units)",
                            "Pistol Crook Lifespan (120 Seconds)",
                            "Tommy Crook Lifespan (200 Seconds)",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Golden Crook Boss",
                        Points = {
                            "Pistol Crook Cap (10 Units)",
                            "Tommy Crook Cap (4 Units)",
                            "Pistol Crook Lifespan (120 Seconds)",
                            "Tommy Crook Lifespan (200 Seconds)",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Slasher Rework",
                        Points = {
                            "Lvl 0 Cost (450 → <font color=\"rgb(100,255,100)\">1500</font>)",
                            "Lvl 1 Cost (350 → <font color=\"rgb(100,255,100)\">800</font>)",
                            "Lvl 2 Cost (850 → <font color=\"rgb(100,255,100)\">3500</font>)",
                            "Lvl 3 Cost (2350 → <font color=\"rgb(100,255,100)\">7000</font>)",
                            "Lvl 4 Cost (7500 → <font color=\"rgb(100,255,100)\">20000</font>)",
                            "Lvl 0 Damage (3 → <font color=\"rgb(100,255,100)\">6</font>)",
                            "Lvl 1 Damage (4 → <font color=\"rgb(100,255,100)\">6</font>)",
                            "Lvl 2 Damage (6 → <font color=\"rgb(100,255,100)\">20</font>)",
                            "Lvl 3 Damage (10 → <font color=\"rgb(100,255,100)\">45</font>)",
                            "Lvl 4 Damage (24 → <font color=\"rgb(100,255,100)\">60</font>)",
                            "Lvl 0 Cooldown (0.55 → <font color=\"rgb(255,100,100)\">0.4</font>)",
                            "Lvl 1 Cooldown (0.4 → <font color=\"rgb(255,100,100)\">0.35</font>)",
                            "Lvl 2 Cooldown (0.4 → <font color=\"rgb(100,255,100)\">0.7</font>)",
                            "Lvl 3 Cooldown (0.3 → <font color=\"rgb(100,255,100)\">0.6</font>)",
                            "Lvl 4 Cooldown (0.3 → <font color=\"rgb(100,255,100)\">0.5</font>)",
                            "Lvl 2 Range (6 → <font color=\"rgb(255,100,100)\">5.5</font>)",
                            "Lvl 3 Range (6 → <font color=\"rgb(255,100,100)\">5.5</font>)",
                            "Lvl 4 Range (7 → <font color=\"rgb(255,100,100)\">6</font>)",
                            "Hidden Detection gained at level 1",
                            "Critical Hit on 3rd hit",
                            "Lvl 0, 1, 2 Crit Multiplier (2.5x Damage)",
                            "Lvl 3 Crit Multiplier (3x Damage)",
                            "Lvl 4 Crit Multiplier (4x Damage)",
                        },
                    },
                },
            },
        },
    },
}