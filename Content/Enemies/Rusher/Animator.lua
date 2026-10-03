-- Script path: ReplicatedStorage.Content.Enemies.Rusher.Animator
-- Decompile time: 0.58 ms

local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 7
    a1.Model.HumanoidRootPart.Dash.Enabled = true
    a1.Executables = {
        Normal = function() -- Line: 11 -- upvalues: a1 (val)
            a1.Model.Shield.Transparency = 1
            a1.Model.Shield.Emitter:Emit(40)
            a1.Model.Head.Break:Play()
            a1.Model.HumanoidRootPart.Dash.Enabled = false
            task.defer(function() -- Line: 17 -- upvalues: a1 (upval)
                local Walk2 = a1.Model.Animations.Walk2
                local v1 = a1.Model.AnimationController:LoadAnimation(Walk2)
                a1.WalkTrack:Stop()
                a1.WalkTrack = v1
                while a1.WalkTrack.Length == 0 do
                    a1:Delay(0.001)
                end
                a1:AdjustWalkSpeed()
            end)
        end,
    }
end

return v1