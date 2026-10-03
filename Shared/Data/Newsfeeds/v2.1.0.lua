-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v2.1.0
-- Decompile time: 4.48 ms

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
    return (("<b>%*:</b> <font color=\"%*\">%* -> %*</font>"):format(a1, a4, a2, a3))
end

local function statLine(a1, a2) -- Line: 24
    return (("<b>%*:</b> %*"):format(a1, a2))
end

local function addedLine(a1, a2, a3) -- Line: 28
    return (("<b>%*:</b> <font color=\"%*\">Added %*</font>"):format(a1, a3, a2))
end

local function towerChange(a1, a2, a3) -- Line: 32
    return {
        Type = "ItemChange",
        Props = {Item = {Type = "tower", Name = a1, DisplayName = a2}, Changes = a3},
    }
end

local v1 = {UpdateName = "Operator Tower", ImageId = 104624996139359}
local v2 = {}
local v3 = {Name = "Update Log:"}
local v4 = {}
local v5 = {Type = "Log"}
local v6 = {
    HeaderName = "Operator",
    HeaderSubject = "Scout's evolved form is online. Operator is an early-game specialist that gets stronger when deployed in coordinated groups.",
}
local v7 = {}
local u27 = 135751604636881
local u28 = "Shared Optics: Level 4+ Operators can target enemies inside the ranges of other Level 4+ Operators connected through attack range chains."
local u30 = 87704249992221
local u31 = "Coordination: Level 2+ Operators gain bonus damage for each nearby Operator that also has Coordination unlocked."
v7[1] = "Operator evolves from Scout and unlocks its full upgrade tree through tower progression."
v7[2] = "Operator can be purchased for 15,000 coins and 4,500 gems."

v7[3] = function(a1, a2) -- Line: 10 -- upvalues: ImageCaption (val), u27 (val), u28 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u27 or 0, Text = u28})
end

v7[4] = function(a1, a2) -- Line: 10 -- upvalues: ImageCaption (val), u30 (val), u31 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u30 or 0, Text = u31})
end

v6.Points = v7
v5.Props = v6
v6 = towerChange("EvolvedOperator", "Operator", {
    {
        Title = "Unlock Details",
        Lines = {
            "<b>Evolves From:</b> Scout",
            "<b>Evolution Level:</b> 20",
            "<b>Purchase Cost:</b> 15,000 Coins and 4,500 Gems",
            "<b>Tower Limit:</b> 16",
        },
    },
    {
        Title = "Level 0 Stats",
        Lines = {
            "<b>Price:</b> $300",
            "<b>Damage:</b> 1",
            "<b>Cooldown:</b> 0.12",
            "<b>Range:</b> 14",
            "<b>Burst:</b> 6",
            "<b>Burst Cooldown:</b> 1.6s",
            "<b>Detection:</b> None",
        },
    },
    {
        Title = "Level 1: Tactical Gear",
        Lines = {
            "<b>Cost:</b> $325",
            "<b>Damage:</b> 2",
            "<b>Cooldown:</b> 0.12",
            "<b>Range:</b> 14",
            "<b>Burst:</b> 6",
            "<b>Burst Cooldown:</b> 1.6s",
            "<b>Detection:</b> Hidden",
        },
    },
    {
        Title = "Level 2: Convergent Forces",
        Lines = {
            "<b>Cost:</b> $500",
            "<b>Damage:</b> 3",
            "<b>Cooldown:</b> 0.12",
            "<b>Range:</b> 16",
            "<b>Burst:</b> 6",
            "<b>Burst Cooldown:</b> 1.4s",
            "<b>Coordination Damage:</b> +5% per Operator",
            "<b>Coordination Range:</b> 5",
            "<b>Detection:</b> Hidden and Flying",
        },
    },
    {
        Title = "Level 3: Cyber-Enforcer",
        Lines = {
            "<b>Cost:</b> $1,250",
            "<b>Damage:</b> 5",
            "<b>Cooldown:</b> 0.1",
            "<b>Range:</b> 16",
            "<b>Burst:</b> 8",
            "<b>Burst Cooldown:</b> 1.4s",
            "<b>Coordination Damage:</b> +5% per Operator",
            "<b>Coordination Range:</b> 5",
            "<b>Detection:</b> Hidden and Flying",
        },
    },
    {
        Title = "Level 4: Synchronized Vision",
        Lines = {
            "<b>Cost:</b> $2,100",
            "<b>Damage:</b> 7",
            "<b>Cooldown:</b> 0.1",
            "<b>Range:</b> 16",
            "<b>Burst:</b> 8",
            "<b>Burst Cooldown:</b> 1.4s",
            "<b>Coordination Damage:</b> +5% per Operator",
            "<b>Coordination Range:</b> 5",
            "<b>Shared Optics:</b> Enabled",
            "<b>Detection:</b> Hidden and Flying",
        },
    },
    {
        Title = "Level 5: Threat Detection Sentinel",
        Lines = {
            "<b>Cost:</b> $3,350",
            "<b>Damage:</b> 7",
            "<b>Cooldown:</b> 0.16",
            "<b>Range:</b> 17",
            "<b>Firing Mode:</b> Automatic",
            "<b>Coordination Damage:</b> +5% per Operator",
            "<b>Coordination Range:</b> 5",
            "<b>Shared Optics:</b> Enabled",
            "<b>Detection:</b> Hidden and Flying",
        },
    },
    {
        Title = "Level 6: 1000-THR E.M.",
        Lines = {
            "<b>Cost:</b> $6,400",
            "<b>Damage:</b> 12",
            "<b>Cooldown:</b> 0.16",
            "<b>Range:</b> 17",
            "<b>Firing Mode:</b> Automatic",
            "<b>Coordination Damage:</b> +7.5% per Operator",
            "<b>Coordination Range:</b> 5",
            "<b>Shared Optics:</b> Enabled",
            "<b>Detection:</b> Hidden and Flying",
        },
    },
})
v7 = {Type = "Log"}
local v8 = {
    HeaderName = "In-Game Communications",
    HeaderSubject = "A new communication hotbar helps teams coordinate requests without needing voice chat.",
}
local v9 = {}
local u124 = 91585031890126
local u125 = nil
v9[1] = "Players can suggest placing towers, selling towers, upgrading towers, using abilities, and using consumables."
v9[2] = "Suggestions appear as temporary, non-blocking tags and notify the targeted player."
v9[3] = "Communication suggestions are rate-limited so team calls stay readable."

