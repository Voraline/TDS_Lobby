-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.52.0
-- Decompile time: 1.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🐖 Game Master 🐖",
    ImageId = 137771493823909,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🤠 Badlands Rework 🤠",
                        Points = {
                            "The Gunslinger challenges you to duel against his brand new army of undead minions!",
                            function(a1, a2) -- Line: 18 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 87061025671893,
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
                        HeaderName = " 🐖 Ultimate Skin 🐖",
                        Points = {
                            "New Crook Boss skin: Game Master",
                            "Spawns a piggy bank on the map after certain amount of damage is dealt",
                            "Goons has been replaced with Pink Soliders",
                            "You can now gift this skin to your friends!",
                            "On sale for î€‚ 749",
                            function(a1, a2) -- Line: 38 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 113996066834123,
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "💥 New Skins 💥", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Items = {
                            {
                                Type = "tower",
                                Name = "Crook Boss",
                                Skin = "Game Master",
                                Details = "Game Master",
                            },
                            {
                                Type = "tower",
                                Name = "Rocketeer",
                                Skin = "Fortress",
                                Details = "Fortress",
                            },
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Next Week 🔥",
                        Points = {
                            "Valentine Missions + Crate",
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
                        Minimize = 0.3,
                        SubjectName = "Bug Fixes & Changes",
                        Points = {
                            "Added \"Show Currency Drops\" setting for item pickup visibility",
                            "Added gifting to ultimate skins, currency and some gamepasses",
                            "Updates to revive tickets to check for game completion, and revert\nback to first uncomplete wave",
                            "Removed low quality paths setting",
                            "Chances and pity rates for logbooks are tripled",
                            "Three new eco game-rules: Economy on hit, group tax, and\nno-bum-penalty",
                            "Removed Rocketeer's damage drop off to make explosions deal\nconsistent damage",
                            "Fixed Rocketeer's quad missiles targeting flying enemies when\nmissing flying detection",
                            "Added missing hat upgrades to Steampunk Rocketeer",
                            "Adjust Toy Rocketeer's platform to fit animations better",
                            "Adjusted Lunar Rocketeer's shoulder ornaments",
                            "Adjusted Xmas Rocketeer's Ornaments",
                            "Adjusted Lunar Hallow Punk's weapon grip",
                            "Adjusted Lunar Harvester's snake body to be more consistent with\nanimations",
                            "Added face to Masquerade Medic",
                            "Added face to Masquerade DJ Booth",
                            "Readded Corso's Crook Boss weapons",
                            "Fixed clipping issues in Lunar Harvester",
                            "Fixed clipping issues in Discord Minigunner",
                            "Fixed clipping issues in Bunny Minigunner",
                            "Fixed meshes in Fallen Sledger",
                            "Fixed meshes in Fallen Scout",
                            "Fixed Cryptid Freezer's upgrades",
                            "Fixed Vigilante Mortar's upgrade 3 and 5 weapon",
                            "Fixed Pirate Mortar's final level model",
                            "Fixed Mako DJ's final levels speakers' rotation",
                            "Fixed Eggrypted Commander's weapons",
                            "Fixed Frost Legion Grenadier's visible part",
                            "Fixed Frost Legion Field Medic's visible part",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Badland Changes",
                        Points = {
                            "Increased coin reward from 1105 coins to 1350 coins",
                            "Increased exp reward from 204 Exp to 240 Exp (255 → <font color=\"rgb(100,255,100)\">300 for</font> VIP)",
                            "Chance to earn tickets and consumables on win",
                            "Updated Eco system, enemy kill rewards are not evenly split to all players",
                            "Old Event enemies have been added",
                            "Adjusted wave structure (40 waves → <font color=\"rgb(255,100,100)\">30 waves</font>)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Pizza Party Changes",
                        Points = {
                            "Increased exp reward from 140 Exp to 220 Exp (175 → <font color=\"rgb(100,255,100)\">275 for</font> VIP)",
                            "Chance to earn tickets and consumables on win",
                        },
                    },
                },
            },
        },
    },
}