-- Script path: ReplicatedStorage.Assets.Events.Hunting Season
-- Decompile time: 5.53 ms

shared()
local Session = require("Network").Channel("Session")
return {
    {
        Title = "Ducky Sniper",
        Image = 9378102786,
        Value = 225,
        Function = function(a1) -- Line: 11 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Sniper then
                        return
                    end
                    table.insert(Skins.Sniper, {Name = "Ducky"})
                    Session:FireClient(a1.Player, "Update", "Inventory.Skins", Skins)
                    return true
                end
            end
        end,
        Claim = function(a1) -- Line: 34
            local Data = a1.Data
            if not Data then
                return false
            end
            if not Data.Inventory.Troops.Sniper then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Sniper")
            end
            if Data.Inventory.Skins.Sniper.Ducky then
                return false, string.format("You already own the %s skin!", "Ducky")
            end
            return true
        end,
    },
    {
        Title = "Ducky Soldier",
        Image = 9378103512,
        Value = 500,
        Function = function(a1) -- Line: 54 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Soldier then
                        return
                    end
                    table.insert(Skins.Soldier, {Name = "Ducky"})
                    Session:FireClient(a1.Player, "Update", "Inventory.Skins", Skins)
                    return true
                end
            end
        end,
        Claim = function(a1) -- Line: 77
            local Data = a1.Data
            if not Data then
                return false
            end
            if not Data.Inventory.Troops.Soldier then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Soldier")
            end
            if Data.Inventory.Skins.Soldier.Ducky then
                return false, string.format("You already own the %s skin!", "Ducky")
            end
            return true
        end,
    },
    {
        Title = "Ducky Hunter",
        Image = 9378099553,
        Value = 750,
        Function = function(a1) -- Line: 97 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Hunter then
                        return
                    end
                    table.insert(Skins.Hunter, {Name = "Ducky"})
                    Session:FireClient(a1.Player, "Update", "Inventory.Skins", Skins)
                    return true
                end
            end
        end,
        Claim = function(a1) -- Line: 120
            local Data = a1.Data
            if not Data then
                return false
            end
            if not Data.Inventory.Troops.Hunter then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Hunter")
            end
            if Data.Inventory.Skins.Hunter.Ducky then
                return false, string.format("You already own the %s skin!", "Ducky")
            end
            return true
        end,
    },
    {
        Title = "Ducky Militant",
        Image = 9378136278,
        Value = 1050,
        Function = function(a1) -- Line: 140 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Militant then
                        return
                    end
                    table.insert(Skins.Militant, {Name = "Ducky"})
                    Session:FireClient(a1.Player, "Update", "Inventory.Skins", Skins)
                    return true
                end
            end
        end,
        Claim = function(a1) -- Line: 163
            local Data = a1.Data
            if not Data then
                return false
            end
            if not Data.Inventory.Troops.Militant then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Militant")
            end
            if Data.Inventory.Skins.Militant.Ducky then
                return false, string.format("You already own the %s skin!", "Ducky")
            end
            return true
        end,
    },
    {
        Title = "Ducky Shotgunner",
        Image = 9378102266,
        Value = 1400,
        Function = function(a1) -- Line: 183 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Shotgunner then
                        return
                    end
                    table.insert(Skins.Shotgunner, {Name = "Ducky"})
                    Session:FireClient(a1.Player, "Update", "Inventory.Skins", Skins)
                    return true
                end
            end
        end,
        Claim = function(a1) -- Line: 206
            local Data = a1.Data
            if not Data then
                return false
            end
            if not Data.Inventory.Troops.Shotgunner then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Shotgunner")
            end
            if Data.Inventory.Skins.Shotgunner.Ducky then
                return false, string.format("You already own the %s skin!", "Ducky")
            end
            return true
        end,
    },
    {
        Title = "Ducky Minigunner",
        Image = 9378101436,
        Value = 1750,
        Function = function(a1) -- Line: 226 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Minigunner then
                        return
                    end
                    table.insert(Skins.Minigunner, {Name = "Ducky"})
                    Session:FireClient(a1.Player, "Update", "Inventory.Skins", Skins)
                    return true
                end
            end
        end,
        Claim = function(a1) -- Line: 249
            local Data = a1.Data
            if not Data then
                return false
            end
            if not Data.Inventory.Troops.Minigunner then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Minigunner")
            end
            if Data.Inventory.Skins.Minigunner.Ducky then
                return false, string.format("You already own the %s skin!", "Ducky")
            end
            return true
        end,
    },
    {
        Title = "Ducky Commander",
        Image = 9378098303,
        Value = 2000,
        Function = function(a1) -- Line: 269 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Commander then
                        return
                    end
                    table.insert(Skins.Commander, {Name = "Ducky"})
                    Session:FireClient(a1.Player, "Update", "Inventory.Skins", Skins)
                    return true
                end
            end
        end,
        Claim = function(a1) -- Line: 292
            local Data = a1.Data
            if not Data then
                return false
            end
            if not Data.Inventory.Troops.Commander then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Commander")
            end
            if Data.Inventory.Skins.Commander.Ducky then
                return false, string.format("You already own the %s skin!", "Ducky")
            end
            return true
        end,
    },
    {
        Title = "Ducky Farm",
        Image = 9433442088,
        Value = 2500,
        Function = function(a1) -- Line: 312 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Farm then
                        return
                    end
                    table.insert(Skins.Farm, {Name = "Ducky"})
                    Session:FireClient(a1.Player, "Update", "Inventory.Skins", Skins)
                    return true
                end
            end
        end,
        Claim = function(a1) -- Line: 335
            local Data = a1.Data
            if not Data then
                return false
            end
            if not Data.Inventory.Troops.Farm then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Farm")
            end
            if Data.Inventory.Skins.Farm.Ducky then
                return false, string.format("You already own the %s skin!", "Ducky")
            end
            return true
        end,
    },
    {
        Title = "Ducky Engineer",
        Image = 9433442546,
        Value = 3000,
        Function = function(a1) -- Line: 355 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Engineer then
                        return
                    end
                    table.insert(Skins.Engineer, {Name = "Ducky"})
                    Session:FireClient(a1.Player, "Update", "Inventory.Skins", Skins)
                    return true
                end
            end
        end,
        Claim = function(a1) -- Line: 378
            local Data = a1.Data
            if not Data then
                return false
            end
            if not Data.Inventory.Troops.Engineer then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Engineer")
            end
            if Data.Inventory.Skins.Engineer.Ducky then
                return false, string.format("You already own the %s skin!", "Ducky")
            end
            return true
        end,
    },
}