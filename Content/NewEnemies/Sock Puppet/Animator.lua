-- Script path: ReplicatedStorage.Content.NewEnemies.Sock Puppet.Animator
-- Decompile time: 0.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 7 -- upvalues: Animation (val)
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    a1.Executables = {
        Death = function() -- Line: 12 -- upvalues: a1 (val), Animation (upval), Animations (val), AnimationController (val)
            a1.WalkTrack:Stop()
            Animation.new({Track = Animations.Death, Target = AnimationController}):Play()
            local Head = a1.Model:FindFirstChild("Head")
            if Head then
                local Death = Head:FindFirstChild("Death")
                if Death then
                    Death:Play()
                    Death.PlaybackSpeed = Death.PlaybackSpeed * Random.new():NextNumber(0.85, 1.1)
                end
            end
        end,
    }
end

return v1