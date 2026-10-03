-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v2.10.0
-- Decompile time: 1.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)

local function imageLabel(a1, a2) -- Line: 7 -- upvalues: ImageCaption (val)
    return function(a1_2, a2_2) -- Line: 8 -- upvalues: ImageCaption (upval), a2 (val), a1 (val)
        return ImageCaption({Transparency = a2_2.Transparency, LayoutOrder = a1_2, Image = a2, Text = a1})
    end
end

local function statLine(a1, a2) -- Line: 18
    return (("<b>%*:</b> %*"):format(a1, a2))
end

local function towerChange(a1, a2, a3) -- Line: 22
    return {
        Type = "ItemChange",
        Props = {Item = {Type = "tower", Name = a1, DisplayName = a2}, Changes = a3},
    }
end

local v1 = {UpdateName = "Pulse Trooper", ImageId = 101648627965318}
local v2 = {}
local v3 = {Name = "Update Log:"}
local v4 = {}
local v5 = {Type = "Log"}
local v6 = {HeaderName = "Pulse Trooper", HeaderSubject = "Introducing Pulse Trooper!"}
local v7 = {}
local u25 = 101648627965318
local u26 = nil
v7[1] = "Pulse Trooper is a short-medium range intermediate tower perfect for cutting through dense crowds of enemies. He fires pulses in a circle, and at higher levels, unlocks the ability to fire a beam in a sweeping motion."
v7[2] = "Our goal for Pulse Trooper is to give players a more specialized tower that excels against large, dense crowds."

v7[3] = function(a1, a2) -- Line: 8 -- upvalues: ImageCaption (val), u25 (val), u26 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u25, Text = u26})
end

v7[4] = "Pulse Trooper can be purchased for 3,250 coins."
v6.Points = v7
v5.Props = v6
v6 = towerChange("Pulse Trooper", nil, {
    {
        Title = "Unlock Details",
        Lines = {
            "<b>Store Cost:</b> 3,250 Coins",
            "<b>Placement Cost:</b> $2,100",
            "<b>Tower Limit:</b> 7",
            "<b>Detection:</b> Lead from Level 2 onward",
        },
    },
    {
        Title = "Level 0 Stats",
        Lines = {
            "<b>Damage:</b> 13",
            "<b>Cooldown:</b> 1.5",
            "<b>Range:</b> 7.5",
            "<b>Max Hits:</b> 1,000",
            "<b>Detection:</b> None",
        },
    },
    {
        Title = "Level 1: Capacitor Boost",
        Lines = {
            "<b>Cost:</b> $700",
            "<b>Damage:</b> 15",
            "<b>Cooldown:</b> 1.2",
            "<b>Range:</b> 7.5",
            "<b>Max Hits:</b> 1,000",
            "<b>Detection:</b> None",
        },
    },
    {
        Title = "Level 2: Pulse Amplifier",
        Lines = {
            "<b>Cost:</b> $3,600",
            "<b>Damage:</b> 25",
            "<b>Cooldown:</b> 1.2",
            "<b>Range:</b> 8.5",
            "<b>Max Hits:</b> 1,000",
            "<b>Detection:</b> Lead",
        },
    },
    {
        Title = "Level 3: Charged Filament",
        Lines = {
            "<b>Cost:</b> $4,900",
            "<b>Damage:</b> 25",
            "<b>Cooldown:</b> 0.55",
            "<b>Range:</b> 8.5",
            "<b>Max Hits:</b> 1,000",
            "<b>Detection:</b> Lead",
        },
    },
    {
        Title = "Level 4: Sweeper",
        Lines = {
            "<b>Cost:</b> $8,500",
            "<b>Damage:</b> 35",
            "<b>Cooldown:</b> 0.55",
            "<b>Range:</b> 9",
            "<b>Max Hits:</b> 1,000",
            "<b>Detection:</b> Lead",
            "<b>Sweeper Damage:</b> 175",
            "<b>Sweeper Duration:</b> 7.5s",
            "<b>Ability Cooldown:</b> 60s",
            "<b>Ability Initial Cooldown:</b> 45s",
        },
    },
    {
        Title = "Level 5: Arc Reactor",
        Lines = {
            "<b>Cost:</b> $17,000",
            "<b>Damage:</b> 50",
            "<b>Cooldown:</b> 0.55",
            "<b>Range:</b> 10",
            "<b>Max Hits:</b> 1,000",
            "<b>Detection:</b> Lead",
            "<b>Sweeper Damage:</b> 300",
            "<b>Sweeper Duration:</b> 6s",
            "<b>Ability Cooldown:</b> 60s",
            "<b>Ability Initial Cooldown:</b> 45s",
        },
    },
})
v4[1] = v5
v4[2] = v6
v4[3] = {
    Type = "Log",
    Props = {
        HeaderName = "Looking Ahead…",
        HeaderSubject = "Next week, we’ll be releasing a handful of skins to welcome the Fall season, alongside a fall themed and decorated lobby.",
        Points = {},
    },
}
v3.Content = v4
v2[1] = v3
v1.Sections = v2
return v1