-- Script path: ReplicatedStorage.Content.Tower.Pyromancer.Animator.PyromancerSkinConfigs
-- Decompile time: 1.68 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local v1 = {
    Plushie = {dontToggleEmitter = true},
    ["Pool Party"] = {
        setEmitterDistance = function(a1, a2, a3) -- Line: 21 -- types: a1: userdata, a2: number, a3: number
            local v1 = NumberRange.new(24, 36)
            local v2 = a2 / 7 * 1.3
            local v3 = (0.6 / a1.Lifetime.Max) ^ 2
            local v4 = a3 / a2 * 50
            a1.Speed = NumberRange.new(v1.Min * v3 * v2, v1.Max * v3 * v2)
            a1.SpreadAngle = Vector2.new(v4, -v4)
        end,
    },
    ["Hallow Punk"] = {
        setEmitterDistance = function(a1, a2, a3) -- Line: 39 -- types: a1: userdata, a2: number, a3: number
            local v1 = a3 / a2 * 50
            local v2 = (0.6 / a1.Lifetime.Max) ^ 2
            a1.Speed = NumberRange.new(a2 * v2 * 2)
            a1.SpreadAngle = Vector2.new(v1, v1)
        end,
    },
}
v1["Scuba Ops"] = {
    setEmitterDistance = v1["Pool Party"].setEmitterDistance,
    onInit = function(a1) -- Line: 52 -- upvalues: RunService (val), spr (val)
        a1._weaponRotateSpeed = {value = 0.15}
        a1._weaponRotateAngle = 0
        local u3 = nil

        local function bindRotateBone() -- Line: 60 -- upvalues: u3 (ref), a1 (val), RunService (upval)
            if u3 then
                return
            end
            local u5 = a1:resolveWeaponConfig("Rotate")
            if u5 and u5:IsA("Bone") then
                u3 = RunService.Stepped:Connect(function(a1_2, a2) -- Line: 70 -- upvalues: a1 (upval), u5 (val)
                    a1._weaponRotateAngle = (a1._weaponRotateAngle + 12.566370614359172 * a1._weaponRotateSpeed.value * a2) % 6.283185307179586
                    u5.Transform = CFrame.Angles(0, a1._weaponRotateAngle, 0)
                end)
                local v1 = u3
                a1.Maid:Mark(v1)
                return
            end
        end

        bindRotateBone()
        a1.Maid:Mark((a1.OnUpgrade:Connect(bindRotateBone)))
        a1.Maid:Mark(function() -- Line: 83 -- upvalues: spr (upval), a1 (val)
            spr.stop(a1._weaponRotateSpeed)
        end)
    end,
    onFire = function(a1) -- Line: 88 -- upvalues: spr (val)
        if a1._weaponRotateSpeed then
            spr.target(a1._weaponRotateSpeed, 1, 1.5, {value = 1})
        end
    end,
    onFiringStopped = function(a1) -- Line: 96 -- upvalues: spr (val)
        if a1._weaponRotateSpeed then
            spr.target(a1._weaponRotateSpeed, 1, 0.5, {value = 0.15})
        end
    end,
}
return v1