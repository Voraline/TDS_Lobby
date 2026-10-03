-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.55.0
-- Decompile time: 0.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🧪 Easy Mini-Rework 🧪",
    ImageId = 122888714711215,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🧪 Easy Mode 🧪",
                        Points = {
                            "New \"Brute\" boss for Easy mode",
                            "Starting cash in Easy mode will no-longer decrease based on the number of players in the match",
                            function(a1, a2) -- Line: 19 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 116003089107591,
                                    Text = "A Brute has appeared to challenge our newest and youngest comrades!",
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
                        Points = {"Some event 🦆", "...keep an eye on our socials for more info! 📢"},
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
                        SubjectName = "Changes",
                        Points = {
                            "Replaced all Intermediate mode music with its own music",
                            "Grave Digger is now the boss for Casual mode and has been rebalanced\n for the gamemode",
                            "Small tweak to wave 18 in Casual mode",
                            "Fixed Pirate Warden max upgrade hat",
                        },
                    },
                },
            },
        },
    },
}