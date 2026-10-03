-- Script path: ReplicatedStorage.Content.Emote.Caroling.Animator
-- Decompile time: 0.48 ms

local SoundService = game:GetService("SoundService")
local u5 = {
    "rbxassetid://133993011793206",
    "rbxassetid://114894303819142",
    "rbxassetid://91320787276057",
    "rbxassetid://75089039843770",
    "rbxassetid://77326999029441",
    "rbxassetid://105226887981421",
    "rbxassetid://116469571110049",
}
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 18 -- upvalues: u5 (val), SoundService (val)
    if a1.Local then
        a1:PlayTrack(u5[math.random(1, #u5)], 0)
    end
    local Sound = Instance.new("Sound")
    Sound.Looped = true
    Sound.SoundId = "rbxassetid://76945970216621"
    Sound.SoundGroup = SoundService.Emotes
    Sound.Parent = a1.Character.Instance.HumanoidRootPart
    Sound:Play()
    a1._sound = Sound
end

function v1.update(a1, a2) end

function v1:Destroy() -- Line: 34
    self._sound:Destroy()
end

return v1