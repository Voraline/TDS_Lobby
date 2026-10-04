-- Script path: ReplicatedStorage.Content.Emote.Achoo.Animator
-- Decompile time: 1.44 ms

local RunService = game:GetService("RunService")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 15 -- upvalues: RunService (val)
    local RightHand = a1.Character.Instance:WaitForChild("RightHand")
    a1.Character.Instance:WaitForChild("Tissues"):WaitForChild("TissueMotor").Part0 = RightHand
    if a1.Preview then
        return
    end
    a1._humanoid = a1.Character.Instance:WaitForChild("Humanoid")
    a1._humanoid.WalkSpeed = 0
    local u29 = a1:PreloadTrack("rbxassetid://73433508214504")
    local u33 = a1:PreloadTrack("rbxassetid://78530838255581")
    local u34 = nil
    local u35 = false
    a1.Maid:Mark(function() -- Line: 31 -- upvalues: u35 (ref), u29 (val), u33 (val), u34 (ref)
        u35 = true
        task.wait(0.1)
        u29:Stop()
        u33:Stop()
        if u34 then
            u34:Stop()
        end
    end)
    a1:OnTrackPlayed("rbxassetid://95224892288486", function(a1_2) -- Line: 40
        -- upvalues: u34 (ref), a1 (val), u29 (val), RunService (upval), u33 (val), u35 (ref)
        u34 = a1_2
        a1.Maid:Mark((a1_2.DidLoop:Once(function() -- Line: 42 -- upvalues: a1_2 (val), u29 (upval), a1 (upval), RunService (upval), u33 (upval), u35 (upval)
            a1_2:Stop()
            u29:Play()
            a1._humanoid.WalkSpeed = 5
            local u15 = workspace:GetServerTimeNow() + 10
            a1.Maid:Mark((RunService.Heartbeat:Connect(function() -- Line: 47 -- upvalues: a1 (upval), u29 (upval), u33 (upval), u15 (ref), a1_2 (upval), u35 (upval)
                if not a1:IsMoving() then
                    if not a1:IsMoving() and u33.IsPlaying then
                        u33:Stop()
                        u29:Play()
                    end
                elseif u29.IsPlaying then
                    u29:Stop()
                    u33:Play()
                elseif not a1:IsMoving() and u33.IsPlaying then
                    u33:Stop()
                    u29:Play()
                end
                local ServerTimeNow = workspace:GetServerTimeNow()
                if u15 <= ServerTimeNow then
                    u15 = workspace:GetServerTimeNow() + 10 + 6.82
                    u29:Stop()
                    a1._humanoid.WalkSpeed = 0
                    a1_2:Play()
                    task.wait(6.82)
                    if u35 then
                        return
                    end
                    a1_2:Stop()
                    a1._humanoid.WalkSpeed = 5
                    u29:Play()
                end
            end)))
        end)))
    end)
end

function v1:IsMoving() -- Line: 74
    return 0 < self._humanoid.MoveDirection.Magnitude
end

return v1