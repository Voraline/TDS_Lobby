-- Script path: ReplicatedStorage.Assets.Events.Winter
-- Decompile time: 3.04 ms

shared()
local Session = require("Network").Channel("Session")
return {
    {
        Title = "Basic Crate",
        Image = 5177997959,
        Value = 150,
        Function = function(a1) -- Line: 11 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Crates = Inventory.Crates
                    if Crates then
                        if not Crates.Basic then
                            Crates.Basic = 0
                        end
                        Crates.Basic = Crates.Basic + 1
                        Session:FireClient(a1.Player, "Update", "Inventory.Crates", Crates)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "Frost Crate",
        Image = 6778699919,
        Value = 225,
        Function = function(a1) -- Line: 45 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Crates = Inventory.Crates
                    if Crates then
                        if not Crates.Frost then
                            Crates.Frost = 0
                        end
                        Crates.Frost = Crates.Frost + 1
                        Session:FireClient(a1.Player, "Update", "Inventory.Crates", Crates)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "Frozen Emote",
        Image = 6778801201,
        Value = 300,
        Function = function(a1) -- Line: 79 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Emotes = Inventory.Emotes
                    if Emotes then
                        Emotes.Frozen = {Equipped = false}
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
        Value = 350,
        Function = function(a1) -- Line: 110 -- upvalues: Session (val)
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
        Title = "Frost Crate",
        Image = 6778699919,
        Value = 450,
        Function = function(a1) -- Line: 144 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Crates = Inventory.Crates
                    if Crates then
                        if not Crates.Frost then
                            Crates.Frost = 0
                        end
                        Crates.Frost = Crates.Frost + 1
                        Session:FireClient(a1.Player, "Update", "Inventory.Crates", Crates)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "Raw Dinner Emote",
        Image = 6779086328,
        Value = 500,
        Function = function(a1) -- Line: 178 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Emotes = Inventory.Emotes
                    if Emotes then
                        Emotes["Raw Dinner"] = {Equipped = false}
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
        Value = 550,
        Function = function(a1) -- Line: 209 -- upvalues: Session (val)
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
        Title = "Frost Crate",
        Image = 6778699919,
        Value = 600,
        Function = function(a1) -- Line: 243 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Crates = Inventory.Crates
                    if Crates then
                        if not Crates.Frost then
                            Crates.Frost = 0
                        end
                        Crates.Frost = Crates.Frost + 2
                        Session:FireClient(a1.Player, "Update", "Inventory.Crates", Crates)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "Deluxe Crate",
        Image = 5853271555,
        Value = 650,
        Function = function(a1) -- Line: 277 -- upvalues: Session (val)
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
        Title = "Frost Crates",
        Image = 6778699919,
        Value = 700,
        Function = function(a1) -- Line: 311 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Crates = Inventory.Crates
                    if Crates then
                        if not Crates.Frost then
                            Crates.Frost = 0
                        end
                        Crates.Frost = Crates.Frost + 2
                        Session:FireClient(a1.Player, "Update", "Inventory.Crates", Crates)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "Recliner Emote",
        Image = 6779256928,
        Value = 850,
        Function = function(a1) -- Line: 345 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Emotes = Inventory.Emotes
                    if Emotes then
                        Emotes.Recliner = {Equipped = false}
                        Session:FireClient(a1.Player, "Update", "Inventory.Emotes", Emotes)
                        return true
                    end
                end
            end
        end,
    },
}