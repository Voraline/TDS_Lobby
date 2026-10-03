-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v2.7.0
-- Decompile time: 3.11 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)

local function imageLabel(a1, a2) -- Line: 14 -- upvalues: ImageCaption (val)
    return function(a1_2, a2_2) -- Line: 15 -- upvalues: ImageCaption (upval), a2 (val), a1 (val)
        return ImageCaption({Transparency = a2_2.Transparency, LayoutOrder = a1_2, Image = a2, Text = a1})
    end
end

local function gladiatorSkin(a1) -- Line: 25
    return {Type = "skin", Name = "Gladiator", Skin = a1, Details = a1}
end

local function yellowPoint(a1) -- Line: 34
    return (("<font color=\"rgb(255,255,127)\">• %*</font>"):format(a1))
end

local function statLine(a1, a2) -- Line: 38
    return (("<b>%*:</b> %*"):format(a1, a2))
end

local function itemChange(a1, a2, a3) -- Line: 42
    return {
        Type = "ItemChange",
        Props = {Item = {Type = "tower", Name = a1, DisplayName = a2}, Changes = a3},
    }
end

local v1 = {UpdateName = "Gladiator Rework", ImageId = 130987856808684}
local v2 = {}
local v3 = {Name = "Update Log:"}
local v4 = {}
local v5 = {Type = "Log"}
local v6 = {
    HeaderName = "Gladiator Rework Has Arrived!",
    HeaderSubject = "You asked, and we heard you. Gladiator's rework is out for you all to play and enjoy right now.",
}
local v7 = {}
local u27 = 126931970480527
local u28 = nil
v7[1] = "Gladiator is a melee tower focused on AOE that applies fire, and can also break out of stuns applied to him."
v7[2] = "Our goal with this Gladiator rework was to restore him to his former glory, while bringing him up to speed with our suite of other melee towers."

v7[3] = function(a1, a2) -- Line: 15 -- upvalues: ImageCaption (val), u27 (val), u28 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u27, Text = u28})
end

v7[4] = "In short, we kept everything you loved about him - and made him modern and relevant again."
v6.Points = v7
v5.Props = v6
v6 = itemChange("Gladiator", nil, {
    {
        Title = "Level 0 Stats",
        Lines = {
            "<b>Price:</b> $525",
            "<b>Damage:</b> 5",
            "<b>Cooldown:</b> 0.95",
            "<b>Range:</b> 5.5",
            "<b>Max Hits:</b> 2",
            "<b>Parry Duration:</b> 0.75s",
            "<b>Detection:</b> Hidden",
        },
    },
    {
        Title = "Level 1: Arena Conditioning",
        Lines = {
            "<b>Cost:</b> $375",
            "<b>Damage:</b> 7",
            "<b>Cooldown:</b> 0.8",
            "<b>Range:</b> 5.5",
            "<b>Max Hits:</b> 2",
            "<b>Parry Duration:</b> 0.75s",
            "<b>Detection:</b> Hidden",
        },
    },
    {
        Title = "Level 2: Warrior's Call",
        Lines = {
            "<b>Cost:</b> $1,250",
            "<b>Damage:</b> 17",
            "<b>Cooldown:</b> 0.8",
            "<b>Range:</b> 5.5",
            "<b>Max Hits:</b> 2",
            "<b>Parry Duration:</b> 0.75s",
            "<b>War Cry Attack Speed Buff:</b> +65%",
            "<b>War Cry Duration:</b> 15s",
            "<b>War Cry Cooldown:</b> 30s",
            "<b>War Cry Attack Cooldown:</b> 1.5s",
            "<b>War Cry Range Multiplier:</b> 1.5x",
            "<b>Detection:</b> Hidden",
        },
    },
    {
        Title = "Level 3: Champion's Flame",
        Lines = {
            "<b>Cost:</b> $2,125",
            "<b>Damage:</b> 27",
            "<b>Cooldown:</b> 0.7",
            "<b>Range:</b> 6",
            "<b>Max Hits:</b> 5",
            "<b>Parry Duration:</b> 0.75s",
            "<b>War Cry Attack Speed Buff:</b> +65%",
            "<b>War Cry Duration:</b> 15s",
            "<b>War Cry Cooldown:</b> 30s",
            "<b>War Cry Attack Cooldown:</b> 1.5s",
            "<b>War Cry Range Multiplier:</b> 1.5x",
            "<b>Fire Aspect:</b> Enabled",
            "<b>Fire Aspect Cooldown:</b> 4s",
            "<b>Burn Damage:</b> 2",
            "<b>Burn Tick Rate:</b> 0.3s",
            "<b>Burn Duration:</b> 1.2s",
            "<b>Detection:</b> Hidden and Lead",
        },
    },
    {
        Title = "Level 4: Centurion",
        Lines = {
            "<b>Cost:</b> $6,200",
            "<b>Damage:</b> 57",
            "<b>Cooldown:</b> 0.7",
            "<b>Range:</b> 6",
            "<b>Max Hits:</b> 7",
            "<b>Parry Duration:</b> 0.75s",
            "<b>War Cry Attack Speed Buff:</b> +65%",
            "<b>War Cry Duration:</b> 15s",
            "<b>War Cry Cooldown:</b> 30s",
            "<b>War Cry Attack Cooldown:</b> 1.5s",
            "<b>War Cry Range Multiplier:</b> 1.5x",
            "<b>Fire Aspect:</b> Enabled",
            "<b>Fire Aspect Cooldown:</b> 3s",
            "<b>Burn Damage:</b> 4",
            "<b>Burn Tick Rate:</b> 0.3s",
            "<b>Burn Duration:</b> 1.2s",
            "<b>Detection:</b> Hidden and Lead",
        },
    },
    {
        Title = "Level 5: King of the Arena",
        Lines = {
            "<b>Cost:</b> $14,900",
            "<b>Damage:</b> 77",
            "<b>Cooldown:</b> 0.55",
            "<b>Range:</b> 6.5",
            "<b>Max Hits:</b> 10",
            "<b>Parry Duration:</b> 0.75s",
            "<b>War Cry Attack Speed Buff:</b> +65%",
            "<b>War Cry Duration:</b> 15s",
            "<b>War Cry Cooldown:</b> 30s",
            "<b>War Cry Attack Cooldown:</b> 1.5s",
            "<b>War Cry Range Multiplier:</b> 1.5x",
            "<b>Fire Aspect:</b> Enabled",
            "<b>Fire Aspect Cooldown:</b> 2s",
            "<b>Burn Damage:</b> 7",
            "<b>Burn Tick Rate:</b> 0.15s",
            "<b>Burn Duration:</b> 1.5s",
            "<b>Detection:</b> Hidden and Lead",
        },
    },
})
v7 = {Type = "Log"}
local v8 = {
    HeaderName = "Updated Gladiator Skins",
    HeaderSubject = "Lord Sinister fans, we got you: Pumpkin Gladiator and his other iconic skins have received a major glow-up with this rework.",
}
local v9 = {}
local u128 = 79719408333693
local u129 = nil

