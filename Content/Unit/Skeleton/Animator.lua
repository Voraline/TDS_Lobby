-- Script path: ReplicatedStorage.Content.Unit.Skeleton.Animator
-- Decompile time: 0.54 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 12 -- upvalues: Animation (val)
    a1.Model:WaitForChild("AnimationController")
    a1.Model:WaitForChild("Animations")
    local u19 = Animation.new({
        Track = a1.Model.Animations.Walk,
        Target = a1.Model.AnimationController,
    })
    u19:Play()
    a1.Executables = {
        Death = function(a1_2) -- Line: 24 -- upvalues: a1 (val), Animation (upval), u19 (val)
            if a1.Model.Animations:FindFirstChild("Death") then
                Animation.new({
                    Track = a1.Model.Animations.Death,
                    Target = a1.Model.AnimationController,
                }):Play()
            end
            if a1.Model:FindFirstChild("Head") then
                a1.Model.Head.Rattle:Play()
            end
            u19:Stop()
        end,
    }
end

return v1