-- Script path: ReplicatedStorage.Shared.Modules.LiveEvents.Definitions
-- Decompile time: 7.88 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ActionBuilder = require(script.Parent.ActionBuilder)
local MusicTracks = require(ReplicatedStorage.Shared.Data.MusicTracks)
require(script.Parent.Types)
local action = ActionBuilder.action
local duration = ActionBuilder.duration
local number = ActionBuilder.number
local select = ActionBuilder.select

local function staggered(a1) -- Line: 15
    return a1.amount * a1.interval + 2
end

local u63 = table.freeze({
    Triumph = true,
    Lose = true,
    HalloweenTriumph = true,
    HalloweenLose = true,
    ["2025_Winter_Lose"] = true,
    DialogAct1Scene1 = true,
    DialogAct1Scene2 = true,
    DialogAct1Scene3 = true,
    DialogAct12Scene1 = true,
    ["2024N1C1"] = true,
    ["2024N1C2"] = true,
    ["2024N2C1"] = true,
    ["2024N2C2"] = true,
    ["2024N3C1"] = true,
    ["2024N3C2"] = true,
    ["2024N3C3"] = true,
    ["2024PLSC1"] = true,
    ["2024FI_C1"] = true,
    ["2024FI_C2"] = true,
    ["2024FI_C3"] = true,
    ADIDAS_C1 = true,
    ADIDAS_C2 = true,
    ADIDAS_C3 = true,
    HardcoreCutscene = true,
    ["2025DUCK_C1"] = true,
    ["2025DUCK_C3"] = true,
    ["2025NULL_N1C1"] = true,
    ["2025NULL_N1C2"] = true,
    ["2025NULL_N1C3"] = true,
    ["2025NULL_N2C1"] = true,
    ["2025NULL_N2C2"] = true,
    ["2025NULL_N3C1"] = true,
    ["2025NULL_N3C2"] = true,
    ["2025NULL_N3C3"] = true,
    ["2025ACT_C1"] = true,
    ["2025ACT_C3"] = true,
})

local function musicOptions() -- Line: 60 -- upvalues: MusicTracks (val), u63 (val)
    local v1 = {}
    for i in MusicTracks do
        if not u63[i] then
            table.insert(v1, i)
        end
    end
    table.sort(v1, function(a1, a2) -- Line: 67
        local v1 = string.lower(a1)
        local v2 = string.lower(a2)
        if v1 == v2 then
            return a1 < a2
        end
        return v1 < v2
    end)
    return v1
end

