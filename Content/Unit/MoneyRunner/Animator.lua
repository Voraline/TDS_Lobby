-- Script path: ReplicatedStorage.Content.Unit.MoneyRunner.Animator
-- Decompile time: 1.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local v1 = {}
v1.__index = v1

local function playUnitSound(a1, a2) -- Line: 12 -- upvalues: EasySound (val) -- types: a1: userdata, a2: number
    EasySound.Play({
        destroyOnEnd = true,
        audioGroup = "Towers",
        timeScaled = true,
        id = a2,
        parent = a1.PrimaryPart,
        position = a1:GetPivot().Position,
    })
end

function v1.Initialize(a1) -- Line: 23 -- upvalues: Animation (val), EasySound (val), EmitterManager (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local u23 = nil
    local u40 = nil
    if Animations:FindFirstChild("Walk") then
        u23 = Animation.new({
            IsPersistent = true,
            Track = Animations.Walk,
            Target = AnimationController,
            Entity = {TimeScaled = true},
        })
        local v1 = u23:Play()
        v1.Priority = Enum.AnimationPriority.Core
    end
    if Animations:FindFirstChild("Death") then
        u40 = Animation.new({
            IsPersistent = true,
            Track = Animations.Death,
            Target = AnimationController,
            Entity = {TimeScaled = true},
        })
    end
    a1.Executables = {
        Death = function() -- Line: 56 -- upvalues: a1 (val), EasySound (upval), u23 (ref), u40 (ref), EmitterManager (upval)
            local Model = a1.Model
            EasySound.Play({
                id = 94911982679271,
                destroyOnEnd = true,
                audioGroup = "Towers",
                timeScaled = true,
                parent = Model.PrimaryPart,
                position = Model:GetPivot().Position,
            })
            if u23 then
                u23:Stop()
            end
            if u40 then
                local v1 = u40:Play()
                v1.Priority = Enum.AnimationPriority.Action
            end
            local MoneyTrail = a1.Model:FindFirstChild("MoneyTrail")
            if MoneyTrail then
                EmitterManager.toggle(MoneyTrail, false)
            end
            local MoneyExplosion = a1.Model:FindFirstChild("MoneyExplosion")
            if MoneyExplosion then
                EmitterManager.manualEmit(MoneyExplosion)
            end
        end,
    }
end

return v1