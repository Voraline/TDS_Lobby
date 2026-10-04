-- Script path: ReplicatedStorage.Content.Challenges.PizzaParty
-- Decompile time: 0.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
return {
    disabled = true,
    title = "Pizza Party",
    description = "Welcome to Wox's Pizza Party! Surely nothing could go wrong...",
    gameModifier = Enum.GameModifier.PizzaParty,
    waveMusic = {"Party Time", [40] = "Pizza Party"},
    maps = {"Pizza Party"},
    onServerLoad = function() -- Line: 17 -- upvalues: ServerStorage (val), GameState (val)
        local Blood = require(ServerStorage.Server.Services.Game.GlobalModifierService).compose().addModifier("PizzaParty", 0.6).addModifier(
            "Mutation",
            0.06,
            0.02
        ).addModifier(
            "LimitHealth",
            200
        ).addModifier("NoDialogue").addModifier("Blood")
        if GameState.GameMode ~= "Sandbox" then
            Blood.addModifier("LostSouls")
        end
        return Blood.complete()
    end,
}