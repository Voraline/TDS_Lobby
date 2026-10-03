-- Script path: ReplicatedStorage.Shared.Modules.SharedGameConstants
-- Decompile time: 0.39 ms

local v1 = {
    DEFAULT_BOUNDARY_SIZE = 1.5,
    BOUNDARY_HEIGHT = 1,
    MAX_TOWER_SLOTS = 5,
    MAX_PVP_TOWER_SLOTS = 4,
    MAX_CONSUMABLE_SLOTS = 4,
    MAX_LOADOUT_SLOTS = 4,
    MAX_VIP_LOADOUT_SLOTS = 6,
    GAME_ID = 1176784616,
    LOBBY_MUSIC = "2024 Fall Lobby",
    TOWER_SLOT_LEVELS = {[5] = 10},
    IS_PROD = game.GameId == 1176784616,
    GAME_TYPE = workspace.Type.Value,
    LEADERBOARD_TYPES = {"Triumphs", "Experience"},
    VALUE_OBJECT_OVERRIDES = {},
    WM_MECHA_WHITELIST = {[230717039] = true, [315354328] = true, [7972514] = true},
}
for i, j in v1 do
    if typeof(j) == "table" then
        table.freeze(j)
    end
end
table.freeze(v1)
return v1