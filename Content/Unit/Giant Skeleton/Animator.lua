-- Script path: ReplicatedStorage.Content.Unit.Giant Skeleton.Animator
-- Decompile time: 0.82 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 12 -- upvalues: Animation (val)
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    a1.walk = Animation.new({IsPersistent = true, Track = Animations:WaitForChild("Walk"), Target = AnimationController})
    a1.walk:Play()

    function a1.DoWalk() -- Line: 23 -- upvalues: a1 (val)
        a1.walk:Play()
    end

    a1.Executables = {
        Death = function(a1_2) -- Line: 28 -- upvalues: a1 (val), Animation (upval)
            if a1.Model.Animations:FindFirstChild("Death") then
                Animation.new({
                    Track = a1.Model.Animations.Death,
                    Target = a1.Model.AnimationController,
                }):Play()
            end
            if a1.Model:FindFirstChild("Head") then
                a1.Model.Head.Rattle:Play()
            end
            a1.walk:Stop()
        end,
    }
end

return v1