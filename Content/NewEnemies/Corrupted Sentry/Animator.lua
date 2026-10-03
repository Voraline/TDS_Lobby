-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Sentry.Animator
-- Decompile time: 1.65 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 8 -- upvalues: Animation (val), ReplicatedStorage (val)
    local Animator = a1.Model.AnimationController.Animator
    a1._animations = {}
    a1._beams = {}
    a1._currentTarget = nil
    for i, j in a1.Model.Animations:GetChildren() do
        a1._animations[j.Name] = (Animation.new({
            IgnorePriority = true,
            IsPersistent = true,
            Preload = true,
            Track = j,
            Target = Animator,
        }))
    end
    a1._animations.Spawn:Play()
    a1:Delay(1)

    local function clearBeams() -- Line: 28 -- upvalues: a1 (val)
        if #a1._beams > 0 then
            for i, j in a1._beams do
                j:Destroy()
            end
            a1._beams = {}
        end
    end

    a1.OnDestroy:Connect(function() -- Line: 37 -- upvalues: clearBeams (val)
        clearBeams()
    end)
    a1.Executables = {
        Stun = function(a1_2, a2) -- Line: 42
            -- upvalues: a1 (val), clearBeams (val), ReplicatedStorage (upval)
            local Start = a1.Model.PrimaryPart:FindFirstChild("Start", true)
            if a1_2 and Start then
                local PrimaryPart, v1
                a1:Face(a1_2, TweenInfo.new(0.25), true)
                a1._animations.Shoot:Play()
                if not a2 then
                    return
                end
                if #a1._beams ~= 0 and a2 == a1._currentTarget then
                    return
                end
                if a1._currentTarget ~= a2 then
                    clearBeams()
                end
                a1._currentTarget = a2
                local v2 = {}
                local v3 = a2
                for i, j in ReplicatedStorage.Assets.Effects.Mob["Corrupted Medic"].Beams:GetChildren() do
                    PrimaryPart = v3.PrimaryPart and v3.PrimaryPart:FindFirstChild("CorruptedSentryBeamAttachment")
                    if not PrimaryPart then
                        PrimaryPart = Instance.new("Attachment")
                        PrimaryPart.Name = "CorruptedSentryBeamAttachment"
                        PrimaryPart.Parent = v3.PrimaryPart
                    end
                    v1 = j:Clone()
                    v1.Attachment0 = Start
                    v1.Attachment1 = PrimaryPart
                    v1.Parent = workspace.Trash
                    table.insert(v2, v1)
                end
                a1._beams = v2
                return
            end
            a1._animations.Shoot:Stop()
            clearBeams()
        end,
    }
end

return v1