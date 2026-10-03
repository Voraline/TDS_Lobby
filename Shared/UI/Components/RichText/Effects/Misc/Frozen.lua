-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Frozen
-- Decompile time: 1.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Children = Create.Children
return {
    DesiredType = "Word",
    Particle = "Frozen",
    render = function(a1, a2) -- Line: 12
        -- upvalues: Create (val), Children (val), TweenService (val)
        local v1, v2
        local v3 = a1.container:Get()
        if v3 == a1.root then
            v3 = a1.labels:Get()[1]
        end
        local v4 = a1.Stroke == true
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(185, 243, 255)
            if not v4 then
                Create("UIStroke", {
                    Name = "UIStroke",
                    Thickness = 4,
                    Transparency = 0.84,
                    Color = Color3.fromRGB(185, 243, 255),
                    Parent = v,
                })
            end
        end
        if not v4 then
            a1.Stroke = true
        end
        if not a1.Background then
            v1 = Create
            v2 = {
                Name = "ImageLabel",
                Image = "rbxassetid://9039076279",
                ImageColor3 = Color3.fromRGB(230, 235, 255),
                ImageTransparency = 0.68,
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(0, -10, 0.5, 0),
                Size = UDim2.new(1, 20, 0.8, 0),
                ZIndex = -1,
                Parent = v3,
            }
            v2[Children] = {(Create("UICorner", {Name = "UICorner"}))}
            a1.Background = v1("ImageLabel", v2)
        end
        if not a1.Shimmer then
            v1 = Create
            v2 = {
                Name = "Shimmer",
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(0, -10, 0.5, 0),
                Size = UDim2.new(1, 20, 0.8, 0),
                ZIndex = 3,
                Parent = v3,
            }
            v2[Children] = {(Create("UICorner", {Name = "UICorner"}))}
            a1.Shimmer = v1("Frame", v2)
            a1.ShimmerGradient = Create("UIGradient", {
                Name = "UIGradient",
                Rotation = 45,
                Offset = Vector2.new(-0.8, 0),
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.302, 1),
                    NumberSequenceKeypoint.new(0.419, 0.5),
                    NumberSequenceKeypoint.new(0.502, 0.512),
                    NumberSequenceKeypoint.new(0.592, 0.5),
                    NumberSequenceKeypoint.new(0.7, 1),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
                Parent = a1.Shimmer,
            })
        end
        if not a1.Elapsed then
            a1.Elapsed = 0
        end
        if 2 < a1.Elapsed then
            a1.Elapsed = 0
            a1.ShimmerGradient.Offset = Vector2.new(0.8, 0)
            TweenService:Create(a1.ShimmerGradient, TweenInfo.new(1), {Offset = Vector2.new(-0.8, 0)}):Play()
        end
        a1.Elapsed = a1.Elapsed + math.min(a2, 0.016666666666666666)
    end,
}