-- Script path: ReplicatedStorage.Content.GlobalModifiers.BadlandsEnemies
-- Decompile time: 1.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local u21 = Random.new()
return {
    displayName = "Badlands",
    description = "Mobs are replaced with western variants.",
    icon = 10044911963,
    rewardMultiplier = 0.2,
    onEnableClient = function(a1, a2, a3) -- Line: 15 -- upvalues: SoundService (val), u21 (val), LegacyMiddleware (val)
        local Sound
        local Music = workspace:WaitForChild("Music")
        local u12 = ""
        local u13 = {}
        local u14 = nil
        for k, v in pairs({10981954022, 10981954769, 10981955568}) do
            Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://" .. v
            Sound.Volume = 0.5
            Sound.Parent = workspace
            Sound.SoundGroup = SoundService.Music
            table.insert(u13, Sound)
        end

        local function shuffleSound() -- Line: 33 -- upvalues: u13 (val), u21 (upval), u14 (ref)
            local v1 = u13[u21:NextInteger(1, #u13)]
            while v1 == u14 do
                v1 = u13[u21:NextInteger(1, #u13)]
            end
            u14 = v1
            return v1
        end

        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.OnNextWave, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 48 -- upvalues: Music (val), u12 (ref), shuffleSound (val)
            if a2 % 10 == 0 or a2 == 1 then
                if Music.Value ~= "" then
                    u12 = Music.Value
                    Music.Value = ""
                end
                local v1 = shuffleSound()
                v1:Play()
                task.wait(v1.TimeLength * 1.5)
                if Music.Value == "" then
                    Music.Value = u12
                end
                u12 = ""
            end
            return a2
        end))
    end,
}