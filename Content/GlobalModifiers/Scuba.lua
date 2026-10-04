-- Script path: ReplicatedStorage.Content.GlobalModifiers.Scuba
-- Decompile time: 0.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local Misc = ReplicatedStorage.Assets.Effects.Misc
local u19 = Random.new()
return {
    displayName = "Scuba Gear",
    description = "In the depths of the ocean.",
    icon = 10119865337,
    onEnableClient = function(a1, a2, a3) -- Line: 15 -- upvalues: LegacyMiddleware (val), Misc (val), u19 (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 20 -- upvalues: Misc (upval), u19 (upval)
            if not a2 then
                return nil
            end
            a2:EquipHat(Misc.ScubaHelmet, true)
            local v1 = Misc.Bubbles.Particle:Clone()
            v1.Parent = a2.PrimaryPart
            local Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://5852470908"
            Sound.Volume = 2
            Sound.PlayOnRemove = true
            Sound.PlaybackSpeed = u19:NextNumber(0.8, 1.2)
            Sound.Parent = a2.PrimaryPart
            local v2 = Misc.BubblesDeath.Particle:Clone()
            v2.Parent = a2.Effect.MainAttachment
            table.insert(a2.Particles, v2)
            return a2
        end))
    end,
}