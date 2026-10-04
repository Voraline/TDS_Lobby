-- Script path: ReplicatedStorage.Shared.Modules.LightingUtil
-- Decompile time: 1.11 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local VignetteStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.VignetteStore)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
return {
    getColorCorrection = function() -- Line: 22 -- upvalues: Create (val), Lighting (val), TweenService (val)
        local v1 = {}
        local ColorCorrectionEffect = Create("ColorCorrectionEffect")
        ColorCorrectionEffect.Name = "CustomColorCorrection"
        ColorCorrectionEffect.Parent = Lighting

        function v1.animate(a1, a2) -- Line: 28 -- upvalues: TweenService (upval), ColorCorrectionEffect (val)
            TweenService:Create(ColorCorrectionEffect, a2.tweenInfo, {
                Brightness = a2.brightness,
                Contrast = a2.contrast,
                Saturation = a2.saturation,
                TintColor = a2.tintColor,
            }):Play()
        end

        function v1.update(a1, a2) -- Line: 37 -- upvalues: ColorCorrectionEffect (val) -- types: a1: table, a2: table
            for i, j in {
                Brightness = a2.brightness,
                Contrast = a2.contrast,
                Saturation = a2.saturation,
                TintColor = a2.tintColor,
            } do
                ColorCorrectionEffect[i] = j
            end
        end

        function v1.destroy(a1) -- Line: 50 -- upvalues: ColorCorrectionEffect (val)
            ColorCorrectionEffect:Destroy()
        end

        return v1
    end,
    animateVignette = function(a1) -- Line: 57 -- upvalues: VignetteStore (val) -- types: a1: table
        VignetteStore.setAnimationData({
            transparency = a1.transparency,
            tweenInfo = a1.tweenInfo,
            color = a1.color,
        })
    end,
    clearVignette = function(a1) -- Line: 65 -- upvalues: VignetteStore (val) -- types: a1: userdata?
        local v1 = {
            transparency = 1,
            color = Color3.new(0, 0, 0),
            tweenInfo = a1 or TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        }
        VignetteStore.setAnimationData({
            transparency = v1.transparency,
            tweenInfo = v1.tweenInfo,
            color = v1.color,
        })
    end,
}