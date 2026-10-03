-- Script path: ReplicatedStorage.Content.Tower.Assassin.Stats.AssassinTooltips
-- Decompile time: 1.14 ms

return {
    whirlwind = function(a1) -- Line: 3 -- types: a1: table
        local v1 = math.ceil(a1.baseDamage * a1.damageMult)
        local prevBaseDamage = a1.prevBaseDamage and math.ceil(a1.prevBaseDamage * a1.damageMult)
        local v2 = {
            Header = "Whirlwind Slash",
            ButtonText = ("%*Whirlwind Slash"):format(if not a1.unlock then "" else "Unlock"),
        }
        v2.Content = {
            {Text = "Triggers on every 3rd slash"},
            {
                Text = ("Damage: %*%*"):format(prevBaseDamage and ("%* → "):format(prevBaseDamage) or "", v1),
            },
            {
                Text = ("Range: %*%*"):format(a1.prevRange and ("%* → "):format(a1.prevRange) or "", a1.range),
            },
        }
        return v2
    end,
    knives = function(a1) -- Line: 34 -- types: a1: table
        local v1 = {
            Header = "Fan of Knives",
            ButtonText = ("%*Fan of Knives"):format(if not a1.unlock then "" else "Unlock "),
        }
        v1.Content = {
            {Text = ("Triggers on every %* damage dealt."):format(a1.damageRequirement)},
            {
                Text = ("Knife damage: %*%*"):format(a1.prevDamage and ("%* → "):format(a1.prevDamage) or "", a1.damage),
            },
            {
                Text = ("Range: %*%*"):format(a1.prevRange and ("%* → "):format(a1.prevRange) or "", a1.range),
            },
            {
                Text = ("Pierce: %*%*"):format(a1.prevPierce and ("%* → "):format(a1.prevPierce) or "", a1.pierce),
            },
        }
        return v1
    end,
}