-- Script path: ReplicatedStorage.Content.Tower.Biologist.Stats.BiologistTooltips
-- Decompile time: 1.97 ms

return {
    newSlotTooltip = function() -- Line: 3
        return {
            ButtonText = "New Flower Slot <font color=\"rgb(255,185,0)\"><b>Unlocked</b></font>",
            Content = {{Text = "Unlock a new unit queue."}},
        }
    end,
    plantTooltip = function(a1) -- Line: 55 -- types: a1: table
        local v1 = {}
        if a1.leadDet then
            table.insert(v1, {Text = "Lead Detection"})
        end
        if a1.hiddenDet then
            table.insert(v1, {Text = "Hidden Detection"})
        end
        if a1.flyingDet then
            table.insert(v1, {Text = "Flying Detection"})
        end
        if a1.damage then
            table.insert(v1, {
                Text = ("Damage: %*%*"):format(a1.prevDmg and ("%* → "):format(a1.prevDmg) or "", a1.damage),
            })
        end
        if a1.range then
            table.insert(v1, {
                Text = ("Range: %*%*"):format(a1.prevRange and ("%* → "):format(a1.prevRange) or "", a1.range),
            })
        end
        if a1.cooldown then
            table.insert(v1, {
                Text = ("Cooldown: %*%*s"):format(a1.prevCooldown and ("%*s → "):format(a1.prevCooldown) or "", a1.cooldown),
            })
        end
        if a1.health then
            table.insert(v1, {
                Text = ("Health: %*%*"):format(a1.prevHealth and ("%* → "):format(a1.prevHealth) or "", a1.health),
            })
        end
        if a1.radius then
            table.insert(v1, {
                Text = ("Explosion Radius: %*%*"):format(a1.prevRadius and ("%* → "):format(a1.prevRadius) or "", a1.radius),
            })
        end
        if a1.psnDamage then
            table.insert(v1, {
                Text = ("Poison Damage: %*%*"):format(a1.prevPsnDmg and ("%* → "):format(a1.prevPsnDmg) or "", a1.psnDamage),
            })
        end
        if a1.psnTick then
            table.insert(v1, {
                Text = ("Tick Rate: %*%*s"):format(a1.prevPsnTick and ("%*s → "):format(a1.prevPsnTick) or "", a1.psnTick),
            })
        end
        if a1.psnLen then
            table.insert(v1, {
                Text = ("Poison Length: %*%*s"):format(a1.prevPsnLen and ("%*s → "):format(a1.prevPsnLen) or "", a1.psnLen),
            })
        end
        if a1.slowPerc then
            table.insert(v1, {
                Text = ("Slow: %*%*%%"):format(a1.prevSlowPerc and ("%*%% → "):format(a1.prevSlowPerc) or "", a1.slowPerc),
            })
        end
        if a1.confDur then
            table.insert(v1, {
                Text = ("Confusion Duration: %*%*s"):format(a1.prevConfDur and ("%*s → "):format(a1.prevConfDur) or "", a1.confDur),
            })
        end
        return {
            ButtonText = ("%* %*"):format(
                a1.name,
                if not a1.isUpgrade then "<b>Unlocked</b></font>" else "<font color=\"rgb(255,185,0)\"><b>Upgrade</b></font>"
            ),
            Header = a1.name,
            Content = v1,
        }
    end,
}