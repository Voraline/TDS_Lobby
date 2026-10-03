-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.50.0
-- Decompile time: 1.03 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🍕 Mini Pizza Party Rework 🍕",
    ImageId = 78995519865059,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🍕 Pizza Party 🍕",
                        Points = {
                            "Changes to wave structure",
                            "Returning event enemies",
                            "Updated Pizza Party to new eco system",
                            function(a1, a2) -- Line: 20 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 75630058605544,
                                    Text = "Wox is back with a new legion of haunted and tormented minions",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {HeaderName = "💥 New Skin 💥", Points = {"New Deluxe crate skin"}},
                },
                {
                    Type = "Items",
                    Props = {
                        Items = {{Type = "tower", Name = "Military Base", Skin = "Cyber", Details = "Cyber"}},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Next Week 🔥",
                        Points = {"Badlands Mini-Rework", "...keep an eye on our socials for more info! 📢"},
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
                        SubjectName = "Small Changes",
                        Points = {
                            "Legacy map modifiers ported to the new system, modifier rewards\nwill now display properly for legacy maps",
                            "Added molten corpse to sandbox mode",
                            "Fixed towers not being selectable if a challenge force changes your\nloadout in sandbox mode",
                            "Fixed “Data” very rarely showing up as a map in elevators",
                            "Fixed gamemodes not properly ending after successful completion in\nsandbox mode",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Mortar",
                        Points = {
                            "Level 3 Cost: 3500 → <font color=\"rgb(255,100,100)\">3250</font>",
                            "Level 3 Damage: 50 → <font color=\"rgb(100,255,100)\">60</font>",
                            "Level 4 Cost: 10000 → <font color=\"rgb(100,255,100)\">12000</font>",
                            "Level 4 Cluster Count: 4 → <font color=\"rgb(255,100,100)\">3</font>",
                            "Level 5 Cost: 22500 → <font color=\"rgb(100,255,100)\">25000</font>",
                            "Level 5 Cluster Damage: 75 → <font color=\"rgb(255,100,100)\">50</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Necromancer",
                        Points = {
                            "Level 3 Damage: 20 → <font color=\"rgb(100,255,100)\">30</font>",
                            "Level 3 Soul Meter: 320 → <font color=\"rgb(100,255,100)\">450</font>",
                            "Level 4 Cost: 48000 → <font color=\"rgb(255,100,100)\">44000</font>",
                            "Level 4 Damage Per Beam: 15 → <font color=\"rgb(100,255,100)\">20</font>",
                        },
                    },
                },
            },
        },
    },
}