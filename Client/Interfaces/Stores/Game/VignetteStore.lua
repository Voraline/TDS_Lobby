-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.VignetteStore
-- Decompile time: 0.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u20, u21 = (require(ReplicatedStorage.Packages.Charm)).signal({transparency = 1, tweenInfo = TweenInfo.new(0.5), color = Color3.new(0, 0, 0)})
return {
    getState = u20,
    setAnimationData = function(a1) -- Line: 23 -- upvalues: u20 (val), u21 (val) -- types: a1: table
        local v1 = u20()
        local v2 = {}
        local transparency = a1.transparency or v1.transparency
        v2.transparency = transparency
        local tweenInfo = a1.tweenInfo or v1.tweenInfo
        v2.tweenInfo = tweenInfo
        local color = a1.color or v1.color
        v2.color = color
        if v2.transparency == v1.transparency and v2.tweenInfo == v1.tweenInfo and v2.color == v1.color then
            return
        end
        u21(v2)
    end,
}