-- Script path: ReplicatedStorage.Content.GlobalModifiers.BadTranslation
-- Decompile time: 0.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Translated",
    description = "Questionable translations.",
    icon = 35395285,
    onEnableServer = function(a1, a2, a3) -- Line: 12 -- upvalues: ServerStorage (val), LegacyMiddleware (val)
        local MiddlewareTranslations = require(ServerStorage.Server.Modules.ServerMiddlewareMeta.MiddlewareTranslations)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.OnDialogue, LegacyMiddleware.Boundedness.Inbound, function(a1, a2) -- Line: 21 -- upvalues: MiddlewareTranslations (val)
            local Text
            for k, v in pairs(a2) do
                Text = MiddlewareTranslations.Pirate[v.Text] and MiddlewareTranslations.Pirate[v.Text] or v.Text
                v.Text = Text
            end
            return a2
        end))
    end,
}