-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.51.0
-- Decompile time: 1.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🧨 Lunar New Year 🧨",
    ImageId = 94927003914113,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Rocketeer Rework",
                        Points = {
                            "Missiles will lock-on to 4 different targets if in range",
                            "If not enough targets are in range then remaining missiles will lock onto targets in range.",
                            function(a1, a2) -- Line: 20 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 122820649576404,
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {
                    Type = "Items",
                    Props = {
                        Minimize = 0.6,
                        Items = {
                            {Type = "tower", Name = "Rocketeer", Skin = "Default", Details = "Default"},
                            {Type = "tower", Name = "Rocketeer", Skin = "Pumpkin", Details = "Pumpkin"},
                            {
                                Type = "tower",
                                Name = "Rocketeer",
                                Skin = "Steampunk",
                                Details = "Steampunk",
                            },
                            {Type = "tower", Name = "Rocketeer", Skin = "Toy", Details = "Toy"},
                            {Type = "tower", Name = "Rocketeer", Skin = "Bosanka", Details = "Bosanka"},
                            {
                                Type = "tower",
                                Name = "Rocketeer",
                                Skin = "Dark Matter",
                                Details = "Dark Matter",
                            },
                            {Type = "tower", Name = "Rocketeer", Skin = "Xmas", Details = "Xmas"},
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "💥 Lunar New Year 💥",
                        Points = {
                            "Lunar New Year Crate",
                            "On sale for a week only for 5,000 coins!",
                            "New Lunar Nametag",
                            "Hallow Punk and Harvester has returned on sale for 72 hours!",
                            "Purchasing Hallow Punk and/or Harvester will grant you a free Lunar skin for said tower!",
                        },
                    },
                },
                {
                    Type = "Items",
                    Props = {
                        Items = {
                            {Type = "tower", Name = "Rocketeer", Skin = "Lunar", Details = "Lunar"},
                            {Type = "tower", Name = "Hallow Punk", Skin = "Lunar", Details = "Lunar"},
                            {Type = "tower", Name = "Harvester", Skin = "Lunar", Details = "Lunar"},
                            {Type = "nametag", Name = "Lunar"},
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Next Week 🔥",
                        Points = {
                            "Badlands Mini-Rework",
                            function(a1, a2) -- Line: 128 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 77024427054088,
                                    Text = "Next Ultimate Skin",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 136 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 71632974306369,
                                    Text = "Fortress Rocketeer",
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
                        Minimize = 0.65,
                        SubjectName = "Pizza Party Changes",
                        Points = {
                            "Increased win reward from 1125 coins to 1250 coins",
                            "Increase to enemy kill eco reward across almost all enemies",
                            "Tiny Nerf to shotgunner health (2500 → <font color=\"rgb(255,100,100)\">2250</font>)",
                            "Tiny Nerf to Wox speed(1 → <font color=\"rgb(255,100,100)\">0.9</font>)",
                            "Massive increase to final wave eco bonus (50,000 → <font color=\"rgb(100,255,100)\">75,000 in</font> Solos)",
                            "Tiny Nerf to Minigunner Speed (2.5 → <font color=\"rgb(255,100,100)\">2.25</font>)",
                            "Removed Stun immune from Marionette",
                            "Removed Stun immune from Executioner plush",
                            "Tiny Nerf to Executioner plush Speed (2 → <font color=\"rgb(255,100,100)\">1.75</font>)",
                            "Reduced total health for Executioner Plush (100,000 → <font color=\"rgb(255,100,100)\">85,000</font>)",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Rocketeer",
                        Points = {
                            "Updated animations and visuals",
                            "Lvl 4 Cost (20000 → <font color=\"rgb(255,100,100)\">18500</font>)",
                            "Lvl 4 Explosion Radius (4 → <font color=\"rgb(100,255,100)\">5</font>)",
                            "Lvl 4 Damage (400 → <font color=\"rgb(255,100,100)\">90</font>)",
                            "Final Level now fires 4 missiles",
                        },
                    },
                },
            },
        },
    },
}