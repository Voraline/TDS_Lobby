-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v2.6.0
-- Decompile time: 2.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)

local function imageLabel(a1, a2) -- Line: 11 -- upvalues: ImageCaption (val)
    return function(a1_2, a2_2) -- Line: 12 -- upvalues: ImageCaption (upval), a2 (val), a1 (val)
        return ImageCaption({Transparency = a2_2.Transparency, LayoutOrder = a1_2, Image = a2, Text = a1})
    end
end

local function changeLine(a1, a2, a3, a4) -- Line: 22
    return (("<b>%*:</b> <font color=\"%*\">%* -> %*</font>"):format(a1, a4, a2, a3))
end

local function addedLine(a1, a2) -- Line: 26
    return (("<b>%*:</b> <font color=\"rgb(80,255,130)\">Added %*</font>"):format(a1, a2))
end

local function itemChange(a1, a2, a3) -- Line: 30
    return {
        Type = "ItemChange",
        Props = {Item = {Type = "tower", Name = a1, DisplayName = a2}, Changes = a3},
    }
end

local v1 = {UpdateName = "Enforcer Tower", ImageId = 121832347668906}
local v2 = {}
local v3 = {Name = "Update Log:"}
local v4 = {}
local v5 = {Type = "Log"}
local v6 = {HeaderName = "Enforcer Tower", HeaderSubject = "Introducing Enforcer, our next Evolved Tower."}
local v7 = {}
local u27 = 110244659028717
local u28 = nil
local u30 = 71600306756187
local u31 = nil
v7[1] = "Enforcer evolves from Shotgunner into a mid-game tower with a unique skillset. Enforcer is an all-arounder, brandishing a shotgun with a spread, capable of calling vehicles out onto the battlefield, and stunning enemies with a flashbang."
v7[2] = "Enforcer can be purchased for 15,000 coins and 4,750 gems after reaching Shotgunner Level 20."
v7[3] = "Stun your enemies with Flash Bang, charge your enemies by calling in a SWAT Van Support, and rearrange your battlefield with Helicopter Reposition."

v7[4] = function(a1, a2) -- Line: 12 -- upvalues: ImageCaption (val), u27 (val), u28 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u27, Text = u28})
end

v7[5] = function(a1, a2) -- Line: 12 -- upvalues: ImageCaption (val), u30 (val), u31 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u30, Text = u31})
end

v6.Points = v7
v5.Props = v6
v6 = {Type = "Log"}
v7 = {
    HeaderName = "Looking Ahead...",
    HeaderSubject = "Here's a sneak peek of our upcoming reworked Gladiator tower. You'll get your hands on him exactly one week from today.",
}
local v8 = {}
local u36 = 102229613739737
local u37 = nil

v8[1] = function(a1, a2) -- Line: 12 -- upvalues: ImageCaption (val), u36 (val), u37 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u36, Text = u37})
end

