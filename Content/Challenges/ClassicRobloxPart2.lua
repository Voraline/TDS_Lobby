-- Script path: ReplicatedStorage.Content.Challenges.ClassicRobloxPart2
-- Decompile time: 5.02 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    disabled = true,
    startingCash = 900,
    consumablesDisabled = true,
    title = "Return of the Korblox",
    description = "Challenge 2 of the Roblox Classic event. Loadouts are premade, map is Winter, and is 12 waves",
    onServerLoad = function() -- Line: 8 -- upvalues: ServerStorage (val)
        return require(ServerStorage.Server.Services.Game.GlobalModifierService).compose().addModifier("ClassicOof").addModifier("ClassicDeath").complete()
    end,
    waveCash = function(a1) -- Line: 18
        return math.pow(a1 * 950, 0.99) + 100
    end,
    maps = {"Classic Winter"},
    gameModifier = Enum.GameModifier.ClassicRoblox,
    waveMusic = {"Egg Hunt 2024", [12] = "Legacy Fallen King"},
    enemyReplaceList = {
        Normal = "Korblox Seeker",
        Slow = "Korblox Undead",
        Speedy = "Korblox Guard",
        ["Normal Boss"] = "Korblox Warrior",
        Hidden = "Korblox Soul",
        ["Slow Boss"] = "Korblox General",
        ["Grave Digger"] = "Korblox Deathwalker",
    },
    enemyReplaceHealthList = {
        ["Korblox Seeker"] = 5,
        ["Korblox Undead"] = 15,
        ["Korblox Soul"] = 12,
        ["Korblox Guard"] = 8,
        ["Korblox Warrior"] = 200,
        ["Korblox General"] = 2000,
        Breaker = 10,
        Breaker2 = 20,
        Breaker3 = 75,
        Breaker4 = 200,
        Necromancer = 400,
        ["Redcliff Traitor"] = 800,
        ["Korblox Deathwalker"] = 20000,
        Slime = 50,
    },
    overrideLoadout = {
        Sniper = {Skin = "Default", GoldenPerks = false, Order = 5},
        Freezer = {Skin = "Default", GoldenPerks = false, Order = 3},
        Militant = {Skin = "Default", GoldenPerks = false, Order = 2},
        ["Crook Boss"] = {Skin = "Default", GoldenPerks = false, Order = 4},
        ["Military Base"] = {Skin = "Default", GoldenPerks = false, Order = 1},
    },
    overwriteRewards = {
        Badges = {
            [1063435789072084] = function(a1, a2) -- Line: 67
                return a2
            end,
        },
        BadgeIcons = {[17577567446] = {Label = "Token", BadgeId = 1063435789072084}},
    },
    waveEnemiesOverride = {
        {{Name = "Normal", Amount = 7, Delay = 0.6}, {Name = "Speedy", Amount = 2, Delay = 2.5}},
        {
            {Name = "Normal", Amount = 10, Delay = 0.8},
            {Name = "Slow", Amount = 6, Delay = 0.6},
            {Name = "Speedy", Amount = 4, Delay = 1.8},
        },
        {
            {Name = "Speedy", Amount = 3, Delay = 0.2},
            {Name = "Normal", Amount = 12, Delay = 0.6, Time = 1.2},
            {Name = "Speedy", Amount = 3, Delay = 0.2},
            {Name = "Slow", Amount = 8, Delay = 0.6, Time = 1.2},
            {Name = "Speedy", Amount = 3, Delay = 0.2},
            {Name = "Hidden", Amount = 3, Delay = 1},
        },
        {
            {Name = "Hidden", Amount = 4, Delay = 0.4},
            {Name = "Normal Boss", Amount = 3, Delay = 6, Time = 1},
            {Name = "Hidden", Amount = 4, Delay = 0.4},
            {Name = "Slow", Amount = 15, Delay = 0.6, Time = 7.2},
            {Name = "Hidden", Amount = 4, Delay = 0.4},
        },
        {
            {Name = "Normal", Amount = 45, Delay = 0.7, Time = 0.7},
            {Name = "Slow", Amount = 25, Delay = 1.2, Time = 1.2},
            {Name = "Hidden", Amount = 5, Delay = 0.1},
            {Name = "Normal Boss", Amount = 1, Delay = 1.2},
            {Name = "Hidden", Amount = 5, Delay = 0.1},
            {Name = "Normal Boss", Amount = 1, Delay = 1},
            {Name = "Hidden", Amount = 5, Delay = 0.1},
            {
                Name = "Normal Boss",
                Amount = 1,
                Delay = 1,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
        },
        {
            {Name = "Normal Boss", Amount = 4, Delay = 1.5, Time = 1},
            {Name = "Normal", Amount = 35, Delay = 0.8, Time = 2.5},
            {Name = "Normal Boss", Amount = 1, Delay = 0.8},
            {Name = "Hidden", Amount = 20, Delay = 0.4},
            {Name = "Speedy", Amount = 5, Delay = 2},
        },
        {
            {Name = "Normal Boss", Amount = 1, Delay = 2},
            {Name = "Breaker2", Amount = 25, Delay = 1, Time = 2},
            {Name = "Normal Boss", Amount = 5, Delay = 2, Time = 2},
            {
                Name = "Hidden",
                Amount = 10,
                Delay = 1.5,
                Time = 2,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {Name = "Redcliff Traitor", Amount = 1, Delay = 0.8},
        },
        {
            {
                Name = "Normal Boss",
                Amount = 5,
                Delay = 2.5,
                Time = 1,
                Modifiers = {[Enum.Modifier.Slime] = true, [Enum.Modifier.Nimble] = true},
            },
            {Name = "Redcliff Traitor", Amount = 1, Delay = 0.8},
            {
                Name = "Normal",
                Amount = 25,
                Delay = 1.25,
                Time = 1.25,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Slow",
                Amount = 40,
                Delay = 0.5,
                Time = 1.5,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {Name = "Redcliff Traitor", Amount = 1, Delay = 0.8},
            {Name = "Necromancer", Amount = 4, Delay = 0.5},
        },
        {
            {Name = "Slow Boss", Amount = 1, Delay = 0.5},
            {
                Name = "Normal",
                Amount = 60,
                Delay = 0.8,
                Time = 2.4,
                Modifiers = {[Enum.Modifier.Tank] = true, [Enum.Modifier.Slime] = true},
            },
            {
                Name = "Redcliff Traitor",
                Amount = 1,
                Delay = 0.8,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Normal Boss",
                Amount = 2,
                Delay = 1.5,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {Name = "Necromancer", Amount = 2, Delay = 0.8},
            {
                Name = "Normal Boss",
                Amount = 2,
                Delay = 1.5,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Redcliff Traitor",
                Amount = 1,
                Delay = 0.8,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {Name = "Necromancer", Amount = 2, Delay = 0.8},
            {
                Name = "Redcliff Traitor",
                Amount = 1,
                Delay = 0.8,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
        },
        {
            {Name = "Breaker4", Amount = 6, Delay = 1.5, Time = 1.5},
            {Name = "Slow Boss", Amount = 1, Delay = 0.5},
            {
                Name = "Normal Boss",
                Amount = 4,
                Delay = 0.9,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {Name = "Necromancer", Amount = 2, Delay = 2},
            {
                Name = "Redcliff Traitor",
                Amount = 1,
                Delay = 0.8,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {Name = "Slow Boss", Amount = 1, Delay = 0.5},
            {
                Name = "Hidden",
                Amount = 25,
                Delay = 1.2,
                Time = 2.4,
                Modifiers = {[Enum.Modifier.Nimble] = true, [Enum.Modifier.Slime] = true},
            },
            {
                Name = "Redcliff Traitor",
                Amount = 1,
                Delay = 0.8,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
        },
        {
            {Name = "Breaker2", Amount = 45, Delay = 0.8, Time = 1.6},
            {Name = "Slow Boss", Amount = 2, Delay = 2, Time = 1},
            {Name = "Breaker4", Amount = 3, Delay = 0.8, Time = 1},
            {
                Name = "Normal Boss",
                Amount = 4,
                Delay = 0.8,
                Time = 0.8,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Redcliff Traitor",
                Amount = 1,
                Delay = 1,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {Name = "Slow Boss", Amount = 2, Delay = 2, Time = 1},
            {Name = "Breaker4", Amount = 3, Delay = 0.8, Time = 1},
            {
                Name = "Normal Boss",
                Amount = 4,
                Delay = 0.8,
                Time = 0.8,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Redcliff Traitor",
                Amount = 1,
                Delay = 1,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {Name = "Necromancer", Amount = 3, Delay = 2},
        },
        {
            {
                Name = "Redcliff Traitor",
                Amount = 1,
                Delay = 1,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Slow",
                Amount = 40,
                Delay = 0.8,
                Time = 1.6,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Hidden",
                Amount = 25,
                Delay = 1.6,
                Time = 3.2,
                Modifiers = {[Enum.Modifier.Slime] = true, [Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Normal Boss",
                Amount = 7,
                Delay = 1,
                Time = 1,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {Name = "Slow Boss", Amount = 3, Delay = 4, Time = 1},
            {Name = "Necromancer", Amount = 5, Delay = 2.5, Time = 1.6},
            {
                Name = "Redcliff Traitor",
                Amount = 1,
                Delay = 1,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Korblox Deathwalker",
                Amount = 1,
                Delay = 0.8,
                Modifiers = {[Enum.Modifier.Boss] = true},
            },
        },
    },
    dialogue = {
        {
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "I must say I'm suprised to see you here.",
            },
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "I thought you'd never make it out of the last map.",
                Wait = 5,
            },
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "Not to worry thou, it just gives us more time to get acquianted.",
            },
        },
        [3] = {
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "Also don't worry about your commander, he's been taken into the portal with me.",
                Wait = 5,
            },
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "Me and my minions will make sure he has a cozy stay on the other side.",
            },
        },
        [5] = {
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "This map is cold, just like the legions of Korblox I control.",
                Wait = 5,
            },
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "I'm sure this experience has been quite ... CHILLING for you!",
            },
        },
        [7] = {
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "Still hanging in there? I'm impressed!",
                Wait = 5,
            },
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "Perhaps you are of passing skill after all. But don't get too comfortable!",
            },
        },
        [10] = {
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "Up until now I've just been going easy on you.",
                Wait = 5,
            },
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "But now I think its time we end this charade. Prepare yourself!",
            },
        },
        [12] = {
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "Lets see how you fare against the Korblox Deathwalker!",
                Wait = 5,
            },
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "Fun fact, we were actually roommates in college!",
            },
        },
    },
}