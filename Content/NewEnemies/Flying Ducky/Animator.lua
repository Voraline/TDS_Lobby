-- Script path: ReplicatedStorage.Content.NewEnemies.Flying Ducky.Animator
-- Decompile time: 0.76 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 7 -- upvalues: Animation (val), RunService (val)
    local u13 = Animation.new({
        IgnorePriority = true,
        IsPersistent = true,
        Preload = true,
        Track = a1.Model.Animations.Death,
        Target = a1.Model.AnimationController.Animator,
        Animation = a1.Model.Animations.Death,
    })
    a1.Model.PrimaryPart.ROOT.Position = Vector3.new(0, 4.416999816894531, 0)
    a1.Executables = {
        Death = function() -- Line: 21 -- upvalues: RunService (upval), a1 (val), u13 (val)
            local u0 = 0
            local u1 = nil
            local v1 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 24 -- upvalues: u0 (ref), u1 (ref), a1 (upval)
                if u0 >= 1 then
                    u1:Disconnect()
                    return
                end
                u0 = u0 + a1_2
                if a1.Model.PrimaryPart and a1.Model.PrimaryPart:FindFirstChild("ROOT") then
                    local v1 = u0
                    a1.Model.PrimaryPart.ROOT.Position = Vector3.new(0, 4.416999816894531, 0):Lerp(Vector3.new(-0, -0.5830000042915344, -0), v1)
                    return
                end
            end)
            u13:Play()
        end,
    }
end

return v1