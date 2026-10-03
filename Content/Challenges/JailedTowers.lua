-- Script path: ReplicatedStorage.Content.Challenges.JailedTowers
-- Decompile time: 8.88 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
return {
    title = "Jailed Towers",
    description = "After wave 5; once per wave, a tower type will be jailed per player.",
    consumablesDisabled = true,
    gameModifier = Enum.GameModifier.JailedTower,
    maps = {"Simplicity", "Crossroads", "Rocket Arena", "Chess Board"},
    challengeRewards = {
        gems = 100,
        experience = 300,
        crates = {{type = "High Grade", amount = 2}},
        tickets = {Timescale = 2},
    },
    onServerLoad = function() -- Line: 32 -- upvalues: ServerStorage (val)
        return require(ServerStorage.Server.Services.Game.GlobalModifierService).compose().addModifier("NoDialogue").complete()
    end,
    onNextWave = function(a1) -- Line: 38 -- upvalues: ServerStorage (val), Players (val), table (val), Enum (val) -- types: a1: number
        local Name, v1, v2, v3, v4
        local TowerService = require(ServerStorage.Server.Services.Game.TowerService)
        if a1 <= 5 then
            return
        end
        for i, j in Players:GetPlayers() do
            v3 = TowerService.getAllTowersByPlayer(j)
            v4 = {}
            Name = nil
            v1 = nil
            v2 = nil
            for k, n in v3, v1, v2 do
                if not table.find(v4, n.Name) then
                    table.insert(v4, n.Name)
                end
                if n.StatusEffects:has(Enum.StatusEffect.Jailed) then
                    Name = n.Name
                    n.StatusEffects:remove(Enum.StatusEffect.Jailed)
                end
            end
            if Name then
                table.remove(v4, table.find(v4, Name))
            end
            table.shuffle(v4)
            for m, i5 in v3 do
                if i5.Name == v4[1] then
                    i5.StatusEffects:apply(Enum.StatusEffect.Jailed, "JailedTowers")
                end
            end
        end
    end,
    enemyReplaceList = {
        Mystery = "Breaker2",
        ["Mystery Boss"] = "Breaker4",
        ["Dark Necromancer"] = "Necromancer",
        Templar = "Warden",
    },
    enemyReplaceHealthList = {
        ["Fallen Hero"] = 5000,
        ["Fallen Guardian"] = 14000,
        ["Fallen King"] = 75000,
        Abnormal = 6,
        Quick = 4,
        Heavy = 16,
        ["Abnormal Boss"] = 175,
        Breaker2 = 50,
        Necromancer = 400,
        Fallen = 180,
    },
    waveEnemiesOverride = {
        [2] = {{Name = "Abnormal", Delay = 0.5, Amount = 6}, {Name = "Quick", Delay = 0.5, Amount = 1}},
        [3] = {
            {Name = "Quick", Delay = 0.5, Amount = 1},
            {Name = "Abnormal", Delay = 0.5, Amount = 3},
            {Name = "Quick", Delay = 0.5, Amount = 1},
            {Name = "Abnormal", Delay = 0.5, Amount = 4},
        },
        [4] = {
            {
                Name = "Abnormal",
                Delay = 0.5,
                Amount = 1,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {Name = "Abnormal", Delay = 0.5, Amount = 7},
            {Name = "Quick", Delay = 0.5, Amount = 1},
        },
        [5] = {{Name = "Quick", Delay = 0.5, Amount = 8}, {Name = "Abnormal", Delay = 0.2, Amount = 4}},
        [6] = {
            {
                Name = "Abnormal",
                Delay = 0.5,
                Amount = 1,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {Name = "Abnormal", Delay = 0.5, Amount = 3},
            {
                Name = "Abnormal",
                Delay = 0.5,
                Amount = 1,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {Name = "Quick", Delay = 0.4, Amount = 8},
        },
        [7] = {
            {Name = "Quick", Delay = 0.3, Amount = 2},
            {Name = "Heavy", Delay = 0.6, Amount = 10},
            {Name = "Quick", Delay = 0.3, Amount = 2},
        },
        [8] = {
            {Name = "Quick", Delay = 0.5, Amount = 10, Time = 2},
            {Name = "Abnormal", Delay = 0.4, Amount = 6},
            {Name = "Heavy", Delay = 0.5, Amount = 6},
        },
        [9] = {
            {Name = "Quick", Delay = 0.3, Amount = 15, Time = 0.9},
            {
                Name = "Abnormal",
                Delay = 0.4,
                Amount = 10,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
        },
        [10] = {
            {
                Name = "Abnormal",
                Delay = 0.5,
                Amount = 12,
                Time = 6,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {Name = "Heavy", Delay = 0.5, Amount = 4},
            {Name = "Abnormal Boss", Delay = 0.6, Amount = 1},
        },
        [11] = {
            {Name = "Heavy", Delay = 0.4, Amount = 8},
            {
                Name = "Abnormal",
                Delay = 0.5,
                Amount = 8,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {Name = "Heavy", Delay = 0.4, Amount = 8},
            {
                Name = "Quick",
                Delay = 0.5,
                Amount = 8,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
        },
        [12] = {
            {Name = "Abnormal Boss", Delay = 0.5, Amount = 1},
            {Name = "Heavy", Delay = 0.5, Amount = 8},
            {
                Name = "Abnormal",
                Delay = 0.4,
                Amount = 8,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
        },
        [13] = {{Name = "Shadow", Delay = 0.5, Amount = 10}},
        [14] = {
            {
                Name = "Heavy",
                Delay = 0.5,
                Amount = 12,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {Name = "Abnormal Boss", Delay = 0.6, Amount = 2},
        },
        [15] = {{Name = "Shadow", Delay = 0.5, Amount = 20}},
        [16] = {{Name = "Mystery", Delay = 0.5, Amount = 8}},
        [17] = {
            {
                Name = "Heavy",
                Delay = 0.5,
                Amount = 6,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {Name = "Mystery", Delay = 0.5, Amount = 6},
        },
        [18] = {
            {
                Name = "Heavy",
                Delay = 0.5,
                Amount = 3,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {Name = "Mystery", Delay = 0.5, Amount = 14},
        },
        [19] = {
            {
                Name = "Heavy",
                Delay = 0.3,
                Amount = 4,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {
                Name = "Quick",
                Delay = 0.4,
                Amount = 6,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {
                Name = "Shadow",
                Delay = 0.5,
                Amount = 4,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {Name = "Mystery", Delay = 0.5, Amount = 3},
            {Name = "Abnormal Boss", Delay = 0.6, Amount = 2},
            {Name = "Dark Necromancer", Delay = 0.6, Amount = 1},
        },
        [20] = {
            {
                Name = "Quick",
                Delay = 0.1,
                Amount = 10,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {Name = "Shadow", Delay = 0.1, Amount = 7},
            {Name = "Fallen", Delay = 0.5, Amount = 4},
            {
                Name = "Abnormal Boss",
                Delay = 0.6,
                Amount = 1,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
        },
        [21] = {
            {
                Name = "Mystery",
                Delay = 1,
                Amount = 7,
                Time = 1,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {Name = "Fallen", Delay = 0.5, Amount = 5},
            {
                Name = "Abnormal Boss",
                Delay = 0.8,
                Amount = 2,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {
                Name = "Heavy",
                Delay = 0.6,
                Amount = 8,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {Name = "Shadow", Delay = 0.5, Amount = 4},
        },
        [22] = {
            {
                Name = "Heavy",
                Delay = 0.6,
                Amount = 8,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {
                Name = "Shadow",
                Delay = 0.5,
                Amount = 4,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {Name = "Mystery", Delay = 0.5, Amount = 8, Time = 1.5},
            {
                Name = "Abnormal Boss",
                Delay = 0.7,
                Amount = 2,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {Name = "Giant Boss", Delay = 1, Amount = 1},
        },
        [23] = {
            {
                Name = "Abnormal Boss",
                Delay = 0.7,
                Amount = 1,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {
                Name = "Fallen",
                Delay = 0.5,
                Amount = 6,
                Time = 1,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {Name = "Giant Boss", Delay = 1.5, Amount = 1},
            {
                Name = "Mystery",
                Delay = 0.5,
                Amount = 8,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Dark Necromancer",
                Delay = 0.8,
                Amount = 1,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
        },
        [24] = {
            {Name = "Shadow", Delay = 0.5, Amount = 15, Time = 0.5},
            {
                Name = "Quick",
                Delay = 0.1,
                Amount = 10,
                Modifiers = {[Enum.Modifier.Tank] = true, [Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Fallen",
                Delay = 0.5,
                Amount = 6,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {Name = "Mystery", Delay = 0.4, Amount = 8},
            {Name = "Shadow Boss", Delay = 0.5, Amount = 1},
        },
        [25] = {
            {
                Name = "Fallen",
                Delay = 0.5,
                Amount = 12,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Heavy",
                Delay = 0.5,
                Amount = 4,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {Name = "Mystery", Delay = 0.5, Amount = 6},
            {
                Name = "Heavy",
                Delay = 0.5,
                Amount = 4,
                Modifiers = {[Enum.Modifier.Tank] = true},
            },
            {Name = "Dark Necromancer", Delay = 0.6, Amount = 4},
        },
        [26] = {{Name = "Glitch", Delay = 0.5, Amount = 12}},
        [27] = {
            {Name = "Glitch", Delay = 0.5, Amount = 10},
            {Name = "Mystery", Delay = 0.4, Amount = 8},
            {
                Name = "Fallen",
                Delay = 0.5,
                Amount = 8,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {Name = "Mystery", Delay = 0.4, Amount = 8},
            {
                Name = "Abnormal Boss",
                Delay = 0.5,
                Amount = 4,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
        },
        [28] = {
            {
                Name = "Hazard",
                Delay = 0.5,
                Amount = 13,
                Time = 2,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {Name = "Giant Boss", Delay = 1, Amount = 2},
            {
                Name = "Mystery",
                Delay = 0.5,
                Amount = 10,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {Name = "Glitch", Delay = 0.5, Amount = 10},
        },
        [29] = {
            {Name = "Giant Boss", Delay = 1, Amount = 1},
            {
                Name = "Mystery",
                Delay = 0.5,
                Amount = 10,
                Time = 2.5,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {Name = "Glitch", Delay = 0.5, Time = 3, Amount = 12},
            {
                Name = "Fallen",
                Delay = 0.5,
                Amount = 12,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Hazard",
                Delay = 0.5,
                Amount = 4,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
        },
        [30] = {
            {
                Name = "Fallen",
                Delay = 4,
                Amount = 5,
                Time = 0,
                Modifiers = {[Enum.Modifier.Nimble] = true, [Enum.Modifier.Slime] = true},
            },
            {
                Name = "Hazard",
                Delay = 0.5,
                Amount = 4,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Abnormal Boss",
                Delay = 0.5,
                Amount = 4,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {Name = "Shadow Boss", Delay = 1, Amount = 2},
            {
                Name = "Mystery",
                Delay = 0.5,
                Amount = 10,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {
                Name = "Glitch",
                Delay = 0.5,
                Amount = 9,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {Time = 2, Name = "Tank", Delay = 2, Amount = 1},
            {
                Name = "Mystery",
                Delay = 0.5,
                Amount = 10,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
        },
        [31] = {
            {Name = "Giant Boss", Delay = 1, Amount = 5},
            {
                Name = "Hazard",
                Delay = 0.5,
                Amount = 13,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Fallen",
                Delay = 0.5,
                Amount = 10,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Dark Necromancer",
                Delay = 1,
                Amount = 1,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
        },
        [32] = {
            {Name = "Mystery", Delay = 0.7, Amount = 15, Time = 1.4},
            {Name = "Giant Boss", Delay = 1, Amount = 3},
            {Name = "Tank", Delay = 0.5, Amount = 1},
            {Name = "Mystery Boss", Delay = 0.8, Amount = 10},
        },
        [33] = {
            {
                Name = "Glitch",
                Delay = 0.5,
                Amount = 24,
                Time = 0.5,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Giant Boss",
                Delay = 1,
                Amount = 6,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {Name = "Mystery", Delay = 0.5, Amount = 10},
            {Name = "Mystery Boss", Delay = 0.8, Amount = 12},
            {Name = "Dark Necromancer", Delay = 0.8, Amount = 1},
            {Name = "Shadow Boss", Delay = 1, Amount = 3},
        },
        [34] = {
            {
                Name = "Giant Boss",
                Delay = 1,
                Amount = 8,
                Time = 2,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {
                Name = "Boomer",
                Delay = 0.8,
                Amount = 1,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Glitch",
                Delay = 0.5,
                Amount = 8,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Mystery",
                Delay = 0.5,
                Amount = 6,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {
                Name = "Hazard",
                Delay = 0.5,
                Amount = 6,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Fallen",
                Delay = 0.5,
                Amount = 8,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {Name = "Mystery Boss", Delay = 0.8, Amount = 14},
        },
        [35] = {
            {
                Name = "Templar",
                Delay = 3,
                Amount = 1,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {
                Name = "Hazard",
                Delay = 0.5,
                Amount = 5,
                Modifiers = {[Enum.Modifier.Slime] = true, [Enum.Modifier.Nimble] = true},
            },
            {Name = "Mystery Boss", Delay = 0.8, Amount = 20},
        },
        [36] = {
            {
                Name = "Giant Boss",
                Delay = 1,
                Amount = 8,
                Time = 2,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {
                Name = "Boomer",
                Delay = 1.5,
                Amount = 1,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Glitch",
                Delay = 0.3,
                Amount = 8,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {Name = "Tank", Delay = 2, Amount = 1},
            {
                Name = "Error",
                Delay = 0.3,
                Amount = 8,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {Name = "Summoner Boss", Delay = 1.5, Amount = 1},
        },
        [37] = {
            {
                Name = "Boomer",
                Delay = 1.6,
                Amount = 1,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Glitch",
                Delay = 0.5,
                Amount = 10,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Error",
                Delay = 0.3,
                Amount = 6,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Giant Boss",
                Delay = 1,
                Amount = 6,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {Name = "Shadow Boss", Delay = 1, Amount = 2},
            {
                Name = "Hazard",
                Delay = 0.5,
                Amount = 6,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Error",
                Delay = 0.3,
                Amount = 6,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Fallen",
                Delay = 0.5,
                Amount = 6,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Templar",
                Delay = 3,
                Amount = 1,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {Name = "Summoner Boss", Delay = 3, Amount = 2},
            {
                Name = "Error",
                Delay = 0.3,
                Amount = 6,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
        },
        [38] = {
            {
                Name = "Giant Boss",
                Delay = 1,
                Amount = 8,
                Time = 2,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {
                Name = "Error",
                Delay = 0.3,
                Amount = 3,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Templar",
                Delay = 3,
                Amount = 1,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {
                Name = "Hazard",
                Delay = 0.5,
                Amount = 10,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Error",
                Delay = 0.4,
                Amount = 9,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {Name = "Mystery Boss", Delay = 0.8, Amount = 15},
            {Name = "Tank", Delay = 2, Amount = 1},
            {
                Name = "Giant Boss",
                Delay = 1,
                Amount = 8,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {
                Name = "Error",
                Delay = 0.3,
                Amount = 6,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
        },
        [39] = {
            {
                Name = "Boomer",
                Delay = 1.2,
                Amount = 2,
                Time = 0,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {Name = "Tank", Delay = 2.5, Amount = 2},
            {
                Name = "Error",
                Delay = 0.3,
                Amount = 6,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Glitch",
                Delay = 0.1,
                Amount = 10,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Templar",
                Delay = 3,
                Amount = 1,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {
                Name = "Hazard",
                Delay = 0.5,
                Amount = 10,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {
                Name = "Error",
                Delay = 0.3,
                Amount = 2,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Fallen",
                Delay = 0.4,
                Amount = 15,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {
                Name = "Error",
                Delay = 0.4,
                Amount = 9,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {Name = "Fallen Hero", Delay = 1.5, Amount = 7},
            {
                Name = "Fallen",
                Delay = 0.4,
                Amount = 5,
                Modifiers = {[Enum.Modifier.Nimble] = true},
            },
            {Name = "Summoner Boss", Delay = 2, Amount = 1},
            {Name = "Error", Delay = 0.4, Amount = 9},
        },
        [40] = {
            {Name = "Fallen Hero", Delay = 1.3, Amount = 3},
            {
                Name = "Templar",
                Delay = 4,
                Amount = 1,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {
                Name = "Glitch",
                Delay = 0.1,
                Amount = 6,
                Modifiers = {[Enum.Modifier.Slime] = true},
            },
            {Name = "Error", Delay = 0.3, Amount = 9},
            {Name = "Fallen", Delay = 0.35, Amount = 10},
            {
                Name = "Giant Boss",
                Delay = 1,
                Amount = 5,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {Name = "Error", Delay = 0.4, Amount = 6},
            {Name = "Fallen Guardian", Delay = 2, Amount = 4},
            {Name = "Fallen King", Delay = 2, Amount = 1},
            {Name = "Fallen Hero", Delay = 1, Amount = 2},
            {
                Name = "Giant Boss",
                Delay = 1,
                Amount = 4,
                Modifiers = {[Enum.Modifier.Bloated] = true},
            },
            {Name = "Mystery Boss", Delay = 0.8, Amount = 7},
            {Name = "Error", Delay = 0.4, Amount = 1},
        },
    },
}