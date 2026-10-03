-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v2.11.0
-- Decompile time: 4.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)

local function imageLabel(a1, a2) -- Line: 9 -- upvalues: ImageCaption (val)
    return function(a1_2, a2_2) -- Line: 10 -- upvalues: ImageCaption (upval), a2 (val), a1 (val)
        return ImageCaption({Transparency = a2_2.Transparency, LayoutOrder = a1_2, Image = a2, Text = a1})
    end
end

local function statLine(a1, a2) -- Line: 20
    return (("<b>%*:</b> %*"):format(a1, a2))
end

local function changeLine(a1, a2, a3, a4) -- Line: 24
    return (("<b>%*:</b> <font color=\"%*\">%* -> %*</font>"):format(a1, a4, a2, a3))
end

local function addedLine(a1, a2) -- Line: 28
    return (("<b>%*:</b> <font color=\"rgb(80,255,130)\">Added %*</font>"):format(a1, a2))
end

local function removedLine(a1, a2) -- Line: 32
    return (("<b>%*:</b> <font color=\"rgb(255,100,100)\">%* -> Removed</font>"):format(a1, a2))
end

local function itemChange(a1, a2, a3, a4) -- Line: 36
    return {
        Type = "ItemChange",
        Props = {Item = {Type = a1, Name = a2, DisplayName = a3}, Changes = a4},
    }
end

local function towerChange(a1, a2, a3) -- Line: 50 -- upvalues: itemChange (val)
    return (itemChange("tower", a1, a2, a3))
end

local function consumableChange(a1, a2, a3) -- Line: 54 -- upvalues: itemChange (val)
    return (itemChange("consumable", a1, a2, a3))
end

local v1 = {UpdateName = "Fall Lobby and Skin Drop", ImageId = 87035877017746}
local v2 = {}
local v3 = {Name = "Update Log:"}
local v4 = {}
local v5 = {Type = "Log"}
local v6 = {HeaderName = "Fall Lobby and Skin Drop", HeaderSubject = "Fall Info... Fall?"}
local v7 = {}
local u29 = 78767534837426
local u30 = nil
local u33 = 80339127163878
local u34 = nil
v7[1] = "Summer is finally over! It's getting colder, and the leaves are changing… so did our lobby! Enjoy a new Fall-themed lobby to welcome the season."

v7[2] = function(a1, a2) -- Line: 10 -- upvalues: ImageCaption (val), u29 (val), u30 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u29, Text = u30})
end

v7[3] = "In addition, we've introduced four Fall-themed skins. Black Cat Electroshocker,  Most Wanted Cowboy, Pumpkin Assassin and Dragon Warlock are available now in the Premium Crate."

v7[4] = function(a1, a2) -- Line: 10 -- upvalues: ImageCaption (val), u33 (val), u34 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u33, Text = u34})
end

v6.Points = v7
v5.Props = v6
v6 = {Type = "Log"}
v7 = {
    HeaderName = "Looking Ahead…",
    HeaderSubject = "Admin Abuse on Sept. 25th and Oct 2nd at our usual update time.",
}
local v8 = {}
local u40 = 88404445965812
local u41 = nil
v8[1] = "We'll be reintroducing our Admin Abuse event for September 25th and October 2nd. Sign up so you don't miss once it begins."

v8[2] = function(a1, a2) -- Line: 10 -- upvalues: ImageCaption (val), u40 (val), u41 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u40, Text = u41})
end

