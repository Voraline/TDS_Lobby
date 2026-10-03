-- Script path: ReplicatedStorage.Content.NewEnemies.Werewolf.Animator
-- Decompile time: 0.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 13 -- upvalues: Animation (val)
    local Dash = (a1.Model:WaitForChild("HumanoidRootPart")):WaitForChild("Dash")
    Dash.Enabled = true
    local Spawn = (a1.Model:WaitForChild("Head")):WaitForChild("Spawn")
    if Spawn then
        Spawn:Play()
    end
    a1.Executables = {
        Death = function() -- Line: 23 -- upvalues: Animation (upval), a1 (val)
            local u10 = Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            })
            u10:Play()
            local Death = (a1.Model:WaitForChild("Head")):WaitForChild("Death")
            if Death then
                Death:Play()
            end
            local Dash = (a1.Model:WaitForChild("HumanoidRootPart")):WaitForChild("Dash")
            Dash.Enabled = false
            task.defer(function() -- Line: 39 -- upvalues: u10 (val)
                while u10.Controller.Length == 0 do
                    task.wait()
                end
                task.wait(u10.Controller.Length * 0.95)
                u10.Controller:AdjustSpeed(0)
            end)
        end,
    }
end

return v1