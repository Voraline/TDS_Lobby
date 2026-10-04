-- Script path: ReplicatedStorage.Assets.Events.End of Summer
-- Decompile time: 3.44 ms

shared()
local Session = require("Network").Channel("Session")
return {
    {
        Title = "Beach Scout",
        Image = 10488006471,
        Value = 225,
        Function = function(a1) -- Line: 11 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Scout then
                        return
                    end
                    table.insert(Skins.Scout, {Name = "Beach"})
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
            if Data.Inventory.Skins.Scout.Beach then
                return false, string.format("You already own the %s skin!", "Beach")
            end
            return true
        end,
    },
    {
        Title = "Beach Militant",
        Image = 10488004920,
        Value = 500,
        Function = function(a1) -- Line: 54 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Militant then
                        return
                    end
                    table.insert(Skins.Militant, {Name = "Beach"})
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
            if not Data.Inventory.Troops.Militant then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Militant")
            end
            if Data.Inventory.Skins.Militant.Beach then
                return false, string.format("You already own the %s skin!", "Beach")
            end
            return true
        end,
    },
    {
        Title = "BBQ Pyromancer",
        Image = 10488003451,
        Value = 750,
        Function = function(a1) -- Line: 97 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Pyromancer then
                        return
                    end
                    table.insert(Skins.Pyromancer, {Name = "Barbecue"})
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
            if not Data.Inventory.Troops.Pyromancer then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Pyromancer")
            end
            if Data.Inventory.Skins.Pyromancer.Barbecue then
                return false, string.format("You already own the %s skin!", "Barbecue")
            end
            return true
        end,
    },
    {
        Title = "Beach Minigunner",
        Image = 10488005975,
        Value = 1050,
        Function = function(a1) -- Line: 140 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Minigunner then
                        return
                    end
                    table.insert(Skins.Minigunner, {Name = "Beach"})
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
            if not Data.Inventory.Troops.Minigunner then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Minigunner")
            end
            if Data.Inventory.Skins.Minigunner.Beach then
                return false, string.format("You already own the %s skin!", "Beach")
            end
            return true
        end,
    },
    {
        Title = "Lifeguard Commander",
        Image = 10488007217,
        Value = 1400,
        Function = function(a1) -- Line: 183 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Commander then
                        return
                    end
                    table.insert(Skins.Commander, {Name = "Lifeguard"})
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
            if not Data.Inventory.Troops.Commander then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Commander")
            end
            if Data.Inventory.Skins.Commander.Lifeguard then
                return false, string.format("You already own the %s skin!", "Lifeguard")
            end
            return true
        end,
    },
}