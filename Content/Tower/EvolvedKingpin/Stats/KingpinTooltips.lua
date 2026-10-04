-- Script path: ReplicatedStorage.Content.Tower.EvolvedKingpin.Stats.KingpinTooltips
-- Decompile time: 2.80 ms

local u0 = {}

local function highlight(a1) -- Line: 3 -- types: a1: string
    return (("<font color=\"rgb(255,185,0)\"><b>%*</b></font>"):format(a1))
end

local function line(a1) -- Line: 7 -- types: a1: string
    return {Text = a1}
end

local function formatPercent(a1) -- Line: 13 -- types: a1: number
    local v1 = a1 * 100
    if v1 % 1 == 0 then
        return (("%*%%"):format(v1))
    end
    return (("%*%%"):format(v1))
end

local u4 = {
    KingpinHenchman = {
        displayName = "Lackey",
        description = "Just a regular dude that shoots enemies with a submachine gun at a medium range.",
        spawnTime = 40,
    },
    MoneyRunner = {
        displayName = "Money Runner",
        description = "Keep the change! Runs down the path and awards cash on death.",
        spawnTime = 45,
    },
    KingpinBouncer = {
        displayName = "Bouncer",
        description = "Hits enemies with a bat at close range. His favorite three words are tussle, thwart, and thrash.",
        spawnTime = 40,
    },
    KingpinHitman = {
        displayName = "Contractor",
        description = "Aims her sniper rifle before firing a powerful shot; no witnesses.",
        spawnTime = 80,
    },
}
local u9 = {Gunner = "KingpinHenchman", Bouncer = "KingpinBouncer", Hitman = "KingpinHitman"}

local function getUnitData(a1) -- Line: 51 -- upvalues: u9 (val), u4 (val) -- types: a1: string
    return u4[u9[a1] or a1] or {displayName = a1, description = a1}
end

function u0.unitSelection(a1) -- Line: 61
    local v1 = {{Text = a1.description}}
    if a1.spawnTime then
        table.insert(v1, {Text = ("Spawn Time: %*s"):format(a1.spawnTime)})
    end
    return {Subject = "Unit", Header = a1.name, Content = v1}
end

function u0.unlockNewUnitQueue(a1) -- Line: 77 -- types: a1: number?
    local v1 = {}
    if not a1 then
        table.insert(v1, {Text = "Unlocks another unit queue."})
    else
        table.insert(v1, {Text = ("Unlocks %* unit queues."):format(a1)})
    end
    return {
        Header = "Unit Queue",
        ButtonText = ("Unlock %*"):format("<font color=\"rgb(255,185,0)\"><b>Unit Queue</b></font>"),
        Content = v1,
    }
end

function u0.unlockUnit(a1, a2) -- Line: 92 -- upvalues: u9 (val), u4 (val) -- types: a1: string, a2: number?
    local v1 = u4[u9[a1] or a1] or {displayName = a1, description = a1}
    local v2 = {{Text = "Adds this unit to the Kingpin's selectable unit queues."}}
    local spawnTime = a2 or v1.spawnTime
    if spawnTime then
        table.insert(v2, {Text = ("Spawn Time: %*s"):format(spawnTime)})
    end
    return {
        ButtonText = ("Unlock %*"):format((("<font color=\"rgb(255,185,0)\"><b>%*</b></font>"):format(v1.displayName))),
        Header = v1.displayName,
        Content = v2,
    }
end

function u0.upgradeUnit(a1, a2, a3, a4) -- Line: 110
    -- upvalues: u9 (val), u4 (val)
    local v1 = u4[u9[a1] or a1] or {displayName = a1, description = a1}
    local v2 = {{Text = ("%*: Level %* -> %*"):format(v1.displayName, a2, a3)}}
    local spawnTime = a4 or v1.spawnTime
    if spawnTime then
        table.insert(v2, {Text = ("Spawn Time: %*s"):format(spawnTime)})
    end
    return {
        Header = "Unit Upgrade",
        ButtonText = ("Upgrade %*"):format((("<font color=\"rgb(255,185,0)\"><b>%*</b></font>"):format(v1.displayName))),
        Content = v2,
    }
end

function u0.upgradeSpawnTime(a1, a2) -- Line: 133 -- upvalues: u9 (val), u4 (val) -- types: a1: string, a2: number
    local v1 = u4[u9[a1] or a1] or {displayName = a1, description = a1}
    return {
        Header = "Spawn Time",
        ButtonText = ("Upgrade %*"):format((("<font color=\"rgb(255,185,0)\"><b>%*</b></font>"):format(v1.displayName))),
        Content = {{Text = ("%*: Spawn Time -> %*s"):format(v1.displayName, a2)}},
    }
