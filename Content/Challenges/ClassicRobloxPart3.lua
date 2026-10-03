-- Script path: ReplicatedStorage.Content.Challenges.ClassicRobloxPart3
-- Decompile time: 4.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    disabled = true,
    startingCash = 1300,
    consumablesDisabled = true,
    title = "Clash at the Forest Camp",
    description = "Challenge 3 of the Roblox Classic event. Loadouts are premade, map is Forest Camp, and is 12 waves",
    onServerLoad = function() -- Line: 8 -- upvalues: ServerStorage (val)
        return require(ServerStorage.Server.Services.Game.GlobalModifierService).compose().addModifier("ClassicOof").addModifier("ClassicDeath").complete()
    end,
    waveCash = function(a1) -- Line: 18
        local v1 = math.pow(a1 * 1150, 0.98) + 100
        if a1 < 11 then
            return math.pow(a1 * 1150, 0.98) + 100
        end
        if a1 == 11 then
            v1 = 15000
        end
        return v1
    end,
    maps = {"Classic Forest Camp"},
    gameModifier = Enum.GameModifier.ClassicRoblox,
    waveMusic = {"Egg Hunt 2024", [12] = "Grave Buster"},
    enemyReplaceHealthList = {
        Normal = 5,
        Slow = 18,
        Speedy = 6,
        ["Normal Boss"] = 180,
        Breaker = 12,
        Hidden = 12,
        Breaker2 = 30,
        Breaker3 = 90,
        Breaker4 = 170,
        Necromancer = 400,
        ["Slow Boss"] = 1800,
        ["Redcliff Traitor"] = 1250,
        ["Grave Digger"] = 28000,
    },
    overrideLoadout = {
        Pyromancer = {Skin = "Default", GoldenPerks = false, Order = 3},
        Militant = {Skin = "Default", GoldenPerks = false, Order = 2},
        Mortar = {Skin = "Default", GoldenPerks = false, Order = 4},
        Cowboy = {Skin = "Default", GoldenPerks = false, Order = 1},
        Minigunner = {Skin = "Default", GoldenPerks = false, Order = 5},
    },
    overwriteRewards = {
        Badges = {
            [3.72610955290072e+15] = function(a1, a2) -- Line: 63
                return a2
            end,
        },
        BadgeIcons = {[17577567446] = {Label = "Token", BadgeId = 3.72610955290072e+15}},
    },
    waveEnemiesOverride = {
        {
            {Name = "Speedy", Amount = 2, Delay = 0.2},
            {Name = "Slow", Amount = 3, Delay = 0.7},
            {Name = "Normal", Amount = 6, Delay = 0.6},
        },
        {
            {Name = "Speedy", Amount = 8, Delay = 1.2, Time = 1.2},
            {
                Name = "Normal",
                Amount = 15,
                Delay = 0.6,
                Time = 1.6,
                Modifiers = {[Enum.Modifier.FireImmune] = true},
            },
            {Name = "Slow", Amount = 8, Delay = 0.8, Time = 1},
        },
        {
            {Name = "Slow", Amount = 10, Delay = 0.2},
            {Name = "Normal", Amount = 20, Delay = 0.6, Time = 1.2},
            {Name = "Speedy", Amount = 3, Delay = 0.2},
            {Name = "Hidden", Amount = 2, Delay = 0.6},
            {Name = "Speedy", Amount = 3, Delay = 0.2},
            {Name = "Hidden", Amount = 2, Delay = 0.6},
            {Name = "Normal Boss", Amount = 1, Delay = 1},
        },
        {
            {Name = "Normal Boss", Amount = 1, Delay = 1},
            {Name = "Slow", Amount = 5, Delay = 0.1},
            {Name = "Normal", Amount = 10, Delay = 0.1, Time = 0.5},
            {Name = "Normal Boss", Amount = 1, Delay = 1},
            {Name = "Slow", Amount = 5, Delay = 0.1},
            {Name = "Normal", Amount = 10, Delay = 0.1, Time = 0.5},
            {Name = "Normal Boss", Amount = 1, Delay = 1},
            {Name = "Slow", Amount = 5, Delay = 0.1},
            {Name = "Hidden", Amount = 10, Delay = 0.6},
        },
        {
            {Name = "Normal Boss", Amount = 5, Delay = 2, Time = 0.1},
            {
                Name = "Slow",
                Amount = 50,
                Delay = 0.7,
                Time = 0.7,
                Modifiers = {[Enum.Modifier.FireImmune] = true},
            },
            {Name = "Breaker2", Amount = 20, Delay = 0.8, Time = 0.8},
        },
        {
            {Name = "Normal Boss", Amount = 5, Delay = 1, Time = 1},
            {Name = "Breaker2", Amount = 20, Delay = 0.8, Time = 4},
            {Name = "Normal Boss", Amount = 1, Delay = 1, Time = 1},
            {Name = "Hidden", Amount = 20, Delay = 0.2, Time = 2.5},
        },
        {
            {
                Name = "Breaker2",
                Amount = 15,
                Delay = 1.5,
                Time = 0,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {Name = "Hidden Boss", Amount = 1, Delay = 1, Time = 1},
            {
                Name = "Hidden",
                Amount = 3,
                Delay = 1,
                Time = 0.5,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {Name = "Normal Boss", Amount = 1, Delay = 0.6},
            {
                Name = "Hidden",
                Amount = 3,
                Delay = 1,
                Time = 0.5,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {
                Name = "Normal Boss",
                Amount = 1,
                Delay = 0.6,
                Modifiers = {[Enum.Modifier.Nimble] = true, [Enum.Modifier.Slime] = true},
            },
            {Name = "Necromancer", Amount = 2, Delay = 1.2},
            {Name = "Hidden Boss", Amount = 1, Delay = 1, Time = 1},
        },
        {
            {
                Name = "Normal",
                Amount = 40,
                Delay = 0.6,
                Time = 1.8,
                Modifiers = {
                    [Enum.Modifier.Tank] = true,
                    [Enum.Modifier.FireImmune] = true,
                },
            },
            {Name = "Breaker2", Amount = 5, Delay = 0.1},
            {Name = "Breaker4", Amount = 1, Delay = 0.1},
            {Name = "Breaker2", Amount = 5, Delay = 0.1},
            {Name = "Breaker4", Amount = 1, Delay = 0.1},
            {Name = "Breaker2", Amount = 5, Delay = 0.1},
            {Name = "Breaker4", Amount = 1, Delay = 0.1},
            {Name = "Breaker2", Amount = 5, Delay = 0.1},
            {Name = "Breaker4", Amount = 1, Delay = 0.1},
            {Name = "Breaker2", Amount = 5, Delay = 0.1},
        },
        {
            {Name = "Hidden Boss", Amount = 2, Delay = 5, Time = 0},
            {
                Name = "Slow Boss",
                Amount = 1,
                Delay = 0.8,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Slow",
                Amount = 8,
                Delay = 0.4,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {
                Name = "Slow Boss",
                Amount = 1,
                Delay = 0.8,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Slow",
                Amount = 8,
                Delay = 0.4,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {Name = "Necromancer", Amount = 2, Delay = 2},
            {
                Name = "Normal Boss",
                Amount = 3,
                Delay = 0.8,
                Modifiers = {[Enum.Modifier.Slime] = true, [Enum.Modifier.Nimble] = true},
            },
        },
        {
            {Name = "Breaker2", Amount = 30, Delay = 0.8, Time = 2.4},
            {
                Name = "Hidden",
                Amount = 10,
                Delay = 2.5,
                Time = 0,
                Modifiers = {[Enum.Modifier.Nimble] = true, [Enum.Modifier.Slime] = true},
            },
            {Name = "Breaker4", Amount = 4, Delay = 2.5, Time = 2.5},
            {Name = "Slow Boss", Amount = 3, Delay = 3, Time = 1.5},
            {Name = "Necromancer", Amount = 2, Delay = 3},
            {Name = "Breaker4", Amount = 2, Delay = 1.5},
        },
        {
            {
                Name = "Hidden",
                Amount = 25,
                Delay = 1.5,
                Time = 1.5,
                Modifiers = {
                    [Enum.Modifier.Tank] = true,
                    [Enum.Modifier.FireImmune] = true,
                },
            },
            {Name = "Slow Boss", Amount = 1, Delay = 0},
            {Name = "Normal Boss", Amount = 4, Delay = 0.3},
            {Name = "Hidden Boss", Amount = 1, Delay = 0},
            {Name = "Breaker4", Amount = 1, Delay = 0.5},
            {Name = "Slow Boss", Amount = 1, Delay = 0},
            {
                Name = "Normal Boss",
                Amount = 4,
                Delay = 0.3,
                Modifiers = {[Enum.Modifier.Nimble] = true, [Enum.Modifier.Slime] = true},
            },
            {Name = "Hidden Boss", Amount = 1, Delay = 0},
            {Name = "Slow Boss", Amount = 1, Delay = 0},
            {
                Name = "Normal Boss",
                Amount = 4,
                Delay = 0.5,
                Modifiers = {[Enum.Modifier.Nimble] = true, [Enum.Modifier.Slime] = true},
            },
            {Name = "Hidden Boss", Amount = 1, Delay = 0},
            {Name = "Necromancer", Amount = 4, Delay = 1.5},
            {Name = "Breaker4", Amount = 1, Delay = 0.5},
        },
        {
            {
                Name = "Normal",
                Amount = 50,
                Delay = 0.5,
                Time = 2,
                Modifiers = {
                    [Enum.Modifier.Tank] = true,
                    [Enum.Modifier.FireImmune] = true,
                },
            },
            {Name = "Breaker4", Amount = 1, Delay = 0.5},
            {Name = "Breaker2", Amount = 8, Delay = 0.1},
            {Name = "Breaker4", Amount = 1, Delay = 0.5},
            {Name = "Breaker2", Amount = 8, Delay = 0.1},
            {Name = "Breaker4", Amount = 1, Delay = 0.5},
            {Name = "Breaker2", Amount = 8, Delay = 0.1},
            {Name = "Slow Boss", Amount = 1, Delay = 1.5, Time = 1.5},
            {Name = "Normal Boss", Amount = 6, Delay = 1.5, Time = 1.5},
            {Name = "Necromancer", Amount = 1, Delay = 1, Time = 1},
            {Name = "Hidden Boss", Amount = 1, Delay = 1},
            {
                Name = "Grave Digger",
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
                Text = "Alright, now I'm starting to get annoyed with you!",
            },
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "You may have made it this far but until now I've just been warming up.",
                Wait = 5,
            },
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "I think its high time I show you what I'm really capable of!",
            },
        },
        [3] = {
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "Your commander's been asking about you, I told him you and I are getting along just fine!",
                Wait = 5,
            },
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "The look on his face was priceless! I wish you could have seen it!",
            },
        },
        [5] = {
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "This forest camp isn't bad but it could use more spooky trees.",
                Wait = 5,
            },
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "Not enough willows for my taste personally",
            },
        },
        [7] = {
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "This is it interloper! I'll make sure you never leave this forest alive!",
                Wait = 5,
            },
            {Speaker = "1x1x1x1", Emotion = "Neutral", Text = "The fun and games are over!"},
        },
        [10] = {
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "I've had enough, I've waited too long for this moment!",
                Wait = 5,
            },
            {Speaker = "1x1x1x1", Emotion = "Neutral", Text = "This forest will be your grave!"},
        },
        [12] = {
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "Lets see how you handle my new and improved Grave Digger!",
                Wait = 5,
            },
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "This Grave Digger actually used to be one of my old camping buddies ... before I transformed him!",
            },
        },
    },
}