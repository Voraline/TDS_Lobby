-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.32.0
-- Decompile time: 1.63 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "💥 Gatling Gun 💥",
    ImageId = 71431493567123,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "New Tower - Gatling Gun",
                        Points = {
                            function(a1, a2) -- Line: 17 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 88063996626222,
                                    Text = "New tower in action",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 25 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 86803638789408,
                                    Text = "Allows the user to take control of the Gatling Gun. Bullets gain Piercing",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 33 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 123252855110919,
                                    Text = "Gatling Gun fires based on what enemies are in its cone of vision",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        Item = {Type = "tower", Name = "Gatling Gun"},
                        Changes = {
                            {
                                Title = "General Changes",
                                Lines = {
                                    "<b>Placement Limit:</b> 1",
                                    "<b>Active Ability:</b> \"FPS\"",
                                    "Allows the user to take control of the Gatling Gun. Bullets gain Piercing.",
                                    "Fires based on what enemies are in its cone of vision.",
                                    "Level 0 unlocks Flying Detection.",
                                    "Level 3 unlocks Hidden Detection.",
                                },
                            },
                            {
                                Title = "Level 0 Changes",
                                Lines = {
                                    "<b>Cost:</b> 5,000",
                                    "<b>Damage:</b> 6",
                                    "<b>Cooldown:</b> 0.15",
                                    "<b>Range:</b> 25",
                                    "<b>Ammo:</b> 50",
                                    "<b>Reload Time:</b> 2.5 Seconds",
                                    "<b>Cone View Angle:</b> 45",
                                },
                            },
                            {
                                Title = "Level 1 Changes",
                                Lines = {
                                    "<b>Cost:</b> 3,000",
                                    "<b>Damage:</b> 8",
                                    "<b>Cooldown:</b> 0.15",
                                    "<b>Range:</b> 30",
                                    "<b>Ammo:</b> 50",
                                    "<b>Reload Time:</b> 2.5 Seconds",
                                    "<b>Cone View Angle:</b> 45",
                                },
                            },
                            {
                                Title = "Level 2 Changes",
                                Lines = {
                                    "<b>Cost:</b> 8,250",
                                    "<b>Damage:</b> 12",
                                    "<b>Cooldown:</b> 0.15",
                                    "<b>Range:</b> 30",
                                    "<b>Ammo:</b> 100",
                                    "<b>Reload Time:</b> 2 Seconds",
                                    "<b>Cone View Angle:</b> 45",
                                },
                            },
                            {
                                Title = "Level 3 Changes",
                                Lines = {
                                    "<b>Cost:</b> 17,500",
                                    "<b>Damage:</b> 18",
                                    "<b>Cooldown:</b> 0.12",
                                    "<b>Range:</b> 35",
                                    "<b>Ammo:</b> 200",
                                    "<b>Reload Time:</b> 2 Seconds",
                                    "<b>Cone View Angle:</b> 60",
                                },
                            },
                            {
                                Title = "Level 4 Changes",
                                Lines = {
                                    "<b>Cost:</b> 35,000",
                                    "<b>Damage:</b> 28",
                                    "<b>Cooldown:</b> 0.09",
                                    "<b>Range:</b> 45",
                                    "<b>Ammo:</b> 200",
                                    "<b>Reload Time:</b> 2 Seconds",
                                    "<b>Cone View Angle:</b> 60",
                                },
                            },
                            {
                                Title = "Level 5 Changes",
                                Lines = {
                                    "<b>Cost:</b> 60,000",
                                    "<b>Damage:</b> 55",
                                    "<b>Cooldown:</b> 0.09",
                                    "<b>Range:</b> 50",
                                    "<b>Ammo:</b> 400",
                                    "<b>Reload Time:</b> 6 Seconds",
                                    "<b>Cone View Angle:</b> 75",
                                },
                            },
                            {
                                Title = "Level 6 Changes",
                                Lines = {
                                    "<b>Cost:</b> 100,000",
                                    "<b>Damage:</b> 100",
                                    "<b>Cooldown:</b> 0.09",
                                    "<b>Range:</b> 50",
                                    "<b>Ammo:</b> 600",
                                    "<b>Reload Time:</b> 6 Seconds",
                                    "<b>Cone View Angle:</b> 75",
                                },
                            },
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "New Upgrade UI",
                        Points = {
                            "We have refreshed the upgrade UI to perform better and look cleaner",
                            "Upgrades now feel instant and responsive",
                            "Tower Previews now show the current upgrade and animation",
                            "Upgrade text now scrolls and shows drop-downs for more information",
                            "Other functionality has been added for an upcoming tower... watch out 👀",
                            function(a1, a2) -- Line: 160 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 123008753558365,
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
                        SubjectName = "32",
                        Points = {"This is v1.32.0", "Therefore, 32", "You know what to do..."},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "🔥 Coming Soon 🔥",
                        Points = {
                            "Pursuit Rework 🚁",
                            "Halloween in the works! 🎃",
                            "...keep an eye on our socials for more info! 📢",
                        },
                    },
                },
            },
        },
    },
}