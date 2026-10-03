-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v2.0.0
-- Decompile time: 17.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)

local function imagePlaceholder(a1, a2) -- Line: 9 -- upvalues: ImageCaption (val)
    return function(a1_2, a2_2) -- Line: 10 -- upvalues: ImageCaption (upval), a2 (val), a1 (val)
        return ImageCaption({
            Transparency = a2_2.Transparency,
            LayoutOrder = a1_2,
            Image = a2 or 0,
            Text = a1,
        })
    end
end

local function changeLine(a1, a2, a3, a4) -- Line: 20
    return (("<b>%*:</b> <font color=\"%*\">%* → %*</font>"):format(a1, a4, a2, a3))
end

local function statLine(a1, a2) -- Line: 24
    return (("<b>%*:</b> %*"):format(a1, a2))
end

local function addedLine(a1, a2, a3) -- Line: 28
    return (("<b>%*:</b> <font color=\"%*\">Added %*</font>"):format(a1, a3, a2))
end

local function removedLine(a1, a2) -- Line: 32
    return (("<b>%*:</b> <font color=\"rgb(255,100,100)\">%* → Removed</font>"):format(a1, a2))
end

local function towerChange(a1, a2, a3) -- Line: 36
    return {
        Type = "ItemChange",
        Props = {Item = {Type = "tower", Name = a1, DisplayName = a2}, Changes = a3},
    }
end

local function unitChange(a1, a2) -- Line: 52
    return {
        Type = "ItemChange",
        Props = {Item = {Type = "unit", DisplayName = a1, Name = a1}, Changes = a2},
    }
end

local v1 = {UpdateName = "💀 Hardcore Rework 💀", ImageId = 125040190861831}
local v2 = {}
local v3 = {Name = "📜 Update Log:"}
local v4 = {}
local v5 = {Type = "Log"}
local v6 = {
    HeaderName = "Prepare to Raze the Void",
    HeaderSubject = "The Void Caster has returned, and the bloom of the Void has spread across the realms. Survive the new Void enemies and maps, evolve your towers, challenge your loadout with new Shrines, and unlock the true boss battle you've been waiting for. Will you survive the Void, or succumb to the eternal silence?",
}
local v7 = {}
local u27 = 134983410442714
local u28 = "Are you brave enough to conquer Hardcore, and then Voidcore?"

v7[1] = function(a1, a2) -- Line: 10 -- upvalues: ImageCaption (val), u27 (val), u28 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u27 or 0, Text = u28})
end

v6.Points = v7
v5.Props = v6
v6 = {Type = "Log"}
v7 = {
    HeaderName = "Shrines",
    HeaderSubject = "Within the 3 brand new Hardcore maps, you will encounter Shrines. These encounters are unique to the Hardcore Rework maps and add new effects that make the round more challenging.",
}
local v8 = {}
local u34 = 70996926984666
local u35 = "Challenge your team, your loadout, and your ability to adapt mid-run."
v8[1] = "Shrines are difficult, but surviving them rewards you accordingly."

v8[2] = function(a1, a2) -- Line: 10 -- upvalues: ImageCaption (val), u34 (val), u35 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u34 or 0, Text = u35})
end

v7.Points = v8
v6.Props = v7
v7 = {Type = "Log"}
v8 = {
    HeaderName = "Void Crate",
    HeaderSubject = "Reward yourself with the brand new Void Crate, containing 5 Hardcore Rework themed skins for 1000 gems.",
}
local v9 = {}
local u40 = 106084560716811
local u41 = nil

v9[1] = function(a1, a2) -- Line: 10 -- upvalues: ImageCaption (val), u40 (val), u41 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u40 or 0, Text = u41})
end

v8.Points = v9
v7.Props = v8
local v10 = {Type = "Log"}
local v11 = {
    HeaderName = "Evolved Towers: Juggernaut",
    HeaderSubject = "Evolved Towers are here, starting with Juggernaut. This tower evolves as you upgrade it and eventually splits into two unique paths, letting you choose how it interacts with the battlefield. Evolves from Minigunner.",
}
local v12 = {}
local u65 = 96665728117385
local u66 = nil
local u68 = 85467993761043
local u69 = "Juggernaut is a high single-target tower with heavy damage potential."
v12[1] = "Top path gains defensive utility for nearby towers."
v12[2] = "Bottom path gains a damage multiplier against boss enemies."

v12[3] = function(a1, a2) -- Line: 10 -- upvalues: ImageCaption (val), u65 (val), u66 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u65 or 0, Text = u66})
end

v12[4] = function(a1, a2) -- Line: 10 -- upvalues: ImageCaption (val), u68 (val), u69 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u68 or 0, Text = u69})
end

v11.Points = v12
v10.Props = v11
v11 = towerChange("EvolvedJuggernaut", "Juggernaut", {
    {
        Title = "Default Stats",
        Lines = {
            "<b>Price:</b> $8,000",
            "<b>Damage:</b> 9",
            "<b>Cooldown:</b> 0.15",
            "<b>Range:</b> 17.5",
            "<b>Rev Time:</b> 2s",
            "<b>Detection:</b> Hidden",
            "<b>Tower Limit:</b> 1",
        },
    },
    {
        Title = "Path A: Hammerhead",
        Lines = {
            "<b>Final Upgrade Cost:</b> $150,000",
            "<b>Damage:</b> 240",
            "<b>Cooldown:</b> 0.12",
            "<b>Range:</b> 26",
            "<b>Rev Time:</b> 1s",
            "<b>Fortify Radius:</b> 14",
            "<b>Fortify Debuff Time Reduction:</b> 50%",
            "<b>Detection:</b> Hidden and Flying",
        },
    },
    {
        Title = "Path B: Thresher",
        Lines = {
            "<b>Final Upgrade Cost:</b> $250,000",
            "<b>Damage:</b> 200",
            "<b>Cooldown:</b> 0.09",
            "<b>Range:</b> 28",
            "<b>Rev Time:</b> 1.6s",
            "<b>Boss Damage Multiplier:</b> 1.4x",
            "<b>Detection:</b> Hidden and Lead",
        },
    },
})
v12 = {Type = "Log"}
local v13 = {
    HeaderName = "Tower Leveling System",
    HeaderSubject = "To unlock Evolved towers, you must first level up the base tower. Leveling up a tower requires you to earn XP for that tower by playing with it in matches.",
}
local v14 = {}
local u107 = 90338371315881
local u108 = nil

v14[1] = function(a1, a2) -- Line: 10 -- upvalues: ImageCaption (val), u107 (val), u108 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u107 or 0, Text = u108})
end

v13.Points = v14
v12.Props = v13
v13 = {Type = "Log"}
v14 = {
    HeaderName = "Optimization Pass",
    HeaderSubject = "We took a look at optimization across the board. You should experience smoother gameplay in Hardcore and other modes, though we are still working on more improvements.",
}
local v15 = {}
local u113 = 97963982573365
local u114 = nil

v15[1] = function(a1, a2) -- Line: 10 -- upvalues: ImageCaption (val), u113 (val), u114 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u113 or 0, Text = u114})
end

v14.Points = v15
v13.Props = v14
v14 = {Type = "Log"}
v15 = {
    HeaderName = "Mission & Quest Menu",
    HeaderSubject = "The Mission and Quest window has been improved. Navigation still works the same way, but moving between the two menus should now make the information clearer.",
}
local v16 = {}
local u119 = 89080249921126
local u120 = nil

