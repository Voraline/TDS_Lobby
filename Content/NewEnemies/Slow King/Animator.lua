-- Script path: ReplicatedStorage.Content.NewEnemies.Slow King.Animator
-- Decompile time: 0.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 9 -- upvalues: TweenService (val), Animation (val)
    a1.Executables = {
        Shield = function() -- Line: 11 -- upvalues: TweenService (upval), a1 (val)
            TweenService:Create(
                a1.Model.Barrier,
                TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                {Transparency = 1}
            ):Play()
            game.Debris:AddItem(a1.Model.Barrier, 1)
        end,
        Death = function() -- Line: 20 -- upvalues: a1 (val), Animation (upval)
            local Death = a1.Model.Animations:FindFirstChild("Death")
            if Death then
                Animation.new({Track = Death, Target = a1.Model.AnimationController}):Play()
                a1:Wait(4)
            end
        end,
    }
end

return v1