-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.XmasTree
-- Decompile time: 0.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Children = Create.Children
return {
    DesiredType = "Word",
    render = function(a1) -- Line: 11 -- upvalues: Create (val), Children (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        local v2 = a1.Stroke == true
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(37, 111, 0)
            if not v2 then
                Create("UIStroke", {
                    Name = "UIStroke",
                    Thickness = 4,
                    Transparency = 0.84,
                    Color = Color3.fromRGB(2, 98, 0),
                    Parent = v,
                })
            end
        end
        if not v2 then
            a1.Stroke = true
        end
        if not a1.Background then
            local v3 = Create
            local v4 = {
                Name = "ImageLabel",
                Image = "rbxassetid://15381292749",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = v1.Position,
                Size = v1.Size,
                AnchorPoint = v1.AnchorPoint,
                ZIndex = -1,
                Parent = v1.Parent,
            }
            v4[Children] = {(Create("UICorner", {Name = "UICorner"}))}
            a1.Background = v3("ImageLabel", v4)
        end
        return true
    end,
}