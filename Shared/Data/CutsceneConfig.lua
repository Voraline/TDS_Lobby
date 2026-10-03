-- Script path: ReplicatedStorage.Shared.Data.CutsceneConfig
-- Decompile time: 0.75 ms

local function speaker(a1, a2) -- Line: 8 -- types: a1: string, a2: userdata
    return table.freeze({Name = a1, Color = a2})
end

return table.freeze({
    DefaultSpeakerColor = Color3.fromRGB(255, 255, 255),
    Speaker = table.freeze({
        Commander = table.freeze({Name = "Commander", Color = Color3.fromRGB(58, 81, 209)}),
        Dispatcher = table.freeze({Name = "Dispatcher", Color = Color3.fromRGB(0, 174, 255)}),
        Sniper = table.freeze({Name = "Sniper", Color = Color3.fromRGB(50, 202, 50)}),
        TruckDriver = table.freeze({Name = "Truck Driver", Color = Color3.fromRGB(255, 215, 0)}),
        Demoman = table.freeze({Name = "Demoman", Color = Color3.fromRGB(183, 65, 14)}),
        Hops = table.freeze({Name = "Hops", Color = Color3.fromRGB(0, 100, 0)}),
        ProfessorV = table.freeze({Name = "Professor V", Color = Color3.fromRGB(170, 32, 255)}),
        Soldier = table.freeze({Name = "Soldier", Color = Color3.fromRGB(44, 101, 29)}),
    }),
})