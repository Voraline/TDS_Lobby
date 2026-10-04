-- Script path: ReplicatedStorage.Content.NewEnemies.Giant Skeleton.Animator
-- Decompile time: 0.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 8 -- upvalues: Animation (val)
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    a1.Executables = {
        Death = function() -- Line: 13 -- upvalues: Animation (upval), AnimationController (val), Animations (val), a1 (val)
            Animation.new({Target = AnimationController, Track = Animations.Death}):Play()
            local Head = a1.Model:FindFirstChild("Head")
            if Head then
                local Rattle = Head:FindFirstChild("Rattle")
                if Rattle then
                    Rattle:Play()
                    Rattle.PlaybackSpeed = Rattle.PlaybackSpeed * Random.new():NextNumber(0.85, 1.1)
                end
            end
        end,
    }
end

return v1