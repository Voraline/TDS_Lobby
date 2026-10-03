-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.73.0
-- Decompile time: 2.06 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "💉 Revive & Reload 🔫",
    ImageId = 138348767066618,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "💉 Medic Rework",
                        Points = {
                            "The Medic has been redesigned to focus on support, keeping your team in the fight with base healing and protecting towers from debilitating stuns.",
                            "For those who take on the new mission quest, you’ll be able to unlock the Mermaid Medic skin along with a special Medic Nametag to show off your achievement.",
                            function(a1, a2) -- Line: 19 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 81301064453213,
                                    Text = "Medic can now select a tower to assign to their medic gun providing a shield and a passive cooldown boost.",
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
                        HeaderName = "🔫 Turret Refresh",
                        Points = {
                            "The Turret remains a powerhouse of raw damage, but now with completely refreshed models to bring it up to modern standards.",
                            "Complete its mission quest to unlock the Jetski Turret skin and an exclusive Turret Nametag, giving this heavy hitter a stylish new look to match its firepower.",
                            function(a1, a2) -- Line: 37 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 95296164032412,
                                    Text = "",
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
                        HeaderName = "⌛ LIMITED TIME ⌛ Battlepass Discount!",
                        Points = {
                            "As we approach the end of the current battlepass season we're offering a 20% discount on the Surf and Turf products!",
                            "Additionally we're adding a 1.5x multiplier for the beach ball currency to help you catch up on the battlepass.",
                            function(a1, a2) -- Line: 56 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 128930064938008,
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
                        HeaderName = "🏝️ Distant Shapes",
                        Points = {
                            function(a1, a2) -- Line: 71 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 112276945632838,
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
                        HeaderName = "🏛️ Opulent Remains",
                        Points = {
                            function(a1, a2) -- Line: 86 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 126280151500082,
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
                        HeaderName = "🥇 Gilded Path",
                        Points = {
                            function(a1, a2) -- Line: 101 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 100609083805226,
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
                            "⚡ New Tower",
                            "🖥️ New Shop & Inventory UI",
                            "⚒️ Toggleable game modifiers!",
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
                        SubjectName = "Improvements",
                        Points = {
                            "PVP loadout selection now occurs after the map selection",
                            "Match difficulty for PVP is now determined by the highest level\n player in the match",
                            "PVP now displays the arena within the PVP lobby",
                            "Players loadout is now hidden within the PVP lobby",
                            "Players can no longer override maps within PVP ranked",
                            "You can now vote for different areans in PVP casual",
                            "Matchmaking for PVP casual now uses level-based matchmaking",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Medic",
                        Points = {
                            "Limit: 5",
                            "Lvl 0 Cost: 500",
                            "Lvl 1 Cost: 300",
                            "Lvl 2 Cost: 750",
                            "Lvl 3 Cost: 2700",
                            "Lvl 4 Cost: 6000",
                            "Lvl 5 Cost: 16000",
                            "Lvl 0 Range: 12",
                            "Lvl 1 Range: 12",
                            "Lvl 2 Range: 14",
                            "Lvl 3 Range: 15",
                            "Lvl 4 Range: 18",
                            "Lvl 5 Range: 20",
                            "Lvl 0 Health Regen: 5",
                            "Lvl 1 Health Regen: 5",
                            "Lvl 2 Health Regen: 5",
                            "Lvl 3 Health Regen: 10",
                            "Lvl 4 Health Regen: 20",
                            "Lvl 5 Health Regen: 25",
                            "Lvl 0 Over heal Limit: 0",
                            "Lvl 1 Over heal Limit: 0",
                            "Lvl 2 Over heal Limit: 5",
                            "Lvl 3 Over heal Limit: 10",
                            "Lvl 4 Over heal Limit: 20",
                            "Lvl 5 Over heal Limit: 50",
                            "Medic now selects towers to provide a shield and a cooldown boost.",
                            "Lvl 0 Max Number of Targets: 1",
                            "Lvl 1 Max Number of Targets: 2",
                            "Lvl 2 Max Number of Targets: 3",
                            "Lvl 3 Max Number of Targets: 3",
                            "Lvl 4 Max Number of Targets: 4",
                            "Lvl 5 Max Number of Targets: 5",
                            "Lvl 0 Shield Regen Speed: 8s",
                            "Lvl 1 Shield Regen Speed: 8s",
                            "Lvl 2 Shield Regen Speed: 6s",
                            "Lvl 3 Shield Regen Speed: 6s",
                            "Lvl 4 Shield Regen Speed: 4.5s",
                            "Lvl 5 Shield Regen Speed: 2.5s",
                            "Lvl 0 Cooldown Boost: 20%",
                            "Lvl 1 Cooldown Boost: 20%",
                            "Lvl 2 Cooldown Boost: 20%",
                            "Lvl 3 Cooldown Boost: 20%",
                            "Lvl 4 Cooldown Boost: 20%",
                            "Lvl 5 Cooldown Boost: 20%",
                            "Ubercharge Unlocked at Level 3",
                            "Lvl 3 Ubercharge Damage Boost: 20%",
                            "Lvl 4 Ubercharge Damage Boost: 27.5%",
                            "Lvl 5 Ubercharge Damage Boost: 40%",
                            "Lvl 3 Ubercharge Duration: 7.5s",
                            "Lvl 4 Ubercharge Duration: 10",
                            "Lvl 5 Ubercharge Duration: 15s",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Assassin",
                        Points = {
                            "Lvl 0 Cost: 300 → <font color=\"rgb(255,100,100)\">200</font>",
                            "Lvl 1 Cost: 150 → <font color=\"rgb(100,255,100)\">250</font>",
                            "Lvl 2 Cost: 600 → <font color=\"rgb(100,255,100)\">950</font>",
                            "Lvl 3 Cost: 1500 → <font color=\"rgb(100,255,100)\">2350</font>",
                            "Lvl 4 Cost: 4250 → <font color=\"rgb(100,255,100)\">7250</font>",
                            "Lvl 0 Range: 5.5 → <font color=\"rgb(100,255,100)\">6</font>",
                            "Lvl 1 Range: 6.5 → <font color=\"rgb(255,100,100)\">6</font>",
                            "Lvl 2 Range: 6.5 → <font color=\"rgb(255,100,100)\">6</font>",
                            "Lvl 3 Range: 6.5 → <font color=\"rgb(255,100,100)\">6</font>",
                            "Lvl 0 Cooldown: 0.75s → <font color=\"rgb(255,100,100)\">0.6s</font>",
                            "Lvl 1 Cooldown: 0.75s → <font color=\"rgb(255,100,100)\">0.5s</font>",
                            "Lvl 2 Cooldown: 0.6s → <font color=\"rgb(255,100,100)\">0.5s</font>",
                            "Lvl 3 Cooldown: 0.6s → <font color=\"rgb(255,100,100)\">0.5s</font>",
                            "Lvl 4 Cooldown: 0.5s → <font color=\"rgb(255,100,100)\">0.4s</font>",
                            "Lvl 2 Damage: 8 → <font color=\"rgb(100,255,100)\">10</font>",
                            "Lvl 3 Damage: 18 → <font color=\"rgb(100,255,100)\">25</font>",
                            "Lvl 4 Damage: 30 → <font color=\"rgb(100,255,100)\">50</font>",
                            "Lvl 4 Throwing Knife Damage: 25 → <font color=\"rgb(100,255,100)\">100</font>",
                            "Lvl 4 Throwing Knife Damage Requirement: 150 → <font color=\"rgb(100,255,100)\">400</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Turret",
                        Points = {
                            "Lvl 0 Cost: 6000 → <font color=\"rgb(255,100,100)\">5000</font>",
                            "Lvl 1 Cost: 1000 → <font color=\"rgb(100,255,100)\">1250</font>",
                            "Lvl 2 Cost: 4250 → <font color=\"rgb(100,255,100)\">7250</font>",
                            "Lvl 3 Cost: 12000 → <font color=\"rgb(100,255,100)\">15000</font>",
                            "Lvl 4 Cost: 26000 → <font color=\"rgb(100,255,100)\">30000</font>",
                            "Lvl 5 Cost: 56250 → <font color=\"rgb(255,100,100)\">52500</font>",
                            "Lvl 0 Cooldown: 0.3s → <font color=\"rgb(100,255,100)\">0.35s</font>",
                            "Lvl 5 Cooldown: 0.12 → <font color=\"rgb(100,255,100)\">0.15</font>",
                            "Lvl 2 Damage: 15 → <font color=\"rgb(100,255,100)\">20</font>",
                            "Lvl 3 Damage: 15 → <font color=\"rgb(100,255,100)\">20</font>",
                            "Lvl 4 Damage: 32 → <font color=\"rgb(100,255,100)\">40</font>",
                            "Lvl 5 Damage: 55 → <font color=\"rgb(100,255,100)\">75</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Archer",
                        Points = {"Lvl 4 Cost: 2375 → <font color=\"rgb(100,255,100)\">2750</font>"},
                    },
                },
            },
        },
    },
}