-- Script path: ReplicatedStorage.Shared.Types.GlobalModifierTypes
-- Decompile time: 0.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Maid)
require(script.Parent.PromiseTypes)
require(ReplicatedStorage.Shared.Modules.Signal)
local Typechecker = require(ReplicatedStorage.Shared.Modules.Typechecker)
return {
    check = Typechecker.strictInterface({
        onEnableServer = Typechecker.optional(Typechecker.callback),
        onEnableClient = Typechecker.optional(Typechecker.callback),
        onDisableServer = Typechecker.optional(Typechecker.callback),
        onDisableClient = Typechecker.optional(Typechecker.callback),
        displayName = Typechecker.optional(Typechecker.string),
        description = Typechecker.optional(Typechecker.string),
        icon = Typechecker.optional(Typechecker.number),
        rewardMultiplier = Typechecker.optional(Typechecker.union(Typechecker.number, Typechecker.callback)),
        flavorText = Typechecker.optional(Typechecker.union(Typechecker.string, Typechecker.callback)),
        sandboxDisabled = Typechecker.optional(Typechecker.boolean),
        canToggle = Typechecker.optional(Typechecker.boolean),
    }),
}