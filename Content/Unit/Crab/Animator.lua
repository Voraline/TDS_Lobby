-- Script path: ReplicatedStorage.Content.Unit.Crab.Animator
-- Decompile time: 0.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
v1.__index = v1
local u7 = Random.new()
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 13 -- upvalues: u7 (val), Animation (val)
    a1.Model:WaitForChild("AnimationController")
    a1.Model:WaitForChild("Animations")
    local v1 = u7:NextInteger(0, 1)
    local v2 = if v1 ~= 0 then 1.5707963267948966 else -1.5707963267948966
    local Walk1 = not (v1 ~= 0) and a1.Model.Animations.Walk1 or a1.Model.Animations.Walk2
    local CFrame_2 = a1.Model.Crab.GLOBAL_ROOT.CFrame
    a1.Model.Crab.GLOBAL_ROOT.CFrame = CFrame_2 * CFrame.Angles(0, 0, v2)
    local u51 = Animation.new({Track = Walk1, Target = a1.Model.AnimationController})
    u51:Play()
    a1.Executables = {
        Death = function(a1) -- Line: 34 -- upvalues: u51 (val)
            u51:Stop()
        end,
    }
end

return v1