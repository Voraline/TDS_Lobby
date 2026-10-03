-- Script path: ReplicatedStorage.Content.Emote.Chilly.Animator
-- Decompile time: 0.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 9 -- upvalues: ReplicatedStorage (val), SoundService (val)
    local Y = (a1.Character.Instance:GetExtentsSize()).Y
    a1._effect = ReplicatedStorage.Assets.Emotes.Chilly.SnowVFX:Clone()
    a1._effect.Parent = a1.Character.Instance.HumanoidRootPart
    a1._effect.CFrame = a1.Character.Instance.HumanoidRootPart.CFrame * CFrame.new(0, Y / 2 + 5, 0)
    local Sound = Instance.new("Sound")
    Sound.Looped = true
    Sound.SoundId = "rbxassetid://106049033263306"
    Sound.SoundGroup = SoundService:WaitForChild("Emotes")
    Sound.Parent = a1.Character.Instance.HumanoidRootPart
    Sound:Play()
    a1._sound = Sound
end

function v1.update(a1, a2) end

function v1:Destroy() -- Line: 28
    self._effect:Destroy()
    self._sound:Destroy()
end

return v1