v9[1] = function(a1, a2) -- Line: 15 -- upvalues: ImageCaption (val), u128 (val), u129 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u128, Text = u129})
end

v8.Points = v9
v7.Props = v8
v9 = {Type = "Log"}
local v10 = {HeaderName = "Shop Revamp", HeaderSubject = "We're thrilled to release our updated Shop to you all."}
local v11 = {}
local u146 = 107869329795828
local u147 = nil
local u150 = 112662183503937
local u151 = nil
v11[1] = "Our team has been wanting to address the state of shop for quite a while, so we hope you all have a better and easier time navigating through everything we have to offer."

v11[2] = function(a1, a2) -- Line: 15 -- upvalues: ImageCaption (val), u146 (val), u147 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u146, Text = u147})
end

v11[3] = "For countries with restricted loot box rules, crates are now presented with a clear view of which skin you'll get next upon your next crate opening."

v11[4] = function(a1, a2) -- Line: 15 -- upvalues: ImageCaption (val), u150 (val), u151 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u150, Text = u151})
end

v11[5] = "We wanted to simplify the way this information is presented for everyone, and look forward to hearing your thoughts!"
v10.Points = v11
v9.Props = v10
v10 = {Type = "Log"}
v11 = {
    HeaderName = "Looking Ahead:",
    HeaderSubject = "Frost Mode will be getting an update next week, most notably with the long-awaited Frost Champion.",
}
local v12 = {}
local u161 = 71812438355834
local u162 = nil
v12[1] = "Alongside Frost Champion being added, we've also reworked a multitude of existing Frost enemies to help the game mode stand out more from the other survival modes."
v12[2] = "More enemies have a higher emphasis on targeting and attacking your towers."
v12[3] = "The Frost Hero and Frost Necromancer have received new tools to help the Frost Army push."
v12[4] = "We're excited for you all to get your hands on the updated Frost Mode next week."

v12[5] = function(a1, a2) -- Line: 15 -- upvalues: ImageCaption (val), u161 (val), u162 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u161, Text = u162})
end

v11.Points = v12
v10.Props = v11
v4[1] = v5
v4[2] = v6
v4[3] = v7
v4[4] = {
    Type = "Items",
    Props = {
        Minimize = 0.75,
        Items = {
            {Type = "skin", Name = "Gladiator", Skin = "Default", Details = "Default"},
            {Type = "skin", Name = "Gladiator", Skin = "Demon", Details = "Demon"},
            {Type = "skin", Name = "Gladiator", Skin = "Pumpkin", Details = "Pumpkin"},
            {Type = "skin", Name = "Gladiator", Skin = "Vigilante", Details = "Vigilante"},
            {Type = "skin", Name = "Gladiator", Skin = "Beach", Details = "Beach"},
            {Type = "skin", Name = "Gladiator", Skin = "Pirate", Details = "Pirate"},
            {Type = "skin", Name = "Gladiator", Skin = "Galactic", Details = "Galactic"},
            {Type = "skin", Name = "Gladiator", Skin = "Slugger", Details = "Slugger"},
        },
    },
}
v4[5] = v9
v4[6] = v10
v4[7] = {Type = "EventButton", Props = {eventId = "7088623956126728857"}}
v3.Content = v4
v2[1] = v3
v1.Sections = v2
return v1