-- Script path: ReplicatedStorage.Content.Challenges.Badlands
-- Decompile time: 0.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
return {
    disabled = true,
    title = "Badlands II",
    description = "Face off against the Gunslinger and his gang of desperados in the Badlands!",
    gameModifier = (require(ReplicatedStorage.Shared.Modules.Enum)).GameModifier.BadlandsEnemies,
    waveMusic = {"Badlands", [40] = "Saloon"},
    maps = {"Badlands II"},
    onServerLoad = function() -- Line: 16 -- upvalues: ServerStorage (val)
        return require(ServerStorage.Server.Services.Game.GlobalModifierService).compose().addModifier("BadlandsEnemies").addModifier("Cowboy").addModifier(
            "LimitHealth",
            200
        ).addModifier("AllPaths").addModifier(
            "Mutation",
            0.05,
            0.04
        ).addModifier("NoDialogue").complete()
    end,
    overwriteRewards = {
        Badges = {
            [2128794382] = function(a1, a2) -- Line: 31
                return a2
            end,
            [2128794398] = function(a1, a2, a3) -- Line: 34
                return a2 and a3.duration <= 960
            end,
        },
    },
}