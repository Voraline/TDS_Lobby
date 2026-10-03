-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.68.0
-- Decompile time: 1.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "👶 First-Time User Update",
    ImageId = 133521365788414,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "✅ Updated User Interface / UX",
                        Points = {
                            "Added new polished visuals for ready button!",
                            "You can now see whos voted for starting the game.",
                            "You can also un-ready if you change your mind.",
                            function(a1, a2) -- Line: 19 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 115521460667532,
                                    Text = "Updated more polished visuals for ready button.",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 27 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 70845348409367,
                                    Text = "Updated gamemode cards with gamemode rewards.",
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
                            "🎆 4th of July Skin (Next Week!)",
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
                            "Updated skill-tree music",
                            "Fixed a lot of timings for all the tutorial prompts to ensure they are not\ntoo fast or too slow.",
                            "You can now see the current wave number out of total waves in\nthe wave counter",
                            "Skills are now level locked to level 15.",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        Minimize = 0.65,
                        SubjectName = "Tutorial",
                        Points = {
                            "Added a brand new wave at the end tutorial to allow players to play\naround with their towers.",
                            "Added a custom prompt to start the tutorial.",
                            "Added voice lines for the commander for all dialog in the tutorial.",
                            "Updated the health-bar and color to show tutorial progress.",
                            "Spotlights now only let you press the button and not outside the button.",
                            "Demoman is now not awarded until you reach the lobby tutorial.",
                            "Lobby tutorial has now been re-enabled for new players.",
                            "Fixed the tower given UI to be bigger and more visible.",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Fallen",
                        Points = {
                            "Fallen mode has been tweaked again based on community feedback to\nmake it more challenging .",
                            "Wave structure has been tweaked across in the early, mid, late game",
                            "Various Fallen enemies have also had small adjustments",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        Minimize = 0.65,
                        SubjectName = "Tower Coin Prices",
                        Points = {
                            "Ace Pilot: $3,500 → $1,500",
                            "Farm: $2,500 → $2,000",
                            "Freezer: $1,600 → $500",
                            "Hunter: $300 → $200",
                            "Medic: $1,500 → $800",
                            "Militant: $1,500 → $650",
                            "Pyromancer: $3,500 → $1,250",
                            "Shotgunner: $2,500 → $1,000",
                            "Soldier: $400 → $350",
                        },
                    },
                },
            },
        },
    },
}