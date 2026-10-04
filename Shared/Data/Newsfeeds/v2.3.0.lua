-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v2.3.0
-- Decompile time: 5.82 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)

local function imageLabel(a1, a2) -- Line: 18 -- upvalues: ImageCaption (val)
    return function(a1_2, a2_2) -- Line: 19 -- upvalues: ImageCaption (upval), a2 (val), a1 (val)
        return ImageCaption({Transparency = a2_2.Transparency, LayoutOrder = a1_2, Image = a2, Text = a1})
    end
end

local function changeLine(a1, a2, a3, a4) -- Line: 29
    return (("<b>%*:</b> <font color=\"%*\">%* -> %*</font>"):format(a1, a4, a2, a3))
end

local function statLine(a1, a2) -- Line: 33
    return (("<b>%*:</b> %*"):format(a1, a2))
end

local function addedLine(a1, a2) -- Line: 37
    return (("<b>%*:</b> <font color=\"rgb(80,255,130)\">Added %*</font>"):format(a1, a2))
end

local function itemChange(a1, a2, a3, a4, a5, a6, a7) -- Line: 41
    return {
        Type = "ItemChange",
        Props = {
            Minimize = a7,
            Item = {
                Type = a5 or "tower",
                Name = a1,
                Skin = a4,
                DisplayName = a2,
                Icon = a6,
            },
            Changes = a3,
        },
    }
end

local v1 = {UpdateName = "Kingpin Tower", ImageId = 126515445406321}
local v2 = {}
local v3 = {Name = "Update Log:"}
local v4 = {}
local v5 = {Type = "Log"}
local v6 = {
    HeaderName = "Kingpin",
    HeaderSubject = "We're small time. For now...\n \n Kingpin evolves from Crook Boss into a stronger mid-game tower built around unit summoning, economy, and hit orders.",
}
local v7 = {}
local u27 = 130533848887962
local u28 = nil
local u30 = 73534955153769
local u31 = nil
v7[1] = "Kingpin can be purchased for 15,000 coins and 5,500 gems after reaching Crook Boss Level 20."
v7[2] = "Send out hit orders with Bounty, build your economy with Money Runner, and pressure lanes with Kingpin Henchman, Bouncer, and Hitman units."

v7[3] = function(a1, a2) -- Line: 19 -- upvalues: ImageCaption (val), u27 (val), u28 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u27, Text = u28})
end

v7[4] = function(a1, a2) -- Line: 19 -- upvalues: ImageCaption (val), u30 (val), u31 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u30, Text = u31})
end

