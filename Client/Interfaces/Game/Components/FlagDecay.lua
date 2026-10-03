-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.FlagDecay
-- Decompile time: 1.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
return function(a1) -- Line: 19
    -- upvalues: useBinding (val), useTween (val), useEffect (val), createElement (val)
    local replicator = a1.replicator
    local u6, u7 = useBinding(a1.timeLeft / a1.lifeTime)
    local v1, u18 = useTween(u6:getValue(), TweenInfo.new(0.25), true, true)
    local v2 = {u6}
    useEffect(function() -- Line: 24 -- upvalues: replicator (val), u7 (val), a1 (val), u18 (val), u6 (val)
        local u8 = (replicator:GetStateChangedSignal("TimeLeft")):Connect(function() -- Line: 25 -- upvalues: u7 (upval), replicator (upval), a1 (upval), u18 (upval), u6 (upval)
            u7(replicator.State.TimeLeft / a1.lifeTime)
            u18(u6:getValue())
        end)
        return function() -- Line: 30 -- upvalues: u8 (val)
            u8:Disconnect()
        end
    end, v2)
    return createElement("BillboardGui", {
        Active = true,
        Brightness = 2,
        StudsOffsetWorldSpace = Vector3.new(0, 3, 0),
        Size = UDim2.fromScale(1, 1),
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Adornee = a1.adornee,
    }, {
        progress = createElement("Frame", {
            BackgroundTransparency = 0.5,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.fromScale(1, 0.1),
        }, {
            bar = createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundColor3 = a1.color3,
                Size = v1:map(function(a1) -- Line: 54 -- types: a1: number
                    return UDim2.fromScale(a1, 1)
                end),
            }),
            uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(255, 255, 255)}),
        }),
        imageLabel = createElement("ImageLabel", {
            BackgroundTransparency = 0.85,
            BorderSizePixel = 0,
            Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(a1.ownerId),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = a1.color3,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.6, 0.6),
        }, {
            uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
            uIAspectRatioConstraint = createElement("UIAspectRatioConstraint"),
            uIStroke1 = createElement("UIStroke", {Thickness = 2, Color = a1.color3}),
        }),
    })
end