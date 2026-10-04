-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.39.0
-- Decompile time: 2.02 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🎃 The Hexscape Event (Night III) 🎃",
    ImageId = 79515767807016,
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
                        HeaderName = "Version 1.39.0",
                        HeaderSubject = "💪 This Halloween, experience a brand-new story centered around the uprising of the Children of EXO! Battle through 3 Nights of unforgiving enemies to collect 2 limited-time Event Towers and complete the \"Hexscape\" battle pass for exclusive rewards!",
                        Points = {
                            "🌘 NIGHT 1: <b><font color=\"rgb(237, 40, 54)\">LIVE NOW</font></b>",
                            "🌗 NIGHT 2: <b><font color=\"rgb(237, 40, 54)\">LIVE NOW</font></b>",
                            "🌕 NIGHT 3: <b><font color=\"rgb(237, 40, 54)\">LIVE NOW</font></b>",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Harvester",
                        HeaderSubject = "A brand new event tower that specializes at crowd control with piercing shots and an AOE thorn ability. Unlocked by completing all nights on Hard mode.",
                        Points = {
                            function(a1, a2) -- Line: 46 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 87035993645022,
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 53 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 125539739860928,
                                    Text = "Summons a line of thorns that slows enemies and deals damage overtime!",
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
                        HeaderName = "Hallow Punk",
                        HeaderSubject = "A new event tower that specializes in knockback and explosions. Unlocked by completing all nights on Easy mode.",
                        Points = {
                            function(a1, a2) -- Line: 70 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 131134591145137,
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
                        HeaderName = "Game Improvements 🛠️",
                        Points = {
                            "Update Bumper Cart VFX again",
                            "Update Scary Coffin VFX",
                            "Fixed Mako DJ Max Lvl Particles",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Mission Quests 📝",
                        HeaderSubject = "Complete the limited time mission quests by <font color=\"#FFFF00\">11/06/2024</font> to earn exclusive skins!",
                        Points = {},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Dark Harvest",
                        HeaderSubject = "Complete to obtain the Wasteland Harvester skin",
                        Points = {
                            function(a1, a2) -- Line: 105 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 107999261669948,
                                    Text = "Wasteland Harvester",
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
                        HeaderName = "Wednesday the 30th",
                        HeaderSubject = "Complete to obtain the Jason Slasher skin",
                        Points = {
                            function(a1, a2) -- Line: 122 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 89308425135779,
                                    Text = "Jason Slasher",
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
                        HeaderName = "🔥 Coming Up 🔥",
                        Points = {
                            "PvP Gamemode",
                            "Pursuit Rework",
                            "Commando Rework",
                            "...keep an eye on our socials for more info! 📢",
                        },
                    },
                },
            },
        },
        {
            Name = "🎥 Credits:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🎤 Voice Actors",
                        Points = {
                            "Dispatcher: BethyVA (@bugbethy)",
                            "Titus: Enthrallist (@Enthrallist)",
                            "Conserver: Enthrallist (@Enthrallist)",
                            "<font color=\"#d5721c\">Cultist 1: Charles Lobaugh (@TinyChuke)</font>",
                            "<font color=\"#a75e9b\">Cultist 2: Trelakor (@Trelakor)</font>",
                            "<font color=\"#2c651d\">Cultist 3: Enthrallist (@Enthrallist)</font>",
                        },
                    },
                },
            },
        },
        {
            Name = "🔨 Game Changes:",
            Content = {
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Mercenary Base",
                        Points = {
                            "Fixed an issue where later level merc base units had lower lifespans",
                            "Rifleman Lifespan (75 → <font color=\"rgb(100,255,100)\">150 Seconds</font>)",
                            "Grenadier Lifespan (90 → <font color=\"rgb(100,255,100)\">180 Seconds</font>)",
                            "Riot Guard Lifespan (120 → <font color=\"rgb(100,255,100)\">240 Seconds</font>)",
                            "Field Medic Lifespan (180 → <font color=\"rgb(100,255,100)\">240 Seconds</font>)",
                            "Golden Crook Boss:",
                            "Fixed an issue where crooks had less lifespan than non-golden counterparts",
                            "Pistol Crook Lifespan (100 → <font color=\"rgb(100,255,100)\">150 Seconds</font>)",
                            "Tommy Crook Lifespan (100 → <font color=\"rgb(100,255,100)\">200 Seconds</font>)",
                            "Upgraded Tommy Crook Lifespan (100 → <font color=\"rgb(100,255,100)\">200 Seconds</font>)",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Ranger",
                        Points = {
                            "Level 3 had incorrect cooldown (3.5 → <font color=\"rgb(255,100,100)\">3.25 Seconds</font>)",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {SubjectName = "Ace Pilot", Points = {"Level 4 upgrade now displays hidden assist"}},
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Harvester",
                        Points = {
                            "Tower Limit (4)",
                            "Lvl 0 Cost (1400)",
                            "Lvl 1 Cost (650)",
                            "Lvl 2 Cost (2000)",
                            "Lvl 3 Cost (5000)",
                            "Lvl 4 Cost (8500)",
                            "Lvl 5 Cost (20000)",
                            "Lvl 0 Damage (6)",
                            "Lvl 1 Damage (8)",
                            "Lvl 2 Damage (10)",
                            "Lvl 3 Damage (20)",
                            "Lvl 4 Damage (30)",
                            "Lvl 5 Damage (90)",
                            "Lvl 0 Cooldown (1.2 Seconds)",
                            "Lvl 1 Cooldown (1.2 Seconds)",
                            "Lvl 2 Cooldown (0.85 Seconds)",
                            "Lvl 3 Cooldown (0.85 Seconds)",
                            "Lvl 4 Cooldown (0.75 Seconds)",
                            "Lvl 5 Cooldown (1.5 Seconds)",
                            "Lvl 0 Max Pierce (2)",
                            "Lvl 1 Max Pierce (2)",
                            "Lvl 2 Max Pierce (3)",
                            "Lvl 3 Max Pierce (3)",
                            "Lvl 4 Max Pierce (3)",
                            "Lvl 5 Max Pierce (4)",
                            "Lvl 0 Range (13)",
                            "Lvl 1 Range (15)",
                            "Lvl 2 Range (15)",
                            "Lvl 3 Range (15)",
                            "Lvl 4 Range (17.5)",
                            "Lvl 5 Range (22.5)",
                            "Thorn ability cooldown (40 Seconds)",
                            "Lvl 0 Thorns Slowdown Effect (15%)",
                            "Lvl 1 Thorns Slowdown Effect (15%)",
                            "Lvl 2 Thorns Slowdown Effect (20%)",
                            "Lvl 3 Thorns Slowdown Effect (20%)",
                            "Lvl 4 Thorns Slowdown Effect (25%)",
                            "Lvl 5 Thorns Slowdown Effect (30%)",
                            "Lvl 0 Thorns Duration (8 Seconds)",
                            "Lvl 1 Thorns Duration (8 Seconds)",
                            "Lvl 2 Thorns Duration (10 Seconds)",
                            "Lvl 3 Thorns Duration (10 Seconds)",
                            "Lvl 4 Thorns Duration (16 Seconds)",
                            "Lvl 5 Thorns Duration (16 Seconds)",
                            "Lvl 0 Thorns Damage Per Tick (2)",
                            "Lvl 1 Thorns Damage Per Tick (4)",
                            "Lvl 2 Thorns Damage Per Tick (6)",
                            "Lvl 3 Thorns Damage Per Tick (12)",
                            "Lvl 4 Thorns Damage Per Tick (20)",
                            "Lvl 5 Thorns Damage Per Tick (30)",
                            "Lvl 0 Thorns Range (10 Studs)",
                            "Lvl 1 Thorns Range (10 Studs)",
                            "Lvl 2 Thorns Range (12 Studs)",
                            "Lvl 3 Thorns Range (16 Studs)",
                            "Lvl 4 Thorns Range (18 Studs)",
                            "Lvl 5 Thorns Range (20 Studs)",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Hallow Punk",
                        Points = {
                            "Tower Limit (12)",
                            "Lvl 0 Cost (300)",
                            "Lvl 1 Cost (450)",
                            "Lvl 2 Cost (2750)",
                            "Lvl 3 Cost (5000)",
                            "Lvl 0 Damage (3)",
                            "Lvl 1 Damage (6)",
                            "Lvl 2 Damage (25)",
                            "Lvl 3 Damage (60)",
                            "Lvl 0 Cooldown (5 Seconds)",
                            "Lvl 1 Cooldown (3.75 Seconds)",
                            "Lvl 2 Cooldown (3.75 Seconds)",
                            "Lvl 3 Cooldown (3.75 Seconds)",
                            "Lvl 0 Explosion Radius (3.5)",
                            "Lvl 1 Explosion Radius (3.5)",
                            "Lvl 2 Explosion Radius (5)",
                            "Lvl 3 Explosion Radius (5.5)",
                            "Lvl 0 Range (18)",
                            "Lvl 1 Range (20)",
                            "Lvl 2 Range (22.5)",
                            "Lvl 3 Range (26)",
                            "Lvl 0 Knockback (10)",
                            "Lvl 1 Knockback (10)",
                            "Lvl 2 Knockback (12.5)",
                            "Lvl 3 Knockback (17.5)",
                            "Lvl 0 Rocket Speed (20)",
                            "Lvl 1 Rocket Speed (20)",
                            "Lvl 2 Rocket Speed (25)",
                            "Lvl 3 Rocket Speed (30)",
                            "Lvl 3 Burn Damage (3)",
                            "Lvl 3 Burn Tick Speed (0.25)",
                            "Lvl 3 Burn Duration (16)",
                        },
                    },
                },
            },
        },
    },
}