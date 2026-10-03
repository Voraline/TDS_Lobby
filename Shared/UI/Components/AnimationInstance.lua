-- Script path: ReplicatedStorage.Shared.UI.Components.AnimationInstance
-- Decompile time: 0.43 ms

return function(a1) -- Line: 1
    local Track = a1.Track
    if not Track then
        Track = Instance.new("Animation")
        Track.AnimationId = string.format("rbxassetid://%d", a1.Id or 0)
    end
    local v1 = a1.Target:LoadAnimation(Track)
    v1.Looped = a1.Looped or true
    if not a1.Track then
        v1.Destroying:Connect(function() -- Line: 12 -- upvalues: Track (ref)
            Track:Destroy()
        end)
    end
    if a1.TimePosition then
        v1.TimePosition = a1.TimePosition
    end
    v1:Play(0)
    if a1.Paused then
        v1:AdjustSpeed(0)
        v1.TimePosition = a1.TimePosition or 0
    end
    return v1
end