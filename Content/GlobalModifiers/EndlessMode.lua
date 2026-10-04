-- Script path: ReplicatedStorage.Content.GlobalModifiers.EndlessMode
-- Decompile time: 0.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
return {
    displayName = "Endless Mode",
    description = "Enemies will continuously spawn",
    icon = 93424071036499,
    sandboxDisabled = true,
    onEnableServer = function(a1, a2, a3, a4, a5) -- Line: 12 -- upvalues: ServerStorage (val)
        a2:Mark(((require(ServerStorage.Server.Services.Game.EndlessService)).start(a4, a5)))
    end,
}