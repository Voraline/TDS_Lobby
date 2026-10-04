-- Script path: ReplicatedStorage.Assets.Events.Halloween
-- Decompile time: 4.30 ms

shared()
local Session = require("Network").Channel("Session")
return {
    {
        Title = "Pumpkin Crate",
        Image = 5902698900,
        Value = 100,
        Function = function(a1) -- Line: 11 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Crates = Inventory.Crates
                    if Crates then
                        if not Crates.Pumpkin then
                            Crates.Pumpkin = 0
                        end
                        Crates.Pumpkin = Crates.Pumpkin + 1
                        Session:FireClient(a1.Player, "Update", "Inventory.Crates", Crates)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "Pumpkin Crate",
        Image = 5902698900,
        Value = 150,
        Function = function(a1) -- Line: 44 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Crates = Inventory.Crates
                    if Crates then
                        if not Crates.Pumpkin then
                            Crates.Pumpkin = 0
                        end
                        Crates.Pumpkin = Crates.Pumpkin + 1
                        Session:FireClient(a1.Player, "Update", "Inventory.Crates", Crates)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "Coffin Emote",
        Image = 5900548032,
        Value = 225,
        Function = function(a1) -- Line: 77 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Emotes = Inventory.Emotes
                    if Emotes then
                        Emotes.Coffin = {Equipped = false}
                        Session:FireClient(a1.Player, "Update", "Inventory.Emotes", Emotes)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "Spooky Crate",
        Image = 5797457085,
        Value = 260,
        Function = function(a1) -- Line: 108 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Crates = Inventory.Crates
                    if Crates then
                        if not Crates.Spooky then
                            Crates.Spooky = 0
                        end
                        Crates.Spooky = Crates.Spooky + 1
                        Session:FireClient(a1.Player, "Update", "Inventory.Crates", Crates)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "Pumpkin Crate",
        Image = 5902698900,
        Value = 300,
        Function = function(a1) -- Line: 141 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Crates = Inventory.Crates
                    if Crates then
                        if not Crates.Pumpkin then
                            Crates.Pumpkin = 0
                        end
                        Crates.Pumpkin = Crates.Pumpkin + 1
                        Session:FireClient(a1.Player, "Update", "Inventory.Crates", Crates)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "Spooky Crate",
        Image = 5797457085,
        Value = 350,
        Function = function(a1) -- Line: 174 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Crates = Inventory.Crates
                    if Crates then
                        if not Crates.Spooky then
                            Crates.Spooky = 0
                        end
                        Crates.Spooky = Crates.Spooky + 1
                        Session:FireClient(a1.Player, "Update", "Inventory.Crates", Crates)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "Demon Swing",
        Image = 5900547542,
        Value = 450,
        Function = function(a1) -- Line: 207 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Emotes = Inventory.Emotes
                    if Emotes then
                        Emotes["Demon Swing"] = {Equipped = false}
                        Session:FireClient(a1.Player, "Update", "Inventory.Emotes", Emotes)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "2 Pumpkin Crates",
        Image = 5902698900,
        Value = 500,
        Function = function(a1) -- Line: 238 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Crates = Inventory.Crates
                    if Crates then
                        if not Crates.Pumpkin then
                            Crates.Pumpkin = 0
                        end
                        Crates.Pumpkin = Crates.Pumpkin + 2
                        Session:FireClient(a1.Player, "Update", "Inventory.Crates", Crates)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "2 Spooky Crates",
        Image = 5797457085,
        Value = 550,
        Function = function(a1) -- Line: 271 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Crates = Inventory.Crates
                    if Crates then
                        if not Crates.Spooky then
                            Crates.Spooky = 0
                        end
                        Crates.Spooky = Crates.Spooky + 2
                        Session:FireClient(a1.Player, "Update", "Inventory.Crates", Crates)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "Couldron",
        Image = 5900547842,
        Value = 650,
        Function = function(a1) -- Line: 304 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Emotes = Inventory.Emotes
                    if Emotes then
                        Emotes.Couldron = {Equipped = false}
                        Session:FireClient(a1.Player, "Update", "Inventory.Emotes", Emotes)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "2 Spooky Crates",
        Image = 5797457085,
        Value = 700,
        Function = function(a1) -- Line: 335 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Crates = Inventory.Crates
                    if Crates then
                        if not Crates.Spooky then
                            Crates.Spooky = 0
                        end
                        Crates.Spooky = Crates.Spooky + 2
                        Session:FireClient(a1.Player, "Update", "Inventory.Crates", Crates)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "3 Spooky Crates",
        Image = 5797457085,
        Value = 850,
        Function = function(a1) -- Line: 368 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Crates = Inventory.Crates
                    if Crates then
                        if not Crates.Spooky then
                            Crates.Spooky = 0
                        end
                        Crates.Spooky = Crates.Spooky + 3
                        Session:FireClient(a1.Player, "Update", "Inventory.Crates", Crates)
                        return true
                    end
                end
            end
        end,
    },
    {
        Title = "4 Spooky Crates",
        Image = 5797457085,
        Value = 1100,
        Function = function(a1) -- Line: 401 -- upvalues: Session (val)
            local Data = a1.Data
            if Data then
                local Inventory = Data.Inventory
                if Inventory then
                    local Crates = Inventory.Crates
                    if Crates then
                        if not Crates.Spooky then
                            Crates.Spooky = 0
                        end
                        Crates.Spooky = Crates.Spooky + 4
                        Session:FireClient(a1.Player, "Update", "Inventory.Crates", Crates)
                        return true
                    end
                end
            end
        end,
    },
}