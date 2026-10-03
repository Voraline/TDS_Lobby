-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.KingpinBountyCrosshair.story
-- Decompile time: 0.98 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local KingpinBountyCrosshair = require(script.Parent.KingpinBountyCrosshair)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {rewardAmount = 450},
    story = function(a1) -- Line: 15 -- upvalues: useState (val), useEffect (val), createElement (val), KingpinBountyCrosshair (val)
        local v1, u4 = useState(0)
        useEffect(function() -- Line: 18 -- upvalues: u4 (val)
            local u0 = true
            local u3 = task.spawn(function() -- Line: 20 -- upvalues: u0 (ref), u4 (upval)
                local v1 = 0
                while u0 do
                    task.wait(1.6)
                    v1 = v1 + 1
                    u4(v1)
                end
            end)
            return function() -- Line: 30 -- upvalues: u0 (ref), u3 (val)
                u0 = false
                task.cancel(u3)
            end
        end, {})
        return createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(250, 250),
        }, {
            crosshair = createElement(KingpinBountyCrosshair, {BountyReward = a1.controls.rewardAmount, ResetKey = v1}),
        })
    end,
}