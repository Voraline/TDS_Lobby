-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.90.0
-- Decompile time: 3.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🟢 Slime Trooper 🟢",
    ImageId = 92717026294259,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🟢 Slime Trooper Tower",
                        HeaderSubject = "Slime Trooper: A stalling tower that fires globs of slime that slows enemies them for a short duration. At max level, can hit multiple enemies at once.",
                        Points = {
                            function(a1, a2) -- Line: 18 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 113198781859647,
                                    Text = "It's Slime Time!",
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
                            "💀 Hardcore Rework 💀 - June 5th 2026",
                            function(a1, a2) -- Line: 35 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Text = "",
                                    Image = 138844282120862,
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {Type = "EventButton", Props = {eventId = "1937657529807012466"}},
            },
        },
        {
            Name = "🛠️ Game Changes:",
            Content = {
                {
                    Type = "ItemChange",
                    Props = {
                        Item = {Type = "tower", Name = "Slime Trooper"},
                        Changes = {
                            {
                                Title = "General Changes",
                                Lines = {
                                    "Unlocks <b>Hidden Detection</b> at Lvl 2 and <b>Flying Detection</b> at Lvl 4.",
                                    "Unlocks <b>Splash Damage</b> at Lvl 4.",
                                },
                            },
                            {
                                Title = "Level 0 Changes",
                                Lines = {
                                    "<b>Price:</b> $500",
                                    "<b>Damage:</b> 10",
                                    "<b>Range:</b> 11.5",
                                    "<b>Slowness:</b> 15%",
                                    "<b>Slow Time:</b> 3s",
                                },
                            },
                            {
                                Title = "Level 1 Changes",
                                Lines = {
                                    "<b>Price:</b> $250",
                                    "<b>Damage:</b> 10",
                                    "<b>Range:</b> 13",
                                    "<b>Slowness:</b> 17.5%",
                                    "<b>Slow Time:</b> 3s",
                                },
                            },
                            {
                                Title = "Level 2 Changes",
                                Lines = {
                                    "<b>Price:</b> $650",
                                    "<b>Damage:</b> 20",
                                    "<b>Range:</b> 15.5",
                                    "<b>Slowness:</b> 17.5%",
                                    "<b>Slow Time:</b> 3s",
                                },
                            },
                            {
                                Title = "Level 3 Changes",
                                Lines = {
                                    "<b>Price:</b> $2,100",
                                    "<b>Damage:</b> 46",
                                    "<b>Range:</b> 17",
                                    "<b>Slowness:</b> 20%",
                                    "<b>Slow Time:</b> 5s",
                                },
                            },
                            {
                                Title = "Level 4 Changes",
                                Lines = {
                                    "<b>Price:</b> $4,650",
                                    "<b>Damage:</b> 64",
                                    "<b>Range:</b> 17",
                                    "<b>Slowness:</b> 22.5%",
                                    "<b>Slow Time:</b> 5s",
                                    "<b>Explosion Radius:</b> 2.5",
                                },
                            },
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        Item = {Type = "tower", Name = "Swarmer"},
                        Changes = {
                            {
                                Title = "Level 5 Changes",
                                Lines = {
                                    "<b>Bee Damage:</b> 3 → <font color=\"rgb(100,255,100)\">4</font> (Fix)",
                                },
                            },
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        Item = {Type = "tower", Name = "Ace Pilot"},
                        Changes = {
                            {
                                Title = "Level 3 Changes",
                                Lines = {
                                    "<b>Damage:</b> 4 → <font color=\"rgb(100,255,100)\">5</font>",
                                    "<b>Cooldown:</b> 0.1s → <font color=\"rgb(100,255,100)\">0.12s</font>",
                                },
                            },
                            {
                                Title = "Level 4 Changes",
                                Lines = {
                                    "Hidden Reveal re-added.",
                                    "<b>Price:</b> $2,500 → <font color=\"rgb(100,255,100)\">$3,000</font>",
                                    "<b>Damage:</b> 6 → <font color=\"rgb(100,255,100)\">8</font>",
                                    "<b>Cooldown:</b> 0.1s → <font color=\"rgb(100,255,100)\">0.12s</font>",
                                    "<b>Hidden Boost Radius:</b> None → 10",
                                },
                            },
                            {
                                Title = "Level 5 Changes",
                                Lines = {
                                    "<b>Price:</b> $9,500 → <font color=\"rgb(255,100,100)\">$7,000</font>",
                                    "<b>Damage:</b> 15 → <font color=\"rgb(100,255,100)\">18</font>",
                                    "<b>Cooldown:</b> 0.1s → <font color=\"rgb(100,255,100)\">0.12s</font>",
                                    "<b>Hidden Boost Radius:</b> 7 → <font color=\"rgb(100,255,100)\">10</font>",
                                    "<b>Explosion Radius:</b> 3.5 → <font color=\"rgb(100,255,100)\">4</font>",
                                },
                            },
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        Item = {Type = "tower", Name = "Crook Boss"},
                        Changes = {{Title = "General Changes", Lines = {"Pistol Goon Hidden Detection removed."}}},
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        Item = {
                            Type = "tower",
                            Item = "Crook Boss",
                            Skin = "Golden",
                            DisplayName = "Golden Crook Boss",
                        },
                        Changes = {
                            {
                                Title = "General Changes",
                                Lines = {"Golden Pistol Goon Hidden Detection removed."},
                            },
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        Item = {Type = "tower", Name = "Engineer"},
                        Changes = {
                            {
                                Title = "Level 1 Changes",
                                Lines = {"<b>Price:</b> $350 → <font color=\"rgb(255,100,100)\">$325</font>"},
                            },
                            {
                                Title = "Level 2 Changes",
                                Lines = {
                                    "<b>Price:</b> $1,000 → <font color=\"rgb(255,100,100)\">$900</font>",
                                    "<b>Damage:</b> 8 → <font color=\"rgb(100,255,100)\">10</font>",
                                    "<b>Rifle Sentry Cooldown:</b> 0.18s → <font color=\"rgb(255,100,100)\">0.17s</font>",
                                },
                            },
                            {
                                Title = "Level 3 Changes",
                                Lines = {"<b>Damage:</b> 20 → <font color=\"rgb(100,255,100)\">24</font>"},
                            },
                            {
                                Title = "Level 4 Changes",
                                Lines = {
                                    "<b>Price:</b> $7,500 → <font color=\"rgb(255,100,100)\">$6,250</font>",
                                    "<b>Damage:</b> 25 → <font color=\"rgb(100,255,100)\">30</font>",
                                    "<b>Range:</b> 20 → <font color=\"rgb(100,255,100)\">21</font>",
                                    "<b>Minigun Sentry Range:</b> 20 → <font color=\"rgb(100,255,100)\">22</font>",
                                },
                            },
                            {
                                Title = "Level 5 Changes",
                                Lines = {
                                    "<b>Damage:</b> 75 → <font color=\"rgb(100,255,100)\">80</font>",
                                    "<b>Range:</b> 20 → <font color=\"rgb(100,255,100)\">21</font>",
                                },
                            },
                            {
                                Title = "Level 6 Changes",
                                Lines = {
                                    "<b>Damage:</b> 85 → <font color=\"rgb(100,255,100)\">90</font>",
                                    "<b>War Machine Sentry Explosive Damage:</b> 70 → <font color=\"rgb(100,255,100)\">75</font>",
                                },
                            },
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        Item = {Type = "tower", Name = "Firework Technician"},
                        Changes = {
                            {
                                Title = "General Changes",
                                Lines = {
                                    "Firework proc chance increased for Soldier and Shotgunner.",
                                    "Firework proc chance decreased for Saboteur.",
                                },
                            },
                            {
                                Title = "Level 0 Changes",
                                Lines = {"<b>Range:</b> 8 → <font color=\"rgb(100,255,100)\">10</font>"},
                            },
                            {
                                Title = "Level 1 Changes",
                                Lines = {"<b>Range:</b> 8 → <font color=\"rgb(100,255,100)\">10</font>"},
                            },
                            {
                                Title = "Level 2 Changes",
                                Lines = {"<b>Range:</b> 9 → <font color=\"rgb(100,255,100)\">11</font>"},
                            },
                            {
                                Title = "Level 3 Changes",
                                Lines = {"<b>Range:</b> 9 → <font color=\"rgb(100,255,100)\">11</font>"},
                            },
                            {
                                Title = "Level 4 Changes",
                                Lines = {"<b>Range:</b> 10 → <font color=\"rgb(100,255,100)\">12</font>"},
                            },
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        Item = {Type = "tower", Name = "Harvester"},
                        Changes = {
                            {
                                Title = "Level 0 Changes",
                                Lines = {
                                    "<b>Thorns Slowness:</b> 20 → <font color=\"rgb(255,100,100)\">15</font>",
                                },
                            },
                            {
                                Title = "Level 1 Changes",
                                Lines = {
                                    "<b>Thorns Slowness:</b> 20 → <font color=\"rgb(255,100,100)\">15</font>",
                                },
                            },
                            {
                                Title = "Level 2 Changes",
                                Lines = {
                                    "<b>Thorns Slowness:</b> 25 → <font color=\"rgb(255,100,100)\">20</font>",
                                },
                            },
                            {
                                Title = "Level 3 Changes",
                                Lines = {
                                    "<b>Thorns Slowness:</b> 25 → <font color=\"rgb(255,100,100)\">20</font>",
                                },
                            },
                            {
                                Title = "Level 4 Changes",
                                Lines = {
                                    "<b>Thorns Slowness:</b> 25 → <font color=\"rgb(255,100,100)\">20</font>",
                                },
                            },
                            {
                                Title = "Level 5 Changes",
                                Lines = {
                                    "<b>Thorns Slowness:</b> 40 → <font color=\"rgb(255,100,100)\">30</font>",
                                },
                            },
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        Item = {Type = "tower", Name = "Saboteur"},
                        Changes = {
                            {
                                Title = "General Changes",
                                Lines = {"Lead Detection moved from Lvl 2 to Lvl 0."},
                            },
                            {
                                Title = "Level 0 Changes",
                                Lines = {
                                    "<b>Ability Cooldown:</b> 120s → <font color=\"rgb(255,100,100)\">100s</font>",
                                    "<b>Initial Ability Cooldown:</b> 60s → <font color=\"rgb(255,100,100)\">30s</font>",
                                },
                            },
                            {
                                Title = "Level 1 Changes",
                                Lines = {"<b>Price:</b> $550 → <font color=\"rgb(255,100,100)\">$500</font>"},
                            },
                            {
                                Title = "Level 2 Changes",
                                Lines = {
                                    "<b>Poison Length:</b> 4s → <font color=\"rgb(100,255,100)\">5s</font>",
                                },
                            },
                            {
                                Title = "Level 3 Changes",
                                Lines = {
                                    "<b>Price:</b> $5,150 → <font color=\"rgb(255,100,100)\">$4,850</font>",
                                    "<b>Poison Length:</b> 5.5s → <font color=\"rgb(100,255,100)\">6s</font>",
                                },
                            },
                            {
                                Title = "Level 4 Changes",
                                Lines = {"<b>Bullet Count:</b> 5 → <font color=\"rgb(100,255,100)\">6</font>"},
                            },
                        },
                    },
                },
            },
        },
    },
}