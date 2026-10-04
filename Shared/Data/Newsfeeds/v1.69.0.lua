-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.69.0
-- Decompile time: 0.81 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🇺🇸 4TH OF JULY 🦅",
    ImageId = 121484453690201,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🎆 4th of July 🇺🇸",
                        Points = {
                            "Added new \"Eagle Screech\" mission for new military base skin!",
                            "Added new \"Rise For The Pledge!\" mission for unlocking the Firework Technician tower!",
                            "On the 4th of July, you should also see the modifier 'July Fourth' enabled!",
                            "These are only available for a limited time, so make sure to complete them before they go away!",
                        },
                    },
                },
                {
                    Type = "Items",
                    Props = {
                        Items = {
                            {Type = "tower", Name = "Firework Technician", Skin = "Default"},
                            {
                                Type = "tower",
                                Name = "Military Base",
                                Skin = "Base 1776",
                                Details = "Base 1776",
                            },
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "ℹ️ Tower Information",
                        Points = {
                            "Added new polished visuals for displaying tower information!",
                            "You can now see all the information for the tower once you place it!",
                            "As you upgrade the tower the information updates with the latest stats!",
                            function(a1, a2) -- Line: 49 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 115351858547973,
                                    Text = "Example using the Accelerator tower!",
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
                            "☀️ Summer Battlepass",
                            "🥊 PVP Gamemode",
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
                            "We've made some adjustments to the skin equipping page to\nmake room for skin creator information",
                            "Daily crates now properly show as locked for users who have\npaid random items disabled",
                            "Updated the wave counter ui to be smaller and overlap with health bar",
                            "Updated issue with Nuclear Monster getting locked when using\nlaser ability",
                            "Disabled the ability to keep replaying tutorial to keep getting\nrewards after completing it",
                            "Some miscellaneous bug fixes have been applied to the\nmission quest system to solve some issues with missions not\nbeing able to be completed",
                        },
                    },
                },
            },
        },
    },
}