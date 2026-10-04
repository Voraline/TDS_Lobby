-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.ConsumableInfo
-- Decompile time: 2.02 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local useEffect = React.useEffect
local createElement = React.createElement
local useBinding = React.useBinding
local joinBindings = React.joinBindings
return function(a1) -- Line: 21
    -- upvalues: useBinding (val), joinBindings (val), useTween (val), useEffect (val), useReactBindings (val)
    -- upvalues: createElement (val)
    local replicator = a1.replicator
    local v1, u9 = useBinding(replicator:Get("Health") or 0)
    local v2, u17 = useBinding(replicator:Get("MaxHealth") or 1)
    local u26 = joinBindings({v1, v2}):map(function(a1) -- Line: 25
        return a1[1] / a1[2]
    end)
    local v3, u37 = useTween(u26:getValue(), TweenInfo.new(0.25), true, true)
    useEffect(function() -- Line: 30 -- upvalues: replicator (val), u9 (val), u17 (val)
        local u8 = (replicator:GetStateChangedSignal("Health")):Connect(function(a1) -- Line: 33 -- upvalues: u9 (upval) -- types: a1: number
            u9(a1)
        end)
        local u17_2 = (replicator:GetStateChangedSignal("MaxHealth")):Connect(function(a1) -- Line: 39 -- upvalues: u17 (upval) -- types: a1: number
            u17(a1)
        end)
        return function() -- Line: 43 -- upvalues: u8 (val), u17_2 (val)
            u8:Disconnect()
            u17_2:Disconnect()
        end
    end, {})
    local v4 = {u26}
    useReactBindings(function() -- Line: 49 -- upvalues: u37 (val), u26 (val)
        u37(u26:getValue())
    end, v4)
    return createElement("BillboardGui", {
        Active = true,
        Brightness = 2,
        Size = UDim2.fromScale(1, 1),
        StudsOffsetWorldSpace = a1.offset,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Adornee = a1.adornee,
    }, {
        progress = createElement("Frame", {
            BackgroundTransparency = 0.5,
            ZIndex = 2,
            Visible = 0 < (u26:getValue()),
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.fromScale(1, 0.1),
        }, {
            bar = createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundColor3 = a1.color3,
                Size = v3:map(function(a1) -- Line: 73 -- types: a1: number
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