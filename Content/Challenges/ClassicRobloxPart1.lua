-- Script path: ReplicatedStorage.Content.Challenges.ClassicRobloxPart1
-- Decompile time: 0.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    disabled = true,
    startingCash = 900,
    consumablesDisabled = true,
    title = "Portal to the Past",
    description = "Challenge 1 of the Roblox Classic event. Loadouts are premade, map is Candy Cane Lane, and is 12 waves",
    onServerLoad = function() -- Line: 8 -- upvalues: ServerStorage (val)
        return require(ServerStorage.Server.Services.Game.GlobalModifierService).compose().addModifier("ClassicOof").addModifier("ClassicDeath").complete()
    end,
    WaveCash = function(a1) -- Line: 18
        return math.pow(a1 * 850, 0.99) + 100
    end,
    maps = {"Classic Candy Cane Lane"},
    waveMusic = {"Egg Hunt 2024", [12] = "Grave Buster"},
    enemyReplaceHealthList = {
        Normal = 4,
        Slow = 14,
        Slime = 50,
        Speedy = 4,
        ["Normal Boss"] = 160,
        Breaker = 8,
        Hidden = 12,
        Breaker2 = 15,
        Breaker3 = 75,
        Breaker4 = 140,
        Necromancer = 250,
        ["Slow Boss"] = 800,
        ["Redcliff Traitor"] = 400,
        ["Grave Digger"] = 8000,
    },
    gameModifier = Enum.GameModifier.ClassicRoblox,
    overwriteRewards = {
        Badges = {
            [2691674266315358] = function(a1, a2) -- Line: 51
                return a2
            end,
        },
        BadgeIcons = {[17577567446] = {Label = "Token", BadgeId = 2691674266315358}},
    },
    overrideLoadout = {
        Scout = {Skin = "Default", GoldenPerks = false, Order = 1},
        Sniper = {Skin = "Default", GoldenPerks = false, Order = 2},
        Demoman = {Skin = "Default", GoldenPerks = false, Order = 3},
        Soldier = {Skin = "Default", GoldenPerks = false, Order = 4},
        Paintballer = {Skin = "Default", GoldenPerks = false, Order = 5},
    },
}