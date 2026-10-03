-- Script path: ReplicatedStorage.Client.Modules.Time
-- Decompile time: 0.19 ms

return function(a1) -- Line: 1
    return (math.floor((math.fmod(a1, 3600)) / 60)), (math.floor((math.fmod(a1, 60))))
end