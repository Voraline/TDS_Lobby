-- Script path: ReplicatedStorage.Content.Emote.Ballerina Spin.Animator
-- Decompile time: 1.32 ms

local ContentProvider = game:GetService("ContentProvider")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 21 -- upvalues: EasySound (val), ContentProvider (val), TweenService (val)
    local HumanoidRootPart = a1.Character.Instance:WaitForChild("HumanoidRootPart")
    local u7 = {}
    u7.loop = a1:LoadAnimation("rbxassetid://103312494708816")
    u7.outro = a1:LoadAnimation("rbxassetid://131923274061403", true)
    local u17 = {}
    u17.intro = EasySound.Create({id = 89228071969087, volume = 1, parent = HumanoidRootPart})
    u17.loop = EasySound.Create({id = 118180587548358, volume = 1, looped = true, parent = HumanoidRootPart})
    u17.outro = EasySound.Create({id = 74521684799622, volume = 1, parent = HumanoidRootPart})
    a1._animations = u7
    a1._sounds = u17
    a1.Maid:Mark(u17.intro)
    a1.Maid:Mark(u17.loop)
    a1.OutroMaid:Mark(u17.outro)
    ContentProvider:PreloadAsync({u17.intro, u17.loop, u17.outro})
    if not a1:IsPlaying() then
        return
    end
    a1._initialized = true
    a1:OnTrackPlayed("rbxassetid://130416071871843", function(a1_2) -- Line: 65 -- upvalues: u17 (val), a1 (val), TweenService (upval), u7 (val) -- types: a1_2: userdata
        u17.intro:Play()
        a1:Delay(1.5, function() -- Line: 68 -- upvalues: u17 (upval), TweenService (upval), a1 (upval)
            u17.loop.Volume = 0
            u17.loop.TimePosition = 0.1
            local v1 = TweenService:Create(u17.loop, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Volume = 1})
            a1.Maid:Mark(v1)
            v1:Play()
            u17.loop:Play()
        end)
        task.wait(0.8)
        a1_2:Stop()
        u7.loop:Play()
    end)
end

function v1.Destroy(a1) -- Line: 89
    if a1._initialized and not a1.Preview then
        a1._animations.outro:Play(0)
        a1._sounds.outro:Play()
        a1:FinishAfter(1.5)
        return
    end
    a1.OutroMaid:Sweep()
end

return v1