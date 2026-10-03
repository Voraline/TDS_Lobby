-- Script path: ReplicatedStorage.Content.Enemies.Lunar Shield.Animator
-- Decompile time: 0.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 12
    a1.Executables = {
        Normal = function() -- Line: 14 -- upvalues: a1 (val)
            a1.Model.Shield.Emitter:Emit(35)
            a1.Model.Shield.Size = Vector3.new(0, 0, 0)
            a1.Model.Shield.Transparency = 1
            a1.Model.Head.Break:Play()
            a1:UpdateWalkAnim("Run")
            task.spawn(function() -- Line: 22 -- upvalues: a1 (upval)
                repeat
                    a1:Delay(0.01)
                until a1.WalkAnimation.Length ~= 0
                a1:UpdateWalkAnim()
            end)
        end,
        Charge = function(a1_2) -- Line: 31 -- upvalues: a1 (val)
            a1.Model.Head.Horn:Play()
            a1.Model.Head.Scream.Effect.Enabled = true
            a1.Model.HumanoidRootPart.Dash.Enabled = true
            a1:Delay(a1_2)
            a1.Model.Head.Scream.Effect.Enabled = false
            a1.Model.HumanoidRootPart.Dash.Enabled = false
        end,
    }
end

return v1