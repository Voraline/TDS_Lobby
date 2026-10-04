-- Script path: ReplicatedStorage.Content.Tower.Hacker.Stats.HackerTooltips
-- Decompile time: 0.85 ms

return {
    unlockAbility = function(a1) -- Line: 9 -- types: a1: table
        local v1 = {}
        if a1.range then
            table.insert(v1, {Text = ("Range: %*"):format(a1.range)})
        end
        if a1.damage then
            table.insert(v1, {Text = ("Damage: %*"):format(a1.damage)})
        end
        if a1.cooldown then
            table.insert(v1, {Text = ("Cooldown: %*s"):format(a1.cooldown)})
        end
        return {ButtonText = "Bee <b>Swarm</b> Grenade", Content = v1}
    end,
    statUpgrades = function(a1) -- Line: 42 -- types: a1: table
        local v1 = {}
        if a1.range then
            table.insert(v1, {Text = ("Range: %*"):format(a1.range)})
        end
        if a1.damage then
            table.insert(v1, {Text = ("Damage: %*"):format(a1.damage)})
        end
        if a1.cooldown then
            table.insert(v1, {Text = ("Cooldown: %*s"):format(a1.cooldown)})
        end
        return {ButtonText = "<b>Stats</b>", Content = v1}
    end,
    beeDebuffTooltip = function(a1) -- Line: 75 -- types: a1: table
        local v1 = {}
        if a1.damage then
            table.insert(v1, {Text = ("Damage: %*"):format(a1.damage)})
        end
        if a1.tickRate then
            table.insert(v1, {Text = ("Tick Rate: %*"):format(a1.tickRate)})
        end
        if a1.duration then
            table.insert(v1, {Text = ("Duration: %*"):format(a1.duration)})
        end
        return {ButtonText = "Bee Debuff <b>Stats</b>", Header = "Bee Debuff", Content = v1}
    end,
}