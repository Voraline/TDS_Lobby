-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.88.0
-- Decompile time: 2.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🐰 Spring 2026 🌸",
    ImageId = 105089440097336,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🦆 Ducky Revenge Returns!",
                        HeaderSubject = "The ducks are back! Ducky Revenge is returning for a limited time. Battle through waves of vengeful ducks and earn the Biologist Tower by conquering Hard mode — or grab it from the shop!",
                        Points = {
                            function(a1, a2) -- Line: 19 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 114757938234084,
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
                        HeaderName = "🧬 Biologist Tower",
                        HeaderSubject = "The Biologist Tower is back! Deploy specialized botanical allies — Sunflowers, Ivy, and Nightshades — to defend against the duck invasion. Earn it by conquering Ducky Revenge on Hard mode, or grab it from the shop!",
                        Points = {
                            function(a1, a2) -- Line: 35 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 128125812774347,
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {Type = "GamepassButton", Props = {gamepassId = 1160816963}},
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🐝 Swarmer On Sale!",
                        HeaderSubject = "The Swarmer Tower is back on sale! Command a swarm of bees to overwhelm your enemies.",
                        Points = {},
                    },
                },
                {Type = "GamepassButton", Props = {gamepassId = 8868555}},
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🐰 Spring Frenzy Battlepass 🌸",
                        HeaderSubject = "Spring has sprung! 40 tiers of exclusive rewards await you in this spring's Battlepass! Earn XP by playing any game mode to unlock all ranks!",
                        Points = {},
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Skins 🔥", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Minimize = 0.6,
                        Items = {
                            {Type = "tower", Name = "Demoman", Skin = "Egg", Details = "Egg"},
                            {Type = "tower", Name = "Accelerator", Skin = "Bunny", Details = "Bunny"},
                            {Type = "tower", Name = "Minigunner", Skin = "Easter", Details = "Easter"},
                            {Type = "tower", Name = "Warden", Skin = "Bunny", Details = "Bunny"},
                            {Type = "tower", Name = "Turret", Skin = "Bunny", Details = "Bunny"},
                            {Type = "tower", Name = "Brawler", Skin = "Bunny", Details = "Bunny"},
                            {Type = "tower", Name = "Farm", Skin = "Bunny", Details = "Bunny"},
                            {
                                Type = "tower",
                                Name = "Shotgunner",
                                Skin = "SciBunny",
                                Details = "SciBunny",
                            },
                            {Type = "tower", Name = "Freezer", Skin = "Bunny", Details = "Bunny"},
                            {
                                Type = "tower",
                                Name = "Electroshocker",
                                Skin = "Easter",
                                Details = "Easter",
                            },
                            {Type = "tower", Name = "Assassin", Skin = "SciBunny", Details = "SciBunny"},
                            {Type = "tower", Name = "Tesla", Skin = "Garden", Details = "Garden"},
                            {Type = "tower", Name = "Engineer", Skin = "Bunny", Details = "Bunny"},
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Emotes 🕺", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Minimize = 0.6,
                        Items = {
                            {Type = "emote", Name = "Petal Throw"},
                            {Type = "emote", Name = "Ducklings"},
                            {Type = "emote", Name = "Bunny Hop"},
                            {Type = "emote", Name = "Achoo"},
                            {Type = "emote", Name = "Coin Ride"},
                            {Type = "emote", Name = "Fat Bunny"},
                            {Type = "emote", Name = "Egg Launcher"},
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Stickers 🎨", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Minimize = 0.8,
                        Items = {
                            {Type = "sticker", Name = "Dead Stare"},
                            {Type = "sticker", Name = "Shrug Scout"},
                            {Type = "sticker", Name = "WOW"},
                            {Type = "sticker", Name = "Silly"},
                            {Type = "sticker", Name = "Lock In"},
                            {Type = "sticker", Name = "Not The Same"},
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Nametags 🏷️", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Minimize = 0.6,
                        Items = {
                            {Type = "nametag", Name = "LiveLaugh"},
                            {Type = "nametag", Name = "Lemons"},
                            {Type = "nametag", Name = "Carrots"},
                            {Type = "nametag", Name = "Chicken"},
                            {Type = "nametag", Name = "EggHunt"},
                            {Type = "nametag", Name = "Mushrooms"},
                            {Type = "nametag", Name = "Bees"},
                            {Type = "nametag", Name = "SpringRain"},
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🌟 Credits",
                        Minimize = 0.3,
                        Points = {
                            "<b>Bunny Accelerator</b> - {$userId:2839626873}, {$userId:1662804858}",
                            "<b>Bunny Warden</b> - {$userId:313445649}",
                            "<b>Easter Turret</b> - {$userId:136633403}, {$userId:242843583}",
                            "<b>Bunny Brawler</b> - {$userId:136633403}, {$userId:3833605172}",
                            "<b>Bunny Farm</b> - {$userId:524378412}, {$userId:136633403}",
                            "<b>Egg Demoman</b> - {$userId:313445649}",
                            "<b>Bunny Freezer</b> - {$userId:524378412}",
                            "<b>Easter Minigunner</b> - {$userId:85018312}",
                            "<b>Easter Electroshocker</b> - {$userId:28140733}, {$userId:104619189}",
                            "<b>SciBunny Assassin</b> - {$userId:4019343240}, {$userId:104619189}",
                            "<b>SciBunny Shotgunner</b> - {$userId:4019343240}, {$userId:104619189}",
                            "<b>Garden Tesla</b> - {$userId:605939}, {$userId:4019343240}, {$userId:104619189}",
                            "<b>Bunny Engineer</b> - {$userId:89910225}, {$userId:29238555}",
                            "<b>Charms</b> - {$userId:29238555}",
                            "<b>Stickers</b> - {$userId:106008999}",
                            "<b>Nametags</b> - {$userId:52377959}",
                            "<b>Egg Launcher</b> - {$userId:90738762}",
                            "<b>Petal Throw</b> - {$userId:115620036}",
                            "<b>Achoo</b> - {$userId:115620036}",
                            "<b>Fat Bunny</b> - {$userId:90738762}",
                            "<b>Ducklings</b> - {$userId:90738762}",
                            "<b>Bunny Hop</b> - {$userId:115620036}",
                            "<b>Coin Ride</b> - {$userId:90738762}",
                            "<b>VFX</b> - {$userId:52377959}",
                            "<b>SFX</b> - {$userId:31164652}",
                            "<b>Programming</b> - {$userId:8419324615}, {$userId:49601674}",
                            "<b>2D Art</b> - {$userId:3300603743}, {$userId:5520510065}, {$userId:396219026}, {$userId:3237902125}",
                        },
                    },
                },
            },
        },
        {
            Name = "🛠️ Game Changes:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Improvements",
                        Points = {
                            "Players will now be able to collect skins for towers they haven't\nunlocked via battlepass, purchased skins, and mission quests.\n(Crates will still prioritize towers unlocked by the player)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Fixes",
                        Points = {
                            "Flying enemies can now properly be affected by the \"Frost\"\nstatus effect (and freeze).",
                            "Null Shotgunner now shoots correctly and has fixed animations.",
                        },
                    },
                },
            },
        },
    },
}