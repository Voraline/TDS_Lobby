-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.66.0
-- Decompile time: 0.48 ms

return {
    UpdateName = "🛒 Walmart Partnership",
    ImageId = 135749242115238,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🛒 Walmart Discovered Pass!",
                        Points = {
                            "Introducing the exclusive Walmart Discovered Pass partnership!",
                            "<b>Discovered Farm Skin:</b> Get the exclusive Discovered Farm tower skin.",
                            "<b>Special Missions:</b> Complete Walmart-themed mission for rewards.",
                            "<b>Limited Time:</b> Available for a limited time - don't miss out!",
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "💰 Farm Skin", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Items = {{Type = "tower", Name = "Farm", Skin = "Discovered", Details = "Discovered"}},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Coming Up 🔥",
                        Points = {"💻 Hacker Tower", "...keep an eye on our socials for more info! 📢"},
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
                        SubjectName = "Bug Fixes",
                        Points = {
                            "Fixed Rocketeer's explosions dealing inconsistent damage",
                            "Fixed Sledger having an extra max hit",
                            "Fixed Elementalist's Ice Turret being targeted by Field Medic",
                        },
                    },
                },
            },
        },
    },
}