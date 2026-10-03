-- Script path: ReplicatedStorage.Content.Emote.Headless.Animator
-- Decompile time: 0.24 ms

local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 9
    a1:PreloadTrack("rbxassetid://133860416444465")
    a1:OnTrackPlayed("rbxassetid://102431168230962", function(a1_2) -- Line: 11 -- upvalues: a1 (val) -- types: a1_2: userdata
        task.wait(0.8)
        a1_2:Stop()
        a1:PlayTrack("rbxassetid://133860416444465")
    end)
end

return v1