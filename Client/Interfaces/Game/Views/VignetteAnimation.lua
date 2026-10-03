-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.VignetteAnimation
-- Decompile time: 1.11 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Vignette = require(ReplicatedStorage.Client.Interfaces.Game.Components.Vignette)
local VignetteStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.VignetteStore)
local createElement = React.createElement

local function render() -- Line: 11
    -- upvalues: ReactCharm (val), VignetteStore (val), ReactFlow (val), React (val), createElement (val)
    -- upvalues: Vignette (val)
    local u4 = ReactCharm.useSignalState(VignetteStore.getState)
    local v1, u12 = ReactFlow.useTween({start = 1, target = 1, info = TweenInfo.new(0)})
    local v2, u30 = ReactFlow.useTween({
        start = Color3.new(0, 0, 0),
        target = Color3.new(0, 0, 0),
        info = TweenInfo.new(0),
    })
    local v3 = {u4}
    React.useEffect(function() -- Line: 26 -- upvalues: u4 (val), u12 (val), u30 (val)
        local v1 = u4
        local v2 = {target = v1.transparency}
        local tweenInfo = v1.tweenInfo or TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        v2.info = tweenInfo
        u12(v2)
        v2 = {target = v1.color}
        local tweenInfo_2 = v1.tweenInfo or TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        v2.info = tweenInfo_2
        u30(v2)
    end, v3)
    return createElement(Vignette, {transparency = v1, color = v2})
end

return function(a1) -- Line: 46 -- upvalues: createElement (val), render (val)
    a1.setDisplayOrder(3)
    a1.setIgnoreGuiInset(true)
    return createElement(render)
end