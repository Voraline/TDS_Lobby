-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.75.0
-- Decompile time: 1.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🧪 Modifiers & Trials ⚖️",
    ImageId = 108769528197345,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "⚖️ CHALLENGE TRIALS! (NEW GAME MODE)",
                        HeaderSubject = "Ready to test your skills? Challenge Trials are here! Complete Trials to earn modifiers that you can apply to your matches!",
                        Points = {
                            "Challenge Trials rotate every 3 hours",
                            "Brand new wave structure exclusively for Challenge Trials",
                            "Removed Challenge Maps.",
                            function(a1, a2) -- Line: 21 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 106941549904812,
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
                        Minimize = 0.5,
                        HeaderName = "🧪 GAME MODIFIERS!",
                        HeaderSubject = "The long awaited Modifiers feature is LIVE! Directly increase the difficulty of your matches to earn more rewards!",
                        Points = {
                            "(x1.1) Glass - Base health is reduce to 1 HP",
                            "(x1.2) Flying Enemies - All enemies are Flying after wave 5",
                            "(x1.2) Hidden Enemies - All enemies are Hidden after wave 5",
                            "(x1.2) Healthy Enemies - All enemies are Bloated",
                            "(x1.2) Speedy Enemies - All enemies are Nimble",
                            "(x1.3) Exploding Enemies - Enemies explode on death",
                            "(x1.1) Committed - You cannot sell towers",
                            "(x1.1) Limitations - Your tower placement limit is reduced",
                            "(x1.3) Quarantine - Your towers are unable to be placed next to each other",
                            "(x1.3) Fog - All tower ranges are reduced by 35%",
                            "(x1.2) Broke - All income sources are reduced by 33%",
                            "(x1.2) Inflation - All prices are increased by 50%",
                            "(x1.2) Jailed - Every wave a tower is disabled after wave 5",
                            function(a1, a2) -- Line: 51 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 95987666302000,
                                    Text = "Toggle different modifiers in-game!",
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
                        HeaderName = "📜 Mission Quests Update!",
                        Points = {
                            "Removed timers from Mission Quests",
                            "All Mission Quests are available to start at anytime.",
                            function(a1, a2) -- Line: 69 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 92258183760229,
                                    Text = "New Mission Quests shop!",
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
                        HeaderName = "⚖️ New Elevator System!",
                        Points = {
                            "Players can now choose their match size in elevators.",
                            "Elevators now support the Party system.",
                            "Players can now ready up in elevators to start the match early.",
                            function(a1, a2) -- Line: 88 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 105540561773822,
                                    Text = "Elevators finally get some love!",
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
                        HeaderName = "🎁 Playtime Rewards!",
                        Points = {
                            "Earn rewards for free, just for playing the game!",
                            "Resets daily",
                            function(a1, a2) -- Line: 106 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 91397893392846,
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
                        HeaderName = "01010011 01001111 01001111 01001110",
                        Points = {
                            "01010110 01000101 01010010 01011001",
                            "01010110 01000101 01010010 01011001",
                            "01010011 01001111 01001111 01001110 00101110",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "",
                        Points = {
                            function(a1, a2) -- Line: 133 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 113889651898434,
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {Type = "EventButton", Props = {eventId = "2313187340102402594"}},
            },
        },
        {
            Name = "🔨 Game Changes:",
            Content = {
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Medic",
                        Points = {
                            "Removed Triple Detections on Uber",
                            "Lvl 1 Cost: 300 → <font color=\"rgb(100,255,100)\">500</font>",
                            "vl 0 Firerate Passive: 20% → <font color=\"rgb(255,100,100)\">15%</font>",
                            "Lvl 1 Firerate Passive: 20% → <font color=\"rgb(255,100,100)\">15%</font>",
                            "Lvl 2 Firerate Passive: 20% → <font color=\"rgb(255,100,100)\">15%</font>",
                            "Lvl 3 Firerate Passive: 20% → <font color=\"rgb(255,100,100)\">15%</font>",
                            "Lvl 4 Firerate Passive: 20% → <font color=\"rgb(255,100,100)\">15%</font>",
                            "Lvl 5 Firerate Passive: 20% → <font color=\"rgb(255,100,100)\">15%</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Golden Soldier",
                        Points = {
                            "Lvl 1 Cost: 150 → <font color=\"rgb(100,255,100)\">250</font>",
                            "Lvl 3 Cost: 3000 → <font color=\"rgb(100,255,100)\">5750</font>",
                            "Lvl 4 Cost: 12000 → <font color=\"rgb(100,255,100)\">14500</font>",
                            "Lvl 4 Cooldown: 0.06 → <font color=\"rgb(100,255,100)\">0.08</font>",
                            "Lvl 1 Burst: 4 → <font color=\"rgb(100,255,100)\">5</font>",
                            "Lvl 2 Burst: 4 → <font color=\"rgb(100,255,100)\">5</font>",
                            "Lvl 1 Burst Cooldown: 0.6 → <font color=\"rgb(255,100,100)\">0.5</font>",
                            "Lvl 2 Burst Cooldown: 0.6 → <font color=\"rgb(255,100,100)\">0.5</font>",
                            "Lvl 3 Burst Cooldown: 1.2 → <font color=\"rgb(255,100,100)\">0</font>",
                            "Lvl 4 Burst Cooldown: 1.2 → <font color=\"rgb(255,100,100)\">0</font>",
                            "Lvl 0 Range: 14 → <font color=\"rgb(100,255,100)\">18</font>",
                            "Lvl 1 Range: 14 → <font color=\"rgb(100,255,100)\">18</font>",
                            "Lvl 2 Range: 17 → <font color=\"rgb(100,255,100)\">20</font>",
                            "Lvl 3 Range: 17 → <font color=\"rgb(100,255,100)\">20</font>",
                            "Lvl 4 Range: 19 → <font color=\"rgb(100,255,100)\">25</font>",
                        },
                    },
                },
            },
        },
    },
}