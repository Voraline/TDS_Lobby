-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.33.0
-- Decompile time: 1.12 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "Easy Gamemode Refresh",
    ImageId = 135749242115238,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Cyber City Refresh",
                        Points = {
                            function(a1, a2) -- Line: 17 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 135749242115238,
                                    Text = "Completely new feel!",
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
                        SubjectName = "Upgrade UI Changes",
                        Points = {
                            "Changed mobile touch to use tap in world",
                            "Changed button activation event for proper mobile clicks",
                            "Optimized Tooltip component",
                            "Added Upgrade UI toggle upon clicking selected tower",
                            "Added setting to Always Show Options in Upgrades UI",
                            "Implemented console keybinds",
                            "Fixed Upgrades UI memory leaking on selecting certain towers",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Gamemode Changes",
                        Points = {
                            function(a1, a2) -- Line: 48 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 111655722531143,
                                    Text = "Some enemies got a refresh",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            "Added ambience music to Easy and Intermediate",
                            "Molten Triumphs Coin rewards (450 → <font color=\"rgb(255,100,100)\">400</font>)",
                            "Molten Triumphs EXP rewards (75 → <font color=\"rgb(100,255,100)\">90</font>)",
                            "Intermediate Triumphs Coin rewards (450 → <font color=\"rgb(100,255,100)\">500</font>)",
                            "Intermediate Triumphs EXP rewards (75 → <font color=\"rgb(100,255,100)\">120</font>)",
                            "Fallen Triumphs Coin rewards (800 → <font color=\"rgb(100,255,100)\">1000</font>)",
                            "Fallen Triumphs EXP rewards (125 → <font color=\"rgb(100,255,100)\">250</font>)",
                            "Hardcore Triumphs EXP rewards (180 → <font color=\"rgb(100,255,100)\">400</font>)",
                            "Pizza Party Triumphs Coin rewards (975 → <font color=\"rgb(255,100,100)\">900</font>)",
                            "Pizza Party Triumphs EXP rewards (150 → <font color=\"rgb(100,255,100)\">175</font>)",
                            "Paintballer Coin Price (150 → <font color=\"rgb(255,100,100)\">100</font>)",
                            "Demoman Coin Price (250 → <font color=\"rgb(255,100,100)\">200</font>)",
                            "Adjustments to Easy mode wave structure",
                            "Grave Digger gained new abilities!",
                            "Grave Digger Health (15000 → <font color=\"rgb(100,255,100)\">20000</font>)",
                            "Speedy Boss returns to Easy mode",
                            "Speedy Boss Health (1800 → <font color=\"rgb(255,100,100)\">1300</font>)",
                            "Speedy Boss comes to intermediate mode",
                            "Necromancer Easy Health (250 → <font color=\"rgb(100,255,100)\">300</font>)",
                            "Speedy Easy Health (3 → <font color=\"rgb(100,255,100)\">4</font>)",
                            "Breaker 2 Easy Health (15 → <font color=\"rgb(100,255,100)\">20</font>)",
                            "Breaker 4 Easy Health (140 → <font color=\"rgb(100,255,100)\">160</font>)",
                            "Hidden Easy Health (10 → <font color=\"rgb(100,255,100)\">15</font>)",
                            "Slow Boss Easy Health (1600 → <font color=\"rgb(100,255,100)\">1750</font>)",
                            "Normal Boss Easy Health (160 → <font color=\"rgb(100,255,100)\">180</font>)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "New Patient Zero Skin",
                        Points = {
                            "Free gift with the new Patient Zero Plushie",
                            "Plushie goes on sale September 28th @ 12:00 PM ET",
                            function(a1, a2) -- Line: 91 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 76997295686336,
                                    Text = "🧟‍♂️ Accelerator Skin 🧟‍♂️",
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
                        SubjectName = "🔥 Coming Soon 🔥",
                        Points = {
                            "Halloween in the works! 🎃",
                            "New Lobby??? 🤔",
                            "...keep an eye on our socials for more info! 📢",
                        },
                    },
                },
            },
        },
    },
}