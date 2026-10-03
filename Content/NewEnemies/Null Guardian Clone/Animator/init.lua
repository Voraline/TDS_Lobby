-- Script path: ReplicatedStorage.Content.NewEnemies.Null Guardian Clone.Animator
-- Decompile time: 1.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local NullGuardian = ReplicatedStorage.Assets.Effects.Mob.NullGuardian
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 13
    -- upvalues: StateManager (val), Animation (val), NullGuardian (val), EmitterManager (val), EasySound (val)
    local v1
    local Animations = a1.Model.Animations
    a1.stateManager = StateManager.new()
    a1.stateManager:addStates((require(script:WaitForChild("NullGuardianAnimatorStates"))))
    a1.animations = {}
    for i, j in Animations:GetChildren() do
        v1 = Animation.new({
            IgnorePriority = true,
            Preload = true,
            Track = j,
            Target = a1.Model.AnimationController.Animator,
        })
        a1.animations[j.Name] = v1
    end
    a1.Executables = {
        ChangeState = function(a1_2, ...) -- Line: 34 -- upvalues: a1 (val) -- types: a1_2: string
            warn("changing state", a1_2)
            a1.stateManager:changeState(a1_2, a1, ...)
        end,
        PathChange = function(a1_2, a2) -- Line: 38 -- upvalues: a1 (val)
            a1.PathName = a1_2
            a1.PathDistance = a2
            a1:RefreshPath(nil, nil, true)
        end,
        NullAura = function() -- Line: 44 -- upvalues: a1 (val), NullGuardian (upval), EmitterManager (upval), EasySound (upval)
            if not a1.Model:FindFirstChild("NullAura") then
                local v1 = NullGuardian.NullAura:Clone()
                v1:PivotTo(a1.Model.PrimaryPart.CFrame)
                local Motor6D = Instance.new("Motor6D")
                Motor6D.Part0 = a1.Model.PrimaryPart
                Motor6D.Part1 = v1.PrimaryPart
                Motor6D.C0 = CFrame.Angles(0, 1.5707963267948966, 0)
                Motor6D.Parent = v1.PrimaryPart
                v1.Parent = a1.Model
                EmitterManager.toggle(v1, true)
                EasySound.Play({id = 137467692142513, volume = 0.5, looped = true, parent = v1.PrimaryPart})
            end
        end,
    }
    a1.Executables.ChangeState("Walk")
end

return v1