-- Script path: ReplicatedStorage.Content.Achievement.Missions.Task Master
-- Decompile time: 0.09 ms

return {
    title = "Task Master",
    description = "Complete 20 Mission Quest",
    lockedBehind = "Commander’s Favorite",
    objective = {type = "missionquest", amount = 20},
    rewards = {{type = "stat", stat = "Coins", amount = 6000}, {type = "stat", stat = "SpinTickets", amount = 4}},
}