local v1 = {
    action("teleport-to-event", "Teleport to Event", "Send this lobby to Nil Zone II. Keep parties together and group solo players in matches of up to six. Busy or unavailable groups are skipped. Test this command in the Roblox app.", "Travel", {}, {
        defaultTarget = "ThisServer",
        confirmation = "Moves everyone eligible in the selected lobbies, including you if you are there, to Nil Zone II. Stop cannot bring departed players back.",
        finishOnApply = true,
        rehearsable = false,
        contexts = {"Lobby"},
        conflicts = {"player-teleport"},
        lifetime = ActionBuilder.seconds(120),
    }),
    action(
        "add-random-tower",
        "Add Random Tower",
        "Loan each player a random sixth-slot tower for this match. Replaces the previous event loaner.",
        "Towers",
        {select("pool", "Tower pool", {"All", "Standard", "Special"}, "All")},
        {chaos = true, conflicts = {"loadout"}, lifetime = ActionBuilder.untilRunEnd}
    ),
    action(
        "upgrade-all-towers",
        "Upgrade All Towers",
        "Give every placed tower one free upgrade along its selected path.",
        "Towers",
        {},
        {chaos = true, repeatable = true, finishOnApply = true, conflicts = {"tower-upgrades"}}
    ),
    action(
        "max-all-towers",
        "Max All Towers",
        "Give every placed tower free upgrades to the end of its selected path.",
        "Towers",
        {},
        {chaos = true, repeatable = true, finishOnApply = true, conflicts = {"tower-upgrades"}}
    ),
    action(
        "reverse-enemies",
        "Reverse Enemies",
        "Reverse current enemies temporarily. Enemies reaching the path start can turn forward normally.",
        "Enemies",
        {duration()},
        {chaos = true, conflicts = {"enemy-direction"}}
    ),
    action("fling-tower", "Fling Tower", "Bounce random towers across the map and land each at a valid position.", "Towers", {
        number("amount", "Towers to fling", 1, 1, 20, true),
        number("duration", "Duration (seconds)", 4, 1, 10),
        (number("bounces", "Bounces", 3, 1, 5, true)),
    }, {chaos = true, repeatable = true, allowConcurrent = true, conflicts = {"tower-layout"}}),
    action("explode-tower", "Explode Tower", "Permanently remove random towers. Stopping the show cannot restore them.", "Towers", {number("amount", "Towers to explode", 1, 1, 20, true)}, {
        destructive = true,
        repeatable = true,
        allowConcurrent = true,
        conflicts = {"tower-layout"},
        lifetime = ActionBuilder.seconds(4),
    }),
    action(
        "increase-payouts",
        "Increase Payouts",
        "Multiply enemy-earned match cash temporarily. Does not multiply account currency or end rewards.",
        "Economy",
        {number("multiplier", "Cash multiplier", 3, 1, 5), (duration())},
        {chaos = true, conflicts = {"enemy-payouts"}}
    ),
    action("randomize-tower-sizes", "Randomize Tower Sizes", "Temporarily change tower models and their placement footprints.", "Towers", {
        number("minScale", "Smallest scale", 0.65, 0.5, 5),
        number("maxScale", "Largest scale", 1.5, 0.5, 5),
        (duration()),
    }, {chaos = true, conflicts = {"tower-scale", "tower-layout"}}),
    action(
        "black-hole",
        "Black Hole",
        "Pull in and permanently remove current towers and enemies. No automatic restoration after removal.",
        "Spectacle",
        {number("duration", "Duration (seconds)", 4, 1, 10)},
        {destructive = true, conflicts = {"tower-layout", "enemy-direction", "enemy-spawns"}}
    ),
    action(
        "clone-towers",
        "Clone Towers",
        "Create temporary neighboring tower clones with a hard population cap.",
        "Towers",
        {duration(), number("maxClones", "Maximum clones", 20, 1, 30, true)},
        {chaos = true, conflicts = {"tower-layout"}}
    ),
    action(
        "randomize-animations",
        "Randomize Animations",
        "Give players random approved animations, then restore their normal animation state.",
        "Spectacle",
        {duration(20)},
        {chaos = true, contexts = {"Lobby", "Game"}, conflicts = {"player-animation"}}
    ),
    action("spawn-slop-army", "Spawn Slop Army", "Spawn a capped army one enemy at a time from the current wave at the normal entrance.", "Enemies", {
        number("amount", "Enemy count", 10, 1, 30, true),
        (number("interval", "Spawn interval (seconds)", 0.5, 0.1, 2)),
    }, {repeatable = true, finishOnApply = true, conflicts = {"enemy-spawns"}, lifetime = staggered}),
    action("attribute-all", "Attribute All", "Temporarily apply an enemy attribute. Check the match has towers able to counter it.", "Enemies", {
        select("attribute", "Attribute", {"Hidden", "Flying", "Lead"}, "Hidden"),
        duration(),
        ActionBuilder.toggle("includeFuture", "Include new enemies", true),
    }, {conflicts = {"enemy-attribute"}}),
    action(
        "loop-wave",
        "Loop Wave",
        "Hold and repeat the current authored wave, then resume. Completion rewards are not repeated.",
        "Enemies",
        {number("duration", "Duration (seconds)", 30, 5, 60)},
        {conflicts = {"wave-loop", "enemy-spawns"}}
    ),
    action(
        "blackout",
        "Blackout",
        "Darken the map temporarily and give each player a nearby light.",
        "Spectacle",
        {duration()},
        {chaos = true, contexts = {"Lobby", "Game"}, conflicts = {"lighting"}}
    ),
    action("tower-rain", "Tower Rain", "Land comets that create random towers from the full catalog except Mecha Base, at valid positions.", "Towers", {
        number("amount", "Tower count", 5, 1, 20, true),
        number("maxLevel", "Maximum level", 5, 0, 5, true),
        (number("interval", "Seconds between comets", 0.6, 0.3, 3)),
    }, {chaos = true, conflicts = {"tower-layout"}, lifetime = staggered}),
    action(
        "chaos",
        "Chaos",
        "Run ten bounded random actions. Permanent destruction, enemy challenges, and wave loops are excluded.",
        "Spectacle",
        {},
        {finishOnApply = true}
    ),
    action("set-music", "Play Music", "Play a game music track temporarily, restoring the previous track when it ends. Cutscene cues and win/lose jingles are not listed.", "Presentation", {
        select("music", "Track", musicOptions(), "2025 Halloween Live Event", "music"),
        (duration(60)),
    }, {chaos = true, contexts = {"Lobby", "Game"}, conflicts = {"music"}}),
    action("add-dialogue", "Show Dialogue", "Show a filtered line immediately, even when dialogue is disabled. Optionally play a voice clip.", "Presentation", {
        ActionBuilder.text("speaker", "Speaker", "Host", 40),
        ActionBuilder.text("text", "Dialogue", "Something is happening...", 180),
        number("soundId", "Sound ID (0 for none)", 0, 0, 9007199254740991, true),
        (number("wait", "Display time (seconds)", 5, 1, 15)),
    }, {
        contexts = {"Lobby", "Game"},
        conflicts = {"dialogue"},
        lifetime = function(a1) -- Line: 307
            return a1.wait
        end,
    }),
    action(
        "add-cash",
        "Give Match Cash",
        "Give every participating player a fixed amount of match cash once.",
        "Economy",
        {number("amount", "Cash per player", 1000, 1, 10000, true)},
        {chaos = true, lifetime = ActionBuilder.seconds(10)}
    ),
    action(
        "rain-gubbies",
        "Gubby",
        "Rain Gubbies with their own music and flashing lights circling the map. Each Gubby restores five base health when collected.",
        "Spectacle",
        {duration()},
        {conflicts = {"item-rain", "music"}}
    ),
    (action(
        "kreek-hat",
        "KreekHat",
        "Put a Kreek hat on every enemy that spawns while this runs. Enemies already wearing one keep it after Stop.",
        "Spectacle",
        {duration()},
        {conflicts = {"kreek-hat"}}
    )),
}
for i, j in require(script.Parent.LegacyDefinitions) do
    table.insert(v1, j)
end
local u536 = {}
for k, n in v1 do
    assert(not u536[n.id], (("Live event action \"%*\" is defined twice"):format(n.id)))
    u536[n.id] = n
end
return {
    SchemaVersion = 1,
    MaxDuration = 1800,
    MaxResults = 100,
    MaxManualActions = 64,
    ManualDeliveryWindow = 60,
    MaxDefinitionBytes = 24000,
    Actions = v1,
    ById = u536,
    ExcludedMusic = u63,
    defaults = function(a1) -- Line: 362 -- upvalues: u536 (val) -- types: a1: string
        local v1 = {}
        local v2 = u536[a1]
        if v2 then
            for i, j in v2.fields do
                v1[j.key] = j.default
            end
        end
        return v1
    end,
}