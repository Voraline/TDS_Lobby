-- Script path: ReplicatedStorage.Content.Tower.Gladiator.Stats.GladiatorToolTips
-- Decompile time: 2.27 ms

local v1 = {}

local function highlight(a1) -- Line: 25 -- types: a1: string
    return (("<font color=\"rgb(255,185,0)\"><b>%*</b></font>"):format(a1))
end

local function line(a1) -- Line: 29 -- types: a1: string
    return {Text = a1}
end

local function seconds(a1) -- Line: 35 -- types: a1: number
    return (("%*s"):format(a1))
end

local function percent(a1) -- Line: 39 -- types: a1: number
    return (("%*%%"):format(a1))
end

function v1.unlockFireAspect(a1) -- Line: 43 -- types: a1: table
    local v1 = a1 or {}
    local v2 = {{Text = "The next successful swing burns each enemy hit."}}
    if v1.burnDamage then
        table.insert(v2, {Text = ("Burn Damage: %*"):format(v1.burnDamage)})
    end
    if v1.burnTick then
        table.insert(v2, {Text = ("Burn Tick Rate: %*"):format((("%*s"):format(v1.burnTick)))})
    end
    if v1.burnTime then
        table.insert(v2, {Text = ("Burn Duration: %*"):format((("%*s"):format(v1.burnTime)))})
    end
    if v1.cooldown then
        table.insert(v2, {Text = ("Cooldown: %*"):format((("%*s"):format(v1.cooldown)))})
    end
    return {
        Header = "Fire Aspect",
        ButtonText = ("Unlocked %*"):format("<font color=\"rgb(255,185,0)\"><b>Fire Aspect</b></font>"),
        Content = v2,
    }
end

function v1.upgradeFireAspect(a1) -- Line: 73 -- types: a1: table
    local v1 = a1 or {}
    local v2 = {}
    if v1.burnDamage then
        table.insert(v2, {
            Text = ("Burn Damage: %*%*"):format(v1.previousBurnDamage and ("%* → "):format(v1.previousBurnDamage) or "", v1.burnDamage),
        })
    end
    if v1.burnTick then
        table.insert(v2, {
            Text = ("Burn Tick Rate: %*%*"):format(
                v1.previousBurnTick and ("%* → "):format((("%*s"):format(v1.previousBurnTick))) or "",
                (("%*s"):format(v1.burnTick))
            ),
        })
    end
    if v1.burnTime then
        table.insert(v2, {
            Text = ("Burn Duration: %*%*"):format(
                v1.previousBurnTime and ("%* → "):format((("%*s"):format(v1.previousBurnTime))) or "",
                (("%*s"):format(v1.burnTime))
            ),
        })
    end
    if v1.cooldown then
        table.insert(v2, {
            Text = ("Cooldown: %*%*"):format(
                v1.previousCooldown and ("%* → "):format((("%*s"):format(v1.previousCooldown))) or "",
                (("%*s"):format(v1.cooldown))
            ),
        })
    end
    return {
        Header = "Fire Aspect",
        ButtonText = ("Upgraded %*"):format("<font color=\"rgb(255,185,0)\"><b>Fire Aspect</b></font>"),
        Content = v2,
    }
end

function v1.unlockWarCry(a1) -- Line: 108 -- types: a1: table
    local v1 = a1 or {}
    local v2 = {{Text = "Boosts Gladiator's attack rate and cleanses non-stun debuffs from himself."}}
    if v1.attackSpeedBuff then
        table.insert(v2, {Text = ("Attack Speed Buff: %*"):format((("%*%%"):format(v1.attackSpeedBuff)))})
    end
    if v1.duration then
        table.insert(v2, {Text = ("Duration: %*"):format((("%*s"):format(v1.duration)))})
    end
    if v1.cooldown then
        table.insert(v2, {Text = ("Ability Cooldown: %*"):format((("%*s"):format(v1.cooldown)))})
    end
    return {
        Header = "War Cry",
        ButtonText = ("Unlocked %*"):format("<font color=\"rgb(255,185,0)\"><b>War Cry</b></font>"),
        Content = v2,
    }
end

function v1.upgradeMaxHits(a1) -- Line: 134 -- types: a1: table
    local v1 = a1.previousMaxHits and ("%* → "):format(a1.previousMaxHits) or ""
    return {
        Header = "Max Hits",
        ButtonText = ("Upgraded %*"):format("<font color=\"rgb(255,185,0)\"><b>Max Hits</b></font>"),
        Content = {{Text = ("Max Hits: %*%*"):format(v1, a1.maxHits)}},
    }
end

return v1