v9[4] = function(a1, a2) -- Line: 10 -- upvalues: ImageCaption (val), u124 (val), u125 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u124 or 0, Text = u125})
end

v8.Points = v9
v7.Props = v8
v4[1] = v5
v4[2] = v6
v4[3] = v7
v3.Content = v4
v5 = {
    Name = "Balance Changes:",
    Content = {
        towerChange("Accelerator", nil, {
            {
                Title = "Level 5 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(80,255,130)\">55 -> 60</font>"},
            },
        }),
        towerChange("EvolvedJuggernaut", "Juggernaut", {
            {
                Title = "Path A Level 4 Changes",
                Lines = {"<b>Detection:</b> <font color=\"rgb(80,255,130)\">Added Flying</font>"},
            },
            {
                Title = "Path A Level 6 Changes",
                Lines = {"<b>Damage:</b> <font color=\"rgb(255,100,100)\">160 -> 150</font>"},
            },
            {
                Title = "Path A Level 7 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$150,000 -> $175,000</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">240 -> 215</font>",
                },
            },
        }),
        towerChange("Minigunner", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {"<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.16 -> 0.15</font>"},
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$5,500 -> $6,500</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.12 -> 0.1</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$17,000 -> $21,500</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">14 -> 16</font>",
                },
            },
        }),
        towerChange("Mortar", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {"<b>Limit:</b> <font color=\"rgb(80,255,130)\">3 -> 4</font>"},
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$19,000 -> $13,500</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">125 -> 100</font>",
                },
            },
            {
                Title = "Level 5 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$35,500 -> $30,000</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">290 -> 235</font>",
                },
            },
        }),
        towerChange("Pyromancer", nil, {
            {
                Title = "Golden Level 4 Changes",
                Lines = {"<b>Cost:</b> <font color=\"rgb(80,255,130)\">$9,800 -> $7,500</font>"},
            },
            {
                Title = "Golden Level 5 Changes",
                Lines = {"<b>Cost:</b> <font color=\"rgb(80,255,130)\">$21,435 -> $16,000</font>"},
            },
        }),
        towerChange("Saboteur", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {"<b>Hit Slowness:</b> <font color=\"rgb(255,100,100)\">10% -> 7.5%</font>"},
            },
            {
                Title = "Level 4 Changes",
                Lines = {"<b>Hit Slowness:</b> <font color=\"rgb(255,100,100)\">15% -> 10%</font>"},
            },
        }),
        towerChange("Scout", nil, {
            {
                Title = "Golden Level 2 Changes",
                Lines = {"<b>Cost:</b> <font color=\"rgb(80,255,130)\">$700 -> $600</font>"},
            },
            {
                Title = "Progression Changes",
                Lines = {
                    "<b>Evolution:</b> <font color=\"rgb(80,255,130)\">Added Operator</font>",
                    "<b>Max Tower Level:</b> 20",
                    "<b>Base XP:</b> 50",
                    "<b>Growth Rate:</b> 1.1",
                },
            },
        }),
        (towerChange("Warden", nil, {
            {
                Title = "Mini-Rework Details",
                Lines = {"<b>Gains Tempory Damage Buff and Stun Immunity on parry:</b> 100% DMG Buff"},
            },
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Critical Hit Multiplier:</b> <font color=\"rgb(80,255,130)\">1.25x -> 1.5x</font>",
                    "<b>Stun Length:</b> <font color=\"rgb(255,100,100)\">1 -> 0.5</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">6 -> 12</font>",
                    "<b>Limit:</b> <font color=\"rgb(255,100,100)\">15 -> 12</font>",
                    "<b>Price:</b> <font color=\"rgb(255,100,100)\">$800 -> $1,850</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">6 -> 6.5</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$350 -> $975</font>",
                    "<b>Critical Hit Multiplier:</b> <font color=\"rgb(80,255,130)\">1.25x -> 1.75x</font>",
                    "<b>Stun Length:</b> <font color=\"rgb(255,100,100)\">1 -> 0.5</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">8 -> 17</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">6 -> 7</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$1,250 -> $1,987</font>",
                    "<b>Critical Hit Multiplier:</b> <font color=\"rgb(80,255,130)\">1.25x -> 1.75x</font>",
                    "<b>Stun Length:</b> <font color=\"rgb(255,100,100)\">1.75 -> 0.75</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.6 -> 0.55</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">16 -> 28</font>",
                    "<b>Detection:</b> <font color=\"rgb(80,255,130)\">Added Lead</font>",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$4,500 -> $5,750</font>",
                    "<b>Critical Hit Multiplier:</b> <font color=\"rgb(80,255,130)\">1.25x -> 2x</font>",
                    "<b>Stun Length:</b> <font color=\"rgb(255,100,100)\">1.75 -> 0.75</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.6 -> 0.45</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">35 -> 48</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">7 -> 7.5</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$17,500 -> $16,500</font>",
                    "<b>Critical Hit Multiplier:</b> <font color=\"rgb(80,255,130)\">1.25x -> 3x</font>",
                    "<b>Parry Cooldown:</b> <font color=\"rgb(255,100,100)\">0.25 -> 6</font>",
                    "<b>Parry Length:</b> <font color=\"rgb(255,100,100)\">1.25 -> 1</font>",
                    "<b>Stun Length:</b> <font color=\"rgb(255,100,100)\">2.5 -> 1.25</font>",
                    "<b>Parry Damage Buff:</b> <font color=\"rgb(80,255,130)\">Added 100%</font>",
                    "<b>Parry Buff Time:</b> <font color=\"rgb(80,255,130)\">Added 6s</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">0.5 -> 0.45</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">85 -> 80</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">8 -> 8.5</font>",
                },
            },
        })),
    },
}
v2[1] = v3
v2[2] = {
    Name = "Game Changes:",
    Content = {
        {
            Type = "Log",
            Props = {
                Minimize = 0.65,
                SubjectName = "Fixes",
                Points = {
                    "Fixed Accelerator beam visuals and cleanup on several skins, including Octopus and Champion beam attachments.",
                    "Fixed explosion damage interactions for stun-immune sources hitting explosion-immune enemies.",
                    "Fixed badge rewards showing in achievement reward lists.",
                    "Fixed achievement reward item spacing and alignment.",
                    "Fixed reward and hotbar UI errors when map name, tower limit, or reinforcement skill values are missing.",
                    "Fixed tower upgrade range stats not including range skill bonuses.",
                    "Fixed missing enemy and unit node attachments causing hitboxes, spotlights, summon effects, or corruption effects to position incorrectly.",
                    "Fixed enemy cleanup leaving dead enemies in path tables or enemy counts.",
                    "Fixed enemies drifting, snapping, or sliding after freezes, speed changes, and forced movement.",
                    "Fixed frozen enemies continuing to use knockback or forced movement.",
                    "Fixed tower abilities being usable after the game ended or during revive intermission.",
                    "Fixed Neuralyzed bonus damage rounding up instead of rounding down.",
                    "Fixed matchmaking results showing wins instead of triumphs.",
                    "Fixed Elementalist placement, delayed effects, and summoned unit cleanup after the tower is removed.",
                    "Fixed upgrade panels erroring on invalid unit queue data.",
                },
            },
        },
    },
}
v2[3] = v5
v1.Sections = v2
return v1