v6.Points = v7
v5.Props = v6
v6 = itemChange("EvolvedKingpin", "Kingpin", {
    {
        Title = "Unlock Details",
        Lines = {
            "<b>Evolves From:</b> Crook Boss",
            "<b>Evolution Level:</b> 20",
            "<b>Purchase Cost:</b> 15,000 Coins and 5,500 Gems",
            "<b>Tower Limit:</b> 4",
        },
    },
    {
        Title = "Level 0 Stats",
        Lines = {
            "<b>Price:</b> $3,600",
            "<b>Damage:</b> 24",
            "<b>Cooldown:</b> 1.1",
            "<b>Range:</b> 17.5",
            "<b>Kingpin Henchman Spawn Time:</b> 37.5s",
            "<b>Money Runner Spawn Time:</b> 40s",
        },
    },
    {
        Title = "Levels 1-3 Stats",
        Lines = {
            "<b>Level 1: Hat Trick:</b> $1,400 - 24 damage, 0.85 cooldown, 20 range",
            "<b>Level 2: Mafia Expansion:</b> $4,000 - 7 damage, 0.14 cooldown, 20 range, 2 unit queues",
            "<b>Level 3: High Roller:</b> $6,000 - 12 damage, 0.14 cooldown, 20 range, Flying Detection",
            "<b>Level 3 Unit Timers:</b> Kingpin Henchman 30s, Money Runner 30s",
        },
    },
    {
        Title = "Path A: Bounty and Economy",
        Lines = {
            "<b>Level 4A: LV. 10 Bounty Hunter:</b> $7,250 - 160 damage, 1.65 cooldown, Lead Detection",
            "<b>Bounty:</b> 50% cash multiplier, $10,000 reward cap",
            "<b>Level 5A: LV. 50 Flashy Business:</b> $16,500 - 295 damage, 70% cash multiplier, $25,000 reward cap",
            "<b>Level 6A: LV. 999 BOSS:</b> $38,500 - 225 damage, 0.8 cooldown, 100% cash multiplier, $60,000 reward cap",
            "<b>Money Runner:</b> Upgrades through Level 3 and reaches a 25s spawn time",
        },
    },
    {
        Title = "Path B: Syndicate Pressure",
        Lines = {
            "<b>Level 4B: Underworld Backup:</b> $14,000 - 17 damage, 0.12 cooldown, 22 range, 3 unit queues",
            "<b>Level 4B Units:</b> Unlocks Kingpin Bouncer and upgrades Kingpin Henchman to Level 1",
            "<b>Level 5B: B.P. Operations:</b> $32,500 - 34 damage, 0.12 cooldown, 23 range",
            "<b>Level 6B: Golden Syndicate:</b> $64,000 - 46 damage, 0.1 cooldown, Lead Detection",
            "<b>Level 6B Units:</b> Unlocks Kingpin Hitman and upgrades Kingpin Henchman, Bouncer, and Money Runner",
        },
    },
})
local v8 = itemChange("KingpinHenchman", "Lackey", {
    {
        Title = "Base Stats",
        Lines = {
            "<b>Health:</b> 45",
            "<b>Speed:</b> 3.5",
            "<b>Damage:</b> 2",
            "<b>Range:</b> 19",
            "<b>Cooldown:</b> 0.22",
            "<b>Lifespan:</b> 75s",
            "<b>Detection:</b> Hidden",
            "<b>Standby Time:</b> 2s",
        },
    },
    {
        Title = "Upgrade Stats",
        Lines = {
            "<b>Upgrade 1:</b> 75 health, 3.5 speed, 5 damage, 23 range, 0.2 cooldown, 75s lifespan, Hidden Detection",
            "<b>Upgrade 2:</b> 200 health, 3.5 speed, 6 damage, 24.5 range, 0.16 cooldown, 75s lifespan, Hidden Detection",
            "<b>Upgrade 3:</b> 300 health, 3.5 speed, 8 damage, 27 range, 0.12 cooldown, 75s lifespan, Hidden Detection",
        },
    },
}, nil, "unit", 117012512715591)
local v9 = itemChange("MoneyRunner", "Money Runner", {
    {
        Title = "Base Stats",
        Lines = {
            "<b>Health:</b> 40",
            "<b>Speed:</b> 6",
            "<b>Range:</b> 0",
            "<b>Lifespan:</b> None",
            "<b>Cash On Death:</b> $200",
        },
    },
    {
        Title = "Upgrade Stats",
        Lines = {
            "<b>Upgrade 1:</b> 75 health, 6 speed, $450 cash on death",
            "<b>Upgrade 2:</b> 75 health, 6 speed, $600 cash on death",
            "<b>Upgrade 3:</b> 100 health, 6 speed, $850 cash on death",
        },
    },
}, nil, "unit", 101018065480597)
local v10 = itemChange("KingpinBouncer", "Bouncer", {
    {
        Title = "Base Stats",
        Lines = {
            "<b>Health:</b> 550",
            "<b>Speed:</b> 5",
            "<b>Damage:</b> 25",
            "<b>Range:</b> 8",
            "<b>Cooldown:</b> 0.5",
            "<b>Defense:</b> 0",
            "<b>Lifespan:</b> 75s",
            "<b>Detection:</b> Hidden and Lead",
            "<b>Standby Time:</b> 3s",
        },
    },
    {
        Title = "Upgrade Stats",
        Lines = {
            "<b>Upgrade 1:</b> 750 health, 5 speed, 35 damage, 8 range, 0.5 cooldown, 10 defense, 75s lifespan, Hidden and Lead Detection",
            "<b>Upgrade 2:</b> 1,000 health, 5 speed, 40 damage, 8.5 range, 0.5 cooldown, 15 defense, 75s lifespan, Hidden and Lead Detection",
        },
    },
}, nil, "unit", 96508625116086)
local v11 = itemChange("KingpinHitman", "Contractor", {
    {
        Title = "Base Stats",
        Lines = {
            "<b>Health:</b> 200",
            "<b>Speed:</b> 3.5",
            "<b>Damage:</b> 165",
            "<b>Range:</b> 35",
            "<b>Cooldown:</b> 2",
            "<b>Lifespan:</b> 70s",
            "<b>Detection:</b> Hidden, Flying, and Lead",
            "<b>Standby Time:</b> 4s",
            "<b>Weapon Draw Time:</b> 0.7s",
        },
    },
}, nil, "unit", 105902098922567)
local v12 = {Type = "Log"}
local v13 = {
    HeaderName = "Boomerang",
    HeaderSubject = "Boomerang has arrived as a medium-ranged beginner tower focused on pierce and crowd control.",
}
local v14 = {}
local u164 = 137092117681419
local u165 = nil
v14[1] = "Boomerang is an alternative to Demoman for players who want early pierce, multi-hit pressure, and sharper targeting."

