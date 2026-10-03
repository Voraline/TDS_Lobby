-- Script path: ReplicatedStorage.Content.Achievement.Missions.Special Agent
-- Decompile time: 0.12 ms

return {
    title = "Special Agent",
    description = "Complete 3 Mission Quest",
    lockedBehind = "Errand Boy",
    objective = {type = "missionquest", amount = 3},
    rewards = {{type = "stat", stat = "Coins", amount = 900}, {type = "stat", stat = "SpinTickets", amount = 1}},
}