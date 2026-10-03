-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.DropShadow
-- Decompile time: 0.34 ms

local React = require(game:GetService("ReplicatedStorage").Shared.UI.React)
require(((game:GetService("ReplicatedStorage")):WaitForChild("rbxts")):WaitForChild("RuntimeLib"))
return {
    DropShadow = function(a1) -- Line: 5 -- upvalues: React (val)
        return React.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://9239716855",
            ImageTransparency = 0.2,
            Size = a1.Size,
            Position = a1.Position,
            AnchorPoint = a1.AnchorPoint,
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(14, 14, 64, 24),
        })
    end,
}