-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.63.0
-- Decompile time: 0.95 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🐝 Swarmer Rework",
    ImageId = 122995175333858,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🐝 Swarmer",
                        Points = {
                            "Swarmer has been reworked to bring out its boss killing/single-target potential.",
                            "Multiple swarmers can now stack bees on the same target allowing the player to stack multiple damage over-time sources on a single target.",
                            function(a1, a2) -- Line: 19 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 104305842436949,
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {SubjectName = "🗺️ Rework Map Added:", Points = {"Space City"}},
                },
            },
        },
        {
            Name = "🔨 Game Changes:",
            Content = {
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Swarmer",
                        Points = {
                            "Lvl 0 Cost: 300 → <font color=\"rgb(100,255,100)\">450</font>",
                            "Lvl 2 Cost: 350 → <font color=\"rgb(100,255,100)\">500</font>",
                            "Lvl 3 Cost: 500 → <font color=\"rgb(100,255,100)\">1500</font>",
                            "Lvl 4 Cost: 1400 → <font color=\"rgb(100,255,100)\">3000</font>",
                            "Lvl 5 Cost: 4000 → <font color=\"rgb(100,255,100)\">6000</font>",
                            "Lvl 0 Damage: 2 → <font color=\"rgb(255,100,100)\">1</font>",
                            "Lvl 1 Damage: 2 → <font color=\"rgb(255,100,100)\">1</font>",
                            "Lvl 2 Damage: 2 → <font color=\"rgb(100,255,100)\">4</font>",
                            "Lvl 3 Damage: 2 → <font color=\"rgb(100,255,100)\">10</font>",
                            "Lvl 4 Damage: 2 → <font color=\"rgb(100,255,100)\">15</font>",
                            "Lvl 5 Damage: 2 → <font color=\"rgb(100,255,100)\">25</font>",
                            "Lvl 0 Range: 12 → <font color=\"rgb(100,255,100)\">13</font>",
                            "Lvl 1 Range: 12 → <font color=\"rgb(100,255,100)\">13</font>",
                            "Lvl 2 Range: 16 → <font color=\"rgb(255,100,100)\">15</font>",
                            "Lvl 3 Range: 18 → 18",
                            "Lvl 4 Range: 18 → <font color=\"rgb(100,255,100)\">20</font>",
                            "Lvl 3 Cooldown: 1 → <font color=\"rgb(100,255,100)\">1.25</font>",
                            "Lvl 4 Cooldown: 1 → 1",
                            "Lvl 5 Cooldown: 0.5 → <font color=\"rgb(100,255,100)\">0.75</font>",
                            "Lvl 4 Bee Damage: 4 → <font color=\"rgb(255,100,100)\">3</font>",
                            "Lvl 5 Bee Damage: 6 → <font color=\"rgb(255,100,100)\">4</font>",
                            "Lvl 1 Bee Tick Rate: 0.75 → <font color=\"rgb(100,255,100)\">1</font>",
                            "Lvl 4 Bee Tick Rate: 0.5 → <font color=\"rgb(100,255,100)\">0.75</font>",
                            "Lvl 5 Bee Tick Rate: 0.25 → <font color=\"rgb(100,255,100)\">0.5</font>",
                            "Lvl 2 Bee Duration: 4 → <font color=\"rgb(100,255,100)\">4.5</font>",
                            "Lvl 3 Bee Duration: 4 → <font color=\"rgb(100,255,100)\">5.25</font>",
                            "Lvl 4 Bee Duration: 6 → <font color=\"rgb(255,100,100)\">5.5</font>",
                            "Lvl 3 Bee Grenade Splash Range: 8 → <font color=\"rgb(255,100,100)\">6</font>",
                            "Lvl 4 Bee Grenade Splash Range: 8 → <font color=\"rgb(255,100,100)\">7</font>",
                            "Lvl 4 Bee Grenade Damage: 10 → <font color=\"rgb(100,255,100)\">30</font>",
                            "Lvl 5 Bee Grenade  Damage: 10 → <font color=\"rgb(100,255,100)\">50</font>",
                        },
                    },
                },
            },
        },
    },
}