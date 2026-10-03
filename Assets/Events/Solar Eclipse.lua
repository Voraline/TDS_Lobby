-- Script path: ReplicatedStorage.Assets.Events.Solar Eclipse
-- Decompile time: 3.98 ms

shared()
local Session = require("Network").Channel("Session")
return {
    {
        Title = "Eclipse Scout",
        Image = 7972183361,
        Value = 150,
        Function = function(a1) -- Line: 11 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Scout then
                        return
                    end
                    table.insert(Skins.Scout, {Name = "Eclipse"})
                    Session:FireClient(a1.Player, "Update", "Inventory.Skins", Skins)
                    return true
                end
            end
        end,
        Claim = function(a1) -- Line: 32
            local Data = a1.Data
            if not Data then
                return false
            end
            if not Data.Inventory.Troops.Scout then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Scout")
            end
            if Data.Inventory.Skins.Scout.Eclipse then
                return false, string.format("You already own the %s skin!", "Eclipse")
            end
            return true
        end,
    },
    {
        Title = "Torchlight Emote",
        Image = 7990102631,
        Value = 225,
        Function = function(a1) -- Line: 52 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Emotes = Inventory.Emotes
                    if Emotes then
                        Emotes.Torchlight = {Equipped = false}
                        Session:FireClient(a1.Player, "Update", "Inventory.Emotes", Emotes)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "Premium Crate",
        Image = 5798487154,
        Value = 300,
        Function = function(a1) -- Line: 82 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Crates = Inventory.Crates
                    if Crates then
                        if not Crates.Premium then
                            Crates.Premium = 0
                        end
                        Crates.Premium = Crates.Premium + 1
                        Session:FireClient(a1.Player, "Update", "Inventory.Crates", Crates)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "Vampire Slayer Hunter",
        Image = 7972185166,
        Value = 350,
        Function = function(a1) -- Line: 115 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Hunter then
                        return
                    end
                    table.insert(Skins.Hunter, {Name = "Vampire Slayer"})
                    Session:FireClient(a1.Player, "Update", "Inventory.Skins", Skins)
                    return true
                end
            end
        end,
        Claim = function(a1) -- Line: 136
            local Data = a1.Data
            if not Data then
                return false
            end
            if not Data.Inventory.Troops.Hunter then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Hunter")
            end
            if Data.Inventory.Skins.Hunter["Vampire Slayer"] then
                return false, string.format("You already own the %s skin!", "Vampire Slayer")
            end
            return true
        end,
    },
    {
        Title = "Candy Throw Emote",
        Image = 7990102059,
        Value = 450,
        Function = function(a1) -- Line: 156 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Emotes = Inventory.Emotes
                    if Emotes then
                        Emotes["Candy Throw"] = {Equipped = false}
                        Session:FireClient(a1.Player, "Update", "Inventory.Emotes", Emotes)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "Eclipse Mortar",
        Image = 7972187295,
        Value = 500,
        Function = function(a1) -- Line: 186 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Mortar then
                        return
                    end
                    table.insert(Skins.Mortar, {Name = "Eclipse"})
                    Session:FireClient(a1.Player, "Update", "Inventory.Skins", Skins)
                    return true
                end
            end
        end,
        Claim = function(a1) -- Line: 207
            local Data = a1.Data
            if not Data then
                return false
            end
            if not Data.Inventory.Troops.Mortar then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Mortar")
            end
            if Data.Inventory.Skins.Mortar.Eclipse then
                return false, string.format("You already own the %s skin!", "Eclipse")
            end
            return true
        end,
    },
    {
        Title = "Deluxe Crate",
        Image = 5853271555,
        Value = 550,
        Function = function(a1) -- Line: 227 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Crates = Inventory.Crates
                    if Crates then
                        if not Crates.Deluxe then
                            Crates.Deluxe = 0
                        end
                        Crates.Deluxe = Crates.Deluxe + 1
                        Session:FireClient(a1.Player, "Update", "Inventory.Crates", Crates)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "Crusader Minigunner",
        Image = 7972187960,
        Value = 600,
        Function = function(a1) -- Line: 261 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Minigunner then
                        return
                    end
                    table.insert(Skins.Minigunner, {Name = "Crusader"})
                    Session:FireClient(a1.Player, "Update", "Inventory.Skins", Skins)
                    return true
                end
            end
        end,
        Claim = function(a1) -- Line: 282
            local Data = a1.Data
            if not Data then
                return false
            end
            if not Data.Inventory.Troops.Minigunner then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Minigunner")
            end
            if Data.Inventory.Skins.Minigunner.Crusader then
                return false, string.format("You already own the %s skin!", "Crusader")
            end
            return true
        end,
    },
    {
        Title = "Eclipse Ranger",
        Image = 7972189067,
        Value = 650,
        Function = function(a1) -- Line: 302 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Ranger then
                        return
                    end
                    table.insert(Skins.Ranger, {Name = "Eclipse"})
                    Session:FireClient(a1.Player, "Update", "Inventory.Skins", Skins)
                    return true
                end
            end
        end,
        Claim = function(a1) -- Line: 323
            local Data = a1.Data
            if not Data then
                return false
            end
            if not Data.Inventory.Troops.Ranger then
                return false, string.format("You do not own the %s tower yet! Unlock this tower redeeming.", "Ranger")
            end
            if Data.Inventory.Skins.Ranger.Eclipse then
                return false, string.format("You already own the %s skin!", "Eclipse")
            end
            return true
        end,
    },
    {
        Title = "Axe Throw Emote",
        Image = 7990100957,
        Value = 700,
        Function = function(a1) -- Line: 343 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Emotes = Inventory.Emotes
                    if Emotes then
                        Emotes["Axe Throw"] = {Equipped = false}
                        Session:FireClient(a1.Player, "Update", "Inventory.Emotes", Emotes)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "Eclipse Accelerator",
        Image = 7972189846,
        Value = 850,
        Function = function(a1) -- Line: 373 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Accelerator then
                        return
                    end
                    table.insert(Skins.Accelerator, {Name = "Eclipse"})
                    Session:FireClient(a1.Player, "Update", "Inventory.Skins", Skins)
                    return true
                end
            end
        end,
        Claim = function(a1) -- Line: 394
            local Data = a1.Data
            if not Data then
                return false
            end
            if not Data.Inventory.Troops.Accelerator then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Accelerator")
            end
            if Data.Inventory.Skins.Accelerator.Eclipse then
                return false, string.format("You already own the %s skin!", "Eclipse")
            end
            return true
        end,
    },
    {
        Title = "Eclipse Commander",
        Image = 7972188533,
        Value = 900,
        Function = function(a1) -- Line: 414 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Skins = Inventory.Skins
                    if not Skins.Commander then
                        return
                    end
                    table.insert(Skins.Commander, {Name = "Eclipse"})
                    Session:FireClient(a1.Player, "Update", "Inventory.Skins", Skins)
                    return true
                end
            end
        end,
        Claim = function(a1) -- Line: 435
            local Data = a1.Data
            if not Data then
                return false
            end
            if not Data.Inventory.Troops.Commander then
                return false, string.format("You do not own the %s tower yet! Unlock this tower before redeeming.", "Commander")
            end
            if Data.Inventory.Skins.Commander.Eclipse then
                return false, string.format("You already own the %s skin!", "Eclipse")
            end
            return true
        end,
    },
}