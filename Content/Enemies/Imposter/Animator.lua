-- Script path: ReplicatedStorage.Content.Enemies.Imposter.Animator
-- Decompile time: 0.13 ms

local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 7
    (a1.Model:WaitForChild("Head")):WaitForChild("Spawn"):Play()
end

return v1