-- Script path: ReplicatedStorage.Shared.Modules.LiveEvents.LegacyDefinitions
-- Decompile time: 5.08 ms

local ActionBuilder = require(script.Parent.ActionBuilder)
local LegacyParameters = require(script.Parent.LegacyParameters)
require(script.Parent.Types)
local action = ActionBuilder.action
local select = ActionBuilder.select
local content = ActionBuilder.content
local toggle = ActionBuilder.toggle

local function numberField(a1, a2, a3, a4, a5) -- Line: 14
    -- upvalues: ActionBuilder (val)
    return ActionBuilder.number(a1, a2, a3, a4, a5, true)
end

local function duration() -- Line: 24 -- upvalues: ActionBuilder (val)
    return ActionBuilder.duration(30, true)
end

local function spawnTime(a1) -- Line: 28
    return a1.amount * 0.3 + 10
end

local v1 = {"Lobby", "Game"}
return {
    action("add-game-modifier", "Add Game Modifier", "Temporarily enable a supported modifier. Stop prevents future application; already affected enemies and paid rewards retain their changes.", "Match", {
        select("name", "Modifier", {
            "Fog",
            "SpeedyEnemies",
            "HealthyEnemies",
            "FlyingEnemies",
            "HiddenEnemies",
            "AllPaths",
            "DoubleHealth",
        }, "Fog"),
        duration(),
    }, {conflicts = {"game-modifier", "tower-layout", "enemy-spawns", "wave-loop"}}),
    action("spawn-enemy", "Spawn Enemy", "Spawn a bounded group of named enemies. Stop cancels pending spawns; spawned enemies stay in the match.", "Enemies", {
        content("name", "Enemy", "Normal"),
        ActionBuilder.number("amount", "Enemy count", 1, 1, 30, true),
        (content("path", "Path (Random or path name)", "Random")),
    }, {repeatable = true, finishOnApply = true, conflicts = {"enemy-spawns"}, lifetime = spawnTime}),
    action("spawn-unit", "Spawn Unit", "Spawn a bounded group of friendly units. Stop cancels pending spawns.", "Enemies", {
        content("name", "Unit", "Tank"),
        ActionBuilder.number("amount", "Unit count", 1, 1, 20, true),
        toggle("golden", "Golden", false),
        (numberField("upgrade", "Upgrade", 0, 0, 6)),
    }, {repeatable = true, finishOnApply = true, conflicts = {"unit-spawns"}, lifetime = spawnTime}),
    action("spawn-tower", "Spawn Tower", "Create a named tower at a validated map position for a random player. Free upgrades have no paid refund value.", "Towers", {
        content("name", "Tower", "Scout"),
        content("skin", "Skin", "Default"),
        toggle("golden", "Golden", false),
        ActionBuilder.number("x", "Position X", 0, -10000, 10000, true),
        ActionBuilder.number("y", "Position Y", 30, -10000, 10000, true),
        ActionBuilder.number("z", "Position Z", 0, -10000, 10000, true),
        ActionBuilder.number("path", "Upgrade path", 1, 1, 3, true),
        (numberField("level", "Upgrade level", 0, 0, 6)),
    }, {finishOnApply = true, conflicts = {"tower-layout", "tower-upgrades"}}),
    action("change-map", "Change Map", "Replace the map and clear its enemies, units and towers. Stop cannot restore the previous match.", "Match", {content("mapName", "Map", "Nil Zone II"), (toggle("refundTowers", "Refund towers", true))}, {
        destructive = true,
        finishOnApply = true,
        conflicts = {
            "map",
            "tower-layout",
            "tower-upgrades",
            "enemy-spawns",
            "enemy-direction",
            "unit-spawns",
            "wave-loop",
            "item-rain",
        },
        lifetime = ActionBuilder.seconds(120),
    }),
    action("add-endless-mode", "Start Endless Spawning", "Run a bounded legacy enemy-pool schedule until its duration ends or Stop Endless is used.", "Enemies", {
        content(
            "endlessData",
            "Enemy pools (JSON)",
            "{\"0\":{\"SpawnDelay\":1,\"Enemies\":{\"Normal\":{\"Interval\":2}}}}",
            LegacyParameters.EndlessMaxLength
        ),
        (duration()),
    }, {conflicts = {"endless", "enemy-spawns", "wave-loop", "game-modifier"}}),
    action(
        "remove-endless-mode",
        "Stop Endless Spawning",
        "Stop the endless spawning owned by this event. Already spawned enemies remain.",
        "Enemies",
        {},
        {finishOnApply = true, stops = {"endless"}}
    ),
    action("set-tower-limit", "Set Tower Limit", "Temporarily override the placement limit per player. Zero restores the normal limit.", "Towers", {
        ActionBuilder.number("limit", "Tower limit (0 = normal)", 40, 0, 100, true),
        (duration()),
    }, {conflicts = {"tower-limit"}}),
    action(
        "random-tower-placement",
        "Random Tower Placement",
        "Temporarily move existing towers to validated random positions, reserving their original placements for restoration.",
        "Towers",
        {duration()},
        {conflicts = {"game-modifier", "tower-layout"}}
    ),
    action(
        "rain-tacos",
        "Rain Tacos",
        "Rain tacos that restore five base health when collected.",
        "Spectacle",
        {duration()},
        {conflicts = {"item-rain"}}
    ),
    action("rain-evil-tacos", "Rain Evil Tacos", "Rain tacos that remove five base health when collected.", "Spectacle", {duration()}, {
        confirmation = "Collected evil tacos can defeat the match. Stop cannot undo damage.",
        conflicts = {"item-rain"},
    }),
    action("rain-cash", "Rain Cash", "Rain pickups worth 100 match cash each.", "Economy", {duration()}, {conflicts = {"item-rain"}}),
    action(
        "nyan-cats",
        "Nyan Cats",
        "Run the Nyan Cat effect with pickups worth 100 match cash each.",
        "Spectacle",
        {duration()},
        {conflicts = {"item-rain"}}
    ),
    action(
        "stop-raining",
        "Stop Raining",
        "Stop rain owned by this event, including its remaining pickups and music.",
        "Spectacle",
        {},
        {finishOnApply = true, stops = {"item-rain"}}
    ),
    action("force-loadout", "Force Loadout", "Temporarily replace current and joining players' loadouts with named towers. Saved inventory is unchanged.", "Towers", {
        content("loadout", "Towers (comma separated)", "Scout, Commander, Minigunner", 720),
        (duration()),
    }, {conflicts = {"loadout"}}),
    action("add-to-loadout", "Add to Loadout", "Temporarily add a named tower, skin and golden setting, up to nine slots.", "Towers", {
        content("tower", "Tower", "Scout"),
        content("skin", "Skin", "Default"),
        toggle("golden", "Golden", false),
        (duration()),
    }, {conflicts = {"loadout"}}),
    action(
        "set-health",
        "Set Base Health",
        "Set the current base health once. Zero can defeat the match.",
        "Match",
        {numberField("health", "Base health", 100, 0, 1000000)},
        {destructive = true, finishOnApply = true, conflicts = {"base-health"}}
    ),
    action("force-end-game", "End Match", "End the match through its normal victory or defeat flow, including rewards.", "Match", {select("gameResult", "Result", {"Triumph", "Lose"}, "Triumph")}, {
        destructive = true,
        finishOnApply = true,
        conflicts = {"match-end", "map"},
        lifetime = ActionBuilder.seconds(120),
    }),
    action(
        "sell-towers",
        "Sell All Towers",
        "Sell all eligible player towers with the legacy full refund. Temporary unsellable towers remain.",
        "Towers",
        {},
        {destructive = true, finishOnApply = true, conflicts = {"tower-layout", "tower-upgrades"}}
    ),
    action("sound", "Play Sound", "Play a looping sound temporarily.", "Presentation", {
        ActionBuilder.number("id", "Audio asset ID", 142376088, 1, 9007199254740991, true),
        (duration()),
    }, {repeatable = true, contexts = v1, conflicts = {"event-sound"}, replaces = {"event-sound"}}),
    action("emote", "Play Emote", "Temporarily make current characters perform the named emote, or stop their emotes.", "Spectacle", {content("name", "Emote (Stop to stop)", "Thriller"), (duration())}, {
        repeatable = true,
        contexts = v1,
        conflicts = {"player-animation"},
        replaces = {"player-animation"},
    }),
    action(
        "sticker",
        "Show Sticker",
        "Show a named sticker above current players. Stop removes the sticker; its authored animation may finish sooner.",
        "Presentation",
        {content("name", "Sticker", "Angry Pumpkin"), (duration())},
        {repeatable = true, contexts = v1}
    ),
    action("award-badge", "Award Badge", "Process a badge award for every current player. Awarded badges cannot be recalled.", "Rewards", {numberField("badgeId", "Badge ID", 4098249046277986, 1, 9007199254740991)}, {
        destructive = true,
        finishOnApply = true,
        contexts = v1,
        conflicts = {"badge-awards"},
        lifetime = ActionBuilder.seconds(120),
    }),
    action("gear", "Give Gear", "Equip a Roblox gear asset temporarily. Stop removes the granted tools and restores held tools; asset-script side effects may persist.", "Spectacle", {
        ActionBuilder.number("id", "Gear asset ID", 0, 0, 9007199254740991, true),
        (duration()),
    }, {
        confirmation = "Runs the selected asset's tool scripts. Use a verified gear asset. Zero temporarily puts away held tools.",
        contexts = v1,
        conflicts = {"player-gear"},
        replaces = {"player-gear"},
    }),
    action(
        "ufo",
        "UFO",
        "Launch last year's external UFO effect on a random player. The external effect cannot be recalled after launch.",
        "Spectacle",
        {},
        {destructive = true, finishOnApply = true, contexts = v1, conflicts = {"ufo"}}
    ),
    (action(
        "toggle-event-portal",
        "Toggle Event Portal",
        "Temporarily open or close the legacy Nulzone portal when its lobby assets are present.",
        "Travel",
        {toggle("enabled", "Portal open", true), (duration())},
        {contexts = {"Lobby"}, conflicts = {"lobby-portal", "player-teleport"}}
    )),
}