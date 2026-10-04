-- Script path: ReplicatedStorage.Content.Challenges.PollutedWasteland
-- Decompile time: 0.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
return {
    disabled = true,
    title = "Polluted Wasteland II",
    description = "Strange readings have been detected in the wasteland. Investigate reports of mutated enemies!",
    gameModifier = (require(ReplicatedStorage.Shared.Modules.Enum)).GameModifier.PollutedWasteland,
    maps = {"Polluted Wasteland II"},
    onServerLoad = function() -- Line: 12 -- upvalues: ServerStorage (val)
        return require(ServerStorage.Server.Services.Game.GlobalModifierService).compose().addModifier("PollutedWasteland").addModifier(
            "LimitHealth",
            100
        ).addModifier(
            "Mutation",
            0.05,
            0.075
        ).addModifier("NoDialogue").complete()
    end,
    overwriteRewards = {
        Badges = {
            [2127670181] = function(a1, a2) -- Line: 26
                return a2
            end,
            [2917934873985054] = function(a1, a2) -- Line: 29
                return a2
            end,
        },
    },
}