v14[2] = function(a1, a2) -- Line: 19 -- upvalues: ImageCaption (val), u164 (val), u165 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u164, Text = u165})
end

v13.Points = v14
v12.Props = v13
v13 = itemChange("Boomerang", nil, {
    {
        Title = "Unlock Details",
        Lines = {
            "<b>Store Cost:</b> 300 Coins",
            "<b>Placement Cost:</b> $550",
            "<b>Tower Limit:</b> 12",
            "<b>Detection:</b> Flying at all levels, Lead from Level 3 onward",
        },
    },
    {
        Title = "Level 0 Stats",
        Lines = {
            "<b>Damage:</b> 7",
            "<b>Cooldown:</b> 2.6",
            "<b>Range:</b> 14",
            "<b>Boomerang Count:</b> 1",
            "<b>Max Hits:</b> 3",
            "<b>Travel Time:</b> 0.4s",
        },
    },
    {
        Title = "Upgrade Stats",
        Lines = {
            "<b>Level 1: Steel Fang:</b> $400 - 12 damage, 2.6 cooldown, 15 range",
            "<b>Level 2: Firmer Grip:</b> $750 - 12 damage, 1.6 cooldown, 15 range, 4 max hits, 0.3s travel time",
            "<b>Level 3: Twin Strike:</b> $2,500 - 16 damage, 1.6 cooldown, 16 range, 2 boomerangs, Lead Detection",
            "<b>Level 4: Lord Of The Rangs:</b> $7,000 - 40 damage, 1.4 cooldown, 16 range, 5 max hits, 0.25s travel time",
        },
    },
})
v14 = {Type = "Log"}
local v15 = {
    HeaderName = "Golden Demoman",
    HeaderSubject = "Speaking of Demoman... after much deliberation and careful consideration, we have decided it's time to introduce our newest golden variant: The Golden Demoman. This golden perk not only boosts the stats of the Demoman, but also adds stun immunity at max level.",
}
local v16 = {}
local u196 = 93375856116458
local u197 = nil
v16[1] = "Golden Demoman is now available from the Golden Crate."

v16[2] = function(a1, a2) -- Line: 19 -- upvalues: ImageCaption (val), u196 (val), u197 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u196, Text = u197})
end

v15.Points = v16
v14.Props = v15
v15 = itemChange("Demoman", "Golden Demoman", {
    {
        Title = "Unlock Details",
        Lines = {
            "<b>Crate:</b> Golden Crate",
            "<b>Daily Price:</b> 55,000 Coins",
            "<b>Detection:</b> Lead at all levels, Hidden from Level 2 onward",
        },
    },
    {
        Title = "Level 0 Stats",
        Lines = {
            "<b>Price:</b> $875",
            "<b>Damage:</b> 10",
            "<b>Cooldown:</b> 1.95",
            "<b>Range:</b> 12",
            "<b>Explosion Radius:</b> 4.5",
            "<b>Aim Time:</b> 0.8s",
        },
    },
    {
        Title = "Upgrade Stats",
        Lines = {
            "<b>Level 1: Faster Pitch:</b> $200 - 10 damage, 1.8 cooldown, 13.5 range",
            "<b>Level 2: Golden Handshake:</b> $1,150 - 18 damage, 5 explosion radius, Hidden Detection",
            "<b>Level 3: Loose Cannon:</b> $2,650 - 25 damage, 1.1 cooldown, 15 range, no aim time",
            "<b>Level 4: A Thousand Exploding Suns:</b> $7,750 - 25 damage, 0.45 cooldown, 17 range, Stun Immune",
        },
    },
}, "Golden")
v16 = {Type = "Log"}
local v17 = {
    HeaderName = "Pirate Crate",
    HeaderSubject = "As our final summer skin addition, the Pirate Crate is dropping with a new wave of ocean-inspired skins.",
}
local v18 = {}
local u229 = 94927110448736
local u230 = nil
v18[1] = "Pirate Crate costs 3,500 coins."
v18[2] = "Daily Pirate Crate skin prices scale by rarity: Common 3,500, Uncommon 4,000, Rare 4,500, Legendary 5,000 coins."

