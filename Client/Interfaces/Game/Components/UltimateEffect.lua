-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.UltimateEffect
-- Decompile time: 7.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
local useEffect = React.useEffect
return function(a1) -- Line: 10
    -- upvalues: ReactFlow (val), React (val), Maid (val), RunService (val), useEffect (val), createElement (val)
    local v1, u9 = ReactFlow.useTween({start = -1, target = -1, info = TweenInfo.new(1, Enum.EasingStyle.Linear)})
    local v2, u14 = React.useBinding(23)
    local SweepColor = a1.SweepColor or a1.Color
    local useEffect_2 = React.useEffect
    local v3 = {a1.Rotation}
    useEffect_2(function() -- Line: 27 -- upvalues: Maid (upval), a1 (val), RunService (upval), u14 (val)
        local u2 = Maid.new()
        local u3 = 23
        if a1.Rotation then
            u2:Mark((RunService.RenderStepped:Connect(function(a1) -- Line: 32 -- upvalues: u3 (ref), u14 (upval)
                u3 = (u3 + a1 * 60) % 360
                u14(u3)
            end)))
        end
        return function() -- Line: 38 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, v3)
    useEffect(function() -- Line: 43 -- upvalues: u9 (val)
        local u2 = task.spawn(function() -- Line: 44 -- upvalues: u9 (upval)
            while true do
                u9({target = -1, info = TweenInfo.new(0)})
                task.delay(0, function() -- Line: 47 -- upvalues: u9 (upval)
                    u9({target = 1, info = TweenInfo.new(1, Enum.EasingStyle.Linear)})
                end)
                task.wait(2)
            end
        end)
        return function() -- Line: 54 -- upvalues: u2 (val)
            task.cancel(u2)
        end
    end, {})
    v3 = {
        BackgroundTransparency = 1,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local v4 = {
        iGradient = createElement("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, a1.Color or Color3.fromRGB(255, 69, 174)),
                (ColorSequenceKeypoint.new(1, a1.Color or Color3.fromRGB(255, 52, 96))),
            }),
            Rotation = v2,
        }),
    }
    local v5 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local v6 = {
        label = createElement("ImageLabel", {
            Image = "rbxassetid://18536350728",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = -3,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 25, 1, 25),
        }, {
            iGradient1 = createElement("UIGradient", {
                Rotation = 23,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, SweepColor or Color3.fromRGB(255, 94, 228)),
                    ColorSequenceKeypoint.new(0.474, SweepColor or Color3.fromRGB(255, 100, 214)),
                    (ColorSequenceKeypoint.new(1, SweepColor or Color3.fromRGB(255, 106, 198))),
                }),
                Offset = v1:map(function(a1) -- Line: 107
                    return Vector2.new(a1, 0)
                end),
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.202, 1),
                    NumberSequenceKeypoint.new(0.48, 0),
                    NumberSequenceKeypoint.new(0.505, 0),
                    NumberSequenceKeypoint.new(0.527, 0),
                    NumberSequenceKeypoint.new(0.798, 1),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        }),
    }
    local v7 = false
    if a1.NoBorder ~= true then
        v7 = createElement("UIStroke", {Color = Color3.fromRGB(255, 255, 255), Thickness = a1.strokeThickness or 4}, {
            iGradient2 = createElement("UIGradient", {
                Offset = Vector2.new(-0.2, 0),
                Rotation = v2,
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.202, 1),
                    NumberSequenceKeypoint.new(0.48, 0),
                    NumberSequenceKeypoint.new(0.505, 0),
                    NumberSequenceKeypoint.new(0.527, 0),
                    NumberSequenceKeypoint.new(0.798, 1),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        })
    end
    v6.iStroke = v7
    v4.frame = createElement("Frame", v5, v6, a1.children)
    return createElement("Frame", v3, v4, a1.children)
end