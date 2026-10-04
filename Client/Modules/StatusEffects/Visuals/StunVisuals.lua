-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.StunVisuals
-- Decompile time: 3.30 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TransientVFX = require(ReplicatedStorage.Client.Modules.TransientVFX)
local Particles = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Particles")
return {
    onAdded = function(a1, a2) -- Line: 19
        -- upvalues: Enum (val), Particles (val), TransientVFX (val), EmitterManager (val), EasySound (val)
        local Rotate, Sound
        if a2.definitionName ~= Enum.StatusEffect.Stunned then
            return nil
        end
        local Model = a1.Model
        local PrimaryPart = Model and Model.PrimaryPart
        if not PrimaryPart then
            return nil
        end
        local BaseStunParticles = a1.BaseStunParticles
        if BaseStunParticles and BaseStunParticles.Parent then
            Rotate = BaseStunParticles:FindFirstChild("Rotate")
            if Rotate and Rotate:IsA("JointInstance") then
                Rotate.Part1 = PrimaryPart
            end
            EmitterManager.toggle(BaseStunParticles, true)
            Sound = BaseStunParticles:FindFirstChild("Sound", true)
            if Sound and Sound:IsA("Sound") then
                EasySound.Play({
                    soundGroupName = "Towers",
                    id = Sound.SoundId,
                    position = PrimaryPart.Position,
                    volume = Sound.Volume,
                    playbackSpeed = Sound.PlaybackSpeed,
                })
            end
            return {effect = BaseStunParticles}
        end
        local Dizzy = Particles:FindFirstChild("Dizzy")
        if not Dizzy then
            return nil
        end
        BaseStunParticles = Dizzy:Clone()
        BaseStunParticles.Parent = workspace.Trash
        TransientVFX.track(BaseStunParticles, {profileName = "BaseStun"})
        BaseStunParticles.Anchored = false
        if a1.Maid then
            a1.Maid:Mark(BaseStunParticles)
        end
        a1.BaseStunParticles = BaseStunParticles
        Rotate = BaseStunParticles:FindFirstChild("Rotate")
        if Rotate and Rotate:IsA("JointInstance") then
            Rotate.Part1 = PrimaryPart
        end
        EmitterManager.toggle(BaseStunParticles, true)
        Sound = BaseStunParticles:FindFirstChild("Sound", true)
        if Sound and Sound:IsA("Sound") then
            EasySound.Play({
                soundGroupName = "Towers",
                id = Sound.SoundId,
                position = PrimaryPart.Position,
                volume = Sound.Volume,
                playbackSpeed = Sound.PlaybackSpeed,
            })
        end
        return {effect = BaseStunParticles}
    end,
    onRemoved = function(a1, a2, a3) -- Line: 70 -- upvalues: EmitterManager (val), Debris (val)
        if a3 and a3.effect then
            local effect = a3.effect
            EmitterManager.toggle(effect, false)
            if a1.BaseStunParticles == effect then
                a1.BaseStunParticles = nil
            end
            if a1.Maid then
                a1.Maid:Unmark(effect)
            end
            Debris:AddItem(effect, 3)
            return
        end
    end,
}