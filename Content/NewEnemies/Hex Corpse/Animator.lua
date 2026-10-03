-- Script path: ReplicatedStorage.Content.NewEnemies.Hex Corpse.Animator
-- Decompile time: 0.82 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1
local u11 = {"UpperTorso", "Right Arm", "Left Arm", "Head"}

function v1.Initialize(a1) -- Line: 13 -- upvalues: Animation (val), u11 (val)
    a1._animations = {}
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    local Sprint = Animations:WaitForChild("Sprint")
    local Split = Animations:WaitForChild("Split")
    a1._animations.Sprint = Animation.new({Target = AnimationController, Track = Sprint})
    a1._animations.Split = Animation.new({Target = AnimationController, Track = Split})
    a1.Executables = {
        Decapitate = function() -- Line: 30 -- upvalues: u11 (upval), a1 (val)
            local v1
            for i, v in ipairs(u11) do
                v1 = a1.Model[v]
                v1.Transparency = 1
            end
            a1._animations.Split:Play()
            a1._animations.Split.Controller.Ended:Once(function() -- Line: 36 -- upvalues: a1 (upval)
                a1._animations.Sprint:Play()
            end)
        end,
    }
end

return v1