end

function u0.unlockBounty(a1, a2) -- Line: 144 -- types: a1: number, a2: number?
    local v1 = {}
    local v2 = a1 * 100
    local v3 = {
        Text = ("Reward: %* of enemy cash reward"):format(if v2 % 1 ~= 0 then ("%*%%"):format(v2) else ("%*%%"):format(v2)),
    }
    v1[1] = {Text = "Marks an enemy for a cash reward when it dies."}
    v1[2] = v3
    if a2 then
        table.insert(v1, {Text = ("Cooldown: %*s"):format(a2)})
    end
    return {
        Header = "Ability",
        ButtonText = ("Unlock %*"):format("<font color=\"rgb(255,185,0)\"><b>Bounty</b></font>"),
        Content = v1,
    }
end

function u0.upgradeBounty(a1, a2) -- Line: 161 -- upvalues: u0 (val) -- types: a1: number, a2: number?
    local v1 = u0.unlockBounty(a1, a2)
    v1.ButtonText = ("Upgrade %*"):format("<font color=\"rgb(255,185,0)\"><b>Bounty</b></font>")
    return v1
end

function u0.unlockBodyGuard(a1, a2, a3) -- Line: 167 -- types: a1: number, a2: number, a3: number
    return {
        Header = "Passive",
        ButtonText = ("Unlock %*"):format("<font color=\"rgb(255,185,0)\"><b>Body Guard</b></font>"),
        Content = {
            {Text = "Dealing damage fills a meter that summons a nearby Body Guard."},
            {Text = ("Body Guard Level: %*"):format(a1)},
            {Text = ("Damage Meter: %*"):format(a2)},
            {Text = ("Unit Limit: %*"):format(a3)},
        },
    }
end

function u0.upgradeBodyGuard(a1, a2, a3) -- Line: 180 -- upvalues: u0 (val) -- types: a1: number, a2: number, a3: number
    local v1 = u0.unlockBodyGuard(a1, a2, a3)
    v1.ButtonText = ("Upgrade %*"):format("<font color=\"rgb(255,185,0)\"><b>Body Guard</b></font>")
    return v1
end

u0.UnitSelection = {
    Gunner = u0.unitSelection({
        name = (u4[u9.KingpinHenchman or "KingpinHenchman"] or {displayName = "KingpinHenchman", description = "KingpinHenchman"}).displayName,
        description = (u4[u9.KingpinHenchman or "KingpinHenchman"] or {displayName = "KingpinHenchman", description = "KingpinHenchman"}).description,
        spawnTime = (u4[u9.KingpinHenchman or "KingpinHenchman"] or {displayName = "KingpinHenchman", description = "KingpinHenchman"}).spawnTime,
    }),
    MoneyRunner = u0.unitSelection({
        name = (u4[u9.MoneyRunner or "MoneyRunner"] or {displayName = "MoneyRunner", description = "MoneyRunner"}).displayName,
        description = (u4[u9.MoneyRunner or "MoneyRunner"] or {displayName = "MoneyRunner", description = "MoneyRunner"}).description,
        spawnTime = (u4[u9.MoneyRunner or "MoneyRunner"] or {displayName = "MoneyRunner", description = "MoneyRunner"}).spawnTime,
    }),
    Bouncer = u0.unitSelection({
        name = (u4[u9.KingpinBouncer or "KingpinBouncer"] or {displayName = "KingpinBouncer", description = "KingpinBouncer"}).displayName,
        description = (u4[u9.KingpinBouncer or "KingpinBouncer"] or {displayName = "KingpinBouncer", description = "KingpinBouncer"}).description,
        spawnTime = (u4[u9.KingpinBouncer or "KingpinBouncer"] or {displayName = "KingpinBouncer", description = "KingpinBouncer"}).spawnTime,
    }),
    Hitman = u0.unitSelection({
        name = (u4[u9.KingpinHitman or "KingpinHitman"] or {displayName = "KingpinHitman", description = "KingpinHitman"}).displayName,
        description = (u4[u9.KingpinHitman or "KingpinHitman"] or {displayName = "KingpinHitman", description = "KingpinHitman"}).description,
        spawnTime = (u4[u9.KingpinHitman or "KingpinHitman"] or {displayName = "KingpinHitman", description = "KingpinHitman"}).spawnTime,
    }),
}
return u0