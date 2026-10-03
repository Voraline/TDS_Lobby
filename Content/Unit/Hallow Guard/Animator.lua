-- Script path: ReplicatedStorage.Content.Unit.Hallow Guard.Animator
-- Decompile time: 0.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 12 -- upvalues: Animation (val)
    a1.walk = (a1.Model:WaitForChild("AnimationController")):LoadAnimation((a1.Model:WaitForChild("Animations"):WaitForChild("Walk")))
    a1.walk:Play()

    function a1.DoWalk() -- Line: 19 -- upvalues: a1 (val)
        a1.walk:Play()
        a1.walk:AdjustSpeed(a1.Speed / (a1.walk.Length * 2.7) * 2)
    end

    a1.Executables = {
        Death = function(a1_2) -- Line: 30 -- upvalues: a1 (val), Animation (upval)
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