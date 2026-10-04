-- Script path: ReplicatedStorage.Shared.Modules.PVPConstants.PVPSeasons
-- Decompile time: 2.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Timezone = require(ReplicatedStorage.Shared.Modules.Timezone)
return {
    Release = {
        name = "Season 0",
        startsAt = Timezone("EST")(DateTime.fromUniversalTime(2025, 7, 23)),
        endsAt = Timezone("EST")(DateTime.fromUniversalTime(2025, 10, 22)),
        rewards = {
            [Enum.Rank.PrivateI] = {{Type = "Tag", Value = {"Woodland"}}, {Type = "Crate", Value = {"Low Grade", 3}}},
            [Enum.Rank.PrivateII] = {{Type = "Currency", Value = {"Coins", 150}}},
            [Enum.Rank.PrivateIII] = {{Type = "Currency", Value = {"Experience", 200}}, {Type = "Sticker", Value = {"GLHF"}}},
            [Enum.Rank.SergeantI] = {{Type = "Tag", Value = {"Tan Camo"}}, {Type = "Crate", Value = {"Low Grade", 3}}},
            [Enum.Rank.SergeantII] = {
                {Type = "Currency", Value = {"Coins", 200}},
                {Type = "Currency", Value = {"Experience", 300}},
                {Type = "Sticker", Value = {"Stay Cool"}},
            },
            [Enum.Rank.SergeantIII] = {{Type = "Totem", Value = {"Trophy"}}, {Type = "Emote", Value = {"Kudos"}}},
            [Enum.Rank.LieutenantI] = {{Type = "Tag", Value = {"Arctic Camo"}}, {Type = "Crate", Value = {"Mid Grade", 3}}},
            [Enum.Rank.LieutenantII] = {
                {Type = "Currency", Value = {"Coins", 300}},
                {Type = "Currency", Value = {"Experience", 400}},
                {Type = "Sticker", Value = {"Molten Rage"}},
            },
            [Enum.Rank.LieutenantIII] = {{Type = "Tag", Value = {"Team Fury"}}, {Type = "Totem", Value = {"Champion Templar"}}},
            [Enum.Rank.MajorI] = {{Type = "Tag", Value = {"Navy Camo"}}, {Type = "Crate", Value = {"High Grade", 2}}},
            [Enum.Rank.MajorII] = {
                {Type = "Currency", Value = {"Coins", 400}},
                {Type = "Currency", Value = {"Experience", 500}},
                {Type = "Sticker", Value = {"Despair"}},
            },
            [Enum.Rank.MajorIII] = {
                {Type = "Totem", Value = {"Accelerator Champion"}},
                {Type = "Emote", Value = {"Victory's Kiss"}},
            },
            [Enum.Rank.GeneralI] = {{Type = "Tag", Value = {"Crimson Camo"}}, {Type = "Crate", Value = {"High Grade", 3}}},
            [Enum.Rank.GeneralII] = {
                {Type = "Currency", Value = {"Coins", 500}},
                {Type = "Currency", Value = {"Experience", 600}},
                {Type = "Sticker", Value = {"LET'S GOOO"}},
            },
            [Enum.Rank.GeneralIII] = {
                {Type = "Skin", Value = {"Accelerator", "Champion"}},
                {Type = "Emote", Value = {"Ascended"}},
            },
        },
    },
}