v16[1] = function(a1, a2) -- Line: 10 -- upvalues: ImageCaption (val), u119 (val), u120 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u119 or 0, Text = u120})
end

v15.Points = v16
v14.Props = v15
v15 = {Type = "Log"}
v16 = {
    HeaderName = "Looking Ahead",
    HeaderSubject = "The shop will be getting an overhaul and UI/UX facelift in a future update. Operator is also on the way as the next Evolved Tower.",
}
local v17 = {}
local u127 = 129978409130311
local u128 = nil
v17[1] = "Thank you for your patience and support while the team brought the Hardcore Rework to life."
v17[2] = "Good luck attempting to beat Voidcore. Have fun!"

v17[3] = function(a1, a2) -- Line: 10 -- upvalues: ImageCaption (val), u127 (val), u128 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u127 or 0, Text = u128})
end

v16.Points = v17
v15.Props = v16
v4[1] = v5
v4[2] = v6
v4[3] = v7
v4[4] = {
    Type = "Items",
    Props = {
        Minimize = 0.6,
        Items = {
            {
                Type = "crate",
                Name = "Void",
                Details = "<font color=\"rgb(80,255,130)\">1000 Gems</font>",
            },
            {Type = "skin", Name = "Farm", Skin = "Void Altar", Details = "Void Altar"},
            {Type = "skin", Name = "Tesla", Skin = "Voidborne", Details = "Voidborne"},
            {Type = "skin", Name = "Accelerator", Skin = "Void", Details = "Void"},
            {Type = "skin", Name = "Trapper", Skin = "Void", Details = "Void"},
            {Type = "skin", Name = "Warden", Skin = "Amalgamation", Details = "Amalgamation"},
        },
    },
}
v4[5] = {
    Type = "Log",
    Props = {
        HeaderName = "Credits",
        Points = {
            "<b>Voidborne Tesla</b> - {$userId:2839626873}, {$userId:1173942460}",
            "<b>Amalgamation Warden</b> - {$userId:313445649}, {$userId:95460255}",
            "<b>Void Accelerator</b> - {$userId:524378412}",
            "<b>Void Altar Farm</b> - {$userId:1540034284}, {$userId:932753232}",
            "<b>Void Trapper</b> - {$userId:479418961}",
        },
    },
}
v4[6] = v10
v4[7] = v11
v4[8] = v12
v4[9] = v13
v4[10] = v14
v4[11] = v15
v3.Content = v4
v5 = {
    Name = "⚖️ Balance Changes:",
    Content = {
        towerChange("Accelerator", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.22 → 0.25</font>"},
            },
            {
                Title = "Level 2 Changes",
                Lines = {"<b>Charge Time:</b> <font color=\"rgb(255,100,100)\">6.5 → 5.5</font>"},
            },
            {
                Title = "Level 3 Changes",
                Lines = {"<b>Charge Time:</b> <font color=\"rgb(255,100,100)\">5.5 → 4</font>"},
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Charge Time:</b> <font color=\"rgb(255,100,100)\">5.5 → 2.5</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>",
                },
            },
            {
                Title = "Level 5 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$55,000 → $50,000</font>",
                    "<b>Charge Time:</b> <font color=\"rgb(255,100,100)\">5.5 → 1.5</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.1 → 0.125</font>",
                },
            },
        }),
        towerChange("Ace Pilot", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.2 → 0.22</font>"},
            },
            {
                Title = "Level 1 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.2 → 0.22</font>"},
            },
            {
                Title = "Level 3 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.12 → 0.15</font>"},
            },
            {
                Title = "Level 4 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.12 → 0.15</font>"},
            },
            {
                Title = "Level 5 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">18 → 14</font>"},
            },
        }),
        towerChange("Assassin", nil, {
            {
                Title = "Level 3 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">14 → 13</font>"},
            },
            {
                Title = "Level 4 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">35 → 33</font>"},
            },
        }),
        towerChange("Brawler", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Reposition Cooldown:</b> <font color=\"rgb(80,255,130)\">20 → 30</font>",
                    "<b>Reposition Level Unlock:</b> <font color=\"rgb(80,255,130)\">3 → 4</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">1.2 → 1</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">6 → 5</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$150 → $200</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">0.8 → 0.6</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">6 → 5</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">6 → 6.5</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$750 → $1,200</font>",
                    "<b>Final Hit Cooldown:</b> <font color=\"rgb(255,100,100)\">0.75 → 0.6</font>",
                    "<b>Final Hit Damage:</b> <font color=\"rgb(80,255,130)\">15 → 21</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">0.75 → 0.6</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">10 → 14</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">6 → 6.5</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$1,500 → $2,500</font>",
                    "<b>Final Hit Cooldown:</b> <font color=\"rgb(255,100,100)\">0.6 → 0.5</font>",
                    "<b>Final Hit Damage:</b> <font color=\"rgb(80,255,130)\">33 → 48</font>",
                    "<b>Knockback Force:</b> <font color=\"rgb(80,255,130)\">20 → 24</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">0.6 → 0.5</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">22 → 24</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">6.25 → 6.5</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$3,000 → $3,500</font>",
                    "<b>Ground Smash Radius:</b> <font color=\"rgb(255,100,100)\">10 → 7.5</font>",
                    "<b>Knockback Force:</b> <font color=\"rgb(80,255,130)\">24 → 28</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">0.6 → 0.5</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">6.5 → 7</font>",
                },
            },
            {
                Title = "Level 5 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$8,250 → $7,777</font>",
                    "<b>Final Hit Damage:</b> <font color=\"rgb(255,100,100)\">111 → 100</font>",
                    "<b>Knockback Force:</b> <font color=\"rgb(255,100,100)\">35 → 32</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">0.5 → 0.4</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">66 → 50</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">7.25 → 8</font>",
                },
            },
        }),
        towerChange("Commando", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Burst Cooldown:</b> <font color=\"rgb(80,255,130)\">0.2 → 0.225</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.2 → 0.225</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Burst Cooldown:</b> <font color=\"rgb(80,255,130)\">0.14 → 0.17</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.14 → 0.17</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">8 → 7</font>"},
            },
            {
                Title = "Level 3 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">16 → 14</font>"},
            },
            {
                Title = "Level 4 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">28 → 23</font>"},
            },
        }),
        towerChange("Cowboy", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Spin Duration:</b> <font color=\"rgb(80,255,130)\">1.5 → 2</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.55 → 1</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">2 → 3</font>",
                    "<b>Income:</b> <font color=\"rgb(80,255,130)\">$20 → $30</font>",
                    "<b>Limit:</b> <font color=\"rgb(80,255,130)\">6 → 12</font>",
                    "<b>Price:</b> <font color=\"rgb(255,100,100)\">$450 → $550</font>",
                    "<b>Range:</b> <font color=\"rgb(255,100,100)\">15 → 13</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$150 → $200</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.45 → 0.9</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">2 → 3</font>",
                    "<b>Income:</b> <font color=\"rgb(80,255,130)\">$20 → $30</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$850 → $600</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.45 → 0.9</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">4 → 5</font>",
                    "<b>Income:</b> <font color=\"rgb(80,255,130)\">$40 → $50</font>",
                    "<b>Range:</b> <font color=\"rgb(255,100,100)\">17 → 15</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$3,000 → $2,000</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">14 → 10</font>",
                    "<b>Income:</b> <font color=\"rgb(255,100,100)\">$75 → $45</font>",
                    "<b>Range:</b> <font color=\"rgb(255,100,100)\">19 → 17.5</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$5,500 → $3,000</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.25 → 0.35</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">14 → 10</font>",
                    "<b>Income:</b> <font color=\"rgb(255,100,100)\">$150 → $125</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">19 → 20</font>",
                },
            },
            {
                Title = "Level 5 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$12,500 → $7,777</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.25 → 0.35</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">28 → 24</font>",
                    "<b>Income:</b> <font color=\"rgb(255,100,100)\">$250 → $185</font>",
                    "<b>Range:</b> <font color=\"rgb(255,100,100)\">21 → 20</font>",
                },
            },
            {
                Title = "Golden Level 0 Changes",
                Lines = {
                    "<b>Spin Duration:</b> <font color=\"rgb(80,255,130)\">1.75 → 2</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.35 → 0.9</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">2 → 3</font>",
                    "<b>Income:</b> <font color=\"rgb(80,255,130)\">$25 → $35</font>",
                    "<b>Limit:</b> <font color=\"rgb(80,255,130)\">6 → 12</font>",
                    "<b>Price:</b> <font color=\"rgb(255,100,100)\">$550 → $600</font>",
                    "<b>Range:</b> <font color=\"rgb(255,100,100)\">15 → 13</font>",
                },
            },
            {
                Title = "Golden Level 1 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$225 → $200</font>",
                    "<b>Spin Duration:</b> <font color=\"rgb(80,255,130)\">1.25 → 1.5</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.3 → 0.75</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">2 → 3</font>",
                    "<b>Income:</b> <font color=\"rgb(80,255,130)\">$25 → $35</font>",
                    "<b>Range:</b> <font color=\"rgb(255,100,100)\">17 → 15</font>",
                },
            },
            {
                Title = "Golden Level 2 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$900 → $650</font>",
                    "<b>Spin Duration:</b> <font color=\"rgb(80,255,130)\">1.25 → 1.5</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.3 → 0.75</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">4 → 5</font>",
                    "<b>Income:</b> <font color=\"rgb(80,255,130)\">$50 → $60</font>",
                    "<b>Range:</b> <font color=\"rgb(255,100,100)\">17 → 15</font>",
                },
            },
            {
                Title = "Golden Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$3,500 → $2,400</font>",
                    "<b>Spin Duration:</b> <font color=\"rgb(80,255,130)\">1 → 1.25</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.5 → 0.6</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">15 → 12</font>",
                    "<b>Income:</b> <font color=\"rgb(255,100,100)\">$85 → $60</font>",
                    "<b>Range:</b> <font color=\"rgb(255,100,100)\">19 → 17.5</font>",
                },
            },
            {
                Title = "Golden Level 4 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$5,500 → $4,250</font>",
                    "<b>Spin Duration:</b> <font color=\"rgb(80,255,130)\">1 → 1.25</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.25 → 0.3</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">15 → 12</font>",
                    "<b>Income:</b> <font color=\"rgb(255,100,100)\">$175 → $150</font>",
                    "<b>Range:</b> <font color=\"rgb(255,100,100)\">21 → 20</font>",
                },
            },
            {
                Title = "Golden Level 5 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$17,000 → $9,750</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.25 → 0.3</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">35 → 26</font>",
                    "<b>Income:</b> <font color=\"rgb(255,100,100)\">$325 → $225</font>",
                    "<b>Range:</b> <font color=\"rgb(255,100,100)\">21 → 20</font>",
                },
            },
        }),
        towerChange("Crook Boss", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {"<b>Range:</b> <font color=\"rgb(80,255,130)\">15 → 16.5</font>"},
            },
            {
                Title = "Level 1 Changes",
                Lines = {"<b>Range:</b> <font color=\"rgb(80,255,130)\">15 → 16.5</font>"},
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">25 → 24</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">17.5 → 19</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.18 → 0.2</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">25 → 24</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">45 → 36</font>"},
            },
            {
                Title = "Golden Level 1 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">14 → 13</font>"},
            },
            {
                Title = "Golden Level 2 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">25 → 24</font>"},
            },
            {
                Title = "Golden Level 3 Changes",
                Lines = {
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.18</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">25 → 24</font>",
                },
            },
            {
                Title = "Golden Level 4 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">50 → 40</font>"},
            },
        }),
        towerChange("Cryomancer", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Defense Melt:</b> <font color=\"rgb(255,100,100)\">10 → 5</font>",
                    "<b>Freeze Time:</b> <font color=\"rgb(255,100,100)\">2 → 0.75</font>",
                    "<b>Max Slow:</b> <font color=\"rgb(255,100,100)\">50 → 15</font>",
                    "<b>Slow Percent:</b> <font color=\"rgb(80,255,130)\">5 → 7.5</font>",
                    "<b>Tick Rate:</b> <font color=\"rgb(80,255,130)\">0.25 → 1</font>",
                    "<b>Max Ammo:</b> <font color=\"rgb(255,100,100)\">40 → 25</font>",
                    "<b>Price:</b> <font color=\"rgb(80,255,130)\">$300 → $250</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">10 → 11</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$250 → $200</font>",
                    "<b>Debuff Length:</b> <font color=\"rgb(80,255,130)\">2 → 3</font>",
                    "<b>Max Slow:</b> <font color=\"rgb(255,100,100)\">65 → 20</font>",
                    "<b>Slow Percent:</b> <font color=\"rgb(80,255,130)\">5 → 10</font>",
                    "<b>Max Ammo:</b> <font color=\"rgb(255,100,100)\">50 → 25</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">12 → 13.5</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Debuff Damage:</b> <font color=\"rgb(80,255,130)\">1 → 3</font>",
                    "<b>Defense Melt:</b> <font color=\"rgb(255,100,100)\">10 → 7</font>",
                    "<b>Debuff Length:</b> <font color=\"rgb(80,255,130)\">2 → 3</font>",
                    "<b>Max Ammo:</b> <font color=\"rgb(255,100,100)\">80 → 50</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$4,000 → $2,750</font>",
                    "<b>Debuff Damage:</b> <font color=\"rgb(80,255,130)\">1 → 5</font>",
                    "<b>Debuff Length:</b> <font color=\"rgb(255,100,100)\">6 → 5</font>",
                    "<b>Max Hits:</b> <font color=\"rgb(80,255,130)\">3 → 4</font>",
                    "<b>Max Slow:</b> <font color=\"rgb(255,100,100)\">65 → 25</font>",
                    "<b>Slow Percent:</b> <font color=\"rgb(80,255,130)\">10 → 12.5</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">1 → 3</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$9,500 → $6,250</font>",
                    "<b>Debuff Damage:</b> <font color=\"rgb(80,255,130)\">3 → 10</font>",
                    "<b>Max Slow:</b> <font color=\"rgb(255,100,100)\">75 → 25</font>",
                    "<b>Reload Time:</b> <font color=\"rgb(80,255,130)\">2 → 1.25</font>",
                    "<b>Width:</b> <font color=\"rgb(80,255,130)\">2 → 2.25</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">2 → 6</font>",
                },
            },
        }),
        towerChange("DJ Booth", nil, {
            {
                Title = "Level 3 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(80,255,130)\">20 → 25</font>"},
            },
        }),
        towerChange("Demoman", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">6 → 8</font>",
                    "<b>Price:</b> <font color=\"rgb(255,100,100)\">$550 → $700</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$225 → $250</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">6 → 8</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$800 → $950</font>",
                    "<b>Explosion Radius:</b> <font color=\"rgb(80,255,130)\">5.25 → 6</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">12 → 15</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$2,325 → $2,500</font>",
                    "<b>Explosion Radius:</b> <font color=\"rgb(80,255,130)\">5.25 → 6</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">25 → 30</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$5,750 → $6,000</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">1.3 → 1.2</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">15.5 → 16</font>",
                },
            },
        }),
        towerChange("Electroshocker", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Chain Range:</b> <font color=\"rgb(80,255,130)\">7 → 10</font>",
                    "<b>Defense Melt:</b> <font color=\"rgb(255,100,100)\">5 → 0</font>",
                    "<b>Max Hits:</b> <font color=\"rgb(80,255,130)\">1 → 2</font>",
                    "<b>Max Stun:</b> <font color=\"rgb(80,255,130)\">0.05 → 0.1</font>",
                    "<b>Min Stun:</b> <font color=\"rgb(80,255,130)\">0.05 → 0.1</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.75 → 1.35</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">2 → 4</font>",
                    "<b>Limit:</b> <font color=\"rgb(255,100,100)\">10 → 7</font>",
                    "<b>Price:</b> <font color=\"rgb(255,100,100)\">$375 → $650</font>",
                    "<b>Range:</b> <font color=\"rgb(255,100,100)\">11 → 10</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$200 → $275</font>",
                    "<b>Chain Range:</b> <font color=\"rgb(80,255,130)\">7 → 10</font>",
                    "<b>Defense Melt:</b> <font color=\"rgb(255,100,100)\">5 → 0</font>",
                    "<b>Max Hits:</b> <font color=\"rgb(80,255,130)\">1 → 2</font>",
                    "<b>Max Stun:</b> <font color=\"rgb(80,255,130)\">0.05 → 0.1</font>",
                    "<b>Min Stun:</b> <font color=\"rgb(80,255,130)\">0.05 → 0.1</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.75 → 1.15</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">3 → 6</font>",
                    "<b>Range:</b> <font color=\"rgb(255,100,100)\">12.5 → 12</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$700 → $950</font>",
                    "<b>Chain Range:</b> <font color=\"rgb(80,255,130)\">7 → 10</font>",
                    "<b>Defense Melt:</b> <font color=\"rgb(255,100,100)\">10 → 0</font>",
                    "<b>Max Hits:</b> <font color=\"rgb(80,255,130)\">1 → 3</font>",
                    "<b>Max Stun:</b> <font color=\"rgb(80,255,130)\">0.08 → 0.1</font>",
                    "<b>Min Stun:</b> <font color=\"rgb(80,255,130)\">0.08 → 0.1</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.65 → 1.15</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">6 → 8</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">12.5 → 13</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$2,500 → $2,400</font>",
                    "<b>Chain Range:</b> <font color=\"rgb(80,255,130)\">7 → 15</font>",
                    "<b>Defense Melt:</b> <font color=\"rgb(255,100,100)\">10 → 0</font>",
                    "<b>Max Hits:</b> <font color=\"rgb(80,255,130)\">2 → 3</font>",
                    "<b>Max Stun:</b> <font color=\"rgb(80,255,130)\">0.08 → 0.1</font>",
                    "<b>Min Stun:</b> <font color=\"rgb(80,255,130)\">0.08 → 0.1</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.65 → 1.15</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">12 → 22</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">12.5 → 13</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$6,350 → $4,000</font>",
                    "<b>Chain Range:</b> <font color=\"rgb(80,255,130)\">10 → 15</font>",
                    "<b>Defense Melt:</b> <font color=\"rgb(255,100,100)\">15 → Removed</font>",
                    "<b>Max Hits:</b> <font color=\"rgb(80,255,130)\">2 → 4</font>",
                    "<b>Max Stun:</b> <font color=\"rgb(255,100,100)\">0.18 → 0.15</font>",
                    "<b>Min Stun:</b> <font color=\"rgb(255,100,100)\">0.18 → 0.15</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">2.25 → 2.5</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">115 → 70</font>",
                    "<b>Range:</b> <font color=\"rgb(255,100,100)\">16 → 13</font>",
                },
            },
            {
                Title = "Level 5 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$16,935 → $10,000</font>",
                    "<b>Chain Range:</b> <font color=\"rgb(80,255,130)\">10 → 20</font>",
                    "<b>Defense Melt:</b> <font color=\"rgb(255,100,100)\">25 → 20</font>",
                    "<b>Max Hits:</b> <font color=\"rgb(80,255,130)\">3 → 6</font>",
                    "<b>Max Stun:</b> <font color=\"rgb(255,100,100)\">0.3 → 0.25</font>",
                    "<b>Min Stun:</b> <font color=\"rgb(255,100,100)\">0.3 → 0.25</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">2.25 → 2.5</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">200 → 100</font>",
                    "<b>Range:</b> <font color=\"rgb(255,100,100)\">17 → 15</font>",
                },
            },
        }),
        towerChange("Elementalist", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Frost Debuff Max Slow:</b> <font color=\"rgb(255,100,100)\">45 → 10</font>",
                    "<b>Frost Debuff Slow Percent:</b> <font color=\"rgb(255,100,100)\">5 → 2</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Frost Debuff Max Slow:</b> <font color=\"rgb(255,100,100)\">45 → 10</font>",
                    "<b>Frost Debuff Slow Percent:</b> <font color=\"rgb(255,100,100)\">7.5 → 2.5</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Frost Debuff Max Slow:</b> <font color=\"rgb(255,100,100)\">50 → 15</font>",
                    "<b>Frost Debuff Slow Percent:</b> <font color=\"rgb(255,100,100)\">7.5 → 2.5</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Frost Debuff Max Slow:</b> <font color=\"rgb(255,100,100)\">50 → 15</font>",
                    "<b>Frost Debuff Slow Percent:</b> <font color=\"rgb(255,100,100)\">10 → 5</font>",
                    "<b>Heat Wave Burn Damage:</b> <font color=\"rgb(255,100,100)\">15 → 14</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">13 → 12</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Frost Debuff Max Slow:</b> <font color=\"rgb(255,100,100)\">60 → 20</font>",
                    "<b>Frost Debuff Slow Percent:</b> <font color=\"rgb(255,100,100)\">12.5 → 5</font>",
                    "<b>Heat Wave Burn Damage:</b> <font color=\"rgb(255,100,100)\">20 → 18</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">18 → 16</font>",
                },
            },
        }),
        towerChange("Freezer", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Debuff Length:</b> <font color=\"rgb(255,100,100)\">5 → 2</font>",
                    "<b>Max Slow:</b> <font color=\"rgb(255,100,100)\">50 → 15</font>",
                    "<b>Slow Percent:</b> <font color=\"rgb(255,100,100)\">10 → 7.5</font>",
                    "<b>Tick Rate:</b> <font color=\"rgb(80,255,130)\">0.25 → 1</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.5 → 0.55</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">1 → 2</font>",
                    "<b>Price:</b> <font color=\"rgb(255,100,100)\">$425 → $450</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$225 → $300</font>",
                    "<b>Max Slow:</b> <font color=\"rgb(255,100,100)\">60 → 20</font>",
                    "<b>Slow Percent:</b> <font color=\"rgb(255,100,100)\">15 → 10</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">0.5 → 0.35</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$650 → $450</font>",
                    "<b>Freeze Time:</b> <font color=\"rgb(255,100,100)\">2 → 0.5</font>",
                    "<b>Max Slow:</b> <font color=\"rgb(80,255,130)\">Added 20</font>",
                    "<b>Slow Percent:</b> <font color=\"rgb(255,100,100)\">20 → 10</font>",
                    "<b>Tick Rate:</b> <font color=\"rgb(80,255,130)\">Added 1</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">Added 0.35</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">2 → 3</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$2,000 → $1,700</font>",
                    "<b>Burst:</b> <font color=\"rgb(80,255,130)\">3 → 5</font>",
                    "<b>Burst Cool:</b> <font color=\"rgb(255,100,100)\">0.75 → 0.6</font>",
                    "<b>Debuff Damage:</b> <font color=\"rgb(80,255,130)\">Added 3</font>",
                    "<b>Debuff Length:</b> <font color=\"rgb(80,255,130)\">Added 3</font>",
                    "<b>Freeze Time:</b> <font color=\"rgb(255,100,100)\">2.5 → 0.5</font>",
                    "<b>Max Slow:</b> <font color=\"rgb(255,100,100)\">75 → 25</font>",
                    "<b>Slow Percent:</b> <font color=\"rgb(255,100,100)\">25 → 12.5</font>",
                    "<b>Tick Rate:</b> <font color=\"rgb(80,255,130)\">Added 1</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">3 → 4</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Burst:</b> <font color=\"rgb(80,255,130)\">6 → 7</font>",
                    "<b>Debuff Damage:</b> <font color=\"rgb(80,255,130)\">Added 5</font>",
                    "<b>Freeze Time:</b> <font color=\"rgb(255,100,100)\">3 → 0.75</font>",
                    "<b>Max Slow:</b> <font color=\"rgb(80,255,130)\">Added 25</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">5 → 9</font>",
                },
            },
        }),
        towerChange("Frost Blaster", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Debuff Length:</b> <font color=\"rgb(255,100,100)\">0.45 → 0.2</font>",
                    "<b>Freeze Time:</b> <font color=\"rgb(255,100,100)\">0.45 → 0.2</font>",
                    "<b>Max Slow:</b> <font color=\"rgb(255,100,100)\">50 → 30</font>",
                    "<b>Slow Percent:</b> <font color=\"rgb(255,100,100)\">50 → 30</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.6 → 0.8</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">3 → 4</font>",
                    "<b>Limit:</b> <font color=\"rgb(255,100,100)\">14 → 12</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Debuff Length:</b> <font color=\"rgb(255,100,100)\">0.6 → 0.3</font>",
                    "<b>Freeze Time:</b> <font color=\"rgb(255,100,100)\">0.6 → 0.3</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.5 → 0.6</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">3 → 4</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$1,350 → $1,250</font>",
                    "<b>Max Slow:</b> <font color=\"rgb(255,100,100)\">75 → 45</font>",
                    "<b>Slow Percent:</b> <font color=\"rgb(255,100,100)\">75 → 45</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">6 → 8</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$3,200 → $3,800</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.3 → 0.45</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">8 → 12</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$8,500 → $9,500</font>",
                    "<b>Debuff Length:</b> <font color=\"rgb(255,100,100)\">1.5 → 0.75</font>",
                    "<b>Freeze Time:</b> <font color=\"rgb(255,100,100)\">1.5 → 0.75</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">53 → 66</font>",
                },
            },
        }),
        towerChange("Gatling Gun", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.17</font>"},
            },
        }),
        towerChange("Hacker", nil, {
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Hologram Tower Lifetime:</b> <font color=\"rgb(80,255,130)\">25 → 30</font>",
                    "<b>Slowness:</b> <font color=\"rgb(255,100,100)\">17.5 → 15</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Hologram Enemy EV:</b> <font color=\"rgb(255,100,100)\">0.725 → 0.675</font>",
                    "<b>Hologram Tower Lifetime:</b> <font color=\"rgb(80,255,130)\">25 → 30</font>",
                    "<b>Slowness:</b> <font color=\"rgb(255,100,100)\">20 → 15</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">20 → 22</font>",
                },
            },
        }),
        towerChange("Hallow Punk", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Explosion Radius:</b> <font color=\"rgb(255,100,100)\">3.5 → 3</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">10 → 12</font>",
                    "<b>Price:</b> <font color=\"rgb(255,100,100)\">$450 → $500</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$350 → $300</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">4.15 → 4</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">20 → 21</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$2,450 → $2,700</font>",
                    "<b>Explosion Radius:</b> <font color=\"rgb(255,100,100)\">5 → 3.5</font>",
                    "<b>Knockback:</b> <font color=\"rgb(255,100,100)\">12.5 → 10</font>",
                    "<b>Rocket Speed:</b> <font color=\"rgb(80,255,130)\">40 → 45</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">4.15 → 4</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">52 → 50</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">20 → 21</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$7,500 → $7,270</font>",
                    "<b>Explosion Radius:</b> <font color=\"rgb(255,100,100)\">6 → 5</font>",
                    "<b>Knockback:</b> <font color=\"rgb(255,100,100)\">15 → 12.5</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">180 → 150</font>",
                },
            },
        }),
        towerChange("Medic", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Uber Charge Initial Cooldown:</b> <font color=\"rgb(80,255,130)\">15 → 30</font>",
                    "<b>Health Overheal Limit:</b> <font color=\"rgb(80,255,130)\">0 → 100</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$400 → $425</font>",
                    "<b>Health Overheal Limit:</b> <font color=\"rgb(80,255,130)\">0 → 100</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$675 → $650</font>",
                    "<b>Health Overheal Limit:</b> <font color=\"rgb(80,255,130)\">5 → 100</font>",
                    "<b>Health Regen:</b> <font color=\"rgb(80,255,130)\">5 → 10</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {"<b>Cost:</b> <font color=\"rgb(255,100,100)\">$2,700 → $2,950</font>"},
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Uber Charge Damage Boost:</b> <font color=\"rgb(255,100,100)\">30 → 27.5</font>",
                    "<b>Health Overheal Limit:</b> <font color=\"rgb(80,255,130)\">20 → 100</font>",
                    "<b>Shield Rechage Speed:</b> <font color=\"rgb(80,255,130)\">4.5 → 5</font>",
                },
            },
            {
                Title = "Level 5 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$15,000 → $14,000</font>",
                    "<b>Uber Charge Damage Boost:</b> <font color=\"rgb(255,100,100)\">40 → 35</font>",
                    "<b>Health Overheal Limit:</b> <font color=\"rgb(80,255,130)\">50 → 100</font>",
                    "<b>Health Regen:</b> <font color=\"rgb(255,100,100)\">25 → 20</font>",
                    "<b>Shield Rechage Speed:</b> <font color=\"rgb(80,255,130)\">4 → 4.5</font>",
                },
            },
        }),
        towerChange("Militant", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.2 → 0.225</font>"},
            },
            {
                Title = "Level 1 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>"},
            },
            {
                Title = "Level 2 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>"},
            },
            {
                Title = "Level 3 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>"},
            },
            {
                Title = "Level 4 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>"},
            },
        }),
        towerChange("Minigunner", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.16</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">15 → 16</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$400 → $350</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">15 → 16</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$7,000 → $5,500</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.1 → 0.12</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$15,500 → $17,000</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.09 → 0.1</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">15 → 14</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">20 → 21</font>",
                },
            },
            {
                Title = "Golden Level 0 Changes",
                Lines = {
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.12 → 0.16</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">2 → 3</font>",
                    "<b>Price:</b> <font color=\"rgb(255,100,100)\">$2,000 → $2,400</font>",
                },
            },
            {
                Title = "Golden Level 1 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$250 → $1,000</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.1 → 0.12</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">2 → 3</font>",
                },
            },
            {
                Title = "Golden Level 2 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$1,500 → $4,800</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.1 → 0.12</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">3 → 7</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">19 → 20</font>",
                },
            },
            {
                Title = "Golden Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$9,001 → $13,500</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">10 → 13</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">19 → 20</font>",
                },
            },
            {
                Title = "Golden Level 4 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$18,624 → $27,500</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.09 → 0.1</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">17 → 20</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">21 → 22</font>",
                },
            },
        }),
        towerChange("Necromancer", nil, {
            {
                Title = "Level 4 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">30 → 28</font>"},
            },
        }),
        towerChange("Pursuit", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Patrol Cooldown:</b> <font color=\"rgb(80,255,130)\">10 → 20</font>",
                    "<b>Speed:</b> <font color=\"rgb(255,100,100)\">50 → 45</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.2 → 0.225</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">6 → 7</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Speed:</b> <font color=\"rgb(255,100,100)\">50 → 45</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.2 → 0.225</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">6 → 7</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Speed:</b> <font color=\"rgb(255,100,100)\">50 → 45</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>",
                    "<b>Max Ammo:</b> <font color=\"rgb(80,255,130)\">65 → 75</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">7 → 8</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$5,000 → $4,750</font>",
                    "<b>Explosion Damage:</b> <font color=\"rgb(255,100,100)\">45 → 30</font>",
                    "<b>Speed:</b> <font color=\"rgb(255,100,100)\">50 → 45</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">10 → 12</font>",
                    "<b>Max Ammo:</b> <font color=\"rgb(80,255,130)\">65 → 75</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">7 → 8</font>",
                },
            },
        }),
        towerChange("Pyromancer", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.25 → 0.275</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">8 → 9</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">10 → 11</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">10 → 11</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>"},
            },
            {
                Title = "Level 4 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>"},
            },
            {
                Title = "Level 5 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>"},
            },
            {
                Title = "Golden Level 0 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.25 → 0.275</font>"},
            },
            {
                Title = "Golden Level 1 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>"},
            },
            {
                Title = "Golden Level 2 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>"},
            },
            {
                Title = "Golden Level 3 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>"},
            },
            {
                Title = "Golden Level 4 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>"},
            },
            {
                Title = "Golden Level 5 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>"},
            },
        }),
        towerChange("Scout", nil, {
            {
                Title = "Level 3 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.6 → 0.65</font>"},
            },
            {
                Title = "Level 4 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.3 → 0.325</font>"},
            },
            {
                Title = "Golden Level 2 Changes",
                Lines = {"<b>Cost:</b> <font color=\"rgb(255,100,100)\">$600 → $700</font>"},
            },
            {
                Title = "Golden Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$2,250 → $2,400</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">35 → 34</font>",
                    "<b>Range:</b> <font color=\"rgb(255,100,100)\">18 → 17.5</font>",
                },
            },
            {
                Title = "Golden Level 4 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$3,400 → $3,600</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">35 → 34</font>",
                    "<b>Range:</b> <font color=\"rgb(255,100,100)\">18 → 17.5</font>",
                },
            },
        }),
        towerChange("Shotgunner", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Shot Size:</b> <font color=\"rgb(80,255,130)\">6 → 8</font>",
                    "<b>Spread:</b> <font color=\"rgb(255,100,100)\">100 → 10</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">1 → 1.2</font>",
                    "<b>Limit:</b> <font color=\"rgb(255,100,100)\">None → 9</font>",
                    "<b>Price:</b> <font color=\"rgb(255,100,100)\">$800 → $1,225</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">7.5 → 8</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$300 → $640</font>",
                    "<b>Shot Size:</b> <font color=\"rgb(80,255,130)\">6 → 8</font>",
                    "<b>Spread:</b> <font color=\"rgb(255,100,100)\">40 → 10</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">1 → 1.2</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">7.5 → 8</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$1,200 → $1,550</font>",
                    "<b>Shot Size:</b> <font color=\"rgb(80,255,130)\">8 → 10</font>",
                    "<b>Spread:</b> <font color=\"rgb(255,100,100)\">40 → 15</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">1 → 0.85</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">9 → 9.5</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$3,400 → $6,000</font>",
                    "<b>Shot Size:</b> <font color=\"rgb(80,255,130)\">8 → 10</font>",
                    "<b>Spread:</b> <font color=\"rgb(255,100,100)\">40 → 25</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.8 → 0.85</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">5 → 7</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">9.5 → 11</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$9,500 → $18,500</font>",
                    "<b>Shot Size:</b> <font color=\"rgb(80,255,130)\">9 → 12</font>",
                    "<b>Spread:</b> <font color=\"rgb(80,255,130)\">30 → 40</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">0.8 → 0.75</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">10 → 14</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">11 → 13.5</font>",
                },
            },
        }),
        towerChange("Slasher", nil, {
            {
                Title = "Level 1 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">15 → 14</font>"},
            },
            {
                Title = "Level 2 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">15 → 14</font>"},
            },
            {
                Title = "Level 3 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">25 → 24</font>"},
            },
            {
                Title = "Level 4 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">40 → 38</font>"},
            },
        }),
        towerChange("Sledger", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Max Hits:</b> <font color=\"rgb(80,255,130)\">2 → 3</font>",
                    "<b>Max Slow:</b> <font color=\"rgb(255,100,100)\">45 → 30</font>",
                    "<b>Slow Percent:</b> <font color=\"rgb(255,100,100)\">15 → 10</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">8 → 10</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Slow Percent:</b> <font color=\"rgb(255,100,100)\">25 → 15</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">12 → 14</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Freeze Time:</b> <font color=\"rgb(255,100,100)\">1.5 → 0.75</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">25 → 28</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Max Slow:</b> <font color=\"rgb(255,100,100)\">60 → 35</font>",
                    "<b>Slow Percent:</b> <font color=\"rgb(255,100,100)\">30 → 17.5</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">45 → 50</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Max Slow:</b> <font color=\"rgb(255,100,100)\">65 → 35</font>",
                    "<b>Slow Percent:</b> <font color=\"rgb(255,100,100)\">45 → 17.5</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">75 → 100</font>",
                },
            },
            {
                Title = "Level 5 Changes",
                Lines = {
                    "<b>Aftershock Damage Mult:</b> <font color=\"rgb(80,255,130)\">0.2 → 0.3</font>",
                    "<b>Debuff Length:</b> <font color=\"rgb(255,100,100)\">6 → 5</font>",
                    "<b>Freeze Time:</b> <font color=\"rgb(255,100,100)\">1.75 → 1</font>",
                    "<b>Max Hits:</b> <font color=\"rgb(80,255,130)\">6 → 7</font>",
                    "<b>Max Slow:</b> <font color=\"rgb(255,100,100)\">80 → 35</font>",
                    "<b>Slow Percent:</b> <font color=\"rgb(255,100,100)\">80 → 35</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">140 → 150</font>",
                },
            },
        }),
        towerChange("Sniper", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {"<b>Range:</b> <font color=\"rgb(80,255,130)\">25 → 28</font>"},
            },
            {
                Title = "Level 2 Changes",
                Lines = {"<b>Range:</b> <font color=\"rgb(80,255,130)\">28 → 30</font>"},
            },
            {
                Title = "Level 3 Changes",
                Lines = {"<b>Cost:</b> <font color=\"rgb(80,255,130)\">$2,250 → $2,000</font>"},
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$4,500 → $5,000</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">3.5 → 3.2</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">40 → 45</font>",
                },
            },
        }),
        towerChange("Snowballer", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Explosion Radius:</b> <font color=\"rgb(80,255,130)\">2 → 5</font>",
                    "<b>Max Hits:</b> <font color=\"rgb(80,255,130)\">1 → 2</font>",
                    "<b>Max Slow:</b> <font color=\"rgb(255,100,100)\">30 → 20</font>",
                    "<b>Slow Percent:</b> <font color=\"rgb(255,100,100)\">15 → 10</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">2.25 → 1.5</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">4 → 3</font>",
                    "<b>Price:</b> <font color=\"rgb(255,100,100)\">$250 → $300</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">11 → 15</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$75 → $50</font>",
                    "<b>Max Slow:</b> <font color=\"rgb(255,100,100)\">40 → 20</font>",
                    "<b>Slow Percent:</b> <font color=\"rgb(255,100,100)\">20 → 10</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">2 → 1.35</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">5 → 3</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">13 → 17.5</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$375 → $320</font>",
                    "<b>Debuff Length:</b> <font color=\"rgb(255,100,100)\">4 → 3</font>",
                    "<b>Max Slow:</b> <font color=\"rgb(255,100,100)\">60 → 30</font>",
                    "<b>Slow Percent:</b> <font color=\"rgb(255,100,100)\">30 → 15</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">2 → 1.35</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">10 → 6</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">15 → 17.5</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$1,650 → $3,000</font>",
                    "<b>Explosion Radius:</b> <font color=\"rgb(80,255,130)\">4 → 5</font>",
                    "<b>Freeze Time:</b> <font color=\"rgb(255,100,100)\">2 → 0.6</font>",
                    "<b>Max Hits:</b> <font color=\"rgb(255,100,100)\">4 → 3</font>",
                    "<b>Max Slow:</b> <font color=\"rgb(80,255,130)\">Added 30</font>",
                    "<b>Slow Percent:</b> <font color=\"rgb(255,100,100)\">30 → 15</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">1.75 → 1.25</font>",
                    "<b>Range:</b> <font color=\"rgb(255,100,100)\">21 → 20</font>",
                },
            },
        }),
        towerChange("Soldier", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Burst Cool:</b> <font color=\"rgb(255,100,100)\">0.55 → 0.5</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$50 → $100</font>",
                    "<b>Burst Cool:</b> <font color=\"rgb(255,100,100)\">0.55 → 0.4</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.125 → 0.15</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$650 → $700</font>",
                    "<b>Burst Cool:</b> <font color=\"rgb(255,100,100)\">0.55 → 0.4</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.125 → 0.15</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$1,350 → $1,850</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.125 → 0.15</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">3 → 4</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$5,000 → $6,000</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.125 → 0.15</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">8 → 10</font>",
                },
            },
            {
                Title = "Golden Level 0 Changes",
                Lines = {"<b>Burst Cool:</b> <font color=\"rgb(80,255,130)\">0.35 → 0.45</font>"},
            },
            {
                Title = "Golden Level 1 Changes",
                Lines = {"<b>Burst Cool:</b> <font color=\"rgb(80,255,130)\">0.25 → 0.35</font>"},
            },
            {
                Title = "Golden Level 2 Changes",
                Lines = {"<b>Burst Cool:</b> <font color=\"rgb(80,255,130)\">0.25 → 0.35</font>"},
            },
            {
                Title = "Golden Level 3 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">5 → 4</font>"},
            },
            {
                Title = "Golden Level 4 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">14 → 12</font>"},
            },
        }),
        towerChange("Spotlight Tech", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.3 → 0.325</font>"},
            },
            {
                Title = "Level 1 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.3 → 0.325</font>"},
            },
            {
                Title = "Level 2 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.3 → 0.325</font>"},
            },
            {
                Title = "Level 3 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">12 → 10</font>"},
            },
            {
                Title = "Level 4 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">15 → 14</font>"},
            },
        }),
        towerChange("Toxic Gunner", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.1 → 0.12</font>"},
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Poison Damage:</b> <font color=\"rgb(255,100,100)\">4 → 3</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.1 → 0.12</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">0.135 → 0.12</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">11 → 8</font>",
                },
            },
        }),
        towerChange("Trapper", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Max Traps:</b> <font color=\"rgb(80,255,130)\">4 → 6</font>",
                    "<b>Trap Lifespan:</b> <font color=\"rgb(255,100,100)\">75 → 25</font>",
                    "<b>Traps Spike Cooldown:</b> <font color=\"rgb(255,100,100)\">5.25 → 4</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">5.25 → 4</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Max Traps:</b> <font color=\"rgb(80,255,130)\">5 → 6</font>",
                    "<b>Traps Spike Cooldown:</b> <font color=\"rgb(255,100,100)\">5 → 4</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">5 → 4</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Max Traps:</b> <font color=\"rgb(80,255,130)\">6 → 7</font>",
                    "<b>Traps Landmine Burn Damage:</b> <font color=\"rgb(80,255,130)\">3 → 5</font>",
                    "<b>Traps Landmine Burn Tick:</b> <font color=\"rgb(255,100,100)\">1 → 0.25</font>",
                    "<b>Traps Landmine Cooldown:</b> <font color=\"rgb(255,100,100)\">5 → 4</font>",
                    "<b>Traps Spike Cooldown:</b> <font color=\"rgb(255,100,100)\">5 → 4</font>",
                    "<b>Traps Spike Health:</b> <font color=\"rgb(80,255,130)\">60 → 75</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$5,000 → $6,000</font>",
                    "<b>Max Traps:</b> <font color=\"rgb(80,255,130)\">7 → 9</font>",
                    "<b>Traps Landmine Burn Damage:</b> <font color=\"rgb(255,100,100)\">5 → 3</font>",
                    "<b>Traps Landmine Cooldown:</b> <font color=\"rgb(255,100,100)\">4 → 3</font>",
                    "<b>Traps Landmine Damage:</b> <font color=\"rgb(80,255,130)\">80 → 100</font>",
                    "<b>Traps Spike Cooldown:</b> <font color=\"rgb(255,100,100)\">5 → 3</font>",
                    "<b>Traps Spike Damage:</b> <font color=\"rgb(80,255,130)\">40 → 45</font>",
                    "<b>Traps Spike Health:</b> <font color=\"rgb(255,100,100)\">280 → 225</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">4 → 3</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$13,500 → $11,500</font>",
                    "<b>Max Traps:</b> <font color=\"rgb(80,255,130)\">9 → 13</font>",
                    "<b>Traps Bear Trap Cooldown:</b> <font color=\"rgb(255,100,100)\">3.5 → 2.5</font>",
                    "<b>Traps Bear Trap Damage:</b> <font color=\"rgb(255,100,100)\">350 → 325</font>",
                    "<b>Traps Landmine Burn Damage:</b> <font color=\"rgb(255,100,100)\">7 → 4</font>",
                    "<b>Traps Landmine Damage:</b> <font color=\"rgb(80,255,130)\">140 → 160</font>",
                    "<b>Traps Spike Cooldown:</b> <font color=\"rgb(255,100,100)\">4.5 → 2.5</font>",
                    "<b>Traps Spike Damage:</b> <font color=\"rgb(80,255,130)\">60 → 65</font>",
                    "<b>Traps Spike Health:</b> <font color=\"rgb(255,100,100)\">600 → 325</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">2 → 2.5</font>",
                },
            },
        }),
        towerChange("Turret", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">24 → 20</font>",
                    "<b>Price:</b> <font color=\"rgb(80,255,130)\">$8,750 → $7,750</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">18 → 19</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$2,750 → $3,750</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">30 → 28</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">18 → 19</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">30 → 28</font>"},
            },
            {
                Title = "Level 3 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">40 → 35</font>"},
            },
            {
                Title = "Level 4 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">65 → 57</font>"},
            },
            {
                Title = "Level 5 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">78 → 62</font>"},
            },
        }),
        towerChange("Warlock", nil, {
            {
                Title = "Level 5 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">260 → 250</font>"},
            },
        }),
        unitChange("Gift Bomber", {
            {
                Title = "General Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">150 → 148</font>"},
            },
        }),
        unitChange("Goon2", {
            {
                Title = "General Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.18 → 0.2</font>"},
            },
            {
                Title = "Golden General Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">6 → 5</font>"},
            },
        }),
        unitChange("Goon3", {
            {
                Title = "General Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">6 → 5</font>"},
            },
            {
                Title = "Golden General Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">8 → 6</font>"},
            },
        }),
        unitChange("Gunner APC", {
            {
                Title = "General Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">8 → 7</font>"},
            },
        }),
        unitChange("Gunner Elf", {
            {
                Title = "Default Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">5 → 4</font>"},
            },
            {
                Title = "Upgrade 1 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">7 → 6</font>"},
            },
        }),
        unitChange("Humvee 3", {
            {
                Title = "General Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.2 → 0.225</font>"},
            },
        }),
        unitChange("Ice Turret", {
            {
                Title = "Default Changes",
                Lines = {
                    "<b>Frost Debuff Max Slow:</b> <font color=\"rgb(255,100,100)\">50 → 15</font>",
                    "<b>Frost Debuff Slow Percent:</b> <font color=\"rgb(255,100,100)\">25 → 2.5</font>",
                },
            },
            {
                Title = "Upgrade 1 Changes",
                Lines = {
                    "<b>Frost Debuff Max Slow:</b> <font color=\"rgb(255,100,100)\">50 → 15</font>",
                    "<b>Frost Debuff Slow Percent:</b> <font color=\"rgb(255,100,100)\">25 → 5</font>",
                },
            },
            {
                Title = "Upgrade 2 Changes",
                Lines = {
                    "<b>Frost Debuff Max Slow:</b> <font color=\"rgb(255,100,100)\">60 → 20</font>",
                    "<b>Frost Debuff Slow Percent:</b> <font color=\"rgb(255,100,100)\">30 → 5</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">30 → 28</font>",
                },
            },
        }),
        unitChange("Railgun Tank", {
            {
                Title = "General Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15 → 0.175</font>"},
            },
        }),
        unitChange("Rifleman", {
            {
                Title = "Default Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">6 → 5</font>"},
            },
            {
                Title = "Upgrade 1 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">9 → 8</font>"},
            },
            {
                Title = "Upgrade 2 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">18 → 17</font>"},
            },
        }),
        unitChange("Sentry2", {
            {
                Title = "General Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.17 → 0.2</font>"},
            },
        }),
        unitChange("Sentry3", {
            {
                Title = "General Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.12 → 0.15</font>"},
            },
        }),
        unitChange("Sentry4", {
            {
                Title = "General Changes",
                Lines = {
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.1 → 0.125</font>",
                    "<b>Explosion Damage:</b> <font color=\"rgb(255,100,100)\">75 → 60</font>",
                },
            },
        }),
        unitChange("Skeleton Knight", {
            {
                Title = "General Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">90 → 87</font>"},
            },
        }),
        unitChange("Sword Skeleton", {
            {
                Title = "General Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">25 → 24</font>"},
            },
        }),
        unitChange("Tank", {
            {
                Title = "General Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.2 → 0.225</font>"},
            },
        }),
        (unitChange("Warrior Elf", {
            {
                Title = "Default Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">28 → 27</font>"},
            },
            {
                Title = "Upgrade 1 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">42 → 40</font>"},
            },
        })),
    },
}
v2[1] = v3
v2[2] = {
    Name = "🛠️ Game Changes:",
    Content = {
        {
            Type = "Log",
            Props = {
                Minimize = 0.65,
                SubjectName = "Fixes",
                Points = {
                    "The long standing `Rate Of Fire` bug has been addressed. Multiple towers have received statiscal changes to account for this fix, but their performance should remain relatively similar to previous update.",
                    "Fixed the Fallen Angel mission displaying the wrong Medic requirement.",
                    "Fixed incorrect fan art credits in the lobby.",
                    "Fixed some enemy hitboxes disappearing.",
                    "Fixed projectiles missing moving enemies more often than intended.",
                    "Fixed certain multi-hit projectiles not damaging enemies consistently.",
                    "Fixed enemies drifting, snapping, or rotating incorrectly after being stopped, slowed, or frozen.",
                    "Fixed Freeze and Frost interactions on enemies with freeze immunity.",
                    "Fixed Flash Bang and Hacker slowness effects applying incorrectly.",
                    "Fixed Bloated enemies showing incorrect max health after scaling.",
                    "Fixed tower buff and stun visuals lingering after a tower was destroyed.",
                    "Fixed tower buff displays not always updating consistently.",
                    "Fixed cash and quest credit from damage debuffs not always being awarded correctly.",
                    "Fixed Commander-spawned units dealing or crediting collision damage incorrectly.",
                    "Fixed Engineer sentry shields not returning correctly after stun effects.",
                    "Fixed Hacker-converted enemies continuing old animations after conversion.",
                    "Fixed Pursuit repositioning and flight visuals desyncing.",
                    "Fixed Pursuit barrel and rev visuals on some skins.",
                    "Fixed placement previews using incorrect pivots for some towers.",
                    "Fixed some dialog character poses not loading correctly.",
                    "Fixed the Timescale button overlapping other hotbar buttons.",
                    "Fixed some particle effects causing startup errors.",
                    "Fixed VFX being re-enabled after another system disabled them.",
                    "Fixed temporary asset loading errors causing some packages to fail to load.",
                    "Fixed Elf Camp's ranged units sometimes missing their shots and dealing no damage.",
                    "Fixed Elf Camp's splash units not landing explosions where intended, which caused significantly less damage than expected.",
                    "Fixed Pursuit struggling to target and attack boss-type and larger enemies at the edge of its range.",
                    "Fixed Pursuit's reposition ability using the wrong patrol range.",
                    "Updated wave timer logic to trigger on enemy death animation start.",
                },
            },
        },
    },
}
v2[3] = v5
v1.Sections = v2
return v1