-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.42.0
-- Decompile time: 1.12 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "💥 Commando 💥",
    ImageId = 78484307744173,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Commando Rework 💥",
                        Points = {
                            "The Commando rework introduces a new Missile ability, starting at Level 3.",
                            "The missiles deal high damage and can stun enemies, with upgrades at Level 4.",
                            "The base model and the \"Pirate\" skin have been updated for a fresh look.",
                            "A new \"Trooper\" skin has also been added and can be earned through T.D.S. Commandos.\n",
                            function(a1, a2) -- Line: 21 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 131035251325309,
                                    Text = "Pew pew",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New/Rework Skins 🔥", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Items = {
                            {Type = "tower", Name = "Commando", Skin = "Trooper", Details = "Trooper"},
                            {Type = "tower", Name = "Commando", Skin = "Pirate", Details = "Pirate"},
                            {Type = "tower", Name = "Commando", Skin = "Default", Details = "Default"},
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "New Fall Theme Lobby 🍂",
                        HeaderSubject = "With the halloween event over, we're introducing a new fall theme lobby! Candy Corns can still be earned and we have increased the drop rates by <b><font size=\"40\"><font color=\"#FFFFFF\">2x</font></font></b>",
                        Points = {},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🛠️ Game Changes 🛠️",
                        Points = {
                            "Fixed emote interactions",
                            "Fixed Sentry lifespan with time-scale",
                            "Fixed Turret Crossbow lvl 3 and 4 animations",
                            "Fixed Fallen Honor Guard attack",
                            "Fixed Blizzard Bomb infinite freeze",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Coming Up 🔥",
                        Points = {
                            "Molten Rework",
                            "PvP",
                            "Operation I.C.E. ❄️",
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
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Commando",
                        Points = {
                            "Lvl 0 Cost: 2250",
                            "Lvl 1 Cost: 935",
                            "Lvl 2 Cost: 3250",
                            "Lvl 3 Cost: 8500",
                            "Lvl 4 Cost: 20000",
                            "Lvl 0 Damage: 6",
                            "Lvl 1 Damage: 8",
                            "Lvl 2 Damage: 10",
                            "Lvl 3 Damage: 15",
                            "Lvl 4 Damage: 16",
                            "Lvl 0 Burst Size: 3",
                            "Lvl 1 Burst Size: 3",
                            "Lvl 2 Burst Size: 5",
                            "Lvl 3 Burst Size: 6",
                            "Lvl 4 Burst Size: 10",
                            "Lvl 0 Cooldown: 0.5",
                            "Lvl 1 Cooldown: 0.5",
                            "Lvl 2 Cooldown: 0.5",
                            "Lvl 3 Cooldown: 0.35",
                            "Lvl 4 Cooldown: 0.3",
                            "Lvl 0 Burst Cooldown: 0.2",
                            "Lvl 1 Burst Cooldown: 0.2",
                            "Lvl 2 Burst Cooldown: 0.2",
                            "Lvl 3 Burst Cooldown: 0.15",
                            "Lvl 4 Burst Cooldown: 0.125",
                            "Lvl 0 Pierce: 2",
                            "Lvl 1 Pierce: 3",
                            "Lvl 2 Pierce: 3",
                            "Lvl 3 Pierce: 4",
                            "Lvl 4 Pierce: 4",
                            "Lvl 0 Max Ammo: 30",
                            "Lvl 1 Max Ammo: 30",
                            "Lvl 2 Max Ammo: 45",
                            "Lvl 3 Max Ammo: 60",
                            "Lvl 4 Max Ammo: 80",
                            "Lvl 0 Reload Time: 2.5",
                            "Lvl 1 Reload Time: 2.5",
                            "Lvl 2 Reload Time: 2",
                            "Lvl 3 Reload Time: 1.5",
                            "Lvl 4 Reload Time: 1.25",
                            "Missile Ability Unlocked at Lvl 3",
                            "Lvl 3 Missile cooldown time: 20 Seconds",
                            "Lvl 4 Missile cooldown time: 10 Seconds",
                            "Lvl 3 Missile Damage: 125",
                            "Lvl 4 Missile Damage: 175",
                            "Lvl 3 Stun Time: 1.25 Seconds",
                            "Lvl 4 Stun Time: 1.75 Seconds",
                            "Lvl 3 Missile Charges: 2",
                            "Lvl 4 Missile Charges: 4",
                        },
                    },
                },
            },
        },
    },
}