-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVPIntermission.TeamMember
-- Decompile time: 1.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PVPIntermissionStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.PVPIntermissionStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
return function(a1) -- Line: 16
    -- upvalues: ReactCharm (val), PVPIntermissionStore (val), useSpring (val), React (val), createElement (val)
    local u5 = ReactCharm.useSignalState(PVPIntermissionStore.getState)
    local v1, u19 = useSpring(if not u5.Enabled then 0 else 1, 1, 10 / (a1.idx * 0.5), true)
    local useEffect = React.useEffect
    local v2 = {u5.Enabled}
    useEffect(function() -- Line: 21 -- upvalues: u19 (val), u5 (val)
        u19(if not u5.Enabled then 0 else 1)
    end, v2)
    return createElement("Frame", {BackgroundTransparency = 1, Size = a1.Size, LayoutOrder = a1.idx}, {
        createElement("ImageLabel", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = v1:map(function(a1) -- Line: 32
                return (UDim2.fromScale(0.5, 1.5)):Lerp(UDim2.fromScale(0.5, 1), a1)
            end),
            Size = v1:map(function(a1) -- Line: 35
                return (UDim2.fromScale(0.5, 0.5)):Lerp(UDim2.fromScale(1, 1), a1)
            end),
            Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=420&h=420"):format(a1.UserId),
            ImageTransparency = v1:map(function(a1) -- Line: 39
                return 1 - a1
            end),
        }, {ratio = createElement("UIAspectRatioConstraint")}),
    })
end