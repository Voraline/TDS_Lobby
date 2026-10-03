-- Script path: ReplicatedStorage.Content.GlobalModifiers.JulyFourth
-- Decompile time: 0.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local u16 = Random.new()
return {
    displayName = "Fireworks",
    description = "Happy Fourth of July!",
    icon = 10044810289,
    onEnableClient = function(a1, a2, a3) -- Line: 13 -- upvalues: LegacyMiddleware (val), u16 (val), ReplicatedStorage (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 18 -- upvalues: u16 (upval), ReplicatedStorage (upval)
            local v1
            local Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://269146157"
            Sound.PlayOnRemove = true
            Sound.PlaybackSpeed = u16:NextNumber(0.8, 1.2)
            Sound.Parent = a2.PrimaryPart
            local Misc = ReplicatedStorage.Assets.Effects.Misc
            local Children = Misc.Firework:GetChildren()
            a2:EquipHat(Misc.UncleSamHat, true)
            for i, v in ipairs(Children) do
                v1 = v:Clone()
                v1.Parent = a2.Effect.MainAttachment
                table.insert(a2.Particles, v1)
            end
            return a2
        end))
    end,
}