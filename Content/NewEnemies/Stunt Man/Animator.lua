-- Script path: ReplicatedStorage.Content.NewEnemies.Stunt Man.Animator
-- Decompile time: 0.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 8 -- upvalues: Animation (val)
    local v1 = Random.new()
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Children = Animations:WaitForChild("Spawn"):GetChildren()
    local Children_2 = Animations:WaitForChild("Death"):GetChildren()
    Animation.new({
        IgnorePriority = true,
        Track = Children[v1:NextInteger(1, #Children)],
        Target = AnimationController,
    }):Play()
    local u49 = Animation.new({
        IgnorePriority = true,
        Track = Children_2[v1:NextInteger(1, #Children_2)],
        Target = AnimationController,
    })
    a1.Executables = {
        Death = function() -- Line: 30 -- upvalues: u49 (val)
            u49:Play()
        end,
    }
end

return v1