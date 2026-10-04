-- Script path: ReplicatedStorage.Content.Tower.Mecha Base.TowerInformation
-- Decompile time: 0.70 ms

local function content(a1) -- Line: 1
    local v1 = {}
    for i, v in ipairs(a1) do
        v1[i] = {Text = v}
    end
    return v1
end

local function mechaInfo(a1, a2) -- Line: 13 -- upvalues: content (val)
    return {
        ["Tower Ability"] = {
            {
                Header = "Mechanized Assault",
                Icon = 6883292239,
                Description = ("Periodically spawns a %* to walk down the path and attack enemies."):format(a1),
                Content = content(a2),
            },
        },
    }
end

return {
    ToolTip = {
        "A unit-summoning tower that sends durable Mechas down the path.",
        "Mechas can detect hidden enemies, and the final Mark V also detects flying enemies.",
        "Rocket variants add explosive damage to their gunfire.",
    },
    [0] = mechaInfo("Mark I Mecha", {
        "Spawn Time: 45s",
        "Health: 500",
        "Damage: 10",
        "Range: 30",
        "Cooldown: 0.2s",
        "Speed: 2",
        "Detections: Hidden",
    }),
    mechaInfo("Mark I Rocket Mecha", {
        "Spawn Time: 30s",
        "Health: 500",
        "Damage: 10",
        "Range: 30",
        "Cooldown: 0.2s",
        "Rocket Damage: 25",
        "Rocket Cooldown: 7s",
        "Explosion Radius: 5",
        "Speed: 2",
        "Detections: Hidden",
    }),
    mechaInfo("Mark II Mecha", {
        "Spawn Time: 30s",
        "Health: 1000",
        "Damage: 12",
        "Range: 35",
        "Cooldown: 0.15s",
        "Rocket Damage: 40",
        "Rocket Cooldown: 7s",
        "Explosion Radius: 5",
        "Speed: 2",
        "Detections: Hidden",
    }),
    mechaInfo("Mark III Mecha", {
        "Spawn Time: 30s",
        "Health: 1500",
        "Damage: 10",
        "Range: 35",
        "Cooldown: 0.1s",
        "Rocket Damage: 60",
        "Rocket Cooldown: 3.5s",
        "Explosion Radius: 5",
        "Speed: 2",
        "Detections: Hidden",
    }),
    mechaInfo("Mark IV Mecha", {
        "Spawn Time: 30s",
        "Health: 2500",
        "Damage: 22",
        "Range: 50",
        "Cooldown: 0.1s",
        "Rocket Barrage: 4 x 60 damage",
        "Rocket Cooldown: 5s",
        "Explosion Radius: 5",
        "Speed: 2",
        "Detections: Hidden",
    }),
    (mechaInfo("Mark V Mecha", {
        "Spawn Time: 30s",
        "Health: 10000",
        "Defense: 30",
        "Damage: 34",
        "Range: 50",
        "Cooldown: 0.1s",
        "Rocket Barrage: 4 x 50 damage",
        "Rocket Cooldown: 2s",
        "Explosion Radius: 5",
        "Speed: 2",
        "Detections: Hidden, Flying",
    })),
}