v18[3] = function(a1, a2) -- Line: 19 -- upvalues: ImageCaption (val), u229 (val), u230 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u229, Text = u230})
end

v17.Points = v18
v16.Props = v17
v4[1] = v5
v4[2] = v6
v4[3] = {
    Type = "Log",
    Props = {
        HeaderName = "Kingpin Units",
        HeaderSubject = "Kingpin's crew brings the pressure while he handles the business. Here's the full stat spread for each summon.",
        Points = {},
    },
}
v4[4] = v8
v4[5] = v9
v4[6] = v10
v4[7] = v11
v4[8] = v12
v4[9] = v13
v4[10] = v14
v4[11] = v15
v4[12] = v16
v4[13] = {
    Type = "Items",
    Props = {
        Minimize = 0.6,
        Items = {
            {
                Type = "crate",
                Name = "Pirate",
                Details = "<font color=\"rgb(80,255,130)\">3,500 Coins</font>",
            },
            {
                Type = "skin",
                Name = "EvolvedOperator",
                DisplayName = "Operator",
                Skin = "Pirate",
                Details = "Pirate",
            },
            {Type = "skin", Name = "Militant", Skin = "Pirate", Details = "Pirate"},
            {Type = "skin", Name = "Military Base", Skin = "Pirate", Details = "Pirate"},
            {Type = "skin", Name = "Spotlight Tech", Skin = "Pirate", Details = "Pirate"},
            {Type = "skin", Name = "Slasher", Skin = "Pirate", Details = "Pirate"},
            {Type = "skin", Name = "Rocketeer", Skin = "Tiderunner", Details = "Tiderunner"},
            {Type = "skin", Name = "Warlock", Skin = "Eyecatcher", Details = "Eyecatcher"},
        },
    },
}
v3.Content = v4
v4 = {Name = "Looking Ahead:"}
v5 = {}
v6 = {Type = "Log"}
v7 = {
    HeaderName = "Enforcer",
    HeaderSubject = "And, while we're not quite ready to pull the curtain back yet, Enforcer is getting closer. You'll hear more about him when the time comes.",
}
v8 = {}
local u248 = 131459470100584
local u249 = nil

v8[1] = function(a1, a2) -- Line: 19 -- upvalues: ImageCaption (val), u248 (val), u249 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u248, Text = u249})
end

