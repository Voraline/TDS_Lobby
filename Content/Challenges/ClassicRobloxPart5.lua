-- Script path: ReplicatedStorage.Content.Challenges.ClassicRobloxPart5
-- Decompile time: 4.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    disabled = true,
    startingCash = 1300,
    consumablesDisabled = true,
    title = "Castle Siege",
    description = "Challenge 5 of the Roblox Classic event. Loadouts are premade, map is Castle...",
    onServerLoad = function() -- Line: 8 -- upvalues: ServerStorage (val)
        return require(ServerStorage.Server.Services.Game.GlobalModifierService).compose().addModifier("ClassicOof").addModifier("ClassicDeath").complete()
    end,
    waveCash = function(a1) -- Line: 18
        local v1 = math.pow(a1 * 1500, 0.99) + 100
        if a1 < 11 then
            return math.pow(a1 * 1500, 0.99) + 100
        end
        if a1 == 11 or a1 == 13 then
            v1 = 200000
        end
        return v1
    end,
    maps = {"Classic Castle"},
    gameModifier = Enum.GameModifier.ClassicRoblox,
    waveMusic = {
        "Egg Hunt 2024",
        [12] = "Grave Buster",
        [13] = "Legacy Fallen King",
        [14] = "Classic Roblox Boss Fight",
    },
    enemyReplaceHealthList = {
        Normal = 6,
        Slow = 18,
        Speedy = 6,
        ["Normal Boss"] = 200,
        Breaker = 20,
        Hidden = 12,
        Breaker2 = 50,
        Breaker3 = 100,
        Breaker4 = 200,
        Necromancer = 600,
        ["Slow Boss"] = 2000,
        ["Redcliff Traitor"] = 1250,
        ["Fallen King"] = 90000,
        ["Fallen Guardian"] = 2000,
        ["Fallen Hero"] = 500,
        Fallen = 40,
        ["Korblox Seeker"] = 5,
        ["Korblox Undead"] = 45,
        ["Korblox Soul"] = 30,
        ["Korblox Guard"] = 15,
        ["Korblox Warrior"] = 500,
        ["Korblox General"] = 3000,
        ["Grave Digger"] = 28000,
        ["Korblox Deathwalker"] = 30000,
    },
    overrideLoadout = {
        Scout = {Skin = "Guest", GoldenPerks = true, Order = 1},
        Engineer = {Skin = "Default", GoldenPerks = false, Order = 2},
        Accelerator = {Skin = "Default", GoldenPerks = false, Order = 3},
        Ranger = {Skin = "Default", GoldenPerks = false, Order = 4},
        Mortar = {Skin = "Default", GoldenPerks = false, Order = 5},
    },
    overwriteRewards = {
        Badges = {
            [131673491685456] = function(a1, a2) -- Line: 77
                return a2
            end,
        },
        BadgeIcons = {[17577567446] = {Label = "Token", BadgeId = 131673491685456}},
        Tags = {"Classic"},
        Skins = {Scout = {"Guest"}},
    },
    waveEnemiesOverride = {
        {
            {Name = "Slow", Amount = 2, Delay = 1.8, Time = 0.5},
            {Name = "Normal", Amount = 8, Delay = 0.8},
        },
        {
            {Name = "Slow", Amount = 3, Delay = 2, Time = 0},
            {Name = "Korblox Guard", Amount = 1, Delay = 0.3},
            {Name = "Normal", Amount = 5, Delay = 0.8, Time = 3.2},
            {Name = "Korblox Guard", Amount = 1, Delay = 0.3},
            {Name = "Normal", Amount = 5, Delay = 0.8, Time = 3.2},
        },
        {
            {Name = "Normal", Amount = 10, Delay = 0.8, Time = 2.4},
            {Name = "Slow", Amount = 10, Delay = 1, Time = 3.2},
            {Name = "Korblox Undead", Amount = 3, Delay = 1.2},
            {Name = "Korblox Guard", Amount = 4, Delay = 0.6},
            {Name = "Normal Boss", Amount = 1, Delay = 0.6},
        },
        {
            {
                Name = "Korblox Undead",
                Amount = 6,
                Delay = 1.2,
                Time = 0,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {Name = "Normal Boss", Amount = 1, Delay = 1.5},
            {Name = "Korblox Seeker", Amount = 6, Delay = 1.6, Time = 0},
            {Name = "Slow", Amount = 10, Delay = 0.8, Time = 0.8},
            {Name = "Breaker2", Amount = 3, Delay = 1.8, Time = 0.8},
            {Name = "Normal Boss", Amount = 1, Delay = 1.5},
        },
        {
            {Name = "Korblox Undead", Amount = 5, Delay = 2, Time = 0},
            {Name = "Breaker2", Amount = 6, Delay = 1.5, Time = 0},
            {Name = "Korblox Soul", Amount = 2, Delay = 0.6, Time = 0},
            {Name = "Korblox Guard", Amount = 3, Delay = 1.5},
            {Name = "Normal Boss", Amount = 3, Delay = 0.8},
            {Name = "Korblox Soul", Amount = 2, Delay = 0.6, Time = 0},
            {Name = "Korblox Warrior", Amount = 1, Delay = 0.5},
        },
        {
            {
                Name = "Normal",
                Amount = 30,
                Delay = 0.5,
                Time = 1,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {Name = "Normal Boss", Amount = 5, Delay = 1.5, Time = 0.6},
            {Name = "Hidden Boss", Amount = 1, Time = 0.9},
            {Name = "Korblox Undead", Amount = 15, Delay = 0.5, Time = 1},
            {Name = "Breaker2", Amount = 10, Delay = 0.7},
            {
                Name = "Normal Boss",
                Amount = 1,
                Delay = 1,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
        },
        {
            {
                Name = "Korblox Seeker",
                Amount = 15,
                Delay = 1,
                Time = 0.1,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {
                Name = "Normal Boss",
                Amount = 4,
                Delay = 4,
                Time = 0.1,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Hidden",
                Amount = 20,
                Delay = 1.8,
                Time = 0.8,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Korblox Undead",
                Amount = 10,
                Delay = 1.2,
                Time = 3.6,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {Name = "Korblox Warrior", Amount = 1, Delay = 0.5},
            {Name = "Necromancer", Amount = 2, Delay = 1},
        },
        {
            {Name = "Slow", Amount = 40, Delay = 0.5, Time = 1},
            {
                Name = "Speedy",
                Amount = 3,
                Delay = 0.3,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {Name = "Breaker2", Amount = 20, Delay = 0.9, Time = 1.8},
            {
                Name = "Speedy",
                Amount = 3,
                Delay = 0.3,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {Name = "Korblox Warrior", Amount = 3, Delay = 3, Time = 1.5},
            {
                Name = "Speedy",
                Amount = 3,
                Delay = 0.3,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {Name = "Korblox General", Amount = 1, Delay = 1, Time = 0},
            {
                Name = "Speedy",
                Amount = 3,
                Delay = 0.3,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
        },
        {
            {
                Name = "Speedy",
                Amount = 30,
                Delay = 1,
                Time = 1,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {Name = "Normal Boss", Amount = 5, Delay = 4, Time = 1},
            {Name = "Korblox Warrior", Amount = 3, Delay = 3.5, Time = 1},
            {Name = "Korblox General", Amount = 1, Delay = 3, Time = 1},
            {Name = "Necromancer", Amount = 3, Delay = 1, Time = 1},
        },
        {
            {Name = "Redcliff Traitor", Amount = 2, Delay = 10, Time = 0},
            {
                Name = "Korblox Soul",
                Amount = 15,
                Delay = 2,
                Time = 2,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {Name = "Breaker2", Amount = 25, Delay = 0.7, Time = 0.6},
            {Name = "Breaker4", Amount = 3, Delay = 2.4, Time = 1},
            {Name = "Slow Boss", Amount = 1, Delay = 1.8},
            {Name = "Korblox General", Amount = 2, Delay = 4},
        },
        {
            {Name = "Slow Boss", Amount = 3, Delay = 4, Time = 0},
            {Name = "Hidden", Amount = 50, Delay = 0.6, Time = 1.2},
            {Name = "Korblox General", Amount = 1, Delay = 0.8},
            {Name = "Necromancer", Amount = 1, Delay = 0.5},
            {Name = "Korblox General", Amount = 1, Delay = 0.8},
            {Name = "Breaker4", Amount = 1, Delay = 0.5},
            {Name = "Necromancer", Amount = 1, Delay = 0.5},
            {Name = "Korblox General", Amount = 1, Delay = 0.8},
            {Name = "Necromancer", Amount = 1, Delay = 0.5},
            {Name = "Breaker4", Amount = 1, Delay = 0.5},
        },
        {
            {Name = "Korblox Undead", Amount = 75, Delay = 1.2, Time = 5},
            {
                Name = "Korblox General",
                Amount = 5,
                Delay = 3,
                Time = 7,
                Modifiers = {[Enum.Modifier.Lead] = true},
            },
            {
                Name = "Korblox Deathwalker",
                Amount = 1,
                Delay = 1,
                Modifiers = {[Enum.Modifier.Boss] = true},
            },
            {
                Name = "Korblox Guard",
                Amount = 75,
                Delay = 0.2,
                Time = 3,
                Modifiers = {[Enum.Modifier.Hidden] = true},
            },
            {
                Name = "Redcliff Traitor",
                Amount = 4,
                Delay = 2,
                Modifiers = {
                    [Enum.Modifier.FreezeImmune] = true,
                    [Enum.Modifier.StunImmune] = true,
                },
            },
            {
                Name = "Korblox Warrior",
                Amount = 8,
                Delay = 0.8,
                Modifiers = {
                    [Enum.Modifier.FreezeImmune] = true,
                    [Enum.Modifier.StunImmune] = true,
                    [Enum.Modifier.FireImmune] = true,
                },
            },
        },
    },
    waveAddition = {
        [13] = {
            {Name = "Slow Boss", Amount = 1, Delay = 1},
            {
                Name = "Normal",
                Amount = 50,
                Delay = 0.8,
                Time = 1.6,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {
                Name = "Hidden",
                Amount = 25,
                Delay = 1.6,
                Time = 3.2,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Speedy",
                Amount = 10,
                Delay = 1.8,
                Time = 3.6,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {Name = "Redcliff Traitor", Amount = 2, Delay = 4, Time = 2},
            {
                Name = "Korblox Warrior",
                Amount = 4,
                Delay = 2,
                Time = 1,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {Name = "Slow Boss", Amount = 2, Delay = 4, Time = 1},
            {Name = "Necromancer", Amount = 2, Delay = 3, Time = 3},
            {
                Name = "Grave Digger",
                Amount = 1,
                Delay = 0.8,
                Modifiers = {[Enum.Modifier.Boss] = true},
            },
        },
        [14] = {
            {
                Name = "Korblox Seeker",
                Amount = 30,
                Delay = 0.3,
                Time = 0.6,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {Name = "Korblox Guard", Amount = 25, Delay = 0.5, Time = 1},
            {Name = "Slow", Amount = 25, Delay = 0.6, Time = 1.2},
            {Name = "Korblox Soul", Amount = 15, Delay = 0.7, Time = 1.4},
            {Name = "Breaker2", Amount = 10, Delay = 0.8, Time = 1.6},
            {Name = "Normal Boss", Amount = 5, Delay = 2.4, Time = 2.4},
            {Name = "Hidden Boss", Amount = 2, Delay = 2.5, Time = 3},
            {Name = "Breaker4", Amount = 3, Delay = 2, Time = 4},
            {Name = "Slow Boss", Amount = 2, Delay = 6, Time = 4},
            {
                Name = "Fallen King",
                Amount = 1,
                Delay = 1.5,
                Modifiers = {[Enum.Modifier.Boss] = true},
            },
        },
    },
    dialogue = {
        {
            {Speaker = "Commander", Emotion = "Aggressive", Text = "Zzzzt can you hear me? Zzzzt"},
            {
                Speaker = "Commander",
                Emotion = "Aggressive",
                Text = "Use Zzzzz the GUEST Scout! Zzzzt",
                Wait = 5,
            },
            {Speaker = "1x1x1x1", Emotion = "Neutral", Text = "SILENCE! You will not interrupt us!"},
        },
        [3] = {
            {
                Speaker = "Commander",
                Emotion = "Neutral",
                Text = "Zzzt are you there? Zzzt Can you hear me?",
                Wait = 5,
            },
            {
                Speaker = "Commander",
                Emotion = "Neutral",
                Text = "Just hang in  zzzt there. He's zzzt getting despzzzt erate!",
            },
        },
        [5] = {
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "How fitting that our final showdown will be at a Castle fortress...",
                Wait = 5,
            },
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "I can't imagine a more climactic place for our finale!",
            },
        },
        [7] = {
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = " THAT'S ENOUGH! I WILL NOT BE DEFEATED ANY LONGER!",
                Wait = 5,
            },
            {Speaker = "1x1x1x1", Emotion = "Neutral", Text = "YOU WILL BE OVERWHELMED BY MY HORDE!"},
        },
        [10] = {
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "Please just give up now, I'm begging you ...",
                Wait = 5,
            },
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "Do you have any idea what's like to be imprisoned for fourteen years?!",
            },
        },
        [12] = {
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "Your futile efforts amuse me. Surrender now or face my wrath!",
                Wait = 5,
            },
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "You cannot comprehend the power I possess!",
            },
        },
        [13] = {
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "Haha, you thought it was over, didn't you?",
                Wait = 5,
            },
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "But it's far from it. Brace yourself for the real challenge!",
            },
        },
        [14] = {
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "This is where we part ways inteloper ... I SUMMON THE FALLEN KING!",
                Wait = 5,
            },
            {
                Speaker = "1x1x1x1",
                Emotion = "Neutral",
                Text = "Wait a second, how did you free yourself? This is impossible!",
            },
            {
                Speaker = "Commander",
                Emotion = "Aggressive",
                Text = "Give him everything you've got! We can't let him win!",
                Wait = 5,
            },
        },
    },
}