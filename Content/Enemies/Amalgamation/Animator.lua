-- Script path: ReplicatedStorage.Content.Enemies.Amalgamation.Animator
-- Decompile time: 0.24 ms

local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 7
    a1.Executables = {
        spawnMinion = function() -- Line: 9 -- upvalues: a1 (val)
            a1.Model.Head.Summon:Play()
            a1.Model.Torso.Center.Drops:Emit(12)
        end,
    }
end

return v1