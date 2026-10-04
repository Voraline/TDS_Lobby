-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.ToastMessage
-- Decompile time: 2.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Sift = require(ReplicatedStorage.Packages.Sift)
local createElement = React.createElement
local memo = React.memo
local useEffect = React.useEffect
local useSpring = ReactFlow.useSpring
local useTween = ReactFlow.useTween
return memo(function(a1) -- Line: 22
    -- upvalues: useSpring (val), useTween (val), Sift (val), useEffect (val), createElement (val)
    local remove = a1.remove
    local destroy = a1.destroy
    local v1, u6 = useSpring({speed = 20, damper = 1, start = 1, target = 1})
    local v2, u15 = useTween({
        start = 1,
        target = 0,
        info = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    })
    local merge = Sift.Dictionary.merge
    local v3 = {RichText = true, TextScaled = true, BackgroundTransparency = 1}
    local color = a1.color or Color3.new(1, 1, 1)
    v3.TextColor3 = color
    v3.TextTransparency = v2
    v3.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    v3.Text = a1.text
    v3.AutomaticSize = Enum.AutomaticSize.X
    v3.Size = UDim2.fromScale(0.25, 1)
    local v4 = merge(v3, a1.native or {})
    local v5 = {remove}
    useEffect(function() -- Line: 55 -- upvalues: remove (val), u15 (val), u6 (val), destroy (val)
        if not remove then
            u15({target = 0})
            return
        end
        u6({target = 0})
        u15({target = 1})
        if destroy then
            task.delay(0.5, destroy)
        end
    end, v5)
    return createElement("TextLabel", v4, {
        UIStroke = createElement("UIStroke", {Thickness = 3, Transparency = 0.5, Color = Color3.fromRGB(125, 125, 125)}),
        Scale = createElement("UIScale", {Scale = v1}),
    })
end)