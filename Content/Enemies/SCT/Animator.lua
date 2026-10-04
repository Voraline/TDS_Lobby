-- Script path: ReplicatedStorage.Content.Enemies.SCT.Animator
-- Decompile time: 0.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 10 -- upvalues: Animation (val)
    a1.Executables = {
        Shoot = function() -- Line: 12 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Shoot,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Handle.Fire:Play()
            a1.Model.Handle.Start.Flash:Emit(20)
            a1.Model.Handle.Start.Flash2:Emit(30)
        end,
    }
end

return v1