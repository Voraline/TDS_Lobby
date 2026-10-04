-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.TVStatic
-- Decompile time: 2.47 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local TVStatic = require(ReplicatedStorage.Client.Interfaces.Stores.Game.TVStatic)
local createElement = React.createElement

local function render(a1) -- Line: 10 -- upvalues: ReactCharm (val), TVStatic (val), React (val), createElement (val)
    local u5 = ReactCharm.useSignalState(TVStatic.getState)
    local v1 = {u5}
    React.useEffect(function() -- Line: 13 -- upvalues: u5 (val), a1 (val)
        if u5.enabled then
            a1.setTransparency({target = 0.8})
            return
        end
        a1.setTransparency({target = 1})
    end, v1)
    if not u5.enabled then
        return nil
    end
    return createElement("VideoFrame", {
        Looped = true,
        Playing = true,
        Video = "rbxassetid://5608411652",
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        uIGradient = createElement("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(179, 26, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(179, 26, 255))),
            }),
            Transparency = a1.tranpsarency:map(function(a1) -- Line: 42
                return NumberSequence.new({
                    NumberSequenceKeypoint.new(0, a1),
                    (NumberSequenceKeypoint.new(1, a1)),
                })
            end),
        }),
    })
end

return function(a1) -- Line: 52 -- upvalues: ReactFlow (val), createElement (val), render (val)
    local v1, v2 = ReactFlow.useTween({target = 1, start = 1, info = TweenInfo.new(0.5)})
    a1.setDisplayOrder(-999)
    a1.setIgnoreGuiInset(true)
    return createElement(render, {tranpsarency = v1, setTransparency = v2})
end