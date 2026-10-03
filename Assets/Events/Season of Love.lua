-- Script path: ReplicatedStorage.Assets.Events.Season of Love
-- Decompile time: 2.84 ms

shared()
local Session = require("Network").Channel("Session")
return {
    {
        Title = "Valentines Scout",
        Image = 8808640218,
        Value = 100,
        Function = function(a1) -- Line: 11 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Scout then
                        return
                    end
                    table.insert(Skins.Scout, {Name = "Valentines"})
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
            if not Data.Inventory.Troops.Scout then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Scout")
            end
            if Data.Inventory.Skins.Scout.Valentines then
                return false, string.format("You already own the %s skin!", "Valentines")
            end
            return true
        end,
    },
    {
        Title = "Valentines Soldier",
        Image = 8808640816,
        Value = 200,
        Function = function(a1) -- Line: 54 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Soldier then
                        return
                    end
                    table.insert(Skins.Soldier, {Name = "Valentines"})
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
            if Data.Inventory.Skins.Soldier.Valentines then
                return false, string.format("You already own the %s skin!", "Valentines")
            end
            return true
        end,
    },
    {
        Title = "Chocolatier Militant",
        Image = 8808641341,
        Value = 300,
        Function = function(a1) -- Line: 97 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Militant then
                        return
                    end
                    table.insert(Skins.Militant, {Name = "Chocolatier"})
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
            if not Data.Inventory.Troops.Militant then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Militant")
            end
            if Data.Inventory.Skins.Militant.Chocolatier then
                return false, string.format("You already own the %s skin!", "Chocolatier")
            end
            return true
        end,
    },
    {
        Title = "Cupid Crook Boss",
        Image = 8808641872,
        Value = 350,
        Function = function(a1) -- Line: 140 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins["Crook Boss"] then
                        return
                    end
                    table.insert(Skins["Crook Boss"], {Name = "Cupid"})
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
            if not Data.Inventory.Troops["Crook Boss"] then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Crook Boss")
            end
            if Data.Inventory.Skins["Crook Boss"].Cupid then
                return false, string.format("You already own the %s skin!", "Cupid")
            end
            return true
        end,
    },
    {
        Title = "Valentines Cowboy",
        Image = 8808769324,
        Value = 475,
        Function = function(a1) -- Line: 183 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Cowboy then
                        return
                    end
                    table.insert(Skins.Cowboy, {Name = "Valentines"})
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
            if not Data.Inventory.Troops.Cowboy then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Cowboy")
            end
            if Data.Inventory.Skins.Cowboy.Valentines then
                return false, string.format("You already own the %s skin!", "Valentines")
            end
            return true
        end,
    },
    {
        Title = "Cupid Accelerator",
        Image = 8808642288,
        Value = 600,
        Function = function(a1) -- Line: 226 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Accelerator then
                        return
                    end
                    table.insert(Skins.Accelerator, {Name = "Cupid"})
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
            if not Data.Inventory.Troops.Accelerator then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Accelerator")
            end
            if Data.Inventory.Skins.Accelerator.Cupid then
                return false, string.format("You already own the %s skin!", "Cupid")
            end
            return true
        end,
    },
}