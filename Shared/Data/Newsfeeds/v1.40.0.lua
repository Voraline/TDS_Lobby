-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.40.0
-- Decompile time: 0.82 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "Bug Fixes and QOL Improvements",
    ImageId = 79515767807016,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🎃 Halloween Update 🎃",
                        HeaderSubject = "\nWe are extending the event by 2 weeks. The event will now end on <font color=\"#FFFF00\">11/20/2024</font>. You can still earn the event towers and mission quest skins until then.\n",
                        Points = {},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        Minimize = 0.65,
                        HeaderName = "🛠️ Game Changes 🛠️",
                        Points = {
                            "Fixed Harvester projectile not appearing",
                            "Fixed Health Regen enemy modifier healing enemies to full at time-scale 0",
                            "Fixed defense melt on other units",
                            "Fixed Wasteland Farm animation at level 2",
                            "Fixed Green Paintballer at level 3",
                            "Defense melt no longer applies to Boss enemies",
                            "Added 60 second lifespan to inactive Trapper traps",
                            "Added immediate trap swapping when selecting a new trap",
                            "Added 10 second cooldown to trap selection",
                            "Adjusted Trapper animations to look better",
                            function(a1, a2) -- Line: 36 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 103503029585068,
                                    Text = "Old traps will now expire over time",
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
                            "Small Event? 👀 💸",
                            function(a1, a2) -- Line: 53 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 124367818291926,
                                    Text = "💸💸💸💸💸💸",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            "Pursuit Rework",
                            "Commando Rework",
                            "...keep an eye on our socials for more info! 📢",
                        },
                    },
                },
            },
        },
    },
}