v7.Points = v8
v6.Props = v7
v4[1] = v5
v4[2] = v6
v4[3] = {Type = "EventButton", Props = {eventId = "8441692320402899596"}}
v3.Content = v4
v5 = {
    Name = "Balance Changes:",
    Content = {
        {
            Type = "Log",
            Props = {
                HeaderSubject = "Balance changes have been made to Elf Camp, Tesla, Mortar, Pulse Trooper, Molten Monster, and several consumables.",
                Points = {},
            },
        },
        itemChange("tower", "Elf Camp", nil, {
            {
                Title = "General and Basic Elf Changes",
                Lines = {
                    "<b>Tower Limit:</b> <font color=\"rgb(80,255,130)\">2 -> 4</font>",
                    "<b>Basic Elf Spawn Time:</b> <font color=\"rgb(80,255,130)\">15s -> 10s</font>",
                    "<b>Basic Elf Unit Limit:</b> <font color=\"rgb(80,255,130)\">Added 30</font>",
                    "<b>Basic Elf Health:</b> <font color=\"rgb(255,100,100)\">16 -> 15</font>",
                    "<b>Basic Elf Speed:</b> <font color=\"rgb(80,255,130)\">6 -> 8</font>",
                },
            },
            {
                Title = "Level 1: Snowball Elf Changes",
                Lines = {
                    "<b>Upgrade Cost:</b> <font color=\"rgb(255,100,100)\">$350 -> $750</font>",
                    "<b>Spawn Time:</b> <font color=\"rgb(80,255,130)\">20s -> 10s</font>",
                    "<b>Unit Limit:</b> <font color=\"rgb(80,255,130)\">4 -> 30</font>",
                    "<b>Health:</b> <font color=\"rgb(255,100,100)\">20 -> 15</font>",
                    "<b>Damage:</b> <font color=\"rgb(255,100,100)\">5 -> 4</font>",
                    "<b>Range:</b> <font color=\"rgb(255,100,100)\">18 -> 17</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">2.5s -> 2s</font>",
                },
            },
            {
                Title = "Level 2: Bomber and Cannoneer Elf Changes",
                Lines = {
                    "<b>Upgrade Cost:</b> <font color=\"rgb(255,100,100)\">$1,800 -> $2,022</font>",
                    "<b>Bomber Spawn Time:</b> <font color=\"rgb(80,255,130)\">25s -> 8s</font>",
                    "<b>Bomber Health:</b> <font color=\"rgb(255,100,100)\">22 -> 5</font>",
                    "<b>Bomber Speed:</b> <font color=\"rgb(80,255,130)\">6.35 -> 12</font>",
                    "<b>Bomber Range:</b> <font color=\"rgb(80,255,130)\">2.5 -> 3</font>",
                    "<b>Bomber Damage:</b> <font color=\"rgb(255,100,100)\">60 -> 45</font>",
                    "<b>Bomber Explosion Radius:</b> <font color=\"rgb(255,100,100)\">8 -> 5</font>",
                    "<b>Bomber Explosion:</b> Now deals consistent damage across the blast",
                    "<b>Cannoneer Spawn Time:</b> <font color=\"rgb(80,255,130)\">25s -> 12s</font>",
                    "<b>Cannoneer Unit Limit:</b> <font color=\"rgb(80,255,130)\">4 -> 30</font>",
                    "<b>Cannoneer Health:</b> <font color=\"rgb(255,100,100)\">30 -> 20</font>",
                    "<b>Cannoneer Damage:</b> <font color=\"rgb(255,100,100)\">5 -> 4</font>",
                    "<b>Cannoneer Range:</b> <font color=\"rgb(255,100,100)\">22 -> 18</font>",
                },
            },
            {
                Title = "Level 3: Guardian and Gunner Elf Changes",
                Lines = {
                    "<b>Guardian Spawn Time:</b> <font color=\"rgb(80,255,130)\">20s -> 10s</font>",
                    "<b>Guardian Unit Limit:</b> <font color=\"rgb(80,255,130)\">4 -> 30</font>",
                    "<b>Guardian Health:</b> <font color=\"rgb(255,100,100)\">75 -> 50</font>",
                    "<b>Guardian Speed:</b> <font color=\"rgb(80,255,130)\">6.25 -> 8</font>",
                    "<b>Guardian Damage:</b> <font color=\"rgb(255,100,100)\">27 -> 18</font>",
                    "<b>Guardian Range:</b> <font color=\"rgb(255,100,100)\">7.5 -> 7</font>",
                    "<b>Guardian Defense:</b> <font color=\"rgb(255,100,100)\">30 -> 0</font>",
                    "<b>Gunner Spawn Time:</b> <font color=\"rgb(80,255,130)\">30s -> 25s</font>",
                    "<b>Gunner Unit Limit:</b> <font color=\"rgb(80,255,130)\">4 -> 30</font>",
                    "<b>Gunner Health:</b> <font color=\"rgb(255,100,100)\">40 -> 25</font>",
                    "<b>Gunner Cooldown:</b> <font color=\"rgb(255,100,100)\">0.2s -> 0.4s</font>",
                    "<b>Gunner Burst Count:</b> <font color=\"rgb(255,100,100)\">6 -> 5</font>",
                    "<b>Gunner Burst Cooldown:</b> <font color=\"rgb(255,100,100)\">0.8s -> 1s</font>",
                },
            },
            {
                Title = "Level 4: Upgraded Elf Changes",
                Lines = {
                    "<b>Upgrade Cost:</b> <font color=\"rgb(255,100,100)\">$10,750 -> $12,012</font>",
                    "<b>Guardian Health:</b> <font color=\"rgb(255,100,100)\">100 -> 75</font>",
                    "<b>Guardian Damage:</b> <font color=\"rgb(255,100,100)\">40 -> 28</font>",
                    "<b>Guardian Defense:</b> <font color=\"rgb(255,100,100)\">50 -> 30</font>",
                    "<b>Gunner Health:</b> <font color=\"rgb(255,100,100)\">50 -> 25</font>",
                    "<b>Gunner Damage:</b> <font color=\"rgb(255,100,100)\">6 -> 4</font>",
                    "<b>Gunner Cooldown:</b> <font color=\"rgb(255,100,100)\">0.2s -> 0.35s</font>",
                    "<b>Gunner Range:</b> <font color=\"rgb(255,100,100)\">25 -> 22</font>",
                    "<b>Gunner Detection:</b> <font color=\"rgb(255,100,100)\">Flying -> Removed</font>",
                },
            },
            {
                Title = "Level 4: Ripped and Gift Bomber Elf Changes",
                Lines = {
                    "<b>Ripped Elf Spawn Time:</b> <font color=\"rgb(255,100,100)\">80s -> 100s</font>",
                    "<b>Ripped Elf Unit Limit:</b> <font color=\"rgb(80,255,130)\">1 -> 3</font>",
                    "<b>Ripped Elf Health:</b> <font color=\"rgb(80,255,130)\">800 -> 1,000</font>",
                    "<b>Ripped Elf Damage:</b> <font color=\"rgb(80,255,130)\">360 -> 375</font>",
                    "<b>Ripped Elf Range:</b> <font color=\"rgb(80,255,130)\">40 -> 60</font>",
                    "<b>Ripped Elf Cooldown:</b> <font color=\"rgb(255,100,100)\">6.7s -> 7s</font>",
                    "<b>Ripped Elf Explosion Radius:</b> <font color=\"rgb(255,100,100)\">12 -> 4</font>",
                    "<b>Ripped Elf Explosion:</b> Now deals consistent damage across the blast",
                    "<b>Gift Bomber Unit Limit:</b> <font color=\"rgb(80,255,130)\">2 -> 30</font>",
                    "<b>Gift Bomber Damage:</b> <font color=\"rgb(255,100,100)\">148 -> 60</font>",
                    "<b>Gift Bomber Range:</b> <font color=\"rgb(80,255,130)\">14 -> 25</font>",
                    "<b>Gift Bomber Explosion Radius:</b> <font color=\"rgb(255,100,100)\">6 -> 4.5</font>",
                    "<b>Gift Bomber Explosion:</b> Now deals consistent damage across the blast",
                },
            },
        }),
        itemChange("tower", "Tesla", nil, {
            {
                Title = "Level 0 Changes",
                Lines = {
                    "<b>Placement Price:</b> <font color=\"rgb(255,100,100)\">$2,000 -> $5,750</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">15 -> 55</font>",
                    "<b>Shock Stun:</b> <font color=\"rgb(80,255,130)\">0.15s -> 0.3s</font>",
                    "<b>Max Hits:</b> <font color=\"rgb(255,100,100)\">3 -> 2</font>",
                },
            },
            {
                Title = "Level 1 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$1,856 -> $4,314</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">20 -> 70</font>",
                    "<b>Shock Stun:</b> <font color=\"rgb(80,255,130)\">0.25s -> 0.45s</font>",
                    "<b>Max Hits:</b> <font color=\"rgb(255,100,100)\">5 -> 3</font>",
                },
            },
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$8,888 -> $10,007</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">20 -> 70</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">1.8s -> 1.6s</font>",
                    "<b>Max Hits:</b> <font color=\"rgb(255,100,100)\">5 -> 3</font>",
                    "<b>Smite Damage:</b> <font color=\"rgb(80,255,130)\">70 -> 200</font>",
                    "<b>Smite Meter:</b> <font color=\"rgb(255,100,100)\">5 -> 9</font>",
                    "<b>Smite Explosion:</b> Now deals consistent damage across the blast",
                },
            },
            {
                Title = "Level 3 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$18,450 -> $24,000</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">20 -> 90</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">1.4s -> 1.6s</font>",
                    "<b>Range:</b> <font color=\"rgb(80,255,130)\">18.5 -> 20</font>",
                    "<b>Shock Stun:</b> <font color=\"rgb(80,255,130)\">0.25s -> 0.6s</font>",
                    "<b>Max Hits:</b> <font color=\"rgb(255,100,100)\">6 -> 3</font>",
                    "<b>Smite Damage:</b> <font color=\"rgb(80,255,130)\">85 -> 475</font>",
                    "<b>Smite Meter:</b> <font color=\"rgb(255,100,100)\">4 -> 12</font>",
                },
            },
            {
                Title = "Level 4 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(255,100,100)\">$44,001 -> $55,000</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">20 -> 125</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">1.2s -> 1.4s</font>",
                    "<b>Shock Stun:</b> <font color=\"rgb(80,255,130)\">0.3s -> 0.85s</font>",
                    "<b>Max Hits:</b> <font color=\"rgb(255,100,100)\">8 -> 3</font>",
                    "<b>Smite Damage:</b> <font color=\"rgb(80,255,130)\">140 -> 650</font>",
                    "<b>Smite Radius:</b> <font color=\"rgb(80,255,130)\">7 -> 7.5</font>",
                    "<b>Smite Meter:</b> <font color=\"rgb(255,100,100)\">3 -> 15</font>",
                },
            },
        }),
        itemChange("tower", "Mortar", nil, {
            {
                Title = "Placement Changes",
                Lines = {"<b>Boundary Size:</b> <font color=\"rgb(80,255,130)\">1.75 -> 1.5</font>"},
            },
        }),
        itemChange("tower", "Pulse Trooper", nil, {
            {
                Title = "Sweeper Changes",
                Lines = {"<b>Initial Cooldown:</b> <font color=\"rgb(80,255,130)\">45s -> 30s</font>"},
            },
        }),
        itemChange("consumable", "Molten Monster", nil, {
            {
                Title = "Unit Changes",
                Lines = {
                    "<b>Health:</b> <font color=\"rgb(80,255,130)\">20,000 -> 25,000</font>",
                    "<b>Defense:</b> <font color=\"rgb(80,255,130)\">150 -> 200</font>",
                    "<b>Burn Duration:</b> <font color=\"rgb(255,100,100)\">5s -> 2.5s</font>",
                    "<b>Burn Tick Rate:</b> <font color=\"rgb(80,255,130)\">1s -> 0.5s</font>",
                },
            },
        }),
        itemChange("consumable", "AirStrike", "Air-Strike", {
            {
                Title = "General Changes",
                Lines = {
                    "<b>Bomb Damage:</b> <font color=\"rgb(80,255,130)\">200 -> 400</font>",
                    "<b>Max Uses:</b> <font color=\"rgb(80,255,130)\">3 -> 4</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">45s -> 30s</font>",
                },
            },
        }),
        itemChange("consumable", "Barricade", nil, {
            {
                Title = "General Changes",
                Lines = {"<b>Health:</b> <font color=\"rgb(80,255,130)\">200 -> 300</font>"},
            },
        }),
        itemChange("consumable", "Blizzard Bomb", nil, {
            {
                Title = "General Changes",
                Lines = {
                    "<b>Duration:</b> <font color=\"rgb(80,255,130)\">20s -> 30s</font>",
                    "<b>Freeze Tick Rate:</b> <font color=\"rgb(80,255,130)\">0.5s -> 0.25s</font>",
                    "<b>Max Uses:</b> <font color=\"rgb(80,255,130)\">3 -> 5</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(80,255,130)\">45s -> 20s</font>",
                },
            },
        }),
        itemChange("consumable", "Molotov", nil, {
            {
                Title = "General Changes",
                Lines = {
                    "<b>Flame Size:</b> <font color=\"rgb(80,255,130)\">4 -> 6.5</font>",
                    "<b>Burn Damage:</b> <font color=\"rgb(80,255,130)\">8 -> 10</font>",
                },
            },
        }),
        itemChange("consumable", "Nuke", nil, {
            {
                Title = "General Changes",
                Lines = {
                    "<b>Detonation Time:</b> <font color=\"rgb(80,255,130)\">5s -> 2s</font>",
                    "<b>Fallout Duration:</b> <font color=\"rgb(80,255,130)\">10s -> 25s</font>",
                    "<b>Fallout Tick Rate:</b> <font color=\"rgb(255,100,100)\">0.5s -> 1s</font>",
                },
            },
        }),
        itemChange("consumable", "Sandcastle", "Sandcastle Barricade", {
            {
                Title = "General Changes",
                Lines = {
                    "<b>Health:</b> <font color=\"rgb(80,255,130)\">300 -> 1,000</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">10s -> 60s</font>",
                    "<b>Damage Tick Rate:</b> <font color=\"rgb(80,255,130)\">1.5s -> 1s</font>",
                    "<b>Crab Health:</b> <font color=\"rgb(80,255,130)\">15 -> 25</font>",
                },
            },
        }),
        itemChange("consumable", "Sugar Rush", nil, {
            {
                Title = "General Changes",
                Lines = {
                    "<b>Fire Rate Boost:</b> <font color=\"rgb(80,255,130)\">40% -> 60%</font>",
                    "<b>Max Uses:</b> <font color=\"rgb(255,100,100)\">5 -> 3</font>",
                },
            },
        }),
        (itemChange("consumable", "Turkey Leg", nil, {
            {
                Title = "General Changes",
                Lines = {
                    "<b>Healing:</b> <font color=\"rgb(80,255,130)\">15 -> 100</font>",
                    "<b>Max Uses:</b> <font color=\"rgb(255,100,100)\">6 -> 4</font>",
                    "<b>Cooldown:</b> <font color=\"rgb(255,100,100)\">10s -> 60s</font>",
                },
            },
        })),
    },
}
v2[1] = v3
v2[2] = {
    Name = "Bug Fixes and Changes:",
    Content = {
        {
            Type = "Log",
            Props = {
                Points = {
                    "Fixed range values for Pulse Trooper",
                    "Fixed Pulse Trooper's Sweeper ability hit detection",
                },
            },
        },
    },
}
v2[3] = v5
v1.Sections = v2
return v1