v7.Points = v8
v6.Props = v7
v4[1] = v5
v4[2] = v6
v3.Content = v4
v4 = {
    Name = "Balance Changes:",
    Content = {
        {
            Type = "Log",
            Props = {
                HeaderSubject = "Balance changes have been made to Shotgunner, Juggernaut, Kingpin, Medic, and Commander's Gunner APC.",
                Points = {},
            },
        },
        itemChange("Shotgunner", nil, {
            {
                Title = "Level 0-1 Changes",
                Lines = {
                    "<b>Level 0 Price:</b> <font color=\"rgb(255,100,100)\">$1,225 -> $1,500</font>",
                    "<b>Level 0-1 Cooldown:</b> <font color=\"rgb(80,255,130)\">1.2s -> 1.1s</font>",
                    "<b>Level 0-1 Spread:</b> <font color=\"rgb(255,100,100)\">10 -> 5</font>",
                    "<b>Level 1 Cost:</b> <font color=\"rgb(255,100,100)\">$640 -> $750</font>",
                },
            },
            {
                Title = "Level 2-4 Changes",
                Lines = {
                    "<b>Level 2 Cost:</b> <font color=\"rgb(80,255,130)\">$1,550 -> $1,500</font>",
                    "<b>Level 2-3 Pellets:</b> <font color=\"rgb(255,100,100)\">10 -> 9</font>",
                    "<b>Level 2 Spread:</b> <font color=\"rgb(255,100,100)\">15 -> 10</font>",
                    "<b>Level 2-3 Cooldown:</b> <font color=\"rgb(80,255,130)\">0.85s -> 0.8s</font>",
                    "<b>Level 3 Cost:</b> <font color=\"rgb(255,100,100)\">$6,000 -> $6,500</font>",
                    "<b>Level 4 Cost:</b> <font color=\"rgb(255,100,100)\">$18,500 -> $18,777</font>",
                    "<b>Level 4 Cooldown:</b> <font color=\"rgb(255,100,100)\">0.75s -> 0.8s</font>",
                },
            },
        }),
        itemChange("EvolvedJuggernaut", "Juggernaut", {
            {
                Title = "Level 0-3 Changes",
                Lines = {
                    "<b>Level 0 Price:</b> <font color=\"rgb(255,100,100)\">$8,500 -> $10,000</font>",
                    "<b>Level 0 Cooldown:</b> <font color=\"rgb(80,255,130)\">0.15s -> 0.14s</font>",
                    "<b>Level 0 Damage:</b> <font color=\"rgb(80,255,130)\">9 -> 10</font>",
                    "<b>Level 1 Cost:</b> <font color=\"rgb(80,255,130)\">$3,000 -> $2,800</font>",
                    "<b>Level 1 Damage:</b> <font color=\"rgb(80,255,130)\">9 -> 10</font>",
                    "<b>Level 2 Damage:</b> <font color=\"rgb(80,255,130)\">14 -> 15</font>",
                    "<b>Level 3 Damage:</b> <font color=\"rgb(80,255,130)\">28 -> 30</font>",
                },
            },
            {
                Title = "Fortify Path Changes",
                Lines = {
                    "<b>Level 4A Fortify Radius:</b> <font color=\"rgb(80,255,130)\">10 -> 13</font>",
                    "<b>Level 4A Debuff Reduction:</b> <font color=\"rgb(80,255,130)\">25% -> 35%</font>",
                    "<b>Level 5A Cost:</b> <font color=\"rgb(255,100,100)\">$55,000 -> $60,000</font>",
                    "<b>Level 5A Fortify Radius:</b> <font color=\"rgb(80,255,130)\">13 -> 14</font>",
                    "<b>Level 5A Debuff Reduction:</b> <font color=\"rgb(80,255,130)\">25% -> 40%</font>",
                    "<b>Level 6A Cost:</b> <font color=\"rgb(80,255,130)\">$100,000 -> $95,000</font>",
                    "<b>Level 6A Fortify Radius:</b> <font color=\"rgb(80,255,130)\">13 -> 14</font>",
                    "<b>Level 6A Debuff Reduction:</b> <font color=\"rgb(80,255,130)\">30% -> 40%</font>",
                    "<b>Level 7A Fortify Radius:</b> <font color=\"rgb(80,255,130)\">14 -> 16</font>",
                },
            },
            {
                Title = "Experimental Weaponry Path Changes",
                Lines = {
                    "<b>Level 6B Cost:</b> <font color=\"rgb(255,100,100)\">$120,000 -> $130,000</font>",
                    "<b>Level 6B Damage:</b> <font color=\"rgb(80,255,130)\">135 -> 140</font>",
                    "<b>Level 6B Range:</b> <font color=\"rgb(255,100,100)\">28 -> 26</font>",
                    "<b>Level 7B Cost:</b> <font color=\"rgb(80,255,130)\">$250,000 -> $230,000</font>",
                    "<b>Level 7B Damage:</b> <font color=\"rgb(255,100,100)\">180 -> 165</font>",
                    "<b>Level 7B Range:</b> <font color=\"rgb(255,100,100)\">28 -> 26</font>",
                    "<b>Level 7B Boss Damage Multiplier:</b> <font color=\"rgb(80,255,130)\">1.4x -> 1.5x</font>",
                },
            },
        }),
        itemChange("EvolvedKingpin", "Kingpin", {
            {
                Title = "Bounty Changes",
                Lines = {
                    "<b>Bounty Cooldown:</b> <font color=\"rgb(80,255,130)\">150s -> 120s</font>",
                    "<b>Bounty Initial Cooldown:</b> <font color=\"rgb(80,255,130)\">Added 40s</font>",
                    "<b>Level 4A Cash Reward:</b> <font color=\"rgb(80,255,130)\">50% -> 60%</font>",
                    "<b>Level 5A Cash Reward:</b> <font color=\"rgb(80,255,130)\">70% -> 80%</font>",
                    "<b>Level 6A Reward Cap:</b> <font color=\"rgb(255,100,100)\">$60,000 -> $50,000</font>",
                },
            },
            {
                Title = "Unit Changes",
                Lines = {
                    "<b>Bouncer Health:</b> <font color=\"rgb(255,100,100)\">550 -> 500</font>",
                    "<b>Level 3 Lackey Damage:</b> <font color=\"rgb(255,100,100)\">8 -> 7</font>",
                    "<b>Level 3 Lackey Range:</b> <font color=\"rgb(255,100,100)\">27 -> 25</font>",
                    "<b>Contractor Health:</b> <font color=\"rgb(80,255,130)\">200 -> 400</font>",
                    "<b>Contractor Damage:</b> <font color=\"rgb(80,255,130)\">165 -> 170</font>",
                    "<b>Contractor Lifespan:</b> <font color=\"rgb(80,255,130)\">70s -> 75s</font>",
                },
            },
        }),
        (itemChange("Medic", nil, {
            {
                Title = "Ubercharge and Cost Changes",
                Lines = {
                    "<b>Level 3 Cost:</b> <font color=\"rgb(80,255,130)\">$2,950 -> $2,400</font>",
                    "<b>Level 3 Ubercharge Duration:</b> <font color=\"rgb(255,100,100)\">10s -> 7.5s</font>",
                    "<b>Level 4 Cost:</b> <font color=\"rgb(80,255,130)\">$6,000 -> $5,000</font>",
                    "<b>Level 4 Ubercharge Duration:</b> <font color=\"rgb(255,100,100)\">12.5s -> 10s</font>",
                    "<b>Level 5 Cost:</b> <font color=\"rgb(80,255,130)\">$14,000 -> $12,000</font>",
                    "<b>Level 5 Ubercharge Duration:</b> <font color=\"rgb(255,100,100)\">15s -> 10s</font>",
                },
            },
        })),
    },
}
v2[1] = v3
v2[2] = v4
v1.Sections = v2
return v1