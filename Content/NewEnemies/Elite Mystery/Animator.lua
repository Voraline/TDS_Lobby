-- Script path: ReplicatedStorage.Content.NewEnemies.Elite Mystery.Animator
-- Decompile time: 0.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 7 -- upvalues: ReplicatedStorage (val), EmitterManager (val)
    a1.OnDestroy:Connect(function() -- Line: 8 -- upvalues: ReplicatedStorage (upval), a1 (val), EmitterManager (upval)
        local u7 = ReplicatedStorage.Assets.Effects.Mob.MysteryDeath:Clone()
        u7.Parent = workspace.Trash
        u7.Position = a1.Model.PrimaryPart.Position
        EmitterManager.manualEmit(u7)
        a1:Delay(1, function() -- Line: 13 -- upvalues: u7 (val)
            u7:Destroy()
        end)
    end)
end

return v1