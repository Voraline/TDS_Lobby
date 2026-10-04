-- Script path: ReplicatedStorage.Content.NewEnemies.Guard Plush.Animator
-- Decompile time: 0.56 ms

game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage_2.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 14 -- upvalues: Animation (val)
    a1.Name = "Cobalt Guard"
    a1.Executables = {
        Death = function() -- Line: 18 -- upvalues: Animation (upval), a1 (val)
            local u10 = Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            })
            u10:Play()
            task.defer(function() -- Line: 26 -- upvalues: u10 (val), a1 (upval)
                while u10.Controller.Length == 0 do
                    a1:Delay(0.01)
                end
                a1:Delay(u10.Controller.Length * 0.95)
                u10.Controller:AdjustSpeed(0)
            end)
        end,
    }
end

return v1