-- Script path: ReplicatedStorage.Content.Tower.Gladiator.TowerInformation
-- Decompile time: 1.28 ms

local function fireAspect(a1) -- Line: 12 -- types: a1: table
    return {
        Header = "Fire Aspect",
        Icon = 136428419311228,
        Description = "Passive: Periodically ignites Gladiator's next swing, applying burn to enemies hit.",
        Content = {
            {Text = ("Burn Damage: %*"):format(a1.burnDamage)},
            {Text = ("Burn Tick Rate: %*s"):format(a1.burnTick)},
            {Text = ("Burn Duration: %*s"):format(a1.burnTime)},
            {Text = ("Cooldown: %*s"):format(a1.cooldown)},
        },
    }
end

local function meleeAttack(a1) -- Line: 34 -- types: a1: number
    return {
        Header = "Melee Attack",
        Icon = 136428419311228,
        Description = "Slashes enemies in a cone and parries incoming stuns.",
        Content = {{Text = ("Max Hits: %*"):format(a1)}},
    }
end

local function warCry(a1, a2) -- Line: 47 -- types: a1: number, a2: number
    return {
        Header = "War Cry",
        Icon = 136428419311228,
        Description = "Active: Let out a battle cry to temporarily boost Gladiator's attack speed and cleanse debuffs.",
        Content = {
            {Text = ("Attack Speed Buff: %*%%"):format(a2)},
            {Text = ("Duration: %*s"):format(a1)},
            {Text = "Cooldown: 30s"},
        },
    }
end

return {
    ToolTip = {
        "A melee tower that slashes groups of enemies in a cone and parries incoming stuns.",
        "Later upgrades unlock Fire Aspect, a passive burn attack, and War Cry, an active attack speed boost.",
    },
    [0] = {["Tower Ability"] = {(meleeAttack(2))}},
    {["Tower Ability"] = {(meleeAttack(2))}},
    {["Tower Ability"] = {meleeAttack(2), (warCry(15, 65))}},
    {
        ["Tower Ability"] = {
            meleeAttack(5),
            fireAspect({cooldown = 4, burnDamage = 2, burnTick = 0.3, burnTime = 1.2}),
            (warCry(15, 65)),
        },
    },
    {
        ["Tower Ability"] = {
            meleeAttack(7),
            fireAspect({cooldown = 3, burnDamage = 4, burnTick = 0.3, burnTime = 1.2}),
            (warCry(15, 65)),
        },
    },
    {
        ["Tower Ability"] = {
            meleeAttack(10),
            fireAspect({cooldown = 2, burnDamage = 7, burnTick = 0.15, burnTime = 1.5}),
            (warCry(15, 65)),
        },
    },
}