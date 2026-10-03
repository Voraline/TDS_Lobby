-- Script path: ReplicatedStorage.Content.Unit.Warrior Elf.Animator
-- Decompile time: 2.12 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local v1 = {}
v1.__index = v1

function v1:Fire(a2) -- Line: 10 -- upvalues: Animation (val), EmitterManager (val), EasySound (val)
    local v1 = (if not self.Model.Animations:FindFirstChild("Attack") then nil else Animation.new({
        Track = self.Model.Animations.Attack,
        Target = self.Model.AnimationController,
    })) or (if self.left ~= true then Animation.new({
        Track = self.Model.Animations.Attack2,
        Target = self.Model.AnimationController,
    }) else Animation.new({
        Track = self.Model.Animations.Attack1,
        Target = self.Model.AnimationController,
    }))
    EmitterManager.toggle(self.Model.PrimaryPart, true)
    v1:Play()
    self:Face(a2, (TweenInfo.new(0.3)))
    local Swing = self._sounds.Swing
    if not Swing then
        local Head = self.Model:FindFirstChild("Head") or self.Model.PrimaryPart
        local Swing_2 = Head and Head:FindFirstChild("Swing")
        if Swing_2 then
            Swing = EasySound.Create({
                timeScaled = true,
                auidioGroup = "Towers",
                id = Swing_2.SoundId,
                parent = Head,
                volume = Swing_2.Volume,
            })
            self._sounds.Swing = Swing
        end
    end
    if Swing then
        Swing.PlaybackSpeed = Random.new():NextNumber(0.8, 1.1)
        Swing:Play()
    end
    self.left = not self.left
    self:Delay(self.Cooldown)
    EmitterManager.toggle(self.Model.PrimaryPart, false)
end

function v1.Initialize(a1) -- Line: 63 -- upvalues: Animation (val)
    a1.left = false
    a1._sounds = {}
    local u11 = a1.Model.AnimationController.Animator:LoadAnimation(a1.Model.Animations.Walk)
    local u20 = Animation.new({
        IsPersistent = true,
        Track = a1.Model.Animations.AimIdle,
        Target = a1.Model.AnimationController,
    })

    function a1.DoWalk() -- Line: 79 -- upvalues: u11 (val), a1 (val)
        u11:Play()
        u11:AdjustSpeed(a1.Speed / 3.5)
    end

    a1.DoWalk()
    a1.Executables = {
        Death = function(a1_2) -- Line: 88 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            }):Play()
            local Handle = a1.Model:FindFirstChild("Handle")
            if Handle then
                Handle.Transparency = 1
            end
        end,
        ShootState = function(a1_2) -- Line: 99 -- upvalues: u11 (val), u20 (val), a1 (val)
            if a1_2 then
                u11:Stop()
                u20:Play()
                return
            end
            a1.DoWalk()
            u20:Stop()
        end,
        Attack = function(a1_2) -- Line: 109 -- upvalues: a1 (val)
            local u1 = nil
            if pcall(function() -- Line: 111 -- upvalues: u1 (ref), a1_2 (val)
                    u1 = a1_2.PrimaryPart
                    return
                end)
                and u1 then
                a1:Fire(u1.Position)
                return
            end
        end,
    }
end

return v1