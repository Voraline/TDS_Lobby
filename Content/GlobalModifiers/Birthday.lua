-- Script path: ReplicatedStorage.Content.GlobalModifiers.Birthday
-- Decompile time: 0.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local u16 = Random.new()
return {
    displayName = "Birthday",
    description = "Confetti.. EVERYWHERE.",
    icon = 10044810289,
    onEnableClient = function(a1, a2, a3) -- Line: 13 -- upvalues: LegacyMiddleware (val), ReplicatedStorage (val), u16 (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 18 -- upvalues: ReplicatedStorage (upval), u16 (upval)
            local v1
            local Misc = ReplicatedStorage.Assets.Effects.Misc
            local Children = Misc.Confetti:GetChildren()
            local Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://5759274072"
            Sound.PlayOnRemove = true
            Sound.PlaybackSpeed = u16:NextNumber(0.8, 1.2)
            Sound.Parent = a2.PrimaryPart
            a2:EquipHat(Misc.PartyHat, true)
            for i, v in ipairs(Children) do
                v1 = v:Clone()
                v1.Parent = a2.Effect.MainAttachment
                table.insert(a2.Particles, v1)
            end
            return a2
        end))
    end,
}