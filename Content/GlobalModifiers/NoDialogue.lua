-- Script path: ReplicatedStorage.Content.GlobalModifiers.NoDialogue
-- Decompile time: 0.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    onEnableServer = function(a1, a2, a3) -- Line: 7 -- upvalues: LegacyMiddleware (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.OnDialogueOverride, LegacyMiddleware.Boundedness.Inbound, function(a1, a2) -- Line: 12
            return {}
        end))
    end,
}