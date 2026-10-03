-- Script path: ReplicatedStorage.Content.Achievement.Halloween2025.Death Touched
-- Decompile time: 0.22 ms

return {
    title = "Death Touched",
    description = "Triumph on Hard mode with with the “Death”\ncurse activated (Any Night)",
    season = "Null & Void",
    objective = {
        type = "triumphwithmodifier",
        mode = "Halloween2025",
        difficulties = {"Act1", "Act2", "Act3"},
        modifiers = {"Death"},
    },
    rewards = {
        {type = "stat", stat = "Coins", amount = 1000},
        {type = "stat", stat = "SpinTickets", amount = 2},
        {type = "consumable", name = "Unholy Storm", amount = 5},
        {type = "consumable", name = "Necromancer's Tome", amount = 10},
        {type = "crate", name = "Banned", amount = 1},
    },
}