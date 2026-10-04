-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.70.0
-- Decompile time: 2.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🏖️ Surf & Turf 🏄‍♂️",
    ImageId = 93073720386006,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🏖️ Surf & Turf Battlepass",
                        Points = {
                            "Enjoy: 15 New Skins, 8 New Nametags, 7 New Emotes, 6 New Charms and 2 New Consumables",
                            "4 New Retro-styled Maps: Retro Rocket Arena, Retro Stained Temple, Retro Crossroads, Retro The Heights!",
                            "2 New Summer Maps: Summer Castle, Coral Deep",
                            "Earn \"Beachballs\" by playing the game to unlock rewards!",
                            "Surf & Turf Battlepass is available until September 3rd!",
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Skins 🔥", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Minimize = 0.6,
                        Items = {
                            {Type = "tower", Name = "Scout", Skin = "Shark", Details = "Shark"},
                            {Type = "tower", Name = "Sniper", Skin = "Shrimp", Details = "Shrimp"},
                            {Type = "tower", Name = "Militant", Skin = "Acheron", Details = "Acheron"},
                            {Type = "tower", Name = "Freezer", Skin = "Vendor", Details = "Vendor"},
                            {
                                Type = "tower",
                                Name = "Pyromancer",
                                Skin = "Pool Party",
                                Details = "Pool Party",
                            },
                            {Type = "tower", Name = "Farm", Skin = "Crab", Details = "Crab"},
                            {Type = "tower", Name = "Trapper", Skin = "Hermit", Details = "Hermit"},
                            {Type = "tower", Name = "Brawler", Skin = "Lobster", Details = "Lobster"},
                            {Type = "tower", Name = "Warden", Skin = "Shark", Details = "Shark"},
                            {Type = "tower", Name = "Engineer", Skin = "Beach", Details = "Beach"},
                            {Type = "tower", Name = "Commander", Skin = "Aqua", Details = "Aqua"},
                            {Type = "tower", Name = "DJ Booth", Skin = "Seal", Details = "Seal"},
                            {Type = "tower", Name = "Ranger", Skin = "Shark", Details = "Shark"},
                            {
                                Type = "tower",
                                Name = "Accelerator",
                                Skin = "Octopus",
                                Details = "Octopus",
                            },
                            {
                                Type = "tower",
                                Name = "Electroshocker",
                                Skin = "Jellyfish",
                                Details = "Jellyfish",
                            },
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Emotes 🕺", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Minimize = 0.6,
                        Items = {
                            {Type = "emote", Name = "Sandcastle"},
                            {Type = "emote", Name = "Flipping Burgers"},
                            {Type = "emote", Name = "Sea Turtle"},
                            {Type = "emote", Name = "Beach Ball"},
                            {Type = "emote", Name = "Fish Spin"},
                            {Type = "emote", Name = "Sun Bathing"},
                            {Type = "emote", Name = "Crab Rave"},
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Stickers 🎨", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Minimize = 0.8,
                        Items = {
                            {Type = "sticker", Name = "Cool Shades Engineer"},
                            {Type = "sticker", Name = "CHOMP"},
                            {Type = "sticker", Name = "Shrimp Fried Rice"},
                            {Type = "sticker", Name = "BBQ Pyromancer"},
                            {Type = "sticker", Name = "Aquaman"},
                            {Type = "sticker", Name = "Sad Seal"},
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Nametags 🏷️", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Minimize = 0.6,
                        Items = {
                            {Type = "nametag", Name = "SandCastle"},
                            {Type = "nametag", Name = "Crab"},
                            {Type = "nametag", Name = "Beach"},
                            {Type = "nametag", Name = "Tropical"},
                            {Type = "nametag", Name = "MeltingIceCream"},
                            {Type = "nametag", Name = "Shrimp"},
                            {Type = "nametag", Name = "DeepSea"},
                            {Type = "nametag", Name = "Heatwave"},
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Consumables 🍬", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Items = {
                            {Type = "consumable", Name = "Sandcastle"},
                            {Type = "consumable", Name = "Heatwave"},
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Coming Soon 🔥",
                        Points = {
                            "🥊 PVP Gamemode",
                            "🚀 New Evergreen Tower!",
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
                        SubjectName = "Frost Blaster",
                        Points = {
                            "Removed Placement Limit",
                            "Lvl 0 Cost: 850 → <font color=\"rgb(255,100,100)\">800</font>",
                            "Lvl 2 Cost: 950 → <font color=\"rgb(100,255,100)\">1000</font>",
                            "Lvl 3 Cost: 3500 → <font color=\"rgb(255,100,100)\">2500</font>",
                            "Lvl 4 Cost: 10000 → <font color=\"rgb(255,100,100)\">7500</font>",
                            "Lvl 0 Cooldown: 0.85 → <font color=\"rgb(100,255,100)\">1.2</font>",
                            "Lvl 1 Cooldown: 0.75 → <font color=\"rgb(100,255,100)\">1</font>",
                            "Lvl 2 Cooldown: 0.75 → <font color=\"rgb(100,255,100)\">1</font>",
                            "Lvl 3 Cooldown: 0.75 → <font color=\"rgb(100,255,100)\">1</font>",
                            "Lvl 0 Damage: 2 → <font color=\"rgb(100,255,100)\">6</font>",
                            "Lvl 1 Damage: 2 → <font color=\"rgb(100,255,100)\">6</font>",
                            "Lvl 2 Damage: 4 → <font color=\"rgb(100,255,100)\">10</font>",
                            "Lvl 3 Damage: 10 → <font color=\"rgb(100,255,100)\">20</font>",
                            "Lvl 4 Damage: 35 → <font color=\"rgb(100,255,100)\">60</font>",
                            "Lvl 1 Range: 12 → <font color=\"rgb(100,255,100)\">15</font>",
                            "Lvl 2 Range: 14 → <font color=\"rgb(100,255,100)\">15</font>",
                            "Lvl 3 Range: 16 → <font color=\"rgb(100,255,100)\">17.5</font>",
                            "Lvl 4 Range: 22 → <font color=\"rgb(100,255,100)\">23</font>",
                            "Lvl 0 Freeze Time: 0.5s → <font color=\"rgb(100,255,100)\">0.75s</font>",
                            "Lvl 1 Freeze Time: 0.5s → <font color=\"rgb(100,255,100)\">0.75s</font>",
                            "Lvl 2 Freeze Time: 0.5s → <font color=\"rgb(100,255,100)\">0.75s</font>",
                            "Lvl 3 Freeze Time: 0.75s → <font color=\"rgb(100,255,100)\">1.0s</font>",
                            "Lvl 4 Freeze Time: 1.25s → <font color=\"rgb(100,255,100)\">1.5s</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Shotgunner",
                        Points = {
                            "Lvl 1 Cost: 125 → <font color=\"rgb(100,255,100)\">150</font>",
                            "Lvl 2 Cost: 1050 → <font color=\"rgb(255,100,100)\">950</font>",
                            "Lvl 3 Cost: 3000 → <font color=\"rgb(255,100,100)\">2500</font>",
                            "Lvl 4 Cost: 6000 → <font color=\"rgb(100,255,100)\">6500</font>",
                            "Lvl 0 Shot Size: 6 → <font color=\"rgb(100,255,100)\">8 Pellets</font>",
                            "Lvl 1 Shot Size: 6 → <font color=\"rgb(100,255,100)\">8 Pellets</font>",
                            "Lvl 2 Shot Size: 8 → <font color=\"rgb(100,255,100)\">10 Pellets</font>",
                            "Lvl 3 Shot Size: 8 → <font color=\"rgb(100,255,100)\">10 Pellets</font>",
                            "Lvl 4 Shot Size: 10 → <font color=\"rgb(100,255,100)\">12 Pellets</font>",
                            "Lvl 0 Spread: 55 → <font color=\"rgb(255,100,100)\">45</font>",
                            "Lvl 1 Spread: 55 → <font color=\"rgb(255,100,100)\">45</font>",
                            "Lvl 2 Spread: 45 → <font color=\"rgb(255,100,100)\">40</font>",
                            "Lvl 3 Spread: 45 → <font color=\"rgb(255,100,100)\">40</font>",
                            "Lvl 4 Spread: 40 → <font color=\"rgb(255,100,100)\">30</font>",
                            "Lvl 0 Cooldown: 1.5 → <font color=\"rgb(100,255,100)\">2</font>",
                            "Lvl 1 Cooldown: 1.25 → <font color=\"rgb(100,255,100)\">1.4</font>",
                            "Lvl 2 Cooldown: 1.25 → <font color=\"rgb(255,100,100)\">1.2</font>",
                            "Lvl 4 Cooldown: 0.9 → <font color=\"rgb(100,255,100)\">0.95</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Rocketeer",
                        Points = {
                            "Removed Deadzone",
                            "Lvl 0 Damage: 30 → <font color=\"rgb(255,100,100)\">25</font>",
                            "Lvl 1 Damage: 30 → <font color=\"rgb(255,100,100)\">25</font>",
                            "Lvl 2 Damage: 60 → <font color=\"rgb(255,100,100)\">50</font>",
                            "Lvl 3 Damage: 150 → <font color=\"rgb(255,100,100)\">135</font>",
                            "Lvl 4 Damage: 90x4 → <font color=\"rgb(100,255,100)\">65x</font>4",
                            "Lvl 0 Range: 22 → <font color=\"rgb(255,100,100)\">17</font>",
                            "Lvl 1 Range: 22 → <font color=\"rgb(255,100,100)\">17</font>",
                            "Lvl 2 Range: 25 → <font color=\"rgb(255,100,100)\">19</font>",
                            "Lvl 3 Range: 25 → <font color=\"rgb(255,100,100)\">22.5</font>",
                            "Lvl 4 Range: 30 → <font color=\"rgb(255,100,100)\">24</font>",
                            "Lvl 4 Cooldown: 3 → <font color=\"rgb(255,100,100)\">2.75</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Military Base",
                        Points = {
                            "Airstrike Ability Cost: 500 → <font color=\"rgb(255,100,100)\">250 Cash</font>",
                            "Lvl 0 Spawn Time: 50s → <font color=\"rgb(255,100,100)\">45s</font>",
                            "Lvl 1 Spawn Time: 35s → <font color=\"rgb(255,100,100)\">30s</font>",
                            "Lvl 2 Spawn Time: 35s → <font color=\"rgb(255,100,100)\">30s</font>",
                            "Lvl 3 Spawn Time: 35s → <font color=\"rgb(255,100,100)\">30s</font>",
                            "Lvl 4 Spawn Time: 35s → <font color=\"rgb(255,100,100)\">30s</font>",
                            "Level 0 Humvee Health: 30 → <font color=\"rgb(100,255,100)\">50</font>",
                            "Level 1 Humvee Health: 30 → <font color=\"rgb(100,255,100)\">50</font>",
                            "Level 2 Humvee Health: 60 → <font color=\"rgb(100,255,100)\">80</font>",
                            "Level 3 Humvee Health: 90 → <font color=\"rgb(100,255,100)\">100</font>",
                            "Level 5 Railgun Tank Health: 1500 → <font color=\"rgb(100,255,100)\">1600</font>",
                            "Level 3 Humvee Damage: 3 → <font color=\"rgb(100,255,100)\">4</font>",
                            "Level 5 Railgun Tank Damage: 24 → <font color=\"rgb(100,255,100)\">25</font>",
                        },
                    },
                },
            },
        },
    },
}