v7.Points = v8
v6.Props = v7
v5[1] = v6
v5[2] = {Type = "EventButton", Props = {eventId = "56160815132312202"}}
v4.Content = v5
v6 = {
    Name = "Game Changes:",
    Minimize = 0.2,
    Content = {
        {
            Type = "Log",
            Props = {
                SubjectName = "Other Changes and Fixes",
                Points = {
                    "Updated tower information and ability descriptions across multiple towers.",
                    "Fixed tower stacking after revive.",
                    "Fixed upgrade panel hover and vertical bar issues.",
                    "Fixed stuck curse effects.",
                    "Fixed mission quest tracking after buying skins.",
                    "Cleaned up tower audio handling to reduce lag.",
                },
            },
        },
        itemChange("Assassin", nil, {
            {
                Title = "Damage Changes",
                Lines = {
                    "<b>Level 3 Damage:</b> <font color=\"rgb(80,255,130)\">13 -> 14</font>",
                    "<b>Level 4 Damage:</b> <font color=\"rgb(80,255,130)\">33 -> 35</font>",
                    "<b>Knife Fan Damage:</b> <font color=\"rgb(80,255,130)\">55 -> 60</font>",
                },
            },
        }),
        itemChange("Demoman", nil, {
            {
                Title = "Level 0-2 Changes",
                Lines = {
                    "<b>Level 0 Explosion Radius:</b> <font color=\"rgb(255,100,100)\">5 -> 4.5</font>",
                    "<b>Level 0 Cooldown:</b> <font color=\"rgb(255,100,100)\">2.4 -> 2.6</font>",
                    "<b>Level 1 Cost:</b> <font color=\"rgb(255,100,100)\">$250 -> $300</font>",
                    "<b>Level 1 Cooldown:</b> <font color=\"rgb(255,100,100)\">1.75 -> 1.9</font>",
                    "<b>Level 2 Damage:</b> <font color=\"rgb(80,255,130)\">15 -> 18</font>",
                    "<b>Level 2 Explosion Radius:</b> <font color=\"rgb(255,100,100)\">6 -> 5</font>",
                },
            },
            {
                Title = "Level 3-4 Changes",
                Lines = {
                    "<b>Level 3 Cost:</b> <font color=\"rgb(80,255,130)\">$2,500 -> $2,400</font>",
                    "<b>Level 3 Damage:</b> <font color=\"rgb(255,100,100)\">30 -> 25</font>",
                    "<b>Level 3 Explosion Radius:</b> <font color=\"rgb(255,100,100)\">6 -> 5.5</font>",
                    "<b>Level 4 Cost:</b> <font color=\"rgb(80,255,130)\">$6,000 -> $5,500</font>",
                    "<b>Level 4 Cooldown:</b> <font color=\"rgb(80,255,130)\">1.2 -> 1</font>",
                    "<b>Level 4 Damage:</b> <font color=\"rgb(255,100,100)\">50 -> 35</font>",
                    "<b>Level 4 Explosion Radius:</b> <font color=\"rgb(255,100,100)\">6 -> 5.5</font>",
                },
            },
        }),
        itemChange("Electroshocker", nil, {
            {
                Title = "Damage and Chain Changes",
                Lines = {
                    "<b>Level 0 Damage:</b> <font color=\"rgb(80,255,130)\">4 -> 5</font>",
                    "<b>Level 3 Damage:</b> <font color=\"rgb(255,100,100)\">22 -> 20</font>",
                    "<b>Level 3 Chain Range:</b> <font color=\"rgb(255,100,100)\">15 -> 12.5</font>",
                    "<b>Level 4 Damage:</b> <font color=\"rgb(255,100,100)\">70 -> 60</font>",
                    "<b>Level 4 Chain Range:</b> Now upgrades from 12.5 -> 15",
                    "<b>Level 5 Damage:</b> <font color=\"rgb(255,100,100)\">100 -> 90</font>",
                    "<b>Level 5 Chain Range:</b> <font color=\"rgb(255,100,100)\">20 -> 15</font>",
                },
            },
        }),
        itemChange("EvolvedOperator", "Operator", {
            {
                Title = "General Changes",
                Lines = {
                    "<b>Tower Limit:</b> <font color=\"rgb(80,255,130)\">16 -> 20</font>",
                    "<b>Level 0-1 Burst Cooldown:</b> <font color=\"rgb(80,255,130)\">1.6s -> 1.5s</font>",
                    "<b>Level 4 Shared Optics:</b> <font color=\"rgb(80,255,130)\">Added enabled</font>",
                },
            },
            {
                Title = "Level 2-4 Changes",
                Lines = {
                    "<b>Level 2 Cost:</b> <font color=\"rgb(255,100,100)\">$500 -> $700</font>",
                    "<b>Level 2 Range:</b> <font color=\"rgb(255,100,100)\">16 -> 15.5</font>",
                    "<b>Level 2 Burst Cooldown:</b> <font color=\"rgb(80,255,130)\">1.4s -> 1s</font>",
                    "<b>Coordination Damage:</b> <font color=\"rgb(80,255,130)\">5% -> 10%</font>",
                    "<b>Level 3 Damage:</b> <font color=\"rgb(255,100,100)\">5 -> 4</font>",
                    "<b>Level 3 Burst Count:</b> <font color=\"rgb(80,255,130)\">8 -> 9</font>",
                    "<b>Level 4 Cost:</b> <font color=\"rgb(255,100,100)\">$2,100 -> $2,575</font>",
                    "<b>Level 4 Damage:</b> <font color=\"rgb(255,100,100)\">7 -> 5</font>",
                    "<b>Level 4 Coordination Radius:</b> <font color=\"rgb(80,255,130)\">5 -> 5.5</font>",
                },
            },
            {
                Title = "Level 5-6 Changes",
                Lines = {
                    "<b>Level 5 Cost:</b> <font color=\"rgb(80,255,130)\">$3,350 -> $3,125</font>",
                    "<b>Level 5 Damage:</b> <font color=\"rgb(255,100,100)\">7 -> 6</font>",
                    "<b>Level 5 Cooldown:</b> <font color=\"rgb(255,100,100)\">0.16 -> 0.17</font>",
                    "<b>Level 5 Range:</b> <font color=\"rgb(255,100,100)\">17 -> 16</font>",
                    "<b>Level 6 Cost:</b> <font color=\"rgb(80,255,130)\">$6,400 -> $4,250</font>",
                    "<b>Level 6 Damage:</b> <font color=\"rgb(255,100,100)\">12 -> 6</font>",
                    "<b>Level 6 Cooldown:</b> <font color=\"rgb(80,255,130)\">0.16 -> 0.13</font>",
                },
            },
        }),
        itemChange("Pyromancer", nil, {
            {
                Title = "Default Changes",
                Lines = {
                    "<b>Level 1 Detection:</b> <font color=\"rgb(80,255,130)\">Added Hidden</font>",
                    "<b>Level 4 Cost:</b> <font color=\"rgb(255,100,100)\">$3,750 -> $3,777</font>",
                    "<b>Level 4 Damage:</b> <font color=\"rgb(80,255,130)\">4 -> 5</font>",
                    "<b>Level 5 Cost:</b> <font color=\"rgb(255,100,100)\">$7,500 -> $11,111</font>",
                    "<b>Level 5 Damage:</b> <font color=\"rgb(80,255,130)\">6 -> 9</font>",
                },
            },
        }),
        (itemChange("Saboteur", nil, {
            {
                Title = "Early Level Changes",
                Lines = {
                    "<b>Level 0 Price:</b> <font color=\"rgb(255,100,100)\">$575 -> $775</font>",
                    "<b>Level 0 Cooldown:</b> <font color=\"rgb(255,100,100)\">1.2 -> 1.35</font>",
                    "<b>Level 0 Range:</b> <font color=\"rgb(80,255,130)\">11.5 -> 12.5</font>",
                    "<b>Level 0 Poison Length:</b> <font color=\"rgb(80,255,130)\">3s -> 5s</font>",
                    "<b>Level 1 Cost:</b> <font color=\"rgb(80,255,130)\">$500 -> $375</font>",
                    "<b>Level 1 Damage:</b> <font color=\"rgb(80,255,130)\">2 -> 3</font>",
                    "<b>Level 1 Poison Tick:</b> <font color=\"rgb(80,255,130)\">0.9s -> 0.6s</font>",
                    "<b>Level 1 Max Hits:</b> <font color=\"rgb(255,100,100)\">2 -> 1</font>",
                },
            },
            {
                Title = "Late Level Changes",
                Lines = {
                    "<b>Level 2 Cost:</b> <font color=\"rgb(255,100,100)\">$1,475 -> $1,850</font>",
                    "<b>Level 2 Poison Length:</b> <font color=\"rgb(80,255,130)\">5s -> 6s</font>",
                    "<b>Level 2:</b> <font color=\"rgb(80,255,130)\">Added Scattershot</font>",
                    "<b>Level 3 Cost:</b> <font color=\"rgb(255,100,100)\">$4,850 -> $5,950</font>",
                    "<b>Level 3 Cooldown:</b> <font color=\"rgb(80,255,130)\">0.9 -> 0.8</font>",
                    "<b>Level 4 Range:</b> <font color=\"rgb(80,255,130)\">16 -> 16.5</font>",
                    "<b>Level 4 Poison Length:</b> <font color=\"rgb(80,255,130)\">7s -> 8s</font>",
                    "<b>Level 4 Neuralyze Duration:</b> <font color=\"rgb(255,100,100)\">9s -> 7.5s</font>",
                },
            },
        })),
    },
}
v2[1] = v3
v2[2] = v4
v2[3] = {
    Name = "Gamemode Reward Changes:",
    Content = {
        {
            Type = "Log",
            Props = {
                HeaderSubject = "The following gamemodes have had their defeat and triumph rewards adjusted. The changes go as follows:",
                Points = {
                    "Molten: More coins on triumph, less coins on defeat",
                    "Fallen: More coins on triumph, less coins on defeat",
                    "Frost: More coins and gems on triumph, less coins on defeat",
                    "Pizza Party: More coins on triumph, less coins on defeat",
                    "Badlands II: More coins on triumph, less coins on defeat",
                    "Polluted Wastelands II: More coins on triumph, less coins on defeat",
                    "Hardcore: More gems on triumph, less coins on defeat",
                    "Voidcore: More gems on triumph, now rewards coins on triumph, item drops improved overall",
                },
            },
        },
    },
}
v2[4] = v6
v1.Sections = v2
return v1